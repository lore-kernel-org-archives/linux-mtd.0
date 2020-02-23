Return-Path: <SRS0=rEYP=4L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53D6C35670
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 09:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9776620656
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2020 09:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oasVAp0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9776620656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eG2zC0lQwiMLUbE6ToloHUOIksUEqDby+VzN29R2HJU=; b=oasVAp0aUbvhBR
	dVnFxm0dVU7EcNlAB5E28oL/pmhh9xZrnwgxgTrgEVgSpJnH7Rlh5cY8V3Jpxnz3Olc0GEuAOg/KP
	MUXkkyhQ4ioCvmrzKLi+JwDhTUP7uztiNXarqhsNXEoRPA/nth3XPSo473vTTdQNDxh0rt+pMkar0
	Dpt07dOwUuBH+c2nbC4Arb5MzNnp8nmMia3WaWxEXPflY0fBNW50kZ9poYhVHeGE8GzV6AyWlnT2N
	SRSS0meLCuxnUUegUuWFED0Ff1DOfyR2yBy3nU/ekdV9cNgKOIOJ8gKZHzvmlsQK920Y+Z6mc37O7
	0pILAe718TfFMfaSRv6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5n7M-0007qW-5j; Sun, 23 Feb 2020 09:00:04 +0000
Received: from [80.156.29.194] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5n7F-0007ZW-MS; Sun, 23 Feb 2020 08:59:57 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1j5n7D-001RYm-3q; Sun, 23 Feb 2020 09:59:55 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH] docs: dt: fix several broken doc references
Date: Sun, 23 Feb 2020 09:59:53 +0100
Message-Id: <0e530494349b37eb2eab4a8eccf56626e0b18e6d.1582448388.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vignesh Raghavendra <vigneshr@ti.com>, devel@driverdev.osuosl.org,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Piotr Sroka <piotrs@cadence.com>,
 devicetree@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

There are several DT doc references that require manual fixes.
I found 3 cases fixed on this patch:

	- directory named "binding/" instead of "bindings/";
	- .txt to .yaml renames;
	- file renames (still on txt format);

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/mtd/cadence-nand-controller.txt       | 2 +-
 .../devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt      | 2 +-
 Documentation/devicetree/bindings/sound/st,stm32-sai.txt      | 2 +-
 Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt  | 2 +-
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml       | 2 +-
 MAINTAINERS                                                   | 4 ++--
 .../devicetree/bindings/net/wireless/siliabs,wfx.txt          | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
index f3893c4d3c6a..d2eada5044b2 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
@@ -27,7 +27,7 @@ Required properties of NAND chips:
   - reg: shall contain the native Chip Select ids from 0 to max supported by
     the cadence nand flash controller
 
-See Documentation/devicetree/bindings/mtd/nand.txt for more details on
+See Documentation/devicetree/bindings/mtd/nand-controller.yaml for more details on
 generic bindings.
 
 Example:
diff --git a/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt b/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt
index 48a7f916c5e4..88b57b0ca1f4 100644
--- a/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt
+++ b/Documentation/devicetree/bindings/net/brcm,bcm7445-switch-v4.0.txt
@@ -45,7 +45,7 @@ Optional properties:
   switch queue
 
 - resets: a single phandle and reset identifier pair. See
-  Documentation/devicetree/binding/reset/reset.txt for details.
+  Documentation/devicetree/bindings/reset/reset.txt for details.
 
 - reset-names: If the "reset" property is specified, this property should have
   the value "switch" to denote the switch reset line.
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt b/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
index 944743dd9212..c42b91e525fa 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
+++ b/Documentation/devicetree/bindings/sound/st,stm32-sai.txt
@@ -36,7 +36,7 @@ SAI subnodes required properties:
   - clock-names: Must contain "sai_ck".
 	Must also contain "MCLK", if SAI shares a master clock,
 	with a SAI set as MCLK clock provider.
-  - dmas: see Documentation/devicetree/bindings/dma/stm32-dma.txt
+  - dmas: see Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
   - dma-names: identifier string for each DMA request line
 	"tx": if sai sub-block is configured as playback DAI
 	"rx": if sai sub-block is configured as capture DAI
diff --git a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
index 33826f2459fa..ca9101777c44 100644
--- a/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
+++ b/Documentation/devicetree/bindings/sound/st,stm32-spdifrx.txt
@@ -10,7 +10,7 @@ Required properties:
   - clock-names: must contain "kclk"
   - interrupts: cpu DAI interrupt line
   - dmas: DMA specifiers for audio data DMA and iec control flow DMA
-    See STM32 DMA bindings, Documentation/devicetree/bindings/dma/stm32-dma.txt
+    See STM32 DMA bindings, Documentation/devicetree/bindings/dma/st,stm32-dma.yaml
   - dma-names: two dmas have to be defined, "rx" and "rx-ctrl"
 
 Optional properties:
diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index f0d979664f07..e49ecbf715ba 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -49,7 +49,7 @@ properties:
   dmas:
     description: |
       DMA specifiers for tx and rx dma. DMA fifo mode must be used. See
-      the STM32 DMA bindings Documentation/devicetree/bindings/dma/stm32-dma.txt.
+      the STM32 DMA bindings Documentation/devicetree/bindings/dma/st,stm32-dma.yaml.
     items:
       - description: rx DMA channel
       - description: tx DMA channel
diff --git a/MAINTAINERS b/MAINTAINERS
index d81701ea3336..6b30a58bd77b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4480,7 +4480,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/platform/sunxi/sun6i-csi/
-F:	Documentation/devicetree/bindings/media/sun6i-csi.txt
+F:	Documentation/devicetree/bindings/media/allwinner,sun6i-a31-csi.yaml
 
 CW1200 WLAN driver
 M:	Solomon Peachy <pizza@shaftnet.org>
@@ -15955,7 +15955,7 @@ F:	drivers/*/stm32-*timer*
 F:	drivers/pwm/pwm-stm32*
 F:	include/linux/*/stm32-*tim*
 F:	Documentation/ABI/testing/*timer-stm32
-F:	Documentation/devicetree/bindings/*/stm32-*timer*
+F:	Documentation/devicetree/bindings/*/*stm32-*timer*
 F:	Documentation/devicetree/bindings/pwm/pwm-stm32*
 
 STMMAC ETHERNET DRIVER
diff --git a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt b/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt
index ffec79c14786..17db67559f5e 100644
--- a/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt
+++ b/drivers/staging/wfx/Documentation/devicetree/bindings/net/wireless/siliabs,wfx.txt
@@ -94,5 +94,5 @@ Some properties are recognized either by SPI and SDIO versions:
    Must contains 64 hexadecimal digits. Not supported in current version.
 
 WFx driver also supports `mac-address` and `local-mac-address` as described in
-Documentation/devicetree/binding/net/ethernet.txt
+Documentation/devicetree/bindings/net/ethernet.txt
 
-- 
2.24.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
