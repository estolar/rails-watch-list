import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.addEventListener('mouseover', () => {
      this.element.classList.add('shadow-lg');
    });

    this.element.addEventListener('mouseout', () => {
      this.element.classList.remove('shadow-lg');
    });
  }
}
