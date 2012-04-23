Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMGpC-0002Dn-DJ
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 10:48:54 +0000
Received: by dadn15 with SMTP id n15so18781556dad.16
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 03:48:51 -0700 (PDT)
Subject: [PATCH] mtd: block2mtd: page_read() never returns NULL
From: Ryosuke Saito <raitosyo@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 Apr 2012 19:47:17 +0900
Message-ID: <1335178037.3060.7.camel@HDL00099>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: artem.bityutskiy@linux.intel.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

page_read() never returns NULL, so we can remove the NULL check here.

Signed-off-by: Ryosuke Saito <raitosyo@gmail.com>
---
 drivers/mtd/devices/block2mtd.c |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index a4a80b7..300aeb8 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -52,8 +52,6 @@ static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 
 	while (pages) {
 		page = page_read(mapping, index);
-		if (!page)
-			return -ENOMEM;
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
@@ -112,8 +110,6 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 		len = len - cpylen;
 
 		page = page_read(dev->blkdev->bd_inode->i_mapping, index);
-		if (!page)
-			return -ENOMEM;
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
@@ -148,8 +144,6 @@ static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 		len = len - cpylen;
 
 		page = page_read(mapping, index);
-		if (!page)
-			return -ENOMEM;
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
-- 
1.7.9.6
