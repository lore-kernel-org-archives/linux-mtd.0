Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZJ0b5-00081o-5X
 for linux-mtd@lists.infradead.org; Sat, 25 Jul 2015 14:38:49 +0000
Received: by pacan13 with SMTP id an13so28799680pac.1
 for <linux-mtd@lists.infradead.org>; Sat, 25 Jul 2015 07:38:22 -0700 (PDT)
From: Joseph East <eastyjr@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joseph East <eastyjr@gmail.com>
Subject: [PATCH V2 1/4] mtd: bcm47xxpart.c: NVRAM partition handling
Date: Sun, 26 Jul 2015 00:07:40 +0930
Message-Id: <1437835063-58407-2-git-send-email-eastyjr@gmail.com>
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
 drivers/mtd/bcm47xxpart.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/bcm47xxpart.c b/drivers/mtd/bcm47xxpart.c
index c0720c1..55a1462 100644
--- a/drivers/mtd/bcm47xxpart.c
+++ b/drivers/mtd/bcm47xxpart.c
@@ -95,6 +95,7 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 	int trx_part = -1;
 	int last_trx_part = -1;
 	int possible_nvram_sizes[] = { 0x8000, 0xF000, 0x10000, };
+	bool found_nvram = false;
 
 	/*
 	 * Some really old flashes (like AT45DB*) had smaller erasesize-s, but
@@ -288,12 +289,23 @@ static int bcm47xxpart_parse(struct mtd_info *master,
 		if (buf[0] == NVRAM_HEADER) {
 			bcm47xxpart_add_part(&parts[curr_part++], "nvram",
 					     master->size - blocksize, 0);
+			found_nvram = true;
 			break;
 		}
 	}
 
 	kfree(buf);
 
+	if (!found_nvram) {
+		pr_warning("Cannot find a nvram partition, reserving last two blocks\n");
+		bcm47xxpart_add_part(&parts[curr_part++], "nvram_guess",
+				     master->size - blocksize * 2, MTD_WRITEABLE);
+		for (i = 0; i < curr_part; i++) {
+			if (parts[i].size + parts[i].offset == master->size)
+				parts[i].offset -= blocksize * 2;
+		}
+	}
+
 	/*
 	 * Assume that partitions end at the beginning of the one they are
 	 * followed by.
-- 
2.4.6
