Return-Path: <SRS0=HIhO=MF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_RED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87C6C07E95
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 19:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FD8260725
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jul 2021 19:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FD8260725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xz4UZm4d53/iu62CIX7KTJ4B1h7rACXkLSW3Eb6Nm8I=; b=APVrhxiAMljSzK
	DOuo74kX27dvbuoCBj2Esn98El/lS/jVb7nd+DohVsxxjBfS8x0actZHl7idxtiUiVXLHX43U+2wW
	xpwRMrkYQ4JdFXxcu+T/BDpE6AcT9zH5riEap90ZpZoA2csBySda64rxlOFnkUppkZS77YZJjTS88
	xJ+1db34WL5FrlmpuAbMwbnkwOAMcC/uGJrBrrGrHhhG4i4j+k8DWWWLiB1ziLPKjptY8UzF/Jpxm
	QjFJWQiZB5yKhQyisllC9ZX/16xUnudKd/3x+5hSKyJsArnEcRz77ZDTVa0+xcWjceWutYJvadXzC
	+e6tQs3YsNuHMgEfy3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3OBL-00BF3c-NR; Tue, 13 Jul 2021 19:35:03 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3OBI-00BF2g-Pr
 for linux-mtd@lists.infradead.org; Tue, 13 Jul 2021 19:35:02 +0000
Received: by mail-io1-f48.google.com with SMTP id v26so618730iom.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jul 2021 12:34:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXNbiOfz2OADKu5/Fro0uEc8qfMv6oN+akM7nAMsoNs=;
 b=ObxhHia4kcOuJKdn464X8SSFFVwGywQHTyYrWG3wLX5FEW8VA8WED8ZAjqgnOcH1Md
 RCcLwLacPq9hNy0cBF3JTA9AIZZdl8tsTY/B9yYrNG2/CcJKRswjuUV89yG5ZyRX3Q4N
 pwL6YITCvE+5zjp4cXwVYqTGBV42wmD4gqsEtgu/3JlHCydU1DcVYzHvCmd9Qtt/a9QF
 GPmpPzqvtTNsfFgjSsGI0AmijkZMDllk+yp+TNSwFwjzD47GIEVq8OEQBpb7tJj6K60t
 BjXnTcgZH9AOT/G/K/v6zEXaI+ija3KWjbrryIRUdAAs/kDwkJILNJXKI3AJDAmvtZfV
 fyrQ==
X-Gm-Message-State: AOAM531lrLONXcZLUeK3/dLYOcZ+wFnuYiQsRxImnBOBiICXM5BdC93i
 Gj0xiNJ9p1sANnKrqEPc1A==
X-Google-Smtp-Source: ABdhPJzw9lbjwb1pdT4tIxapva2T9ilTykdW85tANNfljZrD6J0J6zkjV6l4axi9xOmTnyTsjbnCSg==
X-Received: by 2002:a5d:928f:: with SMTP id s15mr4391019iom.142.1626204898597; 
 Tue, 13 Jul 2021 12:34:58 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id k13sm4640772ilv.18.2021.07.13.12.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 12:34:57 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sebastian Siewior <bigeasy@linutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: More dropping redundant minItems/maxItems
Date: Tue, 13 Jul 2021 13:34:53 -0600
Message-Id: <20210713193453.690290-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_123500_889329_EE0C59A1 
X-CRM114-Status: GOOD (  18.35  )
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

Another round of removing redundant minItems/maxItems from new schema in
the recent merge window.

If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
same size as the list is redundant and can be dropped. Note that is DT
schema specific behavior and not standard json-schema behavior. The tooling
will fixup the final schema adding any unspecified minItems/maxItems.

This condition is partially checked with the meta-schema already, but
only if both 'minItems' and 'maxItems' are equal to the 'items' length.
An improved meta-schema is pending.

Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Siewior <bigeasy@linutronix.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-clk@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-mtd@lists.infradead.org
Cc: linux-rtc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/brcm,iproc-clocks.yaml      | 1 -
 .../devicetree/bindings/iommu/rockchip,iommu.yaml         | 2 --
 .../bindings/memory-controllers/arm,pl353-smc.yaml        | 1 -
 Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml  | 8 --------
 .../devicetree/bindings/rtc/faraday,ftrtc010.yaml         | 1 -
 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml    | 2 --
 6 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
index 8dc7b404ee12..1174c9aa9934 100644
--- a/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
+++ b/Documentation/devicetree/bindings/clock/brcm,iproc-clocks.yaml
@@ -50,7 +50,6 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 3
     items:
       - description: base register
       - description: power register
diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index d2e28a9e3545..ba9124f721f1 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -28,14 +28,12 @@ properties:
       - description: configuration registers for MMU instance 0
       - description: configuration registers for MMU instance 1
     minItems: 1
-    maxItems: 2
 
   interrupts:
     items:
       - description: interruption for MMU instance 0
       - description: interruption for MMU instance 1
     minItems: 1
-    maxItems: 2
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
index 7a63c85ef8c5..01c9acf9275d 100644
--- a/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/arm,pl353-smc.yaml
@@ -57,7 +57,6 @@ properties:
 
   ranges:
     minItems: 1
-    maxItems: 3
     description: |
       Memory bus areas for interacting with the devices. Reflects
       the memory layout with four integer values following:
diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index e5f1a33332a5..dd5a64969e37 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -84,7 +84,6 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 3
     items:
       - description: NAND CTLRDY interrupt
       - description: FLASH_DMA_DONE if flash DMA is available
@@ -92,7 +91,6 @@ properties:
 
   interrupt-names:
     minItems: 1
-    maxItems: 3
     items:
       - const: nand_ctlrdy
       - const: flash_dma_done
@@ -148,8 +146,6 @@ allOf:
     then:
       properties:
         reg-names:
-          minItems: 2
-          maxItems: 2
           items:
             - const: nand
             - const: nand-int-base
@@ -161,8 +157,6 @@ allOf:
     then:
       properties:
         reg-names:
-          minItems: 3
-          maxItems: 3
           items:
             - const: nand
             - const: nand-int-base
@@ -175,8 +169,6 @@ allOf:
     then:
       properties:
         reg-names:
-          minItems: 3
-          maxItems: 3
           items:
             - const: nand
             - const: iproc-idm
diff --git a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
index 657c13b62b67..056d42daae06 100644
--- a/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
+++ b/Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml
@@ -30,7 +30,6 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
     items:
       - description: PCLK clocks
       - description: EXTCLK clocks. Faraday calls it CLK1HZ and says the clock
diff --git a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
index a88f99adfe8e..f238848ad094 100644
--- a/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
@@ -25,14 +25,12 @@ properties:
 
   interrupts:
     minItems: 1
-    maxItems: 2
     items:
       - description: Host controller interrupt
       - description: Device controller interrupt in isp1761
 
   interrupt-names:
     minItems: 1
-    maxItems: 2
     items:
       - const: host
       - const: peripheral
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
