Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aEjod-0002Fa-L8
 for linux-mtd@lists.infradead.org; Thu, 31 Dec 2015 20:27:20 +0000
Subject: [PATCH 2/3] mtd-rfd_ftl: Refactoring for move_block_contents()
To: linux-mtd@lists.infradead.org, Brian Norris
 <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <56858E3A.7000706@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Julia Lawall <julia.lawall@lip6.fr>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <56858F8E.7050307@users.sourceforge.net>
Date: Thu, 31 Dec 2015 21:26:54 +0100
MIME-Version: 1.0
In-Reply-To: <56858E3A.7000706@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Dec 2015 20:54:50 +0100

This issue was detected by using the Coccinelle software.

Rename jump labels according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 2927e1b..9b59423 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -366,13 +366,13 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 	sector_data = kmalloc(SECTOR_SIZE, GFP_KERNEL);
 	if (!sector_data) {
 		rc = -ENOMEM;
-		goto err3;
+		goto reset_reclaim;
 	}
 
 	map = kmalloc(part->header_size, GFP_KERNEL);
 	if (!map) {
 		rc = -ENOMEM;
-		goto err2;
+		goto free_sector;
 	}
 
 	rc = mtd_read(part->mbd.mtd, part->blocks[block_no].offset,
@@ -385,8 +385,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 		printk(KERN_ERR PREFIX "error reading '%s' at "
 			"0x%lx\n", part->mbd.mtd->name,
 			part->blocks[block_no].offset);
-
-		goto err;
+		goto free_map;
 	}
 
 	for (i=0; i<part->data_sectors_per_block; i++) {
@@ -417,7 +416,6 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 		}
 		rc = mtd_read(part->mbd.mtd, addr, SECTOR_SIZE, &retlen,
 			      sector_data);
-
 		if (!rc && retlen != SECTOR_SIZE)
 			rc = -EIO;
 
@@ -425,24 +423,20 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 			printk(KERN_ERR PREFIX "'%s': Unable to "
 				"read sector for relocation\n",
 				part->mbd.mtd->name);
-
-			goto err;
+			goto free_map;
 		}
 
 		rc = rfd_ftl_writesect((struct mtd_blktrans_dev*)part,
 				entry, sector_data);
-
 		if (rc)
-			goto err;
+			goto free_map;
 	}
-
-err:
+free_map:
 	kfree(map);
-err2:
+free_sector:
 	kfree(sector_data);
-err3:
+reset_reclaim:
 	part->is_reclaiming = 0;
-
 	return rc;
 }
 
-- 
2.6.3
