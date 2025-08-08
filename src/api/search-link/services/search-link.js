'use strict';

/**
 * search-link service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::search-link.search-link');
