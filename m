Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A926C433DF
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C78D52226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:32:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v4b54oIk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TBsddo3U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78D52226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HwqTMoAwxTXzyyNqf/F0qJgHSfU6PjMtPJG+KHVsjFQ=; b=v4b54oIkD9Sfh0JLGWvB4EovX
	hWktmJ2Ex0J51A31gkamcSUJ2t5q+iVE+UuAVWjPUQ/hVb6EvynSbNNsyaKHM3NIK+hcOpx1lGA0h
	bAVkMNCRp9Ng2T4mNdBRHt6Ehu2oAcwKoKCZZKfFHYI3HbSqzpIo0sIXCHG5GEqpXqLuA223AatDk
	/tb2J8Xwn4vUXjZ+loXTBr2uhMTWWOvsNJDzDqW9Ggi7RvM31lJNdSd1Jz+o87eAI691mZ1h8/DCF
	pqKfG/7vBJMIEffFChMalvVkZ2aXiE/j1n9vmxJW9SNXASMG+EYGC8IKwuXzrWHmdA+4Mjs2wljec
	AF6XUqZGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtR8-0003ij-Eq; Fri, 09 Oct 2020 14:31:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQL-0003M6-W3; Fri, 09 Oct 2020 14:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=U62SUaGW7wvOzK2xtP2u7DsjwRF7PHeB8dtYgkbpx0Q=; b=TBsddo3UB2Q94wLdBp5Hs/3UKX
 764D6RJrVYMgAN8PhPRJOS0IFE3JV6hxkUA7hcj4HiKwOEdBT9fb80bNP5m7ekTqxeS5SxKW/3P2t
 EMnSoFsvky2Gp+uGTdymrU4Aw06pwIAJd2ar0blI1uWm7RcTcGboNnFsoWMszUZeGt1HOnmOLp6Tl
 LptcspG9vOt9WedEDXwRBoqe55+ot4qv1gcRZlaRwxQqHRZiV80zUd8KJCWXniAIWjKjbe7GkYcot
 dnXOFvET5LW65DcB48VKnKvAt3GRFL39s6e+2wDhI6ADfD69M/LoD1o7c1YKqiy1k2GI133VcfUR1
 EjlngNuQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQK-0005v5-0v; Fri, 09 Oct 2020 14:31:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 07/16] cramfs: Tell the VFS that readpage was synchronous
Date: Fri,  9 Oct 2020 15:30:55 +0100
Message-Id: <20201009143104.22673-8-willy@infradead.org>
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
