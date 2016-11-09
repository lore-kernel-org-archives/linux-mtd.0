Received: from ip2.televic.com ([81.82.194.222] helo=exchange.televic.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4S6c-0001Hv-LC
 for linux-mtd@lists.infradead.org; Wed, 09 Nov 2016 12:35:55 +0000
From: <w.cappelle@televic.com>
To: <linux-mtd@lists.infradead.org>
CC: <w.cappelle@televic.com>
Subject: [PATCH] nand gpmi fix erased block bitflip counting
Date: Wed, 9 Nov 2016 13:35:20 +0100
Message-ID: <1478694920-6453-2-git-send-email-w.cappelle@televic.com>
In-Reply-To: <1478694920-6453-1-git-send-email-w.cappelle@televic.com>
References: <1478694920-6453-1-git-send-email-w.cappelle@televic.com>
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

From: Wouter Cappelle <w.cappelle@televic.com>

---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index 8339d4f..6ae118c 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -1217,6 +1217,7 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
 	int base = geo->ecc_chunkn_size * chunk;
 	unsigned int flip_bits = 0, flip_bits_noecc = 0;
 	uint64_t *buf = (uint64_t *)this->data_buffer_dma;
+	unsigned char *chunkbuf =(unsigned char*) this->data_buffer_dma;
 	unsigned int threshold;
 	int i;
 
@@ -1224,13 +1225,6 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
 	if (threshold > geo->ecc_strength)
 		threshold = geo->ecc_strength;
 
-	/* Count bitflips */
-	for (i = 0; i < geo->ecc_chunkn_size; i++) {
-		flip_bits += hweight8(~data[base + i]);
-		if (flip_bits > threshold)
-			return false;
-	}
-
 	/*
 	 * Read out the whole page with ECC disabled, and check it again,
 	 * This is more strict then just read out a chunk, and it makes
@@ -1246,6 +1240,12 @@ static bool gpmi_erased_check(struct gpmi_nand_data *this,
 			return false;
 	}
 
+	/* Count bitflips in the current chunk for correct stats reporting */
+	for (i = 0; i < geo->ecc_chunkn_size; i++) {
+		flip_bits += hweight8(~chunkbuf[base + i]);
+	}
+
+
 	/* Tell the upper layer the bitflips we corrected. */
 	mtd->ecc_stats.corrected += flip_bits;
 	*max_bitflips = max_t(unsigned int, *max_bitflips, flip_bits);
-- 
2.7.4
