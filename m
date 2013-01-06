Received: from mail-bk0-f48.google.com ([209.85.214.48])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Trrq8-0000TQ-TS
 for linux-mtd@lists.infradead.org; Sun, 06 Jan 2013 15:08:45 +0000
Received: by mail-bk0-f48.google.com with SMTP id jc3so7904806bkc.21
 for <linux-mtd@lists.infradead.org>; Sun, 06 Jan 2013 07:08:42 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [PATCH 2/2] mtd: bcm47xxpart: register extra "firmware" partition
Date: Sun,  6 Jan 2013 16:08:36 +0100
Message-Id: <1357484916-29965-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1357484916-29965-1-git-send-email-zajec5@gmail.com>
References: <1357484916-29965-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's required for accessing trx header (usually re-calculating a
checksum) and for writing a new firmware.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
I've checked this patch and got:
> Successfully built configuration "mips-bcm47xx_defconfig,mips,mips-linux-", no issues

I've also succesfully installed new firmware using
mtd -r write /tmp/openwrt-brcm47xx-squashfs-noloader-wndr4500.trx firmware
---
 drivers/mtd/bcm47xxpart.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 06125eb..3411bc2 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -61,6 +61,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	uint32_t offset;
 	uint32_t blocksize = 0x10000;
 	struct trx_header *trx;
+	int trx_part = -1;
+	int last_trx_part = -1;
 
 	/* Alloc */
 	parts = kzalloc(sizeof(struct mtd_partition) * BCM47XXPART_MAX_PARTS,
@@ -131,6 +133,10 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		if (buf[0x000 / 4] == TRX_MAGIC) {
 			trx = (struct trx_header *)buf;
 
+			trx_part = curr_part;
+			bcm47xxpart_add_part(&parts[curr_part++], "firmware",
+					     offset, 0);
+
 			i = 0;
 			/* We have LZMA loader if offset[2] points to sth */
 			if (trx->offset[2]) {
@@ -154,6 +160,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 					     offset + trx->offset[i], 0);
 			i++;
 
+			last_trx_part = curr_part - 1;
+
 			/*
 			 * We have whole TRX scanned, skip to the next part. Use
 			 * roundown (not roundup), as the loop will increase
@@ -174,6 +182,9 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 				       parts[i + 1].offset : master->size;
 
 		parts[i].size = next_part_offset - parts[i].offset;
+		if (i == last_trx_part && trx_part >= 0)
+			parts[trx_part].size = next_part_offset -
+					       parts[trx_part].offset;
 	}
 
 	*pparts = parts;
-- 
1.7.7
