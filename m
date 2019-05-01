Return-Path: <SRS0=72Z4=TB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A2AC43219
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 16:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE032089E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 May 2019 16:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCP4Sjop"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE032089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmhOH2FfUoA1Qp6OTNd7SoPxgG9UEmvoqU9oFLJl5Y4=; b=fCP4SjopzlFZl2
	jUi3po+UedNcPVDyPISFcDYHbdkyXQTk/KYyF1eSqO6tXgGZLo2Fk9bgDvYJyNd38Q2yjuQ08ualg
	gopQyJFuC/Jzic5nvvvFvsg/5dRJhSqF/1fkz13T13fJCbjbWt2vWqZb+nforqh1z6vNc1kU5B+ol
	SoxLHNthznq+rXMIKDQ9YBhrhC49ypyd5X/n85WKOn+/p5//F0eeewmZs4wNn/JD1q3BH7J7eCJoi
	mC3wRj9i+xxJkju7qXcaeQhecqi50+3JvRiwJ2vN13CAiddUMXCoH0oIGA6i6sbCtUTmNKnWkRFyZ
	hgxRhtRwIfRqD/Dpm+NA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLrln-0000cD-JX; Wed, 01 May 2019 16:07:43 +0000
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLrlO-0008Mh-Dh; Wed, 01 May 2019 16:07:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 3/4] nfs: pass the correct prototype to read_cache_page
Date: Wed,  1 May 2019 12:06:35 -0400
Message-Id: <20190501160636.30841-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190501160636.30841-1-hch@lst.de>
References: <20190501160636.30841-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix the callbacks NFS passes to read_cache_page to actually have the
proper type expected.  Casting around function pointers can easily
hide typing bugs, and defeats control flow protection.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/nfs/dir.c     | 7 ++++---
 fs/nfs/symlink.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index a71d0b42d160..47d445bec8c9 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -714,8 +714,9 @@ int nfs_readdir_xdr_to_array(nfs_readdir_descriptor_t *desc, struct page *page,
  * We only need to convert from xdr once so future lookups are much simpler
  */
 static
-int nfs_readdir_filler(nfs_readdir_descriptor_t *desc, struct page* page)
+int nfs_readdir_filler(void *data, struct page* page)
 {
+	nfs_readdir_descriptor_t *desc = data;
 	struct inode	*inode = file_inode(desc->file);
 	int ret;
 
@@ -762,8 +763,8 @@ void cache_page_release(nfs_readdir_descriptor_t *desc)
 static
 struct page *get_cache_page(nfs_readdir_descriptor_t *desc)
 {
-	return read_cache_page(desc->file->f_mapping,
-			desc->page_index, (filler_t *)nfs_readdir_filler, desc);
+	return read_cache_page(desc->file->f_mapping, desc->page_index,
+			nfs_readdir_filler, desc);
 }
 
 /*
diff --git a/fs/nfs/symlink.c b/fs/nfs/symlink.c
index 06eb44b47885..25ba299fdac2 100644
--- a/fs/nfs/symlink.c
+++ b/fs/nfs/symlink.c
@@ -26,8 +26,9 @@
  * and straight-forward than readdir caching.
  */
 
-static int nfs_symlink_filler(struct inode *inode, struct page *page)
+static int nfs_symlink_filler(void *data, struct page *page)
 {
+	struct inode *inode = data;
 	int error;
 
 	error = NFS_PROTO(inode)->readlink(inode, page, 0, PAGE_SIZE);
@@ -65,8 +66,8 @@ static const char *nfs_get_link(struct dentry *dentry,
 		err = ERR_PTR(nfs_revalidate_mapping(inode, inode->i_mapping));
 		if (err)
 			return err;
-		page = read_cache_page(&inode->i_data, 0,
-					(filler_t *)nfs_symlink_filler, inode);
+		page = read_cache_page(&inode->i_data, 0, nfs_symlink_filler,
+				inode);
 		if (IS_ERR(page))
 			return ERR_CAST(page);
 	}
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
