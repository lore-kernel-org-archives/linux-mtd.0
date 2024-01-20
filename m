Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A92C47DDB
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYRDlj9MJaMptHLuTGzXJhjaRRml5Wbs7vjoJxTIRew=; b=wkRogPrEmJTyI7
	q+N8IVMk0PfCV2uw8Gm3MYZMIRoxVG+dmWmIZW8dDZjcWx97LfBtJ8C2vyPBAlKmRhi7r18uFlHVF
	tDPYuzNaKR6KFDErtSvhfyoq/ClBuHwtBgqfGcFba8nzShnFLnO8YcDad5OF/NNwCHaAsp+bsGUGk
	1qzK8smZ7pA5ZOKT9RGFFQWsbfuS9RrXVvBC7U6v18/gxjlIRW4QafLzvYlftVyO65lusS/ThLlkQ
	KIYXyGZ+iDan35F3/qu5gZOHObSTI3iqwPlAVcYL3NnVWguWtVEY4Sj+PKz4R4UbJ9STewyxglpac
	7MDyOP8TfRaidpcqigFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS7-008ZMR-3A;
	Sat, 20 Jan 2024 23:08:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZIO-1l
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qdmDsFMrRPPZa9BFTb/C0Xay6JnZph6F00B4zxqCFUk=; b=tnAGySnMxSKIfsirxyT6TGDy67
	JSth4C3dq5igaT6e+5zPQL44XdkUbc7MyNAwhGh8jbhyZqwMVPLgRwf5gEEXxle5Y7bIlRiDxbBE9
	jVZ94QGtMkzIf+in8zX18KMYj7DFc4Gproz2IRpiXCFNjWqTrE8fuN3tSKf1b8ixuVXSpVJJRpMDZ
	HZXz9wROWFPwK2XW6LgHHz0hMOdohccQanhZLrEfQMvy2ioWr9g5h6LzHx97HGeUlAmc90tB3ndcn
	8Wu1Me0khY8AEHLa2Q3PjEek11vqh3uhsNZhJPud4O9wyuKJfpywjlQgC3/+hqeqXfodDV6eHgxC9
	x/IZbDFg==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRw-0000000AzXR-1hjR;
	Sat, 20 Jan 2024 23:08:28 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 13/15] ubifs: Pass a folio into ubifs_bulk_read() and ubifs_do_bulk_read()
Date: Sat, 20 Jan 2024 23:08:21 +0000
Message-ID: <20240120230824.2619716-14-willy@infradead.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240120230824.2619716-1-willy@infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
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
---
 fs/ubifs/file.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index f34371436a84..8cad1fe9c50f 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -705,15 +705,15 @@ static int populate_page(struct ubifs_info *c, struct page *page,
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
@@ -763,11 +763,11 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
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
@@ -812,7 +812,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 
 /**
  * ubifs_bulk_read - determine whether to bulk-read and, if so, do it.
- * @page: page from which to start bulk-read.
+ * @folio: folio from which to start bulk-read.
  *
  * Some flash media are capable of reading sequentially at faster rates. UBIFS
  * bulk-read facility is designed to take advantage of that, by reading in one
@@ -821,12 +821,12 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
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
 
@@ -874,8 +874,8 @@ static int ubifs_bulk_read(struct page *page)
 
 	bu->buf_len = c->max_bu_buf_len;
 	data_key_init(c, &bu->key, inode->i_ino,
-		      page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT);
-	err = ubifs_do_bulk_read(c, bu, page);
+		      folio->index << UBIFS_BLOCKS_PER_PAGE_SHIFT);
+	err = ubifs_do_bulk_read(c, bu, folio);
 
 	if (!allocated)
 		mutex_unlock(&c->bu_mutex);
@@ -889,9 +889,7 @@ static int ubifs_bulk_read(struct page *page)
 
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
