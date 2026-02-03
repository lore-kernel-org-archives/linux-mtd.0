Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4133E8B361
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Feb 2026 20:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPyMA+RoEmZ8IL/G+vC/fRdRmhvm4QFg4nBZg2ytsZY=; b=J/Z0PZ7DWuM5WP
	Uomc9x5UgYOBet7QAVeNFiW3DqWvgjEIVhI/YjB0br95GoDxHSsYyzvbfiuNcJc8I2Mg8FiVwZiHH
	nDtS0igQRpj+DtgYcIUgsP71xEhD6ftqraapZiIeHjvOu+7HQjwlZCQjojkI77J3O7t24iEH/R5/8
	eU9MJ+QVYcV5rBnSUKoS3zGOA5ZN1sTFlbDibirLWyccnYX/8S9qfitWSWiTtzkp7/d1hZeABvsE9
	tTeUvmKpoUKTYfq69YQ0/uYI+FYZVXkrJCFw1AZCSxfTAlIBUXGfcpt1OrDcwCNMVqEHBLuhfrEZF
	TIB5ta9Dv0uKX8EYtPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNC8-00000007L6p-3jww;
	Tue, 03 Feb 2026 20:40:20 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnNC3-00000007L57-2Z64
	for linux-mtd@lists.infradead.org;
	Tue, 03 Feb 2026 20:40:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B211B4E423E3;
	Tue,  3 Feb 2026 20:40:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89E7260728;
	Tue,  3 Feb 2026 20:40:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2ACDB119A8891;
	Tue,  3 Feb 2026 21:40:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770151210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oYbdI2fsKaGTvEp6wqBhR2QgtSukXpWA3HhYALr0rC8=;
	b=Uv10Bqx9uJPdFQaxT4nFxHJOG2Nfr3yJMVV0RDRRbd+lgJiFlD1rbPjET47gHEc6PAn7hF
	IQKc5UOQyE5hxDAt3qpYCOG4IblIOx8JJG4/RfxxetEPqT1AhTEV+HjNT/nqKbQYOPbXrx
	2CqGYKF3J1BtSNQPSn08SJhAo8vX6Ab7A6i6MCuYnOxuWVIiKP5nfKV3Y3LFERANBN5Uw4
	IQCS5h8jK8YgagM+57Z8iZughXGA4QwqsYSrACilLR7oGq0+7iBIg4+HDkbEv0lp4IwukB
	pe+WBWdv7ytjkt9v2BePwwCqZVPpL16mBIapJHe8/ZKHkhm3y1EAByZ7ISi98w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 03 Feb 2026 21:39:57 +0100
Subject: [PATCH v16 1/3] dt-bindings: mtd: Describe MTD partitions
 concatenation
MIME-Version: 1.0
Message-Id: <20260203-mtd-virt-concat-v16-1-a112a979c813@bootlin.com>
References: <20260203-mtd-virt-concat-v16-0-a112a979c813@bootlin.com>
In-Reply-To: <20260203-mtd-virt-concat-v16-0-a112a979c813@bootlin.com>
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
X-CRM114-CacheID: sfid-20260203_124015_778494_21E6E397 
X-CRM114-Status: GOOD (  12.70  )
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
