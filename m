Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F1BC55838
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFOuP7Hb3WfjXFGCHjiyu+JfJAZo1Y/RE5ZGPrVG6eg=; b=mUPo5d7n7NnhjB
	1LpGXUwTSTblLQq+IjYETH60Z6XnGEdDhVNsKBtY2MM7XPD6QjAlQeUnM/iGsF4ViehdDovSpsjy5
	8OrKoFWYZc1Lp/po+goi/cXlU8Fijxag/tlFkk5TO88COr7uX7hD9Y7i5g3tkYORylnV8LDypAww2
	HbQmUWPS7APTl/ed9lh9+RYKOGSYQKm3OORaomY7OyKndVVf/l190QyaOxTvxW54D9yaOxozGC+0/
	v70YrYqszlcbYCs/w7u24dces40Lv98zuGcuoSAogoFq+bd066E2WuPZKhXEELiQK0BQbsCPpJlNW
	O+uh+TriYduVXIeSBdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl4-00000001zsc-2Tp7;
	Tue, 04 Aug 2026 14:04:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFl1-00000001zpp-3MIx
	for linux-mtd@bombadil.infradead.org;
	Tue, 04 Aug 2026 14:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KTpdBpooTlaJoC3pVHrNhYgn1PsBKEuxZ3T9jd/iHn4=; b=BFJnIMciQmnq538fo7ndmpVYLo
	vvduc1x7dHgzvDXnH7oDhqRCBpX7fokAkE9L2Cb/o1HyyPjBWxxk3Yd55wDM0yU6THk0plTeHz1yz
	x71gBoLPvL+lVq4ysbdhkWFqghLtew58jzFui0+kgmNIFumLl/WDRWbL9dfsQqvnovO1s+wvrXDj2
	5W0Lhz8I+GYF6oIfl8zreeuBAct1K8E/bjsVHd1MzmqvWo2jUxwPNEZxDQXu/s/Ca3tBIF1T/7b6Y
	3k2ghY9Cx58lDB6Nz2q+82rvjQ/SxRbkHFfqcwESGBZl4r4teyLw/jIOqV950Yotg1qlW8COyd/Fd
	qvlrEugg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrFky-00000009yGt-0j9W
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 14:04:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8FA711A13FC;
	Tue,  4 Aug 2026 14:04:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61FA26029E;
	Tue,  4 Aug 2026 14:04:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2A9C11C32D27;
	Tue,  4 Aug 2026 16:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785852274; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KTpdBpooTlaJoC3pVHrNhYgn1PsBKEuxZ3T9jd/iHn4=;
	b=v5D4UbEgo0hzrDTelNaD0j0CYYVgUe0nVjGV/M8C+j66kapSRi5KuKU9d96e0u3v9Kdkc3
	HjxKVYALHrv8UA8CuuTeC+sZFAFTNFUzVAgzDyUG7woS55Df3OgnhptggXPPT7ZDe/2MU3
	CZV+gZvo5IlolOgPhB1lL7ukyOh8qZEuovOFayB/GbOYT5dyyyo1f7HwuRJIRP1Qlwkm1f
	TXrPt0Sw41BtOWxVNeU7swOQK50afTYrZ2z4AmLkpU1sXm33QoeJEBAqvIzNpYzQ3UvV91
	7G05Qg7Sg98KGeWCaSWj+JbINlB73qVNn8/vyxFFQaBZNqUlipRwIGOdkoxryA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 16:04:26 +0200
Subject: [PATCH v4 04/28] mtd: spi-nor: Unconditionally parse SFDP in the
 deprecated path
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-4-ee3445066e4e@bootlin.com>
References: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
In-Reply-To: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v4-0-ee3445066e4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_150436_514467_CF588CED 
X-CRM114-Status: GOOD (  13.29  )
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
index c39c6833c9a4..b4d09f14fff7 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3092,11 +3092,7 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 
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
