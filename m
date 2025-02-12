Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86768C021A5
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qerbyeG6ibYM+Pemh1+Sj463ZZ1ZGF+jYIW38Wx3niU=; b=HTy69vMqIRZWYB
	X9d07shc6tUpXYQ5/glQW6tGrgMEiTLK05p3EikXPWgJ/JJGW1WTjPULQKm8WWVnXCNLgYbv/0ACY
	3y8qy+Sydjv43YUp04X4BMuB6/oMSIYcnob0M/ywDmMrCuWWgl49Ki1i+COJsiD44UzaNaZsMNVDT
	M3rMF/HPChtkCUiKMe5Y+ncbCC4BEvl35vlrRZKUrFbXG3Iwh6Kew0QnX6YQByez98R4R1H8uXjrD
	HYw3lB7NrNud43oIXCjQUYYM7KpmINX73lJ0pMn3ceiohxnEaFzUKN0IZz3gR2xYIX6AD4/Kh3l+k
	iKpgjbaLcsoY9cDENwMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiBaS-00000007IuH-0iI0;
	Wed, 12 Feb 2025 12:11:28 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAvb-00000007BCY-2zKA
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 11:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739359756; x=1770895756;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gux9UCdK4p0q+jE3IHrHjrU+Po2kg7wuDTli0jqGFLw=;
  b=fjWqq/zH5KsCu/rtlyxVuvG5F50LzO8otmu3JIS0OblyXyEwROvRuMyB
   nRehfzNikVIaFPPH+USbMW1F3zxBGP28iViOsxOFuuMx/2MKqL2+LEL9L
   oHliepyurMBzbN2DnXm4zci7UPw/jDVeV/3MpsZz4MEaXZ2IawUyu9KZN
   7lsvu3Rtvj05em/3mZAP0eYkCONg1QDp2ccfTw14x33VjGRQazzcFi8Qc
   l+Q7s22JKu+x3KixA/EQS6LA1WuugT7Im72KT+4iUp4MRX9c9VOjI5Kxg
   JtEpheYiYi9f2AneXXVciPBjaDtH/4Lf9NER8C2mV+2Gsgz18cO8N+DDu
   A==;
X-CSE-ConnectionGUID: UhNSGyLjTPST5PLbg/pq0Q==
X-CSE-MsgGUID: 8BPyLboqRbmnCwKKmKZ82w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39895753"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="39895753"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 03:29:16 -0800
X-CSE-ConnectionGUID: FDvl+/O4SfymzWNyy/vWyA==
X-CSE-MsgGUID: tPEjogDAReaAunXJACGNJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112648507"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2025 03:29:12 -0800
From: niravkumar.l.rabara@intel.com
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	nirav.rabara@altera.com,
	devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: mtd: cadence: document required clock-names
Date: Wed, 12 Feb 2025 19:25:34 +0800
Message-Id: <20250212112535.2674256-2-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212112535.2674256-1-niravkumar.l.rabara@intel.com>
References: <20250212112535.2674256-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_032915_802735_0150A4DE 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>

The clock-names property is required because the driver requests
the clock by name and not the index.
Update the example to use &clk instead of &nf_clk for the clocks
property to avoid confusion with the clock-names property "nf_clk".

Fixes: 1f05f823a16c (dt-bindings: mtd: cadence: convert cadence-nand-controller.txt to yaml)
Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
index 0bed37a994c3..e1f4d7c35a88 100644
--- a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
+++ b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
@@ -33,6 +33,10 @@ properties:
   clocks:
     maxItems: 1
 
+  clock-names:
+    items:
+      - const: nf_clk
+
   dmas:
     maxItems: 1
 
@@ -51,6 +55,7 @@ required:
   - reg-names
   - interrupts
   - clocks
+  - clock-names
 
 unevaluatedProperties: false
 
@@ -66,7 +71,8 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&nf_clk>;
+        clocks = <&clk>;
+        clock-names = "nf_clk";
         cdns,board-delay-ps = <4830>;
 
         nand@0 {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
