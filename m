Return-Path: <SRS0=3ub9=VV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C35C7618B
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jul 2019 07:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33AEC21951
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jul 2019 07:15:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V1sRM/9P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33AEC21951
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NLu3Itgv6nKX9Gjhtoji3QHlhfmwvV++3R42VEnwmmQ=; b=V1sRM/9Pt4i3AR
	iAJjhvnQHgZMDdiRrGtQ/cyy/HKyhy0TB4df39HcUuyEzu9xtAiD2xvrcqV3vZs5Dy8wlDTyZcMqZ
	X9f3YtD+74t2U5aRiOsIK/SC6Y2OxYQPauwhKMuVRC8XsFAnUR72QitsFKEq8J1j83AqO1ZcF/zna
	nrZMsZ1/+fLC0hC9nnRqrbyW4BKFefetEixIoHyTrrNtwvhO2hV1SlWcewj4tmmIKOX37sVHHLkeR
	OqC1zXFPAQvRbwBndG6sb9fAaSbcbB2STyyZO8Kk6SFoLW24C726oTnraIVVm4Rzp/1Q/IWbxuM7d
	a4Sn22GNeziYw7vb5HPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqBUp-00060x-5c; Wed, 24 Jul 2019 07:15:31 +0000
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqBUl-0005zU-NQ; Wed, 24 Jul 2019 07:15:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: dwmw2@infradead.org,
	richard@nod.at
Subject: [PATCH] jffs2: remove jffs2_gc_fetch_page and jffs2_gc_release_page
Date: Wed, 24 Jul 2019 09:15:25 +0200
Message-Id: <20190724071525.18960-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Merge these two helpers into the only callers to get rid of some
amazingly bad calling conventions.

Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/jffs2/fs.c       | 27 ---------------------------
 fs/jffs2/gc.c       | 21 +++++++++++++--------
 fs/jffs2/os-linux.h |  3 ---
 3 files changed, 13 insertions(+), 38 deletions(-)

diff --git a/fs/jffs2/fs.c b/fs/jffs2/fs.c
index 8a20ddd25f2d..a3193c0f3a9b 100644
--- a/fs/jffs2/fs.c
+++ b/fs/jffs2/fs.c
@@ -678,33 +678,6 @@ struct jffs2_inode_info *jffs2_gc_fetch_inode(struct jffs2_sb_info *c,
 	return JFFS2_INODE_INFO(inode);
 }
 
-unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
-				   struct jffs2_inode_info *f,
-				   unsigned long offset,
-				   unsigned long *priv)
-{
-	struct inode *inode = OFNI_EDONI_2SFFJ(f);
-	struct page *pg;
-
-	pg = read_cache_page(inode->i_mapping, offset >> PAGE_SHIFT,
-			     jffs2_do_readpage_unlock, inode);
-	if (IS_ERR(pg))
-		return (void *)pg;
-
-	*priv = (unsigned long)pg;
-	return kmap(pg);
-}
-
-void jffs2_gc_release_page(struct jffs2_sb_info *c,
-			   unsigned char *ptr,
-			   unsigned long *priv)
-{
-	struct page *pg = (void *)*priv;
-
-	kunmap(pg);
-	put_page(pg);
-}
-
 static int jffs2_flash_setup(struct jffs2_sb_info *c) {
 	int ret = 0;
 
diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 9ed0f26cf023..373b3b7c9f44 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1165,12 +1165,13 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 				       struct jffs2_inode_info *f, struct jffs2_full_dnode *fn,
 				       uint32_t start, uint32_t end)
 {
+	struct inode *inode = OFNI_EDONI_2SFFJ(f);
 	struct jffs2_full_dnode *new_fn;
 	struct jffs2_raw_inode ri;
 	uint32_t alloclen, offset, orig_end, orig_start;
 	int ret = 0;
 	unsigned char *comprbuf = NULL, *writebuf;
-	unsigned long pg;
+	struct page *page;
 	unsigned char *pg_ptr;
 
 	memset(&ri, 0, sizeof(ri));
@@ -1325,15 +1326,18 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 	 * end up here trying to GC the *same* page that jffs2_write_begin() is
 	 * trying to write out, read_cache_page() will not deadlock. */
 	mutex_unlock(&f->sem);
-	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
-	mutex_lock(&f->sem);
-
-	if (IS_ERR(pg_ptr)) {
+	page = read_cache_page(inode->i_mapping, start >> PAGE_SHIFT,
+			       jffs2_do_readpage_unlock, inode);
+	if (IS_ERR(page)) {
 		pr_warn("read_cache_page() returned error: %ld\n",
-			PTR_ERR(pg_ptr));
-		return PTR_ERR(pg_ptr);
+			PTR_ERR(page));
+		mutex_lock(&f->sem);
+		return PTR_ERR(page);
 	}
 
+	pg_ptr = kmap(page);
+	mutex_lock(&f->sem);
+
 	offset = start;
 	while(offset < orig_end) {
 		uint32_t datalen;
@@ -1396,6 +1400,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 		}
 	}
 
-	jffs2_gc_release_page(c, pg_ptr, &pg);
+	kunmap(page);
+	put_page(page);
 	return ret;
 }
diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index bd3d5f0ddc34..f4895dda26a3 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -183,9 +183,6 @@ unsigned char *jffs2_gc_fetch_page(struct jffs2_sb_info *c,
 				   struct jffs2_inode_info *f,
 				   unsigned long offset,
 				   unsigned long *priv);
-void jffs2_gc_release_page(struct jffs2_sb_info *c,
-			   unsigned char *pg,
-			   unsigned long *priv);
 void jffs2_flash_cleanup(struct jffs2_sb_info *c);
 
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
