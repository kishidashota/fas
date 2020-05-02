export default {
  props: {
    value: {
      type: String,
      required: true,
    },
  },
  data() {
    return { 
      tags: [],
      prevValue: "",
      canEnter: false,
      draggingItem: null,
    }
  },
  methods: {
    propToData() {
      this.tags.length = 0
      this.prevValue = this.value.split(/,/)
      this.value.split(/,/).forEach((str) => this.add(str))
    },
    enter(target) {
      //日本語の確定で EnterキーのKeyupが発生するのを抑止
      if (!this.canEnter) return

      if (typeof target.value === "string" && target.value.trim() != "") {
        this.add(target.value.trim().replace(/,/, ""))
        target.value = ""
      }
      this.canEnter = false
    },
    remove(index) {
      this.tags.splice(index, 1);
    },
    add(str) {
      this.tags.push( { text: str, index: this.tags.length -1, over: false } )
      //array.splice(1, 0, 'A');
    },
    sort() {
      this.tags.sort((a, b) => {
        return a.index < b.index ? -1 :
          a.index > b.index ? 1 : 0;
      })
    }, 
    dragstart(item, e) {
      this.draggingItem = item
      e.target.style.opacity = 0.5
    },
    dragend(e) {
      e.target.style.opacity = 1;
      this.tags.forEach(n => { n.over = false })
    },
    dragenter(item) {
      item.over = true
    },
    dragover(item) {
      item.over = true
    },  
    dragleave(item) {
      item.over = false
    },
    drop(item, e) {
      const index = item.index
      this.tags.forEach(n => { if (n.index >= index) n.index++ })
      this.draggingItem.index = index
      this.sort()
      this.draggingItem = null
    }
  },
  watch: {
    value: function(newVal, oldVal) {
      if (this.tags.join(",") != newVal) {
        this.propToData()
      }
    }
  },
  mounted() {
    this.propToData()
  },
  updated() {
    let newVal = this.tags.map(tag => tag.text).join(",")
    if (!this.prevValue || this.prevValue != newVal) {
      this.$emit('input', newVal)
      this.prevValue = newVal
    }
  }
}