Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79D0C47DDE
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jan 2024 23:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UObHTc3vAlHdxrHwf+SaQjvkCkuE5ehSm+X9goXCpPU=; b=J/CsuxmsVA61T4
	qByco88cyqthSANf7v5YaIqV/ct21Knnyp8zfqy2oieRB9Zug0skZpNXYVC9yqCP8Rn4cyKK+DKqz
	j7QVIFgK0obKwMiS+eo5cBZSWAXnDjROoFlxKgiZaXycYhMlbIEPlnU+zeTIq720tRqWSi3fFyx69
	iMQYhHc5vaiR1q1haOR/WcSEiFFXKoSWkC8Dr08ycwd2GJZJQ9vgxYOVkGXFmzNnPjlVXUJpRNgcF
	ZBDVtfm3UXTFBN3Ma9Joj/ch2uP6Id6V44pPan9GD51iohMlXqbcCRoL3XRjFOeyvu/P+4mIADqV9
	6atIe3e6AZQ9Cpo5jBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKS2-008ZKT-1A;
	Sat, 20 Jan 2024 23:08:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRKRx-008ZI9-1f
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Jan 2024 23:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m7uG3ThRpJGaUjXXPWFauFpN50fo2M9SmHFQF7oE58I=; b=KExHLQwkgjQKiUlehQizKQMKAG
	f6cLizTk5nZRuZFZqFJZ/ktXsHuJXzPEnUDpDZEYW+ON9IV85R6KWg+2zV2/irVQtP7hHGglfSIEM
	Ylm/WUIgZkGam1VRGfdcgZ5ZZaIfO1zFUAU/eBIO0QemGyv/NPAEtpfYlkJAE5IGYWI3L8TvSThJ9
	YY0rirmGdp3t0LvQAqHbe6hClCkS/03TlRUtBd2JbprzqhlCfWO/1mh5DyISrjLUKK0QTFa2/dOLA
	dNbOKaj2Mh1W/pV7mK2uUAE6gpVuj16QexbM0i70UvcXK/kWbBr8tth1pFI9HpbJVxZWqjgBszbMZ
	aHkZQjhQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRKRv-0000000AzWX-0Qga;
	Sat, 20 Jan 2024 23:08:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 04/15] ubifs: Use a folio in do_truncation()
Date: Sat, 20 Jan 2024 23:08:12 +0000
Message-ID: <20240120230824.2619716-5-willy@infradead.org>
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

Convert from the old page APIs to the new folio APIs which saves
a few hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ubifs/file.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 7d0967daded3..b297582c9b75 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1158,11 +1158,11 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 
 	if (offset) {
 		pgoff_t index = new_size >> PAGE_SHIFT;
-		struct page *page;
+		struct folio *folio;
 
-		page = find_lock_page(inode->i_mapping, index);
-		if (page) {
-			if (PageDirty(page)) {
+		folio = filemap_lock_folio(inode->i_mapping, index);
+		if (!IS_ERR(folio)) {
+			if (folio_test_dirty(folio)) {
 				/*
 				 * 'ubifs_jnl_truncate()' will try to truncate
 				 * the last data node, but it contains
@@ -1171,14 +1171,14 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 				 * 'ubifs_jnl_truncate()' will see an already
 				 * truncated (and up to date) data node.
 				 */
-				ubifs_assert(c, PagePrivate(page));
+				ubifs_assert(c, folio->private != NULL);
 
-				clear_page_dirty_for_io(page);
+				folio_clear_dirty_for_io(folio);
 				if (UBIFS_BLOCKS_PER_PAGE_SHIFT)
-					offset = new_size &
-						 (PAGE_SIZE - 1);
-				err = do_writepage(page, offset);
-				put_page(page);
+					offset = offset_in_folio(folio,
+							new_size);
+				err = do_writepage(&folio->page, offset);
+				folio_put(folio);
 				if (err)
 					goto out_budg;
 				/*
@@ -1191,8 +1191,8 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 				 * to 'ubifs_jnl_truncate()' to save it from
 				 * having to read it.
 				 */
-				unlock_page(page);
-				put_page(page);
+				folio_unlock(folio);
+				folio_put(folio);
 			}
 		}
 	}
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
