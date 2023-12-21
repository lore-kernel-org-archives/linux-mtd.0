Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B3FC35274
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Dec 2023 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKmk0vonk9uR7pZnr2SfPpfGcOqfvFQ7XxAU33fPsa8=; b=lK3CzjD9xMyT00
	Syx5GiKR+bgiq7Bcbhf4HpFKq4chYH1tsbbxRM/O8kXBmZlQAGSp9Q0GFxKFTW/z8lp7nNbqfzYqP
	a/7XnOdcceCr04EJsg4uXpTgq4ovjkBgJk8ACsEtRgNIvkzcIU6QrR0gKnQbLB581yD/Y7zgMyQ7B
	/c4cQ5GAH5IJCXZhTr44zI6nY0uUQz0OPbIwZJTkN6dSlp2+CgZtVE2o+H4Vd78gos+ZeAuCH4wiD
	6GmS1qKEHxttwxSxQG8EQvQ27s+1eVT2RFq3/yCsbQqEzvUp23kio0PD5M1l32F2qJHFoUtRk6v0p
	ir28odLzQvqZSjSGUvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEuz-00284z-2g;
	Thu, 21 Dec 2023 09:00:37 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEuv-00282F-1Y
	for linux-mtd@lists.infradead.org;
	Thu, 21 Dec 2023 09:00:36 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Swksg0nDWz4f3js2
	for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 17:00:23 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DFBDA1A01CA
	for <linux-mtd@lists.infradead.org>; Thu, 21 Dec 2023 17:00:25 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgBHlQun_oNlCxfvEA--.34192S4;
	Thu, 21 Dec 2023 17:00:25 +0800 (CST)
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
	linux-fsdevel@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org,
	linux-nilfs@vger.kernel.org,
	yukuai3@huawei.com,
	yukuai1@huaweicloud.com,
	yi.zhang@huawei.com,
	yangerkun@huawei.com
Subject: [PATCH RFC v3 for-6.8/block 11/17] erofs: use bdev api
Date: Thu, 21 Dec 2023 16:58:26 +0800
Message-Id: <20231221085826.1768395-1-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgBHlQun_oNlCxfvEA--.34192S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZFWUAF1xtr4rGr45Ww17Jrb_yoW8KF1kpr
	W3Cr1rGrWrXrs09wn2gr1UZF13ta97Gw48CayxJw1Fv3yUtryagFyvywnrGr48Kr4kKrs2
	qF1Ivry8uw1UJrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
	JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1U
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26F4UJVW0owCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_
	Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVWxJr0_GcJvcSsGvfC2KfnxnUUI43ZEXa7VU1
	VOJ5UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_010033_913087_62B98CEE 
X-CRM114-Status: GOOD (  10.59  )
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

Avoid to access bd_inode directly, prepare to remove bd_inode from
block_device.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/erofs/data.c     | 18 ++++++++++++------
 fs/erofs/internal.h |  2 ++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index c98aeda8abb2..bbe2fe199bf3 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -32,8 +32,8 @@ void erofs_put_metabuf(struct erofs_buf *buf)
 void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
 		  enum erofs_kmap_type type)
 {
-	struct inode *inode = buf->inode;
-	erofs_off_t offset = (erofs_off_t)blkaddr << inode->i_blkbits;
+	u8 blkszbits = buf->inode ? buf->inode->i_blkbits : buf->blkszbits;
+	erofs_off_t offset = (erofs_off_t)blkaddr << blkszbits;
 	pgoff_t index = offset >> PAGE_SHIFT;
 	struct page *page = buf->page;
 	struct folio *folio;
@@ -43,7 +43,9 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
 		erofs_put_metabuf(buf);
 
 		nofs_flag = memalloc_nofs_save();
-		folio = read_cache_folio(inode->i_mapping, index, NULL, NULL);
+		folio = buf->inode ?
+			read_mapping_folio(buf->inode->i_mapping, index, NULL) :
+			bdev_read_folio(buf->bdev, offset);
 		memalloc_nofs_restore(nofs_flag);
 		if (IS_ERR(folio))
 			return folio;
@@ -67,10 +69,14 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
 
 void erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb)
 {
-	if (erofs_is_fscache_mode(sb))
+	if (erofs_is_fscache_mode(sb)) {
 		buf->inode = EROFS_SB(sb)->s_fscache->inode;
-	else
-		buf->inode = sb->s_bdev->bd_inode;
+		buf->bdev = NULL;
+	} else {
+		buf->inode = NULL;
+		buf->bdev = sb->s_bdev;
+		buf->blkszbits = EROFS_SB(sb)->blkszbits;
+	}
 }
 
 void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index b0409badb017..c9206351b485 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -224,8 +224,10 @@ enum erofs_kmap_type {
 
 struct erofs_buf {
 	struct inode *inode;
+	struct block_device *bdev;
 	struct page *page;
 	void *base;
+	u8 blkszbits;
 	enum erofs_kmap_type kmap_type;
 };
 #define __EROFS_BUF_INITIALIZER	((struct erofs_buf){ .page = NULL })
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
