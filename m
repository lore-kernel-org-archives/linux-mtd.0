Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29458C55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAFPFGi59PdK80qBGwZtPVTmgSpgNc3GN8zXSI1Tm+4=; b=lUCQlxNBkHhdUI
	nw4xGidRx1dvguKFHnnnn3UxbkNfk+EiFHMoEQyQVRbkXHDcK/FofncFydg/I/HHuTp51nMFGgrqF
	qrteXOq9m0AQtFhh8/cLSb9pymyqiV1LDwtd5H4ijeA894dtFoiT7Y5ANjIzZJWXtHOJ3HJ73uHfm
	iT9oNb+PY6Foc9TM2EVjC7FaaQshJS7nUFd7Uzw2XgRCoJuXsUpCWx36reaYq4o7kORlU2EGfwFd2
	0KCGnLz+aJvfFU/2BMG6sMIfxHzpqXumD69iQxgeaQeGZKg9RIYGm4guXGH1yFXJi0QfvrCJep1Ki
	IEzyr7S67qMX9wexEbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWau-00000003T0r-4AQu;
	Wed, 05 Aug 2026 08:03:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWao-00000003Ssu-21t9
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EDA634E4104C;
	Wed,  5 Aug 2026 08:03:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C28E8602AB;
	Wed,  5 Aug 2026 08:03:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36BB111C34367;
	Wed,  5 Aug 2026 10:03:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916992; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c72GfLvgeyfX5tlbGion+ZPSbnfinCz5XlvBLoX4LVw=;
	b=0n//tW5uH/A4sb/8UqsLtS5Su7vj6IG+ViV/pikKhwMQw7OOY4suHs1KKvUVcKlZUC1Asz
	t7rHfXw7l/Pnnu+p/qiMJJs5es2R+jtD8P0LZfs+nP7dkGnntIdsZ91icbssI9aLeQxcJR
	CPZey/nzGwlVquhxlzCzyZfzk/fTe2gkLMpAkhEse4yE2x0tQ7POl1odd1TMcUxXu0ThKl
	otjM3ov4PMD3js4nyURSl3t6Gdrk0vF0PC5jn91tb5G7gQOJTohoNrbDRMBK7NeaT6gP0C
	EwMswLipDpe3WvCvACgjQDXldAAVMyIJZ12pDJOQSqol6GZA5soezaKzW2y34Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:38 +0200
Subject: [PATCH v5 13/28] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-13-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010314_717550_9FF1481E 
X-CRM114-Status: GOOD (  11.30  )
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

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f7cdbf1a56a5..456050fdd251 100644
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
