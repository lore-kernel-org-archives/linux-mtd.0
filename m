Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAF7C30653
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2024 10:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U3yX9MmzRHwmmQnm8Ge2PHjCQEu/b1igF6QX48WLZ0A=; b=l11emi6dAhlrJA
	9poMbymbgU3xlpVQbVsqe1AssgbXl8UyVyZ866j2H0K4CKdrqLmk2kmY09PcIZAI81QNXgRC1gxzz
	Bt9j+4KGTCvja+ZCt5uQYeP+PtLWyu5kK5s+L/EblFFkvliHNV3Ss4IAkMv2hxrsmo0HnA4sCgeLT
	Dy3kkbFM+liMhu1670RBxbTBQSfkw9Hf0bxpSi1U+IbtniHWvtZjAaCPWl7UDAdkOh/sPi4dZWvZ2
	wMcvc+P0MKfWXGwduG824Hemt/UVSq4uaKdg+fELlOum4Z29JEfkMTGKoDYOav1akrAKil65l0Zhk
	icgF99+k2jXm2OZ8kKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPjI-00000006IMK-19cl;
	Wed, 26 Jun 2024 10:18:20 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPjE-00000006IIb-1bZp
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jun 2024 10:18:18 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so21888a12.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Jun 2024 03:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719397094; x=1720001894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bdjU3nE5ZipGzXPlrfx4tB5EjZjaLf/s1zAFQ4DTHQ=;
        b=sjH2L3LJx4tPkfoboX1EvphNEXxtobhReGSBnFG5nVo+IgBi2VYXBZPidB+/WJdUe2
         Vsuvm7s9wiAe7ffHada4aqZZGjy3td2D4P+BC6CsJBE93Bm0F0txdeZL4V+e1yYp0egW
         zkd3yerLaAfOGArSbFfF1LpKn0mPZeNi8Iu8C2oSMRvoYra/apwyr/bpikER7AlS3SB7
         1+vW0jYnh3qKwmv94Y2v+B7bw0/HfwrIjduKxhogLb4tA/QUTkn5VjNCWlLVT2DJNwGS
         KDHaVTIo5IwYfFXGbWUlx/iNBgkBdbaxd3NBH4f+GP4PF+pOdI+FFywme9wXsWbdqN3L
         3FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719397094; x=1720001894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6bdjU3nE5ZipGzXPlrfx4tB5EjZjaLf/s1zAFQ4DTHQ=;
        b=fsqbUIq9i652ctLSPQNpGKQ7Tl961KmJKLCam5tZUV7siPlk+mAIfe4vblsiNcCwJ6
         HwKg+/QvhdFWrd/SeSf6KIHcEgjdY4hClgHhtCyM47nATpCNbWeGS3UshtJ1DOo4uPbz
         QY4wM8uRaUXFi4yhvrpcVJS184G4KxPUlevPEevk4kcDp+5FTNXkc+CXs1ZrX6r8crsV
         9w6W2oSMHMU/kOneUS3qAb0D2A0ywxVMKJ3HTWeXsXETd1JOR7201bhsjiFMA5vRWG95
         7ZwfFx/4wdIpS2gDO72Pt0IZVAtLRW94XBoko0Rv8BZmRgxenN5177EfaDRSFYnd39ji
         /61Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtZyFIX2ixCfbFfw6MU2g8CndXFqE/Zb2jLC6PoUX+NtaKG8rzPUMSGY4TANTQDQ68CiN7pTXIAoLQf4dz+x7DyPyr8yhNGcyODM4L4A==
X-Gm-Message-State: AOJu0Yy9dnLTRo0qfDYgRzGXjsWgqlvkhJJTgZqA+xHQLy7CzcCzP7CL
	MG/swo23p8AdauhoKJBz0UQxfTJyXx8t1GUwyz2HTweeC2JoTWsgRkehCTj3jcM=
X-Google-Smtp-Source: AGHT+IFBNccWMI7NTYfI9iYETbbac/VKuBb+ZnQdRhtrnkDqFlLEVtbm0dPVcl4LOR3fqWpc0urpjg==
X-Received: by 2002:a05:6402:340d:b0:582:5195:3a7a with SMTP id 4fb4d7f45d1cf-58251957777mr3714663a12.35.1719397094033;
        Wed, 26 Jun 2024 03:18:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3053558esm6965474a12.64.2024.06.26.03.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:18:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: intel,lgm: drop inactive maintainers from intel
Date: Wed, 26 Jun 2024 12:18:09 +0200
Message-ID: <20240626101809.25227-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_031816_593632_7DB0BFE4 
X-CRM114-Status: GOOD (  11.91  )
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

Emails to chuanhua.lei@intel.com, mallikarjunax.reddy@intel.com,
yixin.zhu@intel.com and vadivel.muruganx.ramuthevar@linux.intel.com
bounce with the same message:

  Your message wasn't delivered to Yixin.zhu@intel.com because the
  address couldn't be found or is unable to receive email.

The Intel LGM SoC was apparently part of Home Gateway division which was
acquired by Maxlinear, so switch maintenance of affected bindings to the
only known non-bouncing Maxlinear address: Rahul Tanwar.

I do not know if Rahul Tanwar or Maxlinear want to maintain the
bindings, so regardless of this change we should consider bindings
abandoned and probably drop soon.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml    | 2 +-
 Documentation/devicetree/bindings/dma/intel,ldma.yaml         | 3 +--
 Documentation/devicetree/bindings/leds/leds-lgm.yaml          | 3 +--
 Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml  | 2 +-
 Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml | 2 +-
 Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml  | 2 +-
 Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml   | 2 +-
 7 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml b/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
index 76609a390429..bd7f96515ab9 100644
--- a/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
+++ b/Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain SoC's Clock Controller(CGU)
 
 maintainers:
-  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 description: |
   Lightning Mountain(LGM) SoC's Clock Generation Unit(CGU) driver provides
diff --git a/Documentation/devicetree/bindings/dma/intel,ldma.yaml b/Documentation/devicetree/bindings/dma/intel,ldma.yaml
index d6bb553a2c6f..af96d52922f6 100644
--- a/Documentation/devicetree/bindings/dma/intel,ldma.yaml
+++ b/Documentation/devicetree/bindings/dma/intel,ldma.yaml
@@ -7,8 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Lightning Mountain centralized DMA controllers.
 
 maintainers:
-  - chuanhua.lei@intel.com
-  - mallikarjunax.reddy@intel.com
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 allOf:
   - $ref: dma-controller.yaml#
diff --git a/Documentation/devicetree/bindings/leds/leds-lgm.yaml b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
index 8b3b3bf1eaf2..4ea6cf0af836 100644
--- a/Documentation/devicetree/bindings/leds/leds-lgm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lgm.yaml
@@ -7,8 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain (LGM) SoC LED Serial Shift Output (SSO) Controller driver
 
 maintainers:
-  - Zhu, Yi Xin <Yixin.zhu@intel.com>
-  - Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index 07bc7e3efd3a..2582380bf657 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
@@ -10,7 +10,7 @@ allOf:
   - $ref: nand-controller.yaml
 
 maintainers:
-  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
index ca818f83579b..5af7e5f7e634 100644
--- a/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/intel,lgm-emmc-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain(LGM) eMMC PHY
 
 maintainers:
-  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 description: |+
   Bindings for eMMC PHY on Intel's Lightning Mountain SoC, syscon
diff --git a/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml b/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml
index 653a12286637..823a5fabf749 100644
--- a/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/intel,lgm-usb-phy.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel LGM USB PHY
 
 maintainers:
-  - Vadivel Murugan Ramuthevar <vadivel.muruganx.ramuthevar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
index 1144ca2896e3..1cd19db1aa50 100644
--- a/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/intel,lgm-io.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Intel Lightning Mountain SoC pinmux & GPIO controller
 
 maintainers:
-  - Rahul Tanwar <rahul.tanwar@linux.intel.com>
+  - Rahul Tanwar <rtanwar@maxlinear.com>
 
 description: |
   Pinmux & GPIO controller controls pin multiplexing & configuration including
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
