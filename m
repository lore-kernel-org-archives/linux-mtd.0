Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38171C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C16392226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5XJEJrO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RXSD4Y3y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C16392226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T7PnVgL2vJ1HOlfVZZOyhFvC2WrV1Lnj2TP+odwieHM=; b=L5XJEJrOs3yzJ4S3jqcLuf8pc
	zOK0WWid1MMn0uHjTZT2SiCeeaeyDGKEGohXT0EEUzF3wbtVqrzlZuuktQXVSoHRe4mdOCQ5mLXZi
	jO6xJZVg9ABRJFodMOxxZ4pTbSkrsxTb23yYqU6bO6/QJrfUdcqH4eU4rF12+ni6eGH2p6/x5R08N
	LV+oSays+mq3PR1cW18//rjBhWJZ1nNU9YLlBNYwfWKJuPhTnC6d+DsbyAezs6TZ5a6jh6aLsQBAh
	5BVt/9Uf0nv4hSv2M5JL8V0X0nDP4JuFWRlKCDVXuuIWWaYo8YWssb8mZwH9LOi4K25xvcXStZmn0
	WP9py46Rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtTE-00050m-BT; Fri, 09 Oct 2020 14:34:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQP-0003Nx-3u; Fri, 09 Oct 2020 14:31:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=nImj1bKEnn8BNhzAOdfSeoUsHCGKAl8C4xu8gKbAVdY=; b=RXSD4Y3y1VdFBy17Ol83ILo5j4
 PTO9WjHf1kj+i3LgA1mNy4EbjzfgjS0N6FQecje43EctVoSoenXTtkxEw+pdNlWwCm8BR6ADWrCIA
 mnFVDJIxU2XLT8heg/WUg+nqj4WmoscRl4jCU97HaGgie7XSB2RUPeAoMPImN/8SdJJjnzOhT4QNS
 xglIypw9zIWbJZ4mgZcnuJZtNl9fnUqLIwebZVq5ZINFMI2qXAUDw31r8pl1UhnILmhEGt/4+kham
 9g1ILW71SDudRyFDHNiDTnj4sun2z0xnV5Wfab1g/k50SJfjbhpHe0FCP3IIQ7UUYwtFbVv1fWRdK
 CNdeSAOA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQN-0005wL-DD; Fri, 09 Oct 2020 14:31:11 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 15/16] iomap: Inline iomap_iop_set_range_uptodate into its
 one caller
Date: Fri,  9 Oct 2020 15:31:03 +0100
Message-Id: <20201009143104.22673-16-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

iomap_set_range_uptodate() is the only caller of
iomap_iop_set_range_uptodate() and it makes future patches easier to
have it inline.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/iomap/buffered-io.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 8180061b9e16..e60f572e1590 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -141,8 +141,8 @@ iomap_adjust_read_range(struct inode *inode, struct iomap_page *iop,
 	*lenp = plen;
 }
 
-static void
-iomap_iop_set_range_uptodate(struct page *page, unsigned off, unsigned len)
+static void iomap_set_range_uptodate(struct page *page, unsigned off,
+		unsigned len)
 {
 	struct iomap_page *iop = to_iomap_page(page);
 	struct inode *inode = page->mapping->host;
@@ -150,6 +150,14 @@ iomap_iop_set_range_uptodate(struct page *page, unsigned off, unsigned len)
 	unsigned last = (off + len - 1) >> inode->i_blkbits;
 	unsigned long flags;
 
+	if (PageError(page))
+		return;
+
+	if (!iop) {
+		SetPageUptodate(page);
+		return;
+	}
+
 	spin_lock_irqsave(&iop->uptodate_lock, flags);
 	bitmap_set(iop->uptodate, first, last - first + 1);
 	if (bitmap_full(iop->uptodate, i_blocks_per_page(inode, page)))
@@ -157,18 +165,6 @@ iomap_iop_set_range_uptodate(struct page *page, unsigned off, unsigned len)
 	spin_unlock_irqrestore(&iop->uptodate_lock, flags);
 }
 
-static void
-iomap_set_range_uptodate(struct page *page, unsigned off, unsigned len)
-{
-	if (PageError(page))
-		return;
-
-	if (page_has_private(page))
-		iomap_iop_set_range_uptodate(page, off, len);
-	else
-		SetPageUptodate(page);
-}
-
 static void
 iomap_read_page_end_io(struct bio_vec *bvec, int error)
 {
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
