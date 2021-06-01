Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA1BC47093
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 04:37:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 962BC61027
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 04:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 962BC61027
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qssU7g04vPaCt2kPeUrAeqxKdhZx99VBo7jUtu3YDMk=; b=D4VGEGN7/RMRrs
	UCilDVTY+4ekojrnTeVDDgm3g1o2OOHxQBgZcZ6bR0fFyCj6NAmVLWVFQi3v9UoG8Ej+zhVeOOcpd
	x5LjbOuA7rWiDyyMzFI0mQSiKQfDFS9INptHlaZj1/D0+jidSEYukitvzMg164i64n9WqI7nGUs89
	Zhr2jABkYHlfkyX4htWdI3DBwNhlG7Mj+vEqtgrKpC6kAPkRPiX/FUShMgUZ7CtKFfyPpC1kmBPTW
	Oj9HMf+6RcSgbggmwU8ZJYs5j/7HJatsn8lclV46bhlzkA/GKARpjktLNYtVXVEOCFFjxZ++kRhzv
	dBG/ans33iFAJW1flRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnw8o-00EaDt-LJ; Tue, 01 Jun 2021 04:36:34 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnw8O-00Ea9T-Vb
 for linux-mtd@lists.infradead.org; Tue, 01 Jun 2021 04:36:10 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A2EF282EA6;
 Tue,  1 Jun 2021 06:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622522167;
 bh=EHsCHku6r+HkI5oirppWFnWhJBUYvp8UUKRBFQGYFto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ca3Ch74nlW1ouy7rMPk6QGB231YU7fqP2O9axYcsJXpnhlCx3f0rNa0P5KN8Dz3YQ
 0wy/3SI/OEjKnhyHxAFV6Gon12annVOem8ymMZj0W1PMCva8BpE8GtgH90V8N4Iii7
 9EKClanz9BXpf9WuWT76Eri2I0iQtg9v+Z5pgWJYXHl7MYpWXXJCzg/J1uJg/+XseU
 LglM0yG1iDUjZXqaNoalvgQW29g8cYBxZWwI1MKzfTLzQjV5d0aU/LFkrjsT2DHEHB
 btX4w3bna4EKi2JYrreD+wMuhoF+WyWLBX+gVicTRtA4q7nQVzNBLK5OY/QjQk4Idz
 9TKfX3Bby0/aw==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 5EA4A184CD1;
 Tue,  1 Jun 2021 06:35:50 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 2CFDD1A8BC6; Tue,  1 Jun 2021 06:35:48 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Fabio Estevam <festevam@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
Date: Tue,  1 Jun 2021 06:35:45 +0200
Message-Id: <20210601043546.1345704-2-hs@denx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601043546.1345704-1-hs@denx.de>
References: <20210601043546.1345704-1-hs@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_213609_191836_4568ECD6 
X-CRM114-Status: GOOD (  12.77  )
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

The Microchip 48l640 is a 8KByte EERAM connected via SPI.
Add devicetree bindings documentation.

Signed-off-by: Heiko Schocher <hs@denx.de>
---

Changes in v3:
Add Fabio to cc

Changes in v2:
as Rob helped, fix warnings from running command
'make DT_CHECKER_FLAGS=-m dt_binding_check'

 .../bindings/mtd/microchip,mchp48l640.yaml    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
new file mode 100644
index 0000000000000..08089f2db0761
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MTD SPI driver for Microchip 48l640 (and similar) serial EERAM
+
+maintainers:
+  - Heiko Schocher <hs@denx.de>
+
+description: |
+  The Microchip 48l640 is a 8KByte EERAM connected via SPI.
+
+  datasheet: http://ww1.microchip.com/downloads/en/DeviceDoc/20006055B.pdf
+
+properties:
+  compatible:
+    items:
+      - const: microchip,48l640
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      spi-eeram@0 {
+        compatible = "microchip,48l640";
+        reg = <0>;
+        spi-max-frequency = <20000000>;
+      };
+    };
+...
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
