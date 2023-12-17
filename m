Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69DDC3DA6E
	for <linux-mtd@archiver.kernel.org>; Sun, 17 Dec 2023 22:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VwWY5c4VMJK3SauIYBeT3Ez2Kol+zXujPy8ngKqy390=; b=21u/v3FGVhuFBy
	/70zZV/AhtA8N2eKoT22GSd5Hq0QRrUOm9ldcLoiFrKDZGxEEnFR3oVyIKKhmMo+NNlAXlIYc4dUj
	1Eh1+vQOLf78nCuO2ceL69RMOLJYDaayv726w3gkfoTC7J4Mz2Czs7GxqhhdWQfi30Abarz4ubDbv
	VEgIxIwAwfKlwAOVmwSWoVOYzTN5/jYp7ZS1D7VVRRFEkOtmX7w/VvzClGR86QyVh/VjUQmAHgY7L
	jvajRzvmxza/bXMwkqQ0h3Npl69uihJ8JCX541qoFpIgwqfkrboEbYCcGBH841C50xgswIc4jPu4s
	4kQiPdBz+vog7iyLdBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEzU7-008Z5p-2N;
	Sun, 17 Dec 2023 22:19:43 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEzU5-008Z4u-0j
	for linux-mtd@lists.infradead.org;
	Sun, 17 Dec 2023 22:19:42 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rEzTz-0001b0-35;
	Sun, 17 Dec 2023 22:19:37 +0000
Date: Sun, 17 Dec 2023 22:19:34 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] dt-bindings: mtd: ubi-volume: allow UBI volumes to
 provide NVMEM
Message-ID: <778eaad045dbf9e10448dc5db7c0ef468191488e.1702850093.git.daniel@makrotopia.org>
References: <cover.1702850093.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1702850093.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_141941_268450_982B5088 
X-CRM114-Status: UNSURE (   9.21  )
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

UBI volumes may be used to contain NVMEM bits, typically device MAC
addresses or wireless radio calibration data.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/partitions/linux,ubi.yaml          | 10 ++++++++++
 .../bindings/mtd/partitions/ubi-volume.yaml         | 13 +++++++++----
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
index 7084a1945b310..27e1ac1f252e4 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/linux,ubi.yaml
@@ -59,6 +59,16 @@ examples:
                 ubi-volume-caldata {
                     volid = <2>;
                     volname = "rf";
+
+                    nvmem-layout {
+                        compatible = "fixed-layout";
+                        #address-cells = <1>;
+                        #size-cells = <1>;
+
+                        eeprom@0 {
+                            reg = <0x0 0x1000>;
+                        };
+                    };
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
index c17d0caf07d97..19736b26056b2 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
@@ -15,21 +15,26 @@ maintainers:
 
 properties:
   volid:
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     description:
       Match UBI volume ID
 
   volname:
-    $ref: "/schemas/types.yaml#/definitions/string"
+    $ref: /schemas/types.yaml#/definitions/string
     description:
       Match UBI volume ID
 
+  nvmem-layout:
+    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+    description:
+      This container may reference an NVMEM layout parser.
+
 anyOf:
   - required:
-    - volid
+      - volid
 
   - required:
-    - volname
+      - volname
 
 # This is a generic file other binding inherit from and extend
 additionalProperties: true
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
