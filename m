Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D52C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YldRE/tPrlFElMKMC57XskRoGTedKUHNL2dQVP7ZedQ=; b=tnOL3cs9OHTOfQ
	V3XmsiNL1YXH4wcIYLHQNXkp4J7lpwCGfESzQphNFYjxWzZg0QjNlW4GU5VNyNzPNZ206bceOeFAi
	Hs5aeKMJ3bHPi4THqOUIo0epMYyQRHRz+pwMHZl2ou0+cIyRVAQaoSYvZ8LWIGKgSOhaKmbILHPcZ
	iHPBZZn8859tuzOzWHRecYwSOD55W6fV0O/nW9cArnKt6Kj4T5SKDfPsjVlcRni6wqPODLSHQXmNA
	XWTUJRrNVnf8cRbe9MZc43ewpURPszeZgV76yOfmr+rt7KZIKwWE2d1UBSRHujM1ouHccCE+THu3N
	whqRTvkD9jpC1Ep+CJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZe-00000002qyJ-2WoW;
	Fri, 04 Sep 2026 17:19:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZd-00000002qv8-1Iam
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sKh4l/MPCUBkj9G4diEXPiEht/7smJGXXwcH/6YLYOg=; b=n4TWbqowBlyBQiIUaC5I+BU48e
	wV+NIavlbrax2j5r5N4AviJsORrup1yboERWjYjg+5xCKuwtQL7XPqe7/28vydxyRFOZ2orbJBPLx
	LuH74FF/9W1gerjWgY7B7gTh/SZW8S38kKdNzF+/8LvQiVe71W6tsB3qK4Qmo8hHrGab8sFMhCbHI
	zIzDSLspTzjtk93zob+0rhI0US87Qe7PV994p7b2Vp0su64N50LMdKhPzjz2CL+H3dcaOmAjbO8wj
	6dxTKWUUWzfVBIsXpvsHkCYVqxBDdArlnQImZCk4w1ek7VzIwSHOIyPfaNtiF3o4OctefT8nHiFq9
	ufXfLqNg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZa-0000000EKtb-2Hr9
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C53A4E41518;
	Fri,  4 Sep 2026 17:19:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A0A06057F;
	Fri,  4 Sep 2026 17:19:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A7B4611C79BEC;
	Fri,  4 Sep 2026 19:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542368; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sKh4l/MPCUBkj9G4diEXPiEht/7smJGXXwcH/6YLYOg=;
	b=VZ35fh7KM2HoIYdtOIXl8xRWC45ynY6KqLdfoPSuHArFTjw1KPpm26GoG44Isn2pCYjmGO
	PiRswQmdOXgBZQBTEoPzUnzo6lBQ+ba31U/0hTAPWVSlYYYTLeolpeze29UOKItcHLWvdx
	sNIJ4+mdGiMKbvbLo9IO61KdvcFD9LstYjCAY+VCICBMHXDbT7eDgKFaAXUO/ZZj/H8jro
	ny2HbNiYmW76sRYyDjZ9Zsm59WOBfEPr5ut9iULLtiLew+/PP40c4dU9YTZ5oZWdrSyYg9
	9khwozC0wb2o+Gdrcsjt2pnj7SYPSbCAXeE0/kbePVgNXAsk49kzZW5OgsDbnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:04 +0200
Subject: [PATCH v6 11/26] mtd: spi-nor: winbond: W25Q32JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-11-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181930_691263_5750DEDD 
X-CRM114-Status: GOOD (  10.89  )
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
index 78a4254357e6..484a2d87a4b3 100644
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
