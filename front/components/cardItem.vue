<script setup lang="ts">
type Memo = {
  id: number;
  title: string;
  content: string;
  created_at: Date;
  updated_at: Date;
};
defineProps<{
  data: Memo;
  destroyMemo: (memo: Memo) => Promise<void>;
  showMemo: (id: number) => Promise<void>;
}>();
</script>

<template>
  <div
    class="flex flex-col bg-white border shadow-sm rounded-xl p-4 md:p-5 dark:bg-gray-800 dark:border-gray-700 dark:shadow-slate-700/[.7]"
  >
    <h3 class="text-lg font-bold text-gray-800 dark:text-white">
      {{ data.title }}
    </h3>
    <p class="mt-2 text-gray-800 dark:text-gray-400">
      {{ data.content }}
    </p>
    <div class="grid grid-cols-2 mt-1 gap-2">
      <button
        type="button"
        class="py-3 px-4 gap-2 rounded-md bg-red-100 border border-transparent font-semibold text-red-500 hover:text-white hover:bg-red-100 focus:outline-none focus:ring-2 ring-offset-white focus:ring-red-500 focus:ring-offset-2 transition-all text-sm dark:focus:ring-offset-gray-800"
        @click="destroyMemo(data)"
      >
        削除
      </button>
      <button
        type="button"
        class="py-3 px-4 gap-2 rounded-md bg-yellow-100 border border-transparent font-semibold text-yellow-500 hover:text-white hover:bg-yellow-100 focus:outline-none focus:ring-2 ring-offset-white focus:ring-yellow-500 focus:ring-offset-2 transition-all text-sm dark:focus:ring-offset-gray-800"
        data-hs-overlay="#hs-vertically-centered-modal"
        @click="showMemo(data.id)"
      >
        編集
      </button>
    </div>
  </div>
</template>
