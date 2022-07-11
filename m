Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0021C43334
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Plq0SHOH/yWIDgF5tFIisHRVzbsEmfxRu0mQCuorHGA=; b=qWBfE57g8qh/yO
	++YMlqEEL+ShBVMQJWBOmf/nw5F9D8RWiQkXMp3B7+SgZECcAzAxkT55EXjRCMxBi+8xf8UR0vdrE
	bwKMrmhlcPkmPDLK0vkYhfLKiyAyauhCvn5sW4X8/QMgaMbaXkqvd0VJJdl43XXgVrIjCt3Ro/kOM
	CVLR8DH58ARu0InfyxR7A2URgIWxZb8jwBG8oKfRX7ap5I+yAxugHtAaeLh6EEEgRcSKDWUpnISML
	5IoUmPu1NtexMvM/aS9UxanCWs0UX3KgG42E8n9wB8+VHpLsX+5EanAM8Jnnd4Ux5UvMslZT0zUJH
	yVGw0A9SnHsG4ZXYIoQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1oV-005F2k-BJ; Mon, 11 Jul 2022 22:23:35 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1oS-005F0D-D7
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 22:23:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so9663351pjr.4
        for <linux-mtd@lists.infradead.org>; Mon, 11 Jul 2022 15:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OZFhWlnda4SXoJnWWqvMvV3sR5/zMUvEmc+r8suqDxc=;
        b=NXIoVtBZLRNtdnYNk75WJuKEh1EQthMAB+vTJbMlnGkk4+c/yHwI7iNBVcQuFg/mZw
         IcVeDUQpShLeYI5rYsbB3dlj4AaXLFgUMMaPxgPoIqqPKgDF1DJZ6P9xDLSlv6719gE1
         YtsszF04M/z4BCg+8wVvBAn91Y7QWdFbyvpiM6/5233n4Y8lD1soPMBKdKTpJCk4oe57
         5fe+2y1ErOgVDb946coFo9YipcNoUgMBX/A8DBUtWF8q5NxF/9LWXHdMVi++qyQYgGgM
         sRS2nUTPaSrzrrClOYo2X1a5cmMbQ51QkJFdGfGmb0ggyBAQgnNET29g1AU+0Cm1yiqY
         0Qjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZFhWlnda4SXoJnWWqvMvV3sR5/zMUvEmc+r8suqDxc=;
        b=UeQaYFMGhsSJJhmZukWvsPPuu5i+xetWZxcwDf4rwUEdwWkSpb/ZyOuuyAXEoHKDEc
         uZpE4t+wCfzOnxyhYMw/j4pa22ClP2U2RSzbb6+LTJ3PQkj/tCjI5ZFKdFj7OC5ODldH
         r419K7Xjm+HJRSYu44NrW1hh9E7OrCdEkeH7cgv09NrqcwsUkE1MZJcS9NAc7UULu3Pv
         xvq73mKb4jvNarajG+oztz2tadVYJbpHAyfvWx65eCroVgWCqz5PEJMU6ClG5HNgSLsN
         fKfL5cmcJCCTiQwbw5SzrA+qHF4e1WSWEOJ8LaYL6Og04rYikyeAEwWO3LALv0Cb9zZP
         ckig==
X-Gm-Message-State: AJIora/9HiKv2ttpnT1GA78GU9VL4t3miM+LI/fcggfq/ciTUN9PkDso
	6B3PJmsONgR38K3vRuyXZJXqIjvLvqg=
X-Google-Smtp-Source: AGRyM1uFWCGpl6fspxtDr/tVPfV/5GWUPsNkGgcDYOLqbaCfklQ8MldUdsHxQLL4YKQjdAQ26rOK1A==
X-Received: by 2002:a17:90a:9f8d:b0:1f0:253e:3ecf with SMTP id o13-20020a17090a9f8d00b001f0253e3ecfmr647419pjp.33.1657578211109;
        Mon, 11 Jul 2022 15:23:31 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z6-20020a170903018600b0016be5f24aaesm5274774plg.163.2022.07.11.15.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:23:30 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Roger Quadros <rogerq@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Colin Ian King <colin.king@intel.com>,
	linux-kernel@vger.kernel.org (open list),
	William Zhang <william.zhang@broadcom.com>
Subject: [PATCH 1/2] mtd: rawnand: brcmnand: Move Kconfig to driver folder
Date: Mon, 11 Jul 2022 15:23:22 -0700
Message-Id: <20220711222323.4048197-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711222323.4048197-1-f.fainelli@gmail.com>
References: <20220711222323.4048197-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_152332_478530_471862FD 
X-CRM114-Status: GOOD (  18.41  )
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

In preparation for allowing each of the brcmnand stub to be built
separately, move the Kconfig entry to the driver folder.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/Kconfig          | 22 +---------------------
 drivers/mtd/nand/raw/brcmnand/Kconfig | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 21 deletions(-)
 create mode 100644 drivers/mtd/nand/raw/brcmnand/Kconfig

diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
index 8b6d7a515445..43a151b4c8fc 100644
--- a/drivers/mtd/nand/raw/Kconfig
+++ b/drivers/mtd/nand/raw/Kconfig
@@ -200,27 +200,7 @@ config MTD_NAND_TMIO
 	  Support for NAND flash connected to a Toshiba Mobile IO
 	  Controller in some PDAs, including the Sharp SL6000x.
 
-config MTD_NAND_BRCMNAND
-	tristate "Broadcom STB NAND controller"
-	depends on ARM || ARM64 || MIPS || COMPILE_TEST
-	depends on HAS_IOMEM
-	help
-	  Enables the Broadcom NAND controller driver. The controller was
-	  originally designed for Set-Top Box but is used on various BCM7xxx,
-	  BCM3xxx, BCM63xxx, iProc/Cygnus and more.
-
-if MTD_NAND_BRCMNAND
-
-config MTD_NAND_BRCMNAND_BCMA
-	tristate "Broadcom BCMA NAND controller"
-	depends on BCMA_NFLASH
-	depends on BCMA
-	help
-	  Enables the BRCMNAND controller over BCMA on BCM47186/BCM5358 SoCs.
-	  The glue driver will take care of performing the low-level I/O
-	  operations to interface the BRCMNAND controller over the BCMA bus.
-
-endif # MTD_NAND_BRCMNAND
+source "drivers/mtd/nand/raw/brcmnand/Kconfig"
 
 config MTD_NAND_BCM47XXNFLASH
 	tristate "BCM4706 BCMA NAND controller"
diff --git a/drivers/mtd/nand/raw/brcmnand/Kconfig b/drivers/mtd/nand/raw/brcmnand/Kconfig
new file mode 100644
index 000000000000..d5a0265525ca
--- /dev/null
+++ b/drivers/mtd/nand/raw/brcmnand/Kconfig
@@ -0,0 +1,21 @@
+config MTD_NAND_BRCMNAND
+	tristate "Broadcom STB NAND controller"
+	depends on ARM || ARM64 || MIPS || COMPILE_TEST
+	depends on HAS_IOMEM
+	help
+	  Enables the Broadcom NAND controller driver. The controller was
+	  originally designed for Set-Top Box but is used on various BCM7xxx,
+	  BCM3xxx, BCM63xxx, iProc/Cygnus and more.
+
+if MTD_NAND_BRCMNAND
+
+config MTD_NAND_BRCMNAND_BCMA
+	tristate "Broadcom BCMA NAND controller"
+	depends on BCMA_NFLASH
+	depends on BCMA
+	help
+	  Enables the BRCMNAND controller over BCMA on BCM47186/BCM5358 SoCs.
+	  The glue driver will take care of performing the low-level I/O
+	  operations to interface the BRCMNAND controller over the BCMA bus.
+
+endif # MTD_NAND_BRCMNAND
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
