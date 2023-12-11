Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39DBCC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ehnBpZS5Rszhr6RfX0zbmK75cOXcZCrXq9w/hxxBFU=; b=RAB6/5pc5Yi9Uu
	kcrT1/MausAr2NLi6X6ojn8nTtPyodi1WTyPOjg9ZAye7htEAGd6O6TM7qYRbq6D3ZLrA5OATAcCg
	SoWxvP+OaoK3ua94X+d7DTbbclH5DaDBKARQsrV43a5wVSxfUgOlhmqlKcb978dxxLuK/s74aeWip
	FbwcPWITwRtYp8Ao9CXkBCi8jEpuNDFchgrSyqm7BXIaF3Rw+V7Dg0ddvm1kUj8oQ3C2hdPZpnSZc
	ppvnYrb8zHamPntt55+3QqZdU6PG2UTbe3X3bQfu6wMhBHPnQ7AkODQ20Go3ngY6o8vs8K5ctayEe
	ja1asn+T/7eWknjHJo8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgyL-0056oK-2x;
	Mon, 11 Dec 2023 14:09:26 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCgyH-0056kd-0Y
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 14:09:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4SpkBh1TWGz4f3kFg
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:09:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 9F2541A049F
	for <linux-mtd@lists.infradead.org>; Mon, 11 Dec 2023 22:09:18 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDHyhAMGHdl2qJxDQ--.24877S4;
	Mon, 11 Dec 2023 22:09:18 +0800 (CST)
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
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
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
	p.raghav@samsung.com,
	hare@suse.de
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	gfs2@lists.linux.dev,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v2 for-6.8/block 15/18] buffer: add a new helper to read sb block
Date: Mon, 11 Dec 2023 22:07:53 +0800
Message-Id: <20231211140753.975297-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211140552.973290-1-yukuai1@huaweicloud.com>
References: <20231211140552.973290-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDHyhAMGHdl2qJxDQ--.24877S4
X-Coremail-Antispam: 1UD129KBjvJXoW3AFyUCF4kKryrJrW3trWrXwb_yoW7Ww13pr
	98Kay3trWDKFyaqF1xtwn8Jr13t3Z2v3W8CayfJ3s3ArWUGrn3XF9rGr129FWFyr9rXry5
	XFW5CrWfCr1UWFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1U
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26F4UJVW0owCI42IY6xAIw20EY4v20xvaj40_JFI_Gr1lIxAIcVC2z280aVAFwI0_
	Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VUb
	ZNVDUUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_060921_651249_D969F4B9 
X-CRM114-Status: GOOD (  15.91  )
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

Unlike __bread_gfp(), ext4 has special handing while reading sb block:

1) __GFP_NOFAIL is not set, and memory allocation can fail;
2) If buffer write failed before, set buffer uptodate and don't read
   block from disk;
3) REQ_META is set for all IO, and REQ_PRIO is set for reading xattr;
4) If failed, return error ptr instead of NULL;

This patch add a new helper __bread_gfp2() that will match above 2 and 3(
1 will be used, and 4 will still be encapsulated by ext4), and prepare to
prevent calling mapping_gfp_constraint() directly on bd_inode->i_mapping
in ext4.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/buffer.c                 | 68 ++++++++++++++++++++++++++-----------
 include/linux/buffer_head.h | 18 +++++++++-
 2 files changed, 65 insertions(+), 21 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 967f34b70aa8..188bd36c9fea 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1255,16 +1255,19 @@ void __bforget(struct buffer_head *bh)
 }
 EXPORT_SYMBOL(__bforget);
 
-static struct buffer_head *__bread_slow(struct buffer_head *bh)
+static struct buffer_head *__bread_slow(struct buffer_head *bh,
+					blk_opf_t op_flags,
+					bool check_write_error)
 {
 	lock_buffer(bh);
-	if (buffer_uptodate(bh)) {
+	if (buffer_uptodate(bh) ||
+	    (check_write_error && buffer_uptodate_or_error(bh))) {
 		unlock_buffer(bh);
 		return bh;
 	} else {
 		get_bh(bh);
 		bh->b_end_io = end_buffer_read_sync;
-		submit_bh(REQ_OP_READ, bh);
+		submit_bh(REQ_OP_READ | op_flags, bh);
 		wait_on_buffer(bh);
 		if (buffer_uptodate(bh))
 			return bh;
@@ -1445,6 +1448,31 @@ void __breadahead(struct block_device *bdev, sector_t block, unsigned size)
 }
 EXPORT_SYMBOL(__breadahead);
 
+static struct buffer_head *
+bread_gfp(struct block_device *bdev, sector_t block, unsigned int size,
+	  blk_opf_t op_flags, gfp_t gfp, bool check_write_error)
+{
+	struct buffer_head *bh;
+
+	gfp |= mapping_gfp_constraint(bdev->bd_inode->i_mapping, ~__GFP_FS);
+
+	/*
+	 * Prefer looping in the allocator rather than here, at least that
+	 * code knows what it's doing.
+	 */
+	gfp |= __GFP_NOFAIL;
+
+	bh = bdev_getblk(bdev, block, size, gfp);
+	if (unlikely(!bh))
+		return NULL;
+
+	if (buffer_uptodate(bh) ||
+	    (check_write_error && buffer_uptodate_or_error(bh)))
+		return bh;
+
+	return __bread_slow(bh, op_flags, check_write_error);
+}
+
 /**
  *  __bread_gfp() - reads a specified block and returns the bh
  *  @bdev: the block_device to read from
@@ -1458,27 +1486,27 @@ EXPORT_SYMBOL(__breadahead);
  *  It returns NULL if the block was unreadable.
  */
 struct buffer_head *
-__bread_gfp(struct block_device *bdev, sector_t block,
-		   unsigned size, gfp_t gfp)
+__bread_gfp(struct block_device *bdev, sector_t block, unsigned int size,
+	    gfp_t gfp)
 {
-	struct buffer_head *bh;
-
-	gfp |= mapping_gfp_constraint(bdev->bd_inode->i_mapping, ~__GFP_FS);
-
-	/*
-	 * Prefer looping in the allocator rather than here, at least that
-	 * code knows what it's doing.
-	 */
-	gfp |= __GFP_NOFAIL;
-
-	bh = bdev_getblk(bdev, block, size, gfp);
-
-	if (likely(bh) && !buffer_uptodate(bh))
-		bh = __bread_slow(bh);
-	return bh;
+	return bread_gfp(bdev, block, size, 0, gfp, false);
 }
 EXPORT_SYMBOL(__bread_gfp);
 
+/*
+ * This works like __bread_gfp() except:
+ * 1) If buffer write failed before, set buffer uptodate and don't read
+ * block from disk;
+ * 2) Caller can pass in additional op_flags like REQ_META;
+ */
+struct buffer_head *
+__bread_gfp2(struct block_device *bdev, sector_t block, unsigned int size,
+	     blk_opf_t op_flags, gfp_t gfp)
+{
+	return bread_gfp(bdev, block, size, op_flags, gfp, true);
+}
+EXPORT_SYMBOL(__bread_gfp2);
+
 static void __invalidate_bh_lrus(struct bh_lru *b)
 {
 	int i;
diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
index 5f23ee599889..751b2744b4ae 100644
--- a/include/linux/buffer_head.h
+++ b/include/linux/buffer_head.h
@@ -171,6 +171,18 @@ static __always_inline int buffer_uptodate(const struct buffer_head *bh)
 	return test_bit_acquire(BH_Uptodate, &bh->b_state);
 }
 
+static __always_inline int buffer_uptodate_or_error(struct buffer_head *bh)
+{
+	/*
+	 * If the buffer has the write error flag, data was failed to write
+	 * out in the block. In this case, set buffer uptodate to prevent
+	 * reading old data.
+	 */
+	if (buffer_write_io_error(bh))
+		set_buffer_uptodate(bh);
+	return buffer_uptodate(bh);
+}
+
 static inline unsigned long bh_offset(const struct buffer_head *bh)
 {
 	return (unsigned long)(bh)->b_data & (page_size(bh->b_page) - 1);
@@ -231,7 +243,11 @@ void __brelse(struct buffer_head *);
 void __bforget(struct buffer_head *);
 void __breadahead(struct block_device *, sector_t block, unsigned int size);
 struct buffer_head *__bread_gfp(struct block_device *,
-				sector_t block, unsigned size, gfp_t gfp);
+				sector_t block, unsigned int size, gfp_t gfp);
+struct buffer_head *__bread_gfp2(struct block_device *bdev, sector_t block,
+				 unsigned int size, blk_opf_t op_flags,
+				 gfp_t gfp);
+
 struct buffer_head *alloc_buffer_head(gfp_t gfp_flags);
 void free_buffer_head(struct buffer_head * bh);
 void unlock_buffer(struct buffer_head *bh);
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
