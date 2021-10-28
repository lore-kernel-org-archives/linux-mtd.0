Return-Path: <SRS0=emv8=PQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED878C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 12:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAAC661037
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Oct 2021 12:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BAAC661037
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69eNWLYJvovmEKAsAyMhoqL2Yl7gcfhXaii1eVu0DNs=; b=aOM9m3+5mY+aYX
	LAJdSXnCa+J52DGsLSrpVqVhQTNrIBBmZ0ZX4xoJQ0j3lxfDjw1kJalmZK7f2eqJwNgHWRS3hgVJ0
	N1V/Vm9oMemMnzsgsRHAbS+MgnDRSzwNnp19pVHWop0xP6iXJni7Vc13RUsjMWBcMzlDCyF8WGuQU
	Qr3rOLkzMTBC5JFA+VZrAoPQfHJ7y76VskYQzUTYrce/6l89TLcZOPeesd0/1CbAIudZRMMhLWndL
	EWpAPt/vze/qoBSO4YRcRtfGMqJjsH+KEdUC6ctoQi/gO7Dk7VKXscVwFdKIR70wqZBh7bYc0TYXc
	pKddrYVwieXmgL5lZpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg4nB-007oQx-RV; Thu, 28 Oct 2021 12:46:01 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg4mn-007oKS-MS
 for linux-mtd@lists.infradead.org; Thu, 28 Oct 2021 12:45:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19SCjVW2012061;
 Thu, 28 Oct 2021 07:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1635425131;
 bh=55cY97sZuQSu5sHGYm8QYttrQaervHm8LmId67H+MBM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=CK52x0H2aNJt6TfP8RpBOgfVGb0cuWiGJRNZBPgaNtaSBvMXdKwlR+CNltOvw4dfS
 nCkyQjaaLACqBQxD8vKWpndex82aK8x/xIG89IeNNlylYczuBU4KrDJLeO4C0+Y/F7
 aD7M/qxLT11zMVbneWbUtBC/7OsYxBhbUTGAmCv4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19SCjVp8120137
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Oct 2021 07:45:31 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Oct 2021 07:45:31 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Oct 2021 07:45:31 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19SCjJbC115317;
 Thu, 28 Oct 2021 07:45:27 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Rob Herring <robh+dt@kernel.org>
CC: Pratyush Yadav <p.yadav@ti.com>, Mark Brown <broonie@kernel.org>, Nishanth
 Menon <nm@ti.com>, Michael Walle <michael@walle.cc>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Tudor
 Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-spi@vger.kernel.org>
Subject: [PATCH v2 2/3] spi: dt-bindings: cdns,
 qspi-nor: Move slave-specific properties out
Date: Thu, 28 Oct 2021 18:15:17 +0530
Message-ID: <20211028124518.17370-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.33.1.835.ge9e5ba39a7
In-Reply-To: <20211028124518.17370-1-p.yadav@ti.com>
References: <20211028124518.17370-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_054537_859589_147EF3C4 
X-CRM114-Status: GOOD (  16.51  )
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

The spi-slave-props.yaml schema contains slave-specific properties
for SPI controllers that should be present in the slave node. Move
slave-specific properties to a separate file and refer to it in
spi-slave-props.yaml.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

---

Changes in v2:
- New in v2.

 .../spi/cdns,qspi-nor-slave-props.yaml        | 42 +++++++++++++++++++
 .../bindings/spi/cdns,qspi-nor.yaml           | 33 ---------------
 .../bindings/spi/spi-slave-props.yaml         |  2 +
 3 files changed, 44 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml
new file mode 100644
index 000000000000..263382a5729a
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-slave-props.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/cdns,qspi-nor-slave-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Slave-specific properties for the Cadence QSPI controller.
+
+description:
+  See spi-slave-props.yaml for more info.
+
+maintainers:
+  - Pratyush Yadav <p.yadav@ti.com>
+
+properties:
+  # cdns,qspi-nor.yaml
+  cdns,read-delay:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Delay for read capture logic, in clock cycles.
+
+  cdns,tshsl-ns:
+    description:
+      Delay in nanoseconds for the length that the master mode chip select
+      outputs are de-asserted between transactions.
+
+  cdns,tsd2d-ns:
+    description:
+      Delay in nanoseconds between one chip select being de-activated
+      and the activation of another.
+
+  cdns,tchsh-ns:
+    description:
+      Delay in nanoseconds between last bit of current transaction and
+      deasserting the device chip select (qspi_n_ss_out).
+
+  cdns,tslch-ns:
+    description:
+      Delay in nanoseconds between setting qspi_n_ss_out low and
+      first bit transfer.
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index ca155abbda7a..a439e3ed753f 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -86,39 +86,6 @@ properties:
     items:
       enum: [ qspi, qspi-ocp ]
 
-# subnode's properties
-patternProperties:
-  "@[0-9a-f]+$":
-    type: object
-    description:
-      Flash device uses the below defined properties in the subnode.
-
-    properties:
-      cdns,read-delay:
-        $ref: /schemas/types.yaml#/definitions/uint32
-        description:
-          Delay for read capture logic, in clock cycles.
-
-      cdns,tshsl-ns:
-        description:
-          Delay in nanoseconds for the length that the master mode chip select
-          outputs are de-asserted between transactions.
-
-      cdns,tsd2d-ns:
-        description:
-          Delay in nanoseconds between one chip select being de-activated
-          and the activation of another.
-
-      cdns,tchsh-ns:
-        description:
-          Delay in nanoseconds between last bit of current transaction and
-          deasserting the device chip select (qspi_n_ss_out).
-
-      cdns,tslch-ns:
-        description:
-          Delay in nanoseconds between setting qspi_n_ss_out low and
-          first bit transfer.
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/spi/spi-slave-props.yaml b/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
index 5166ec9b0353..4cc12a161da9 100644
--- a/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
@@ -87,5 +87,7 @@ properties:
       Delay, in microseconds, after a write transfer.
 
 # The controller specific properties go here.
+allOf:
+  - $ref: cdns,qspi-nor-slave-props.yaml#
 
 additionalProperties: true
-- 
2.33.1.835.ge9e5ba39a7


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
