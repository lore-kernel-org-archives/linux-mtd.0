Return-Path: <SRS0=DRVm=PC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211F2C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECAB60F36
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Oct 2021 14:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CECAB60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLiGkzCVuvi/quM+q1lhX2RcIbdcAnymgQbnhEhsSdM=; b=vWfTQ3cYmbqdR4
	5ki1t84q2B7BEm8eomqLC5YM3/uPB2r2lq8s5gRy5TEgRhuU8PhMY43ZQeItLWjSJ6edQ+U+kHS5L
	wjl84ayZxujNZhV7FBvFrPJdNk7ozzcJalbB4lGCzKtYartxOzVU9gny9+HZ1f7PLg+eG86e0oQ8b
	KfHCXPl3qfMg4oQcPpIWU/UphktgZlTt+kc8K0dJEbKgV6T8f16i6Nft1rg350Cs6DF42lxTB8ALj
	iKcrSr61WU9OAbfPp3HBsZTYxQwt9/QQiVzFbiQCk5zJoZ3oVYuKhwt+yu+ul/jurFi5T+dlspX5U
	HXIdFdqAne1vJUQ84J8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mb25s-003VbZ-Pu; Thu, 14 Oct 2021 14:52:28 +0000
Received: from [2001:4bb8:199:73c5:b1be:a02d:b459:cc1a] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mb25f-003VXB-6H; Thu, 14 Oct 2021 14:52:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd/block2mtd: don't poke into block layer internals
Date: Thu, 14 Oct 2021 16:52:06 +0200
Message-Id: <20211014145206.1488967-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014145206.1488967-1-hch@lst.de>
References: <20211014145206.1488967-1-hch@lst.de>
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

block2mtd is a bit of a mess as it pokes directly into the block layer
internal page cache.  Switch it to use the proper file abstraction
instead.  Note that this contains a small behavior change in that erase
now unconditionally writes all Fs instead of first scanning for them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/devices/block2mtd.c | 203 ++++++++------------------------
 1 file changed, 48 insertions(+), 155 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index c08721b11642b..ea8ec9956c3e8 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -34,7 +34,7 @@
 /* Info for the block device */
 struct block2mtd_dev {
 	struct list_head list;
-	struct block_device *blkdev;
+	struct file *file;
 	struct mtd_info mtd;
 	struct mutex write_mutex;
 };
@@ -43,58 +43,35 @@ struct block2mtd_dev {
 /* Static info about the MTD, used in cleanup_module */
 static LIST_HEAD(blkmtd_device_list);
 
-
-static struct page *page_read(struct address_space *mapping, pgoff_t index)
-{
-	return read_mapping_page(mapping, index, NULL);
-}
+static u_long allfs[PAGE_SIZE / sizeof(u_long)] = {
+	[0 ... (PAGE_SIZE / sizeof(u_long)) - 1] = -1UL,
+};
 
 /* erase a specified part of the device */
-static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
-{
-	struct address_space *mapping = dev->blkdev->bd_inode->i_mapping;
-	struct page *page;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int pages = len >> PAGE_SHIFT;
-	u_long *p;
-	u_long *max;
-
-	while (pages) {
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		max = page_address(page) + PAGE_SIZE;
-		for (p=page_address(page); p<max; p++)
-			if (*p != -1UL) {
-				lock_page(page);
-				memset(page_address(page), 0xff, PAGE_SIZE);
-				set_page_dirty(page);
-				unlock_page(page);
-				balance_dirty_pages_ratelimited(mapping);
-				break;
-			}
-
-		put_page(page);
-		pages--;
-		index++;
-	}
-	return 0;
-}
 static int block2mtd_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	struct block2mtd_dev *dev = mtd->priv;
-	size_t from = instr->addr;
-	size_t len = instr->len;
-	int err;
+	loff_t end = instr->addr + instr->len;
+	size_t total_len = instr->len;
+	loff_t from = instr->addr;
+	ssize_t ret;
 
 	mutex_lock(&dev->write_mutex);
-	err = _block2mtd_erase(dev, from, len);
+	do {
+		size_t len = min_t(size_t, total_len, PAGE_SIZE);
+
+		ret = kernel_write(dev->file, allfs, len, &from);
+		if (ret < 0)
+			goto fail;
+		total_len -= ret;
+	} while (from < end);
 	mutex_unlock(&dev->write_mutex);
-	if (err)
-		pr_err("erase failed err = %d\n", err);
 
-	return err;
+	return 0;
+
+fail:
+	pr_err("erase failed err = %zd\n", ret);
+	return ret;
 }
 
 
@@ -102,72 +79,12 @@ static int block2mtd_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	struct block2mtd_dev *dev = mtd->priv;
-	struct page *page;
-	pgoff_t index = from >> PAGE_SHIFT;
-	int offset = from & (PAGE_SIZE-1);
-	int cpylen;
-
-	while (len) {
-		if ((offset + len) > PAGE_SIZE)
-			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else
-			cpylen = len;	// this page
-		len = len - cpylen;
-
-		page = page_read(dev->blkdev->bd_inode->i_mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		memcpy(buf, page_address(page) + offset, cpylen);
-		put_page(page);
-
-		if (retlen)
-			*retlen += cpylen;
-		buf += cpylen;
-		offset = 0;
-		index++;
-	}
-	return 0;
-}
+	ssize_t ret;
 
-
-/* write data to the underlying device */
-static int _block2mtd_write(struct block2mtd_dev *dev, const u_char *buf,
-		loff_t to, size_t len, size_t *retlen)
-{
-	struct page *page;
-	struct address_space *mapping = dev->blkdev->bd_inode->i_mapping;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int offset = to & ~PAGE_MASK;	// page offset
-	int cpylen;
-
-	while (len) {
-		if ((offset+len) > PAGE_SIZE)
-			cpylen = PAGE_SIZE - offset;	// multiple pages
-		else
-			cpylen = len;			// this page
-		len = len - cpylen;
-
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		if (memcmp(page_address(page)+offset, buf, cpylen)) {
-			lock_page(page);
-			memcpy(page_address(page) + offset, buf, cpylen);
-			set_page_dirty(page);
-			unlock_page(page);
-			balance_dirty_pages_ratelimited(mapping);
-		}
-		put_page(page);
-
-		if (retlen)
-			*retlen += cpylen;
-
-		buf += cpylen;
-		offset = 0;
-		index++;
-	}
+	ret = kernel_read(dev->file, buf, len, &from);
+	if (ret < 0)
+		return ret;
+	*retlen += ret;
 	return 0;
 }
 
@@ -176,14 +93,17 @@ static int block2mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	struct block2mtd_dev *dev = mtd->priv;
-	int err;
+	ssize_t ret;
 
 	mutex_lock(&dev->write_mutex);
-	err = _block2mtd_write(dev, buf, to, len, retlen);
+	ret = kernel_write(dev->file, buf, len, &to);
+	if (ret > 0) {
+		*retlen += ret;
+		ret = 0;
+	}
 	mutex_unlock(&dev->write_mutex);
-	if (err > 0)
-		err = 0;
-	return err;
+
+	return ret;
 }
 
 
@@ -191,8 +111,8 @@ static int block2mtd_write(struct mtd_info *mtd, loff_t to, size_t len,
 static void block2mtd_sync(struct mtd_info *mtd)
 {
 	struct block2mtd_dev *dev = mtd->priv;
-	sync_blockdev(dev->blkdev);
-	return;
+
+	vfs_fsync(dev->file, 1);
 }
 
 
@@ -203,10 +123,9 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 
 	kfree(dev->mtd.name);
 
-	if (dev->blkdev) {
-		invalidate_mapping_pages(dev->blkdev->bd_inode->i_mapping,
-					0, -1);
-		blkdev_put(dev->blkdev, FMODE_READ|FMODE_WRITE|FMODE_EXCL);
+	if (dev->file) {
+		vfs_fsync(dev->file, 1);
+		fput(dev->file);
 	}
 
 	kfree(dev);
@@ -216,11 +135,6 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 static struct block2mtd_dev *add_device(char *devname, int erase_size,
 		int timeout)
 {
-#ifndef MODULE
-	int i;
-#endif
-	const fmode_t mode = FMODE_READ | FMODE_WRITE | FMODE_EXCL;
-	struct block_device *bdev;
 	struct block2mtd_dev *dev;
 	char *name;
 
@@ -231,45 +145,24 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	if (!dev)
 		return NULL;
 
-	/* Get a handle on the device */
-	bdev = blkdev_get_by_path(devname, mode, dev);
-
-#ifndef MODULE
-	/*
-	 * We might not have the root device mounted at this point.
-	 * Try to resolve the device name by other means.
-	 */
-	for (i = 0; IS_ERR(bdev) && i <= timeout; i++) {
-		dev_t devt;
-
-		if (i)
-			/*
-			 * Calling wait_for_device_probe in the first loop
-			 * was not enough, sleep for a bit in subsequent
-			 * go-arounds.
-			 */
-			msleep(1000);
-		wait_for_device_probe();
-
-		devt = name_to_dev_t(devname);
-		if (!devt)
-			continue;
-		bdev = blkdev_get_by_dev(devt, mode, dev);
+	dev->file = filp_open(devname, O_RDWR | O_EXCL, 0);
+	if (IS_ERR(dev->file)) {
+		dev->file = NULL;
+		pr_err("error: cannot open device %s\n", devname);
+		goto err_free_block2mtd;
 	}
-#endif
 
-	if (IS_ERR(bdev)) {
+	if (!S_ISBLK(file_inode(dev->file)->i_mode)) {
 		pr_err("error: cannot open device %s\n", devname);
 		goto err_free_block2mtd;
 	}
-	dev->blkdev = bdev;
 
-	if (MAJOR(bdev->bd_dev) == MTD_BLOCK_MAJOR) {
+	if (MAJOR(file_inode(dev->file)->i_rdev) == MTD_BLOCK_MAJOR) {
 		pr_err("attempting to use an MTD device as a block device\n");
 		goto err_free_block2mtd;
 	}
 
-	if ((long)dev->blkdev->bd_inode->i_size % erase_size) {
+	if ((long)i_size_read(dev->file->f_mapping->host) % erase_size) {
 		pr_err("erasesize must be a divisor of device size\n");
 		goto err_free_block2mtd;
 	}
@@ -284,7 +177,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	dev->mtd.name = name;
 
-	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.size = i_size_read(dev->file->f_mapping->host) & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = 1;
 	dev->mtd.writebufsize = PAGE_SIZE;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
