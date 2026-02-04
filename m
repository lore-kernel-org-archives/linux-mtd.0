Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079ABE83EED
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Feb 2026 08:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TjLDk6+B8cJyNwyJVY19ezqD15NFunZNd4uEqhXgGUY=; b=FhUNBXyf5yq/ZL
	eHhH0yJESbQ4jC1q9IsKqiciM2gQf5DyIF5vd/GO7VE8qPYC72VETzT/bAaTf7q6PKtwJtB/BWI1A
	PyiOGMdWP0MsO+Q1wdWiExOyF7HfT/rltEWUKxFMtv+VK5azT9FCsQbuLQ7UEGY0EpkoW8uL9T7bd
	Div7YpEJ8DkUMZI4yQHA0kVgTeQy8UnM9l7ch+QSkibpBtHTt4BvureQwy4Kg1hdzIEUGuD0mTs40
	HFW1/Aca5Zj3uYl7M3L0xa3kEKuhipS+Mm91CvPNL2sQS3x+URaAeDdLH4/hARE7DATzoRff3HJMQ
	Ns/COdOtVqC2wnGr057A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYJO-000000087I2-0TOX;
	Wed, 04 Feb 2026 08:32:34 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYJK-000000087Fb-1DxA
	for linux-mtd@lists.infradead.org;
	Wed, 04 Feb 2026 08:32:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 81ED2C24395;
	Wed,  4 Feb 2026 08:32:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B225C60745;
	Wed,  4 Feb 2026 08:32:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3BAC2119A8891;
	Wed,  4 Feb 2026 09:32:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770193945; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BtPoBGuOTOslAVtD4AMARgD4qfustmM5dmvT1q96w9U=;
	b=AOcKfgkDTJ7rzc0EkCjo06AJMjsyHTxZXBURUS7X9rQcILK1TekbdS65wy4Fd6zOwmiGHx
	P17eHChNDxNt+UVSWHh/7apcARsFkNctCqMU+nIexZ7ueL1G4sVd1oOidLCTqgTAA7aCn3
	gz+X1IPjGIOIR4zAl8MEtNImwWbEVuQAHLd2MmWbJv8C2YypFyATP694GGxKy2GH47vdPq
	Bfwy4b93JeBwQlYDDQ9ar84YCjXD7e+GavVwgTmNiYpBLZQCx70SVVN+k+vbzXhtlrL0of
	QRWsD2YiTIU/G/7AfAq1WOA12ChfLSQOmGvwuuNvHeDWFw2fpjQ3UPJ1I251Ew==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 04 Feb 2026 09:32:16 +0100
Subject: [PATCH v17 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
MIME-Version: 1.0
Message-Id: <20260204-mtd-virt-concat-v17-1-5e98239bb55b@bootlin.com>
References: <20260204-mtd-virt-concat-v17-0-5e98239bb55b@bootlin.com>
In-Reply-To: <20260204-mtd-virt-concat-v17-0-5e98239bb55b@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Michal Simek <monstr@monstr.eu>, 
 Bernhard Frauendienst <kernel@nospam.obeliks.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_003230_482002_B4AF9D86 
X-CRM114-Status: GOOD (  12.37  )
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

From: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

The AMD QSPI controller supports an advanced connection modes called
Stacked mode which allow the controller to treat two different flashes
as one storage.

In Stacked connection mode flashes share the same SPI bus, but different CS
line, controller driver asserts the CS of the flash to which it needs to
communicate. Stacked mode is a software abstraction rather than a
controller feature or capability. At any given time, the controller
communicates with one of the two connected flash devices, as determined by
the requested address and data length. If an operation starts on one flash
and ends on the other, the mtd layer needs to split it into two separate
operations and adjust the data length accordingly. For more information on
the modes please feel free to go through the controller flash interface
below [1].

To support stacked mode, the existing MTD concat driver has been extended
to be more generic, enabling multiple sets of MTD partitions to be
virtually concatenated, with each set forming a distinct logical MTD
device.

A new Device Tree property is introduced to facilitate this, containing
phandles of the partitions to be concatenated with the one where the
property is defined. This approach supports multiple sets of concatenated
partitions.

[1] https://docs.amd.com/r/en-US/am011-versal-acap-trm/QSPI-Flash-Device-Interface

Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 .../bindings/mtd/partitions/partition.yaml           | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 80d0452a2a33..c9aba6838b3c 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -57,6 +57,15 @@ properties:
       user space from
     type: boolean
 
+  part-concat-next:
+    description: List of phandles to MTD partitions that need be concatenated
+      with the current partition.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 16
+    items:
+      maxItems: 1
+
   align:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 2
@@ -138,4 +147,15 @@ examples:
             reg = <0x200000 0x100000>;
             align = <0x4000>;
         };
+
+        part0: partition@400000 {
+            part-concat-next = <&part1>;
+            label = "part0_0";
+            reg = <0x400000 0x100000>;
+        };
+
+        part1: partition@800000 {
+            label = "part0_1";
+            reg = <0x800000 0x800000>;
+        };
     };

-- 
2.52.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
