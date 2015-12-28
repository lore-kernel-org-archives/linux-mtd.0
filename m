Received: from conuserg012.nifty.com ([202.248.44.38]
 helo=conuserg012-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUlD-000500-0a
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:10:40 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/16] clk: move checking .git_parent to __clk_core_init()
Date: Mon, 28 Dec 2015 19:10:23 +0900
Message-Id: <1451297429-21689-11-git-send-email-yamada.masahiro@socionext.com>
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

The .git_parent is mandatory for multi-parent clocks.  Move the check
to __clk_core_init(), like other callback checkings.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e6e10f5..4ad0a36 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1677,13 +1677,6 @@ static struct clk_core *__clk_init_parent(struct clk_core *core)
 		goto out;
 	}
 
-	if (!core->ops->get_parent) {
-		WARN(!core->ops->get_parent,
-			"%s: multi-parent clocks must implement .get_parent\n",
-			__func__);
-		goto out;
-	}
-
 	/*
 	 * Do our best to cache parent clocks in core->parents.  This prevents
 	 * unnecessary and expensive lookups.  We don't set core->parent here;
@@ -2315,6 +2308,11 @@ static int __clk_core_init(struct clk_core *core)
 		goto out;
 	}
 
+	if (core->num_parents > 1 && !core->ops->get_parent) {
+		pr_err("%s: %s must implement .get_parent as it has multi parents\n",
+		       __func__, core->name);
+	}
+
 	if (core->ops->set_rate_and_parent &&
 			!(core->ops->set_parent && core->ops->set_rate)) {
 		pr_err("%s: %s must implement .set_parent & .set_rate\n",
-- 
1.9.1
