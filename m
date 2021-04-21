Return-Path: <SRS0=I5F2=JS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34519C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 18:32:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 847D9613C3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Apr 2021 18:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 847D9613C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZGZwxRBQNA+H9J1iPnTYR1afbk/eqRi+bbDrUyMRWU=; b=IfdVPFxjj9pkQ2Pn9VwMQPqClz
	WZ6JOy8aBKKDaK+XWABAz8ji+m5Wo9lijf7Lfyf5cZ3X9Hsp14eqshfTEB9sr2IWP1nE08WcgMSDX
	Ibtcsn7ALTE7EOg+e6dPY2eqFSx6QjN+t/rf42dGfXiCBaO3GlIsa7BA6Y1JJL9TzoxaN/UoOROR7
	vVOFhykjRZR73lIUiovXAsNZAlHpbu3UEPM4tIRa9j+J2hhGPXoit4/dI9JSu5o70ACSQFCsixiRl
	/ZNfZk/uFdTdxX95qhB8ydcRuqN499iM9/bvRzA2fpAX/Yykslxq0RDDkKwBhfPt1dqyBI5+jV614
	apxuMAFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZHdJ-00Exjp-7n; Wed, 21 Apr 2021 18:31:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZHdF-00Exji-K2
 for linux-mtd@desiato.infradead.org; Wed, 21 Apr 2021 18:31:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=tqTrrBR8xfH2zWBBwa65XFi655SRhiQyoCWgRzgLTxw=; b=W1B3VOsUDIT+Qgc4jbY7W2is4r
 72pCjCnDMqvde26H/WYMiuSU8Xh2eGmC9+PVRWtNGoPLmrkvmdUvdlO8d07RQz1GVlkoN+Y+dpyvV
 0WQHdvyTfZ9CGmFZJv/kdvpqlkmw6Rk4+tvCWpZ0/FPlreY6nAhDHkc6VC9zdb1NbeRHmcca4utKR
 E2Scrw1xurIOEwwyKD6voPqkEvUBqO/LXsjvvg1FzyeNyfpixaE7I1CMC+voMu2NwPrGT89xs5GWr
 TVu/jf+rTtQMTeyJxx0zqfaHLIttp8a455h+Y5/iyC3VHKAvCDNj5IUjQ045RTl+puwhoqLMVjcjP
 K8VHIgEg==;
Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZHdB-00D6Sl-OY
 for linux-mtd@lists.infradead.org; Wed, 21 Apr 2021 18:31:23 +0000
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 72C61440209;
 Wed, 21 Apr 2021 21:31:14 +0300 (IDT)
From: Baruch Siach <baruch@tkos.co.il>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, Baruch Siach <baruch@tkos.co.il>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] mtd: qcom_nandc: allow override of partition parser
Date: Wed, 21 Apr 2021 21:31:09 +0300
Message-Id: <cf470f05af514acd5bd94548804ffa96b966a0a8.1619029869.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_113122_042383_FBB39413 
X-CRM114-Status: GOOD (  11.92  )
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

Commit 82bfd11f1b03 ("mtd: rawnand: qcom: Add support for Qcom SMEM
parser") made qcomsmem the only parser for qcom_nandc partitions. This
might be problematic for systems with both SPI and NAND MTD devices.
When booting from SPI flash the partition table should not apply to the
NAND flash.

Prepend cmdlinepart and ofpart parsers to allow override of the
partition parser.

Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index fd4c318b520f..30cc85a32cd7 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2821,7 +2821,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	return 0;
 }
 
-static const char * const probes[] = { "qcomsmem", NULL };
+static const char * const probes[] = { "cmdlinepart", "ofpart", "qcomsmem", NULL };
 
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
