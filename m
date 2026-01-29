Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BA8D6100C
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Jan 2026 12:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPyMA+RoEmZ8IL/G+vC/fRdRmhvm4QFg4nBZg2ytsZY=; b=TtV7GTc60aVkt2
	WNy+YqPA9YfD8wdQdgOZclJaEl3oR6AtLuLcM83tV1Zo9KibgYS5fVq8NY8/v+DubmfoiB+ijtgTd
	SWUZWD/9AtRUfUi5f2c5wWRu4i9OouKAxgsd2N/zHH7XBykPAhOysMH6mltWSguZqIz/E2iafab15
	4zJidLWu6OvTkxKLfotxNWaMKdCZ2TqNCO7DHmKjeCenIsQAE/zXzuwTms8sthDcRGRdcOI83uvlB
	oo8KYYJ4hWZUyLDNhlR1xWpc4I/x2zCjnmk3KssOgNoMNKm5Ga5lXqTXMFc1PbV5s89gZdHqZrvcb
	XsMtUAKjQXLIYxxZtliQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqV-00000000545-0gI6;
	Thu, 29 Jan 2026 12:09:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlQqR-0000000052z-3ilN
	for linux-mtd@lists.infradead.org;
	Thu, 29 Jan 2026 12:09:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 800B74E42317;
	Thu, 29 Jan 2026 12:09:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 56084606B6;
	Thu, 29 Jan 2026 12:09:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36679119A884D;
	Thu, 29 Jan 2026 13:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769688591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oYbdI2fsKaGTvEp6wqBhR2QgtSukXpWA3HhYALr0rC8=;
	b=DIXXMNMwjiOwbhuSitndltWIqs1OunowrNs18VXBxNmEjreeGNHAsd1hx/xnmWylTNXyaH
	WtWsWNn6pUosl3uYUb3Jf7kuuyX19IAJNYxzAUxsjUsmCgGIr73tlKBY4VDKxZ0/bhV6Zt
	s54C5EHAHHsgOSQXDeFQmGbEoxYyS/qFBfhMb4PkVUbJQJ+GVRxaY1fVM7bv9F1L4/3B1/
	ezwUPcFKuL5hjV7n71o9snOAxY7JWHPKOk7NCOG2Nk99R4PWmJ4F/6kihjBldL1Um39PVS
	v1U93VjMuZnYWX6D4B314jMP7A1miYNQYBqbjMZ/9lHNbsGvCTf22bEIAJ0a0g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 29 Jan 2026 13:09:27 +0100
Subject: [PATCH v15 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
MIME-Version: 1.0
Message-Id: <20260129-mtd-virt-concat-v15-1-c56a232efbd2@bootlin.com>
References: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
In-Reply-To: <20260129-mtd-virt-concat-v15-0-c56a232efbd2@bootlin.com>
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
X-CRM114-CacheID: sfid-20260129_040956_067532_F1989F7D 
X-CRM114-Status: GOOD (  12.48  )
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
