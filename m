Date: Thu, 13 Feb 2014 14:21:44 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd: remove some duplicative checks
Message-ID: <20140213112144.GD15549@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"rc" is an error code here, no need to check it a second time.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 233b946e5d66..d1cbf26db2c0 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -602,8 +602,7 @@ static int mark_sector_deleted(struct partition *part, u_long old_addr)
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at "
 			"0x%lx\n", part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		goto err;
 	}
 	if (block == part->current_block)
 		part->header_cache[offset + HEADER_MAP_OFFSET] = del;
@@ -675,8 +674,7 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at 0x%lx\n",
 				part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		goto err;
 	}
 
 	part->sector_map[sector] = addr;
@@ -695,8 +693,7 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at 0x%lx\n",
 				part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		goto err;
 	}
 	block->used_sectors++;
 	block->free_sectors--;
