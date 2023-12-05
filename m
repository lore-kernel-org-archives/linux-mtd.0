Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9050BC4167B
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Dec 2023 12:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2WuYvnQh4+eeBXqaV+vsF81XODReUVrIYWK4PIwGBvo=; b=ik6QNU0Z1MNe5s
	P8MfOmJPxihle7p/NEzkZ3OrM09F4SzduHcNZfnVz4ev2KCk36/31v6WfdFXSISdy1jjTS527eA4W
	5w9oX7Ur1TxlyYiPZ5fDLG4Lp5SLPh3cEUllOoKhNGMmXMar1MOZYyYzbYqjOHUC/YcoqPU3Lsb88
	paRkuhy/QXVuyI7sqFL1ccpzqzJqv++bC1gnN7tuqSKv3L9U2XpxVrXfBpGSps/YV8312tDPVQkEo
	pp0ljQ9n4aqiKgXTHoFWxgtUbShtDhFq2wMFLLZP8GNIg6jAGx4Z8c/TWEpniGUlFK3mrUziScrL9
	U+P9ORNX6CGMXNEwNLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUhk-007P6p-00;
	Tue, 05 Dec 2023 12:39:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUhi-007P3w-0T
	for linux-mtd@bombadil.infradead.org;
	Tue, 05 Dec 2023 12:39:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IX2NgISveltxpTJTNDbQNwh+6cJKqWxU8IOkt3pOhFg=; b=CebOszahYm037kHQTgdf7YNzxz
	U1Heskjrej6fuAdmI0aPufIiq60xFmSjZvLziPA6ptSEuDaFB4Ird6yynGZBrCgZxP2XFKfMLMXFh
	nbRsMAnKHeyybJffT31ZxTvneTdH92JBjW3byOLshvejbNJDj42naKufdP5UqWZkwiagj3vA7fCVU
	krb2Gx9mcbg2jXSmeiiHW0PGMBnG++EjkhMDpLrMlpuA46FNdxyHNHpNG7LjNnFM3LR7GYEFlluyN
	K1ItOJLId76k5FwLBuy9eoRtEi6oaZWmC991NKk36dw0jAgb8fZ/LYn5phs7s5ElT0p8imar+Byg1
	YpVUL+NQ==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAUhc-004kkJ-2c
	for linux-mtd@lists.infradead.org;
	Tue, 05 Dec 2023 12:39:07 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Sl0T24qHDz4f3kK1
	for <linux-mtd@lists.infradead.org>; Tue,  5 Dec 2023 20:38:46 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B1F6A1A095C
	for <linux-mtd@lists.infradead.org>; Tue,  5 Dec 2023 20:38:47 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
	by APP1 (Coremail) with SMTP id cCh0CgDnNw7GGW9lr8E8Cw--.35507S14;
	Tue, 05 Dec 2023 20:38:47 +0800 (CST)
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
Subject: [PATCH -next RFC 10/14] erofs: use bdev api
Date: Tue,  5 Dec 2023 20:37:24 +0800
Message-Id: <20231205123728.1866699-11-yukuai1@huaweicloud.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
References: <20231205123728.1866699-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: cCh0CgDnNw7GGW9lr8E8Cw--.35507S14
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF4kGw13Gw48JryUZw45Awb_yoW8trW5pF
	W3Cr1fGrWrXrn09wn2gr4UXr43ta97Jw48CayxJw1Fv3yUtryagFy0ywnrGr4UKr4vkrs2
	qF1IvrWxCw1UGrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
	xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWrXVW8Jr1lIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Cr1j6rxdMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
	WxJwCI42IY6I8E87Iv6xkF7I0E14v26F4UJVW0obIYCTnIWIevJa73UjIFyTuYvjfUoxhL
	UUUUU
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_123905_639325_FDA4D777 
X-CRM114-Status: GOOD (  10.79  )
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
block_devcie.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 fs/erofs/data.c     | 17 +++++++++++------
 fs/erofs/internal.h |  1 +
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index c98aeda8abb2..b9d2c90f9b22 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -32,8 +32,8 @@ void erofs_put_metabuf(struct erofs_buf *buf)
 void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
 		  enum erofs_kmap_type type)
 {
-	struct inode *inode = buf->inode;
-	erofs_off_t offset = (erofs_off_t)blkaddr << inode->i_blkbits;
+	u8 blkbits = buf->inode ? buf->inode->i_blkbits : block_bits(buf->bdev);
+	erofs_off_t offset = (erofs_off_t)blkaddr << blkbits;
 	pgoff_t index = offset >> PAGE_SHIFT;
 	struct page *page = buf->page;
 	struct folio *folio;
@@ -43,7 +43,9 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
 		erofs_put_metabuf(buf);
 
 		nofs_flag = memalloc_nofs_save();
-		folio = read_cache_folio(inode->i_mapping, index, NULL, NULL);
+		folio = buf->inode ?
+			read_mapping_folio(buf->inode->i_mapping, index, NULL) :
+			bdev_read_folio(buf->bdev, index);
 		memalloc_nofs_restore(nofs_flag);
 		if (IS_ERR(folio))
 			return folio;
@@ -67,10 +69,13 @@ void *erofs_bread(struct erofs_buf *buf, erofs_blk_t blkaddr,
 
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
+	}
 }
 
 void *erofs_read_metabuf(struct erofs_buf *buf, struct super_block *sb,
diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index b0409badb017..a68b0924c052 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -224,6 +224,7 @@ enum erofs_kmap_type {
 
 struct erofs_buf {
 	struct inode *inode;
+	struct block_device *bdev;
 	struct page *page;
 	void *base;
 	enum erofs_kmap_type kmap_type;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
