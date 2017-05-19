Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dBWdo-0000PZ-7M
 for linux-mtd@lists.infradead.org; Fri, 19 May 2017 01:23:58 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 08/31] clk.txt: standardize document format
Date: Thu, 18 May 2017 22:22:13 -0300
Message-Id: <ac94d9d8ec415f69cca07df9808653f5cf387a50.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1495156488.git.mchehab@s-opensource.com>
References: <cover.1495156488.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Each text file under Documentation follows a different
format. Some doesn't even have titles!

Change its representation to follow the adopted standard,
using ReST markups for it to be parseable by Sphinx:

- Use section/title markups;
- Use :Author: for authorship;
- Mark literals and literal blocks;
- Mark tables;
- Use ReST notation for footnotes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/clk.txt | 189 ++++++++++++++++++++++++++++----------------------
 1 file changed, 106 insertions(+), 83 deletions(-)

diff --git a/Documentation/clk.txt b/Documentation/clk.txt
index 22f026aa2f34..be909ed45970 100644
--- a/Documentation/clk.txt
+++ b/Documentation/clk.txt
@@ -1,12 +1,16 @@
-		The Common Clk Framework
-		Mike Turquette <mturquette@ti.com>
+========================
+The Common Clk Framework
+========================
+
+:Author: Mike Turquette <mturquette@ti.com>
 
 This document endeavours to explain the common clk framework details,
 and how to port a platform over to this framework.  It is not yet a
 detailed explanation of the clock api in include/linux/clk.h, but
 perhaps someday it will include that information.
 
-	Part 1 - introduction and interface split
+Introduction and interface split
+================================
 
 The common clk framework is an interface to control the clock nodes
 available on various devices today.  This may come in the form of clock
@@ -35,10 +39,11 @@ is defined in struct clk_foo and pointed to within struct clk_core.  This
 allows for easy navigation between the two discrete halves of the common
 clock interface.
 
-	Part 2 - common data structures and api
+Common data structures and api
+==============================
 
 Below is the common struct clk_core definition from
-drivers/clk/clk.c, modified for brevity:
+drivers/clk/clk.c, modified for brevity::
 
 	struct clk_core {
 		const char		*name;
@@ -59,7 +64,7 @@ struct clk.  That api is documented in include/linux/clk.h.
 
 Platforms and devices utilizing the common struct clk_core use the struct
 clk_ops pointer in struct clk_core to perform the hardware-specific parts of
-the operations defined in clk-provider.h:
+the operations defined in clk-provider.h::
 
 	struct clk_ops {
 		int		(*prepare)(struct clk_hw *hw);
@@ -95,19 +100,20 @@ the operations defined in clk-provider.h:
 					      struct dentry *dentry);
 	};
 
-	Part 3 - hardware clk implementations
+Hardware clk implementations
+============================
 
 The strength of the common struct clk_core comes from its .ops and .hw pointers
 which abstract the details of struct clk from the hardware-specific bits, and
 vice versa.  To illustrate consider the simple gateable clk implementation in
-drivers/clk/clk-gate.c:
+drivers/clk/clk-gate.c::
 
-struct clk_gate {
-	struct clk_hw	hw;
-	void __iomem    *reg;
-	u8              bit_idx;
-	...
-};
+	struct clk_gate {
+		struct clk_hw	hw;
+		void __iomem    *reg;
+		u8              bit_idx;
+		...
+	};
 
 struct clk_gate contains struct clk_hw hw as well as hardware-specific
 knowledge about which register and bit controls this clk's gating.
@@ -115,7 +121,7 @@ Nothing about clock topology or accounting, such as enable_count or
 notifier_count, is needed here.  That is all handled by the common
 framework code and struct clk_core.
 
-Let's walk through enabling this clk from driver code:
+Let's walk through enabling this clk from driver code::
 
 	struct clk *clk;
 	clk = clk_get(NULL, "my_gateable_clk");
@@ -123,70 +129,71 @@ Let's walk through enabling this clk from driver code:
 	clk_prepare(clk);
 	clk_enable(clk);
 
-The call graph for clk_enable is very simple:
+The call graph for clk_enable is very simple::
 
-clk_enable(clk);
-	clk->ops->enable(clk->hw);
-	[resolves to...]
-		clk_gate_enable(hw);
-		[resolves struct clk gate with to_clk_gate(hw)]
-			clk_gate_set_bit(gate);
+	clk_enable(clk);
+		clk->ops->enable(clk->hw);
+		[resolves to...]
+			clk_gate_enable(hw);
+			[resolves struct clk gate with to_clk_gate(hw)]
+				clk_gate_set_bit(gate);
 
-And the definition of clk_gate_set_bit:
+And the definition of clk_gate_set_bit::
 
-static void clk_gate_set_bit(struct clk_gate *gate)
-{
-	u32 reg;
+	static void clk_gate_set_bit(struct clk_gate *gate)
+	{
+		u32 reg;
 
-	reg = __raw_readl(gate->reg);
-	reg |= BIT(gate->bit_idx);
-	writel(reg, gate->reg);
-}
+		reg = __raw_readl(gate->reg);
+		reg |= BIT(gate->bit_idx);
+		writel(reg, gate->reg);
+	}
 
-Note that to_clk_gate is defined as:
+Note that to_clk_gate is defined as::
 
-#define to_clk_gate(_hw) container_of(_hw, struct clk_gate, hw)
+	#define to_clk_gate(_hw) container_of(_hw, struct clk_gate, hw)
 
 This pattern of abstraction is used for every clock hardware
 representation.
 
-	Part 4 - supporting your own clk hardware
+Supporting your own clk hardware
+================================
 
 When implementing support for a new type of clock it is only necessary to
-include the following header:
+include the following header::
 
-#include <linux/clk-provider.h>
+	#include <linux/clk-provider.h>
 
 To construct a clk hardware structure for your platform you must define
-the following:
+the following::
 
-struct clk_foo {
-	struct clk_hw hw;
-	... hardware specific data goes here ...
-};
+	struct clk_foo {
+		struct clk_hw hw;
+		... hardware specific data goes here ...
+	};
 
 To take advantage of your data you'll need to support valid operations
-for your clk:
+for your clk::
 
-struct clk_ops clk_foo_ops {
-	.enable		= &clk_foo_enable;
-	.disable	= &clk_foo_disable;
-};
+	struct clk_ops clk_foo_ops {
+		.enable		= &clk_foo_enable;
+		.disable	= &clk_foo_disable;
+	};
 
-Implement the above functions using container_of:
+Implement the above functions using container_of::
 
-#define to_clk_foo(_hw) container_of(_hw, struct clk_foo, hw)
+	#define to_clk_foo(_hw) container_of(_hw, struct clk_foo, hw)
 
-int clk_foo_enable(struct clk_hw *hw)
-{
-	struct clk_foo *foo;
+	int clk_foo_enable(struct clk_hw *hw)
+	{
+		struct clk_foo *foo;
 
-	foo = to_clk_foo(hw);
+		foo = to_clk_foo(hw);
 
-	... perform magic on foo ...
+		... perform magic on foo ...
 
-	return 0;
-};
+		return 0;
+	};
 
 Below is a matrix detailing which clk_ops are mandatory based upon the
 hardware capabilities of that clock.  A cell marked as "y" means
@@ -194,41 +201,56 @@ mandatory, a cell marked as "n" implies that either including that
 callback is invalid or otherwise unnecessary.  Empty cells are either
 optional or must be evaluated on a case-by-case basis.
 
-                              clock hardware characteristics
-                -----------------------------------------------------------
-                | gate | change rate | single parent | multiplexer | root |
-                |------|-------------|---------------|-------------|------|
-.prepare        |      |             |               |             |      |
-.unprepare      |      |             |               |             |      |
-                |      |             |               |             |      |
-.enable         | y    |             |               |             |      |
-.disable        | y    |             |               |             |      |
-.is_enabled     | y    |             |               |             |      |
-                |      |             |               |             |      |
-.recalc_rate    |      | y           |               |             |      |
-.round_rate     |      | y [1]       |               |             |      |
-.determine_rate |      | y [1]       |               |             |      |
-.set_rate       |      | y           |               |             |      |
-                |      |             |               |             |      |
-.set_parent     |      |             | n             | y           | n    |
-.get_parent     |      |             | n             | y           | n    |
-                |      |             |               |             |      |
-.recalc_accuracy|      |             |               |             |      |
-                |      |             |               |             |      |
-.init           |      |             |               |             |      |
-                -----------------------------------------------------------
-[1] either one of round_rate or determine_rate is required.
+.. table:: clock hardware characteristics
+
+   +----------------+------+-------------+---------------+-------------+------+
+   |                | gate | change rate | single parent | multiplexer | root |
+   +================+======+=============+===============+=============+======+
+   |.prepare        |      |             |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   |.unprepare      |      |             |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   +----------------+------+-------------+---------------+-------------+------+
+   |.enable         | y    |             |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   |.disable        | y    |             |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   |.is_enabled     | y    |             |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   +----------------+------+-------------+---------------+-------------+------+
+   |.recalc_rate    |      | y           |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   |.round_rate     |      | y [1]_      |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   |.determine_rate |      | y [1]_      |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   |.set_rate       |      | y           |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   +----------------+------+-------------+---------------+-------------+------+
+   |.set_parent     |      |             | n             | y           | n    |
+   +----------------+------+-------------+---------------+-------------+------+
+   |.get_parent     |      |             | n             | y           | n    |
+   +----------------+------+-------------+---------------+-------------+------+
+   +----------------+------+-------------+---------------+-------------+------+
+   |.recalc_accuracy|      |             |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+   +----------------+------+-------------+---------------+-------------+------+
+   |.init           |      |             |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
+
+.. [1] either one of round_rate or determine_rate is required.
 
 Finally, register your clock at run-time with a hardware-specific
 registration function.  This function simply populates struct clk_foo's
 data and then passes the common struct clk parameters to the framework
-with a call to:
+with a call to::
 
-clk_register(...)
+	clk_register(...)
 
-See the basic clock types in drivers/clk/clk-*.c for examples.
+See the basic clock types in ``drivers/clk/clk-*.c`` for examples.
 
-	Part 5 - Disabling clock gating of unused clocks
+Disabling clock gating of unused clocks
+=======================================
 
 Sometimes during development it can be useful to be able to bypass the
 default disabling of unused clocks. For example, if drivers aren't enabling
@@ -239,7 +261,8 @@ are sorted out.
 To bypass this disabling, include "clk_ignore_unused" in the bootargs to the
 kernel.
 
-	Part 6 - Locking
+Locking
+=======
 
 The common clock framework uses two global locks, the prepare lock and the
 enable lock.
-- 
2.9.4
