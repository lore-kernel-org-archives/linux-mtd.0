Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08488CE8D6B
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UWJGSpgv6XBNT/TYCx6WwviZIw6l3Fr6KeQrsui7COY=; b=cIw87c/IMIjQOy
	EmTJxIj0199TB19RnwN4KgMaSwjXFGR6dw1II5aIYp2cHtWZdcWwwxsRJt4AL5L4z0TKjEbTPnclo
	+1cw4DLrSBTAyanvWEv1/sqGXHFvi9LTY9JDtxmhLQZ56w+S/vHie4j4oMirCisrGXOT5NGLgxIaD
	kuyGobz51pZ4YrQT6l7W1r0EA8j/GJeqilnHT+vlKuIRsUpAepA1HDwRsnT3Rj7AeSFTTW3+JAm+U
	oXKH0htfreNq9fsdubv7/e6UY82VX4FBWqpU90VlIUe6H96KDltJXVhUq1ltTeurloC/ZZWpMukKh
	/a8poy0FFt37yeBvMfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzm-0000000CtaC-1Xor;
	Fri, 14 Nov 2025 17:54:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzj-0000000CtWU-1Gzp
	for linux-mtd@bombadil.infradead.org;
	Fri, 14 Nov 2025 17:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=xnptK47IhbJsElmEDQ4s7RdwN9OFRU0DAsaYpYA/R/0=; b=R/g4QdKEkrEkSlLwhY7vh4l+Qo
	5OkfdQonVw567ez4lffXN0HXDoSVeXaRMrLu7eakuE8HPfMsmTuS7dcGnDv2vbvs7/fxlctYpS8Tg
	epiGnsYjU4IDzpCKtXWanp0qyTqUucTgfo56qDskIWyESxmHv8mlVFiYxWwU01xlR4K1OcD4pST8u
	JGXArU4U81uTddmDcMR/tuMyfhykkCOPAGqgvfoLx6N5xP4+oi9Hlx0PXG20F+KqTB5BBz5YecTu+
	eYk5JELfxDYfiSDTqRTc7JIXigYthqRrEn6kBIdO/0rj4qj04UTbsyDUJRSuUcDS9g5urtDf1BVGI
	u8p83oLw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzf-00000009i6c-3lEt
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C18DD1A1AB0;
	Fri, 14 Nov 2025 17:53:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90AA36060E;
	Fri, 14 Nov 2025 17:53:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D53010371990;
	Fri, 14 Nov 2025 18:53:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142833; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xnptK47IhbJsElmEDQ4s7RdwN9OFRU0DAsaYpYA/R/0=;
	b=K4tx/2iKZhTsJOWc6AaXgP8mo+vSToGxQT6IaKidwCcvegiYKwT8kVte5P8hftskvcTpSt
	X51ZSejCPih9hwOijkKrUk3O/7ruICBhOH0mFMQyazq7omuAnSZUoTHdf/aDuRDXfZ4Y9Z
	7XiYg6EVpCOvaxrwVH4s6D8m/yv2e+RuMmyKrkzFwBue1SrLDTEy4w+6AKUE0Mks98sf5Z
	L1phRMyIA7nbtD88PHp787p7ogBwMs7iH1ixjk29UXoiHIKGNw8hFdA9RQuWW5WoVisy4R
	/elMlcDnLQ5ff4xYHnLpn2vfXEZZwchKiid5DhPtT57RTY3ohQHTS68Y7hlTow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:20 +0100
Subject: [PATCH 19/19] mtd: spi-nor: winbond: Add CMP locking support
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-19-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_175355_985681_2706E54B 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

All W25Q01NWxxIQ, W25Q{01,02}NWxxIM and W25H{512,01,02}NWxxAM chips have
support for the locking complement (CMP) feature. Add the relevant bit
to enable it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
The documentation about testing the CMP feature has been written based
on a W25H512NWxxAM test run. I would like to gather feedback on this
entire series before providing a very detailed output for the 5 other
almost identical chips.
---
 drivers/mtd/spi-nor/winbond.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index fb855fe44733db5664c200520d19a6be33edc323..22a923e6b9d7d8f1571cd6b45a688c08ff400b63 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -346,27 +346,33 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q01NWxxIQ */
 		.id = SNOR_ID(0xef, 0x60, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q01NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25Q02NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25H01NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x21),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	}, {
 		/* W25H02NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
 	},
 };
 

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
