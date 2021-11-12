Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98CDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E4860F70
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7E4860F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2cq/SSve7oQb/f+v32RjMYfYRLJd7PG55G7+rsNxJ0=; b=n3Km5TbFoZAArf
	42+hcsELs2MfvnbpNm37bHeRq/sIrghr4WDBzH2ah7ADBJqLvRMjXww1kgbuNfIyqNTNMpBh4nhjr
	xiT2qWQdo2zgaKj7PtFSsh/hiGu3sCS7Ej4tOyLYYz1acoFY9WSM1Ir/OwmMxmwNNX0fCeFTJRi05
	3TGy1jhizJairgpHpU7bZwT6RN/73z7jStTrg1oaf4NjmaY/HGu0K9J9/KcXtiJrJRrx6oBJi1UbW
	6G5yZactaghpu93rFA0lMCmjceEX6Owu2aN8XrXeoPHhs12Ljp9IGCrVWOEuAw0ejobhLb/WOFo8J
	VRzyli7EmRszAU4l/WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlYTL-00B4u0-IM; Fri, 12 Nov 2021 15:28:11 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlYPb-00B3vg-Hg
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 15:24:21 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C57B224000D;
 Fri, 12 Nov 2021 15:24:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 3/3] spi: dt-bindings: zynqmp: Describe dual
 stacked/parallel memories modes
Date: Fri, 12 Nov 2021 16:24:11 +0100
Message-Id: <20211112152411.818321-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211112152411.818321-1-miquel.raynal@bootlin.com>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_072419_767924_3BE8385B 
X-CRM114-Status: GOOD (  11.62  )
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

Describe the two dual memories modes which are available on the ZynqMP
QSPI controller: stacked and parallel.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/spi/spi-zynqmp-qspi.yaml         | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
index ea72c8001256..959e008602f5 100644
--- a/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-zynqmp-qspi.yaml
@@ -30,6 +30,28 @@ properties:
   clocks:
     maxItems: 2
 
+  xlnx,dual-stacked-memories:
+    type: boolean
+    description: The QSPI controller can be wired to two SPI memorie in stacked
+      mode. This basically means that the two devices share the same bus but
+      have their own chip-select. From the controller perspective, it is like
+      having a single big device, the most significant addressing bit
+      automatically driving one chip-select or the other. This basically doubles
+      the total address space with only a single additional wire. Note that when
+      configured in dual-stacked mode, the controller does not support XIP nor
+      linear addressing.
+
+  xlnx,dual-parallel-memories:
+    type: boolean
+    description: The QSPI controller can be wired to two SPI memorie in parallel
+      mode. The two devices physically are on different buses but will always
+      act synchronously as for each byte, the even bits are stored in one memory
+      and the odd bits are stored in the other. From the controller perspective,
+      it is like having a single big device with a much higher throughput. This
+      basically uses two quad devices as if it was a single octal device. Note
+      that when configured in dual-parallel mode, the controller does not
+      support XIP nor linear addressing.
+
 unevaluatedProperties: false
 
 examples:
@@ -47,5 +69,14 @@ examples:
         interrupt-parent = <&gic>;
         reg = <0x0 0xff0f0000 0x0 0x1000>,
               <0x0 0xc0000000 0x0 0x8000000>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+        xlnx,dual-stacked-memories;
+
+        flash@0,1 {
+          compatible = "jedec,spi-nor";
+          spi-max-frequency = <50000000>;
+          reg = <0>, <1>;
+        };
       };
     };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
