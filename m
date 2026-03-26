Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51F710A88D4
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Mar 2026 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gI+tFboTztL2QQEu8THlN7aB5Ee8HaVIT3Z20yEi28Y=; b=jDpNJGlsbZPMDW
	qycPYjcnddjZp8Hwn4XHsROtt9nENnYt923rsnYouG5C99A/PA5JedVx2ML0Dco1G729Wsbl4QwqO
	H2biauK5aSrPtn4Nixr3wWKqlVtFVQ54aRnakzHiEcGTwZlxK3dVNS8XlMuc7Fzq8QJuVgetIbME2
	8kwSBkxdpYU1g4M9oZlSBGz4Ydw3MKqIeTsmbOgTKrvPvtCf1bP8p4ZB3CTQ4GTMV4AQYUkmVYb+S
	SQNJtuD1FoU0goRfYaJxHSpst2klkS28PAWcEbKXys37O6D9odKaJ2QOmWqXrKEeEG96dnJ1Rjkg3
	91JZXl6/SCFdnz9X58wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrx-00000005stQ-1mCS;
	Thu, 26 Mar 2026 16:47:41 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nrp-00000005spC-3xfR
	for linux-mtd@lists.infradead.org;
	Thu, 26 Mar 2026 16:47:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73B0B4E4280F;
	Thu, 26 Mar 2026 16:47:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 486C5601FA;
	Thu, 26 Mar 2026 16:47:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D17110450CD5;
	Thu, 26 Mar 2026 17:47:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774543651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MfQsMH01sC5rcQAhuynCASMmcusHRJHKOUkM0tEs7+Q=;
	b=bQOKsQ6QTW6zY4tZTrGpyVQNdfcQexSG6TnhZ+zsTd6oLFowicJL6Uc9KJPg2OPWnH8XDK
	0bd8kf+aW3ynhcZE04MNOjmEr1j5A2OfDRDtZAJ9ychAiaNivK3EHHkEC0OMlhCAbC1hK2
	GlKJ1VaPvFIelUPP0Z8rsC0WKXOzwPj8QkBtnUwyB5XZL9xsWTG/C1UPWZ0s2QyXxLJYUT
	8aasrM3+sL3r0eIUBpYxts+66K98YnpxC5Qb52/wDjnec4U7cxNn+osSAysBYnGWQBQWY5
	LdQkBVFRRdDvtt6RXhXh/jDmEnpbJcmbD8TJaZfN+GyjM55kXDog9oBwXCXlIA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 26 Mar 2026 17:47:16 +0100
Subject: [PATCH 2/4] mtd: spinand: Make sure continuous read is always
 disabled during probe
MIME-Version: 1.0
Message-Id: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-2-0d626e1dfb2b@bootlin.com>
References: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
In-Reply-To: <20260326-winbond-v7-0-rc1-cadence-cont-read-v1-0-0d626e1dfb2b@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Steam Lin <STLin2@winbond.com>, 
 Santhosh Kumar K <s-k6@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_094734_120830_46601E48 
X-CRM114-Status: GOOD (  15.00  )
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

Recent changes made sure whenever we were using continuous reads, we
would first start by disabling the feature to ensure a well proven and
stable probe sequence. For development purposes, it might also matter to
make sure we always disable continuous reads at first, in case the ECC
configuration would change. Doing this "automatically" will become even
more relevant when we add extra controller flags to prevent continuous
reads at all.

Ensure we disable continuous reads if the feature is available on the
chip, regardless of whether it will be used or not.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 45c3afb9cceb..dbe2c463fe01 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -953,11 +953,7 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 	enum nand_ecc_engine_type engine_type = nand->ecc.ctx.conf.engine_type;
 
 	/* OOBs cannot be retrieved so external/on-host ECC engine won't work */
-	if (spinand->set_cont_read &&
-	    (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
-	     engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
-		spinand->cont_read_possible = true;
-
+	if (spinand->set_cont_read) {
 		/*
 		 * Ensure continuous read is disabled on probe.
 		 * Some devices retain this state across soft reset,
@@ -965,6 +961,10 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 		 * in false positive returns from spinand_isbad().
 		 */
 		spinand_cont_read_enable(spinand, false);
+
+		if (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
+		    engine_type == NAND_ECC_ENGINE_TYPE_NONE)
+			spinand->cont_read_possible = true;
 	}
 }
 

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
