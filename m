Received: from conuserg012.nifty.com ([202.248.44.38]
 helo=conuserg012-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUlG-00053l-L5
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:10:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/16] clk: simplify clk_fetch_parent_index() function
Date: Mon, 28 Dec 2015 19:10:28 +0900
Message-Id: <1451297429-21689-16-git-send-email-yamada.masahiro@socionext.com>
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

The clk_core_get_parent_by_index can be used as a helper function
to simplify the implementation of clk_fetch_parent_index().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 151cbe8..5b9aec0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1069,23 +1069,9 @@ static int clk_fetch_parent_index(struct clk_core *core,
 	if (!parent)
 		return -EINVAL;
 
-	/*
-	 * find index of new parent clock using cached parent ptrs,
-	 * or if not yet cached, use string name comparison and cache
-	 * them now to avoid future calls to clk_core_lookup.
-	 */
-	for (i = 0; i < core->num_parents; i++) {
-		if (core->parents[i] == parent)
-			return i;
-
-		if (core->parents[i])
-			continue;
-
-		if (!strcmp(core->parent_names[i], parent->name)) {
-			core->parents[i] = clk_core_lookup(parent->name);
+	for (i = 0; i < core->num_parents; i++)
+		if (clk_core_get_parent_by_index(core, i) == parent)
 			return i;
-		}
-	}
 
 	return -EINVAL;
 }
-- 
1.9.1
