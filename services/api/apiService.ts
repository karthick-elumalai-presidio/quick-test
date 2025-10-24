// apiService.ts
import axios, { AxiosInstance } from 'axios';
import { API_BASE_URL } from '@/services/api/apiConfig';

/**
 * API Client for making HTTP requests
 * Pre-configured axios instance that can be used directly in queries
 */
export const apiClient: AxiosInstance = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
  timeout: 30000, // 30 seconds
});

export default apiClient;
