Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TgLrL-0004yS-Lz
 for linux-mtd@lists.infradead.org; Wed, 05 Dec 2012 20:46:24 +0000
From: Wolfram Sang <w.sang@pengutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: gpmi: reset BCH earlier, too,
 to avoid NAND startup problems
Date: Wed,  5 Dec 2012 21:46:02 +0100
Message-Id: <1354740362-20412-1-git-send-email-w.sang@pengutronix.de>
Cc: David Woodhouse <david.woodhouse@intel.com>,
 Huang Shijie <b32955@freescale.com>, Wolfram Sang <w.sang@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It could happen (1 out of 100 times) that NAND did not start up
correctly after warm rebooting, so the kernel could not find the UBI or
DMA timed out due to a stalled BCH. When resetting BCH together with
GPMI, the issue could not be observed anymore (after 10000+ reboots). We
probably need the consistent state already before sending any command to
NAND, even when no ECC is needed. I chose to keep the extra reset for
BCH when changing the flash layout to be on the safe side.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
Cc: Huang Shijie <b32955@freescale.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: David Woodhouse <david.woodhouse@intel.com>
---

Would be really great to have in 3.7. Also a stable-candidate IMO.

 drivers/mtd/nand/gpmi-nand/gpmi-lib.c |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
index 3502acc..84f0526 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
@@ -166,6 +166,15 @@ int gpmi_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_out;
 
+	/*
+	 * Reset BCH here, too. We got failures otherwise :(
+	 * See later BCH reset for explanation of MX23 handling
+	 */
+	ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MX23(this));
+	if (ret)
+		goto err_out;
+
+
 	/* Choose NAND mode. */
 	writel(BM_GPMI_CTRL1_GPMI_MODE, r->gpmi_regs + HW_GPMI_CTRL1_CLR);
 
-- 
1.7.10.4
