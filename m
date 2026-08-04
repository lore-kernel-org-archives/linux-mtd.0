Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD8BC561F8
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Aug 2026 11:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSw7HW5kvUIxajpqP/vG2/ug4jZ6fH7vW3jGhdVhoAU=; b=IJw1AXVvje8hXf
	ETi/GK+lfGJZU708w6uvbVUqqBteIHBTZMC3+78WYL0Tz68+yfgmbiHvXrofmxRjKD3RcjfsBSqCU
	bg1tcoOf+bFlQbJPyF+V6onW0tGoTkRdnZWh8Ui3+dFRm7/0ZbiJfnhxQqty5UoO1KpvnktDYfLjQ
	sRKOiXuhcgrXtntafODRwxBVlLYdFmSqtcL5gAusVkns0C2OngIDiR3/Fe/akL3QYb98K1DxTxYnF
	dx6DawynP6B8iPyzwpgi3F/fuNvlyO51zrRbuYq30HfNma8Hivupf4cppG5WD5Zl8MboAjh8UK2g1
	9/dLvIeJVzyBLs5PJy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsV-00000001c4H-10jG;
	Tue, 04 Aug 2026 11:00:11 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrCsT-00000001c1L-1Sdw
	for linux-mtd@lists.infradead.org;
	Tue, 04 Aug 2026 11:00:10 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D949A4E410D9;
	Tue,  4 Aug 2026 11:00:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF3776029E;
	Tue,  4 Aug 2026 11:00:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B150111C32B36;
	Tue,  4 Aug 2026 13:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785841206; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=00AXT94O02wg1hJHvhmGanXpk6la4WmpDmajF31N0Wc=;
	b=FcOSmyuq6XXr6A/uqKKkXuwowYIXjwyYtQpuPqpaz/7zDozaJL2aUeIBh7wtFRjr4MmiNk
	rvLzYNKG9sXYFlr/DyxsPNz5lWg/d+1bk+7DE+55jlW2/JQc6yJTf5t+D/6YW1O/nSKQMX
	TV6qQqmWAOpUxD+7ArbpmL7/X6kL+k8682rjONqIASvnvXC4lguU0nn1tJMg3LKudI2TJI
	qKvXstOYFmCR48qkEO2Rgbsx2zn9y89ZrpYleH0EpmsgMFrY4zuANyyFNs0qmnLWlHgfU9
	MQZS12vLOCo5pzw2W1Qn+GnrB3puA7mT0NQbCvwNOW6BXpIJgPB+4qADNGkH7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 04 Aug 2026 12:59:10 +0200
Subject: [PATCH v3 12/27] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260804-winbond-v7-1-spi-nor-jv-cleanup-v3-12-542ce107bc92@bootlin.com>
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
X-CRM114-CacheID: sfid-20260804_040009_575409_6AFA5BF8 
X-CRM114-Status: GOOD (  11.27  )
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
them, for backward compatibility reasons.

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
