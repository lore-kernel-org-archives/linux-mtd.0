Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F998C4167B
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Nov 2023 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j0NCbJo5ZMTYAY5MCvSqoOnwEDkrx/PhiDNeU39YKC4=; b=azMtntO0NoiC8h
	aJ3ymUJlYjA8x8PSqXETsiBC/LJmu1Mn7+cCskGnE482RSyPkQ0XNrKLA5CB2T9dABznSK2dM/YIn
	Rjzv5/YmK/5h/XZxxT7NsAnPiGp9QN/hZRo3Z2+CpSPv6upDDR8TVO5pp35ux6i0kOG91x5DdSwlt
	QB4sIeeLgoW/OqRkmE8a8TH72Ukmn12a/xme44Ybdn3gYGAEyzOnyWUSBovQReiMyoN14Z6nsk+SC
	zZpzk8Pb1nHbEkgLUgXKK58Yt27i6vMoS54uQLtE3+0w4lj9OHQFqvsa38hFyvHCP9shd8TBMis+V
	OFWzR0QTUwE0/0kTeoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jdJ-0041Ut-3D;
	Wed, 08 Nov 2023 14:34:18 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jdA-0041JY-36
	for linux-mtd@lists.infradead.org;
	Wed, 08 Nov 2023 14:34:11 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-507975d34e8so10034084e87.1
        for <linux-mtd@lists.infradead.org>; Wed, 08 Nov 2023 06:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454045; x=1700058845; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78GU8j4+SoSSNRmxCZnZFjlRCHFt/xGux/FgF9FARuk=;
        b=F2s4A21L5NTjqS+turOFtU0nEBbokfJ0FQ3j0O/vBQKIRuEhGYLwlscOKwR+s0VJEL
         hX/Tk3vMAdKY/PCe9HzzdFGVVQk4strb9eAvqgS+NKG+jFI0b/XwM5xwIAwiZ54+pthR
         rQWBYsZje9isCrh+0sWMZjUpR86VYGTfvdKAPCgIoIYS5UgemvPmBC5opGmQSF0jwHX6
         CK/+Pyp399ATd7YkZTPUrc23IOR0Ie03cvUA5iE9in8ddGFz406z6PHUBSTvOiosJX4a
         py88ckYytqteVC/KexjlInl7QpbMONGSTnYJUfEI0VYTPJuTGDjYyhGAhzoP3Qb1AYwt
         y8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454045; x=1700058845;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=78GU8j4+SoSSNRmxCZnZFjlRCHFt/xGux/FgF9FARuk=;
        b=AOUpDuwjtuJh+LGyOoLVKRTfu+4enUIJcNNFuMRgV4NbK/2vOdFOqL5EjMqdfGdPUZ
         eEMGimzmrXU04bA4OU9lfWJUpbxY0A0EokV39Boh3fBOwdVznEqqqgAbWNLLH6WAQbEW
         3WmWUBmBFZQszTvfPF4zgWdhtOcyAXEePRk2IELlI5QSKHpmRdXDlZPGxE0IgJGTaUdC
         p1eu+5mvd52WTEgG26T9r1m8qBLeDNPGElQFhyWTzfK3ksFIv0tKI3SEcwzEhOvih4YE
         t7ee26bxnlLAciXKqGNfaM8IrgzRNADUFYiiSQGXv42UJvxHxoC4JlxuHgLCCbdpuisV
         R2LQ==
X-Gm-Message-State: AOJu0Yy6oKnC3UCFG53GT5epkXH4TgM1v5xnp368v0LrSH1SUPOD4MI4
	dugw7usOnrxdwEY6g4xD7HB1xw==
X-Google-Smtp-Source: AGHT+IH6IcpUsu8l3iZ6cm3VeKSRvHVjWLm4/aWcEw/O+09FccupiAh8GMMm2qcpdhgkIocbk45f1A==
X-Received: by 2002:a19:9110:0:b0:507:b935:9f5f with SMTP id t16-20020a199110000000b00507b9359f5fmr1441210lfd.24.1699454044974;
        Wed, 08 Nov 2023 06:34:04 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:34:04 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 08 Nov 2023 15:33:54 +0100
Subject: [PATCH 6/6] mtd: rawnand: gpio: Rename file
MIME-Version: 1.0
Message-Id: <20231108-fix-mips-nand-v1-6-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
In-Reply-To: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_063409_022437_525B281E 
X-CRM114-Status: GOOD (  13.95  )
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

The implementation of the GPIO NAND controller is just "gpio"
with the usecase for NAND implied from the folder nand/raw.

This is not so great when the module gets the name "gpio.ko".
Rename the implementation to nand-gpio.c so the module is
named nand-gpio.ko which is more reasonable.

We put "nand" first instead of "gpio" because the order is
usually <subsystem>-<driver>.c, cf ls drivers/gpio/

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/Makefile                | 2 +-
 drivers/mtd/nand/raw/{gpio.c => nand-gpio.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 25120a4afada..f0e377332812 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_MTD_NAND_NANDSIM)		+= nandsim.o
 obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel/
-obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
+obj-$(CONFIG_MTD_NAND_GPIO)		+= nand-gpio.o
 omap2_nand-objs := omap2.o
 obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2_nand.o
 obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD)	+= omap_elm.o
diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/nand-gpio.c
similarity index 100%
rename from drivers/mtd/nand/raw/gpio.c
rename to drivers/mtd/nand/raw/nand-gpio.c

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
