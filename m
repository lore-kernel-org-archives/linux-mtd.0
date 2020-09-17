Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B58C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D83D92075B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QEMx08zb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a+K4f9p4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D83D92075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HwqTMoAwxTXzyyNqf/F0qJgHSfU6PjMtPJG+KHVsjFQ=; b=QEMx08zbAYe8XZxZLKou9qnfZ
	fXUyq+DZliupc6BhpMv6I5yiGm1n7pYPYlVK4RrpOgya2OlCEtaWbwEgLXfG/9BNzfuEJ2rtFrymv
	DMDQHNZ4+B9ts4oWOLdnBO0Um/sB2jKkjDWp+YTmGnFOttLN1Vg0JPq6D6m1LxpWgkUx4JHMV8jaY
	8mBaL84XpEW5wWMpTYGV5wXo3W2NaALArKxmzGEn3FpY3Cpm567wbmd6q+M9Hz2gSUJm7NmuL/ZRF
	nlD/sXT5D1M9heUO1pBMe9+cEMU3eXnOcR7SRz6LI9HnFUG+lD7blHQBDrpOJkaW0h+G2w/OR6Zft
	6bZF1U4qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvZ4-0000H3-Bj; Thu, 17 Sep 2020 15:11:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYk-0008UX-GS; Thu, 17 Sep 2020 15:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=U62SUaGW7wvOzK2xtP2u7DsjwRF7PHeB8dtYgkbpx0Q=; b=a+K4f9p4caAQHaSAXoyEo9jeic
 z4rS6gVD2VceD3F5n0ghyfOLqAZbHLTwI99dJ+d8FGfT/jTf1vAo5dvv+QCapDyOhKA8JoU0dH7RD
 jl4ADHoGw3ZLskEsKuxMRE7ZcodmNtgjg/vR+S4wH8kUjdMw/iyvasBdyOEf/DOf/LzNvzfPhKY4c
 BDymXvXRBCnHXXX5DABtfF6xsFxkpO+KbwOq51fiobz400r64lHL5BJ2mnOPZvZ0GtPVfUU+QiaEX
 Qoc6ZzECgmEic+oThwXQSXLyd+mCy7ExsKIh2V7a4Z93AiINBSZZYIOO3eL3fpc8kC69q1XZ+87IC
 7NyQ+p5Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYj-0001Pp-Cs; Thu, 17 Sep 2020 15:10:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 06/13] cramfs: Tell the VFS that readpage was synchronous
Date: Thu, 17 Sep 2020 16:10:43 +0100
Message-Id: <20200917151050.5363-7-willy@infradead.org>
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

The cramfs readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/cramfs/inode.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
index 912308600d39..7a642146c074 100644
--- a/fs/cramfs/inode.c
+++ b/fs/cramfs/inode.c
@@ -916,15 +916,14 @@ static int cramfs_readpage(struct file *file, struct page *page)
 	flush_dcache_page(page);
 	kunmap(page);
 	SetPageUptodate(page);
-	unlock_page(page);
-	return 0;
+	return AOP_UPDATED_PAGE;
 
 err:
 	kunmap(page);
 	ClearPageUptodate(page);
 	SetPageError(page);
 	unlock_page(page);
-	return 0;
+	return -EIO;
 }
 
 static const struct address_space_operations cramfs_aops = {
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
