\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bjfuLabreport}[2020/01/09 A template for bjfu bachelor thesis]
\LoadClass[UTF8]{ctexart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%协议：MIT协议（http://opensource.org/licenses/MIT）
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%对于宏包的使用
%超链接
%自动识别标签所在类型，替换\ref 为\autoref
\RequirePackage[colorlinks,linkcolor=black]{hyperref}
%板式
\RequirePackage{geometry}
%图片
\RequirePackage{graphicx}
%图表标题
\RequirePackage{bicaption}
%子图
\RequirePackage{subcaption}
%页眉页脚控制
\RequirePackage{fancyhdr}
%非汉字字体设置
\RequirePackage{fontspec}
%控制参考文献格式
\RequirePackage[square,super, comma, sort&compress, numbers]{natbib}
%计数器控制
\RequirePackage{amsmath}
%表格控制
\RequirePackage{multirow} 
\RequirePackage{array}
% use xifthen
\RequirePackage{xifthen}
%插入代码
\RequirePackage{listings}
%设置列表格式
\RequirePackage{enumitem}
%调列表的条目间距
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt,itemindent=\parindent,listparindent=\parindent}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt,itemindent=\parindent,listparindent=\parindent}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt,,itemindent=\parindent,listparindent=\parindent}
%三线表
\RequirePackage{booktabs}

%增加浮动体参数H
\RequirePackage{float}
%标准单位
\RequirePackage{siunitx}
%化学式和方程式
\RequirePackage{mhchem}

%论文一律编排并打印在A4幅面白纸上
%scale = 0.8
\geometry{a4paper,left=20mm,right=20mm,top=25mm,bottom=25mm}

%论文行间距为1.5倍（可能需要用\selectfont）
\linespread{1.4}

%页眉页脚开启
\pagestyle{fancy}
%页眉字号字体为小五号宋体，内容为“****实验报告”
\chead{\zihao{-5}\CJKfamily{zhsong}\lecturenameString 实验报告 } 
%页眉只有中间有内容，左右为空白
\lhead{} 
\rhead{}
%页眉下边的横线宽度：事实上论文规范并没有对此做出规定，但是我们选择遵循常理去除横线。
\renewcommand{\headrulewidth}{0pt}

%论文页码的字号字体为小五号Times New Roman体
%从绪论部分开始，至附录，用阿拉伯数字连续编排
%页码位于页面底端居中
\renewcommand{\footnotesize}{\zihao{-5}}  

%论文中出现的所有数字和字母如无特殊要求都用Times New Roman体。
%设置正文非汉字的字体为Times New Roman
\setmainfont{Times New Roman}

%设置英文图为Fig，表格为Tab
\DeclareCaptionOption{english}[]{
\renewcommand\figurename{Fig.}
\renewcommand\tablename{Tab}}
\captionsetup[bi-second]{english}

%一定要在这里声明space，直接声明不好使，小五号
\captionsetup{font={footnotesize,bf},labelsep=space}

%设置图片编号随着章节自动清零
\numberwithin{figure}{section}
%设置公式编号随着章节自动清零
\numberwithin{equation}{section}

%定义图的编号为章节号码.序号
\renewcommand{\thefigure}{\thesection.\arabic{figure}}
%定义公式的编号为章节号码.序号
\renewcommand{\theequation}{\thesection.\arabic{equation}}
%定义表的编号也为章节号码.序号
\renewcommand{\thetable}{\thesection.\arabic{table}}

%改变figure为图
\renewcommand{\figureautorefname}{图}

%改变equation为式
\renewcommand{\equationautorefname}{式}
\renewcommand{\subsectionautorefname}{节}
\renewcommand{\sectionautorefname}{章}
\renewcommand{\subsubsectionautorefname}{条}

%同上，将table改为表
\renewcommand{\tableautorefname}{表}


%章标题：四号宋体加粗
%section不另起一页，宋体四号加粗居
%\CTEXsetup[format={\pagebreak\centering\zi中hao{4}\CJKfamily{zhsong}\textbf}]{section}
\CTEXsetup[format={\centering\zihao{4}\CJKfamily{zhsong}\textbf}]{section}

%节标题：小四号宋体加粗
%subsection宋体小四号加粗
\CTEXsetup[format={\zihao{-4}\CJKfamily{zhsong}\textbf}]{subsection}

%subsubsection宋体小四号加粗
\CTEXsetup[format={\zihao{5}\CJKfamily{zhsong}\textbf}]{subsubsection}
\bibliographystyle{GBT7714-2005NLang-UTF8}



%%%%
%课程名称
\newcommand{\bjfuLecturename}[1]{\def\lecturenameString{#1}}
% 实验名称
\newcommand{\bjfuTitle}[1]{\def\bjfuTitleFirstLineString{#1}}
% 班级
\newcommand{\bjfuClass}[1]{\def\bjfuClassString{#1}}
% 学号
%\newcommand{\bjfuId}[1]{\def\bjfuIdString{#1}}
%为了封面页信息排版而定义的一个表格中的类型 (>.<),不知道
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%成员
\newcommand{\bjfuAuthors}[5]{
	\def\bjfuAuthorStringi{#1}
	\def\bjfuAuthorStringii{#2}
	\def\bjfuAuthorStringiii{#3}
	\def\bjfuAuthorStringiiii{#4}
	\def\bjfuAuthorStringiiiii{#5}
}
\newcommand{\bjfuIds}[5]{
	\def\bjfuIdStringi{#1}
	\def\bjfuIdStringii{#2}
	\def\bjfuIdStringiii{#3}
	\def\bjfuIdStringiiii{#4}
	\def\bjfuIdStringiiiii{#5}

}
% 标题页
\newcommand{\makebjfuTitlePage}{
%扉页，无header和footer
%这一页的页边距和其他页面不一样，为上边距为25.4mm，下边距为25.4mm，左边距为31.75mm，右边距为31.75mm
\newgeometry{left=31.75mm,right=31.75mm,top=25.4mm,bottom=25.4mm}
\thispagestyle{empty}
\vspace*{-10mm} \hspace*{-8mm} \includegraphics[width=0.90\textwidth]{files/header.png} 
\begin{center}
\vspace{2mm}
\fontsize{35pt}{35pt} \CJKfamily{zhhei} \textbf{\lecturenameString}

\vspace{3mm}
\zihao{-1}\CJKfamily{zhkai}{实验报告}

\vspace*{20mm} 
	\begin{tabular}{rC{29.5mm}rC{29.5mm}}
	\zihao{4}\CJKfamily{zhhei} \textbf{实验名称\phantom{占位}} & \multicolumn{3}{c}{\zihao{4}\CJKfamily{zhkai}\bjfuTitleFirstLineString} \\ \cline{2-4}
	\zihao{4}\CJKfamily{zhhei} \textbf{班\ \ \ \ \ \ \ \ 级\phantom{占位}} & \multicolumn{3}{c}{\zihao{4}\CJKfamily{zhkai}\bjfuClassString} \\ \cline{2-4} 
	\zihao{4}\CJKfamily{zhhei} \textbf{组\ \ \ \ \ \ \ \ 员\phantom{占位}} & \multicolumn{3}{c}{\zihao{4}\CJKfamily{zhkai}\bjfuAuthorStringi\qquad\qquad\bjfuIdStringi} \\ \cline{2-4} 
	& \multicolumn{3}{c}{\zihao{4}\CJKfamily{zhkai}\bjfuAuthorStringii\qquad\qquad\bjfuIdStringii} \\ \cline{2-4}
	& \multicolumn{3}{c}{\zihao{4}\CJKfamily{zhkai}\bjfuAuthorStringiii\qquad\qquad\bjfuIdStringiii} \\ \cline{2-4}
	& \multicolumn{3}{c}{\zihao{4}\CJKfamily{zhkai}\bjfuAuthorStringiiii\qquad\qquad\bjfuIdStringiiii} \\ \cline{2-4}
	& \multicolumn{3}{c}{\zihao{4}\CJKfamily{zhkai}\bjfuAuthorStringiiiii\qquad\qquad\bjfuIdStringiiiii} \\ \cline{2-4}
	\end{tabular} 
\end{center}
\pagebreak

%恢复页边距和header、footer
\restoregeometry
\thispagestyle{fancy}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%页码使用阿拉伯编排
\pagenumbering{arabic}

}
