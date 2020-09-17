Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A64C2BBD1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5E12075B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pDg4Yjaw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rNkQQL23"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F5E12075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9P8zfkwXzcYNJYDWL5JMu4DCdXUUzOVjWLijONeAXXI=; b=pDg4YjawAculH/8Az5BYOSbIH
	f2OFgmUwr19Qa2Cfaw3ytO85cnkX7aSH2ggm2oqDw2o1VO/iu0qjylbDZzLyt7f9RlzhIv3yYgbsX
	m/+WdX9krgM5rAYURfjLN6MOmHEl9C5Rzlf1YrzqY8CrvTvjRlz5AK5CM9B7BGpujfxjiIFbRrjX2
	cCw1uqChQlqcitxlI6TC/vjxPGBGoxrN/kQk0LohxCwzaWHJOr+9E6q9K36o362ySjwr0qLPWng6/
	Ura7HNF2jM+Wk36qlI+beMGhc5IXSHWSy9UCjRB8ffqYAdIUMxjRKCSubfOviK3ARF6Tlz1WHk9Qy
	WZG3+V2/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvZX-0000Y2-9a; Thu, 17 Sep 2020 15:11:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYl-0008VO-Ow; Thu, 17 Sep 2020 15:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=zAZy51PVGFxs64ScUkLAAfIGOTINfzCY3cwZ6yg8A5Q=; b=rNkQQL233o1qC43qgzc5gAcwW0
 JWxbRmm2ZfIwaHZhsWpFEKH6URvvGnOl1lWpFGP1nYY0Sqr7ijYVsrYUtJkFiSonlGtRJl6cimgyP
 lDLV4gyAydyEpflI+vQZ4wM9tquamB9lVliU76d1jfrLZ3AZAK1nSIlPRXGCk+Ogknuo6rL6Fg0xy
 L1asspYZzWlUYbQnnTCDsrSYurULC6YWIxRKHcIflFNXXfqW5r/+hTUi1w8a8PEiaXpPlez6I5SbS
 NPlMlq+FCbmcCu9y8afa0VyqlkfmuaoZLWu95P043ThRs5XDJ3LySRaf0uovI42Oq1qtLiMaK/SK0
 RnSxJNWg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYk-0001QP-FF; Thu, 17 Sep 2020 15:10:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 10/13] jffs2: Tell the VFS that readpage was synchronous
Date: Thu, 17 Sep 2020 16:10:47 +0100
Message-Id: <20200917151050.5363-11-willy@infradead.org>
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

The jffs2 readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/jffs2/file.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index f8fb89b10227..959a74027041 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -116,15 +116,17 @@ int jffs2_do_readpage_unlock(void *data, struct page *pg)
 	return ret;
 }
 
-
 static int jffs2_readpage (struct file *filp, struct page *pg)
 {
 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(pg->mapping->host);
 	int ret;
 
 	mutex_lock(&f->sem);
-	ret = jffs2_do_readpage_unlock(pg->mapping->host, pg);
+	ret = jffs2_do_readpage_nolock(pg->mapping->host, pg);
 	mutex_unlock(&f->sem);
+	if (!ret)
+		return AOP_UPDATED_PAGE;
+	unlock_page(pg);
 	return ret;
 }
 
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
