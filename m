Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E0BC77B7E
	for <linux-mtd@archiver.kernel.org>; Tue,  2 May 2023 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eBXkUTLVRou5vO0sPcafb2PwLqYcvydwEwNb/+lPodA=; b=TN65QwAWEdhnFi
	9QlpI8vSMhVLshz5UuWWKEYNdRx01Kv3PHps9/N/ltTLhJSMVrwue3mnc27TPFDmBIxZmXGO/XClh
	YWvF0qotBN4iHHkxIM+jCT8qGiKFgM8/qtyafMKy6E7TuzZVRn0s0hosvxk4gXIPwO/Yf4sDPMwVm
	qyYBvL4c4ej7zO934aI9zN1h4t2PC2CzJqISbuBTAV6PPKCrmzeFJhFZMqvU6/vzm8FAUUdPOlfOE
	8p/VqZjITWC1cktchNWvCz4YWgpr9SyGc8JPAwNq3ZzZGX2NmqMVfWxlOKO0XvqiM7hJZ5S4tHhOO
	gydqARWX/8XQXloarPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pttBK-0028aD-3A;
	Tue, 02 May 2023 16:48:51 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pttBI-0028Z6-0z
	for linux-mtd@lists.infradead.org;
	Tue, 02 May 2023 16:48:49 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pttBH-0000VJ-06;
	Tue, 02 May 2023 18:48:47 +0200
Date: Tue, 2 May 2023 17:48:39 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: [PATCH 3/4] dt-bindings: mtd: partitions: add linux,ubi compatible
Message-ID: <faa0ceb4470f7160b05e892932d20b4a540c5955.1683043928.git.daniel@makrotopia.org>
References: <cover.1683043928.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1683043928.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_094848_345529_B4067793 
X-CRM114-Status: GOOD (  12.79  )
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

Add bindings for MTD partitions to be attached as UBI devices.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../bindings/mtd/partitions/ubi.yaml          | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/ubi.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/ubi.yaml b/Documentation/devicetree/bindings/mtd/partitions/ubi.yaml
new file mode 100644
index 0000000000000..aa02fbbd50716
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/ubi.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/ubi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Unsorted Block Images (UBI)
+
+description: |
+ Unsorted Block Images (UBI) is a volume management system typically
+ used on NAND flash providing bad block management as well as
+ wear-leveling.
+ Any partition containing the compatible "linux,ubi" will be attached
+ as UBI device.
+
+maintainers:
+  - Daniel Golle <daniel@makrotopia.org>
+
+allOf:
+  - $ref: /schemas/mtd/partitions/partition.yaml#
+
+properties:
+  compatible:
+    const: linux,ubi
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
+            label = "bootloader";
+            reg = <0x000000 0x100000>;
+            read-only;
+        };
+
+        ubi@100000 {
+            compatible = "linux,ubi";
+            label = "ubi";
+            reg = <0x100000 0x7f00000>;
+        };
+    };
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
