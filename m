Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDA4C9830E
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Sep 2026 01:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HyN6kn5InAOLIWDEn06joxgeWRZCBp9Tz00J+5s32Oo=; b=tYvBlGV2vZY2mn
	SE2d38bOHXmodM04MoyzxFz100mxg/3y2+G2FAQDYXH4q/Aj9gqebgEafEdjcRR46GQz6UV+jvKNE
	zeQelVQvNwoVURdMNxBt1RK98d+05AkAEs1gKPOcsP1I5fmuOoT50yCh3Drgf0ixMMW3i6xWEt3Xz
	4QuyBYCCr+vWujyGQsdZhVpzqvXllakdiuPeXNqO66wan23644jSom8wcQzAdli6rAk9JbqLmEXQm
	yS9pBOZs7BXjVo1EByNh4VA+l/Qf4FRhUa++UzZCpyDEX68AjEwBJFRhchuc7AOgdny7jzip6mzLF
	ydF92TKPG3R1pmEzQqdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAHWL-0000000EplZ-3FrJ;
	Sat, 26 Sep 2026 01:48:09 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAHWI-0000000EplC-3d9G
	for linux-mtd@lists.infradead.org;
	Sat, 26 Sep 2026 01:48:08 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so497019a12.2
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 18:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790387285; x=1790992085; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u8E325Hob5EvNUG1ihDxwdbdqqSNh/dhHuy8AA89ZKE=;
        b=is5DufvnA4AQx++2jF0McY/4+ZLeYSkgHzc6xX87z2ZRUqIgExYqPmmPd8wBwr5QtW
         rFiNor3oFQF6fZehkk2xZBb/P0ln0PajK8bGVKlue+HsKrJ70fFw/nwVpyVgtN3o2y97
         DrNwKbGlfaoNrjekVx6rahZsHb7LxCwfjE9nGVQjPy5Uk7jjUv6x70zz4MuD/6ZgwmnB
         kxNolC41Zk9Fut276HlKDGwHMUgOfTjGiiUYB0zeBvIiEjS404zS3HIt4q2kCWsUZWnn
         zxf1FYdmzGO4P0D/xQ7ucbtXdPESrFO06+Zyy/yesotBcHT0GIDYScJzzVswmswRsF6V
         XETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790387285; x=1790992085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8E325Hob5EvNUG1ihDxwdbdqqSNh/dhHuy8AA89ZKE=;
        b=ETG2eo0abrijmcbvkJVUvKv9wH9GkanbPeGNpg2daCBAiIZZRELqA/lEhDYWOIZD2Y
         9UJkNZCLIYfszvZl5VSiY0ioEZKyYucTnuM9nZOHExHCK3X9/6Hg5T0OayXvC5c5w14n
         PX5jNytLZVaBseklR6GLq9grgRnOzlX+7i0+05fsTff+YbJQaCaIRXrreXdayr+WZe+2
         j4tYb27GMjq4ZWviGyv/YVzl5vbDLNGLYB/rXGFdktmBTjzQ9nEA33DvXAM8qUJOl0FB
         CLiU77jXeMPej7TRWqlXRsKEwHNDFfCdH//YD7P05ujAMwvY1cVx00U41R9nBF6VG5OI
         aYnA==
X-Forwarded-Encrypted: i=1; AKwUvBxUj6iNErRZ2gNZ1Mt6up6Bx6xTiEQ2q9Rcs4xM9g5Glm83k9D5b+q8R+DqEXUfEDIxFJCw6WifnzI=@lists.infradead.org
X-Gm-Message-State: AFuF++kLW8l2Z0B3Jx26+zASZE9uL/uDSSOfe6gcxEpQz3VmEk64Cz4s
	n1VZnU+qGFv131NujmhEubQaFmZt15azXt646DjY+kWo7W8QxtALVnft
X-Gm-Gg: AYBFou04wNBuXLqAJVkvXv7dBnXlMSvLs9txxqNQYAz2zGhkMdads0BeKDl2FEkMero
	fUmDRP0iB2bAGy6HJC+DKprKVXNt0TNnKnOIHZXO1nniUnr9Of+YcJFoq6lNNjeZ1N9yn3uyLsS
	Hd62RSKlXel939HHQvfPP8Q/bCCWNR05CjbTdNv/YHiLadgJfAnY/7YM+DglumxNLs9gZ4+ZB8r
	HoeYihsSDMp7+949YEM1WzJow4WB5RysrTBdKxEOMKX7S9N18QcX+0TqhrbxG8YaXbw0fwlW+vB
	PTJEsFBsPNF4v1MBsAnsOYM0YjWszlLoIajBcvAbpggU5D4w4YSqGoKX7mxw5DntwJQiY6EOwDZ
	j1EAVIG/pybP/Gn4SUwL8qZ6cNfQ+9X8XtlyzM2Wg7zX5tmnPYyaRFGpbuNA0uv+JuaEr9QeEBn
	82cQ+A4gkyj1f4z77WxgVPv6eXq43P7G/AoNMAkTLQu1YG9gYb3LT/3k/iyBEEBsB4E+2lXb+IU
	RjL+5lQUhWL9Hxdz78I0TWfweAP5c+oVw9W43Va5DC+OMdzNyxEsQG4Zjw/Are3coTNbQ6QkcDl
	t6A+u1xceDzTQedo8JAKIqfpETsXxnOS6wEKXlhsX2JokK5j
X-Received: by 2002:a05:6a20:e211:b0:3dd:a006:ed90 with SMTP id adf61e73a8af0-3de0e8b30c3mr6910904637.38.1790387285324;
        Fri, 25 Sep 2026 18:48:05 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18ff85sm1836463b3a.19.2026.09.25.18.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:48:04 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Fri, 25 Sep 2026 18:48:02 -0700
Message-ID: <20260926014802.87255-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_184806_945124_1F7DBBD8 
X-CRM114-Status: GOOD (  17.07  )
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

The NDFC NAND flash controller was only described in a legacy text file,
so dtbs_check reported "failed to match any schema with compatible:
['ibm,ndfc']" for the ndfc nodes of the bluestone, canyonlands, eiger,
glacier, sequoia and warp device trees.

Convert the binding to the YAML format so those nodes match the generic
nand-controller-legacy schema.  Describe the node's reg, ccr and
bank-settings properties, along with its "nand" chip node which carries
the legacy partition layout.

The "nand" chip node carries no unit address, so the "nand@[a-f0-9]"
pattern of nand-controller-legacy.yaml never matches it and
raw-nand-chip.yaml is never applied.  Describe it with mtd.yaml,
nand-property.yaml and raw-nand-property.yaml instead, the way the
controller level does, so that both the deprecated partition@ nodes and
a modern "partitions" subnode are accepted.  The node name does not
matter, the driver picks the first child of the controller node.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: allow modern partitions
 v3: fix wrong regex
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      |  39 ------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt b/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
deleted file mode 100644
index 869f0b5f16e8..000000000000
--- a/Documentation/devicetree/bindings/mtd/ibm,ndfc.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-AMCC NDFC (NanD Flash Controller)
-
-Required properties:
-- compatible : "ibm,ndfc".
-- reg : should specify chip select and size used for the chip (0x2000).
-
-Optional properties:
-- ccr : NDFC config and control register value (default 0).
-- bank-settings : NDFC bank configuration register value (default 0).
-
-Notes:
-- partition(s) - follows the OF MTD standard for partitions
-
-Example:
-
-ndfc@1,0 {
-	compatible = "ibm,ndfc";
-	reg = <0x00000001 0x00000000 0x00002000>;
-	ccr = <0x00001000>;
-	bank-settings = <0x80002222>;
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	nand {
-		#address-cells = <1>;
-		#size-cells = <1>;
-
-		partition@0 {
-			label = "kernel";
-			reg = <0x00000000 0x00200000>;
-		};
-		partition@200000 {
-			label = "root";
-			reg = <0x00200000 0x03E00000>;
-		};
-	};
-};
-
-
diff --git a/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
new file mode 100644
index 000000000000..d5c392001ad3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/ibm,ndfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: IBM/AMCC NDFC (NAND Flash Controller)
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description: |
+  The NDFC is the NAND flash controller integrated into the IBM/AMCC
+  PowerPC 44x SoCs.
+
+allOf:
+  - $ref: nand-controller-legacy.yaml#
+
+properties:
+  compatible:
+    const: ibm,ndfc
+
+  reg:
+    description: Chip select and size used for the chip.
+    maxItems: 1
+
+  ccr:
+    description: NDFC config and control register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  bank-settings:
+    description: NDFC bank configuration register value.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  nand:
+    type: object
+    description: |
+      NAND chip attached to the controller. The driver picks the first
+      child of the controller node, so this node is not required to be
+      named "nand@<cs>".
+
+    allOf:
+      - $ref: mtd.yaml#
+      - $ref: nand-property.yaml#
+      - $ref: raw-nand-property.yaml#
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 1
+
+    patternProperties:
+      "^partition@[0-9a-f]+$":
+        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+        deprecated: true
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ebc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ndfc@1,0 {
+            compatible = "ibm,ndfc";
+            reg = <0x00000001 0x00000000 0x00002000>;
+            ccr = <0x00001000>;
+            bank-settings = <0x80002222>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            nand {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partition@0 {
+                    label = "kernel";
+                    reg = <0x00000000 0x00200000>;
+                };
+                partition@200000 {
+                    label = "root";
+                    reg = <0x00200000 0x03e00000>;
+                };
+            };
+        };
+    };
+  - |
+    ebc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        ndfc@1,0 {
+            compatible = "ibm,ndfc";
+            reg = <0x00000001 0x00000000 0x00002000>;
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            nand {
+                #address-cells = <1>;
+                #size-cells = <1>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    partition@0 {
+                        label = "kernel";
+                        reg = <0x00000000 0x00200000>;
+                    };
+                    partition@200000 {
+                        label = "root";
+                        reg = <0x00200000 0x03e00000>;
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
