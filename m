Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72F2CAC59A
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Sep 2025 07:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+2QIyaj3CyFidKFJeVBMHSdX85H5Pr0NgiCHyRgfRA=; b=wI3k8Op6atvmH9
	soUoxbCeNecieBhGPgNqMyTvQWLOePVt8pokjEGkKIfXJiXBi9N5TTydhCToqfEzs3y6Mpl/M3tZK
	2aHBBaIZLbsVRtMjq2XEu7HYMiHE66yq9KWHcprjtpd9DWzKizeO4uAIH1b1QrkbfKkk10ag53LEJ
	BiThD/QNETgY1BkBvA0OPEAgzL+RarjbkfNhF4pyWRpfq8nWof+osnw36BdRcosvAznOHinJigYgS
	5WzQ80ribqxN+A8Bu2YQPY8bN+y02xTupqsAp0jo1Aa8IWnuDo78Ybc1n5g4RKAhBe73mp1b0mWbU
	zgCeXTKLjp4qPQ5imVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVuu-000000029Ed-2sUU;
	Fri, 19 Sep 2025 07:52:28 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVuq-000000029Bh-2EGD
	for linux-mtd@lists.infradead.org;
	Fri, 19 Sep 2025 07:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1758268326; x=1758873126;
	i=markus.stockhausen@gmx.de;
	bh=18IGFXgNp7E8pfl12ZaU9shgF7rG2ZVygP06DEA49v0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OhZ8j1jqrB81COaU4xkW7OBWtuOdG8EAxS9ebXdpPFgcMZ1Ppd3ImitmuT5uHYPp
	 1IfZJukDsKL8x4hxw9yc/cxHvoeKyICSHM9zeY1R5y6rR5dg6UB+BwsERnkilhOOY
	 sJvJAEYVkVTcuUO1XOjEsVeLwuMRQvlzVzdy6UqyuLgcLA1eozfFXT1QHJly1wqBS
	 tkEYgEcs2Wi2jis+ctmFjo3AxAtgIMav+Sv14PpmhYtW10W4qaxBSByXjfN1cHKP6
	 upkkF3jL8m47N/2Q2SuZdiwAL0xP8vZCrC8x9Iz0aAC2nvzJZ9kTEENIBN7PlLRq+
	 iVUcf2/HSTv4p6QpeQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt ([94.31.70.55]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmUHj-1uZ0iN12RN-00mUI9; Fri, 19
 Sep 2025 09:52:06 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3 1/2] dt-bindings: mtd: Add realtek,rtl9301-ecc
Date: Fri, 19 Sep 2025 03:52:00 -0400
Message-ID: <20250919075201.4177901-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250919075201.4177901-1-markus.stockhausen@gmx.de>
References: <20250919075201.4177901-1-markus.stockhausen@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:iXl0cqi5QwgGdIy6ITcTBDvv4NIj3fFab7sZcRLf8+5VtCoS8gH
 wC43l9Ad0m5uptvoTqvKx1jLT2a5fSbXyAU9wsgG9F+iLSeVoufkLrs6l0hO6BGqu1KEM9q
 MJe6SAYHzjz7+DHenPl2OiK2SczfPlC1zNVLRbf5+mw82nrtki4S+Yq6CZG0MTD9SvOpcrG
 wDXundnk6JmAySp6M543A==
UI-OutboundReport: notjunk:1;M01:P0:iil6gF2YNKY=;sFXewm08VkFyDMpbnpGFxftP7IA 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_005224_874207_D25268E4 
X-CRM114-Status: GOOD (  13.00  )
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

Add a dtschema for the ECC engine on the Realtek RTL93xx SoCs.
The engine supports BCH6 and BCH12 parity for 512 byte blocks.

The hardware can make use of interrupts but this is not yet
supported by the driver. From the known datasheets it is
connected to the LXB (lexra bus) and propably depends on its
clock. Provide an optional clock property that can describe
the relation.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
Changes in v3:
- add optional properties clocks and interrupts.

Changes in v2:
- change cells from 2 to 1 (only 32 bit hardware)
---
 .../bindings/mtd/realtek,rtl9301-ecc.yaml     | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml b/Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml
new file mode 100644
index 000000000000..55b35c3db0ff
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/realtek,rtl9301-ecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek SoCs NAND ECC engine
+
+maintainers:
+  - Markus Stockhausen <markus.stockhausen@gmx.de>
+
+properties:
+  compatible:
+    const: realtek,rtl9301-ecc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        ecc0: ecc@1a600 {
+            compatible = "realtek,rtl9301-ecc";
+            reg = <0x1a600 0x54>;
+        };
+    };
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
