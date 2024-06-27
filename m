Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416A3C30653
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2024 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIz4dnCmlt0NRcS7UBLwmC4ShWfHRwvySBMU32EmCRE=; b=tRvIUTNk91iTHN
	X7bcgBzHlwYYxrV3rTFLPTaFGRlYtsrT3IzTFbSZd4COrY2L2sWf83qcqRXyWoWfsOXb1TZnvZTAz
	UpNY+PleTnaX0g26L877D7CZGSTUQ0CFtvSnAXFQf+96fAmDwff4AI0ezPvNo1Z3+wcG7oNb0CxnL
	jOB6XnfU7Y157T7UnknjhyGu32cGIsyRK2iQ4lgTGDZTtkMU1/whiZZOD9zFMnJ9f2VMa1Eojg77/
	Xnw7N7YQmYtwdugTvfMpcA1k/qBENJcXULIF5qzfQ/gdkW5Lorx/GrCzHxuqu76DTt1/sIqoRkpU6
	A8aRh4O62D6LhUEsXX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqdk-0000000AlDd-3e33;
	Thu, 27 Jun 2024 15:02:24 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMqdf-0000000Al9u-2GGl
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jun 2024 15:02:22 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a729d9d7086so133137266b.0
        for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2024 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1719500538; x=1720105338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=ssgSzel/ifvcSxif6Gg2nrwD0dI7YKzmW9T3cZz2dsn+O0GuYupWLuL4ooArzf7PRH
         zi2oVAkdktmfekjX0udfXbKXE11+haGzktzgOO6J2nfqUbdGpPYQwRw8Htj62ek4x6h/
         myqZcM4VjDGpkoUc05jko1UWnVKLZ5r2J1yxat14OBJP6Z/BFUc3ZE3Y5syQxJLOndeJ
         /kRLzn4rkKrJo6sOFk4fnG1Mm1KaEgBmjHUUUawI1aCvZBShTaRu0qHHNfnwMszuNxYg
         sXHFjqtQI9UbXzjK+62kocgpPAiLbhwepqBjBllikJABX63wbCUw7X+hwyK1APSOihl+
         XAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719500538; x=1720105338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILtq9+4c141AHxBgbXMa+RP0emWEvg+/fmgpWsAX5kw=;
        b=YywChwAgp36NNxLeJlbvWw70X9fhGXtrzWY4bXwBIFJrkZimH9dFdzKz1AxthV0ulY
         0jxxQts/JN4CpIIZPu4J3UMzN7HbiIxFjw3Z88SxXSFIODYaTLM6VDC3rfjzYWCxvcH9
         8QrUsYs8IfqDnsyWB2KnxyMjOiC8q7NJZG51LGacLTfx/87qd92Uma2AFyOvl9+jiA4I
         abscsI9Y4N6TNJHTPR6rh5i1K9AvgLUgSINXLhwgdhWcsidPRMQ8+SjrP/5CqcECc7fI
         zGoTV+yCnTdMA0auRqk1oINof32BpEnQaxCdRQPIxup+mJNXXbID7CPgHm6Hp6J1yZBi
         HcpA==
X-Forwarded-Encrypted: i=1; AJvYcCWCx5GAydN7NBrq+vAtFnwVQtMTDLPoYLqbm9zlU/HoM4+c0+fStc5Tr29c1FsKkVQQ7NRRh7/1OH8fmWMHHIp3JZ1rPy01P+wpZSaU0g==
X-Gm-Message-State: AOJu0Yyubz39vEC9igF1c+Q/CbYN+hZrVfHZkWKCkQtLOPd/NDRkbCM6
	ovokN1GsjreZA9mrgy1BVh/g0fX8/aEDjXWYjTLuxDBXH7txAaoxAONt4oDx6w4=
X-Google-Smtp-Source: AGHT+IGhzRCqP2RV73RAfCGRkGAsHtE5znhuHD+qNGBvgcJ+PHUmpdeZlb/WN59v+vhaTirBRQcRFg==
X-Received: by 2002:a17:906:dfc7:b0:a6e:f869:d718 with SMTP id a640c23a62f3a-a7296f808e2mr189909566b.21.1719500537821;
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d7ca289sm67189066b.222.2024.06.27.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:02:17 -0700 (PDT)
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
	Arnd Bergmann <arnd@arndb.de>,
	Yangtao Li <frank.li@vivo.com>,
	Li Zetao <lizetao1@huawei.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Chancel Liu <chancel.liu@nxp.com>,
	Corentin Labbe <clabbe@baylibre.com>,
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Patch v5 03/12] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Thu, 27 Jun 2024 17:00:21 +0200
Message-Id: <20240627150046.258795-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_080219_704162_21A26DE9 
X-CRM114-Status: GOOD (  17.77  )
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

Add nxp,lpc3220-i2s DT binding documentation.

Signed-off-by: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes for v5:
- Removed "N:" from the MAINTAINERS entry

Changes for v4:
- Custom dma-vc-names property with standard dmas and dma-names
- Added to MAINTAINERS

Changes for v3:
- Added '$ref: dai-common.yaml#' and '#sound-dai-cells'
- Dropped all clock-names, references
- Dropped status property from the example
- Added interrupts property
- 'make dt_binding_check' pass

Changes for v2:
- Added maintainers field
- Dropped clock-names
- Dropped unused unneded interrupts field

 .../bindings/sound/nxp,lpc3220-i2s.yaml       | 73 +++++++++++++++++++
 MAINTAINERS                                   |  9 +++
 2 files changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml

diff --git a/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
new file mode 100644
index 000000000000..40a0877a8aba
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nxp,lpc3220-i2s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP LPC32XX I2S Controller
+
+description:
+  The I2S controller in LPC32XX SoCs, ASoC DAI.
+
+maintainers:
+  - J.M.B. Downing <jonathan.downing@nautel.com>
+  - Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nxp,lpc3220-i2s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: input clock of the peripheral.
+
+  dmas:
+    items:
+      - description: RX DMA Channel
+      - description: TX DMA Channel
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - dmas
+  - dma-names
+  - '#sound-dai-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/lpc32xx-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2s@20094000 {
+      compatible = "nxp,lpc3220-i2s";
+      reg = <0x20094000 0x1000>;
+      interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk LPC32XX_CLK_I2S0>;
+      dmas = <&dma 0 1>, <&dma 13 1>;
+      dma-names = "rx", "tx";
+      #sound-dai-cells = <0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 79b44addc139..ceec359c68fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8918,6 +8918,15 @@ S:	Maintained
 F:	sound/soc/fsl/fsl*
 F:	sound/soc/fsl/imx*
 
+FREESCALE SOC LPC32XX SOUND DRIVERS
+M:	J.M.B. Downing <jonathan.downing@nautel.com>
+M:	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
+R:	Vladimir Zapolskiy <vz@mleia.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/nxp,lpc3220-i2s.yaml
+
 FREESCALE SOC SOUND QMC DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
