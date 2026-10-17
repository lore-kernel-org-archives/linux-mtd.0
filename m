Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2054CCF2C1
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IelljBWDc1TELrY7G59ZJB9INVEiw25TjZLCpIBY+8w=; b=cR2VMsM0pRHGoC
	Id84Mj3caPkvXEkfmq82WlMMInGbZiROuB2p2r7aG85i979fPBF2fIwaG+rA61ULuiNuQqusnp0LB
	J/sxSa38dCppEwMJd8gw6t3h7kKuebSWNYwPZZVvRw0dE8nhjKAiA3OH5COxkD3vyIaB36Jj1kkKH
	maB4z7KpxR+HmrqH5vthCgdDiGknQJuqH5ImOlgmK9blA8MnKGjl4whwqWsGioBqI0JhmKrnyi611
	wDT561EopPBOSdGgTgGI2lYIIdvlG/07eh8sbRkseYEo38idLRLYVvFR6N7lkyJrQQJIJCNsm+ZMQ
	ytSiTMGl8WKK7zKrzZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7uZ-00000004yn7-3OmK;
	Sat, 17 Oct 2026 17:09:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7uY-00000004ymy-0mvG
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 17:09:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DD55600C8;
	Sat, 17 Oct 2026 17:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF2C1F000C4;
	Sat, 17 Oct 2026 17:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792256972;
	bh=aURU4A4B0OSOMTeGeRtTJD8EebyvSal/BX8oXItAnLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wegQ0Xlg3uzQsBNfMF1N1UdHzXlw/HYelpZtfsW9NIPBaQe4cnMhOC/7VUOqjwjjc
	 JokpsgHwRfzEmiqWgneldnyQbtnMbD8TgZYovp3s68DuA7LhBWxvlw8nJezMQ2altj
	 iLro0qV9S6Jr+dZFkWh4aFjPznPO+C5ZWjFtgDnY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Joern Engel <joern@lazybastard.org>,
	linux-mtd@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.6 0411/1674] mtd: block2mtd: Convert to bdev_open_by_dev/path()
Date: Sat, 17 Oct 2026 17:44:43 +0200
Message-ID: <20261017160441.674042808@linuxfoundation.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261017160431.119607952@linuxfoundation.org>
References: <20261017160431.119607952@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

6.6-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jan Kara <jack@suse.cz>

[ Upstream commit 3817d4b11212ca9d49d6e7141d41524aa48791c5 ]

Convert block2mtd to use bdev_open_by_dev() and bdev_open_by_path() and
pass the handle around.

CC: Joern Engel <joern@lazybastard.org>
CC: linux-mtd@lists.infradead.org
Acked-by: Christoph Hellwig <hch@lst.de>
Acked-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Jan Kara <jack@suse.cz>
Link: https://lore.kernel.org/r/20230927093442.25915-12-jack@suse.cz
Signed-off-by: Christian Brauner <brauner@kernel.org>
Stable-dep-of: b5965c422116 ("mtd: block2mtd: Fix divide error when erase_size is zero")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/mtd/devices/block2mtd.c | 51 +++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index be106dc20ff3c..aa44a23ec0451 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -37,7 +37,7 @@
 /* Info for the block device */
 struct block2mtd_dev {
 	struct list_head list;
-	struct block_device *blkdev;
+	struct bdev_handle *bdev_handle;
 	struct mtd_info mtd;
 	struct mutex write_mutex;
 };
@@ -55,7 +55,8 @@ static struct page *page_read(struct address_space *mapping, pgoff_t index)
 /* erase a specified part of the device */
 static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 {
-	struct address_space *mapping = dev->blkdev->bd_inode->i_mapping;
+	struct address_space *mapping =
+				dev->bdev_handle->bdev->bd_inode->i_mapping;
 	struct page *page;
 	pgoff_t index = to >> PAGE_SHIFT;	// page index
 	int pages = len >> PAGE_SHIFT;
@@ -105,6 +106,8 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct block2mtd_dev *dev = mtd->priv;
+	struct address_space *mapping =
+				dev->bdev_handle->bdev->bd_inode->i_mapping;
 	struct page *page;
 	pgoff_t index = from >> PAGE_SHIFT;
 	int offset = from & (PAGE_SIZE-1);
@@ -117,7 +120,7 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 			cpylen = len;	// this page
 		len = len - cpylen;
 
-		page = page_read(dev->blkdev->bd_inode->i_mapping, index);
+		page = page_read(mapping, index);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
 
@@ -139,7 +142,8 @@ static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
 		loff_t to, size_t len, size_t *retlen)
 {
 	struct page *page;
-	struct address_space *mapping = dev->blkdev->bd_inode->i_mapping;
+	struct address_space *mapping =
+				dev->bdev_handle->bdev->bd_inode->i_mapping;
 	pgoff_t index = to >> PAGE_SHIFT;	// page index
 	int offset = to & ~PAGE_MASK;	// page offset
 	int cpylen;
@@ -194,7 +198,7 @@ static int block2mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 static void block2mtd_sync(struct mtd_info *mtd)
 {
 	struct block2mtd_dev *dev = mtd->priv;
-	sync_blockdev(dev->blkdev);
+	sync_blockdev(dev->bdev_handle->bdev);
 	return;
 }
 
@@ -206,10 +210,10 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 
 	kfree(dev->mtd.name);
 
-	if (dev->blkdev) {
-		invalidate_mapping_pages(dev->blkdev->bd_inode->i_mapping,
-					0, -1);
-		blkdev_put(dev->blkdev, NULL);
+	if (dev->bdev_handle) {
+		invalidate_mapping_pages(
+			dev->bdev_handle->bdev->bd_inode->i_mapping, 0, -1);
+		bdev_release(dev->bdev_handle);
 	}
 
 	kfree(dev);
@@ -219,10 +223,10 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
  * This function is marked __ref because it calls the __init marked
  * early_lookup_bdev when called from the early boot code.
  */
-static struct block_device __ref *mdtblock_early_get_bdev(const char *devname,
+static struct bdev_handle __ref *mdtblock_early_get_bdev(const char *devname,
 		blk_mode_t mode, int timeout, struct block2mtd_dev *dev)
 {
-	struct block_device *bdev = ERR_PTR(-ENODEV);
+	struct bdev_handle *bdev_handle = ERR_PTR(-ENODEV);
 #ifndef MODULE
 	int i;
 
@@ -230,7 +234,7 @@ static struct block_device __ref *mdtblock_early_get_bdev(const char *devname,
 	 * We can't use early_lookup_bdev from a running system.
 	 */
 	if (system_state >= SYSTEM_RUNNING)
-		return bdev;
+		return bdev_handle;
 
 	/*
 	 * We might not have the root device mounted at this point.
@@ -249,19 +253,20 @@ static struct block_device __ref *mdtblock_early_get_bdev(const char *devname,
 		wait_for_device_probe();
 
 		if (!early_lookup_bdev(devname, &devt)) {
-			bdev = blkdev_get_by_dev(devt, mode, dev, NULL);
-			if (!IS_ERR(bdev))
+			bdev_handle = bdev_open_by_dev(devt, mode, dev, NULL);
+			if (!IS_ERR(bdev_handle))
 				break;
 		}
 	}
 #endif
-	return bdev;
+	return bdev_handle;
 }
 
 static struct block2mtd_dev *add_device(char *devname, int erase_size,
 		char *label, int timeout)
 {
 	const blk_mode_t mode = BLK_OPEN_READ | BLK_OPEN_WRITE;
+	struct bdev_handle *bdev_handle;
 	struct block_device *bdev;
 	struct block2mtd_dev *dev;
 	char *name;
@@ -274,21 +279,23 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 		return NULL;
 
 	/* Get a handle on the device */
-	bdev = blkdev_get_by_path(devname, mode, dev, NULL);
-	if (IS_ERR(bdev))
-		bdev = mdtblock_early_get_bdev(devname, mode, timeout, dev);
-	if (IS_ERR(bdev)) {
+	bdev_handle = bdev_open_by_path(devname, mode, dev, NULL);
+	if (IS_ERR(bdev_handle))
+		bdev_handle = mdtblock_early_get_bdev(devname, mode, timeout,
+						      dev);
+	if (IS_ERR(bdev_handle)) {
 		pr_err("error: cannot open device %s\n", devname);
 		goto err_free_block2mtd;
 	}
-	dev->blkdev = bdev;
+	dev->bdev_handle = bdev_handle;
+	bdev = bdev_handle->bdev;
 
 	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
 		pr_err("attempting to use an MTD device as a block device\n");
 		goto err_free_block2mtd;
 	}
 
-	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
+	if ((long)bdev->bd_inode->i_size % erase_size) {
 		pr_err("erasesize must be a divisor of device size\n");
 		goto err_free_block2mtd;
 	}
@@ -306,7 +313,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	dev->mtd.name = name;
 
-	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.size = bdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = 1;
 	dev->mtd.writebufsize = PAGE_SIZE;
-- 
2.53.0




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
