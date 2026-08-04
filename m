Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F3C5518F
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6FzePftFloBtz7GOqNWL6z75nXks5hoovA8wLoxRIVc=; b=i9elph05QNlddn
	loWD4LBmSjB28Hb95dRKS93JzoujsVbdLdsPsCGyN7w4Hrkb0BimwKUNWlxCvx5pIceg9KCWgWN4F
	Vf+yg+ypCI+uRmYm8feNZnNYKLyl/McqzpDGQVewOEKn8hMkOPXXhpGnHVhIw9KJzonJJMejbXxjv
	VrgEWllj4orDHGtcCIvYmrX58abQDGXVDh37bs4njg/vjjfHJBOQrkrTncUIWbrSOjh3nGFwqCCg6
	6CDcuMww7Yzed0GnOCPX9WrBUgleHlRr2KGG0QU3nr44tcRrHXt6KAKZq5d8xqtrB0NDLdhGFs2ZO
	qnM0JJbNLDZ+QwYMbTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCs2-00000001bjx-0YjH;
	Tue, 04 Aug 2026 10:59:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCrz-00000001bj3-3tJH
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 10:59:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 670184E410D9;
	Tue,  4 Aug 2026 10:59:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 351A56029E;
	Tue,  4 Aug 2026 10:59:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E1B311C32B2D;
	Tue,  4 Aug 2026 12:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841173; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3uxkJ+skcsodMxGfK7sWh8GYFRrQBfgk29TEWR/eWV8=;
	b=2v1kXaiDbQ5YDI2xiRGCzGWvlDMU1jp+SwnSbWAuHK8GRb2U/diBNLHtW/Hi7SUw3b5OIk
	GtVnrWNil64rDIEqc3gQjvF5Ba5x6ZDjCGwvy9W36JD7xj42H5kVLtG37W0p2uFMlm6Rcz
	woJYMfZgdhTbC146oieDiorNrcsr68VJ98tXuuSWYdIz+wk34NDBwIc6Z6HCt9C7nGKqa2
	/yXp1LBk9X2acHEK3oi8l6rlbe+HB/XneS24g4bcaUeo/9TKpAb3LObriOPxd579qRs8AN
	CTZMcucEKBBVw6Y5exsZkSikLYB7i4lVrbDQw0SWM0t11E9RUNi9yWzMh8ufGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:01 +0200
Subject: [PATCH v3 03/27] mtd: spi-nor: Unconditionally parse SFDP in the
 deprecated path
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-3-542ce107bc92@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-0-542ce107bc92@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_035940_114486_B617ECBB 
X-CRM114-Status: GOOD (  13.45  )
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

As of today, the deprecated initialization path only attempts to parse
the SFDP tables when the flash entry advertised a dual, quad or octal
read capability in ->no_sfdp_flags. This was initially a surprise to me
since the documentation and commit logs I read while searching the
history do not clearly explain why. It seems that this is some kind of
(double) legacy behavior since a change made it clear in 2021 that in
order to skip trying to parse SFDP in the deprecated path, chips should
be marked with SPI_NOR_SKIP_SFDP (in which case the deprecated path
mentioned in the title will not be attempted).

As a result of this situation, Winbond W25Q32JV-Q/N and W25Q64JV-M
chips, which feature good SFDP support, are using only the stale flags
in the ID table because of ID reuse. I tried to remove the stale entries
but this change got refused because it would break support for legacy
chips without SFDP support (until ~2016).

Parsing SFDP unconditionally seems safe:
spi_nor_sfdp_init_params_deprecated() already restores the legacy
parameters whenever parsing fails, so non-SFDP chips simply fall back to
their previous behavior. As stated above, anybody bisecting a SPI NOR
boot issue and getting to this commit should add (and contribute) the
SPI_NOR_SKIP_SFDP flag in their no_sfdp_flags field.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..0c8630a54985 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3087,11 +3087,7 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 
 	spi_nor_manufacturer_init_params(nor);
 
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
-					SPI_NOR_QUAD_READ |
-					SPI_NOR_OCTAL_READ |
-					SPI_NOR_OCTAL_DTR_READ))
-		spi_nor_sfdp_init_params_deprecated(nor);
+	spi_nor_sfdp_init_params_deprecated(nor);
 }
 
 /**

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
