Return-Path: <SRS0=QmfO=LB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D2CC4743E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 03:42:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71616611C0
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Jun 2021 03:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71616611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZz7kbY90vqdCf18wxd0OGBa03heQfP3oZedzL5yFXQ=; b=aLzXgvsQSmlS98
	IlpKwRFgb+MZA6azLfQqdyxG/kyqkuN1DjdFTQc6Fx8Qq6xhFsBbgvX7mXfxStD+4Z0mwwLdCvLhs
	6rVbjvu4CvThCrw2G19jr8yIYp8+Ptj6v/Rm4nbkXJkelieL+7E9D2X3aV6Qff5zhoDxyCKBObAc1
	zMc1Glqk5EwoXv6eeHFXA8/JCn8JoB1lb1WySUssKuCzq/ANn0J013oVh3/WFBR5CAVG2ygliVqmB
	N1OlySQmd9ogT1XLvBZnczw5TI01spMtHO1txFma2lyi3kGepcb8aPxhYhNbZKpS6OQQ9s6rBLw8U
	mIXHQGy5eO/pAw61FbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq67H-001ORg-H2; Mon, 07 Jun 2021 03:39:55 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq66v-001OOh-P2
 for linux-mtd@lists.infradead.org; Mon, 07 Jun 2021 03:39:37 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7C43282CE6;
 Mon,  7 Jun 2021 05:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623037172;
 bh=1pmwLBLgzqrDGqGyCCkjvGO4IpT1lSu/igKeua8K7X8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ugxt3NrnVeH7V8juJzocynVPoMdk0iDCsTZvt9+ys2zZqx2dGkt1Gn94Lv9rIGeGc
 zcC7CzITCgWzEcafGSy/rvVd6LmC59Lu0v6zdlpoLTZGUuogUc2+i+PhSH2wdd1mxO
 mvyM8Z69xL3WzeaEeywsm2B2VfMtqkH76BtI9hPt1YORwmtEBy74dhx1cZQDrgccYe
 5jrBvqgJAxzH8unOGHgYryTunOoaJWGgSa/JPg0kKDuuZxAFnjiaCAtPgcQS2FDNGj
 p/ACz1YNd1Ue1+98xXnjAGSTRKztQCD2G9zvYCaLnYo0wiPE70NNFX9LxFJa8E4FRu
 Gj4OiqrsTfoUA==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id D663A182B91;
 Mon,  7 Jun 2021 05:39:14 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id A50731A8BB3; Mon,  7 Jun 2021 05:39:12 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Rob Herring <robh@kernel.org>,
 Fabio Estevam <festevam@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
Date: Mon,  7 Jun 2021 05:39:08 +0200
Message-Id: <20210607033909.1424605-2-hs@denx.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607033909.1424605-1-hs@denx.de>
References: <20210607033909.1424605-1-hs@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_203933_993940_189F0AAA 
X-CRM114-Status: GOOD (  12.80  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Heiko Schocher <hs@denx.de>
---

Changes in v4:
- work in comments from Rob:
  - change title to
    Microchip 48l640 (and similar) serial EERAM bindings
  - rename spi-eeram to eeram
- Add Reviewed-by tag from Rob

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
index 0000000000000..2cdf6bf3dc4ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mtd/microchip,mchp48l640.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip 48l640 (and similar) serial EERAM bindings
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
+      eeram@0 {
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
