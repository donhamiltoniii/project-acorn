class App {
  constructor() {
    console.log('constructor called')
    this.hydrateCopyright()
  }

  hydrateCopyright() {
    console.log('hydrateCopyright called')
    const copyrightEl = document.querySelector('footer small')
    const currentYear = new Date().getFullYear()
    const copyrightContent = `&copy; ${currentYear} Dondon Developments 🌲`

    copyrightEl.innerHTML = copyrightContent
  }
}