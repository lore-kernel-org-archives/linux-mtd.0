Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D44C46CD4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 02:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUTXcFk6AY9sj6lbivXR17fo8OoL0bur2Uxhtzu0RGM=; b=teMTLGXjDG+0Az
	j2gI/EIi0wOCaRf6MMK9veMiD3oArItiZanQ+5+KMcC3bieeH72cQcHQoWcYXgXNj96XyN8d8wEJs
	xnXWWPBxOQvjyndkgZHvJ57KSTUNobBAygj33v944WkNChuUvGzdtnbdgkqn8rSbElCONbjB+pwiS
	O3VqieF0dn2anF7CnfozfHtZ+7F2+bCaEWbq7BTStLgV9ssbCYy5UAucj6v0yo+SGAWm8FfurJtuH
	HHa4s+Bunv5x+8ClaIvkKiMoXBfqWrucXsauUkcvPaadC+SMhvD5ISGG7tpJUpCGclgbseIJqUK87
	sIONSpSymG/4hFEtQZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPuQ-00CajX-0J;
	Tue, 19 Dec 2023 02:32:38 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFPu6-00Cafn-29
	for linux-mtd@lists.infradead.org;
	Tue, 19 Dec 2023 02:32:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rFPu1-0008Hj-06;
	Tue, 19 Dec 2023 02:32:14 +0000
Date: Tue, 19 Dec 2023 02:32:11 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/7] dt-bindings: mtd: ubi-volume: allow UBI volumes to
 provide NVMEM
Message-ID: <9732880851f342a4a1beef005c3432c9a91a43a3.1702952891.git.daniel@makrotopia.org>
References: <cover.1702952891.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1702952891.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_183221_585330_F8193C4E 
X-CRM114-Status: UNSURE (   8.60  )
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
 .../devicetree/bindings/mtd/partitions/linux,ubi.yaml  | 10 ++++++++++
 .../devicetree/bindings/mtd/partitions/ubi-volume.yaml |  5 +++++
 2 files changed, 15 insertions(+)

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
index 1e3f04dedc01d..19736b26056b2 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/ubi-volume.yaml
@@ -24,6 +24,11 @@ properties:
     description:
       Match UBI volume ID
 
+  nvmem-layout:
+    $ref: /schemas/nvmem/layouts/nvmem-layout.yaml#
+    description:
+      This container may reference an NVMEM layout parser.
+
 anyOf:
   - required:
       - volid
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
