Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B279EC432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:38:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 842416121E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 842416121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baudEJMK0BXEbHDtRqCNAZqNIAiEE+XIPSLgFDr43Qk=; b=i7/VxEfSSSkm4R
	VtUYTMwJzRePCDpcmq+IWVyKKAWUzYGSnPmDsSKrti4CscT5QvMcNdAzV5QG8czt7J/JN0hKDOFwl
	MDCwf/Nkn8VR5V3MRJi2FNoZ90M8ZPP76VMWEnrPd3ENoKRmpb/yEn/4Lls7cO0V9PpRa+1Vv/v3o
	qsQClypDFQevgIUPbP1lr4bWXHc4GKeV3wWua34xWIxMlgPxSTTgkylMSJ8wRP7BcyGDInHtPNuyH
	+ts074iX+S05OfvISTEbqMoNhz9BQ87bmgZSziML4J0CuDLtnpxYCv0LWaZ9Genkw/kCKBMQGt7Hm
	mgtlat9QZk5KgBooqc4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4WU-00Fl53-Hb; Mon, 23 Aug 2021 07:37:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4WT-00Fl4N-Ct
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:37:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=d8ougPyR10neolLj0oF8pa2cwhasqlbLsL7gbTrUUE0=; b=f26IJTI1nQaR8jlZLlUqDTyvms
 UfuJR83srDKJX7MR1n3sd2pXx2lQRb/Fbn1lNuPYPv3Z4vQnWJV3Asc/seDka1OABMFPxksDeNSFt
 HRXXlPexqr+T6srnLAAMRsuD/y2zQKuM6pzW9cu5jKFOgOVZbJa8ZMltBxA/s1AFUkJ0fNEigNVdP
 rfDKqhbYh1BPvkSoRZoMxdqiLfioo8fuHEva3WT23WmKIFxcGIFWfpzqv/s5l/lCLdsXhl97QU2vS
 GP4N/wpOAN2ygGzNLRIgwbAewaAh2T0tT1uFbtkCaWi2Idc9Z0t+DLSutNWF51VEu65N2RalCXOAL
 gVOy/zzw==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Vx-009Qpl-NA; Mon, 23 Aug 2021 07:37:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 4/8] mtd/rfd_ftl: don't cast away the type when calling
 add_mtd_blktrans_dev
Date: Mon, 23 Aug 2021 09:33:55 +0200
Message-Id: <20210823073359.705281-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823073359.705281-1-hch@lst.de>
References: <20210823073359.705281-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Pass the actual mtd_blktrans_dev instead of casting the containing
structure to void *.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/rfd_ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 6e0d5ce9b010..6cf9356d3567 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -754,7 +754,7 @@ static void rfd_ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 		printk(KERN_INFO PREFIX "name: '%s' type: %d flags %x\n",
 				mtd->name, mtd->type, mtd->flags);
 
-		if (!add_mtd_blktrans_dev((void*)part))
+		if (!add_mtd_blktrans_dev(&part->mbd))
 			return;
 	}
 out:
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
