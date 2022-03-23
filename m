Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06841C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Mar 2022 11:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKW9cDx47jHCtV1MBcwexWCWzaDhI77ApdeVE0i/4qo=; b=1hB62zIkQS/eOK
	BZ6ViqMkvffjxYD8pzBxDZaCHwiHtn5AsdNowhWro1zl1j/LZ+FrEtwPgnM6UUS9kYWBoCqUNiNMF
	gI8qKEs4wMeL81OhAysjubL+53BcRanT65H4GvmQcx2pRO8CHtLKlNrXZV7AgrtK9XReAmX2aembi
	R+WOneUhZVqq6bzoiGivWhggrLX1E1ee+6YCFY9ueKt+orxkAbU9z9I4oF9AGW4hUwnDunj4iy0+R
	2QZCoC5ab+lES7GPa6AcvR//UeVyAiN9FTskZlVcLsBXsK38X9TvimUdWxftNpEXZTbCZJNWG/mbT
	kVNY082Jt1plQ/IfpllQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWz1P-00DRHV-OK; Wed, 23 Mar 2022 11:19:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWz19-00DRA7-4C
 for linux-mtd@lists.infradead.org; Wed, 23 Mar 2022 11:19:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0518CB81E70;
 Wed, 23 Mar 2022 11:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58774C340F4;
 Wed, 23 Mar 2022 11:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648034342;
 bh=+03pVkLbs0yuhRnH8RNFU31AS/8ObnDLFNLKlsjbZ2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HKjUs0jB2XX/ceZA+FvvVLWF9rIo5TOsm+krntfedyTSeMryLPYfGufnka/DfODQw
 xPzBRNI7PSvJ7MTzcOz9XrMpC4q0v0zuMIX08L90zFBiJz+lnVXzr8zjObRC7naHxy
 PlbNDWEQcOKaqeiwWGSPDUOkFlhALUOBGbHzaQ1vQK5dbu9NNJ5Xa4qbQIMMq1R2G+
 Koe0WS0b739fkeYnx7dyjC7C/NQWVzUijxs+9R7G4c9DLI/YYRezcluhSrsxNrJlm/
 9GtGWK7I04T3fP6Botce+vzHP5zUtwe8nu1YXZpKniw46xb5Bn6YXlIRM4F7k8SHNp
 vlAWeu7VNTWRg==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Date: Wed, 23 Mar 2022 13:18:49 +0200
Message-Id: <20220323111851.4699-2-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220323111851.4699-1-rogerq@kernel.org>
References: <20220323111851.4699-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_041907_360547_0CBD0D67 
X-CRM114-Status: GOOD (  15.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert elm.txt to ti,elm.yaml.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 Documentation/devicetree/bindings/mtd/elm.txt | 16 -------
 .../devicetree/bindings/mtd/ti,elm.yaml       | 48 +++++++++++++++++++
 2 files changed, 48 insertions(+), 16 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/elm.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ti,elm.yaml

diff --git a/Documentation/devicetree/bindings/mtd/elm.txt b/Documentation/devicetree/bindings/mtd/elm.txt
deleted file mode 100644
index 59ddc61c1076..000000000000
--- a/Documentation/devicetree/bindings/mtd/elm.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Error location module
-
-Required properties:
-- compatible: Must be "ti,am3352-elm"
-- reg: physical base address and size of the registers map.
-- interrupts: Interrupt number for the elm.
-
-Optional properties:
-- ti,hwmods: Name of the hwmod associated to the elm
-
-Example:
-elm: elm@0 {
-	compatible = "ti,am3352-elm";
-	reg = <0x48080000 0x2000>;
-	interrupts = <4>;
-};
diff --git a/Documentation/devicetree/bindings/mtd/ti,elm.yaml b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
new file mode 100644
index 000000000000..24ed0fb84204
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ti,elm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Error Location Module (ELM).
+
+maintainers:
+  - Roger Quadros <rogerq@kernel.org>
+
+description:
+  ELM module is used together with GPMC and NAND Flash to detect
+  errors and the location of the error based on BCH algorithms
+  so they can be corrected if possible.
+
+properties:
+  compatible:
+    items:
+      - const: ti,am3352-elm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  ti,hwmods:
+    description:
+      Name of the HWMOD associated with ELM. This is for legacy
+      platforms only.
+    $ref: /schemas/types.yaml#/definitions/string
+    deprecated: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    elm: elm@0 {
+        compatible = "ti,am3352-elm";
+        reg = <0x0 0x2000>;
+        interrupts = <4>;
+    };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
