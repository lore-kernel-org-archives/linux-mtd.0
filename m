Return-Path: <SRS0=nWl7=5Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F797C2D0EE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 18:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CEC72145D
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 18:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBROkLJW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ADit19PL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CEC72145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5rOflBv3QP9Hq+wRUarSCAprfpOcIO4au0Yi1OevaIU=; b=DBROkLJWHHqx7Q
	3sBjTwKhZJOuK42drvf5O/JO9G3jCHSIm3YeRqEDv/mjHISfapfWJQ7u/UVPuYrV8eTYyUsN2xQUh
	4aKSWO9gEDGfNa8eboPk2oB7b7hDD7QYzfOxmrBsKyf5eHOPpO/2JnDoTQ/IP5LdgC7zejbt18PpR
	OUKIFiCOTkcjzhgYV9WEDvFXhY/GsCCD2Wo6hei9fMgqBsWufFEKpm/uBHBGzF2g8H63qEdokdT5R
	VNmIsaNWyc9YxjChgMexYep+5ldtWG0Y3pUcCQou8PTo3O/TfPOwgVo6ZOWjuBRE6cg/r4E5latGE
	p2HlXmhi+8PsRSFCbr3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJLT7-0002Mq-3s; Tue, 31 Mar 2020 18:18:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJLT4-0002MQ-OH; Tue, 31 Mar 2020 18:18:32 +0000
X-UUID: 5fe2255454074cd78faaf06d861ac3a2-20200331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=B2WGXD+okc3OAMherNCj95maawSKPkr+yhClbmy/cpc=; 
 b=ADit19PLy8RhzarHYB5v2FFmYeA+pS9wHKEzF7WYPzUfqUK5/j6JS8n8rdIi50HbWNWTVVybubdE8sZemuEatdk6KE9TFXYb3dsvatbT7pSSdqhmN0zYfHvktbzGTRCFpmItPNFtberzy0Gry/vxEQqHOe4VSnc2RMrlUlWCtbQ=;
X-UUID: 5fe2255454074cd78faaf06d861ac3a2-20200331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weijie.gao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1141104202; Tue, 31 Mar 2020 10:18:19 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 31 Mar 2020 11:08:22 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 1 Apr 2020 02:08:15 +0800
Received: from mcddlt001.mediatek.inc (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 1 Apr 2020 02:08:13 +0800
From: Weijie Gao <weijie.gao@mediatek.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] dt-bindings: add documentation for mt7621-nand driver
Date: Wed, 1 Apr 2020 02:07:59 +0800
Message-ID: <1585678079-5999-2-git-send-email-weijie.gao@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1585678079-5999-1-git-send-email-weijie.gao@mediatek.com>
References: <1585678079-5999-1-git-send-email-weijie.gao@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3384A60C0D5DDDAA02D07F0CCC8D72BA3C78905B95A6884107B1114CBA68EF0C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_111830_801278_C10B782F 
X-CRM114-Status: GOOD (  12.75  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Anders Roxell <anders.roxell@linaro.org>, Vignesh
 Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Weijie Gao <weijie.gao@mediatek.com>,
 Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch adds documentation for MediaTek MT7621 NAND flash controller
driver.

Signed-off-by: Weijie Gao <weijie.gao@mediatek.com>
---
 .../bindings/mtd/mediatek,mt7621-nfc.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mt7621-nfc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mt7621-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mt7621-nfc.yaml
new file mode 100644
index 000000000000..1ca0c5e95e4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mediatek,mt7621-nfc.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mediatek,mt7621-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT7621 SoC NAND Flash Controller (NFC) DT binding
+
+maintainers:
+  - Weijie Gao <weijie.gao@mediatek.com>
+
+description: |
+  This driver uses a single node to describe both NAND Flash controller
+  interface (NFI) and ECC engine for MT7621 SoC.
+  MT7621 supports only one chip select.
+
+properties:
+  "#address-cells": false
+  "#size-cells": false
+
+  compatible:
+    enum:
+      - mediatek,mt7621-nfc
+
+  reg:
+    items:
+      - description: Register base of NFI core
+      - description: Register base of ECC engine
+
+  reg-names:
+    items:
+      - const: nfi
+      - const: ecc
+
+  clocks:
+    items:
+      - description: Source clock for NFI core, fixed 125MHz
+
+  clock-names:
+    items:
+      - const: nfi_clk
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    nficlock: nficlock {
+    	#clock-cells = <0>;
+    	compatible = "fixed-clock";
+
+    	clock-frequency = <125000000>;
+    };
+
+    nand@1e003000 {
+    	compatible = "mediatek,mt7621-nfc";
+
+    	reg = <0x1e003000 0x800
+    	       0x1e003800 0x800>;
+    	reg-names = "nfi", "ecc";
+
+    	clocks = <&nficlock>;
+    	clock-names = "nfi_clk";
+    };
-- 
2.17.1
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
