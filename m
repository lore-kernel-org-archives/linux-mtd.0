Received: from conuserg012.nifty.com ([202.248.44.38]
 helo=conuserg012-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUlH-00050V-Ib
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:10:46 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/16] clk: remove unnecessary !core->parents conditional
Date: Mon, 28 Dec 2015 19:10:17 +0900
Message-Id: <1451297429-21689-5-git-send-email-yamada.masahiro@socionext.com>
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

This if-block has been here since the introduction of the common
clock framework.  Now no clock drivers are statically initialized.
core->parent is always NULL at this point.  Drop the redundant
check and the confusing comment.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 41179f3..30c0bbc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2348,11 +2348,8 @@ static int __clk_core_init(struct clk_core *core)
 	 * in to clk_init during early boot; thus any access to core->parents[]
 	 * must always check for a NULL pointer and try to populate it if
 	 * necessary.
-	 *
-	 * If core->parents is not NULL we skip this entire block.  This allows
-	 * for clock drivers to statically initialize core->parents.
 	 */
-	if (core->num_parents > 1 && !core->parents) {
+	if (core->num_parents > 1) {
 		core->parents = kcalloc(core->num_parents, sizeof(struct clk *),
 					GFP_KERNEL);
 		/*
-- 
1.9.1
