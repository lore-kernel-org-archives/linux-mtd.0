Received: from conuserg012.nifty.com ([202.248.44.38]
 helo=conuserg012-v.nifty.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aDUlD-00050F-0X
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2015 10:10:41 +0000
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-mtd@lists.infradead.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/16] clk: rename __clk_init() into __clk_core_init()
Date: Mon, 28 Dec 2015 19:10:16 +0900
Message-Id: <1451297429-21689-4-git-send-email-yamada.masahiro@socionext.com>
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

Now this function takes clk_core as its argument.  __clk_core_init()
would be more suitable for the name of this function.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/clk/clk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 623838f..41179f3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2285,13 +2285,13 @@ static inline void clk_debug_unregister(struct clk_core *core)
 #endif
 
 /**
- * __clk_init - initialize the data structures in a struct clk_core
+ * __clk_core_init - initialize the data structures in a struct clk_core
  * @core:	clk_core being initialized
  *
  * Initializes the lists in struct clk_core, queries the hardware for the
  * parent and rate and sets them both.
  */
-static int __clk_init(struct clk_core *core)
+static int __clk_core_init(struct clk_core *core)
 {
 	int i, ret = 0;
 	struct clk_core *orphan;
@@ -2571,7 +2571,7 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
 		goto fail_parent_names_copy;
 	}
 
-	ret = __clk_init(core);
+	ret = __clk_core_init(core);
 	if (!ret)
 		return hw->clk;
 
-- 
1.9.1
