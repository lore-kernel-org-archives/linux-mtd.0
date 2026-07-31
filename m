Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC57CC5516D
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2kcEEujlJW7W6QJzIMOaKUZU2RWTiO3s4SRuRWSUDY=; b=0kogJsp1rkxNYA
	KfX7N+UzAR/VfULfk8VKCcZJ2gpu3PM4nrN/0+FYv00142mqHmoZVDmP1BdPjIkO2earQUlKWDWyY
	NJ8SRPDatfvF8J62RJbae0sR8MfxpGurAcy/A3VfYBgsEfgXsNCADHDEnHzWr5UOQgMqIEIIIr8UW
	kIdktrpn9jtY7Dv/idoxvhbVD7VlFDj5jGrL4EulfalhzBM+ouIOSx3dey5dp57VhDQQRWUiwG2Fb
	4BBsZStyQDyc1eXzcC61qxzCY6OPlJygKdyR6U+WA0hNBaKlnGHylEI98XipXNEhshFmjWAafT68l
	U7nnfz1RRMapW0/eG+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplx8-0000000CR8w-03hp;
	Fri, 31 Jul 2026 12:03:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplx5-0000000CR52-2FoM
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 12:03:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 19AF71A135B;
	Fri, 31 Jul 2026 12:02:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2F4B6039A;
	Fri, 31 Jul 2026 12:02:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDC7211C167A5;
	Fri, 31 Jul 2026 14:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785499376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XRms+hYES57u6Us9x2O3s2QZInrDYJog55FBiHONdBA=;
	b=C/bIax7vbpKXAEZjP5pSae9vvNg8jrTWW0gb4Ea+izxC6YFm8qt5EF5fdrwEYAraJ6r1Yg
	zJ47J55dNM4DZ+Qr8mvvS8jmf3T+gdsbxk8nmf7lEU8HeAoyg7yMp/UQQ+EWWkGIvtdUB3
	xFQSsS1E+iL129OtDH+nhcC2YK8gL9XjS4KgGibTXB2LqnLq+69tWn1sNVavxmKqnFcPMe
	KnspWCVVLqCfPhMPhjYiZ63HyRWCtLTjxOJw38lJNnVD6yFcP1ixsGREvr9jWTxtMaBfk/
	L6pmli5w6QMSs4PgAdiW3s3afCkwqHQBcOpbKBtd0BZQZsixjDNPm2Om2GedGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Jul 2026 14:02:01 +0200
Subject: [PATCH v2 08/23] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-8-2549ef1b1af8@bootlin.com>
References: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
In-Reply-To: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_050259_738618_270393E0 
X-CRM114-Status: GOOD (  10.91  )
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

This chip does not advertise it correctly but it supports 1-1-4 page
programs.

Before:

$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 2612 KiB/s
page write speed is 2509 KiB/s
2 page write speed is 2560 KiB/s

After:

$ flash_speed /dev/mtd0 -c10 -d
eraseblock write speed is 3033 KiB/s
page write speed is 2895 KiB/s
2 page write speed is 2976 KiB/s

The CMP capability was historically not supported by non-SFDP chips, so
a Winbond wide late hook already makes sure the bit remains disabled for
them, for backward compatiblity reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index be8cc67eb72f..239944d8a37d 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -307,8 +307,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x16),
 		.name = "w25q32jv",
 		.size = SZ_4M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q64JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x17),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
