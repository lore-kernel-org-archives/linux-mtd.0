Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE63606A889
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 11:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Exhw+7EC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=DTNLBIhm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pY7ifKxZxX5ZuU1Yz8/GCrDXDDdGSZq8bddGQFElZVA=; b=Exhw+7ECppGlTaOpWmYQDP23C+
	w63Yg20XcdlTZvLdfNaPjQDfi/wGm/tkxGtyYRAoI548AyXDtjJOkx3ius4feJ/iu1kyT0itD3tAe
	4Qjjf9i0bkbxaZ3Bei4R5HRnjCCB+zyGzxfp1ZRurPxVyaNDir0GG3X/YkutRNvb4Kg1vCR4m0xl7
	SZzwR3VdLhF3rVxLQh0KMfTuJzV1IfN3cxzLDc0h8eVokXSIjRj+xG2/12HMiibIDgL+umL/gu3gW
	4DFLP5Q+DjZF67I5pIQ2spn61CBuyjHsnjSdLcA7lAuO2bHepAzsw0d7JtEURzxOgM0BrEfVEuyNh
	OCB1iUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6w8-00000006ZQZ-1O1r;
	Wed, 11 Nov 2026 11:56:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR6w5-00000006ZPM-0EZ7;
	Wed, 11 Nov 2026 11:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794398184; x=1825934184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9sspgSaYTLzPxx3ClMpy7dqKoUQ+jVKhLBbkq1ajX5A=;
  b=DTNLBIhmvDt2lj5GWGIaj5Fh6xOcisUfmteDF11bM4Jsg5uj5V9ln5CD
   7AJH1dVEp9TRjC3qefSl4C/jmwwfq0nS6ca7pporWO7T4+nHHrdM2bFDb
   LqxqwSZtsrS8RJDzBHeWGqdfAKMQEI+TMiuebPtqVsAxCSC6MEr/1Gk7n
   sh4CKbw9NWCkzSqTy8cQq2d2lFMsvDD9Woj5sjfRV8sV4n80luzf2XlZv
   FS7I0PoDwKIqRHzngJajjZOGgIbscU3G7iKPjmEr715hi57KEQLpyWwgc
   dm9romNt0bVbey40C+3TlCwoCc5fnC4pGozFks2oW+xBbSXx2z6KgHVSA
   A==;
X-CSE-ConnectionGUID: AyYEieVYTtq88gg6XxZzgA==
X-CSE-MsgGUID: yVcKmPtNQpOIL2fr02UaxA==
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="66350164"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 04:56:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Wed, 11 Nov 2026 04:56:15 -0700
Received: from che-ll-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 11 Nov 2026 04:56:06 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
	<richard@nod.at>, <vigneshr@ti.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <srini@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux@armlinux.org.uk>, <richardcochran@gmail.com>, <arnd@arndb.de>,
	<linusw@kernel.org>, <enelsonmoore@gmail.com>, <aaro.koskinen@iki.fi>,
	<pengpeng@iscas.ac.cn>, <mathieu.dubois-briand@bootlin.com>,
	<gregkh@linuxfoundation.org>, <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH v10 2/8] dt-bindings: nvmem: layouts: add Microchip/SST SFDP EUI layout
Date: Wed, 11 Nov 2026 17:25:34 +0530
Message-ID: <ec17ff65fda01b2aa38cfe28b0158acd871b060b.1794391660.git.manikandan.m@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794391660.git.manikandan.m@microchip.com>
References: <cover.1794391660.git.manikandan.m@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_035617_103129_295A017C 
X-CRM114-Status: GOOD (  16.90  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a binding for the NVMEM layout that exposes the factory-programmed
EUI-48 identifier from the Microchip/SST vendor-specific SFDP parameter
table (e.g. SST26VF064BEUI) as a "mac-address" NVMEM cell, and reference
it from nvmem-layout.yaml.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 .../layouts/microchip,sst26vf-sfdp-eui.yaml   | 60 +++++++++++++++++++
 .../bindings/nvmem/layouts/nvmem-layout.yaml  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml b/Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
new file mode 100644
index 000000000000..37357efb7840
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml
@@ -0,0 +1,60 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/layouts/microchip,sst26vf-sfdp-eui.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM layout of the Microchip/SST SFDP EUI-48 identifier
+
+maintainers:
+  - Manikandan Muralidharan <manikandan.m@microchip.com>
+
+description:
+  Some Microchip/SST serial flashes (for example the SST26VF064BEUI) are
+  factory programmed with a globally unique EUI-48 identifier stored in a
+  vendor-specific SFDP parameter table and permanently write-protected. This
+  layout locates that table and exposes the EUI-48 as an NVMEM cell so that,
+  for example, a network driver can use it as a MAC address. The location of
+  the data is discovered at runtime from the SFDP; no offset is encoded in the
+  device tree.
+
+select: false
+
+properties:
+  compatible:
+    const: microchip,sst26vf-sfdp-eui
+
+  mac-address:
+    type: object
+    description:
+      The factory-programmed EUI-48 identifier, usable as a MAC address.
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+
+            sfdp {
+                compatible = "jedec,sfdp";
+
+                nvmem-layout {
+                    compatible = "microchip,sst26vf-sfdp-eui";
+
+                    mac-address {
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
index 382507060651..e63b93083821 100644
--- a/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
+++ b/Documentation/devicetree/bindings/nvmem/layouts/nvmem-layout.yaml
@@ -20,6 +20,7 @@ description: |
 oneOf:
   - $ref: fixed-layout.yaml
   - $ref: kontron,sl28-vpd.yaml
+  - $ref: microchip,sst26vf-sfdp-eui.yaml
   - $ref: onie,tlv-layout.yaml
   - $ref: u-boot,env.yaml
 
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
