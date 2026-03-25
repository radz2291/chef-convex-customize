import type { Tool } from 'ai';
import { z } from 'zod';

export const createFileToolDescription = `
Create a new file with the specified content. If the file already exists, it will be completely overwritten.
Use this tool when creating a new file or completely replacing an existing one with new content.

IMPORTANT: This tool will automatically create any missing parent directories for you.
`;

export const createFileToolParameters = z.object({
    path: z.string().describe('The absolute path to the file to create.'),
    content: z.string().describe('The full content to write to the file. This must be the COMPLETE file content.'),
});

export const createFileTool: Tool = {
    description: createFileToolDescription,
    parameters: createFileToolParameters,
};
