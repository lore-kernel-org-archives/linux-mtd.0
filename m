Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ0b9-00082B-Am
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 14:38:53 +0000
Received: by pdbnt7 with SMTP id nt7so27742180pdb.0
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 07:38:26 -0700 (PDT)
From: Joseph East <eastyjr@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joseph East <eastyjr@gmail.com>
Subject: [PATCH V2 2/4] mtd: bcm47xxpart.c: Adding Xaiomi board support
Date: Sun, 26 Jul 2015 00:07:41 +0930
Message-Id: <1437835063-58407-3-git-send-email-eastyjr@gmail.com>
In-Reply-To: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
References: <1437835063-58407-1-git-send-email-eastyjr@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 drivers/mtd/bcm47xxpart.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index 55a1462..a27d185 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -33,6 +33,7 @@
 /* Magics */
 #define BOARD_DATA_MAGIC		0x5246504D	/* MPFR */
 #define BOARD_DATA_MAGIC2		0xBD0D0BBD
+#define BOARD_DATA_XIAOMI_MAGIC	0x474D4442	/* GMDB */
 #define CFE_MAGIC			0x43464531	/* 1EFC */
 #define FACTORY_MAGIC			0x59544346	/* FCTY */
 #define NVRAM_HEADER			0x48534C46	/* FLSH */
@@ -263,7 +264,8 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		}
 
 		/* Some devices (ex. WNDR3700v3) don't have a standard 'MPFR' */
-		if (buf[0x000 / 4] == BOARD_DATA_MAGIC2) {
+		if (buf[0x000 / 4] == BOARD_DATA_MAGIC2 ||
+		    le32_to_cpu(buf[0x000 / 4]) == BOARD_DATA_XIAOMI_MAGIC) {
 			bcm47xxpart_add_part(&parts[curr_part++], "board_data",
 					     offset, MTD_WRITEABLE);
 			continue;
-- 
2.4.6
