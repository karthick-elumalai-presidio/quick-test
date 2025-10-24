const API_BASE_URL = process.env.EXPO_PUBLIC_API_BASE_URL;

if (!API_BASE_URL) {
  throw new Error('API_BASE_URL is not defined in environment variables');
}

export const API_ENDPOINTS = {
  LOGIN: '/account/index/login',
};

export { API_BASE_URL };
