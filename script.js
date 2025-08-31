class App {
  constructor() {
    this.hydrateCopyright()
  }

  hydrateCopyright() {
    const copyrightEl = document.querySelector('footer small')
    const currentYear = new Date().getFullYear()
    const copyrightContent = `&copy; ${currentYear} Dondon Developments 🌲`

    copyrightEl.innerHTML = copyrightContent
  }
}