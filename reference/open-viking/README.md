<div align="center">

<picture>
  <img alt="OpenViking" src="docs/images/banner.jpg" width="100%" height="auto">
</picture>

### OpenViking: The Context Database for AI Agents

English / [中文](README_CN.md)

<a href="https://www.openviking.ai">Website</a> · <a href="https://github.com/volcengine/OpenViking">GitHub</a> · <a href="https://github.com/volcengine/OpenViking/issues">Issues</a> · <a href="https://www.openviking.ai/docs">Docs</a>

[![][release-shield]][release-link]
[![][github-stars-shield]][github-stars-link]
[![][github-issues-shield]][github-issues-shield-link]
[![][github-contributors-shield]][github-contributors-link]
[![][license-shield]][license-shield-link]
[![][last-commit-shield]][last-commit-shield-link]

👋 Join our Community

📱 <a href="./docs/en/about/01-about-us.md#lark-group">Lark Group</a> · <a href="./docs/en/about/01-about-us.md#wechat-group">WeChat</a> · <a href="https://discord.com/invite/eHvx8E9XF3">Discord</a> · <a href="https://x.com/openvikingai">X</a>

<a href="https://trendshift.io/repositories/19668" target="_blank"><img src="https://trendshift.io/api/badge/repositories/19668" alt="volcengine%2FOpenViking | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>

</div>

---

## Overview

### Challenges in Agent Development

In the AI era, data is abundant, but high-quality context is hard to come by. When building AI Agents, developers often face these challenges:

- **Fragmented Context**: Memories are in code, resources are in vector databases, and skills are scattered, making them difficult to manage uniformly.
- **Surging Context Demand**: An Agent's long-running tasks produce context at every execution. Simple truncation or compression leads to information loss.
- **Poor Retrieval Effectiveness**: Traditional RAG uses flat storage, lacking a global view and making it difficult to understand the full context of information.
- **Unobservable Context**: The implicit retrieval chain of traditional RAG is like a black box, making it hard to debug when errors occur.
- **Limited Memory Iteration**: Current memory is just a record of user interactions, lacking Agent-related task memory.

### The OpenViking Solution

**OpenViking** is an open-source **Context Database** designed specifically for AI Agents.

We aim to define a minimalist context interaction paradigm for Agents, allowing developers to completely say goodbye to the hassle of context management. OpenViking abandons the fragmented vector storage model of traditional RAG and innovatively adopts a **"file system paradigm"** to unify the structured organization of memories, resources, and skills needed by Agents.

With OpenViking, developers can build an Agent's brain just like managing local files:

- **Filesystem Management Paradigm** → **Solves Fragmentation**: Unified context management of memories, resources, and skills based on a filesystem paradigm.
- **Tiered Context Loading** → **Reduces Token Consumption**: L0/L1/L2 three-tier structure, loaded on demand, significantly saving costs.
- **Directory Recursive Retrieval** → **Improves Retrieval Effect**: Supports native filesystem retrieval methods, combining directory positioning with semantic search to achieve recursive and precise context acquisition.
- **Visualized Retrieval Trajectory** → **Observable Context**: Supports visualization of directory retrieval trajectories, allowing users to clearly observe the root cause of issues and guide retrieval logic optimization.
- **Automatic Session Management** → **Context Self-Iteration**: Automatically compresses content, resource references, tool calls, etc., in conversations, extracting long-term memory, making the Agent smarter with use.

---

## Quick Start

### Prerequisites

Before starting with OpenViking, please ensure your environment meets the following requirements:

- **Python Version**: 3.10 or higher
- **Go Version**: 1.22 or higher (Required for building AGFS components)
- **C++ Compiler**: GCC 9+ or Clang 11+ (Required for building core extensions)
- **Operating System**: Linux, macOS, Windows
- **Network Connection**: A stable network connection is required (for downloading dependencies and accessing model services)

### 1. Installation

#### Python Package

```bash
pip install openviking --upgrade --force-reinstall
```

#### Rust CLI (Optional)

```bash
curl -fsSL https://raw.githubusercontent.com/volcengine/OpenViking/main/crates/ov_cli/install.sh | bash
```

Or build from source:

```bash
cargo install --git https://github.com/volcengine/OpenViking ov_cli
```

### 2. Model Preparation

OpenViking requires the following model capabilities:
- **VLM Model**: For image and content understanding
- **Embedding Model**: For vectorization and semantic retrieval

#### Supported VLM Providers

OpenViking supports three VLM providers:

| Provider | Description | Get API Key |
|----------|-------------|-------------|
| `volcengine` | Volcengine Doubao Models | [Volcengine Console](https://console.volcengine.com/ark/region:ark+cn-beijing/overview?briefPage=0&briefType=introduce&type=new&utm_content=OpenViking&utm_medium=devrel&utm_source=OWO&utm_term=OpenViking) |
| `openai` | OpenAI Official API | [OpenAI Platform](https://platform.openai.com) |
| `litellm` | Unified access to various third-party models (Anthropic, DeepSeek, Gemini, vLLM, Ollama, etc.) | See [LiteLLM Providers](https://docs.litellm.ai/docs/providers) |

> 💡 **Tip**:
> - `litellm` supports unified access to various models. The `model` field must follow the [LiteLLM format specification](https://docs.litellm.ai/docs/providers)
> - The system auto-detects common models (e.g., `claude-*`, `deepseek-*`, `gemini-*`, `hosted_vllm/*`, `ollama/*`, etc.). For other models, use the full prefix according to LiteLLM format

#### Provider-Specific Notes

<details>
<summary><b>Volcengine (Doubao)</b></summary>

Volcengine supports both model names and endpoint IDs. Using model names is recommended for simplicity:

```json
{
  "vlm": {
    "provider": "volcengine",
    "model": "doubao-seed-2-0-pro-260215",
    "api_key": "your-api-key",
    "api_base": "https://ark.cn-beijing.volces.com/api/v3"
  }
}
```

You can also use endpoint IDs (found in [Volcengine ARK Console](https://console.volcengine.com/ark/region:ark+cn-beijing/overview?briefPage=0&briefType=introduce&type=new&utm_content=OpenViking&utm_medium=devrel&utm_source=OWO&utm_term=OpenViking):

```json
{
  "vlm": {
    "provider": "volcengine",
    "model": "ep-20241220174930-xxxxx",
    "api_key": "your-api-key",
    "api_base": "https://ark.cn-beijing.volces.com/api/v3"
  }
}
```

</details>

<details>
<summary><b>OpenAI</b></summary>

Use OpenAI's official API:

```json
{
  "vlm": {
    "provider": "openai",
    "model": "gpt-4o",
    "api_key": "your-api-key",
    "api_base": "https://api.openai.com/v1"
  }
}
```

You can also use a custom OpenAI-compatible endpoint:

```json
{
  "vlm": {
    "provider": "openai",
    "model": "gpt-4o",
    "api_key": "your-api-key",
    "api_base": "https://your-custom-endpoint.com/v1"
  }
}
```

</details>

<details>
<summary><b>LiteLLM (Anthropic, DeepSeek, Gemini, Qwen, vLLM, Ollama, etc.)</b></summary>

LiteLLM provides unified access to various models. The `model` field should follow LiteLLM's naming convention. Here we use Claude and Qwen as examples:

**Anthropic:**

```json
{
  "vlm": {
    "provider": "litellm",
    "model": "claude-3-5-sonnet-20240620",
    "api_key": "your-anthropic-api-key"
  }
}
```

**Qwen (DashScope):**

```json
{
  "vlm": {
    "provider": "litellm",
    "model": "dashscope/qwen-turbo", // see https://docs.litellm.ai/docs/providers/dashscope for more details
    "api_key": "your-dashscope-api-key",
    "api_base": "https://dashscope.aliyuncs.com/compatible-mode/v1"
  }
}
```

> 💡 **Tip for Qwen**: 
> - For **China/Beijing** region, use `api_base`: `https://dashscope.aliyuncs.com/compatible-mode/v1`
> - For **International** region, use `api_bas