Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A6EC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFJ+J+wssxkLeg5heeQHscOYEZ3ZzaXiIyD8wxSyCI4=; b=qcH6O9oTvhd2/7
	7bAsnzNXkGK44HmZD0z9joXdIV5RDYawE1eqVgtrukmT3NRzzuog+mzo6uqFz1ezRENhMXFWxWsGg
	z6hOqQGIyV7mTKBXaqN6439npXVPDzYvy+1OEEqWqOh8Ed1QOxDiDgwu0gTcwFE6qma2WY57Edh92
	dMSfXQ6hUchK92c+A+LXWLJ1MQhxbDP3auwW6Vq8oiNawMspc0CMUH2+fdLZbhQhLqqjkCIbVqF/Y
	SW5n48WsYcWa5M3SiKd815qF4XAGE27A/3ClepN3ljBYolN7cZsn50qvTdlO2VJVPAJRn401D2SCj
	LBN5m5iP++Bo1PkTvm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVOE-00H2OW-VI; Mon, 14 Nov 2022 09:04:27 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNF-00H1oY-2Q
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D8394FF813;
	Mon, 14 Nov 2022 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lncVZ4FVnBfjP1TrSlO1IJnUMYB8dLEhvsq2pKAQf7Y=;
	b=XdjK81IMXZi4RiFjjs4GuPr7KAfQWTBCNWmVyPUAYfIcRDHP5kEG9ckIuLkAijk4jWqLDd
	M9yJdlCS6y7eeypIMvCM2mkynTBWgQu1EGL70guw0SCBnbrjRlwVG7M+I8VNBdzDKZ9r6r
	JE9VChVgpFk/dW94e7L1aOSQOEXi7eH5Dbob6I4d/SrU21UXa+eKjog3fZDKeF8lOm4GJ/
	y2Sw4ulstPnDZje4m6Z38F3CLAf3IgPwGTyT+Z67Q48w034qanOoiNKWWoRoOVPwsJdDJD
	Yi2kYm2wIEsmHn3I9LVpR2MI3P+gnUwA2u7UFy90rI7zTBmQaG06/bWSPk00hw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/17] dt-bindings: mtd: Remove useless file about partitions
Date: Mon, 14 Nov 2022 10:03:00 +0100
Message-Id: <20221114090315.848208-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010325_416896_F2568869 
X-CRM114-Status: GOOD (  20.35  )
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

There is already a real partitions.yaml file, so assuming everybody
knows hot to read yaml schema now, this text file is no longer needed,
so drop it.

Depending on the situation, the lines referring to this file are either
dropped or edited to point to mtd.yaml which includes partition{,s}.yaml.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/atmel-nand.txt    |  6 ++--
 .../devicetree/bindings/mtd/ingenic,nand.yaml |  1 -
 .../devicetree/bindings/mtd/lpc32xx-mlc.txt   |  2 +-
 .../devicetree/bindings/mtd/lpc32xx-slc.txt   |  2 +-
 .../devicetree/bindings/mtd/mtk-nand.txt      |  2 +-
 .../devicetree/bindings/mtd/partition.txt     | 33 -------------------
 drivers/mtd/parsers/Kconfig                   |  2 +-
 7 files changed, 6 insertions(+), 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/partition.txt

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 3aa297c97ab6..50645828ac20 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -45,10 +45,8 @@ Optional properties:
 - atmel,rb: an integer identifying the native Ready/Busy pin. Only meaningful
 	    on sama5 SoCs.
 
-All generic properties described in
-Documentation/devicetree/bindings/mtd/{common,nand}.txt also apply to the NAND
-device node, and NAND partitions should be defined under the NAND node as
-described in Documentation/devicetree/bindings/mtd/partition.txt.
+All generic properties are described in the generic yaml files under
+Documentation/devicetree/bindings/mtd/.
 
 * ECC engine (PMECC) bindings:
 
diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index 8c272c842bfd..87b2944d0d1b 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -34,7 +34,6 @@ properties:
     type: object
     description:
       Node containing description of fixed partitions.
-      See Documentation/devicetree/bindings/mtd/partition.txt
 
 patternProperties:
   "^nand@[a-f0-9]$":
diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
index 6d60bc3063f5..64c06aa05ac7 100644
--- a/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
+++ b/Documentation/devicetree/bindings/mtd/lpc32xx-mlc.txt
@@ -19,7 +19,7 @@ accuracy:)
 - nxp,wr_low: WR_LOW
 
 Optional subnodes:
-- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
+- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt b/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
index d94edc0fc554..39f17630a301 100644
--- a/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
+++ b/Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
@@ -20,7 +20,7 @@ clock speed:)
 - nxp,rsetup: Read setup time (R_SETUP)
 
 Optional subnodes:
-- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
+- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/mtd/mtk-nand.txt b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
index 4d3ec5e4ff8a..839ea2f93d04 100644
--- a/Documentation/devicetree/bindings/mtd/mtk-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/mtk-nand.txt
@@ -131,7 +131,7 @@ Example:
 	};
 
 NAND chip optional subnodes:
-- Partitions, see Documentation/devicetree/bindings/mtd/partition.txt
+- Partitions, see Documentation/devicetree/bindings/mtd/mtd.yaml
 
 Example:
 	nand@0 {
diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
deleted file mode 100644
index ead90e8274d6..000000000000
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Flash partitions in device tree
-===============================
-
-Flash devices can be partitioned into one or more functional ranges (e.g. "boot
-code", "nvram", "kernel").
-
-Different devices may be partitioned in a different ways. Some may use a fixed
-flash layout set at production time. Some may use on-flash table that describes
-the geometry and naming/purpose of each functional region. It is also possible
-to see these methods mixed.
-
-To assist system software in locating partitions, we allow describing which
-method is used for a given flash device. To describe the method there should be
-a subnode of the flash device that is named 'partitions'. It must have a
-'compatible' property, which is used to identify the method to use.
-
-When a single partition is represented with a DT node (it depends on a used
-format) it may also be described using above rules ('compatible' and optionally
-some extra properties / subnodes). It allows describing more complex,
-hierarchical (multi-level) layouts and should be used if there is some
-significant relation between partitions or some partition internally uses
-another partitioning method.
-
-Available bindings are listed in the "partitions" subdirectory.
-
-
-Deprecated: partitions defined in flash node
-============================================
-
-For backwards compatibility partitions as direct subnodes of the flash device are
-supported. This use is discouraged.
-NOTE: also for backwards compatibility, direct subnodes that have a compatible
-string are not considered partitions, as they may be used for other bindings.
diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
index aaa06050c9bc..b53b8bc7c9e6 100644
--- a/drivers/mtd/parsers/Kconfig
+++ b/drivers/mtd/parsers/Kconfig
@@ -75,7 +75,7 @@ config MTD_OF_PARTS
 	  This provides a open firmware device tree partition parser
 	  which derives the partition map from the children of the
 	  flash memory node, as described in
-	  Documentation/devicetree/bindings/mtd/partition.txt.
+	  Documentation/devicetree/bindings/mtd/mtd.yaml.
 
 config MTD_OF_PARTS_BCM4908
 	bool "BCM4908 partitioning support"
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
