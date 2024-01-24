Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FBDC46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnefEAKAgQa3eo8ggT3d2cmz3bfUZh70+rolwBNnOMU=; b=wjJQr4e+Lp+O9J
	eZys1gfeQKWz7Mifvx2RUgczoZwWubS9OHOyrpBkwFCa6u+BfSQDsHpwRAhBnhb6FShfFmibOh5+M
	gIy65STv7pNTn+DwtIk/cPP2P2ncnehEfT96VYmLA4hdaqN5muRS7sPaxWKFPiFCKJMsxG20R69Sh
	rKkGTUiZQb7AqOPEI0e11em/Cw0L+/fYoxbiBVNZB0d9VDUFix7CyJYBwKir4XCG4jxxacoELuOME
	qz9SSYCPEe/aac8ZU7UK+V3Zw67v595eKVRuaXXYchscazMQtPTw3RP4QnxfkntA4vpaQ0aOQl9d7
	vmdTHDhpk9ydM2qkYzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rShRE-004Zy8-0S;
	Wed, 24 Jan 2024 17:53:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rShR9-004ZuC-2H
	for linux-mtd@bombadil.infradead.org;
	Wed, 24 Jan 2024 17:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fqHLbWI4Zc33XeNnfCjSzIawcAxfNJE6mbJrRRzUda4=; b=OAi6oQp1wXysGL+Z6C1p5iiGQ4
	5LQ/AQ2Kalnje5HiOrhUu6yogU3Wo/LQLhQrQQjNFD+szNOYabu6Gzw2vsu7EQr0LK4HXOaYFHwUH
	Id1NKzCPBkNTn+f0jcwC4k3ut0KtGqtnAi8RIoNFBP9V7CtFkjWzpPxQ9djrdrDqv24b61QafBwC1
	Pxs5rL4k1BMIIzDuFEgqHbu7cXk4EK8exv3Z2PXP+18QrchG92zwH9sWtp4UmT+09yIuHS5HSgvzD
	K2ETvcYA4OG1YrYYMO3y+KKz/Ws3Krt4xqKZGz2Ko8Am+zu4zZZVvRY7RS8TZjVls+aqobrJYMeun
	fshMCGiw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rShQv-00000007LVW-0KAF;
	Wed, 24 Jan 2024 17:53:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>
Subject: [PATCH v2 04/15] ubifs: Use a folio in do_truncation()
Date: Wed, 24 Jan 2024 17:52:47 +0000
Message-ID: <20240124175302.1750912-5-willy@infradead.org>
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

Convert from the old page APIs to the new folio APIs which saves
a few hidden calls to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
 fs/ubifs/file.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index a4e8bec6c03c..7039c9006f24 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1153,11 +1153,11 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 
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
@@ -1166,14 +1166,14 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
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
@@ -1186,8 +1186,8 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
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
