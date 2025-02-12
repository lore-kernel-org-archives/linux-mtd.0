Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5B9C021A1
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Feb 2025 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PEII/+E5Wkq150bwIGjY41CoxD5HmkOXsXFAIbr4Kg=; b=felfgMhFgcKqoz
	jxVnMlfdzC7RHxBTtR+8l7dCLW0olYBUG/+tgwThhMohGesXSuWGV+ouh57qDhRVkDmVJhGHRVknq
	5TDMVxj3rpkbxL1o46sEbCeKvOjrIKsppRH3QzB8PKWH+vqYxyd7ul3SdOn6oMrQLhHiKHHdlPkD2
	YnCCQlysYV5zXk/pM9KwfjaxU44xNj6hEXXqb+uO0EPwCA4G++ejkFjmqUvr0QmDY09s09OBRiGMr
	stTnjuxar6tUFHaO6Y4jJ75UkBjTOrfiRwS8q6IeZToa+iDvLOoGnHLsu25FCvdVFjW7Uel9YI/vo
	5l85ShxsRoBiUtsVo+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9ke-00000006wgZ-3XCP;
	Wed, 12 Feb 2025 10:13:52 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9V7-00000006tDP-21YW
	for linux-mtd@lists.infradead.org;
	Wed, 12 Feb 2025 09:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739354270; x=1770890270;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s4ttT1g36Eo0E0CZt2OBpnwxJIufA2Xwc1ViQTNB6k0=;
  b=XCrhbX9J6OXWZfsNmQxEFT74zYVJQ0UTMizgeP4GqjjssXX9oB/Uq/ER
   vOLWvypjioO2TF3HnRtksQ/+EQ3XTxT63qsfTC5jWHnPxBpiTG71BEnOJ
   NnkxgSEteQQ/pNDVdE3SV1x1HWtBKbZq63IzXA4GmfEBeYR1f67pQf8fC
   15pp0ivOy0pZeNa7Y2yNhFdBHt1GWoRoH9wz042C8cn5qT57NvgcU4Kd5
   zB0B52ib2iCkwDUUoz6lhIIhN79SIwzuUBIdVI6FSvnuQPH30hRRnupoG
   5kGrQDZfC8A3VfHMfmqkcUC8wCu1yio4XRc6pvGKAi6FeGK6abipx0iza
   Q==;
X-CSE-ConnectionGUID: rZcurc3KTNWcJ8tS1BmzKA==
X-CSE-MsgGUID: jvfxj8vnRY6+KuY9uusF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50224546"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; 
   d="scan'208";a="50224546"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 01:57:49 -0800
X-CSE-ConnectionGUID: d6lM/Aq+S02j0iwgU2XENg==
X-CSE-MsgGUID: fxGvHBrpR3ahXNpIjXMkrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112632051"
Received: from pg15swiplab1181.png.altera.com ([10.244.232.167])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2025 01:57:45 -0800
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mtd: cadence: document required clock-names
Date: Wed, 12 Feb 2025 17:54:06 +0800
Message-Id: <20250212095407.2667743-2-niravkumar.l.rabara@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250212095407.2667743-1-niravkumar.l.rabara@intel.com>
References: <20250212095407.2667743-1-niravkumar.l.rabara@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_015749_608390_AF2D93EB 
X-CRM114-Status: UNSURE (   9.81  )
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

Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
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
