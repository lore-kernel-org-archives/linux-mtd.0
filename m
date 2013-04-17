Received: from mail.free-electrons.com ([94.23.35.102])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1USVNE-0000w5-RB
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2013 16:38:22 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 0/7] mtd: nand: pxa3xx cleanup
Date: Wed, 17 Apr 2013 13:38:07 -0300
Message-Id: <1366216694-2365-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Lior Amsalem <alior@marvell.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Eric Miao <eric.miao@linaro.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Zhangfei Gao <zhangfei.gao@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a small set of cleanups for pxa3xx. Tested by compilation only.

Although the patches are somewhat simple, it would be wise to have some
testing before applying them.

Any feedback welcome!

Ezequiel Garcia (7):
  Documentation: clk.txt: Fix a very small typo
  mtd: nand: pxa3xx: Use devm_kzalloc
  mtd: nand: pxa3xx: Use devm_ioremap_resource
  mtd: nand: pxa3xx: Use devm_clk_get
  mtd: nand: pxa3xx: Use clk_prepare_enable and clk_disable_unprepare
  mtd: nand: pxa3xx: Check for clk_prepare_enable() return value
  mtd: nand: pxa3xx: Move buffer release code to its own function

 Documentation/clk.txt          |  2 +-
 drivers/mtd/nand/pxa3xx_nand.c | 93 +++++++++++++++---------------------------
 2 files changed, 34 insertions(+), 61 deletions(-)

-- 
1.8.1.5
