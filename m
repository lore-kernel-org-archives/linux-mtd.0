Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD58C4321E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Dec 2022 19:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEh5J4O5DRo93fcRhdnMdLidHAWN4ratYZ3A3NMNMi4=; b=KolVZ55GUCOvy2
	CPRNPvR0D9gBBbwzSP+ym7gQywI61FvY8uns/z5ozQJraDhCFXrFcd6V4jv6e2bE5qU4DudjZdesV
	Mi+X+300tg3CMqirQq3bfm94P5hQ98PttiWrqVonUHzEyUweFtTr35YFzbCW5/LqaE7jVodpT+Drh
	NCAjLlkMYHArSIUBBFIhKb1lNyWfowQQsDNnBA1izUfppCsY/d0JgQkfhLyGxNOqDEcqrGEWOe/tv
	xVkq0Vw0/9LNRlwAho2T6EKO+NlR90fQm6zmnEnCNGkIX0b0pocUhHLACC7RfchSLgrMDdE0liV7Q
	gPRXG3BkTrvHzmwR1CNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pJr-00ALmx-Tl; Thu, 01 Dec 2022 19:34:03 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0pGI-00AHMQ-5c
	for linux-mtd@lists.infradead.org; Thu, 01 Dec 2022 19:30:23 +0000
Received: by mail-qt1-x82b.google.com with SMTP id fp23so1920121qtb.0
        for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2022 11:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qZZ/bmZwEI9aDSPcyDyAicp7ItEQHVjMS3j20zf9fQ=;
        b=aLynhYNyioy+NfHU2wZDQeTHz+lUZ8ovDqQOsYmMrvKUArjXnpnIGeVFpkjV+GMIrF
         z7kQV8oVgUb5/y4/fYUBu9KgERLHJyOPBDzfFVX3GSLCIyT0B9++txvs8jEtstB9R5nI
         714uIkH7csYI/PaSVEqz2yFf2CSRfTG4dhZvA2hlZEmvEe7MHGpvMR1LZ/oZs02tJ4Sw
         zztIViIYrrMentHreQwZgasrF28zBZ/Mx3+yKT1UdX7d6WMvhf2cH7v2R7iuAfJHq8Mp
         U7xTPPsII92xfyyyBw9EyuEjjpiow2qQzq4Pr1LPGb4xB9Fb0I1u4ZC1zKQXi13RTug8
         hdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qZZ/bmZwEI9aDSPcyDyAicp7ItEQHVjMS3j20zf9fQ=;
        b=vZ7BL8RvBW+og54Nfgk23UCDrwd0EVNkGoe7txcEhHVD4k8POIOiLNDl9CNQwGYqEb
         TX8iuSe5rKBt5nmkn6UpuQTBAk2bdcsrkAeBQcuu9H05j1DkSNdFWrRy0a1yvSmvYfAK
         WmssWhyTyFxP8ZSQH2QgMo6qF8TZtBokOmuPNfpds9qUfA+5GYJ/VlWey22jc7dJHBgF
         ep7ilAtuaO9pZeMXCr938LECM5CxiXoP7U2PsZxJHbgAxhbqoyqgQR9Xep7wgCIetuZZ
         DiGt3GKNsQC+fZtsSt+NSEHaO+QyEm7XwQxznFyHfoAgGN262s8JjvYO8D5pC1sHjD7e
         ZTnQ==
X-Gm-Message-State: ANoB5plyZcdWM/o+A1wR1lSLLksMxSuYyjVU+X7LpDmXzk8MdC1PNWdQ
	/S2NrhzYUFWKN+xpyrtElz1qZA==
X-Google-Smtp-Source: AA0mqf5At6RxhQv7SNejD5cYSTYbLIgr8s1qOciJA/0hX80qzNespQZ+0by4P8hyG8anjnTanPYC0g==
X-Received: by 2002:a05:622a:40cb:b0:3a5:7e65:ddeb with SMTP id ch11-20020a05622a40cb00b003a57e65ddebmr44639337qtb.424.1669923020093;
        Thu, 01 Dec 2022 11:30:20 -0800 (PST)
Received: from nathan-ideapad.. (d-75-76-18-234.oh.cpe.breezeline.net. [75.76.18.234])
        by smtp.gmail.com with ESMTPSA id h19-20020ac85153000000b003a6328ee7acsm2977748qtn.87.2022.12.01.11.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 11:30:19 -0800 (PST)
From: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
To: 
Cc: nathan.morrison@timesys.com,
	greg.malysa@timesys.com,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] mtd: spi-nor: Add support for IS25LX256 operating in 1S-1S-8S octal read mode
Date: Thu,  1 Dec 2022 14:30:06 -0500
Message-Id: <20221201193007.261690-4-nathan.morrison@timesys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221201193007.261690-1-nathan.morrison@timesys.com>
References: <20221201193007.261690-1-nathan.morrison@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_113022_244783_238A7D4A 
X-CRM114-Status: GOOD (  10.49  )
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

This adds the IS25LX256 chip into the ISSI flash_info parts table

Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
---
 drivers/mtd/spi-nor/issi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 89a66a19d754..f00f1e621d84 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -74,6 +74,8 @@ static const struct flash_info issi_nor_parts[] = {
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &is25lp256_fixups },
+	{ "is25lx256", INFO(0x9d5a19, 0, 128 * 1024, 256)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_READ) },
 
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2)
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
