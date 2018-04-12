Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f6Uk5-0004xv-IO
 for linux-mtd@lists.infradead.org; Thu, 12 Apr 2018 05:25:55 +0000
Received: by mail-lf0-x242.google.com with SMTP id m200-v6so5820797lfm.4
 for <linux-mtd@lists.infradead.org>; Wed, 11 Apr 2018 22:25:42 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] mtd: bcm47xxpart: improve handling TRX partition size
Date: Thu, 12 Apr 2018 07:24:52 +0200
Message-Id: <20180412052452.11498-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Rafał Miłecki <rafal@milecki.pl>

When bcm47xxpart finds a TRX partition (container) it's supposed to jump
to the end of it and keep looking for more partitions. TRX and its
subpartitions are handled be a separated parser.

The problem with old code was relying on the length specified in a TRX
header. That isn't reliable as TRX is commonly modified to have checksum
cover only non-changing subpartitions. Otherwise modifying e.g. a rootfs
would result in CRC32 mismatch and bootloader refusing to boot a
firmware.

Fix it by trying better to figure out a real TRX size. We can securely
assume that TRX has to cover all subpartitions and the last one is at
least of a block size in size. Then compare it with a length field.

This makes code more optimal & reliable thanks to skipping data that
shouldn't be parsed.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/mtd/bcm47xxpart.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index fe2581d9d882..1f0239848ebe 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -186,6 +186,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		/* TRX */
 		if (buf[0x000 / 4] == TRX_MAGIC) {
 			struct trx_header *trx;
+			uint32_t last_subpart;
+			uint32_t trx_size;
 
 			if (trx_num >= ARRAY_SIZE(trx_parts))
 				pr_warn("No enough space to store another TRX found at 0x%X\n",
@@ -195,11 +197,23 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			bcm47xxpart_add_part(&parts[curr_part++], "firmware",
 					     offset, 0);
 
-			/* Jump to the end of TRX */
+			/*
+			 * Try to find TRX size. The "length" field isn't fully
+			 * reliable as it could be decreased to make CRC32 cover
+			 * only part of TRX data. It's commonly used as checksum
+			 * can't cover e.g. ever-changing rootfs partition.
+			 * Use offsets as helpers for assuming min TRX size.
+			 */
 			trx = (struct trx_header *)buf;
-			offset = roundup(offset + trx->length, blocksize);
-			/* Next loop iteration will increase the offset */
-			offset -= blocksize;
+			last_subpart = max3(trx->offset[0], trx->offset[1],
+					    trx->offset[2]);
+			trx_size = max(trx->length, last_subpart + blocksize);
+
+			/*
+			 * Skip the TRX data. Decrease offset by block size as
+			 * the next loop iteration will increase it.
+			 */
+			offset += roundup(trx_size, blocksize) - blocksize;
 			continue;
 		}
 
-- 
2.12.0
