Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7080FC27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 18:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZ7XTJ/4kmLuuvz+2RJ3V9NGxNHulBE4gIBCRqPtCos=; b=s6y8fB7N84chQt
	iyk8xd4f1hVukIOB3dBI1wCRi3gfZzw+nnliWMLTy+8spu/E8jgq/aChze+o3nckXUVzaFMZINVE+
	K0NGJxGsA5zFsu7mt7pdjuMh78dEnx/Id2y4GhsMsWjXpdZivEZe/g2qaStp9ZwpeWMPkc9Jp0Czp
	Yt+pXNGpWI4Hv6m9LFmDIW5RffSEOJn54vzU9fd/sr86vE8ZnGq1Be5oi8qtCC1WbIt/ZLIss661J
	R7M2Sx6gKLn0CKSpj3xcexVmD8VxiIo1KyeU+UgmjfPqZqGKHN0ZLng04AHKOUom5C2BFMKPsczDW
	3cDViZOmENADnI+sNElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM54-00000006CGj-0pP5;
	Thu, 20 Jun 2024 18:00:18 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM4u-00000006CA1-3Mlo
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 18:00:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso1336476e87.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2024 11:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906407; x=1719511207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAbEFx8Qx1jb1E3qZFdMOF6RPU8ZJ7qI5KSjiERwRt4=;
        b=ts8zVIkqvOoNUAZ8CKZbqb8WKsvMBRWNz2Oaa0IXtXpTzd19ZuHDXE31nbJiyqLlZg
         C4Fua1dR6R0pGNIRDo3/YntHcqRRNOLlZV11pWQLGKls122D0cjbBiH5MrbFHDtxcakR
         0IudHz6XenHbwNMFa6L1ovlKUbOVE+Jg4APnI1gDizd/ctApmr239O9QxkgoaPliswbk
         ZPTfVwHg53EKhrfTWDegd7bvxi17MBLT7wfqk6xukNP7ZB7JPAP7wAC9TX/goXlQn/px
         taJN+JQ475+cS6jtbex3tExq8rSE6UArAC5875gBb+hJNFVLmFM+Pcrvw/1DAdW39X2v
         eeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906407; x=1719511207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAbEFx8Qx1jb1E3qZFdMOF6RPU8ZJ7qI5KSjiERwRt4=;
        b=bq4FWggWQ/6hFgltdSjCrLDj96gSqfpJIXf6RefVHvBXQZgctFi8oKbx2xJB6HjhBE
         NalUi8SzLabO/7yrWqllyqV2B+pUa1oNBkiZMogypjrzb/YptNslXWumlV5ecWHq/H+Q
         0pDzGYKfmDYYB6UUbCzo2eGXv8Az2wnp76sLAnrLZ5yJBKY4Gx/n7o42k8AjCdgHFJZ5
         p702Q67LyzZuW3blA1CgcjyXbeEzUoWD6F4hqgzMHYdD7gp5KFYCMkuTmXPhE5hMTC55
         /amMlMDJpunYf0ZiPpGoXCCo1XUuhAeC34nPmA4Q2E9aV5YmYukC1q+7NKS7uXYGbR7O
         Xc9g==
X-Forwarded-Encrypted: i=1; AJvYcCXXxOkbwEfEJeT9SzRKAL5mMDnlk7EZADpyiFf2t+doFn5Ivxrj6CMWlOp6x3JiDCBMbuifLi1NUvZKs/0c9M3dh/XsJu7YJHRv6OG/DQ==
X-Gm-Message-State: AOJu0YzQK3O6SkYDclJRfmvNiAZ2nMliAm//hWAW8vgKma/kMiXv+7F/
	nPLgJz/9YHEH4K1L/xAht0y09pJSsIHhYZZU+5IUVOTj5fTvqH1GJ18DaZsRL1w=
X-Google-Smtp-Source: AGHT+IEtbhdQIpbe+lcjaI0rwKVV8L/00YnsN7rJtoUW3011krKwq3p0LrSXUUPIJeqY4Obo4tEkWw==
X-Received: by 2002:a05:6512:3c97:b0:52c:a2e8:dc71 with SMTP id 2adb3069b0e04-52ccaa595eemr5990477e87.64.1718906406915;
        Thu, 20 Jun 2024 11:00:06 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.11.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 11:00:06 -0700 (PDT)
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Yangtao Li <frank.li@vivo.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: Markus Elfring <Markus.Elfring@web.de>
Subject: [Patch v4 07/10] ARM: lpc32xx: Remove pl08x platform data in favor for device tree
Date: Thu, 20 Jun 2024 19:56:38 +0200
Message-Id: <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_110008_926538_C14F5D3C 
X-CRM114-Status: GOOD (  14.94  )
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

With the driver for nxp,lpc3220-dmamux we can remove the pl08x platform
data and let pl08x driver to create peripheral channels from the DT
properties.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
---
Changes for v4:
- This patch is new in v4

 arch/arm/mach-lpc32xx/phy3250.c | 54 ---------------------------------
 1 file changed, 54 deletions(-)

diff --git a/arch/arm/mach-lpc32xx/phy3250.c b/arch/arm/mach-lpc32xx/phy3250.c
index 66701bf43248..0c7797a0e44e 100644
--- a/arch/arm/mach-lpc32xx/phy3250.c
+++ b/arch/arm/mach-lpc32xx/phy3250.c
@@ -16,64 +16,10 @@
 #include <asm/mach/arch.h>
 #include "common.h"
 
-static struct pl08x_channel_data pl08x_slave_channels[] = {
-	{
-		.bus_id = "nand-slc",
-		.min_signal = 1, /* SLC NAND Flash */
-		.max_signal = 1,
-		.periph_buses = PL08X_AHB1,
-	},
-	{
-		.bus_id = "nand-mlc",
-		.min_signal = 12, /* MLC NAND Flash */
-		.max_signal = 12,
-		.periph_buses = PL08X_AHB1,
-	},
-};
-
-static int pl08x_get_signal(const struct pl08x_channel_data *cd)
-{
-	return cd->min_signal;
-}
-
-static void pl08x_put_signal(const struct pl08x_channel_data *cd, int ch)
-{
-}
-
-static struct pl08x_platform_data pl08x_pd = {
-	/* Some reasonable memcpy defaults */
-	.memcpy_burst_size = PL08X_BURST_SZ_256,
-	.memcpy_bus_width = PL08X_BUS_WIDTH_32_BITS,
-	.slave_channels = &pl08x_slave_channels[0],
-	.num_slave_channels = ARRAY_SIZE(pl08x_slave_channels),
-	.get_xfer_signal = pl08x_get_signal,
-	.put_xfer_signal = pl08x_put_signal,
-	.lli_buses = PL08X_AHB1,
-	.mem_buses = PL08X_AHB1,
-};
-
-static struct lpc32xx_slc_platform_data lpc32xx_slc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static struct lpc32xx_mlc_platform_data lpc32xx_mlc_data = {
-	.dma_filter = pl08x_filter_id,
-};
-
-static const struct of_dev_auxdata lpc32xx_auxdata_lookup[] __initconst = {
-	OF_DEV_AUXDATA("arm,pl080", 0x31000000, "pl08xdmac", &pl08x_pd),
-	OF_DEV_AUXDATA("nxp,lpc3220-slc", 0x20020000, "20020000.flash",
-		       &lpc32xx_slc_data),
-	OF_DEV_AUXDATA("nxp,lpc3220-mlc", 0x200a8000, "200a8000.flash",
-		       &lpc32xx_mlc_data),
-	{ }
-};
-
 static void __init lpc3250_machine_init(void)
 {
 	lpc32xx_serial_init();
 
-	of_platform_default_populate(NULL, lpc32xx_auxdata_lookup, NULL);
 }
 
 static const char *const lpc32xx_dt_compat[] __initconst = {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
