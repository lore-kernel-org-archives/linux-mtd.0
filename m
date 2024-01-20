Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC106C47DB7
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60kdEF0oZwOm2/v/+wZUICbET41ZgqRxhke0LdjI+ts=; b=mhQegbXcCyHriS
	tLukgq42tNxFSHx0oqtdOgNs7+u6o1euLPb9P3V22WP8shEwtHp4WBco29kDLeD8rz321rUz2xilC
	TUY+86GycdlWE5p9nuLE+lu2FTupS65pHwuyapXfzjKBTpPbHRNNmhdm4J+ZtoW36h415oOS/M8th
	ytjtJwU331qynPaMn1Re3Ib6DEExHSJXbdD4jVqV6e9mHG1vO2zzt1GO8Hb5noB/GTcuxR6yipZa4
	9lZ71Mt4T6ofADHNs9G6t6TuDp8mX1a2oDRA55XPaLxf/uvjVr+6nPl82OKJXHip10OJQxW8PD1aG
	76Y5TLr7HUcRB4HX6/iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS4-008ZKw-05;
	Sat, 20 Jan 2024 23:08:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZIQ-2c
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cmAYmF9LuNLBcFztARLEHJ9B1OgFNMdeQW9qvYDCAKI=; b=WrVSiE0jOH7lGcCmA+yqINNSzm
	UyZ2ugwVbX5ouIXRNoclexDEPaMEpPV/my7AS6qJxiXI/V9jWy1DX+yi9pomPYCN0NYndcW+OaUo1
	YzgDltx8PiPA+96RCXf4lT5RHF5beJjGwlw66leVNil825ubYGwHhp257lHWgUP3f8SiUndU2Y9qa
	wm/s5qc2EXTNZCwAjlH9RidFrKMAbjwebGRLWhzAbuWmwd7ZmoMxYM09YEXOcZ8KsuQoRMuQtGMsD
	5TIB9JRabDuSunX8IcpRsEXBio8XBKl2ag41AX3ycQVzxUe6RSMMxjgI+jhlVopulUZeHIDVF3luY
	rZfajl5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRw-0000000AzXd-2ldg;
	Sat, 20 Jan 2024 23:08:28 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 15/15] ubifs: Convert populate_page() to take a folio
Date: Sat, 20 Jan 2024 23:08:23 +0000
Message-ID: <20240120230824.2619716-16-willy@infradead.org>
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

Both callers now have a folio, so pass it in.  This function contains
several assumptions that folios are not large.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index dec5258b4f38..fbbd07390959 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -592,35 +592,35 @@ static int ubifs_write_end(struct file *file, struct address_space *mapping,
 /**
  * populate_page - copy data nodes into a page for bulk-read.
  * @c: UBIFS file-system description object
- * @page: page
+ * @folio: folio
  * @bu: bulk-read information
  * @n: next zbranch slot
  *
  * Returns: %0 on success and a negative error code on failure.
  */
-static int populate_page(struct ubifs_info *c, struct page *page,
+static int populate_page(struct ubifs_info *c, struct folio *folio,
 			 struct bu_info *bu, int *n)
 {
 	int i = 0, nn = *n, offs = bu->zbranch[0].offs, hole = 0, read = 0;
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 	loff_t i_size = i_size_read(inode);
 	unsigned int page_block;
 	void *addr, *zaddr;
 	pgoff_t end_index;
 
 	dbg_gen("ino %lu, pg %lu, i_size %lld, flags %#lx",
-		inode->i_ino, page->index, i_size, page->flags);
+		inode->i_ino, folio->index, i_size, folio->flags);
 
-	addr = zaddr = kmap(page);
+	addr = zaddr = kmap_local_folio(folio, 0);
 
 	end_index = (i_size - 1) >> PAGE_SHIFT;
-	if (!i_size || page->index > end_index) {
+	if (!i_size || folio->index > end_index) {
 		hole = 1;
-		memset(addr, 0, PAGE_SIZE);
+		addr = folio_zero_tail(folio, 0, addr);
 		goto out_hole;
 	}
 
-	page_block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
+	page_block = folio->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	while (1) {
 		int err, len, out_len, dlen;
 
@@ -669,9 +669,13 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 			break;
 		addr += UBIFS_BLOCK_SIZE;
 		page_block += 1;
+		if (folio_test_highmem(folio) && (offset_in_page(addr) == 0)) {
+			kunmap_local(addr - UBIFS_BLOCK_SIZE);
+			addr = kmap_local_folio(folio, i * UBIFS_BLOCK_SIZE);
+		}
 	}
 
-	if (end_index == page->index) {
+	if (end_index == folio->index) {
 		int len = i_size & (PAGE_SIZE - 1);
 
 		if (len && len < read)
@@ -680,22 +684,19 @@ static int populate_page(struct ubifs_info *c, struct page *page,
 
 out_hole:
 	if (hole) {
-		SetPageChecked(page);
+		folio_set_checked(folio);
 		dbg_gen("hole");
 	}
 
-	SetPageUptodate(page);
-	ClearPageError(page);
-	flush_dcache_page(page);
-	kunmap(page);
+	folio_mark_uptodate(folio);
+	flush_dcache_folio(folio);
+	kunmap_local(addr);
 	*n = nn;
 	return 0;
 
 out_err:
-	ClearPageUptodate(page);
-	SetPageError(page);
-	flush_dcache_page(page);
-	kunmap(page);
+	flush_dcache_folio(folio);
+	kunmap_local(addr);
 	ubifs_err(c, "bad data node (block %u, inode %lu)",
 		  page_block, inode->i_ino);
 	return -EINVAL;
@@ -763,7 +764,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 			goto out_warn;
 	}
 
-	err = populate_page(c, &folio1->page, bu, &n);
+	err = populate_page(c, folio1, bu, &n);
 	if (err)
 		goto out_warn;
 
@@ -787,7 +788,7 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 		if (IS_ERR(folio))
 			break;
 		if (!folio_test_uptodate(folio))
-			err = populate_page(c, &folio->page, bu, &n);
+			err = populate_page(c, folio, bu, &n);
 		folio_unlock(folio);
 		folio_put(folio);
 		if (err)
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
