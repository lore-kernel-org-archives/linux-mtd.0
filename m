Received: from conuserg012.nifty.com ([202.248.44.38]
 helo=conuserg012-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUlF-00053h-Sf
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:10:44 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/16] clk: slightly optimize clk_core_set_parent()
Date: Mon, 28 Dec 2015 19:10:29 +0900
Message-Id: <1451297429-21689-17-git-send-email-yamada.masahiro@socionext.com>
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

If clk_fetch_parent_index() fails, p_rate is unused.  Move the
assignment after the error checking.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 5b9aec0..e81301b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1730,13 +1730,13 @@ static int clk_core_set_parent(struct clk_core *core, struct clk_core *parent)
 	/* try finding the new parent index */
 	if (parent) {
 		p_index = clk_fetch_parent_index(core, parent);
-		p_rate = parent->rate;
 		if (p_index < 0) {
 			pr_debug("%s: clk %s can not be parent of clk %s\n",
 					__func__, parent->name, core->name);
 			ret = p_index;
 			goto out;
 		}
+		p_rate = parent->rate;
 	}
 
 	/* propagate PRE_RATE_CHANGE notifications */
-- 
1.9.1
