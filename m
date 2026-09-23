Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E7BC9830B
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Sep 2026 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4MDpFGh8Yuvsc2n9gOds2AL2vpLCEM+y/M6MY8f1Lw=; b=EUSqQ25V+0iYWs
	v2HxhYI1AkjUYSrMMGLGTpBMIN763vuTpgFUw4b6qbtkP0KPVCcjTccmbc/RxySSYwkfC0Z8Ekepa
	BlhhJtuvHSRoRnUOdSZBa1WhBRPsXSWd5a3q3jk27dbDkZAtQt39u7pkBi+RABB/4h0tHnmV1dOuK
	szq7IINa6rk/ILqchbkDbyT/A7663/Jakk3zvmLJ6IyPsYa3YT2tzmHaVwfMDNY1jLU4Suh7J+TVt
	z6mockhU/riXSCOODP1Xt1dAWV6v5nTKniVVBNfBnR3QFXSCrDxpRhmvl7KDhyrsFaTVT0SJNkrqN
	bBhvReMm5ipXBz5zlyCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Sb5-00000009K6V-0L5C;
	Wed, 23 Sep 2026 19:25:39 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Saz-00000009K5l-1ivh
	for linux-mtd@lists.infradead.org;
	Wed, 23 Sep 2026 19:25:37 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939109fafd7so99476285a.2
        for <linux-mtd@lists.infradead.org>; Wed, 23 Sep 2026 12:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790191532; x=1790796332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2uLNBtINgA/GkNyiQCsk9cZ9o6dy6b2I5aUCsD0irM=;
        b=BR3ptJ1qx7xmQ3wnCZi5wW/JgMZhCQu5pq5N9c4ZJMrffcGsbeO93+xvH5LjWD8Rvy
         rTYSs4oGetGSSnR8ln9OPmBbEXLm8/MRNaG9VBsluvBNDny/MY0wPl/bvRK145KpyTPg
         vXQEdEmV0p7RFwfuCspSZjsAEEHGMQIQORtrwcIIE+N3c3kyK6fVSbhJ06RzizZ2Twz7
         kaHgHLE48ci54KN61n4lH9/OK6jo5+rYaWQ1Xgd1X8Y51VLWu99xJATD53XB7HOOOMxF
         PsmKaN6FXMrCE/KbmZwNmSnXhs9lYCYmWSlIS5NrD1T9suCnMDJB2yhIQFTVrcs/1rYb
         0tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191532; x=1790796332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2uLNBtINgA/GkNyiQCsk9cZ9o6dy6b2I5aUCsD0irM=;
        b=RxDdaRZ6khaYXvegBL79eacOzEljQlIh2fyRhOb9kNqjOvTqavpim/EFU2U0tBO+i2
         9aNReDZW1VvASXvFSDlvkFopjyd1diLOQA+uGK48Qu0UboZkZrOcPuw+qwQO9ipZzr5b
         gF9tx3gh76E11NdZzk/EgB1siLXzc/vkSy1h5ayVxIafHZMVGKBDsh0hrc5ZonseRdaa
         KyCVqSmQbNl2zqh6fO3VU+SJoH6AByMqZnSZ2ANC/O6MO0N3cMMtK4cFOQq0joYIR0fi
         S+S1VPm3aG7K6GaT3ZU9dZIxocHDb0IdMYYGx2/uhr9w+AjWyr/cr2/iwIvIVSggW/xp
         g/oQ==
X-Forwarded-Encrypted: i=1; AKwUvBw140P7HljA3kaEx1/nra95Zqb++dEVieuxXQ07X6XGL612A9yXZL64/eciZ0ihmgtHCAqp7zgrh+Q=@lists.infradead.org
X-Gm-Message-State: AFuF++nIwlfVwyRDCflOFTHWxVEEeoFZpriBY8bc9/1HYN7cwF9B4CHG
	yrSYIRItK7VHre41Id6umGE2zS7FBjUSfHUzL9QN4qgT7gF/hXWjnHPz
X-Gm-Gg: AYBFou3bbWXZ1ZsSP0UmrIeD9IO0/vZp88TNZic97hSlbN9IeecQgjLO1RXhocv+/c2
	4ZWt/rR4tmgpGNNuXM9LoqzkOVbLxF/rp9Bx0YFxz+PYBorh5lmTtDWMmHzAGTYjl/Ndhud3JxU
	M0GthPsHVPwESRd+VyHNJ6gOkJehc9cu3+ivqK32TgC6oN7ECLt7HVt+hFCYSP+lcGUznRI2EQ5
	/fgWpWScqvFWe7KcaIFvFfu3I8n2PDwMEZ5/YGELD7xppfTe5PCTbUxVLfLZ1Zqj9EvsKYLewnW
	UppnQ/dl5mgiKl7o82Jg2fp+flYDN3IqFSTeTKJlsrFVEh/6mMD7yYY8Yvyf36TxhKIbNeq+kI/
	A3FaHK5JZOgBd1vIeUm4KmMVajgl89eKigpEG7nWKbdtUr1KI2q/LCX+5OuZfLSrkpfXihILfyh
	tMS4YsTo21GWXIC0VKjhgD2fiCfS3NOS9jab6Y2EzRiHHmexUmhOaB2TvC4RTn+XAHypPE8nojb
	gp/1LYBtsXoJVejy5058zQtgXNlEoJk10f7igSH9eKtufywzcuDY2icSO1/SjONa5bZnReXBGcT
	veUCu+6ZqgZeBXygj3B6WKNqmT0q2tVjSO+IyET+k+w9QirPXDtEh3KUvH4=
X-Received: by 2002:a05:620a:c47:b0:939:8c80:669 with SMTP id af79cd13be357-93c344f00f6mr28296485a.42.1790191531871;
        Wed, 23 Sep 2026 12:25:31 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c245e8804sm294644185a.0.2026.09.23.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:25:31 -0700 (PDT)
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
Subject: [PATCHv2] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Wed, 23 Sep 2026 12:25:28 -0700
Message-ID: <20260923192528.52330-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_122533_465744_D9BFDE1B 
X-CRM114-Status: GOOD (  15.55  )
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

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      | 39 --------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 89 +++++++++++++++++++
 2 files changed, 89 insertions(+), 39 deletions(-)
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
index 000000000000..51ba0bd1d329
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,89 @@
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
+    description: NAND chip attached to the controller.
+
+    properties:
+      "#address-cells":
+        const: 1
+      "#size-cells":
+        const: 1
+
+    patternProperties:
+      "(^partition)?@[0-9a-f]+$":
+        $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
+        deprecated: true
+        unevaluatedProperties: false
+
+    additionalProperties: true
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
+...
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
