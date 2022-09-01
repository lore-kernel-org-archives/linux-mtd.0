Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35EAECAAD3
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Sep 2022 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtPg/JMxUXrFb9D8zGrtbXEqh82mMFVAXN+ILmZb/ic=; b=kwE8JVnxRiA4rz
	IMrryL0huKrz8rx+Lo5LwW31w+XUZfMuk6UkfGyDhzSu3mmJZ84Ja4MfdXKgCojqKuqsm7YleTGOw
	f2kmWYIsjAFvoSl8AJD9wNLfM/aOf4t1zimDZabzEB8H2DawclQ+66MvX445vysP9Ib2c54QllVcq
	7c5w9qDPXg9Z8miue0VVR8kIJeoi7CjvIH608JtpgnH/y5v1NhAwTXboAnZCzas+vjB2ZcLaivoRV
	ZGaUbHKKpWGKwUrPwojNhc+I6YctRO00n7G45TGsMzF9WGUdjd2niqeb2L8e5eJrBzT9KRPJkc2q0
	isIMAwFpbznldfDOvIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsiD-00FMsW-DX; Thu, 01 Sep 2022 22:31:01 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsWx-00FEh4-Ej; Thu, 01 Sep 2022 22:19:27 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id F2BBE220D;
	Fri,  2 Sep 2022 00:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1662070754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EFD+0mrv3jpvtYWREXPyq1wWMmEP8gipYWNhSEthauI=;
	b=oNNfzaxeanq1HoAf+vPwChOwaGCEVCu3KYV1OE/511BdJsIt/utKnfzGoKyx44xEkUW8bg
	pRYRGg5vyAb7NLJnjHIE49UFaBBpczMHCCWihArQ6L2FMSxpaXGSOfHm1gvaahW1moew13
	AurmHTvzWtkQMV3hmjRp2Zcz4oy9eWLASnuPCJVSFirZh1OAIPqVHF8ZuJGnrelUjFCudz
	EU8Aa/nqFSxUvRMnWSAtHoRMPfP0sl6IQzds/Ony9ZkCEhkjdttsBpYQVuMdLxjBJ47Dj5
	li6F/WYGVYmqzXB4Qw7s3GtfEozvYCW7HAEAmDCPmUA0BGk1cILpeSBZ7gtY1A==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Frank Rowand <frowand.list@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 15/20] dt-bindings: nvmem: add YAML schema for the sl28 vpd layout
Date: Fri,  2 Sep 2022 00:18:52 +0200
Message-Id: <20220901221857.2600340-16-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220901221857.2600340-1-michael@walle.cc>
References: <20220901221857.2600340-1-michael@walle.cc>
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_151923_739973_3A134E0B 
X-CRM114-Status: GOOD (  15.23  )
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

Add a schema for the NVMEM layout on Kontron's sl28 boards.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v1:
 - add custom select
 - add description
 - add "additionalProperties: false", I wasn't sure if all the
   subnodes needs it. I'd say yes, but the brcm,nvram binding
   doesn't have them neither.

 .../nvmem/layouts/kontron,sl28-vpd.yaml       | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml

diff --git a/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
new file mode 100644
index 000000000000..0c180f29e880
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/layouts/kontron,sl28-vpd.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/layouts/kontron,sl28-vpd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM layout of the Kontron SMARC-sAL28 vital product data
+
+maintainers:
+  - Michael Walle <michael@walle.cc>
+
+description:
+  The vital product data (VPD) of the sl28 boards contains a serial
+  number and a base MAC address. The actual MAC addresses for the
+  on-board ethernet devices are derived from this base MAC address by
+  adding an offset.
+
+# We need a select here so we don't match all nodes with 'user-otp'
+select:
+  properties:
+    compatible:
+      contains:
+        const: kontron,sl28-vpd
+  required:
+    - compatible
+
+properties:
+  compatible:
+    items:
+      - const: kontron,sl28-vpd
+      - const: user-otp
+
+  serial-number:
+    type: object
+    description: The board's serial number
+
+  base-mac-address:
+    type: object
+    description:
+      Base MAC address for all on-module network interfaces. The first
+      argument of the phandle will be treated as an offset.
+
+    properties:
+      "#nvmem-cell-cells":
+        const: 1
+
+    additionalProperties: false
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+      otp-1 {
+          compatible = "kontron,sl28-vpd", "user-otp";
+
+          serial_number: serial-number {
+          };
+
+          base_mac_address: base-mac-address {
+              #nvmem-cell-cells = <1>;
+          };
+      };
+
+...
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
