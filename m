Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A67C433E2
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 355A02137B
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKSFn7Ka";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rBA3BEed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 355A02137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HrgrRjGe+gL0WsKvw0zKm1s3ZPJpswLmG/3/N23n2RA=; b=AKSFn7KaUK09USuL2Y15qMW7a
	HZwonf9E6mgwZTpZ2Jus5s6zUPt2wX3MqfhQKBjMhs4Vs/BBi6oRWIOhlL4Y0mT/aGMe8OyCZabIg
	2x9t3fa3RDHUIjPH4Fri46Q/JkIgs8/OEirQcAqpNm9Ny0XLq1Pomug0Y0ocoYBiYnLvzl69Tub0M
	f8owxWhsFs1m/YvwW1ARDmWifybrV+RYc7P+ReTIspM/Ds68MawOsJrMLYnsrTxayh9Wovau4i26x
	njZQ4O8vsH3mWR/+4ocC/rHnRItgm6NokQabQc+WrQm4RRGkf/QritzAjNyfYvv4qnpAGSV/1Bvjg
	cg6pd/OnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvZN-0000SE-AR; Thu, 17 Sep 2020 15:11:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYl-0008V7-Dg; Thu, 17 Sep 2020 15:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5bMB1AIyFb3Uo5KQX9JPM+gHHI0JgEg44Zm96s2wWSw=; b=rBA3BEedGxTEi6jjWgdFgG9hWD
 rAtzju3sIMBKwrAld+mQATn7QaELiGbXVXmda93yYxh+yGS2+0GwA617L8+TIuo3Jk8ylfnIXk1LL
 H0TvouglbVTFDzhXbSrLLJR8GAx9F0XOhb7d7HXvbImpXSlYZ+WbfMfJ7KLJgKaDDRuyCUS26Oz12
 KxWnZX+HUeYpcjcOv6pJRJj8WdPq//IKqqm0bFb6zeal4AaAU3BZ/IPEj68NH4x1qS98+Qp9MtRPu
 cADf27TdVH4fZZTEQTThue/nS5onCBKmS8Q73H+9r1P8RaGh4WeCO+yzsvRmbQR5olV5anJvC0EkL
 rdhWhOtg==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYk-0001QE-67; Thu, 17 Sep 2020 15:10:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 09/13] hostfs: Tell the VFS that readpage was synchronous
Date: Thu, 17 Sep 2020 16:10:46 +0100
Message-Id: <20200917151050.5363-10-willy@infradead.org>
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

The hostfs readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/hostfs/hostfs_kern.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
index c070c0d8e3e9..c49221c09c4b 100644
--- a/fs/hostfs/hostfs_kern.c
+++ b/fs/hostfs/hostfs_kern.c
@@ -455,6 +455,8 @@ static int hostfs_readpage(struct file *file, struct page *page)
  out:
 	flush_dcache_page(page);
 	kunmap(page);
+	if (!ret)
+		return AOP_UPDATED_PAGE;
 	unlock_page(page);
 	return ret;
 }
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
