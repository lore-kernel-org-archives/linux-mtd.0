Received: from co1ehsobe002.messaging.microsoft.com ([216.32.180.185]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1YCg-0003xe-Ls
 for linux-mtd@lists.infradead.org; Fri, 10 Jan 2014 09:16:35 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V2 fix] mtd: gpmi: fix the bitflips for erased page
Date: Fri, 10 Jan 2014 16:41:38 +0800
Message-ID: <1389343298-22473-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1389343044-22351-1-git-send-email-b32955@freescale.com>
References: <1389343044-22351-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: eliedebrauwer@gmail.com, bpringlemeir@nbsps.com,
 Huang Shijie <b32955@freescale.com>, Vikram.Narayanan@in.bosch.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We may meet the bitflips in reading an erased page(contains all 0xFF),
this may causes the UBIFS corrupt, please see the log from Elie:

-----------------------------------------------------------------
[    3.831323] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.845026] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.858710] UBI warning: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read only 16384 bytes, retry
[    3.872408] UBI error: ubi_io_read: error -74 (ECC error) while reading 16384 bytes from PEB 443:245760, read 16384 bytes
...
[    4.011529] UBIFS error (pid 36): ubifs_recover_leb: corrupt empty space LEB 27:237568, corruption starts at 9815
[    4.021897] UBIFS error (pid 36): ubifs_scanned_corruption: corruption at LEB 27:247383
[    4.030000] UBIFS error (pid 36): ubifs_scanned_corruption: first 6569 bytes from LEB 27:247383
-----------------------------------------------------------------

This patch does a check for the uncorrectable failure in the following steps:

   [0] set the threshold.
       The threshold is set based on the truth:
         "A single 0 bit will lead to gf_len(13 or 14) bits 0 after the BCH
          do the ECC."

       For the sake of safe, we will set the threshold with half the gf_len, and
       do not make it bigger the ECC strength.

   [1] count the bitflips of the current ECC chunk, assume it is N.

   [2] if the (N <= threshold) is true, we continue to read out the page with
       ECC disabled. and we count the bitflips again, assume it is N2.

   [3] if the (N2 <= threshold) is true again, we can regard this is a erased
       page. This is because a real erased page is full of 0xFF(maybe also has
       several bitflips), while a page contains the 0xFF data will definitely
       has many bitflips in the ECC parity area.

   [4] if the [3] fails, we can regard this is a page filled with the '0xFF'
       data.

Tested-by: Elie De Brauwer <eliedebrauwer@gmail.com>
Reported-by: Elie De Brauwer <eliedebrauwer@gmail.com>
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
  fix the comment.
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c |   51 ++++++++++++++++++++++++++++++++
 1 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
index e2f5820..533f25f 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -958,6 +958,53 @@ static void block_mark_swapping(struct gpmi_nand_data *this,
 	p[1] = (p[1] & mask) | (from_oob >> (8 - bit));
 }
 
+static bool gpmi_erased_check(struct gpmi_nand_data *this,
+			unsigned char *data, unsigned int chunk, int page,
+			unsigned int *max_bitflips)
+{
+	struct nand_chip *chip = &this->nand;
+	struct mtd_info	*mtd = &this->mtd;
+	struct bch_geometry *geo = &this->bch_geometry;
+	int base = geo->ecc_chunk_size * chunk;
+	unsigned int flip_bits = 0, flip_bits_noecc = 0;
+	uint8_t *buf = this->data_buffer_dma;
+	unsigned int threshold;
+	int i;
+
+	threshold = geo->gf_len / 2;
+	if (threshold > geo->ecc_strength)
+		threshold = geo->ecc_strength;
+
+	/* Count bitflips */
+	for (i = 0; i < geo->ecc_chunk_size; i++)
+		flip_bits += hweight8(~data[base + i]);
+
+	if (flip_bits <= threshold) {
+		dev_dbg(this->dev, "check for the erased page:%d, chunk:%d\n",
+				page, chunk);
+
+		/* Read out the page without ECC enabled, and check it again */
+		chip->cmdfunc(mtd, NAND_CMD_READ0, 0, page);
+		chip->read_buf(mtd, buf, geo->payload_size);
+
+		/* Count the bitflips for the no ECC buffer */
+		for (i = 0; i < geo->payload_size; i++)
+			flip_bits_noecc += hweight8(~buf[i]);
+
+		if (flip_bits_noecc <= threshold) {
+			dev_dbg(this->dev, "find an erased page %d(%d:%d)\n",
+					page, flip_bits, flip_bits_noecc);
+
+			/* Tell the upper layer the bitflips we corrected. */
+			*max_bitflips = max_t(unsigned int, *max_bitflips,
+						flip_bits);
+			memset(data, 0xff, geo->payload_size);
+			return true;
+		}
+	}
+	return false;
+}
+
 static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 				uint8_t *buf, int oob_required, int page)
 {
@@ -1007,6 +1054,10 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd, struct nand_chip *chip,
 			continue;
 
 		if (*status == STATUS_UNCORRECTABLE) {
+			if (gpmi_erased_check(this, payload_virt, i,
+						page, &max_bitflips))
+				break;
+
 			mtd->ecc_stats.failed++;
 			continue;
 		}
-- 
1.7.2.rc3
