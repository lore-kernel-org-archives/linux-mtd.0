Received: from mail.rapiddevelopmentkit.de ([217.6.246.34] helo=root.phytec.de)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RVJY2-0007ly-Me
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2011 09:00:19 +0000
From: Jan Weitzel <j.weitzel@phytec.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mdt nand: omap2+ use platform options
Date: Tue, 29 Nov 2011 10:00:13 +0100
Message-Id: <1322557213-23565-1-git-send-email-j.weitzel@phytec.de>
In-Reply-To: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
References: <CAN8TOE9=ux=suwcQMwJY1XUhp_mnD_DL613ffF1-HTL1OVB2PQ@mail.gmail.com>
Cc: dedekind@infradead.org, Jan Weitzel <j.weitzel@phytec.de>,
 tglx@linutronix.de, computersforpeace@gmail.com, linux-omap@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Options from struct omap_nand_platform_data are not used.
Apply options after nand_scan_ident to avoid overwrite due to
NAND_CHIPOPTIONS_MSK.
So you can pass options from platformcode

Signed-off-by: Jan Weitzel <j.weitzel@phytec.de>
---
 drivers/mtd/nand/omap2.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
index f745f00..7de4c0e 100644
--- a/drivers/mtd/nand/omap2.c
+++ b/drivers/mtd/nand/omap2.c
@@ -1075,6 +1075,8 @@ static int __devinit omap_nand_probe(struct platform_device *pdev)
 		}
 	}
 
+	info->nand.options |= pdata->options;
+
 	/* rom code layout */
 	if (pdata->ecc_opt == OMAP_ECC_HAMMING_CODE_HW_ROMCODE) {
 
-- 
1.7.0.4
