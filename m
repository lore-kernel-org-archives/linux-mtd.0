Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360E2C2BBD1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CECE620795
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nr8In0mu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZwdX53dg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CECE620795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DM93cGaoor1dICiIe5eg0i1fEDgm830Le3EBapdIoAg=; b=nr8In0muwre8s/u6k0s+KPgfp
	P2/oAlBO3UlmMtZ0CslRWuchdPETXQNo7tPY7bmNVSdYUlBwgN3sVTDM7wo35lu6tqB0ktfEnn2A4
	gzFfCBSs+qDG6nvmB4O1xfXBBVHqaNGiCFkCHsrBN7WrKKX0WHAfqY4HEEO9EoWcpJfmeE0JvYqBR
	fgMvVxwNSWnCAO/itDUR1PQWhxt1BL/Q+cGwGqnHgkcCjM4tsUlYYArn2/dI6jgLRPvZapRf/azc9
	H0n68dI/5iq9K+h0xnhWBqF222XkYAKYo+TwxjlvzB3oUwT3Fmex6bYyVybq6tmnvLL+9cMCcS0Bw
	ujAbW5Jxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvZK-0000Qe-JV; Thu, 17 Sep 2020 15:11:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYl-0008Ux-4D; Thu, 17 Sep 2020 15:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=8Z59nl1ynYz7T8ZQQZFooEYzqOOLn6C4o6AlvTemzR0=; b=ZwdX53dghWPKXi4Rjx3Lj7vsSt
 VelfrbZiXezTGtoteiLyh5dCyQ1ailxO3l/o2S64HU8kJGyS51nzejMxg75SZwmgxeYsjrxlLJ4IK
 Pmkx1/NY5xtil421XUChskrxZKWwpeTkaAqC/hBmUOluMQq/C1i43VmFv6b9PRKlhY4ZhUEM7afEC
 qe+7yqIUGZIpxp4n/YCB6crwYH5t6fyWFNmCSQjr5uYIvzd7Ukxu4/f1U2+E+w4M8CstfyWNLo+hz
 xlYh7wPJtQqM1pYoiETsP2BQp9KyuJBErnDKrqdSOOqoa26HKmMxWosGkyvlSsIamje9UpiSCcDVk
 radcDH5w==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYj-0001Q6-TE; Thu, 17 Sep 2020 15:10:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 08/13] fuse: Tell the VFS that readpage was synchronous
Date: Thu, 17 Sep 2020 16:10:45 +0100
Message-Id: <20200917151050.5363-9-willy@infradead.org>
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

The fuse readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/fuse/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 6611ef3269a8..7aa5626bc582 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -850,6 +850,8 @@ static int fuse_readpage(struct file *file, struct page *page)
 
 	err = fuse_do_readpage(file, page);
 	fuse_invalidate_atime(inode);
+	if (!err)
+		return AOP_UPDATED_PAGE;
  out:
 	unlock_page(page);
 	return err;
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
