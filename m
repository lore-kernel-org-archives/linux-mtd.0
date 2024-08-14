Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCDBC52D7F
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 19:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cGqTtFxLsKbSjrTuxCOv7W3Ly4GOAsJZPlc+gVIWMA=; b=TP0LyfsQZBV++d
	r578/dp3IGGrhxelvmwgVC8NjNmSdrhlxdhhO0pA23QxodYc9QefE4Jj160EHNuod0HenjhxnmHbh
	X43qk+6dF1Ouk/T7CRwhQQBxtgH69CA4yQM+AfM1coqIaSbD0y4EecxsBkg45qZTcSSLqmPaq34Ym
	orfGU8x83YEmZDw8BxcGDXFX8KPXZIDaMyquUHyd/CLOzj5/eiMMYTh1c61Q7qg1DPGNAUmN/f8cs
	w+EPTePssSACBbPZFdPyncrP4rW723Rnn9wJ8ThJbLJjSqYo7TNR70NiPU5F+HW+qqVgfHXMbjT3n
	AeU3YlQcfv+sep+EKxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9W-000000087jk-0139;
	Wed, 14 Aug 2024 19:59:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9U-000000087jb-2xqz
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Aug 2024 19:59:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uV7LvP5jjpQvvHUMOkXdyRNLpd4GhyRBEzDrKs36E8E=; b=SGFb0NicM17bE+zbq2q5jZZYCD
	/GBwKgJIIP/hbRdOG1WGoXdJ5DdEfgth0jh/39pUVpyQhxYPie5+FTOLVR078rN0bAu7ExOx/UOol
	2b5VYXeM+C5wB0JXKk8sFeiiPicgoazGG28RBAYPbpGR4dv/AShtC2us/E8STtD+VbCOQBO4sXcr9
	H15cTZrg/g1FGmulIiiPTfZ10cu6j9VRXt9VQDPHHCV/fl9e2316jCJ11pcDx6BV3ck8UujZQW0J9
	GwrIAWNJk8kkQAHZ5c/i105XBcKBaW5erjDNvWyZT/6XxqZx/5KVQ4r5hqDGjBgoutGi0AL3rrI4Q
	usm15/5w==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9Q-0000000130U-2HO5;
	Wed, 14 Aug 2024 19:59:20 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 1/2] jffs2: Convert jffs2_do_readpage_nolock to take a folio
Date: Wed, 14 Aug 2024 20:59:12 +0100
Message-ID: <20240814195915.249871-2-willy@infradead.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814195915.249871-1-willy@infradead.org>
References: <20240814195915.249871-1-willy@infradead.org>
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

Both callers now have a folio, so pass it in.  No effort is made
here to support large folios.  Removes several hidden calls to
compound_head(), two references to page->index and a use of kmap.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/jffs2/file.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index ada572c466f8..13c18ccc13b0 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -77,29 +77,27 @@ const struct address_space_operations jffs2_file_address_operations =
 	.write_end =	jffs2_write_end,
 };
 
-static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
+static int jffs2_do_readpage_nolock(struct inode *inode, struct folio *folio)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
 	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
-	unsigned char *pg_buf;
+	unsigned char *kaddr;
 	int ret;
 
 	jffs2_dbg(2, "%s(): ino #%lu, page at offset 0x%lx\n",
-		  __func__, inode->i_ino, pg->index << PAGE_SHIFT);
+		  __func__, inode->i_ino, folio->index << PAGE_SHIFT);
 
-	BUG_ON(!PageLocked(pg));
+	BUG_ON(!folio_test_locked(folio));
 
-	pg_buf = kmap(pg);
-	/* FIXME: Can kmap fail? */
-
-	ret = jffs2_read_inode_range(c, f, pg_buf, pg->index << PAGE_SHIFT,
+	kaddr = kmap_local_folio(folio, 0);
+	ret = jffs2_read_inode_range(c, f, kaddr, folio->index << PAGE_SHIFT,
 				     PAGE_SIZE);
+	kunmap_local(kaddr);
 
 	if (!ret)
-		SetPageUptodate(pg);
+		folio_mark_uptodate(folio);
 
-	flush_dcache_page(pg);
-	kunmap(pg);
+	flush_dcache_folio(folio);
 
 	jffs2_dbg(2, "readpage finished\n");
 	return ret;
@@ -107,7 +105,7 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 
 int __jffs2_read_folio(struct file *file, struct folio *folio)
 {
-	int ret = jffs2_do_readpage_nolock(folio->mapping->host, &folio->page);
+	int ret = jffs2_do_readpage_nolock(folio->mapping->host, folio);
 	folio_unlock(folio);
 	return ret;
 }
@@ -221,7 +219,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
 	 */
 	if (!folio_test_uptodate(folio)) {
 		mutex_lock(&f->sem);
-		ret = jffs2_do_readpage_nolock(inode, &folio->page);
+		ret = jffs2_do_readpage_nolock(inode, folio);
 		mutex_unlock(&f->sem);
 		if (ret) {
 			folio_unlock(folio);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
