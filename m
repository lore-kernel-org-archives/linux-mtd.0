Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40F2C25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 30 May 2024 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztsFKrHDREWZC1+4tW48H53+Fx9H9U+xVBR7ITqnWRg=; b=dHkQ8yAGzO2tbt
	4cwPkt+o6doSn+kIpWM0nIzNdtv+vebgYo0opq7PY0anhKjvA8GDuXwjDfJ1pQw8wEL8o97ISXQh3
	nVcOM9GayADQTe9ESXVLnhvcXDzJDWM0D3312LY92XQJSbk6hIlQVdLRnlp6PGkCwrL/NUN14K+Bt
	u1PmgH3YH9X2Gq3DpkhC5jVS8GDIWx/eVQByEBCZW2aAJglvO6rLi5L9s1rx51nOyfVLIFnh2kcop
	2amBfxy+8OnoxhyxHSmJv+PYG1A3vF5ivhomJtdr3I0iBX8nKvbxnTCmvrZpcEXADlH5BXrCTMeGB
	EWGyHnyuZJs+vQReC9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCmH3-00000008LFC-3R4n;
	Thu, 30 May 2024 20:21:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCmH2-00000008LEL-2uQo
	for linux-mtd@bombadil.infradead.org;
	Thu, 30 May 2024 20:21:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=T+7yTmvE0A2HSsaMeB1qy9Qcuwtb7tBxn6fPz6awa4M=; b=UN8piu+/FqOzNlvaftQJTOjAvS
	OYPsSV97020hqpf3mwq0Oyodq6bXikJXpOVtJQHmCmmLw+h4H1wmw6NtsyaxN+jT9C+L6/26M2TaU
	6gd1Sos5Fv9mR0l+At2WlnUT4DebreF6OkFAZYw3/qACIcM28DT/P3ngh9tK6iSJAPh+SykBV82P+
	V9CyZ0yULw/6iB2BdJf3pqBZVBColATVxNJRGYmQXGYD+Jp2ASR5hObkr1m5Z2c8t9+CV1ZjtYRrI
	UKFk/HQBF9+3I6JpABUf9CLGQGBgKeM2nkHFNvUgFSzbgHiB8JR7oxmPBZoEx/TRCT7HNRIsWga3T
	3U6WKghQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCmGz-0000000B8LO-3hDZ;
	Thu, 30 May 2024 20:21:17 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Christian Brauner <brauner@kernel.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Richard Weinberger <richard@nod.at>
Subject: [PATCH 08/16] jffs2: Remove calls to set/clear the folio error flag
Date: Thu, 30 May 2024 21:21:00 +0100
Message-ID: <20240530202110.2653630-9-willy@infradead.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240530202110.2653630-1-willy@infradead.org>
References: <20240530202110.2653630-1-willy@infradead.org>
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

Nobody checks the error flag on jffs2 folios, so stop setting and
clearing it.  We can also remove the call to clear the uptodate
flag; it will already be clear.

Convert one of these into a call to mapping_set_error() which will
actually be checked by other parts of the kernel.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Acked-by: Richard Weinberger <richard@nod.at>
---
 fs/jffs2/file.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 62ea76da7fdf..e12cb145147e 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -95,13 +95,8 @@ static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)
 	ret = jffs2_read_inode_range(c, f, pg_buf, pg->index << PAGE_SHIFT,
 				     PAGE_SIZE);
 
-	if (ret) {
-		ClearPageUptodate(pg);
-		SetPageError(pg);
-	} else {
+	if (!ret)
 		SetPageUptodate(pg);
-		ClearPageError(pg);
-	}
 
 	flush_dcache_page(pg);
 	kunmap(pg);
@@ -304,10 +299,8 @@ static int jffs2_write_end(struct file *filp, struct address_space *mapping,
 
 	kunmap(pg);
 
-	if (ret) {
-		/* There was an error writing. */
-		SetPageError(pg);
-	}
+	if (ret)
+		mapping_set_error(mapping, ret);
 
 	/* Adjust writtenlen for the padding we did, so we don't confuse our caller */
 	writtenlen -= min(writtenlen, (start - aligned_start));
@@ -330,7 +323,6 @@ static int jffs2_write_end(struct file *filp, struct address_space *mapping,
 		   it gets reread */
 		jffs2_dbg(1, "%s(): Not all bytes written. Marking page !uptodate\n",
 			__func__);
-		SetPageError(pg);
 		ClearPageUptodate(pg);
 	}
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
