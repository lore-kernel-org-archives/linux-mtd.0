Received: from conuserg012.nifty.com ([202.248.44.38]
 helo=conuserg012-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUlD-000504-0Y
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:10:41 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] clk: drop the initial core->parents look-ups from
 __clk_core_init()
Date: Mon, 28 Dec 2015 19:10:21 +0900
Message-Id: <1451297429-21689-9-git-send-email-yamada.masahiro@socionext.com>
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

The core->parents is a cache to save expensive clock parent look-ups.
It will be filled as needed later.  We do not have to do it here.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ca7849a..3215b2b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2329,17 +2329,6 @@ static int __clk_core_init(struct clk_core *core)
 				"%s: invalid NULL in %s's .parent_names\n",
 				__func__, core->name);
 
-	/*
-	 * clk_core_lookup returns NULL for parents that have not been
-	 * clk_init'd; thus any access to clk->parents[] must check
-	 * for a NULL pointer.  We can always perform lazy lookups for
-	 * missing parents later on.
-	 */
-	if (core->parents)
-		for (i = 0; i < core->num_parents; i++)
-			core->parents[i] =
-				clk_core_lookup(core->parent_names[i]);
-
 	core->parent = __clk_init_parent(core);
 
 	/*
-- 
1.9.1
