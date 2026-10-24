# 河海大学硕士论文：摘要与三级目录初稿

## 1. 本包提供什么

题目暂沿用中期汇报：**异构CAD形变特征转换技术研究与模型转换实现**。

正文框架为7章、39个二级标题、94个三级标题（不含参考文献与附录）。已填入中文摘要、英文摘要及关键词，并在各节放入可关闭的写作提示。前置目录自动显示到 `1.1.1`，编号与PDF书签由LaTeX生成。

研究范围为草图、基准面、拉伸、旋转和扫掠。拉伸、旋转、扫掠是核心成形特征，草图与基准面为支撑；轴、点、边、面仅在相关引用中讨论。其他工程特征不进入核心论证。

**这是写作初稿，不是完成的学位论文。** 相关工作待补正式文献，实验章是实验组织框架，不代表已执行全部路线。摘要没有编造成功率、误差、耗时等结果。本人信息与学位类别需核定。

## 2. 快速编译

需要含中文支持的TeX发行版、XeLaTeX和latexmk。打开本目录的终端：

```sh
latexmk -xelatex -interaction=nonstopmode -file-line-error -halt-on-error main.tex
```

Windows也可运行 `build.cmd`；Linux/macOS可运行 `bash build.sh`。输出是 `main.pdf`。

不使用latexmk时，可运行三次：

```sh
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
xelatex -interaction=nonstopmode -halt-on-error main.tex
```

文件均为UTF-8。当前未启用正式文献库，不需要运行BibTeX。

## 3. 主要文件

| 路径 | 用途 |
|---|---|
| `main.tex` | 主编译入口，依次载入摘要、目录、七章及后置部分。 |
| `config/metadata.tex` | 题目、姓名、学号、导师、专业、日期等信息。 |
| `config/settings.tex` | 三级目录、写作提示与草稿布局开关。 |
| `chapters/abstract.tex` | 中英文摘要和关键词。 |
| `chapters/chapter1.tex`—`chapter7.tex` | 全部三级标题和写作提示。 |
| `chapters/appendices.tex` | 参数覆盖表、测试记录、结构与流程三个附录。 |
| `reference/references.bib` | 待填写的真实文献库，当前无条目。 |
| `三级目录与中英文摘要.md` | 不依赖LaTeX的完整目录和摘要。 |
| `notes/章节写作指南.md` | 按节解释研究内容、所需证据与边界。 |
| `notes/资料依据与章节映射.md` | 说明哪些来自材料，哪些是本次拟定安排。 |
| `notes/提交前检查表.md` | 待核对信息、文献、实验与格式。 |
| `TEMPLATE_CHANGES.md` | 模板来源、适配说明及原模板合并方法。 |

## 4. 学位类型与个人信息

根据中期汇报的“电子信息”，`main.tex` **暂设** `professionalmaster`。这不等于已经确认全日制/非全日制及正式学位名称。需核定后修改主入口两个分支中的选项；原模板支持 `academicmaster`、`professionalmaster`、`nonfulltimemaster` 等。

本人姓名、学号、导师、学院、分类号、保密状态、提交与答辩日期均保留待填。未沿用原模板的示例人名、博士信息、水利学专业或示例成果。

## 5. 草稿与定稿切换

`config/settings.tex`：

```tex
\outlineguidancetrue   % 显示写作提示；改为 false 即隐藏
\draftlayouttrue       % 提纲预览连续起章，缩小标题间空白
\fullfrontmatterfalse  % 不输出全套正式封面与授权声明
```

正文完成后，删除或隐藏提示，把 `draftlayout` 改为 `false`，恢复模板的双面奇数页起章与标题间距。正式封面仅在信息核定后启用 `fullfrontmatter`。它不是当前预览的已核验送审版式。

当前预览使用通用排版封面，不含手写签名。未伪造签署的原创性声明。

## 6. 模板关系与字体

本包依据用户指定的 `caowenhan/hhuthesis` **v2.0.0** 编写，固定源码提交为 `7251ec6b0b35c2281e4f832bcf3e588cc76fa2f4`。仓库提供硕士选项、摘要环境、封面命令、正文和目录结构。

由于本次未能将整个原仓库压缩包直接下载到编译环境，交付的独立可编译包使用明确重命名的 **`hhuthesis-cad.cls` 适配版**：依据已读取的原类文件整理所需定义，保留主要页面与标题格式，并增加字体回退。**它不是未经改动的原仓库完整镜像，也不是学校官方模板。** 具体改动见 `TEMPLATE_CHANGES.md`。

`main.tex` 会优先寻找原版 `hhuthesis.cls`：将本包的内容文件并入已下载的完整原模板后，主入口可直接调用原类；原仓库的其他文件不要删除。摘要使用原模板的 `abstract`、`enabstract`、`keywords`、`enkeywords` 接口，正文使用标准 `chapter`、`section`、`subsection`，便于移植。

独立包优先使用Times New Roman/Arial/Courier New；缺失时使用已安装的Tinos/Arimo/Cousine或Latin Modern。中文由ctex按环境选择，在本次预览中为Fandol。**没有附带任何字体文件。** 正式提交应在合规字体环境中重新编译核对。

原仓库声明依据2020年发布的格式规定，且未经学校相关部门审核授权。实际提交仍以本人学院及当届学位论文要求为准；本任务未确认2026/2027届的最新学校格式要求。

## 7. 摘要与实验的使用边界

摘要已经写到研究对象、方法、公共模型、三系统原型和验证安排。因缺少当前统一版本的正式实验数据，没有使用“实验表明全部正确”“完全无损”“显著提高”等结论。完成实验后，应加入有适用范围的主要结果，并同步修改英文摘要与第七章。

“同系统基线”指在同一CAD内完成读取与重建；“跨系统路线”指A到B。“往返转换”只有在实际执行A到B再到A时才使用。目标原生模型直接修改后的再生，不能由重新转换源模型替代。

## 8. 建议的写作顺序

先写第二章差异调查与第三章结构设计，再写第四章算法和第五章系统；按第六章补齐可复现实验后，收敛第一章研究定位、第七章结论以及中英文摘要。正式创新性需要文献对照与实验支撑。
