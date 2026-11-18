// ==========================================================
// Task & Team Tracker — Day 19
// fetch() + JSON: load sample tasks from tasks.json.
// Modal opened/closed with Bootstrap's JS API
// (.show() / .hide() instead of data-bs-* attributes).
// ==========================================================

// Tasks start empty; they are loaded asynchronously from tasks.json
let tasks = [];

let nextId = 4; // auto-increment id for new tasks
let editingId = null; // id of the task being edited (null = adding new)

// Elements we work with
const tbody = document.getElementById("taskTableBody");
const noResults = document.getElementById("noResults");
const filterStatus = document.getElementById("filterStatus");
const searchText = document.getElementById("searchText");
const taskModal = new bootstrap.Modal(document.getElementById("taskModal"));
const taskNameInput = document.getElementById("taskName");
const assignedToInput = document.getElementById("assignedTo");
const taskStatusInput = document.getElementById("taskStatus");
const dueDateInput = document.getElementById("dueDate");
const taskModalLabel = document.getElementById("taskModalLabel");

// ---------- Helpers ----------

// Turn a status into a Bootstrap badge color
function badgeClass(status) {
  if (status === "Completed") return "badge bg-success";
  if (status === "In Progress") return "badge bg-warning text-dark";
  return "badge bg-secondary"; // Pending
}

// Format "2026-11-10" -> "10 Nov 2026"
function formatDate(dateStr) {
  if (!dateStr) return "—";
  const d = new Date(dateStr + "T00:00:00");
  return d.toLocaleDateString("en-GB", {
    day: "2-digit",
    month: "short",
    year: "numeric",
  });
}

// Apply status filter + search text to the tasks array
function getFilteredTasks() {
  const status = filterStatus.value; // "" = all
  const query = searchText.value.trim().toLowerCase();

  return tasks.filter(function (task) {
    const statusOk = !status || task.status === status;
    const textOk =
      !query ||
      task.name.toLowerCase().includes(query) ||
      task.assignedTo.toLowerCase().includes(query);
    return statusOk && textOk;
  });
}

// ---------- Rendering ----------

// Draw the table from the tasks array (after filtering)
function renderTasks() {
  tbody.innerHTML = "";
  const visibleTasks = getFilteredTasks();

  noResults.classList.toggle("d-none", visibleTasks.length > 0);

  visibleTasks.forEach(function (task) {
    const row = document.createElement("tr");

    row.innerHTML = `
      <th scope="row">${task.id}</th>
      <td class="fw-semibold"></td>
      <td></td>
      <td><span class="${badgeClass(task.status)}">${task.status}</span></td>
      <td>${formatDate(task.dueDate)}</td>
      <td class="text-end">
        <button class="btn btn-sm btn-outline-primary" data-action="edit">Edit</button>
        <button class="btn btn-sm btn-outline-danger" data-action="delete">Delete</button>
      </td>
    `;

    // Fill text safely (avoids HTML injection from user input)
    row.querySelector("td.fw-semibold").textContent = task.name;
    row.children[2].textContent = task.assignedTo;

    // Wire up Edit / Delete buttons for this row
    row
      .querySelector('[data-action="edit"]')
      .addEventListener("click", function () {
        openEditTaskModal(task);
      });
    row
      .querySelector('[data-action="delete"]')
      .addEventListener("click", function () {
        deleteTask(task.id);
      });

    tbody.appendChild(row);
  });
}

// ---------- Modal helpers ----------

// "+ Add New Task" button
function openNewTaskModal() {
  editingId = null;
  taskModalLabel.textContent = "Create New Task";
  taskNameInput.value = "";
  assignedToInput.value = "";
  taskStatusInput.value = "Pending";
  dueDateInput.value = "";
  taskNameInput.focus();
  taskModal.show();
}

// "Edit" button on a row
function openEditTaskModal(task) {
  editingId = task.id;
  taskModalLabel.textContent = "Edit Task";
  taskNameInput.value = task.name;
  assignedToInput.value = task.assignedTo;
  taskStatusInput.value = task.status;
  dueDateInput.value = task.dueDate;
  taskModal.show();
}

// Close the modal via Bootstrap's JS API (replaces data-bs-dismiss)
function closeTaskModal() {
  taskModal.hide();
}

// ---------- Save / Delete ----------

// "Save Task" button in the modal
function saveTask() {
  const name = taskNameInput.value.trim();
  const assignedTo = assignedToInput.value.trim();
  const status = taskStatusInput.value;
  const dueDate = dueDateInput.value;

  if (!name) {
    alert("Please enter a task name.");
    return;
  }

  if (editingId === null) {
    // Add a brand-new task to the array
    tasks.push({ id: nextId++, name, assignedTo, status, dueDate });
  } else {
    // Update the existing task in the array
    const task = tasks.find(function (t) {
      return t.id === editingId;
    });
    if (task) {
      task.name = name;
      task.assignedTo = assignedTo;
      task.status = status;
      task.dueDate = dueDate;
    }
  }

  renderTasks();
  taskModal.hide();
}

function deleteTask(id) {
  if (!confirm("Delete this task?")) return;
  tasks = tasks.filter(function (t) {
    return t.id !== id;
  });
  renderTasks();
}

// ---------- Load tasks from tasks.json (fetch + JSON) ----------

async function loadTasks() {
  try {
    // fetch() is blocked on file:// pages — must be served over http(s)
    if (location.protocol === "file:") {
      throw new Error(
        'You opened this page with file:// — fetch() is blocked there. ' +
        "Serve the folder instead, e.g. run `npx serve 2026-11-13-day-19` " +
        "(or use VS Code Live Server) and open http://localhost:3000/tasklist.html"
      );
    }

    const response = await fetch("tasks.json");
    if (!response.ok) {
      throw new Error("HTTP " + response.status + " while loading tasks.json");
    }
    const data = await response.json(); // parse the JSON text

    tasks = data; // fill the JS array from the fetched JSON
    nextId = tasks.reduce(function (max, t) {
      return Math.max(max, t.id);
    }, 0) + 1; // continue ids after the loaded ones

    renderTasks();
  } catch (error) {
    console.error("Failed to load tasks:", error);
    tbody.innerHTML =
      '<tr><td colspan="6" class="text-center text-danger py-4">' +
      "Could not load tasks.json — " + error.message +
      "</td></tr>";
  }
}

// Initial load
// NOTE: fetch() only works over http(s) — open via a local server
// (e.g. `npx serve` or VS Code Live Server), not file://
document.addEventListener("DOMContentLoaded", loadTasks);
