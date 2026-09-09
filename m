Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442C4C79FB6
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 15:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpksyy8ck3i3K/hTpOTJsHnes0HPg2YqjGnNVs12twA=; b=u6X4MEIZQvxVKd
	dKhpNPbV5TEIztFKn+Ci4OH+Yk//FtufeuxSFmK+dmjPbszvAomQI7p3i8cvi+T45XUqA8OV3QAHa
	UFpC8TUYjJYEygas6w2lzwCsq12oIruiI36tvEdQb5H+j455YoU9xgSeaBIYp46vj4qFiK3JmQcdw
	Rmz10fFTFRIPkczbZr/zUnAVlzLxh7o6xoeCnkffKedxEDBapX82UgOQd5HydF1SNXhH2rxW/cHzB
	YpeSv1gdzhpYoNdKz67QnliW8C/j/S++jR0rvS3D9Yhj6q/9l44MGcCv8bJ31YfwvGelvHkjjGOtq
	CuAe54YJ3InaFTeE6gWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KBL-0000000C9FU-2deq;
	Wed, 09 Sep 2026 15:25:51 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KBI-0000000C9Dd-33dk
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 15:25:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CA88A1A1A7D;
	Wed,  9 Sep 2026 15:25:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F7DF60448;
	Wed,  9 Sep 2026 15:25:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6F9511C7AF6A;
	Wed,  9 Sep 2026 17:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VgAafngqW7qJ5v4+IjgL/cytyMQZkw0gU3BV4hiArOg=;
	b=0b20iL85P4KV0PoHbp1+qSvbfAdR6NGH4HGyz3UlpdW8jH0RXN4ciJoGkxaeQagGP8kQLz
	s+NJ51SZgPbhmR530FlXKM6hy8P0CsUvRkXArlr8jctIGZSIkCnICN0LzNfX2ka7YoEdTN
	kVP6tVSrAc/tGUzGdKHHMmf+KF+ANEm5926lR9F7yFa9LMqJuRZfYTffw7NPN3bAseP6mi
	OlpYipqMU4qsOYle3DP3H6Dh4aNUji3CLcdVgXC4ZrDXMvmcbvFaPGY3EEZPa3QDzbodbp
	AkO2ysGtUv9qFlRRryhxPaaqn9yXwCHCd5vuN3DwSzr91nuPbQ470q0mx5Ft0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 09 Sep 2026 17:25:32 +0200
Subject: [PATCH 01/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance
 identification of the chips
MIME-Version: 1.0
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-1-c1b20c39dd1f@bootlin.com>
References: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
In-Reply-To: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082548_929263_382278EE 
X-CRM114-Status: UNSURE (   8.61  )
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

The EF 60 16 ID has been reused for:
- DW-P/G (no SFDP support, but CMP and quad capable)
- FW-G/Q (SFDP, CMP and quad capable)
- JW-Q/N (SFDP, CMP and quad capable)
Add a comment to flag these chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f6321c1dc7dc..55c55e41ec92 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -322,6 +322,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32DW-P/G, W25Q32FW-G/Q, W25Q32JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x16),
 		.name = "w25q32dw",
 		.size = SZ_4M,

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
