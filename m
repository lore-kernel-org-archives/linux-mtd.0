Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxW5p-0004RM-Vc
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 09:26:29 +0000
Received: by mail-lf0-x242.google.com with SMTP id b75so4878527lfg.3
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 02:26:05 -0700 (PDT)
Received: from gmail.com (inno-commagility-ownrouter.lut.ac.uk.
 [131.231.60.35])
 by smtp.gmail.com with ESMTPSA id jb2sm1821504wjb.44.2016.10.21.02.26.03
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Oct 2016 02:26:03 -0700 (PDT)
Date: Fri, 21 Oct 2016 10:26:05 +0100
From: Ville Michael Baillie <ville.michael.baillie@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: nand: davinci: Fix unaligned 16-bit NAND read
Message-ID: <20161021092605.GA14609@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes a rare bug when reading from 16-bit NAND flashes, by
not allowing 8-bit read accesses within nand_davinci_read_buf().

In certain situations, an non 16-bit aligned buffer is passed to
nand_davinci_read_buf(), which causes 8-bit accesses to be performed.
However, the NAND will be returning 16-bit words, and half of these will
be discarded.

This was observed when running mtd_stresstest.ko, which would report ECC
errors when reading from a non 16-bit aligned offset into a page, and
reading at least one subsequent page in the same read.

Signed-off-by: Ville Michael Baillie <ville.michael.baillie@gmail.com>
---
 drivers/mtd/nand/davinci_nand.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 27fa8b8..ed9cd0d 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -442,12 +442,24 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
 static void nand_davinci_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+	u16 tmp;
 
 	if ((0x03 & ((unsigned)buf)) == 0 && (0x03 & len) == 0)
 		ioread32_rep(chip->IO_ADDR_R, buf, len >> 2);
 	else if ((0x01 & ((unsigned)buf)) == 0 && (0x01 & len) == 0)
 		ioread16_rep(chip->IO_ADDR_R, buf, len >> 1);
-	else
+	else if (chip->options & NAND_BUSWIDTH_16) {
+		/*
+		 * if NAND buswidth is 16 then 8 bit accesses
+		 * will silently discard half the data
+		 */
+		len /= 2;
+		while (len--) {
+			tmp = ioread16(chip->IO_ADDR_R);
+			memcpy(buf, &tmp, sizeof(u16));
+			buf += sizeof(u16);
+		}
+	} else
 		ioread8_rep(chip->IO_ADDR_R, buf, len);
 }
 
-- 
2.1.4
