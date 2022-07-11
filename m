Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD2FCCA47B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7iLp7NrSZPC00b35amMcNWZRMnW48OvKOCfPQJAbc0=; b=0nXEq05WMyLw8S
	cLElXjaupaIrIX/zuni/FXn1kQtbWKDgpcvK73YKGsAgOZKwCVcXTXQ8ypieHv0rQ0SeTXuXLSSL+
	MxY0a/6DOueIrjaK1UfV3BH90GvNTa8jb+0820k3vkvyqmLb96S6zrBTVcVs+83fcxpo2g6CUu2nt
	8euCcKaiYTcOmOd4J/TzpiL8aXrEvmZL33IoX94f+HO9MiRdSwrjkSt2Jzf4UE2aWwri/fsEBEcxH
	83SG2ktPPWflKe+NZkAYvgECYnf6uj+GqMZlkrdc7cdLWqM8qUoLq3Jy5sbWA/INgbVZkotkyPz98
	NWHLh7srt/d33IQSBvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1oX-005F3Q-8P; Mon, 11 Jul 2022 22:23:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB1oU-005F1u-6b
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 22:23:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id f11so5647789plr.4
        for <linux-mtd@lists.infradead.org>; Mon, 11 Jul 2022 15:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bwoWAKJGLd9SSlXMcBweio9xAZcHotQKiELuk/jadhs=;
        b=cUDerjFW+ZfJ27rSAVACN/ymG+8oibDmVlh1CXTofv1OvUiQkDQQEXaYyiJUxuudvF
         tbqhn+XNzlCTseO+hGlruLk1otnFXW4rLKNcbOT56qh2Qf6fwq6Vi6HqCm52N9aq6yxI
         HsOOh90lQYPL2mEK+tSIjE+UwhlPErUEid8yv4cpTgBgFRPWmvhSnuSnESs6/4nhq8t4
         MNMgOd3b+jJYTG8i3e7D0mhwNVVwYVgU881iXoblK3kOwlHDJs7yyFGBWD4QetEx3ytX
         atBtbUyt55Bz4EwcC+fH3TNPQzBa5SA3vmGtTpRrq2UmGIEZc6Nv6b3E3FLJbF69++vh
         9wRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bwoWAKJGLd9SSlXMcBweio9xAZcHotQKiELuk/jadhs=;
        b=qwoCoKA6sBjk3VPGs1ikYpO0SssEKfJOkKcJBtKbLcAuo1ngGvtE4dIInRsUQ4hUgR
         Yc8+GuWk/aPRUUXDmHCEJnSVsHW4BSyxzXSKXsvE/toIz6UwNIAFHV/XOi6nBUP/icWI
         5T7kDf5WfAr+rmlbdZYH2t+d+fOhoh1qbriJama2SC4QlL00P42kgJXyIMmiLdwl6hGM
         RIxXwnp5HYVgZYdJL+oqQXXjS5+GtOUFaK03SiC7g4upCkz7xnqKNvjczDjmoOfc+p4z
         Szb8p6D7BhvaAXkte7BWTFxzhF6kZKrldgy3j9BRZd8ZVktPnTZVVRtTRXOQY/lGtoQF
         8zqw==
X-Gm-Message-State: AJIora8fWfqmTyswuWKRcfRKGmdltysPoQCGNGGUWlOOftCTxxj+LWh4
	OIMaBPvcl97d6q+V23v85EFTeTgx2eQ=
X-Google-Smtp-Source: AGRyM1tfnPqPWAZx7h3NfTzcNn4bH4ejXLJRMterUSsiEbLQQlGDh3YmCTxE0k8e6QeBLZOcvMN8bA==
X-Received: by 2002:a17:90a:710a:b0:1ef:991c:dc67 with SMTP id h10-20020a17090a710a00b001ef991cdc67mr655749pjk.110.1657578212878;
        Mon, 11 Jul 2022 15:23:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z6-20020a170903018600b0016be5f24aaesm5274774plg.163.2022.07.11.15.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 15:23:32 -0700 (PDT)
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
Subject: [PATCH 2/2] mtd: rawnand: brcmnand: Add individual glue driver selection
Date: Mon, 11 Jul 2022 15:23:23 -0700
Message-Id: <20220711222323.4048197-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711222323.4048197-1-f.fainelli@gmail.com>
References: <20220711222323.4048197-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_152334_276228_65286A3E 
X-CRM114-Status: GOOD (  14.90  )
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

Allow each platform to define a dedicated Kconfig entry for its glue
driver such that we can decide on a per-platfomr basis whether to build
it or not. This allows for a finer grained control over the resulting
kernel image or set of modules.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/mtd/nand/raw/brcmnand/Kconfig  | 28 ++++++++++++++++++++++++++
 drivers/mtd/nand/raw/brcmnand/Makefile |  8 ++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/Kconfig b/drivers/mtd/nand/raw/brcmnand/Kconfig
index d5a0265525ca..4bc51bf60aca 100644
--- a/drivers/mtd/nand/raw/brcmnand/Kconfig
+++ b/drivers/mtd/nand/raw/brcmnand/Kconfig
@@ -9,6 +9,13 @@ config MTD_NAND_BRCMNAND
 
 if MTD_NAND_BRCMNAND
 
+config MTD_NAND_BRCMNAND_BCM63XX
+	tristate "Broadcom BCM63xx NAND controller glue"
+	default BCM63XX
+	help
+	  Enables the BRCMNAND glue driver to register the NAND controller
+	  on Broadcom BCM63xx MIPS-based DSL platforms.
+
 config MTD_NAND_BRCMNAND_BCMA
 	tristate "Broadcom BCMA NAND controller"
 	depends on BCMA_NFLASH
@@ -18,4 +25,25 @@ config MTD_NAND_BRCMNAND_BCMA
 	  The glue driver will take care of performing the low-level I/O
 	  operations to interface the BRCMNAND controller over the BCMA bus.
 
+config MTD_NAND_BRCMNAND_BCMBCA
+	tristate "Broadcom BCMBCA NAND controller glue"
+	default ARCH_BCMBCA
+	help
+	  Enables the BRCMNAND glue driver to register the NAND controller
+	  on Broadcom BCA platforms.
+
+config MTD_NAND_BRCMNAND_BRCMSTB
+	tristate "Broadcom STB Nand controller glue"
+	default ARCH_BRCMSTB
+	help
+	  Enables the BRCMNAND glue driver to register the NAND controller
+	  on Broadcom STB platforms.
+
+config MTD_NAND_BRCMNAND_IPROC
+	tristate "Broadcom iProc NAND controller glue"
+	default ARCH_BCM_IPROC
+	help
+	  Enables the BRCMNAND controller glue driver to register the NAND
+	  controller on Broadcom iProc platforms.
+
 endif # MTD_NAND_BRCMNAND
diff --git a/drivers/mtd/nand/raw/brcmnand/Makefile b/drivers/mtd/nand/raw/brcmnand/Makefile
index 16dc7254200e..9907e3ec4bb2 100644
--- a/drivers/mtd/nand/raw/brcmnand/Makefile
+++ b/drivers/mtd/nand/raw/brcmnand/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 # link order matters; don't link the more generic brcmstb_nand.o before the
 # more specific iproc_nand.o, for instance
-obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= iproc_nand.o
-obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm63138_nand.o
-obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= bcm6368_nand.o
-obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmstb_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND_IPROC)	+= iproc_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND_BCMBCA)	+= bcm63138_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND_BCM63XX)	+= bcm6368_nand.o
+obj-$(CONFIG_MTD_NAND_BRCMNAND_BRCMSTB)	+= brcmstb_nand.o
 obj-$(CONFIG_MTD_NAND_BRCMNAND)		+= brcmnand.o
 
 obj-$(CONFIG_MTD_NAND_BRCMNAND_BCMA)	+= bcma_nand.o
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
