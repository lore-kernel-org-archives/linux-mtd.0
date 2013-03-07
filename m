Received: from mail-ee0-f42.google.com ([74.125.83.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDVmw-0003XT-Pt
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2013 08:02:56 +0000
Received: by mail-ee0-f42.google.com with SMTP id b47so96979eek.29
 for <linux-mtd@lists.infradead.org>; Thu, 07 Mar 2013 00:02:53 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Subject: [FIX 3.9][PATCH 2/2] mtd: bcm47xxpart: look for NVRAM at the end of
 device
Date: Thu,  7 Mar 2013 09:02:39 +0100
Message-Id: <1362643359-27955-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1362643359-27955-1-git-send-email-zajec5@gmail.com>
References: <1362643359-27955-1-git-send-email-zajec5@gmail.com>
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

NVRAM is always placed at the end of device and it does not have to
start at the beginning of a block, so check few possible offsets.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c |   32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 4552afb..9279a91 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -63,6 +63,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	struct trx_header *trx;
 	int trx_part = -1;
 	int last_trx_part = -1;
+	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
 
 	if (blocksize <= 0x10000)
 		blocksize = 0x10000;
@@ -99,13 +100,6 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 
-		/* Standard NVRAM */
-		if (buf[0x000 / 4] == NVRAM_HEADER) {
-			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
-					     offset, 0);
-			continue;
-		}
-
 		/*
 		 * board_data starts with board_id which differs across boards,
 		 * but we can use 'MPFR' (hopefully) magic at 0x100
@@ -174,6 +168,30 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 			continue;
 		}
 	}
+
+	/* Look for NVRAM at the end of the last block. */
+	for (i = 0; i < ARRAY_SIZE(possible_nvram_sizes); i++) {
+		if (curr_part > BCM47XXPART_MAX_PARTS) {
+			pr_warn("Reached maximum number of partitions, scanning stopped!\n");
+			break;
+		}
+
+		offset = master->size - possible_nvram_sizes[i];
+		if (mtd_read(master, offset, 0x4, &bytes_read,
+			     (uint8_t *)buf) < 0) {
+			pr_err("mtd_read error while reading at offset 0x%X!\n",
+			       offset);
+			continue;
+		}
+
+		/* Standard NVRAM */
+		if (buf[0] == NVRAM_HEADER) {
+			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
+					     master->size - blocksize, 0);
+			break;
+		}
+	}
+
 	kfree(buf);
 
 	/*
-- 
1.7.10.4
