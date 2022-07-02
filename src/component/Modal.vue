<style scoped>
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
  <div id="overlay" v-show="showModal">
    <div id="content">
      <slot name="header"></slot>
      <slot name="default"></slot>
      <slot name="footer"
        ><p><button @click="closeModal">close</button></p></slot
      >
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";

export default defineComponent({
  name: "Modal",
  props: {
    showModal: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  setup(props, context) {
    const closeModal = () => {
      context.emit("closeModal");
    };
    return {
      closeModal,
    };
  },
});
</script>