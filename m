Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A3BC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Dec 2023 15:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ANNcxxx38HOTnqnxtx4p6/weuRrS3vgJUL9xq2QF1Q8=; b=qi5fzbJgP4LaIk
	3twNU2pl71MDcxwd7M6XModLAi+8XXNAupysqA2h3+7PMunAnvAq4OpFMIrCdS5F8UVi2WH5zFC6Y
	C0enQZLOLFoLvujIKr1OqoNTAw0b0lWBe6I/nw0vY9sR+x3tIIEBuG8HSEDbLJI1S+xXDrKNDoHzQ
	riqsZ+ftlxyBr5+lkUDdIcVKIFFfGkcu04U93e9EtCgCoLyj08xlDZg79EncZV1Fp1udQ+NEZ1ahc
	MIFvJ9fIcXAkWK2Fce/W7wQT1MP57KYf3d16jvK+x/xXC8XCmSifabiGi10OxfswfioDx4PqOdeUd
	G4GpBPvRHCcKpUePKc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rChxu-005KRS-0J;
	Mon, 11 Dec 2023 15:13:02 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rChxl-005KIq-1R
	for linux-mtd@lists.infradead.org;
	Mon, 11 Dec 2023 15:12:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29B90E000F;
	Mon, 11 Dec 2023 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702307572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YFRNTXiHpB5q4OBf51HMQ0MXG7WMAPuA7YrMIImpGe0=;
	b=eH/hVFqXLeGU/34uyK7mc9EgkXkva33CrQszVtV40e1/5u6zGyGh9h36e4GlExYnIYOOHh
	+FEJ1Q7arcqVy235e191ce9lFPMVqL302sckpRP2VeKq7Y9d9WFAsh9mBxRC82//Ef7t0x
	AbRDSZmDH8bl8BhgULMlAkSLZNByGPttTtIxJc7poOMK3XuErAyfjYaN7GAumSJtRmjUu+
	PB3e6PZSdQP3ctZgagW5pPmILOl/EVMhN+3Er7BTjn0QFEWILCfLmQ1p1ETYt2a7NPcbAT
	5+b4qBtrDNqT6EUmLDIH71QbQF3tzOle1vR7RX+xk/LkFxO5e383G23QUMe8Kw==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Romain Gantois <romain.gantois@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: [RFC PATCH 6/6] dt-bindings: mtd: add GPT partition bindings
Date: Mon, 11 Dec 2023 16:12:42 +0100
Message-ID: <20231211151244.289349-7-romain.gantois@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211151244.289349-1-romain.gantois@bootlin.com>
References: <20231211151244.289349-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_071253_899656_6AC025CA 
X-CRM114-Status: GOOD (  14.35  )
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

Allow parsing GPT layouts on MTD devices.

Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 .../bindings/mtd/partitions/gpt.yaml          | 41 +++++++++++++++++++
 .../bindings/mtd/partitions/partitions.yaml   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/gpt.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/gpt.yaml b/Documentation/devicetree/bindings/mtd/partitions/gpt.yaml
new file mode 100644
index 000000000000..3c538562e3e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/gpt.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/gpt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GUID Partition Table (GPT)
+
+description: The GPT format is commonly used on block devices to describe a
+partitioning scheme. It mainly consists of a Legacy or Protective MBR for
+backwards compatibility, a primary GPT header with an array of Partition Table
+Entries, and a backup header with a backup array of PTEs. This partition table
+format can be used on MTD devices, specifically NOR flash devices, since NAND
+flashes are susceptible to bad blocks which could easily corrupt the GPT layout.
+Logical Block Addresses (LBAs) are defined to target 512-byte blocks.
+
+maintainers:
+  - Romain Gantois <romain.gantois@bootlin.com>
+
+select: false
+
+properties:
+  compatible:
+    const: gpt
+
+  '#address-cells': false
+
+  '#size-cells': false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    flash@0 {
+      partitions {
+        compatible = "gpt";
+      };
+    };
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 1dda2c80747b..f2b1565d5d0a 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -18,6 +18,7 @@ oneOf:
   - $ref: brcm,bcm4908-partitions.yaml
   - $ref: brcm,bcm947xx-cfe-partitions.yaml
   - $ref: fixed-partitions.yaml
+  - $ref: gpt.yaml
   - $ref: linksys,ns-partitions.yaml
   - $ref: qcom,smem-part.yaml
   - $ref: redboot-fis.yaml
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
