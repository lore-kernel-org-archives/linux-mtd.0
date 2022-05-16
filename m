Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5F4C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 16 May 2022 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fk8XHGclEMaclsU+Tj3SMtBht0yHVPH37kQW6PgnSLU=; b=3Cjgr5G5a7NVn2
	a5HJscNtSPrdVEj7iLDu2QI+lbsnKMi0CCMygHcv4wTnEyKu2i0YkvQdK4da2yeOVGOZbmnG6k6jg
	R/53B8B0hl3z9yFI4Un/Cc1VW3Kfh45CxHD94PmeWO0yQIwtZxSM3DwNe3Mn9SX70HLcP6mu0P6pZ
	HBtBex6re/IBajL3GULIrh5ETDVVtHR75J0NY45Vg+EtjHbjEbNzH/tdT9SjVN1Hl7TSRHKtZIdIE
	FDZ7tvzEs/JISIb00NJMEBJNDQWNsg0bWI4Qz+ntyr+7kRZwyWbZ8JCUqw3ttpmunbIqcMTKefUKX
	8HpMpeDqA8dgTOSW+TAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqcTX-008bCW-Hj; Mon, 16 May 2022 15:17:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqcTU-008bAN-Hj
 for linux-mtd@lists.infradead.org; Mon, 16 May 2022 15:17:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so11117356wms.3
 for <linux-mtd@lists.infradead.org>; Mon, 16 May 2022 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+YkSbV6bjoznxMCuUfht3UUoaizx6Wbg5BycQIS6zs=;
 b=cNS60endk/R5iL6M5AmmygvBoF4RQ00kAleLUrfXLdDd5yZxoxlxxDaazSLWmd+Wnx
 iZRdZ+rlAPvVyUJzAWqyuf4TzVuYvhu0QbLrB92lKjtKx5SDkApcFuqkrqTKuZDgcPob
 FiduQK2/BqrHunPLEEhaXEtmuzH89ia3B30/KtbqgDwdzL6xzoONO25koUCvIanLA7ll
 VrckBfjfbIScv+ei9Z+Uc0CQ9bAq8UDwvFekFDPlsce2w5xIqbbbVn2onVYGdm3yfkdB
 5iBfs4hBPza9U/PJsmoLbT4DQ9omUc2rGQqS8UFpmleyw7+paT12mlPYz6WtQJB/2DZF
 F9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+YkSbV6bjoznxMCuUfht3UUoaizx6Wbg5BycQIS6zs=;
 b=xCtvCoMJkj/IoSXoV4DSbJ9JTJBkIy1uxq8p7v9d6Vd7xczKIygjEjXVBxzhXdUsV4
 QfhjaGnwjey3dy8WKMd8fHwPsaJNujoDuubziTzhKFLRBjKXZscJIPQa3CVokUgHvY7k
 agWFiQFlp3HOKS08+XucOj2yw8hOjcZ/o3+TXGoDT5oE9lRBOFOlcm0kfoYOICijmBo3
 YJNJ5EIbAghyCx/w80oyG6TJU9YG7pfz5tJGwp2xMv6KUyAXHifB6AfJoaM7YSf1Yzwy
 DovFc1uu51VqtQAgRmZjTh2l8hV2diFC4kj9G3dWqb8vrjY40TUPJ67m82PkGLALoDaN
 EvXw==
X-Gm-Message-State: AOAM532x/3AzdSyaBQwljUVTxtjInd1/ygtHcH9YCTVq1eJRjHVVGPpc
 GeOcM57aF2WPDWHPQWyZlBw=
X-Google-Smtp-Source: ABdhPJyqmidpjlN1O3tTPJn+AIhv7a0YsSlZh0ZkQKZF5vAD9ffO8np5nuvRzdk+j1oMGvP+gOg+5w==
X-Received: by 2002:a05:600c:1986:b0:394:867f:984c with SMTP id
 t6-20020a05600c198600b00394867f984cmr27711295wmq.20.1652714248849; 
 Mon, 16 May 2022 08:17:28 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a003:501a:a7ce::887])
 by smtp.googlemail.com with ESMTPSA id
 r5-20020adfbb05000000b0020d00174eabsm6419984wrg.94.2022.05.16.08.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 08:17:28 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: mtd: partitions: Extend fixed-partitions
 binding
Date: Mon, 16 May 2022 15:17:25 +0000
Message-Id: <20220516151725.885427-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516151228.885222-1-csharper2005@gmail.com>
References: <20220516151228.885222-1-csharper2005@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_081732_640884_75508BB2 
X-CRM114-Status: GOOD (  12.71  )
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

Extend fixed-partitions binding for support of Sercomm partition parser
(add "sercomm,sc-partitions" compatible).

Signed-off-by: Mikhail Zhilkin <csharper2005@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../mtd/partitions/fixed-partitions.yaml      | 55 ++++++++++++++++++-
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index ea4cace6a955..ad3ccd250802 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -19,7 +19,11 @@ maintainers:
 
 properties:
   compatible:
-    const: fixed-partitions
+    oneOf:
+      - const: fixed-partitions
+      - items:
+          - const: sercomm,sc-partitions
+          - const: fixed-partitions
 
   "#address-cells": true
 
@@ -27,7 +31,24 @@ properties:
 
 patternProperties:
   "@[0-9a-f]+$":
-    $ref: "partition.yaml#"
+    allOf:
+      - $ref: "partition.yaml#"
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: sercomm,sc-partitions
+        then:
+          properties:
+            sercomm,scpart-id:
+              description: Partition id in Sercomm partition map. Mtd
+                parser uses this id to find a record in the partition map
+                containing offset and size of the current partition. The
+                values from partition map overrides partition offset and
+                size defined in reg property of the dts. Frequently these
+                values are the same, but may differ if device has bad
+                eraseblocks on a flash.
+              $ref: /schemas/types.yaml#/definitions/uint32
 
 required:
   - "#address-cells"
@@ -52,6 +73,7 @@ examples:
             reg = <0x0100000 0x200000>;
         };
     };
+
   - |
     partitions {
         compatible = "fixed-partitions";
@@ -64,6 +86,7 @@ examples:
             reg = <0x00000000 0x1 0x00000000>;
         };
     };
+
   - |
     partitions {
         compatible = "fixed-partitions";
@@ -82,6 +105,7 @@ examples:
             reg = <0x2 0x00000000 0x1 0x00000000>;
         };
     };
+
   - |
     partitions {
         compatible = "fixed-partitions";
@@ -119,3 +143,30 @@ examples:
             };
         };
     };
+
+  - |
+    partitions {
+        compatible = "sercomm,sc-partitions", "fixed-partitions";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        partition@0 {
+            label = "u-boot";
+            reg = <0x0 0x100000>;
+            sercomm,scpart-id = <0>;
+            read-only;
+        };
+
+        partition@100000 {
+            label = "dynamic partition map";
+            reg = <0x100000 0x100000>;
+            sercomm,scpart-id = <1>;
+        };
+
+        partition@200000 {
+            label = "Factory";
+            reg = <0x200000 0x100000>;
+            sercomm,scpart-id = <2>;
+            read-only;
+        };
+    };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
