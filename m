Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D504CC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLEZVxiU8KVaiD2hpF7v6WJHa7JWk7FOhv8mj8uC2gs=; b=vQdWIbMTRgq2TX
	9N/vX8dI/ZdKuu4XaXr+J7JP3PHLJtNtupUiU7WS9t9WRzRZmn97uZZm3fw3JaJmd4bDRZKFIqQA6
	gin9MCyOne8WK+gIh3I3byx5tRVpj7M+oSuuE6DqiOqCqstI6m/YLisZeicZZmWtdZ7CD73OsvDtN
	SJAtNqsyNYLs7BhbIRjTajnmrNL2ERoJow9kcSqXK9vOdQEgHl0OeolifJf8kO9pf8S8R8bfVR65M
	+mkWd8OAVLp77T0LaqDYYxyfMwqdOzyzZqdM5AShTxFHdZRT1nYcDFiADl7tXBaBNPRMQOstvWxXC
	LJ4w6RR8wV559rQY2wUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR7-004Zt6-1g;
	Wed, 24 Jan 2024 17:53:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR0-004Znv-2I
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4uSPcgPGqp7gK3lPSg8vS+f9LEvj4oF12i+6rV8hq6A=; b=CXDb07VrQCb/5Y/cEm+JA2LhRO
	CiWTbLTz3WqXdOuT/5zAgdTGwoRJWcs18VCqY7j1hofPcRJ9Myu6oBsNtQr4TuQgjC5Zh65EbO1/v
	coatwakTcR5FXjyCJE/MNRnsCA/q9i9R7ufqv21wIzPTOe2Pk50aH33EtRteRr+jK4L8Qo8iyk3ZV
	OukWDTu3cNT/YRPPBk9XJ4+Iu4o6aa+xPSbOjSvTjCvhGHOWd4tfOOFsf77vJsPV962SHZErSusVU
	bjkTEzvIRE3tP4uiKCivBXzb+H1rJvdZdh+s9dxXE5M59spMPrz2pjuyzKU7YSTRICBi1eJAv4HRt
	QGNC36/g==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVw-3gGu;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 13/15] ubifs: Pass a folio into ubifs_bulk_read() and ubifs_do_bulk_read()
Date: Wed, 24 Jan 2024 17:52:56 +0000
Message-ID: <20240124175302.1750912-14-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124175302.1750912-1-willy@infradead.org>
References: <20240124175302.1750912-1-willy@infradead.org>
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

This saves a single call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 9cd2e6d37c5d..f481fca7f53d 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -703,15 +703,15 @@ static int populate_page(struct ubifs_info *c, struct page *page,
  * ubifs_do_bulk_read - do bulk-read.
  * @c: UBIFS file-system description object
  * @bu: bulk-read information
- * @page1: first page to read
+ * @folio1: first folio to read
  *
  * Returns: %1 if the bulk-read is done, otherwise %0 is returned.
  */
 static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
-			      struct page *page1)
+			      struct folio *folio1)
 {
-	pgoff_t offset = page1->index, end_index;
-	struct address_space *mapping = page1->mapping;
+	pgoff_t offset = folio1->index, end_index;
+	struct address_space *mapping = folio1->mapping;
 	struct inode *inode = mapping->host;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	int err, page_idx, page_cnt, ret = 0, n = 0;
@@ -761,11 +761,11 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 			goto out_warn;
 	}
 
-	err = populate_page(c, page1, bu, &n);
+	err = populate_page(c, &folio1->page, bu, &n);
 	if (err)
 		goto out_warn;
 
-	unlock_page(page1);
+	folio_unlock(folio1);
 	ret = 1;
 
 	isize = i_size_read(inode);
@@ -810,7 +810,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 
 /**
  * ubifs_bulk_read - determine whether to bulk-read and, if so, do it.
- * @page: page from which to start bulk-read.
+ * @folio: folio from which to start bulk-read.
  *
  * Some flash media are capable of reading sequentially at faster rates. UBIFS
  * bulk-read facility is designed to take advantage of that, by reading in one
@@ -819,12 +819,12 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
  *
  * Returns: %1 if a bulk-read is done and %0 otherwise.
  */
-static int ubifs_bulk_read(struct page *page)
+static int ubifs_bulk_read(struct folio *folio)
 {
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 	struct ubifs_inode *ui = ubifs_inode(inode);
-	pgoff_t index = page->index, last_page_read = ui->last_page_read;
+	pgoff_t index = folio->index, last_page_read = ui->last_page_read;
 	struct bu_info *bu;
 	int err = 0, allocated = 0;
 
@@ -872,8 +872,8 @@ static int ubifs_bulk_read(struct page *page)
 
 	bu->buf_len = c->max_bu_buf_len;
 	data_key_init(c, &bu->key, inode->i_ino,
-		      page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT);
-	err = ubifs_do_bulk_read(c, bu, page);
+		      folio->index << UBIFS_BLOCKS_PER_PAGE_SHIFT);
+	err = ubifs_do_bulk_read(c, bu, folio);
 
 	if (!allocated)
 		mutex_unlock(&c->bu_mutex);
@@ -887,9 +887,7 @@ static int ubifs_bulk_read(struct page *page)
 
 static int ubifs_read_folio(struct file *file, struct folio *folio)
 {
-	struct page *page = &folio->page;
-
-	if (ubifs_bulk_read(page))
+	if (ubifs_bulk_read(folio))
 		return 0;
 	do_readpage(folio);
 	folio_unlock(folio);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
