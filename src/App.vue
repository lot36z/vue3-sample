<style>
.hello {
  color: red; /*cssが効いている事がわかりやすくする為に赤にする*/
}
#overlay {
  /*　要素を重ねた時の順番　*/
  z-index: 1;

  /*　画面全体を覆う設定　*/
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.5);

  /*　画面の中央に要素を表示させる設定　*/
  display: flex;
  align-items: center;
  justify-content: center;
}
#content {
  z-index: 2;
  width: 50%;
  padding: 1em;
  background: #fff;
}
</style>

<template>
  <span class="hello">{{ helloText }}</span>
  <div id="app">
    <button @click="openModal">Click</button>
  </div>
  <Modal :showModal="showModal" @closeModal="closeModal">
    <template v-slot:header>Header</template>
    <template v-slot:default>Default</template>
    <template v-slot:footer
      ><p><button @click="closeModal">Footer</button></p></template
    >
  </Modal>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";
import Modal from "./component/Modal.vue";

export default defineComponent({
  name: "App",
  components: {
    Modal,
  },
  setup() {
    const showModal = ref<boolean>(false);
    const openModal = () => {
      showModal.value = true;
    };
    const closeModal = () => {
      alert("Modal closed");
      showModal.value = false;
    };
    return {
      helloText: "Hello World!",
      showModal,
      openModal,
      closeModal,
    };
  },
});
</script>