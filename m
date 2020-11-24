Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6B8C82597
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:29:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58FA4204EC
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 13:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pjb61qOt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="voamq2gI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58FA4204EC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=49HJI4+BHtTyaT1ZslTv6Fo64P0EhO2HLvedeyTYK9w=; b=Pjb61qOtj37Nu8tEe0r/CPOcV
	g7c7a80NjbaLCZQ+zuHvkSC6f3O/c/pzMhxK7wIqS9cAaMkYthbI2UZLfcuiukx15h1ZWvovjNrTh
	5PYGc/nm9MuDhbgqUR1mPvTffuNiS03iNJ/6Rrcxcr56mCveNMRUbbPU7mLFOieaFGtgA4H+I3Dmy
	F2wt7+34R7hCwO07erhnu5TN/FWmNWUqtF3+ZHJJrTbcylVmypeF55yqSnYKFWAkLF7KlV1ZO1JWG
	6oiaoMdUJ2mkwijdPnJdSxOAJQFYzBJoH2CJ0ZH14ofgyHWyOfwkBtKiKYcKD6koNm5Q0J9yDNAOZ
	8MS4fDeVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMn-00086v-EU; Tue, 24 Nov 2020 13:28:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMW-00082I-UN
 for linux-mtd@merlin.infradead.org; Tue, 24 Nov 2020 13:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kUYn0sikpHZNYDnsxFrAwXSb49C5P7DMdxps0LhhPGQ=; b=voamq2gIRabU8afAKL3jTQT86w
 3voeMXKzWRc968NV3Og6QI7vPIsFgyzT+g3y7G5VN1mzlkrcmMY4Qg7EwhHhprBp2pFWLMjK63ObP
 R7mWTCNSKQkV5l0bX4rfRh4gKPGZnVeHwjNUcB1zJgqL93wnbxgFlTDmJRPjnCaFhMh+HPucQfU+S
 uovUuXHghcRdZOgSkakX0fZ9XuPs/BxiQ7jD+ibvnUIkvCuGFLC0BxmxD5xKdEPhugucjYN8I4Xpv
 WSH12/wojKPamwwzSgge7VqR4tsSr5bVtW0y1gEbh0LGN1fc0aleWXDqaFKriKv0dnauuuFj6BOkD
 RzQOH7Hw==;
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khYMV-0006Ut-HC; Tue, 24 Nov 2020 13:28:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 06/45] zram: remove the claim mechanism
Date: Tue, 24 Nov 2020 14:27:12 +0100
Message-Id: <20201124132751.3747337-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>,
 xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The zram claim mechanism was added to ensure no new opens come in
during teardown.  But the proper way to archive that is to call
del_gendisk first, which takes care of all that.  Once del_gendisk
is called in the right place, the reset side can also be simplified
as no I/O can be outstanding on a block device that is not open.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/zram/zram_drv.c | 72 ++++++++---------------------------
 1 file changed, 15 insertions(+), 57 deletions(-)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 6d15d51cee2b7e..2e6d75ec1afddb 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1756,64 +1756,33 @@ static ssize_t disksize_store(struct device *dev,
 static ssize_t reset_store(struct device *dev,
 		struct device_attribute *attr, const char *buf, size_t len)
 {
-	int ret;
-	unsigned short do_reset;
-	struct zram *zram;
+	struct zram *zram = dev_to_zram(dev);
 	struct block_device *bdev;
+	unsigned short do_reset;
+	int ret = 0;
 
 	ret = kstrtou16(buf, 10, &do_reset);
 	if (ret)
 		return ret;
-
 	if (!do_reset)
 		return -EINVAL;
 
-	zram = dev_to_zram(dev);
 	bdev = bdget_disk(zram->disk, 0);
 	if (!bdev)
 		return -ENOMEM;
 
 	mutex_lock(&bdev->bd_mutex);
-	/* Do not reset an active device or claimed device */
-	if (bdev->bd_openers || zram->claim) {
-		mutex_unlock(&bdev->bd_mutex);
-		bdput(bdev);
-		return -EBUSY;
-	}
-
-	/* From now on, anyone can't open /dev/zram[0-9] */
-	zram->claim = true;
+	if (bdev->bd_openers)
+		ret = -EBUSY;
+	else
+		zram_reset_device(zram);
 	mutex_unlock(&bdev->bd_mutex);
-
-	/* Make sure all the pending I/O are finished */
-	fsync_bdev(bdev);
-	zram_reset_device(zram);
 	bdput(bdev);
 
-	mutex_lock(&bdev->bd_mutex);
-	zram->claim = false;
-	mutex_unlock(&bdev->bd_mutex);
-
-	return len;
-}
-
-static int zram_open(struct block_device *bdev, fmode_t mode)
-{
-	int ret = 0;
-	struct zram *zram;
-
-	WARN_ON(!mutex_is_locked(&bdev->bd_mutex));
-
-	zram = bdev->bd_disk->private_data;
-	/* zram was claimed to reset so open request fails */
-	if (zram->claim)
-		ret = -EBUSY;
-
-	return ret;
+	return ret ? ret : len;
 }
 
 static const struct block_device_operations zram_devops = {
-	.open = zram_open,
 	.submit_bio = zram_submit_bio,
 	.swap_slot_free_notify = zram_slot_free_notify,
 	.rw_page = zram_rw_page,
@@ -1821,7 +1790,6 @@ static const struct block_device_operations zram_devops = {
 };
 
 static const struct block_device_operations zram_wb_devops = {
-	.open = zram_open,
 	.submit_bio = zram_submit_bio,
 	.swap_slot_free_notify = zram_slot_free_notify,
 	.owner = THIS_MODULE
@@ -1974,32 +1942,22 @@ static int zram_add(void)
 
 static int zram_remove(struct zram *zram)
 {
-	struct block_device *bdev;
-
-	bdev = bdget_disk(zram->disk, 0);
-	if (!bdev)
-		return -ENOMEM;
+	struct block_device *bdev = bdget_disk(zram->disk, 0);
 
-	mutex_lock(&bdev->bd_mutex);
-	if (bdev->bd_openers || zram->claim) {
-		mutex_unlock(&bdev->bd_mutex);
+	if (bdev) {
+		if (bdev->bd_openers) {
+			bdput(bdev);
+			return -EBUSY;
+		}
 		bdput(bdev);
-		return -EBUSY;
 	}
 
-	zram->claim = true;
-	mutex_unlock(&bdev->bd_mutex);
-
+	del_gendisk(zram->disk);
 	zram_debugfs_unregister(zram);
-
-	/* Make sure all the pending I/O are finished */
-	fsync_bdev(bdev);
 	zram_reset_device(zram);
-	bdput(bdev);
 
 	pr_info("Removed device: %s\n", zram->disk->disk_name);
 
-	del_gendisk(zram->disk);
 	blk_cleanup_queue(zram->disk->queue);
 	put_disk(zram->disk);
 	kfree(zram);
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
