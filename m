Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79E2C41535
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Dec 2023 00:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fgs8MovGi9sn0fMM+nAydAWLkZ08l+X7PudcP//y5tw=; b=qURTx1q35orHPW
	LNakG1lRTsAjkkXMoPOxDSnBEcA5n2sG1d9FHw/g4IGzu4GmW1KMittO/HTYRyI4OL+TMC039KVle
	6eZohazHINb49JESTn9iNLiSZ1rUhuBbIl7zqE3Vn6nDMJ5sRZgEduvGCQhlrYQWaKOFTg/rTYTbM
	CNIcOBAkOb2VbUUhxiBsjKELbFoLZRx/LvPLtKeVV5PTW2TfEIuTf3r5Z3HqAlJsWnDsAEaPLPbCl
	/iQEydcEivWcMMNuMq2Jb1eQhL6BVWNmMRkf7rgJBbRbWYOaWMcD4JxKjBpJOGBOtMths7HrmtjQb
	sahkIYcG7xWsN0uK8BpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEejC-006sry-1U;
	Sun, 17 Dec 2023 00:09:54 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEej4-006sqf-26
	for linux-mtd@lists.infradead.org;
	Sun, 17 Dec 2023 00:09:49 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rEeiq-00064i-1T;
	Sun, 17 Dec 2023 00:09:33 +0000
Date: Sun, 17 Dec 2023 00:09:30 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: mtd: add basic bindings for UBI
Message-ID: <a9c12b8cc183b103af421a4a350ae6ef1ec173c8.1702770711.git.daniel@makrotopia.org>
References: <cover.1702770711.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1702770711.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_160946_699160_9DD818FD 
X-CRM114-Status: GOOD (  13.14  )
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

Add basic bindings for UBI devices and volumes.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/partitions/linux,ubi.yaml    | 65 +++++++++++++++++++
 .../bindings/mtd/partitions/ubi-volume.yaml   | 35 ++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
new file mode 100644
index 0000000000000..7084a1945b310
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/linux,ubi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unsorted Block Images
+
+description: |
+  UBI ("Unsorted Block Images") is a volume management system for raw
+  flash devices which manages multiple logical volumes on a single
+  physical flash device and spreads the I/O load (i.e wear-leveling)
+  across the whole flash chip.
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+allOf:
+  - $ref: partition.yaml#
+
+properties:
+  compatible:
+    const: linux,ubi
+
+  volumes:
+    type: object
+    description: UBI Volumes
+
+    patternProperties:
+      "^ubi-volume-.*$":
+        $ref: /schemas/mtd/partitions/ubi-volume.yaml#
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    partitions {
+        compatible = "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            reg = <0x0 0x100000>;
+            label = "bootloader";
+            read-only;
+        };
+
+        partition@100000 {
+            reg = <0x100000 0x1ff00000>;
+            label = "ubi";
+            compatible = "linux,ubi";
+
+            volumes {
+                ubi-volume-caldata {
+                    volid = <2>;
+                    volname = "rf";
+                };
+            };
+        };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
new file mode 100644
index 0000000000000..c17d0caf07d97
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/ubi-volume.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UBI volume
+
+description: |
+  This binding describes a single UBI volume. Volumes can be matches either
+  by their ID or their name, or both.
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+properties:
+  volid:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description:
+      Match UBI volume ID
+
+  volname:
+    $ref: "/schemas/types.yaml#/definitions/string"
+    description:
+      Match UBI volume ID
+
+anyOf:
+  - required:
+    - volid
+
+  - required:
+    - volname
+
+# This is a generic file other binding inherit from and extend
+additionalProperties: true
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
