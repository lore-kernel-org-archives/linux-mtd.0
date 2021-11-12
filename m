Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD02FC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:25:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621BD60F70
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 15:25:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 621BD60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ukeaz+fsjeKcX+4md+fb3O4Yl3/7AEmU1ff8Gh43kQQ=; b=XwZTKvG5Xkz9CA
	UgbvExjgxGnqXLjEg/Wftl95epdBioA+H8eFSEer5bDPmApCIGWM+RYH6zVWAQlY9bUG0ZPOrKcRl
	cyQ8GtkLvLRgqEo0X/jraKMgJcW9HL3SwsUHGC5bNzNhP+FAq6r0ZzUfTXdiUG6TEY2Dt2T2jqgDz
	z1bfd2FuQqYDf/Cq+uN+Vx7pv/O4aobl0bjb6OonfxUu+1tNZMfV44Tyqm/RyX5J3CvtTPQjDCAIP
	BLYRnNujwRiQO7RPACVktBcf0PtPhAs8VNTiH8tPLcswTl0+xEFSy1PwlTd9IA65EAdx9mZxrf1wh
	73Ro6+gFLMEABBORM8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlYPg-00B3xe-6h; Fri, 12 Nov 2021 15:24:24 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlYPa-00B3uu-8e
 for linux-mtd@lists.infradead.org; Fri, 12 Nov 2021 15:24:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 1B80F24000A;
 Fri, 12 Nov 2021 15:24:14 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 1/3] spi: dt-bindings: Allow describing flashes with two CS
Date: Fri, 12 Nov 2021 16:24:09 +0100
Message-Id: <20211112152411.818321-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211112152411.818321-1-miquel.raynal@bootlin.com>
References: <20211112152411.818321-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_072418_644836_6F4C06F4 
X-CRM114-Status: GOOD (  16.78  )
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

The Xilinx QSPI controller has two advanced modes which allow the
controller to behave differently and consider two flashes as one single
storage.

One of these two modes is quite complex to support from a binding point
of view and is the dual parallel memories. In this mode, each byte of
data is stored in both devices: the even bits in one, the odd bits in
the other. The split is automatically handled by the QSPI controller and
is transparent for the user.

The other mode is simpler to support, it is called dual stacked
memories. The controller shares the same SPI bus but each of the devices
contain half of the data. Once in this mode, the controller does not
follow CS requests but instead internally wires the two CSlevels with
the value of the most significant address bit.

Supporting these two modes will involve core changes which include the
possibility of providing two CS for a single SPI device.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/spi/spi-controller.yaml          |  6 ++---
 scripts/dtc/checks.c                          | 24 ++++++++++++-------
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 8246891602e7..51877b637bfe 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -20,7 +20,7 @@ properties:
     pattern: "^spi(@.*|-[0-9a-f])*$"
 
   "#address-cells":
-    enum: [0, 1]
+    enum: [0, 1, 2]
 
   "#size-cells":
     const: 0
@@ -91,7 +91,7 @@ properties:
       - compatible
 
 patternProperties:
-  "^.*@[0-9a-f]+$":
+  "^.*@[0-9a-f]+,?[0-9a-f]*$":
     type: object
 
     properties:
@@ -174,7 +174,7 @@ allOf:
     then:
       properties:
         "#address-cells":
-          const: 1
+          enum: [1, 2]
     else:
       properties:
         "#address-cells":
diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 781ba1129a8e..4eaa925c3442 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -1094,7 +1094,7 @@ static const struct bus_type spi_bus = {
 
 static void check_spi_bus_bridge(struct check *c, struct dt_info *dti, struct node *node)
 {
-	int spi_addr_cells = 1;
+	int spi_addr_cells = 2;
 
 	if (strprefixeq(node->name, node->basenamelen, "spi")) {
 		node->bus = &spi_bus;
@@ -1125,7 +1125,7 @@ static void check_spi_bus_bridge(struct check *c, struct dt_info *dti, struct no
 
 	if (get_property(node, "spi-slave"))
 		spi_addr_cells = 0;
-	if (node_addr_cells(node) != spi_addr_cells)
+	if (node_addr_cells(node) > spi_addr_cells)
 		FAIL(c, dti, node, "incorrect #address-cells for SPI bus");
 	if (node_size_cells(node) != 0)
 		FAIL(c, dti, node, "incorrect #size-cells for SPI bus");
@@ -1137,8 +1137,8 @@ static void check_spi_bus_reg(struct check *c, struct dt_info *dti, struct node
 {
 	struct property *prop;
 	const char *unitname = get_unitname(node);
-	char unit_addr[9];
-	uint32_t reg = 0;
+	char unit_addr[18];
+	uint32_t reg0 = 0, reg1 = 0;
 	cell_t *cells = NULL;
 
 	if (!node->parent || (node->parent->bus != &spi_bus))
@@ -1156,11 +1156,17 @@ static void check_spi_bus_reg(struct check *c, struct dt_info *dti, struct node
 		return;
 	}
 
-	reg = fdt32_to_cpu(*cells);
-	snprintf(unit_addr, sizeof(unit_addr), "%x", reg);
-	if (!streq(unitname, unit_addr))
-		FAIL(c, dti, node, "SPI bus unit address format error, expected \"%s\"",
-		     unit_addr);
+	reg0 = fdt32_to_cpu(cells[0]);
+	snprintf(unit_addr, sizeof(unit_addr), "%x", reg0);
+	if (!streq(unitname, unit_addr)) {
+		reg1 = fdt32_to_cpu(cells[1]);
+		snprintf(unit_addr, sizeof(unit_addr), "%x,%x", reg0, reg1);
+		if (!streq(unitname, unit_addr)) {
+			FAIL(c, dti, node,
+			     "SPI bus unit address format error, expected \"%s\"",
+			     unit_addr);
+		}
+	}
 }
 WARNING(spi_bus_reg, check_spi_bus_reg, NULL, &reg_format, &spi_bus_bridge);
 
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
