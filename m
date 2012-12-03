Received: from mail.pce.us.com ([69.40.160.195])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tfbzz-0007Sh-8C
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 19:48:15 +0000
Message-ID: <50BD01F8.3040003@itwatchdogs.com>
Date: Mon, 3 Dec 2012 13:48:08 -0600
From: Zach Sadecki <zsadecki@itwatchdogs.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Always report corrected and failed ECC stats back up to the MTD layer.  Also
return max_bitflips from read_page() as is expected from NAND drivers now.

Signed-off-by: Zach Sadecki <zsadecki@itwatchdogs.com>
---
   drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   27 ++++++++-------------------
   1 file changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index d79696b..fe10c53 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -914,8 +914,7 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
   	dma_addr_t    auxiliary_phys;
   	unsigned int  i;
   	unsigned char *status;
-	unsigned int  failed;
-	unsigned int  corrected;
+	unsigned int  max_bitflips = 0;
   	int           ret;
   
   	pr_debug("page number is : %d\n", page);
@@ -939,35 +938,25 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
   			payload_virt, payload_phys);
   	if (ret) {
   		pr_err("Error in ECC-based read: %d\n", ret);
-		goto exit_nfc;
+		return ret;
   	}
   
   	/* handle the block mark swapping */
   	block_mark_swapping(this, payload_virt, auxiliary_virt);
   
   	/* Loop over status bytes, accumulating ECC status. */
-	failed		= 0;
-	corrected	= 0;
-	status		= auxiliary_virt + nfc_geo->auxiliary_status_offset;
+	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
   
   	for (i = 0; i < nfc_geo->ecc_chunk_count; i++, status++) {
   		if ((*status == STATUS_GOOD) || (*status == STATUS_ERASED))
   			continue;
   
   		if (*status == STATUS_UNCORRECTABLE) {
-			failed++;
+			mtd->ecc_stats.failed++;
   			continue;
   		}
-		corrected += *status;
-	}
-
-	/*
-	 * Propagate ECC status to the owning MTD only when failed or
-	 * corrected times nearly reaches our ECC correction threshold.
-	 */
-	if (failed || corrected >= (nfc_geo->ecc_strength - 1)) {
-		mtd->ecc_stats.failed    += failed;
-		mtd->ecc_stats.corrected += corrected;
+		mtd->ecc_stats.corrected += *status;
+		max_bitflips = max_t(unsigned int, max_bitflips, *status);
   	}
   
   	if (oob_required) {
@@ -989,8 +978,8 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
   			this->payload_virt, this->payload_phys,
   			nfc_geo->payload_size,
   			payload_virt, payload_phys);
-exit_nfc:
-	return ret;
+
+	return max_bitflips;
   }
   
   static int gpmi_ecc_write_page(struct mtd_info *mtd, struct nand_chip *chip,
-- 
1.7.9.5
