'use strict';

/**
 * asked-question service
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::asked-question.asked-question');
