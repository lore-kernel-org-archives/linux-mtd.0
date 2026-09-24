Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EFAC9830E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 21:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zwAoeRp635uWfOJvF7Qv6R1NPsAYWR4aCRxeFr66dMQ=; b=xQFvsjz+/CQwy1
	8hwjUmnF8eHZtxW4E618JJletQEaCFfkgFLNAAH5VU1UneAU5VBA8z1EgtzIUAFbY5H6lBu1BNC3A
	tyMs3wirVeReKxDyJ31oDTnqQYKIxiiBo6fOBoP68/hR9RlTBXiOGvMD2YDDbrYgReTiKcDBOvpeB
	f16m1BvgktW1bxJbw8mTUeBodnKa2QTkZQbm9QYRLI8Bn1Nko46ITxAtR9OirOlDlyX1Zix2KhMvZ
	warZr20n7QTe6WPRTwGn5BcrKDGbjxdQ2I7gqUOnx64ATZ6Oyyt6rcTD1rDwgkl9AJSv/ib85lYDy
	Pl4GE67ZuUoeC9BcTgOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qty-0000000CDPv-2EWR;
	Thu, 24 Sep 2026 21:22:46 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qtw-0000000CDPZ-2D4P
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 21:22:45 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so242514a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 14:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790284963; x=1790889763; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XNeX0VLmUYHcPXZxiAvv/hSZfqe9z0guoQ2EWN7NS/g=;
        b=S6aqcMPB06HGYDb9/LHyKcuCjl1yDJcU5XMrgcJDhbUla9aFrB61ExnbEFMhqjWpod
         S3ArXX52aVgJVoANtRu6XsDC1B8sFAJVtBrcPHFbhg67VqrIJ3WyMTm7a/mbMDfLTpDU
         Y2cLuh5lZtRSv8R4wSSvaamkKzUZzaF7bZWy4zARpLs/LifmeYCnK7aNlfFucS6+HcRQ
         ck2eBENBaPv4/583wphkjp4sR+cwBJdMmfdVXVIz/ocnAjCcUEnnrXdHrnMZfYLklwyC
         Vrx2DOmd1Dwjv1isytaGWpKapKLPhtRMzv5eIcEQJtvDZxabpnI75RvKDdOrnVBF1Cft
         ktlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284963; x=1790889763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XNeX0VLmUYHcPXZxiAvv/hSZfqe9z0guoQ2EWN7NS/g=;
        b=tyVq4gB0GA9aOFx4rMqOfa/PbUii19L3Ziw02LGh16C2phpUwtcgT5nNudCQyRShxi
         GXNG20reji6v9jEzkIU+Fm1Yb5PQBAx9jp61iW+/KEAG7+Psz6cGdGyA3QtmwRrr/kzI
         It9BpB9AUSOgnMFPuH5NYOXUC+ICLKHoa0/t/rQmOvHbDwxiYN0rMm3+6yhPh9QlLV6A
         GbZp2Y2F/M/WLKMZgUEn0O6E0szoM9B1wzWnZVfkzd+aApiREaNRHn4ZJpXS17+gDhWi
         zF6sUFvG/93Hg6NTRMdp80zrD6hwHLjHMyBcqbsI2M1zzICI6vB4Ryx1TkhKlp7UpaVs
         S8Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxVzDkMxsOQ24vZ5UE7tQmbMg9kwSCWsurX3eCloe7cXu5AqlsJNEQqqXrZxVLRN7uImZekaxz5KqU=@lists.infradead.org
X-Gm-Message-State: AFuF++l+oHmjp/AWIh/91ohn/42yD+aWis13vV54TX67Ka4SdyST3Nvz
	+sGXNfbgz99b4Q6j75nltG78gJ1P2c1/MbSRIhUSxESzu6jMLIlAjc4p
X-Gm-Gg: AYBFou29gxtryc77t7MNh6OtTmuVQKsSEBhUwiDFEf915Jg91gqy/9ydCrWH2uO5f2h
	IQLQ11n0VdkzpGmfh/xuikC20b7y+uwnvOfHRBkn+C/HEjRdtn6nyNDpU6tqCJhrtVv+KO9A5p3
	upsLGSWcJBNKcfRsZWXZKko/L39UstEaf8ieN95jFuikBja7oH758xNysSKE0qJwqK+LnFmgTrx
	1jrBM+VYyT6lhTTvWuva5LtOyMQorWIkfo1ZjGirJJ1neCZ8LgAK9qfyNHjwtnVuImGGjruODI8
	51T+6vSgjlxdVRZJHxihuu0EnFyul4mR89F1h8OYWGYotFx/kfJC9xwKPkuFlLu2L9/if8JTOEF
	LnkVMAcYnLpDZ+Y4jVahoEE/L3rH/Gqq7QaK19YynPJLPMyYvc129jFHJgnQlZNMR+F0S28ou+2
	mr464UvH3sWTlsrk1VlZUcfpCHHUjEjjxznFn9F6GcDLmWE4ROmXVhZlRaONf3/qFtUm13xuThm
	lrd8JDYjV8csrwkXAO5paLKGuFeB3L00T8HGnfqY0J3acpBFHAJik8wd+zOP3l22Ghhs6nSwu0g
	ripEoXQV/15kZ1Bn6rhvFWyGzecDdFisCq6DFWb277Y54bWriNbHEgvGa+w=
X-Received: by 2002:a17:90b:4e8f:b0:39e:6c68:1551 with SMTP id 98e67ed59e1d1-3a09896c4demr3131575a91.25.1790284962600;
        Thu, 24 Sep 2026 14:22:42 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5711sm461579a91.17.2026.09.24.14.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:22:42 -0700 (PDT)
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
Subject: [PATCHv3] dt-bindings: mtd: convert IBM NDFC binding to YAML
Date: Thu, 24 Sep 2026 14:22:40 -0700
Message-ID: <20260924212240.81857-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_142244_593842_266F7337 
X-CRM114-Status: GOOD (  15.52  )
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
 v3: fix wrong regex
 v2: fix reg value
 .../devicetree/bindings/mtd/ibm,ndfc.txt      | 39 --------
 .../devicetree/bindings/mtd/ibm,ndfc.yaml     | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 39 deletions(-)
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
index 000000000000..e614c5855b42
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ibm,ndfc.yaml
@@ -0,0 +1,88 @@
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
+...
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
