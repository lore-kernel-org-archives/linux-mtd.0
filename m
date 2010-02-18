Received: from sdcmail01.amcc.com ([198.137.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NiFX9-0007J9-Ri
	for linux-mtd@lists.infradead.org; Thu, 18 Feb 2010 23:11:52 +0000
From: Feng Kan <fkan@amcc.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@ozlabs.org
Subject: [PATCH 1/1] NDFC: add support for alternate ECC format for ndfc
Date: Thu, 18 Feb 2010 15:11:18 -0800
Message-Id: <1266534678-30293-1-git-send-email-fkan@amcc.com>
Cc: Feng Kan <fkan@amcc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is to lock down the ordering in the correction routine against
the calculate routine. Otherwise, incorrect define would cause ECC errors.

Signed-off-by: Feng Kan <fkan@amcc.com>
Acked-by: Victor Gallardo <vgallardo@amcc.com>
---
 drivers/mtd/nand/ndfc.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index 40b5658..fc1f0ff 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -102,10 +102,15 @@ static int ndfc_calculate_ecc(struct mtd_info *mtd,
 	wmb();
 	ecc = in_be32(ndfc->ndfcbase + NDFC_ECC);
 	/* The NDFC uses Smart Media (SMC) bytes order */
+#ifdef CONFIG_MTD_NAND_ECC_SMC
 	ecc_code[0] = p[1];
 	ecc_code[1] = p[2];
 	ecc_code[2] = p[3];
+#else
+	ecc_code[0] = p[2];
+	ecc_code[1] = p[1];
+	ecc_code[2] = p[3];
+#endif

 	return 0;
 }
 
-- 
1.5.5
