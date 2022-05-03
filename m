Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9774AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVPrRH4SO5z375wRgLcWjFPlGwvmmjgtZXB+mbj+pfw=; b=g+jhcvpPyEvFcc
	NLiiokPRXR+0TYxwNQUukUwkPbIE2ZPQ4Nhs3mA9T0gbtsoXP/3nryJv0Ufu5dkSsyOOTTojG2VY5
	h5Z4sLFublH4fijp/MnZ4vuGmh0ucnnjKQEAr2ilf976u4sF+K7d0rSV9+5un9GyEqgJbfpy7tqAs
	5O6bya+cg/TScyvIkqKT3z+N8fmdwhEEeosrQxVB/yixSweGR0lor9zwa7MYSA2/RiVUvDH/nuPtQ
	vZj3bLH/KNddjD+gqVburEMt3aphtDGZx4gxtl/S4XK/x1zV4uXyH8UiWOyt5ooUNtf0m4pnPWoQI
	9MYDX73QsedhhLy1Xz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlun8-006ar2-KI; Tue, 03 May 2022 15:50:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlun6-006aqV-Bh
 for linux-mtd@lists.infradead.org; Tue, 03 May 2022 15:50:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id j15so24000978wrb.2
 for <linux-mtd@lists.infradead.org>; Tue, 03 May 2022 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kp0I+fDrNRZ+kcOulyBqIwYKgrX5Pypr91NpoQc/0zE=;
 b=ZFBOAaAsyVFB3azHklpMGisviv1wFqvgeuS+yXrkzNpI26aW8Rx4DIz/LT7mfLZjPt
 bdSXl4i53f+OSdYghJLapyYcckMhm1aIWxAOhQJWj9MXjGBcX1mpRpKOV1Vn8qMxL+uT
 rbpSVr+q9XpCTyISVuUqjbeBbgQyt4Mb7cVIlawXk/UCnggkV8Hm2nphDs5FQJAzITBY
 oVOiFW48hIk39EbzTqNOrPIxn6DY1w8fyciLm7M60NL5RxX91a2ZBhLOcd/UO2Ps2NYy
 AG5Z1NBvTY2N+gZkwta6wGhtU8KQYzrSLNGfezKuY0g5WSEwdseZf75KgGLAxa/faj0V
 O4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kp0I+fDrNRZ+kcOulyBqIwYKgrX5Pypr91NpoQc/0zE=;
 b=Wyh3T+QSYphrzX65SBKkus6t5Sn28b6oEdCtgcA47pYZWVecXIb2JaF3Z8zBfvl/Ga
 InM/nuHyBa/aUd3bdvff+vdNalRhFZbn/unuxi9cENUosq2NGcGmivXuGjXOBaWJIgFG
 4/PJiVnSRHljhUGrflWdLQtu7Yao9Vl3ACmg4jJC4AMf6Ca+SlC3fICS7KOyLiyiBYcG
 Fhy3fdgISObXtW5PiSACLr6yv00CadLiJy107YpJ+L9t9IaamF45T+jPWgNacMgQjohq
 XnykEVQKXcM2RX+1KtBVoVN9IgS1VNUU79/ySI5CA7Z0i4p+M5PyYkzKb8mB4l1R1QrG
 i3ZQ==
X-Gm-Message-State: AOAM533O1n+1wWX5Iba2Ga2aKBn6UHyNMAS1VNb+SJt7oZZyuly+kZRf
 rlRXm1aehhRC4sBZjYluFPQu2CtQR8XFf99koik=
X-Google-Smtp-Source: ABdhPJwW896RxEFOdbJcnn2DEmhLXrdedi9FVjmGiZViAFZp1PCH+C2fCuq498nQlWo9yP0OdCiwUA==
X-Received: by 2002:a5d:690c:0:b0:20a:d9d1:f5ce with SMTP id
 t12-20020a5d690c000000b0020ad9d1f5cemr13436892wru.295.1651593015655; 
 Tue, 03 May 2022 08:50:15 -0700 (PDT)
Received: from vmu1804.lan ([2a06:a004:d009:c8fa:102c:912a:a6e3:41ea])
 by smtp.googlemail.com with ESMTPSA id
 p26-20020adfa21a000000b0020c5253d8ecsm9523482wra.56.2022.05.03.08.50.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 08:50:15 -0700 (PDT)
From: Mikhail Zhilkin <csharper2005@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Karim <Karimdplay@gmail.com>,
 M <x1@disroot.org>, Mikhail Zhilkin <csharper2005@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: mtd: partitions: Extend fixed-partitions
 binding
Date: Tue,  3 May 2022 15:50:07 +0000
Message-Id: <20220503155007.2339847-1-csharper2005@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503154254.2339744-1-csharper2005@gmail.com>
References: <20220503154254.2339744-1-csharper2005@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_085020_459543_78BB6D50 
X-CRM114-Status: GOOD (  14.09  )
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
