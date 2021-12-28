Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A74C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 14:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRoS2WSXthMe9fXt5WZ4LPD2xnW2z3l18uoy/PoAmks=; b=NuRJQx1+zuf8os
	miTt99CMmckKAZEUJAQ+KztbEcBz/321UJJVBshKzg7wbJKHYWaMHPZKAGhlN8XB/67QhA0ywSmEm
	METasmp3807TGQxLk9OMTqULQ5Z3I2NBLMr6WN/0oYA+FhdZcUFPi5rk5jyWz6rFg0prDQpfuEpOn
	aOVj9GAU/njggOU5oip5e8yIV8klxaK6c9KB6eewJQJUc3qldaBGb+ScHKrE8cCG0XYtNTSo8VNVe
	Aao4z4sWqFoajDhFY0kwrLvCD1xIJhz3TlNcReNz4PV9RaQiZFNxbLuP1t5lYrerrhO00JsNTj0hV
	uzlmv3gAclOspgZ7g8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DS6-0017SU-9X; Tue, 28 Dec 2021 14:27:46 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DQh-0016yQ-JH; Tue, 28 Dec 2021 14:26:23 +0000
Received: from mwalle01.kontron.local. (unknown
 [IPv6:2a02:810b:4340:43bf:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 29F19223ED;
 Tue, 28 Dec 2021 15:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640701575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02iOmurDIl5gzz8NoU1dQeDN4gDFtGDQPI42B09jExw=;
 b=S8Qa3rFSfHGbDtfs00//SU0AqVJwqu3c15mjlL9u1qDcnIj8885OuUt4vYGhjJ3kBH48Jz
 S1XnkMikSYyQW3mkQkx/hIsvmSmvMqQ0WwanA/M1k9eLQaDtdX+xrGa+OKGSTSBo41IZnl
 E95WFs7BTat/Gez3vTF1RRgml0Ip73g=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 2/8] dt-bindings: nvmem: add transformation bindings
Date: Tue, 28 Dec 2021 15:25:43 +0100
Message-Id: <20211228142549.1275412-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211228142549.1275412-1-michael@walle.cc>
References: <20211228142549.1275412-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_062619_828996_F4FD92A0 
X-CRM114-Status: GOOD (  13.94  )
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

Just add a simple list of the supported devices which need a nvmem
transformations.

Also, since the compatible string is prepended to the actual nvmem
compatible string, we need to match using "contains" instead of an exact
match.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 .../devicetree/bindings/mtd/mtd.yaml          |  7 +--
 .../bindings/nvmem/nvmem-transformations.yaml | 46 +++++++++++++++++++
 2 files changed, 50 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 376b679cfc70..0291e439b6a6 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -33,9 +33,10 @@ patternProperties:
 
     properties:
       compatible:
-        enum:
-          - user-otp
-          - factory-otp
+        contains:
+          enum:
+            - user-otp
+            - factory-otp
 
     required:
       - compatible
diff --git a/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
new file mode 100644
index 000000000000..8c8d85fd6d27
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/nvmem-transformations.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/nvmem-transformations.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVMEM transformations Device Tree Bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This is a list NVMEM devices which need transformations.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - kontron,sl28-vpd
+        - const: user-otp
+      - const: user-otp
+
+required:
+  - compatible
+
+additionalProperties: true
+
+examples:
+  - |
+    otp-1 {
+            compatible = "kontron,sl28-vpd", "user-otp";
+            #address-cells = <1>;
+            #size-cells = <1>;
+
+            serial@2 {
+                    reg = <2 15>;
+            };
+
+            base_mac_address: base-mac-address@17 {
+                    #nvmem-cell-cells = <1>;
+                    reg = <17 6>;
+            };
+    };
+
+...
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
