Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B519CC433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694FA2226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:34:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I7bCC5JX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QHCGxvwZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694FA2226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m9sElXGfeVYl/oWDRO5Pj/8lzrPnMYznSZa7Zo7hfhc=; b=I7bCC5JXF6OBhfIztmzGYNFIK
	6GEBETdei7XkwnSYShDEPHO5qjUyDuT1Ks9AX7ZHvcfKkshooaNKjJVpEr2u4Gqzy9rN3izaTAZCc
	k1Ij57CWgWhHbcXv7/OyWdFCMhGu7uNy6HfSZfjxefGUUHMPvq4u3+zmsb4AiiaiINTazRzuupX/j
	0itid9pA8lw9meCUfIOXTlLsWa6LiSri48U91hBY9rSrnJkthcoSPuXbG++7DaI6n6g14xep2LKbZ
	24VmY1K9lBVx8oo2++82G0UbP+MC9xnzwboYKjxKHK7fUL1fuHzkBqfm0oMP0cDMOzWyD/DbDJzuR
	shSgLPCPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtSA-0004Kw-UB; Fri, 09 Oct 2020 14:33:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQN-0003N7-KD; Fri, 09 Oct 2020 14:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qnANyeE8BGUfs9EI0mAgvyYgGmWNNC+tzF64JAGclAM=; b=QHCGxvwZzOX1kKFzij5mlSA/gw
 QTEkEHUkZeBUJ3wxqkKLJnb+bsoPZd4hqA4z6Fwej0ZQFO//xttCyk0G8YeGWpkWOR3Ke/QHezikU
 UDp2rHaCqzXEJaLyZsMKYIcB76E++KCon/B6LkQ7B4lkZm/QIUpuSjEl7+/dqENZ1ckEIQZVsUjZ7
 ks/g/Az4xPcjq9NueOILPQhW/QPHNUAt/TaqD3NrozoRyFrwY7lri5+g0QXxkQNUY8pwlwF5g61iK
 i1MIhRgWYaawB21c84FTADz1O9wLc66fLBSz21rg1EdS0WrlcP85GM4DMvNPwUHqexLNS+zDBNn2N
 9ny/3G4w==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQM-0005vs-7D; Fri, 09 Oct 2020 14:31:10 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 12/16] ubifs: Tell the VFS that readpage was synchronous
Date: Fri,  9 Oct 2020 15:31:00 +0100
Message-Id: <20201009143104.22673-13-willy@infradead.org>
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

The ubifs readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: Richard Weinberger <richard@nod.at>
---
 fs/ubifs/file.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b77d1637bbbc..82633509c45e 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -772,7 +772,6 @@ static int ubifs_do_bulk_read(struct ubifs_info *c, struct bu_info *bu,
 	if (err)
 		goto out_warn;
 
-	unlock_page(page1);
 	ret = 1;
 
 	isize = i_size_read(inode);
@@ -892,11 +891,16 @@ static int ubifs_bulk_read(struct page *page)
 
 static int ubifs_readpage(struct file *file, struct page *page)
 {
-	if (ubifs_bulk_read(page))
-		return 0;
-	do_readpage(page);
-	unlock_page(page);
-	return 0;
+	int err;
+
+	err = ubifs_bulk_read(page);
+	if (err == 0)
+		err = do_readpage(page);
+	if (err < 0) {
+		unlock_page(page);
+		return err;
+	}
+	return AOP_UPDATED_PAGE;
 }
 
 static int do_writepage(struct page *page, int len)
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
