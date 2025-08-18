Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB65CA0ED1
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eryMNa3pI5eNFlhz5PuHZkNNzNclaF7KwiDszdEW20A=; b=1EqsYqVnCGriH7
	xcACMb4g8jjL0yp/8SgcCJog8YKetia4J/WIy9jUhky0ZvaJwDxRUwx+DwcXYBo3aI+hcSTzsXcGc
	MT6LZeAjrAiCrJQLvzTw2Lc08aJYD3755Dsb/q/8bCOxAj1PQC6heYITyzf/ZydCVQygYcILwwR3b
	trPj7h3xYTs8n3W6E85TH5qVCuwix9BjjjwN9JeSnxcHWFV8gaGszAKMGQtNb3xDwc+zI5KfG2NjF
	OS0NcOCpmmVdrCYWLOEmM4hksFL6zVkvhGCRBd0/Sq+UeM9J1bx7+Jepl7RHP/Lxs3VJj3UMkD6JK
	j7C15F72bhbo1CqCi6lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo06O-00000007Z9r-0S0E;
	Mon, 18 Aug 2025 13:40:44 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unw9q-000000073U0-24wk
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 09:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1755509261; x=1756114061;
	i=markus.stockhausen@gmx.de;
	bh=w3YuYHV58vP5zsyqpmRtLbhnDCGiapoBPM7Es2e4+5Q=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=WSi2V3I+vUR20bvZD88VATsXgRWbioqj7U2uRunXZ0AlLlRBKEcY+y/lvS96jZm9
	 L1y6e2u7eFsYspOkPRxkbx52/vyTH7edj96Q2RaHiAu2mJYbWrB2mH6EJG0knBEar
	 jKRaNuRoyVJrttbgRx/2ijKn0oQ3Eh402NFSFH+7Jk9j26nKHwhkIMJrgFZ4rWuMZ
	 mzwBzu3Joq/dQzRUxxcQTHYWCtMxIDGfi5hyyTxY7GoxkFnsOtIfmOFWhkyQFfYtX
	 5OdjLZX7gTpTexZGJMUdSEitN4nV11cDrzsAPE0viFXJdmGxqAzqKRVJXaDPEnzt8
	 R6/6u71Qs7tG24W5dQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt ([94.31.70.55]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mj8mb-1uKMhN3lnJ-00izia; Mon, 18
 Aug 2025 11:27:40 +0200
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
Subject: [PATCH 1/2] dt-bindings: mtd: Add realtek,rtl9301-ecc
Date: Mon, 18 Aug 2025 05:27:24 -0400
Message-ID: <20250818092725.1977105-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250818092725.1977105-1-markus.stockhausen@gmx.de>
References: <20250818092725.1977105-1-markus.stockhausen@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Q9mwtwqPcMwxVVirKVMcRUE7JooJB8XV8p1Eq0sP/XcQOX/w30L
 pYYU6zyeXBqyLsNOIKRDWpz6ehIUhBFWSFG65EF1qyDa7F18nylRjWdpDVlKOSQsFn5qf3u
 KSF4SXkG5QPvqkIov4WxjMzaOlQ1NxOsgFSttRRbKPZSMt3wIiNHMsozQ3qTt8ffkI7oduQ
 1e+5u3z/fiPBBNMqfFmFA==
UI-OutboundReport: notjunk:1;M01:P0:UMQQpGjus4M=;BLu815u9481O3QLhwK3a5T9YklM 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 7ZQ1JUg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_022802_844918_C0510FF5 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
---
 .../bindings/mtd/realtek,rtl9301-ecc.yaml     | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml b/Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml
new file mode 100644
index 000000000000..9ec69e661812
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml
@@ -0,0 +1,35 @@
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
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        ecc0: ecc@1a600 {
+            compatible = "realtek,rtl9301-ecc";
+            reg = <0x1a600 0x54>;
+        };
+    };
-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
