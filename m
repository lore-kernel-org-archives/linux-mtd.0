Received: from conuserg012.nifty.com ([202.248.44.38]
 helo=conuserg012-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUlD-0004zz-0a
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:10:42 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/16] clk: walk the orphan clock list more simply
Date: Mon, 28 Dec 2015 19:10:26 +0900
Message-Id: <1451297429-21689-14-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
References: <1451297429-21689-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This loop can be much simpler.  If a new parent is available for
orphan clocks, __clk_init_parent(orphan) can detect it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a4f66fe..efd093a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2402,24 +2402,15 @@ static int __clk_core_init(struct clk_core *core)
 	core->rate = core->req_rate = rate;
 
 	/*
-	 * walk the list of orphan clocks and reparent any that are children of
-	 * this clock
+	 * walk the list of orphan clocks and reparent any that newly finds a
+	 * parent.
 	 */
 	hlist_for_each_entry_safe(orphan, tmp2, &clk_orphan_list, child_node) {
-		if (orphan->num_parents && orphan->ops->get_parent) {
-			i = orphan->ops->get_parent(orphan->hw);
-			if (i >= 0 && i < orphan->num_parents &&
-			    !strcmp(core->name, orphan->parent_names[i]))
-				clk_core_reparent(orphan, core);
-			continue;
-		}
+		struct clk_core *parent = __clk_init_parent(orphan);
 
-		for (i = 0; i < orphan->num_parents; i++)
-			if (!strcmp(core->name, orphan->parent_names[i])) {
-				clk_core_reparent(orphan, core);
-				break;
-			}
-	 }
+		if (parent)
+			clk_core_reparent(orphan, parent);
+	}
 
 	/*
 	 * optional platform-specific magic
-- 
1.9.1
