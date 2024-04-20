Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1988AC04FF6
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Apr 2024 02:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B9qWU+9l8ITtm17Mq3hw/O9lF2FwbrWk8rTAoVjf+EA=; b=swqLhYrR0DAc0B
	+VpONTbNn6TdITuPEafy6JxRCG9ofXUdC+3fm1eeYyqWoKtdNWE03ufUg22wGGZG4KGEnNsETgyyj
	JVqYuNdh6Ge97YANndyn3cP3S7x2Zw856FqB8+LyeEpCqisN11pNGUgvjZ2b8W2XaUK3xx62FOEBc
	Qlkm2xPxeB3pZsfQoRpCyOkToGPIVjUBJJ1aiBchsFyttOghE7B5DvZOjkHASX05YDVUz7soiSM7i
	PS1FO9EgYEX/J+Va5ptXoDOscZtK6lMnsnMPKkkpAFCYzSNmVdWy37VZyAMN5ERaiMfcDcMmKzCEh
	s79952q6qcj474vosi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry0oa-00000007dUX-2OgF;
	Sat, 20 Apr 2024 02:50:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry0oY-00000007dU5-32MK
	for linux-mtd@bombadil.infradead.org;
	Sat, 20 Apr 2024 02:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FtvvbXv86623ovyWG3cSTC9dm4lYYmfgrBjy1npS59Q=; b=OKYm/Al+FwhYahzTOGgwhqD5Nc
	I7/4fwWzcvjgc4gR8MjmGgTN7Em91EXe+XXle6Wb7xYQQ8PakkUQkaczbbVMZJdEtv2kEyp3w0liZ
	m9AuySHX1XYgAmWu9iqTTjKKcNtzqSiakDEsBBAgbo8oL5D/2djPp2TP0KryuY7xBMfeRC4KW2/M0
	rG6igylk3pdL4du0dET5/zTKNrCw3Pwfr28VVpc9xasaxVBDPBmUTwvp9TJL+5hK/2qrtaR2ThtgO
	7Wsy8kX2FIiX8ZeVdm11TkkvcCbKRnRbl72ASEnKJYc1nrVFWq5UlOQgvPwAryKWU0er5yLmC0Wrb
	RYxpXWWA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ry0oW-000000095fJ-2VQl;
	Sat, 20 Apr 2024 02:50:52 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 14/30] jffs2: Remove calls to set/clear the folio error flag
Date: Sat, 20 Apr 2024 03:50:09 +0100
Message-ID: <20240420025029.2166544-15-willy@infradead.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420025029.2166544-1-willy@infradead.org>
References: <20240420025029.2166544-1-willy@infradead.org>
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
Cc: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
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
