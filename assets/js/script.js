// Custom JavaScript for Dental Service website

// Initialize Bootstrap components
document.addEventListener('DOMContentLoaded', function() {
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });

    // Tab functionality
    const tabButtons = document.querySelectorAll('.btn-tab');
    
    tabButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Remove active class from all buttons
            tabButtons.forEach(btn => {
                btn.classList.remove('active');
            });
            
            // Add active class to clicked button
            this.classList.add('active');
        });
    });
    
    // Time slot selection
    const timeButtons = document.querySelectorAll('.btn-outline-secondary');
    
    timeButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Toggle active class 
            timeButtons.forEach(btn => {
                btn.classList.remove('active');
            });
            this.classList.add('active');
        }
        );
    }
    );
    // Initialize Bootstrap tooltips
    const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    const tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });
    // Initialize Bootstrap popovers
    const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    const popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });
    // Initialize Bootstrap modals
    const modalTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="modal"]'));
    const modalList = modalTriggerList.map(function(modalTriggerEl) {
        return new bootstrap.Modal(modalTriggerEl);
    });
    // Initialize Bootstrap carousels
    const carouselElementList = [].slice.call(document.querySelectorAll('.carousel'));
    const carouselList = carouselElementList.map(function(carouselElement) {
        return new bootstrap.Carousel(carouselElement);
    });
    // Initialize Bootstrap dropdowns
    const dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'));
    const dropdownList = dropdownElementList.map(function(dropdownElement) {
        return new bootstrap.Dropdown(dropdownElement);
    });
    
});
