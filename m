Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A215C04AAF
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 19:28:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D6612173C
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 19:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ps8Rx6A2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qLGkbLDw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D6612173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=2IsK3CmFXL5sNKmD2UjFsrDzZaBkMLJWnqK4tr0Ny+4=; b=Ps8
	Rx6A2G1L2AzrWbpihtJ4I23k4bvsJreLm+Q3Kpcbu/LoJQVyn3NMZ/LEPcvYKFELeys1sH5IZRxMd
	XBmRAMmZD+HnrAazanQdernEzK5DNfcAR66/fVQ/jUm2yRyEwY9n51+1u1cWaloNXVf8BvzG3/FYq
	aD1y4a4rbYwN1i8ADXecllLGrr+S5p9Y3KgmDLs6GNrY+czeiCshGUe5zGbGDRJ2tx/PjvGsxLRQA
	an6V+1zI8Oodoezm0bw5lhzqhvP4a9CErXtv7f0/cbQ/ZRioCDfdmXRcciVdQfVDsSJlU6Sg37OiZ
	4xS1XqL650qToYYb2XMpq4fQI2XqrLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTAR0-0004of-Vt; Tue, 21 May 2019 19:28:26 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTAQw-0004nj-PF; Tue, 21 May 2019 19:28:24 +0000
Received: by mail-pg1-x543.google.com with SMTP id t187so9051366pgb.13;
 Tue, 21 May 2019 12:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=H6go7CcUBjX3mzKpRCwd0evI+2M4u0B9z6h4VcPCc1A=;
 b=qLGkbLDwWl0lVlk/adYib/b/sDlGbf+3aKNtAQ3O61E873sJulejk9R09Kh89wwLye
 ajPQnhV2iQKzg+8KBPhytmKKMghOjbek15ssXUAs6QGuTmFb3EzcjMd2Q28Xb+DSuE+7
 Saq5DMSYn9s2x02pMiob21ba7HglJEgfF9E3DcQ7ZzyhGZn+QmK746STqlkgAeAV1RVY
 MfMADVSvxPHkazzGDhPWH5FTTir7EHmDVKoImDsYSBI2/IrT5L0jGfZLtT+V0N2Zd4As
 w52Nb0c0IwjzByhvunK2xdC4CQ7HZdvyesHWuWn8VbSOlBW5sYDQfB2ONrCY101qtB+a
 yBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=H6go7CcUBjX3mzKpRCwd0evI+2M4u0B9z6h4VcPCc1A=;
 b=BOUVhZuG3kXEQ0L+tEj7iziN89dx2hUJN1aLx+u0QG1z1Xh08n/JeUkwRyMhGJzfe9
 fXgAQB0uKl+5l5M+DlqHwZKkvm+S71efjuzS6GtL/JQKUSS5mf1Tub24q6v48nvt+1Fz
 Q2Iw/zIkEBBhvwjWjOmBsQUoVnA5zooOU1IyerwPFcCXMHhiAaYXtugbTs/aWiS9GHCF
 wZ8a7BhntwXmRHv+j0BTQX5zNI0sQdrUmI7PkcWTpmsoMyNtMYSgUVbFV/a7EcBA5mAy
 i3KOGhj8miyhPGAqP2e1yIlioSagkxK9WApIxUU14dHd52T3VGihDP32tQM4/uTe0CuD
 Xocg==
X-Gm-Message-State: APjAAAUKFwjwTLKZ+o656pGVT73OzLnLtB4/2Ti5WeKujN8EZxi1Aa7y
 ew77kpfOhPAaLS6yyb1aVnr+lLCgnnY=
X-Google-Smtp-Source: APXvYqyXddJUHTc2OzpreTHB+PQuLPhDAlw52ZnNU9kP+z7JjpLNUDOgkon9dSKxYcJcwywTMqSnIA==
X-Received: by 2002:aa7:9289:: with SMTP id j9mr2874365pfa.251.1558466900256; 
 Tue, 21 May 2019 12:28:20 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id c76sm41382743pfc.43.2019.05.21.12.28.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 12:28:19 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] dt: bindings: mtd: replace references to nand.txt with
 nand-controller.yaml
Date: Tue, 21 May 2019 15:27:57 -0400
Message-Id: <1558466890-45471-1-git-send-email-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 1.9.0.138.g2de3478
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_122822_874633_47544F47 
X-CRM114-Status: GOOD (  16.39  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Mans Rullgard <mans@mansr.com>,
 Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stefan Agner <stefan@agner.ch>,
 David Brown <david.brown@linaro.org>, Liang Yang <liang.yang@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Vasut <marek.vasut@gmail.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

nand-controller.yaml replaced nand.txt however the references to it were
not updated. This change updates these references wherever it appears in
bindings documentation.

Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 .../devicetree/bindings/mtd/amlogic,meson-nand.txt         |  2 +-
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt    |  6 +++---
 Documentation/devicetree/bindings/mtd/denali-nand.txt      |  6 +++---
 Documentation/devicetree/bindings/mtd/fsmc-nand.txt        |  6 +++---
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt        |  2 +-
 Documentation/devicetree/bindings/mtd/hisi504-nand.txt     |  2 +-
 Documentation/devicetree/bindings/mtd/marvell-nand.txt     | 14 +++++++-------
 Documentation/devicetree/bindings/mtd/mxc-nand.txt         |  6 +++---
 .../devicetree/bindings/mtd/nvidia-tegra20-nand.txt        |  6 +++---
 Documentation/devicetree/bindings/mtd/oxnas-nand.txt       |  2 +-
 Documentation/devicetree/bindings/mtd/qcom_nandc.txt       |  4 ++--
 Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt  |  6 +++---
 Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt  |  6 +++---
 Documentation/devicetree/bindings/mtd/tango-nand.txt       |  2 +-
 Documentation/devicetree/bindings/mtd/vf610-nfc.txt        |  8 ++++----
 15 files changed, 39 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
index 3983c11..5794ab11 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
@@ -24,7 +24,7 @@ Optional children nodes:
 Children nodes represent the available nand chips.
 
 Other properties:
-see Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
+see Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
 
 Example demonstrate on AXG SoC:
 
diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index bcda1df..0b7c373 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -101,12 +101,12 @@ Required properties:
                               number (e.g., 0, 1, 2, etc.)
 - #address-cells            : see partition.txt
 - #size-cells               : see partition.txt
-- nand-ecc-strength         : see nand.txt
-- nand-ecc-step-size        : must be 512 or 1024. See nand.txt
+- nand-ecc-strength         : see nand-controller.yaml
+- nand-ecc-step-size        : must be 512 or 1024. See nand-controller.yaml
 
 Optional properties:
 - nand-on-flash-bbt         : boolean, to enable the on-flash BBT for this
-                              chip-select. See nand.txt
+                              chip-select. See nand-controller.yaml
 - brcm,nand-oob-sector-size : integer, to denote the spare area sector size
                               expected for the ECC layout in use. This size, in
                               addition to the strength and step-size,
diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
index b14b675..b32aed1 100644
--- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
@@ -22,16 +22,16 @@ Sub-nodes:
       select is connected.
 
   Optional properties:
-    - nand-ecc-step-size: see nand.txt for details.
+    - nand-ecc-step-size: see nand-controller.yaml for details.
       If present, the value must be
         512        for "altr,socfpga-denali-nand"
         1024       for "socionext,uniphier-denali-nand-v5a"
         1024       for "socionext,uniphier-denali-nand-v5b"
-    - nand-ecc-strength: see nand.txt for details. Valid values are:
+    - nand-ecc-strength: see nand-controller.yaml for details. Valid values are:
         8, 15      for "altr,socfpga-denali-nand"
         8, 16, 24  for "socionext,uniphier-denali-nand-v5a"
         8, 16      for "socionext,uniphier-denali-nand-v5b"
-    - nand-ecc-maximize: see nand.txt for details
+    - nand-ecc-maximize: see nand-controller.yaml for details
 
 The chip nodes may optionally contain sub-nodes describing partitions of the
 address space. See partition.txt for more detail.
diff --git a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
index 32636eb..6762d3c 100644
--- a/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/fsmc-nand.txt
@@ -30,9 +30,9 @@ Optional properties:
                  command is asserted. Zero means one cycle, 255 means 256
                  cycles.
 - bank: default NAND bank to use (0-3 are valid, 0 is the default).
-- nand-ecc-mode      : see nand.txt
-- nand-ecc-strength  : see nand.txt
-- nand-ecc-step-size : see nand.txt
+- nand-ecc-mode      : see nand-controller.yaml
+- nand-ecc-strength  : see nand-controller.yaml
+- nand-ecc-step-size : see nand-controller.yaml
 
 Can support 1-bit HW ECC (default) or if stronger correction is required,
 software-based BCH.
diff --git a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
index c059ab7..44919d4 100644
--- a/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/gpmc-nand.txt
@@ -8,7 +8,7 @@ explained in a separate documents - please refer to
 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt
 
 For NAND specific properties such as ECC modes or bus width, please refer to
-Documentation/devicetree/bindings/mtd/nand.txt
+Documentation/devicetree/bindings/mtd/nand-controller.yaml
 
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
index 2e35f06..8963983 100644
--- a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
@@ -7,7 +7,7 @@ Required properties:
                        NAND controller's registers. The second contains base
                        physical address and size of NAND controller's buffer.
 - interrupts:          Interrupt number for nfc.
-- nand-bus-width:      See nand.txt.
+- nand-bus-width:      See nand-controller.yaml.
 - nand-ecc-mode:       Support none and hw ecc mode.
 - #address-cells:      Partition address, should be set 1.
 - #size-cells:         Partition size, should be set 1.
diff --git a/Documentation/devicetree/bindings/mtd/marvell-nand.txt b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
index e0c7907..a2d9a0f 100644
--- a/Documentation/devicetree/bindings/mtd/marvell-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/marvell-nand.txt
@@ -36,29 +36,29 @@ Children nodes represent the available NAND chips.
 
 Required properties:
 - reg: shall contain the native Chip Select ids (0-3).
-- nand-rb: see nand.txt (0-1).
+- nand-rb: see nand-controller.yaml (0-1).
 
 Optional properties:
 - marvell,nand-keep-config: orders the driver not to take the timings
   from the core and leaving them completely untouched. Bootloader
   timings will then be used.
 - label: MTD name.
-- nand-on-flash-bbt: see nand.txt.
-- nand-ecc-mode: see nand.txt. Will use hardware ECC if not specified.
-- nand-ecc-algo: see nand.txt. This property is essentially useful when
+- nand-on-flash-bbt: see nand-controller.yaml.
+- nand-ecc-mode: see nand-controller.yaml. Will use hardware ECC if not specified.
+- nand-ecc-algo: see nand-controller.yaml. This property is essentially useful when
   not using hardware ECC. Howerver, it may be added when using hardware
   ECC for clarification but will be ignored by the driver because ECC
   mode is chosen depending on the page size and the strength required by
   the NAND chip. This value may be overwritten with nand-ecc-strength
   property.
-- nand-ecc-strength: see nand.txt.
-- nand-ecc-step-size: see nand.txt. Marvell's NAND flash controller does
+- nand-ecc-strength: see nand-controller.yaml.
+- nand-ecc-step-size: see nand-controller.yaml. Marvell's NAND flash controller does
   use fixed strength (1-bit for Hamming, 16-bit for BCH), so the actual
   step size will shrink or grow in order to fit the required strength.
   Step sizes are not completely random for all and follow certain
   patterns described in AN-379, "Marvell SoC NFC ECC".
 
-See Documentation/devicetree/bindings/mtd/nand.txt for more details on
+See Documentation/devicetree/bindings/mtd/nand-controller.yaml for more details on
 generic bindings.
 
 
diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.txt b/Documentation/devicetree/bindings/mtd/mxc-nand.txt
index b5833d1..2857c62 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.txt
@@ -4,9 +4,9 @@ Required properties:
 - compatible: "fsl,imxXX-nand"
 - reg: address range of the nfc block
 - interrupts: irq to be used
-- nand-bus-width: see nand.txt
-- nand-ecc-mode: see nand.txt
-- nand-on-flash-bbt: see nand.txt
+- nand-bus-width: see nand-controller.yaml
+- nand-ecc-mode: see nand-controller.yaml
+- nand-on-flash-bbt: see nand-controller.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
index b2f2ca1..e737e5b 100644
--- a/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nvidia-tegra20-nand.txt
@@ -26,14 +26,14 @@ Optional children node properties:
 		 "hw" is supported.
 - nand-ecc-algo: string, algorithm of NAND ECC.
 		 Supported values with "hw" ECC mode are: "rs", "bch".
-- nand-bus-width : See nand.txt
-- nand-on-flash-bbt: See nand.txt
+- nand-bus-width : See nand-controller.yaml
+- nand-on-flash-bbt: See nand-controller.yaml
 - nand-ecc-strength: integer representing the number of bits to correct
 		     per ECC step (always 512). Supported strength using HW ECC
 		     modes are:
 		     - RS: 4, 6, 8
 		     - BCH: 4, 8, 14, 16
-- nand-ecc-maximize: See nand.txt
+- nand-ecc-maximize: See nand-controller.yaml
 - nand-is-boot-medium: Makes sure only ECC strengths supported by the boot ROM
 		       are chosen.
 - wp-gpios: GPIO specifier for the write protect pin.
diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
index 56d5c19d..2ba07fc 100644
--- a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
@@ -1,6 +1,6 @@
 * Oxford Semiconductor OXNAS NAND Controller
 
-Please refer to nand.txt for generic information regarding MTD NAND bindings.
+Please refer to nand-controller.yaml for generic information regarding MTD NAND bindings.
 
 Required properties:
  - compatible: "oxsemi,ox820-nand"
diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
index 1123cc6..5c2fba4 100644
--- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
+++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
@@ -47,8 +47,8 @@ Required properties:
 - #size-cells:		see partition.txt
 
 Optional properties:
-- nand-bus-width:	see nand.txt
-- nand-ecc-strength:	see nand.txt. If not specified, then ECC strength will
+- nand-bus-width:	see nand-controller.yaml
+- nand-ecc-strength:	see nand-controller.yaml. If not specified, then ECC strength will
 			be used according to chip requirement and available
 			OOB size.
 
diff --git a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
index 0040eb8..09815c4 100644
--- a/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
+++ b/Documentation/devicetree/bindings/mtd/samsung-s3c2410.txt
@@ -6,7 +6,7 @@ Required properties:
 	"samsung,s3c2412-nand"
 	"samsung,s3c2440-nand"
 - reg : register's location and length.
-- #address-cells, #size-cells : see nand.txt
+- #address-cells, #size-cells : see nand-controller.yaml
 - clocks : phandle to the nand controller clock
 - clock-names : must contain "nand"
 
@@ -14,8 +14,8 @@ Optional child nodes:
 Child nodes representing the available nand chips.
 
 Optional child properties:
-- nand-ecc-mode : see nand.txt
-- nand-on-flash-bbt : see nand.txt
+- nand-ecc-mode : see nand-controller.yaml
+- nand-on-flash-bbt : see nand-controller.yaml
 
 Each child device node may optionally contain a 'partitions' sub-node,
 which further contains sub-nodes describing the flash partition mapping.
diff --git a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
index ad2bef8..e55895e 100644
--- a/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/stm32-fmc2-nand.txt
@@ -24,9 +24,9 @@ Required properties:
 - reg: describes the CS lines assigned to the NAND device.
 
 Optional properties:
-- nand-on-flash-bbt: see nand.txt
-- nand-ecc-strength: see nand.txt
-- nand-ecc-step-size: see nand.txt
+- nand-on-flash-bbt: see nand-controller.yaml
+- nand-ecc-strength: see nand-controller.yaml
+- nand-ecc-step-size: see nand-controller.yaml
 
 The following ECC strength and step size are currently supported:
  - nand-ecc-strength = <1>, nand-ecc-step-size = <512> (Hamming)
diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
index cd1bf2a..91c8420 100644
--- a/Documentation/devicetree/bindings/mtd/tango-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
@@ -11,7 +11,7 @@ Required properties:
 - #size-cells: <0>
 
 Children nodes represent the available NAND chips.
-See Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
+See Documentation/devicetree/bindings/mtd/nand-controller.yaml for generic bindings.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
index c96eeb6..7db5e6e 100644
--- a/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
+++ b/Documentation/devicetree/bindings/mtd/vf610-nfc.txt
@@ -25,14 +25,14 @@ only handle one NAND chip.
 
 Required properties:
 - compatible: Should be set to "fsl,vf610-nfc-cs".
-- nand-bus-width: see nand.txt
-- nand-ecc-mode: see nand.txt
+- nand-bus-width: see nand-controller.yaml
+- nand-ecc-mode: see nand-controller.yaml
 
 Required properties for hardware ECC:
-- nand-ecc-strength: supported strengths are 24 and 32 bit (see nand.txt)
+- nand-ecc-strength: supported strengths are 24 and 32 bit (see nand-controller.yaml)
 - nand-ecc-step-size: step size equals page size, currently only 2k pages are
     supported
-- nand-on-flash-bbt: see nand.txt
+- nand-on-flash-bbt: see nand-controller.yaml
 
 Example:
 
-- 
1.9.0.138.g2de3478


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
