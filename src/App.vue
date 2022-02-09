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
  <div id="overlay" v-show="showModal">
    <div id="content">
      <p>これがモーダルウィンドウです。</p>
      <p><button @click="closeModal">close</button></p>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from "vue";

export default defineComponent({
  name: "App",
  setup() {
    const showModal = ref<boolean>(false);
    const openModal = () => {
      showModal.value = true;
    };
    const closeModal = () => {
      showModal.value = false;
    };
    return {
      helloText: "Hello World!",
      showModal,
      openModal,
      closeModal
    };
  },
});
</script>