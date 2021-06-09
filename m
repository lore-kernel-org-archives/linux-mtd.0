Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B40C48BCD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:18:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF193610C7
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 11:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF193610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfN/EFqVSVf/eTk9hLsRvI/yTv9A7esWBoOdJEcE+Tc=; b=I3/AcP+icv7hlz
	adwFVGSVIUfna+rOhacMIm83D2bbax4lkWSjCiw49Mj01StWl+JrI65/WhMGP8Euia4b1E3BasSw1
	9SQjgM8mBngaCaLgh0O1hbSuRcffTEaY8SoGH7wGc6p9EA8vj6HDFlLQbZzwVJFeMhNbsHLUPHSZn
	dN9UcVo4lgOkpGqndM36ZsiG3uJTqSFuaihYP0H6Vii2zr0P9ZgmYhtevZ1Sn0QNYBTpkLySrG7SJ
	N3/rFUuoCi8BARWLksZC3j2MxHrxj3v4A6Aa2FO/NQhDEx2wG4KDiyVVmwQwaIJuntKh78nNvNki3
	kEZ5XzuysbWB437Y+JYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqwDI-00DGZy-0U; Wed, 09 Jun 2021 11:17:36 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqwD2-00DGY6-50
 for linux-mtd@lists.infradead.org; Wed, 09 Jun 2021 11:17:21 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 159BHGTB108420;
 Wed, 9 Jun 2021 06:17:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623237436;
 bh=3uPifnd/TjX5LJYTJnzADUgj18fof4k8C1XjKHqNUT0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=oF4XciaZ453+j+Co0+bcDymmfFExtz9kNjgOrR5LJq5HNvkZCOZQXdoVvd0PXsReJ
 GzStCgJbhp/gaTBfnRN8WYFkavljq7KrWahyDjLuuZTl2g2VWwDYmDxJ/m51P7Kb8e
 NDedsi2cnCR2coyuWrR4CsSsJGO1VKUfIC74nmTs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 159BHGoK085898
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Jun 2021 06:17:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 9 Jun
 2021 06:17:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 9 Jun 2021 06:17:15 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 159BH7uG073420;
 Wed, 9 Jun 2021 06:17:12 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Pratyush Yadav
 <p.yadav@ti.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
CC: Nishanth Menon <nm@ti.com>, Michael Walle <michael@walle.cc>, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 1/2] spi: dt-bindings: add schema listing slave-specific
 properties
Date: Wed, 9 Jun 2021 16:47:06 +0530
Message-ID: <20210609111707.9555-2-p.yadav@ti.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210609111707.9555-1-p.yadav@ti.com>
References: <20210609111707.9555-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_041720_304527_BFD30D79 
X-CRM114-Status: GOOD (  22.96  )
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

Many SPI controllers need to add properties to slave devices. This could
be the delay in clock or data lines, etc. These properties are
controller specific but need to be defined in the slave node because
they are per-slave and there can be multiple slaves attached to a
controller.

If these properties are not added to the slave binding, then the dtbs
check emits a warning. But these properties do not make much sense in
the slave binding because they are controller-specific and they will
just pollute every slave binding. So this binding is added to collect
all such properties from all such controllers. Slave bindings should
simply refer to this binding and they should be rid of the warnings.

There are some limitations with this approach. Firstly, there is no way
to specify required properties. The schema contains properties for all
controllers and there is no way to know which controller is being used.
Secondly, there is no way to restrict additional properties. Since this
schema will be used with an allOf operator, additionalProperties needs
to be true. In addition, the slave schema will have to set
unevaluatedProperties: false.

Despite these limitations, this appears to be the best solution to this
problem that doesn't involve modifying existing tools or schema specs.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---

 .../bindings/spi/cdns,qspi-nor.yaml           | 33 ------------
 .../bindings/spi/spi-slave-props.yaml         | 52 +++++++++++++++++++
 2 files changed, 52 insertions(+), 33 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-slave-props.yaml

diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
index 0e7087cc8bf9..0730e6a8dc4a 100644
--- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
@@ -74,39 +74,6 @@ properties:
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
new file mode 100644
index 000000000000..b2248e01dc43
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-slave-props.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spi-slave-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Slave-specific properties for a SPI bus.
+
+description: |
+  Many SPI controllers need to add properties to slave devices. This could be
+  the delay in clock or data lines, etc. These properties are controller
+  specific but need to be defined in the slave node because they are per-slave
+  and there can be multiple slaves attached to a controller.
+
+  If these properties are not added to the slave binding, then the dtbs check
+  emits a warning. But these properties do not make much sense in the slave
+  binding because they are controller-specific and they will just pollute every
+  slave binding. So this binding is added to collect all such properties from
+  all such controllers. Slave bindings should simply refer to this binding and
+  they should be rid of the warnings.
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
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
