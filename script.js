// Scroll to top functionality
window.onscroll = function() {
    let button = document.getElementById("topBtn");
    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        button.style.display = "block";
    } else {
        button.style.display = "none";
    }
};

function scrollToTop() {
    window.scrollTo({top: 0, behavior: 'smooth'});
}
