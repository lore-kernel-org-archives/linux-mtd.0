Return-Path: <SRS0=vqft=VM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031FEC7618F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 23:05:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA2A220693
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jul 2019 23:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BMYnGkp/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA2A220693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IVG+y5WK/tCZpkh9ewmvyRSaPN9iWlRhRFuwXr5cK3I=; b=BMYnGkp/FPpGB1
	MwCKXNTfBvOfaDulKF3RyGgY+329jVk3xDFTFyEJvVwQrETCVTd8hZ1Rc6QkNTr+5WmIneDwsLidO
	+n30Y7Y4azYmCbnBIB24qiy8YU64EZK8lbbXCkIOgn/KCUwXI/EaXd+kpGNmlNAl3hk9mDxfk2CjS
	1d4m1lH/z5H+okD94F/7fkLGP3cGi8RxnI3RTMgfzOIA1ZU5A/00Mhm44xWEU7basBZLIpMEqRYUy
	ifAS+Ux36MRXN0l6BnqUKfBgI5vgKrYYY8G6+IMqNssL4SMmUfDwiWF+/c/BzCB4VNwSOwZtRvSV+
	0yApGUcFWfD7oC4hms+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnA1p-0000DF-IL; Mon, 15 Jul 2019 23:05:05 +0000
Received: from mail-io1-f66.google.com ([209.85.166.66])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnA1k-0008JM-F8
 for linux-mtd@lists.infradead.org; Mon, 15 Jul 2019 23:05:03 +0000
Received: by mail-io1-f66.google.com with SMTP id j5so32681135ioj.8
 for <linux-mtd@lists.infradead.org>; Mon, 15 Jul 2019 16:05:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k28XQmjVwDonv00Vu61ACUarMShzug/T9SvQGCXzgaE=;
 b=tByKs46f5b6F2Rk5I62cWm9dbv50UQ9wMKBEzyA01ylhLxMqAHpW5MDxmrTMDlfVux
 RzYusQDCpv6PngOgXCudznMOBdgN8ztUnDHW1Q5gzEcx3t7nxLnhS3Jltpwfg48hjh+/
 Xz2MZdwbNM/6jiv+tQADT3qf8e/avTDEZ+I8/UW4pr/+566nV4SexChBQnLeEu+FbPEA
 HhSPkU1JX5Qyx9uMiKlHxAF4ETX2OIxauirAa1VYzOko5Cm2BKDzJmanhZdlrBJif3zD
 KsvTrfgN+0cUXsweFMSAx+h7mJ5eerl2+sDsDeqJv3EDO2P76gfs8YIJuXUgDJLgqhCx
 B/RA==
X-Gm-Message-State: APjAAAXIgVhe9vjI3nVewbx1vRiZgSn5nVMZPpnBQJIC4WhXlmLQ+Udy
 15IgN3ukiWb9+EdE3y9cWA==
X-Google-Smtp-Source: APXvYqx8oBeU1HXQ+y/8oUso7u6EabN+Lj8Dck1Dh5+0lXZxGOc8P8rXKPubjC3HT1yThMl/Q9mGIw==
X-Received: by 2002:a5e:9404:: with SMTP id q4mr28791973ioj.46.1563231899603; 
 Mon, 15 Jul 2019 16:04:59 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.249])
 by smtp.googlemail.com with ESMTPSA id h8sm19123434ioq.61.2019.07.15.16.04.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 16:04:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Ensure child nodes are of type 'object'
Date: Mon, 15 Jul 2019 17:04:57 -0600
Message-Id: <20190715230457.3901-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_160500_514805_0FFEEFBB 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-gpio@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Properties which are child node definitions need to have an explict
type. Otherwise, a matching (DT) property can silently match when an
error is desired. Fix this up tree-wide. Once this is fixed, the
meta-schema will enforce this on any child node definitions.

Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-spi@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
Please ack. I will take this via the DT tree.

Rob

 .../devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml       | 1 +
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 1 +
 Documentation/devicetree/bindings/mtd/nand-controller.yaml     | 1 +
 .../devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml          | 3 +++
 .../devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml       | 1 +
 .../devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml       | 1 +
 6 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
index fc2f63860cc8..be32f087c529 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun8i-a23-rsb.yaml
@@ -42,6 +42,7 @@ properties:
 
 patternProperties:
   "^.*@[0-9a-fA-F]+$":
+    type: object
     properties:
       reg:
         maxItems: 1
diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index e5a411518be1..b5b3cf5b1ac2 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -55,6 +55,7 @@ patternProperties:
   "^pinctrl-[0-9]+$": true
 
   "^nand@[a-f0-9]+$":
+    type: object
     properties:
       reg:
         minimum: 0
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 199ba5ac2a06..d261b7096c69 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -40,6 +40,7 @@ properties:
 
 patternProperties:
   "^nand@[a-f0-9]$":
+    type: object
     properties:
       reg:
         description:
diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 06c4b66c3ee6..3ac5d2088e49 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -55,6 +55,7 @@ properties:
 
 patternProperties:
   '^gpio@[0-9a-f]*$':
+    type: object
     properties:
       gpio-controller: true
       '#gpio-cells':
@@ -113,8 +114,10 @@ patternProperties:
       - st,bank-name
 
   '-[0-9]*$':
+    type: object
     patternProperties:
       '^pins':
+        type: object
         description: |
           A pinctrl node should contain at least one subnode representing the
           pinctrl group available on the machine. Each subnode will list the
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
index c374fd4923a6..6d1329c28170 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun4i-a10-spi.yaml
@@ -50,6 +50,7 @@ properties:
 
 patternProperties:
   "^.*@[0-9a-f]+":
+    type: object
     properties:
       reg:
         items:
diff --git a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
index bda7a5befd8b..f36c46d236d7 100644
--- a/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/allwinner,sun6i-a31-spi.yaml
@@ -55,6 +55,7 @@ properties:
 
 patternProperties:
   "^.*@[0-9a-f]+":
+    type: object
     properties:
       reg:
         items:
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
