Received: from mail-ea0-x234.google.com ([2a00:1450:4013:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VuRSl-0006By-09
 for linux-mtd@lists.infradead.org; Sat, 21 Dec 2013 18:39:48 +0000
Received: by mail-ea0-f180.google.com with SMTP id f15so1611464eak.25
 for <linux-mtd@lists.infradead.org>; Sat, 21 Dec 2013 10:39:24 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd: bcm47xxpart: alternative MAGIC for board_data
 partition
Date: Sat, 21 Dec 2013 19:39:12 +0100
Message-Id: <1387651152-3884-2-git-send-email-zajec5@gmail.com>
In-Reply-To: <1387651152-3884-1-git-send-email-zajec5@gmail.com>
References: <1387651152-3884-1-git-send-email-zajec5@gmail.com>
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

Some devices (like WNDR3700v3) have board_data without MPFR magic, some
extra header or extra NVRAM around 0x100. In such case we have to look
for another magic which is BD 0B 0D BD (BD probably stands for Board
Data). It's located "far far away", so instead extending buffer add
another mtd_read.

Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
---
 drivers/mtd/bcm47xxpart.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index b72a3ac..91f32f2 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -27,6 +27,7 @@
 
 /* Magics */
 #define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
+#define BOARD_DATA_MAGIC2		0xBD0D0BBD
 #define CFE_MAGIC			0x43464531	/* 1EFC */
 #define FACTORY_MAGIC			0x59544346	/* FCTY */
 #define POT_MAGIC1			0x54544f50	/* POTT */
@@ -192,6 +193,21 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 					     offset, 0);
 			continue;
 		}
+
+		/* Read middle of the block */
+		if (mtd_read(master, offset + 0x8000, 0x4,
+			     &bytes_read, (uint8_t *)buf) < 0) {
+			pr_err("mtd_read error while parsing (offset: 0x%X)!\n",
+			       offset);
+			continue;
+		}
+
+		/* Some devices (ex. WNDR3700v3) don't have a standard 'MPFR' */
+		if (buf[0x000 / 4] == BOARD_DATA_MAGIC2) {
+			bcm47xxpart_add_part(&parts[curr_part++], "board_data",
+					     offset, MTD_WRITEABLE);
+			continue;
+		}
 	}
 
 	/* Look for NVRAM at the end of the last block. */
-- 
1.7.10.4
