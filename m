Received: from mail-eopbgr50056.outbound.protection.outlook.com ([40.107.5.56]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ey8zp-0000gk-Hv
 for linux-mtd@lists.infradead.org; Tue, 20 Mar 2018 04:35:39 +0000
From: Jagdish Gediya <jagdish.gediya@nxp.com>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, computersforpeace@gmail.com,
 oss@buserror.net, leoyang.li@nxp.com,
 Jagdish Gediya <jagdish.gediya@nxp.com>, stable@vger.kernel.org
Subject: [PATCH][v2] mtd: rawnand: fsl_ifc: Fix nand waitfunc return value
Date: Tue, 20 Mar 2018 22:13:38 +0530
Message-Id: <1521564229-8018-1-git-send-email-jagdish.gediya@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As per the IFC hardware manual, Most significant 2 bytes in
nand_fsr register are the outcome of NAND READ STATUS command.

So status value need to be shifted and aligned as per the nand
framework requirement.

Fixes: 82771882d960 ("NAND Machine support for Integrated Flash Controller")
Cc: stable@vger.kernel.org # v3.18+
Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
Reviewed-by: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
---
Changes for v2: Incorporated comments from Boris Brezillon
        - Added fixes tag

 drivers/mtd/nand/fsl_ifc_nand.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 9390cbd..0aa03ba 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -643,12 +643,13 @@ static int fsl_ifc_wait(struct mtd_info *mtd, struct nand_chip *chip)
 	fsl_ifc_run_command(mtd);
 
 	nand_fsr = ifc_in32(&ifc->ifc_nand.nand_fsr);
-
+	nand_fsr >>= 16;
+	nand_fsr = (nand_fsr >> 8) | (nand_fsr << 8);
 	/*
 	 * The chip always seems to report that it is
 	 * write-protected, even when it is not.
 	 */
-	return nand_fsr | NAND_STATUS_WP;
+	return (nand_fsr & 0xff) | NAND_STATUS_WP;
 }
 
 /*
-- 
1.9.1
