Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDB7C07E97
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 12:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V0R5NR0t4wYO0SkOZRu5DpbUBtdrTmG/OThJ26FweIk=; b=drazwiJeDoyIbT
	VWQYYx3YgLGkFSnn/7WNuZmURTtF0Lh4vRy0RGm8ZzBK07K1Ze/Vl/M5JgV7gUTeMY1X6ktkBRmDZ
	ogCJC9hdY26fy5y+m9kSoPtqTJhp/hI0zwoHlZMPdzAIKQp28kbmELFr3+h7VulEqrsp/wd84ax56
	TBu6xcx2ItDWBjMeZQMI7P1rw5/0MbC98aI59QNpwt9vz4o9mQQ+yO1qCWjoBhIt7x3UTLJeyxm/X
	kp3dt5Ne3Hh+hXhTf5cwX9RxYW7rzPieg8A1L+IjOORjUt6k4H4KdM0XEVqw6A9SdXUgXUWxh+87v
	sqDEB+ibCtW8+Q7pAe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUhR-007Oq2-0W;
	Tue, 05 Dec 2023 12:38:53 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUhK-007Ohy-34
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 12:38:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sl0Sn1mFZz4f3jq0
	for <linux-mtd@lists.infradead.org>; Tue,  5 Dec 2023 20:38:33 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4CC5C1A0BE7
	for <linux-mtd@lists.infradead.org>; Tue,  5 Dec 2023 20:38:34 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDnNw7GGW9lr8E8Cw--.35507S5;
	Tue, 05 Dec 2023 20:38:33 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: axboe@kernel.dk,
	roger.pau@citrix.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	sth@linux.ibm.com,
	hoeppner@linux.ibm.com,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	nico@fluxnic.net,
	xiang@kernel.org,
	chao@kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	agruenba@redhat.com,
	jack@suse.com,
	konishi.ryusuke@gmail.com,
	willy@infradead.org,
	akpm@linux-foundation.org,
	hare@suse.de,
	p.raghav@samsung.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH -next RFC 01/14] block: add some bdev apis
Date: Tue,  5 Dec 2023 20:37:15 +0800
Message-Id: <20231205123728.1866699-2-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDnNw7GGW9lr8E8Cw--.35507S5
X-Coremail-Antispam: 1UD129KBjvJXoW3GrykCryfur18GF48Cw1xXwb_yoW3tF48pF
	yUKa45JrWUGr1Igrs2yw43Zr1agw10k3WxZa4xA34Yk3yktrn2gF95Kw1UArWSqrWkAFZr
	XFW3ZrWxur1jkFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JULXo7U
	UUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_043847_387416_D58A69D7 
X-CRM114-Status: GOOD (  15.11  )
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

From: Yu Kuai <yukuai3@huawei.com>

Those apis will be used for other modules, so that bd_inode won't be
accessed directly from other modules.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 block/bdev.c           | 116 +++++++++++++++++++++++++++++++++++++++++
 block/bio.c            |   1 +
 block/blk.h            |   2 -
 include/linux/blkdev.h |  27 ++++++++++
 4 files changed, 144 insertions(+), 2 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 6f73b02d549c..fcba5c1bd113 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -92,6 +92,13 @@ void invalidate_bdev(struct block_device *bdev)
 }
 EXPORT_SYMBOL(invalidate_bdev);
 
+void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
+			   pgoff_t end)
+{
+	invalidate_mapping_pages(bdev->bd_inode->i_mapping, start, end);
+}
+EXPORT_SYMBOL_GPL(invalidate_bdev_range);
+
 /*
  * Drop all buffers & page cache for given bdev range. This function bails
  * with error if bdev has other exclusive owner (such as filesystem).
@@ -124,6 +131,7 @@ int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
 					     lstart >> PAGE_SHIFT,
 					     lend >> PAGE_SHIFT);
 }
+EXPORT_SYMBOL_GPL(truncate_bdev_range);
 
 static void set_init_blocksize(struct block_device *bdev)
 {
@@ -138,6 +146,18 @@ static void set_init_blocksize(struct block_device *bdev)
 	bdev->bd_inode->i_blkbits = blksize_bits(bsize);
 }
 
+loff_t bdev_size(struct block_device *bdev)
+{
+	loff_t size;
+
+	spin_lock(&bdev->bd_size_lock);
+	size = i_size_read(bdev->bd_inode);
+	spin_unlock(&bdev->bd_size_lock);
+
+	return size;
+}
+EXPORT_SYMBOL_GPL(bdev_size);
+
 int set_blocksize(struct block_device *bdev, int size)
 {
 	/* Size must be a power of two, and between 512 and PAGE_SIZE */
@@ -1144,3 +1164,99 @@ static int __init setup_bdev_allow_write_mounted(char *str)
 	return 1;
 }
 __setup("bdev_allow_write_mounted=", setup_bdev_allow_write_mounted);
+
+struct folio *bdev_read_folio(struct block_device *bdev, pgoff_t index)
+{
+	return read_mapping_folio(bdev->bd_inode->i_mapping, index, NULL);
+}
+EXPORT_SYMBOL_GPL(bdev_read_folio);
+
+struct folio *bdev_read_folio_gfp(struct block_device *bdev, pgoff_t index,
+				  gfp_t gfp)
+{
+	return mapping_read_folio_gfp(bdev->bd_inode->i_mapping, index, gfp);
+}
+EXPORT_SYMBOL_GPL(bdev_read_folio_gfp);
+
+struct folio *bdev_get_folio(struct block_device *bdev, pgoff_t index)
+{
+	return filemap_get_folio(bdev->bd_inode->i_mapping, index);
+}
+EXPORT_SYMBOL_GPL(bdev_get_folio);
+
+struct folio *bdev_find_or_create_folio(struct block_device *bdev,
+					pgoff_t index, gfp_t gfp)
+{
+	return __filemap_get_folio(bdev->bd_inode->i_mapping, index,
+				   FGP_LOCK | FGP_ACCESSED | FGP_CREAT, gfp);
+}
+EXPORT_SYMBOL_GPL(bdev_find_or_create_folio);
+
+int bdev_wb_err_check(struct block_device *bdev, errseq_t since)
+{
+	return errseq_check(&bdev->bd_inode->i_mapping->wb_err, since);
+}
+EXPORT_SYMBOL_GPL(bdev_wb_err_check);
+
+int bdev_wb_err_check_and_advance(struct block_device *bdev, errseq_t *since)
+{
+	return errseq_check_and_advance(&bdev->bd_inode->i_mapping->wb_err,
+					since);
+}
+EXPORT_SYMBOL_GPL(bdev_wb_err_check_and_advance);
+
+void bdev_balance_dirty_pages_ratelimited(struct block_device *bdev)
+{
+	return balance_dirty_pages_ratelimited(bdev->bd_inode->i_mapping);
+}
+EXPORT_SYMBOL_GPL(bdev_balance_dirty_pages_ratelimited);
+
+void bdev_sync_readahead(struct block_device *bdev, struct file_ra_state *ra,
+			 struct file *file, pgoff_t index,
+			 unsigned long req_count)
+{
+	struct file_ra_state tmp_ra = {};
+
+	if (!ra) {
+		ra = &tmp_ra;
+		file_ra_state_init(ra, bdev->bd_inode->i_mapping);
+	}
+	page_cache_sync_readahead(bdev->bd_inode->i_mapping, ra, file, index,
+				  req_count);
+}
+EXPORT_SYMBOL_GPL(bdev_sync_readahead);
+
+void bdev_attach_wb(struct block_device *bdev)
+{
+	inode_attach_wb(bdev->bd_inode, NULL);
+}
+EXPORT_SYMBOL_GPL(bdev_attach_wb);
+
+void bdev_correlate_mapping(struct block_device *bdev,
+			    struct address_space *mapping)
+{
+	mapping->host = bdev->bd_inode;
+}
+EXPORT_SYMBOL_GPL(bdev_correlate_mapping);
+
+gfp_t bdev_gfp_constraint(struct block_device *bdev, gfp_t gfp)
+{
+	return mapping_gfp_constraint(bdev->bd_inode->i_mapping, gfp);
+}
+EXPORT_SYMBOL_GPL(bdev_gfp_constraint);
+
+/*
+ * The del_gendisk() function uninitializes the disk-specific data
+ * structures, including the bdi structure, without telling anyone
+ * else.  Once this happens, any attempt to call mark_buffer_dirty()
+ * (for example, by ext4_commit_super), will cause a kernel OOPS.
+ * This is a kludge to prevent these oops until we can put in a proper
+ * hook in del_gendisk() to inform the VFS and file system layers.
+ */
+int bdev_ejected(struct block_device *bdev)
+{
+	struct backing_dev_info *bdi = inode_to_bdi(bdev->bd_inode);
+
+	return bdi->dev == NULL;
+}
+EXPORT_SYMBOL_GPL(bdev_ejected);
diff --git a/block/bio.c b/block/bio.c
index 816d412c06e9..f7123ad9b4ee 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1119,6 +1119,7 @@ void bio_add_folio_nofail(struct bio *bio, struct folio *folio, size_t len,
 	WARN_ON_ONCE(off > UINT_MAX);
 	__bio_add_page(bio, &folio->page, len, off);
 }
+EXPORT_SYMBOL_GPL(bio_add_folio_nofail);
 
 /**
  * bio_add_folio - Attempt to add part of a folio to a bio.
diff --git a/block/blk.h b/block/blk.h
index 08a358bc0919..da4becd4f7e9 100644
--- a/block/blk.h
+++ b/block/blk.h
@@ -467,8 +467,6 @@ extern struct device_attribute dev_attr_events_poll_msecs;
 extern struct attribute_group blk_trace_attr_group;
 
 blk_mode_t file_to_blk_mode(struct file *file);
-int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
-		loff_t lstart, loff_t lend);
 long blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
 long compat_blkdev_ioctl(struct file *file, unsigned cmd, unsigned long arg);
 
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 3f8a21cd9233..a55db77274a4 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1342,6 +1342,11 @@ static inline unsigned int block_size(struct block_device *bdev)
 	return 1 << bdev->bd_inode->i_blkbits;
 }
 
+static inline u8 block_bits(struct block_device *bdev)
+{
+	return bdev->bd_inode->i_blkbits;
+}
+
 int kblockd_schedule_work(struct work_struct *work);
 int kblockd_mod_delayed_work_on(int cpu, struct delayed_work *dwork, unsigned long delay);
 
@@ -1515,6 +1520,28 @@ struct block_device *blkdev_get_no_open(dev_t dev);
 void blkdev_put_no_open(struct block_device *bdev);
 
 struct block_device *I_BDEV(struct inode *inode);
+loff_t bdev_size(struct block_device *bdev);
+void invalidate_bdev_range(struct block_device *bdev, pgoff_t start,
+			   pgoff_t end);
+int truncate_bdev_range(struct block_device *bdev, blk_mode_t mode,
+		loff_t lstart, loff_t lend);
+struct folio *bdev_get_folio(struct block_device *bdev, pgoff_t index);
+struct folio *bdev_find_or_create_folio(struct block_device *bdev,
+					pgoff_t index, gfp_t gfp);
+struct folio *bdev_read_folio(struct block_device *bdev, pgoff_t index);
+struct folio *bdev_read_folio_gfp(struct block_device *bdev, pgoff_t index,
+				  gfp_t gfp);
+int bdev_wb_err_check(struct block_device *bdev, errseq_t since);
+int bdev_wb_err_check_and_advance(struct block_device *bdev, errseq_t *since);
+void bdev_balance_dirty_pages_ratelimited(struct block_device *bdev);
+void bdev_sync_readahead(struct block_device *bdev, struct file_ra_state *ra,
+			 struct file *file, pgoff_t index,
+			 unsigned long req_count);
+void bdev_attach_wb(struct block_device *bdev);
+void bdev_correlate_mapping(struct block_device *bdev,
+			    struct address_space *mapping);
+gfp_t bdev_gfp_constraint(struct block_device *bdev, gfp_t gfp);
+int bdev_ejected(struct block_device *bdev);
 
 #ifdef CONFIG_BLOCK
 void invalidate_bdev(struct block_device *bdev);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
