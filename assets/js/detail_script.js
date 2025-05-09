// Custom JavaScript for Dental Service website

document.addEventListener('DOMContentLoaded', function() {
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
        });
    });
});