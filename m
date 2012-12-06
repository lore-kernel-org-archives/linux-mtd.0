Received: from mail.karo-electronics.de ([81.173.242.67])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TgW6K-00046U-GW
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2012 07:42:33 +0000
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: mxc_nand: fix unbalanced clk_disable() in error path
Date: Thu,  6 Dec 2012 08:42:27 +0100
Message-Id: <1354779748-28869-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Shawn Guo <shawn.guo@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If nand_scan_ident() or nand_scan_tail() fails, the NAND chip may have
been deselected and the clock already disabled. Thus, check 'clk_act'
in the error path to decide whether the clock still needs to be
disabled.

This fixes a:
|WARNING: at drivers/clk/clk.c:472 __clk_disable+0x3c/0x78()

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 drivers/mtd/nand/mxc_nand.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d316324..d965809 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -1556,7 +1556,8 @@ static int mxcnd_probe(struct platform_device *pdev)
 	return 0;
 
 escan:
-	clk_disable_unprepare(host->clk);
+	if (host->clk_act)
+		clk_disable_unprepare(host->clk);
 
 	return err;
 }
-- 
1.7.2.5
