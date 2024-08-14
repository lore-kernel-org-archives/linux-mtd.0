Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CA4C531DE
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2024 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ce3OVCiJ2SBfBxHBLAJHavQlrPSbUbphzy3ELf7nyY=; b=OPbYcyYV5VBe52
	JCLzraY7TXg4dTOxwhtev9wG+OUnixGXuQlI8Y592mWTDjmk9wzx2AEHesCLYrPg70ItQYAhIOthL
	fXnhfMr9c/5xEG4nTJC5/BmVPq7Q428d29CQfnapq112iPf9MpnNeiJNoHZSeFZGhzEdhrG4r2H+3
	1iAvz97jvBSy5eIreagIptocOtYmKQhqTBYbqEBLfeTH7yHUU1PmCFmcGPo3R5HEvwllz9IhQdeVZ
	xrpFsCQMjhcFYG4WcM58Kt6OkCm8SOKXo9yrqte0S3Q4WMKcomS2NdVOKj+rCVO9pBVuyGlxsleNt
	kusy4eiidZeSEiPpfjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9Z-000000087kB-2b0o;
	Wed, 14 Aug 2024 19:59:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9X-000000087jq-3pXN
	for linux-mtd@bombadil.infradead.org;
	Wed, 14 Aug 2024 19:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=dyVdPuVZWPTtj3niivHVjJclPba065VEMrZlN/1509Y=; b=VRCUv56rDLppLTGlOUP6XX06FM
	U6UYnFzNg7mdEV7rTY/CqOvFfZj/ZatHbLwxZpWyCDXb6Fda9RgdR8K9Il9fGt3ZNeWgIg2rIhLxY
	9lzbxOEuRHQu5GaMDh8TDnJHCzP/ntxAiS1dpjY6beTXgrD7XRmh+gifXKhEohiwwx1voWmop2zHp
	r6d7rBmbyQW/WpXE6CLHAhTQl/fMXupuGcsC82Xq8VWKi3+37Xi6C2/NshcGOFmYO1NW94PpH7JTk
	YIgSoU1YTqi6jsJzd2YTYMVltGqO578+0efmzfUUCay0y/WXGGZjv//3CcXQGhd2Lfp1uv+iqB91P
	OJTfWX8w==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seK9Q-0000000130W-2f8i;
	Wed, 14 Aug 2024 19:59:20 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 2/2] jffs2: Use a folio in jffs2_garbage_collect_dnode()
Date: Wed, 14 Aug 2024 20:59:13 +0100
Message-ID: <20240814195915.249871-3-willy@infradead.org>
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

Call read_cache_folio() instead of read_cache_page() to get the folio
containing the page.  No attempt is made here to support large folios
as I assume that will never be interesting for jffs2.  Includes a switch
from kmap to kmap_local which looks safe.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/jffs2/gc.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
index 5c6602f3c189..822949d0eb00 100644
--- a/fs/jffs2/gc.c
+++ b/fs/jffs2/gc.c
@@ -1171,7 +1171,7 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 	uint32_t alloclen, offset, orig_end, orig_start;
 	int ret = 0;
 	unsigned char *comprbuf = NULL, *writebuf;
-	struct page *page;
+	struct folio *folio;
 	unsigned char *pg_ptr;
 
 	memset(&ri, 0, sizeof(ri));
@@ -1317,25 +1317,25 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 		BUG_ON(start > orig_start);
 	}
 
-	/* The rules state that we must obtain the page lock *before* f->sem, so
+	/* The rules state that we must obtain the folio lock *before* f->sem, so
 	 * drop f->sem temporarily. Since we also hold c->alloc_sem, nothing's
 	 * actually going to *change* so we're safe; we only allow reading.
 	 *
 	 * It is important to note that jffs2_write_begin() will ensure that its
-	 * page is marked Uptodate before allocating space. That means that if we
-	 * end up here trying to GC the *same* page that jffs2_write_begin() is
-	 * trying to write out, read_cache_page() will not deadlock. */
+	 * folio is marked uptodate before allocating space. That means that if we
+	 * end up here trying to GC the *same* folio that jffs2_write_begin() is
+	 * trying to write out, read_cache_folio() will not deadlock. */
 	mutex_unlock(&f->sem);
-	page = read_cache_page(inode->i_mapping, start >> PAGE_SHIFT,
+	folio = read_cache_folio(inode->i_mapping, start >> PAGE_SHIFT,
 			       __jffs2_read_folio, NULL);
-	if (IS_ERR(page)) {
-		pr_warn("read_cache_page() returned error: %ld\n",
-			PTR_ERR(page));
+	if (IS_ERR(folio)) {
+		pr_warn("read_cache_folio() returned error: %ld\n",
+			PTR_ERR(folio));
 		mutex_lock(&f->sem);
-		return PTR_ERR(page);
+		return PTR_ERR(folio);
 	}
 
-	pg_ptr = kmap(page);
+	pg_ptr = kmap_local_folio(folio, 0);
 	mutex_lock(&f->sem);
 
 	offset = start;
@@ -1400,7 +1400,6 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
 		}
 	}
 
-	kunmap(page);
-	put_page(page);
+	folio_release_kmap(folio, pg_ptr);
 	return ret;
 }
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
