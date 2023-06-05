Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13387C7EE2D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XgXH6NJGMclHPUEy5rmdSSsZaQqlUKGyUIFxL5Cis1c=; b=juQkkzJS9IYBJh
	ICMm0lbhAFOUJoslM/ZVIaSoiShcVw6Yel4QOKRdASdZyWo7a0+gJ1alIxTM5mK+do0E7RCWpbFnY
	pdcATr82GlrRvMoZ3FM7MGVHHo9xm2vJxON/MGrI84YXjodIWB+x9MFUaZzl8dLt5rx7JaGQbTsCU
	Z9GPSqnetoJvUtPHkwQnBvROJiaGgERPwsjRVVuV3Pt2EWnbgSbLtlyU2iLXJ5/g5CxVnL5gmmBEk
	ZXaoyUiKoTwVrxv1kUi0v7ktnsIkKT/WLSKE7BaCSb+/gWusMNtHapHX0eMTZPPidnH4qKAxr6raV
	voHqI7kN8XxSGeTbVXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPe-00GBnQ-0h;
	Mon, 05 Jun 2023 16:50:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6DPc-00GBmK-0o
	for linux-mtd@bombadil.infradead.org;
	Mon, 05 Jun 2023 16:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0GfcmAeBg6k/hBFcZUxOxfy66QSCNXE92UiLhBOz854=; b=a28EKsM+ya2npBgk2g9nKLGf9n
	03xF44Q1Cm2s/BAE5mVqrV0VW1EPD/wrfBf//JfP2DxPMtG59bYtAW2hyx18tKScXI+uFDd93uV/C
	BMOPcSdbJ/64i1+KeD2kQYvqa+GcGOz7QMWeSMKnkavrXiRIwQCf7yNazr9ZKr1tnR+eo4uy9HA16
	dCbeMMWBCD/Zi5Tab+7evUyIlF36gTJzFbimbByHm2QoK1PxZlQTxxdeoj4wtSe9wMGI0uCX1Hd7J
	5Vy/6cwd1xcGyls8AIJ5+CWMNovFRkbZtZ+liai92SgRClv8FNWsyB9vEI3LuHpKfsW/V4ZxgcU9G
	Dvksdunw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6DPa-00CCb3-Sq; Mon, 05 Jun 2023 16:50:30 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
Date: Mon,  5 Jun 2023 17:50:29 +0100
Message-Id: <20230605165029.2908304-5-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230605165029.2908304-1-willy@infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org>
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

Replace the call to SetPageError() with a call to mapping_set_error().
Support large folios by using kmap_local_folio() and remapping each time
we cross a page boundary.  Saves a lot of hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 53 +++++++++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index c0e68b3d7582..1b2055d5ec5f 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -900,60 +900,65 @@ static int ubifs_read_folio(struct file *file, struct folio *folio)
 	return 0;
 }
 
-static int do_writepage(struct page *page, int len)
+static int do_writepage(struct folio *folio, size_t len)
 {
 	int err = 0, i, blen;
 	unsigned int block;
 	void *addr;
+	size_t offset = 0;
 	union ubifs_key key;
-	struct inode *inode = page->mapping->host;
+	struct inode *inode = folio->mapping->host;
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
 
 #ifdef UBIFS_DEBUG
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	spin_lock(&ui->ui_lock);
-	ubifs_assert(c, page->index <= ui->synced_i_size >> PAGE_SHIFT);
+	ubifs_assert(c, folio->index <= ui->synced_i_size >> PAGE_SHIFT);
 	spin_unlock(&ui->ui_lock);
 #endif
 
-	/* Update radix tree tags */
-	set_page_writeback(page);
+	folio_start_writeback(folio);
 
-	addr = kmap(page);
-	block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
+	addr = kmap_local_folio(folio, offset);
+	block = folio->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
 	i = 0;
-	while (len) {
-		blen = min_t(int, len, UBIFS_BLOCK_SIZE);
+	for (;;) {
+		blen = min_t(size_t, len, UBIFS_BLOCK_SIZE);
 		data_key_init(c, &key, inode->i_ino, block);
 		err = ubifs_jnl_write_data(c, inode, &key, addr, blen);
 		if (err)
 			break;
-		if (++i >= UBIFS_BLOCKS_PER_PAGE)
+		len -= blen;
+		if (!len)
 			break;
 		block += 1;
 		addr += blen;
-		len -= blen;
+		if (folio_test_highmem(folio) && !offset_in_page(addr)) {
+			kunmap_local(addr - blen);
+			offset += PAGE_SIZE;
+			addr = kmap_local_folio(folio, offset);
+		}
 	}
+	kunmap_local(addr);
 	if (err) {
-		SetPageError(page);
-		ubifs_err(c, "cannot write page %lu of inode %lu, error %d",
-			  page->index, inode->i_ino, err);
+		mapping_set_error(folio->mapping, err);
+		ubifs_err(c, "cannot write folio %lu of inode %lu, error %d",
+			  folio->index, inode->i_ino, err);
 		ubifs_ro_mode(c, err);
 	}
 
-	ubifs_assert(c, PagePrivate(page));
-	if (PageChecked(page))
+	ubifs_assert(c, folio->private != NULL);
+	if (folio_test_checked(folio))
 		release_new_page_budget(c);
 	else
 		release_existing_page_budget(c);
 
 	atomic_long_dec(&c->dirty_pg_cnt);
-	detach_page_private(page);
-	ClearPageChecked(page);
+	folio_detach_private(folio);
+	folio_clear_checked(folio);
 
-	kunmap(page);
-	unlock_page(page);
-	end_page_writeback(page);
+	folio_unlock(folio);
+	folio_end_writeback(folio);
 	return err;
 }
 
@@ -1041,7 +1046,7 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 			 * with this.
 			 */
 		}
-		return do_writepage(&folio->page, len);
+		return do_writepage(folio, len);
 	}
 
 	/*
@@ -1060,7 +1065,7 @@ static int ubifs_writepage(struct folio *folio, struct writeback_control *wbc,
 			goto out_redirty;
 	}
 
-	return do_writepage(&folio->page, len);
+	return do_writepage(folio, len);
 out_redirty:
 	/*
 	 * folio_redirty_for_writepage() won't call ubifs_dirty_inode() because
@@ -1172,7 +1177,7 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 				if (UBIFS_BLOCKS_PER_PAGE_SHIFT)
 					offset = offset_in_folio(folio,
 							new_size);
-				err = do_writepage(&folio->page, offset);
+				err = do_writepage(folio, offset);
 				folio_put(folio);
 				if (err)
 					goto out_budg;
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
