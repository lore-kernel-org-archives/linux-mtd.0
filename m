Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA4FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Mar 2022 12:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKYkU1mCEMsuTa9lsMbUyNe/ktcj2ynBK6SF8TwO/7g=; b=0oNATJ80hVYF2k
	hbhjxFC5TAS5xBJqHSOmmX01e2YLq9K4fv4HuZM1c5LhF0tZqejYieqTZ0+DVSqbMVfJ6F54MiNKV
	Sb3tHRFPEO2CIJxalyJbKJbxrmYMcpCfXMFPXuy/yeLxa9DcWMQsuFYfM/3T8mSVoaIlPkL2zldFa
	Dfa0CMxHHp4gOlF1l87FXlHCXQt65t48yx2l7XtX1oDT0xogVecqQtwbwT1xrY45YKw7Olg8EWcH4
	4L3VRXzHLbv8fatw8+eAxBS5ULRS4ZY3ctz/qTTRr1mEd5iatOwZDbESE6RfMyLRQj4rvW5iEhgDn
	QHvQp118oYCcZ9VerV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXjC2-00250Z-R3; Fri, 25 Mar 2022 12:37:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXjBv-0024yX-FK
 for linux-mtd@lists.infradead.org; Fri, 25 Mar 2022 12:37:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1740BB8272E;
 Fri, 25 Mar 2022 12:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39018C340F3;
 Fri, 25 Mar 2022 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648211836;
 bh=OHmFKewARZKJ1dIeeWMfSBVkRhMpf0/mziLxeR6DTV8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uIWGdGHLMI3I1tljkx2O9161q8AhbtsaBvGbeNZNiCa4k98iVQ/ElOrBogPbBjCCd
 QHmiPcNslHTB+2MqbWfrxlBudx66YP9Whz/cKHXXitVUYO6l3AjRB7UfcztBENHz0o
 Jw6h9HXIwOZQQ5lUTQfe0Y5mf3pCr19zw0sbwtiHr9yW1X7cJ7D+Fw44TSjd8OphyI
 9l98MmLo098XNtbeKBfMBNWfO2psBqOIGs/lBbDpDupwdJAOp52EhLitLwGOg8xJoJ
 UJgpzNJUMj1ICMU/wiLlv5L8ZqHpnQPvsa60Uu4Dy9/Pmy4kuKz0H3GsrsG59j1HUz
 Kiv+iy5zZqN3g==
From: Roger Quadros <rogerq@kernel.org>
To: miquel.raynal@bootlin.com,
	robh+dt@kernel.org
Cc: richard@nod.at, krzk@kernel.org, vigneshr@ti.com, kishon@ti.com, nm@ti.com,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: mtd: ti,elm: Convert to yaml
Date: Fri, 25 Mar 2022 14:37:05 +0200
Message-Id: <20220325123707.22020-2-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220325123707.22020-1-rogerq@kernel.org>
References: <20220325123707.22020-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_053719_688102_0AF06206 
X-CRM114-Status: GOOD (  15.91  )
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

hwmod framework use is deprecated for new platforms
so mark it so.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 Documentation/devicetree/bindings/mtd/elm.txt | 16 -------
 .../devicetree/bindings/mtd/ti,elm.yaml       | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 16 deletions(-)
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
index 000000000000..e36452b742c0
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ti,elm.yaml
@@ -0,0 +1,47 @@
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
+    const: ti,am3352-elm
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
+    elm: ecc@0 {
+        compatible = "ti,am3352-elm";
+        reg = <0x0 0x2000>;
+        interrupts = <4>;
+    };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
