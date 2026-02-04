# 前端代码评估报告技能（Code Review Report）

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Shell Script](https://img.shields.io/badge/shell-bash-green.svg)](scripts/analyze-git.sh)

一个用于生成前端代码 Code Review 分析报告和人工/AI Coding 开发效率评估的技能工具。

## 📖 简介

本技能提供了一套完整的代码评估解决方案，可以帮助开发团队：

- 📊 自动收集和分析 Git 代码提交数据
- 🤖 评估 AI 辅助开发的代码质量和占比
- 📈 对比人工开发与 AI Coding 的效率差异
- 🔍 深度检查代码质量（类型系统、性能、安全等）
- 📋 生成结构化的代码评估报告

## 🎯 适用场景

当您需要以下功能时，可以触发本技能：

- 代码评估、Code Review、代码质量报告
- 两周/一周/本周的代码分析
- 开发效率评估、AI coding 评估、工时对比
- 口语化请求，如"帮我看看代码"、"分析下代码"、"代码写得怎么样"

## 📁 项目结构

```
code-review-report/
├── assets/
│   └── report-template.md        # 报告输出模板
├── references/
│   ├── code-review.md            # Code Review 参考文档
│   ├── development-estimate-template.md  # 开发评估模板
│   ├── efficiency-tracking-guide.md      # 效率跟踪指南
│   └── estimate-process-guide.md         # 评估流程指南
├── scripts/
│   └── analyze-git.sh            # Git 数据统计脚本
├── EXAMPLES.md                   # 完整报告示例
├── REFERENCE.md                  # 检查清单、KPI定义、评分标准
├── SKILL.md                      # 技能说明文档
└── README.md                     # 本文件
```

## 🚀 快速开始

### 1. 运行 Git 数据分析

使用提供的脚本自动收集 Git 提交数据：

```bash
# 分析最近两周的数据（默认）
./scripts/analyze-git.sh

# 指定时间范围
./scripts/analyze-git.sh "1 week ago" "now"
./scripts/analyze-git.sh "2026-01-20" "2026-02-03"
```

脚本会输出：
- 提交次数统计（总提交、AI标记提交）
- 代码变更统计（新增/删除行数）
- 涉及文件统计和类型分布
- AI 代码标记统计
- 提交者和日期趋势分析

### 2. AI 代码标记规范

为了准确统计 AI 生成的代码，请遵循以下标记规范：

**代码注释标记：**

```javascript
// @ai-generated-start
// 生成时间: 2026-02-03
// 生成工具: GitHub Copilot/Cursor/Qoder
// 人工审核状态: [已审核/待审核]
// @ai-generated-end

function exampleFunction() {
  // AI 生成的代码
}
```

**Git 提交标记：**

```bash
git commit -m "feat: 添加用户列表功能 [AI]"
git commit -m "fix: 修复分页bug [AI]"
git commit -m "refactor: 优化组件结构 [AI-assisted]"
```

### 3. 生成评估报告

参考 [report-template.md](assets/report-template.md) 模板生成报告，报告包含以下模块：

| 模块 | 内容 |
|------|------|
| **代码质量总览** | 评分(/100)、TS覆盖率、提交/变更统计、AI代码占比 |
| **AI专项分析** | AI代码分布、质量等级、门禁检查 |
| **深度检查** | 类型系统、组件设计、性能、样式、安全 |
| **功能模块评估表** | 人工 vs AI Coding 工时对比、效率提升比 |
| **改进建议** | P0/P1/P2 优先级问题、改进路线图 |

## 📊 核心指标（KPIs）

| 指标名称 | 计算公式 | 目标值 |
|---------|----------|--------|
| **效率提升比** | (人工工时 - 实际工时) / 人工工时 × 100% | > 30% |
| **评估准确率** | 1 - \|预估 - 实际\| / 预估 × 100% | > 80% |
| **AI代码占比** | AI代码行数 / 总代码行数 × 100% | 40-60% |
| **AI代码合格率** | (AI代码 - Bug代码) / AI代码 × 100% | > 95% |
| **AI标记合规率** | 标记合规项目 / 总项目 × 100% | 100% |

## 📋 代码质量检查清单

### 五大检查维度

1. **类型系统与架构**（权重 25%）
   - TypeScript 类型完整性
   - Any 类型使用情况
   - 公共类型定义集中化
   - 接口契约与后端对齐

2. **组件设计与工程化**（权重 25%）
   - 单一职责原则
   - AI 代码设计一致性
   - 自定义 Hooks 质量
   - 模块耦合度

3. **性能优化指标**（权重 20%）
   - React.memo 使用合理性
   - useMemo/useCallback 使用
   - 虚拟滚动应用
   - 代码分割策略

4. **样式工程化**（权重 15%）
   - CSS 模块化
   - 样式变量一致性
   - 响应式布局质量

5. **安全与依赖管理**（权重 15%）
   - XSS 防护
   - 第三方依赖安全版本
   - AI 生成代码安全扫描

详细的检查清单和评分标准请参考 [REFERENCE.md](REFERENCE.md)。

## 💡 使用示例

```
# 示例 1：生成两周报告
请生成两周内的代码评估报告

# 示例 2：指定日期范围
生成 2026-01-20 至 2026-02-03 的 code review 报告

# 示例 3：针对特定目录
分析 src/pages 目录的代码质量

# 示例 4：口语化请求
帮我看看最近的代码写得怎么样
```

完整的报告示例请查看 [EXAMPLES.md](EXAMPLES.md)。

## 📚 参考文档

- [SKILL.md](SKILL.md) - 技能执行流程和核心步骤
- [REFERENCE.md](REFERENCE.md) - 检查清单、KPI定义、复杂度评估标准
- [EXAMPLES.md](EXAMPLES.md) - 完整的用户管理模块评估报告示例
- [references/](references/) - 项目原始参考文档集合

## 🛠️ 环境要求

- **操作系统**：macOS / Linux / Windows (需要 bash 环境)
- **必需工具**：Git
- **推荐工具**：
  - Node.js 项目：支持 TypeScript 分析
  - ESLint：用于安全规则检测

## 📈 效率提升参考值

| 任务类型 | 典型效率提升范围 | AI 适用度 |
|---------|----------------|----------|
| CRUD 业务代码 | 50-70% | 高 |
| 表单组件开发 | 40-60% | 高 |
| 数据转换处理 | 50-70% | 高 |
| 单元测试编写 | 40-60% | 高 |
| API 接口对接 | 40-60% | 高 |
| 复杂业务逻辑 | 10-30% | 低 |
| 架构设计决策 | 0-10% | 低 |

## 🎯 问题优先级定义

### P0 - 紧急处理（本周内）
- 安全漏洞
- 严重性能问题
- 阻塞性 Bug
- 类型安全严重缺失

### P1 - 短期优化（本月完成）
- any 类型过多
- 组件设计不合理
- 代码质量评分 < 70
- AI 代码标记不合规

### P2 - 中期目标（本季度）
- TypeScript 覆盖率提升
- 性能优化
- 代码审查通过率提升
- 团队整体效率提升

## 📝 质量评分等级

| 等级 | 分数范围 | 说明 |
|-----|---------|------|
| A | 90-100 | 优秀，可作为最佳实践 |
| B | 80-89 | 良好，小幅改进 |
| C | 70-79 | 及格，需要改进 |
| D | 60-69 | 较差，需要重点关注 |
| F | < 60 | 不及格，需要立即整改 |

## 🤝 贡献指南

欢迎提交 Issue 和 Pull Request 来改进这个技能工具。

## 📄 许可证

本项目采用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

## ✨ 特色功能

- ✅ 自动化 Git 数据收集
- ✅ AI 代码识别和统计
- ✅ 多维度代码质量评估
- ✅ 人工 vs AI 效率对比
- ✅ 结构化报告模板
- ✅ 完整的评分体系
- ✅ 问题分级和改进建议

## 📞 联系方式

如有问题或建议，欢迎通过以下方式联系：

- 提交 GitHub Issue
- 发送邮件至项目维护者

---

**最后更新时间**：2026-02-04
