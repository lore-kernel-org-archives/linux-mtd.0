Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3ADEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+t5f1xo3fWtlRPCHwh4HW4UAaLADQYJRdq7cutEuWM=; b=L7ILhhJjWOv5lj
	HibtgvREdla+p7A7HAc9bNod1ei/bR4Q6P2Rx+c94gIwH8e0e2p3SSze+MB/Z6Kor30uB/YIX3yzc
	ZZagJSOe4RxGYcTjosdm12cD1DVCQ4jRrJ/t1gdA9KcWLYuY4jtnOeRWb3KR8BB+hSlsmcsCC7/ZN
	v3Gdco5eE840c4XKshmadf08LQnAR9k1/M7YaacnapBv2R/BQ3IEDA/Qxiz5joTs/LLs9iY/Svngb
	kS1XVML8I5l0ci3sJoIBRRvNKKGbVLxPyiAfRccdS+NoZTe6v7OGy1wlwLUsozHX3j43EHycsmPbZ
	W2cWhC4s4p6nHYxJOpPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfZ8-00DJaL-08;
	Tue, 04 Jul 2023 12:55:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfZ6-00DJa8-0b
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Jul 2023 12:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Zf0t2U1lixxVR3sFXqYsJAsTJy40h/GqmQEL+fCE6T8=; b=kDF4iGtlaDqcqae+yHo0wcmQW1
	JW7ewvkzUVP2fKtvWN9Q6sA9upaduuZ/mo/o3bN52Y0qHMUxil7T3KmXWFkUjpwvnVhk7/kV+Z9I9
	6gb7GXIdCXr4ZUvd3Ozb3EkkS75e3KmNHETX4ULkscajrXkeccXn/PRQIRX6a94+ZZXYV1O5iOl5W
	eCLMSUs0UoKRaFai1omEsf6T8AxdVL0unvbBGlA1rbHl060cFMcOVLKwZTvhpOj9YshrCsXSoLTjI
	eWLa/t/nqZPgf7bWq81Fuo0agsrf/fQn9l1eyqNv9N9/tK6tyd46h/3hdP7rzAX3JPH+6QRY2qt7O
	EQRCtfpA==;
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGf3A-00Au3g-0D
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 12:22:35 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EDF9520566;
	Tue,  4 Jul 2023 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1688473345; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zf0t2U1lixxVR3sFXqYsJAsTJy40h/GqmQEL+fCE6T8=;
	b=kvQ38sPO6twM/54HPO8zalsWpgihqedI3lKAAqZYa6hQLCx7KB3H1Mbv8UxkmMwyGAkj/7
	GkxLuRvssjR5WC35XnSMYJQQUHkR/Y6/+Yx3z45A+Wspxd6kV+4SKcI5Mgtm5APbCswcFc
	Za+ElTpFuLSs6uFZK3XL3jIg1LHOBk4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1688473345;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zf0t2U1lixxVR3sFXqYsJAsTJy40h/GqmQEL+fCE6T8=;
	b=X5oW4bimh9K7qKyqa2rEbGrAaQURth5RwD8yEIKe7ADzPW8133Y+gYtWSh4osoo5n/FzBI
	yjyvwxSt4J4Tg6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D83071346D;
	Tue,  4 Jul 2023 12:22:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id R6TDNAEPpGQtMAAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 04 Jul 2023 12:22:25 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id DCF14A0770; Tue,  4 Jul 2023 14:22:24 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-block@vger.kernel.org>
Cc: <linux-fsdevel@vger.kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Joern Engel <joern@lazybastard.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 13/32] mtd: block2mtd: Convert to blkdev_get_handle_by_dev/path()
Date: Tue,  4 Jul 2023 14:21:40 +0200
Message-Id: <20230704122224.16257-13-jack@suse.cz>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230629165206.383-1-jack@suse.cz>
References: <20230629165206.383-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6135; i=jack@suse.cz; h=from:subject; bh=VqUKIGW4i8LFDfj0Ruo3n+bYqi4b5VlC+lPPaHoQKks=; b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBkpA7V3Bw42VfXTVkK81xoE+wLKtoS5UBEfAmYhN/q 5KfbzRqJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCZKQO1QAKCRCcnaoHP2RA2T7cB/ wNLHUQpFVpvehIktHP0p3GG4Mp3NKC5rR6yVbxp4gRHqcR2N87oUcWO1IOGw5snBMRIiTayPBrI0Lt 7V/tG+zL6iqL2g6G19eTOWvuXISLANcpEan8BvfmaKED85IKOqGTJkO7iviFVfBV2NeJNg7B/ed1Dg 2BOIks6HyEsNGrYDIWWP8sBV6I/D/0yex10tR1rpOodAypymXIkqHT4zgV3jxduV4QSKQH6H/BOx6g d2QphF/QAn+mQBrwiXrfS9XjrZR504QrD6t+Ug7Reft055nwKCI+7t8qwKLyalz81NRuVjmkUztttm bS9VxRqHnOY/1a6iEBAEF6fm8WDgXv
X-Developer-Key: i=jack@suse.cz; a=openpgp; fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_132232_399642_8789F100 
X-CRM114-Status: GOOD (  25.97  )
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

Convert block2mtd to use blkdev_get_handle_by_dev() and
blkdev_get_handle_by_path() and pass the handle around.

CC: Joern Engel <joern@lazybastard.org>
CC: linux-mtd@lists.infradead.org
Signed-off-by: Jan Kara <jack@suse.cz>
---
 drivers/mtd/devices/block2mtd.c | 52 +++++++++++++++++++--------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index be106dc20ff3..1614459297d2 100644
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
+		blkdev_handle_put(dev->bdev_handle);
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
@@ -249,19 +253,21 @@ static struct block_device __ref *mdtblock_early_get_bdev(const char *devname,
 		wait_for_device_probe();
 
 		if (!early_lookup_bdev(devname, &devt)) {
-			bdev = blkdev_get_by_dev(devt, mode, dev, NULL);
-			if (!IS_ERR(bdev))
+			bdev_handle = blkdev_get_handle_by_dev(devt, mode, dev,
+							       NULL);
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
@@ -274,21 +280,23 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 		return NULL;
 
 	/* Get a handle on the device */
-	bdev = blkdev_get_by_path(devname, mode, dev, NULL);
-	if (IS_ERR(bdev))
-		bdev = mdtblock_early_get_bdev(devname, mode, timeout, dev);
-	if (IS_ERR(bdev)) {
+	bdev_handle = blkdev_get_handle_by_path(devname, mode, dev, NULL);
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
@@ -306,7 +314,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	dev->mtd.name = name;
 
-	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+	dev->mtd.size = bdev->bd_inode->i_size & PAGE_MASK;
 	dev->mtd.erasesize = erase_size;
 	dev->mtd.writesize = 1;
 	dev->mtd.writebufsize = PAGE_SIZE;
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
