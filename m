Received: from mout.web.de ([212.227.15.3])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eXq8W-00026D-Hg
 for linux-mtd@lists.infradead.org; Sat, 06 Jan 2018 15:11:54 +0000
Subject: [PATCH 5/5] mtd/rfd_ftl: Add some spaces for better code readability
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Message-ID: <847904e4-c5a2-0716-24ae-c2ac085fe3a3@users.sourceforge.net>
Date: Sat, 6 Jan 2018 16:11:38 +0100
MIME-Version: 1.0
In-Reply-To: <a595376a-c343-33ea-8607-370b88e19c61@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 Jan 2018 15:47:01 +0100

Use space characters at some source code places according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/rfd_ftl.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index e3155ec4be64..b6cc3690b9ed 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -103,7 +103,7 @@ static int build_block_map(struct partition *part, int block_no)
 
 	block->state = BLOCK_OK;
 
-	for (i=0; i<part->data_sectors_per_block; i++) {
+	for (i = 0; i < part->data_sectors_per_block; i++) {
 		u16 entry;
 
 		entry = le16_to_cpu(part->header_cache[HEADER_MAP_OFFSET + i]);
@@ -193,10 +193,10 @@ static int scan_header(struct partition *part)
 	if (!part->sector_map)
 		goto free_blocks;
 
-	for (i=0; i<part->sector_count; i++)
+	for (i = 0; i < part->sector_count; i++)
 		part->sector_map[i] = -1;
 
-	for (i=0, blocks_found=0; i<part->total_blocks; i++) {
+	for (i = 0, blocks_found = 0; i < part->total_blocks; i++) {
 		rc = mtd_read(part->mbd.mtd, i * part->block_size,
 			      part->header_size, &retlen,
 			      (u_char *)part->header_cache);
@@ -380,7 +380,7 @@ static int move_block_contents(struct partition *part, int block_no, u_long *old
 		goto err;
 	}
 
-	for (i=0; i<part->data_sectors_per_block; i++) {
+	for (i = 0; i < part->data_sectors_per_block; i++) {
 		u16 entry = le16_to_cpu(map[HEADER_MAP_OFFSET + i]);
 		u_long addr;
 
@@ -452,7 +452,7 @@ static int reclaim_block(struct partition *part, u_long *old_sector)
 	else
 		old_sector_block = -1;
 
-	for (block=0; block<part->total_blocks; block++) {
+	for (block = 0; block < part->total_blocks; block++) {
 		int this_score;
 
 		if (block == part->reserved_block)
@@ -625,8 +625,7 @@ static int find_free_sector(const struct partition *part, const struct block *bl
 
 		if (++i == part->data_sectors_per_block)
 			i = 0;
-	}
-	while(i != stop);
+	} while (i != stop);
 
 	return -1;
 }
@@ -718,7 +717,7 @@ static int rfd_ftl_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *
 
 	old_addr = part->sector_map[sector];
 
-	for (i=0; i<SECTOR_SIZE; i++) {
+	for (i = 0; i < SECTOR_SIZE; i++) {
 		if (!buf[i])
 			continue;
 
@@ -799,10 +798,9 @@ static void rfd_ftl_remove_dev(struct mtd_blktrans_dev *dev)
 	struct partition *part = (struct partition*)dev;
 	int i;
 
-	for (i=0; i<part->total_blocks; i++) {
+	for (i = 0; i < part->total_blocks; i++)
 		pr_debug("rfd_ftl_remove_dev:'%s': erase unit #%02d: %d erases\n",
 			part->mbd.mtd->name, i, part->blocks[i].erases);
-	}
 
 	del_mtd_blktrans_dev(dev);
 	vfree(part->sector_map);
-- 
2.15.1
