Return-Path: <SRS0=ZMJ0=QO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F42DC282C2
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 19:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0BBC2147C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Feb 2019 19:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gt7/jVoG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=guifi.net header.i=@guifi.net header.b="opyBbGaP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0BBC2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=guifi.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzlWMGjeVtxFa93hh57xv8RvKcAPn/N6lOOnOe5vhuw=; b=Gt7/jVoGl9sDkk
	9tgwT0Zd5xhsOjfmfZnBXBspw430Mq1TBqciFPjtVy5EZnpQATNkCHqyozoJIRajmf0HKlcavPW2r
	5kOlBs32l6wkEpLJucLOTWEm9nou4IC1Djb4XR+Ehv0vzCyV8mM0DFoSoCU9OCjW/T2Jr15VLYiIa
	Kcp1zgTLNC/L6jge0kPlBRMOfbRedTT7qg10nOhAvcD3vxXPrTeMSOo1ngsk51n2dJlIxwZ3LirWT
	TRpLjAMBx2Yj3gYIdWH1hIbgPW7lFxWGea85doTkCoNNFpR1arBOo0C4M2DUwErFiM958yv2iHuFm
	VWGjv/X0mDOK/l5WesIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grp5n-0005sn-BW; Thu, 07 Feb 2019 19:12:11 +0000
Received: from smtp1.guifi.net ([2a00:1508:1000::6d45:935]
 helo=smtp1.elserrat.org)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grp3r-0002aR-Qo
 for linux-mtd@lists.infradead.org; Thu, 07 Feb 2019 19:11:13 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.elserrat.org (Postfix) with ESMTP id 43wSYY483jz3vy6;
 Thu,  7 Feb 2019 20:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=guifi.net; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=dkim; t=1549566593; x=1551380994;
 bh=8q5ztGFIYxR/LvE4iBQCLymFntFPACL6WzzSLszgqhU=; b=opyBbGaPgSQ1
 2p1ikqET/QlF+y7exMtF/d1GH1nsi7sCjdzKvXBZwlR6IQ5OzPW08fWtAB9lNhj9
 CkEAZkdreBdF5etQO69wCsorwUAPdebTpQKqM7pcOZnSsOzQ8pvYlPE4/UOkhSPo
 z5vQR4US9QzgXog8M/vV1w7lbqVCwr7bpG5t2virgUjTUs4ywQDjcA5SqiYK69Gt
 IxmXibh4oQyIKjXYMb6UD+U4sAFHzPoXIsQooG9bQcbtkitDyGXegL4Q3fNKb4RJ
 2MoXJcqWwxBEYpXoiQiaL+NuvqLi6TmyYc1OLXgQVfZSB3ulbQ9n1m4pvu6WXshN
 ojgWNaimYQ==
X-Amavis-Modified: Mail body modified (using disclaimer) - smtp1.elserrat.org
X-Virus-Scanned: Scrollout F1 at elserrat.org
Received: from smtp1.elserrat.org ([127.0.0.1])
 by localhost (smtp1.elserrat.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id SKM0nJzi-JCb; Thu,  7 Feb 2019 20:09:53 +0100 (CET)
Received: from mail.guifi.net (mail.guifi.net [109.69.9.9])
 by smtp1.elserrat.org (Postfix) with ESMTP id 43wSYV46vcz3vw4;
 Thu,  7 Feb 2019 20:09:50 +0100 (CET)
Received: from localhost.localdomain (unknown [10.1.33.62])
 by mail.guifi.net (Postfix) with ESMTPSA id 5FC176A7B19;
 Thu,  7 Feb 2019 20:09:50 +0100 (CET)
From: Roger Pueyo Centelles <roger.pueyo@guifi.net>
To: linux-mtd@lists.infradead.org,
	Tudor.Ambarus@microchip.com
Subject: [PATCH v1] mtd: spi-nor: Add support for en25qh64
Date: Thu,  7 Feb 2019 20:09:35 +0100
Message-Id: <20190207190935.5489-1-roger.pueyo@guifi.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <fe18a70e-ef22-a91a-7379-55fadb7c0b5c@microchip.com>
References: <fe18a70e-ef22-a91a-7379-55fadb7c0b5c@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_111012_443862_1F247D7D 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com, Roger Pueyo Centelles <roger.pueyo@guifi.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The Eon EN25QH64 is a 64 Mbit SPI NOR flash memory chip found
on recent wireless routers. Its 32, 128 and 256 Mbit siblings
are already supported.

Tested on a COMFAST CF-E120A v3 router board.

Signed-off-by: Roger Pueyo Centelles <roger.pueyo@guifi.net>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 6e13bbd1aaa5..33b2d0158a96 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1741,6 +1741,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "en25p64",    INFO(0x1c2017, 0, 64 * 1024,  128, 0) },
 	{ "en25q64",    INFO(0x1c3017, 0, 64 * 1024,  128, SECT_4K) },
 	{ "en25qh32",   INFO(0x1c7016, 0, 64 * 1024,   64, 0) },
+	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128,
+			SECT_4K | SPI_NOR_DUAL_READ) },
 	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256, 0) },
 	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512, 0) },
 	{ "en25s64",	INFO(0x1c3817, 0, 64 * 1024,  128, SECT_4K) },
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
