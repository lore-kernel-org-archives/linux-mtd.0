Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991B3C27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jun 2024 17:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ID6zZKN5z2/L2T5eDUfwSlF9d2Fim2ZT4qbPWlRFN8=; b=mvyXZsSbScO6KW
	itltsNtUNjANpxiVMvdDJ/LTwbEWqlN6eLJElA6NY8lNqT+xCP2U54+6xiC2gEu2WrcuCnCyqb5Nk
	NjxQCVdySdxG8vdszwjOGat98rXsH7YZXN274/zQISz1PuRTa/vGbEKZULFiRkt49wzpXy2Y/aVR6
	pNkpEwIJQdIJ+fH2K8sogIZJ8/VMIPINRXX41WKhig3MG/3b6TBGAIdagTMXTfas1hRA8zRB+mxya
	M2Rbnn2Zq95uyfkqHw3ljt5sXEMzYG6SUVwvDXdSB6aYZNJTXl5ieqdOeSQT+yZjgqQCdf38Bpd9w
	riTzEP+aThvpEpFqqM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM3z-00000006BQS-0Wn9;
	Thu, 20 Jun 2024 17:59:11 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKM3X-00000006B4q-3ZhO
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jun 2024 17:58:46 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a6ef64b092cso136121066b.1
        for <linux-mtd@lists.infradead.org>; Thu, 20 Jun 2024 10:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718906322; x=1719511122; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=POfTgIlDMKnuctYd9TdkfbMoA75Hg7wnTz1QoAWu+kM=;
        b=efOkIF6drM05J8KUEmWQ/eNKhjDpLo0srOxrbB94FddvYb41H1Snz+7PCJ5mRi94mJ
         Aqhj6peVn22UdgupGytr0w8bAWInI1FVCPO2Hfpgx7aL5nsu/z3+8bWQpsd/W3MKb21J
         oo17sGP5KOAySy5nyxPzERSF0a3EkbdX/CnFYBuxKUTMt2kM+Ya6xtE3YPIxoBaAijX/
         dDHTebkx0UfB/obtgPWeJFHhJfd2huk0VMSMNFT3nUO0vhh8cvha5IwqD+gFY5N7xNCX
         CBHQ+lcrLg5qR/PKAo7eKbskmGllz84uvVCO1quATe3yuQ1JYUF0rSVWuJ37i7olczwV
         6hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718906322; x=1719511122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=POfTgIlDMKnuctYd9TdkfbMoA75Hg7wnTz1QoAWu+kM=;
        b=Rw/QvHkp7aFXaB4ZYWxjANI5wDevugb139g1fY4o2SSkuWZms/XCQDdG5/9JkturPv
         8yCgVloBJTFrIYNAA++peoCih1pmMJieZbchNZ5Ajdo0TvgnvuEF/UTeNdEKARDRR9j/
         rinx6/WonxXQUCiAJNkHpk+ZsKPwAYbcj7TBZo7HxV7k0AEJ214lRVqyr6q/t1Gs5kDO
         X0NjpFeIsIFKQnceZNZ64I5omtr63pGYbVSnXF3kiCYMtdG+JpDwb1RleLLytU11Nnhy
         AGNoO5DwHVYWG0yxFOwkTwTAC7mIrhkRKls1ctVfATyg98ZufGZuTTs0YOwwokM7DbrD
         z8mw==
X-Forwarded-Encrypted: i=1; AJvYcCVhmmKHa5zFJXq7AXV7QtkDRa6u28EjvRa/5Q2ajPjW4HgbKoQZcZRWr8gXSVYb2gD6aV9p4anzF1NEXoUBQr9JCrdIIsVIEWPdGqzWxA==
X-Gm-Message-State: AOJu0YzEgY6vUqN/LHSpv1uxG7wvmqNCMYswRPgAf+7QdtOY8qL+v4AC
	sNemZhkKXQ+Bi049zRc7QR1wdOGxssP4FuNASalrKEhO4JVLJJMez/DkE4Pa53c=
X-Google-Smtp-Source: AGHT+IHTrvjRefjDyJtTKiBTdA/7eaPFIlKAqed0dBKu9bDkvkontU8BQ0nzLod+LvZtaEx3jpBdyA==
X-Received: by 2002:a17:907:8b8b:b0:a6f:ad2f:ac5d with SMTP id a640c23a62f3a-a6fad2fad21mr380433766b.6.1718906321968;
        Thu, 20 Jun 2024 10:58:41 -0700 (PDT)
Received: from localhost.localdomain ([91.216.213.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42e80sm781370766b.186.2024.06.20.10.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 10:58:41 -0700 (PDT)
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
Subject: [Patch v4 03/10] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
Date: Thu, 20 Jun 2024 19:56:34 +0200
Message-Id: <20240620175657.358273-4-piotr.wojtaszczyk@timesys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_105843_933947_20EEDFE6 
X-CRM114-Status: GOOD (  17.36  )
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
---
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
 MAINTAINERS                                   | 10 +++
 2 files changed, 83 insertions(+)
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
index f7adf9f66dfa..fadf1baafd89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8918,6 +8918,16 @@ S:	Maintained
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
+N:	lpc32xx
+
 FREESCALE SOC SOUND QMC DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
