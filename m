Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056B0C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89DC12137B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vvLaYj4f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="D645jx3+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89DC12137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8h4ilzVywNyp9e3Ol5Oop4kio46bOR52OkpKNP3neNY=; b=vvLaYj4fNQGqdK5HO0luTqYUb
	A3u6xJ1WPIY/tryqBqEpDiPCmDZ5HCKVGI9NjuH/tdAzzNh7ZfleOU/QXhHBEutQHg4qGHWW4Xlqf
	tJnYvwr+KqGcWD1aKyNEOHInUGGbf8GAWkqVw/jkGuH9A9Hm9SjIM2LBVyNARzvmtNz0A0weNM7mH
	145liKSjR7asJk2owbDQimTSoRphvYhZXuw5L0JjTpvITzOKkqqOCBDLwYPXOCuQitRGMNcMlFZEZ
	r2snpyZi0k9q+qnuqNl3QpPBJElfZBohuh7lEwKOdP/tJ5wIEbiA/7GUOFr0NueEwUav3fE62b5Hh
	JyiSruu2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvZv-0000mx-LK; Thu, 17 Sep 2020 15:12:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYm-0008W9-Pp; Thu, 17 Sep 2020 15:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7PovnjudVvfMFRelS0S3FBS5rSwGm8lIgwb2+HktnS4=; b=D645jx3+cFCsRRamnPvY93SEZp
 5idHKpebB8d3ADFC2w4jUoevXr+eTIRxNa5kP7rmXI6dNgJMDifFkNUwyxkfzlOpmnvRWxVU5jou6
 Xw3Ux6iN9o3h3kHwgElGrUzy3LHDgVNd3s5BPl5exxvz1fUpq9hJvXiR37faoM+sF3w8SWjVVHpn7
 XgSvgnOD/jvaGa9gFE7xBAHrq5dHmW9PfWz6ML6kWQtUWTATDyCEZSzBC/OaokwaNH9edWskgRnmd
 ND+y1E4RMQjT3HXerG2yb2g3MloOlpPyn3rFXB+gng2IT5jOzDOkDYvVy7UnUbP3VIkuuaEa5JGWf
 4qy4un+Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYi-0001PN-HJ; Thu, 17 Sep 2020 15:10:52 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 02/13] 9p: Tell the VFS that readpage was synchronous
Date: Thu, 17 Sep 2020 16:10:39 +0100
Message-Id: <20200917151050.5363-3-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200917151050.5363-1-willy@infradead.org>
References: <20200917151050.5363-1-willy@infradead.org>
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The 9p readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/9p/vfs_addr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index cce9ace651a2..506ca0ba2ec7 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -65,7 +65,7 @@ static int v9fs_fid_readpage(void *data, struct page *page)
 	SetPageUptodate(page);
 
 	v9fs_readpage_to_fscache(inode, page);
-	retval = 0;
+	return AOP_UPDATED_PAGE;
 
 done:
 	unlock_page(page);
@@ -280,6 +280,10 @@ static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
 		goto out;
 
 	retval = v9fs_fid_readpage(v9inode->writeback_fid, page);
+	if (retval == AOP_UPDATED_PAGE) {
+		retval = 0;
+		goto out;
+	}
 	put_page(page);
 	if (!retval)
 		goto start;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
