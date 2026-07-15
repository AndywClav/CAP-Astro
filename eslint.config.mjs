import cds from '@sap/cds/eslint.config.mjs';
import cdsPlugin from '@sap/eslint-plugin-cds';
import eslintConfigPrettier from 'eslint-config-prettier';

export default [
  {
    ignores: ['gen/**', 'app/**'],
  },

  ...cds.recommended,
  cdsPlugin.configs.recommended,

  eslintConfigPrettier,
];
