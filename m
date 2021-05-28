Return-Path: <SRS0=UlXy=KX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0A3C47087
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 07:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A756611C9
	for <linux-mtd@archiver.kernel.org>; Fri, 28 May 2021 07:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A756611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJuDYADtGmPgdD8SYXF/wndzw+lP31q3iOJFzbJX/qY=; b=ylTHGYzAEH/phJ
	5FRyfcWLHh17bmXCNn/wUoW9OISWnCVGNAnzFNEfqmHkvv0yI3/AlYZWSGZRTF2/eVzL2lEhprDup
	+u3yqk524+J84EvdZb1I2H/fW59cQJC5G2aJPE5GhGGKbCEf023h2L1mHV3Ni5OIRYamS8WXy9aGi
	yyA3tY+LV9w0yTP4BRscoNF9AWUx2LhRpg2B1VGgAitA8aft0KKFsmRBH5ZvcM18iDJVEHnXbwUMl
	gwpnArTFJTgJL1AC5hJhSobutU3VqIi1A4dCTskOglhMFdK9mNCbPJV/eswEq2WXzjD0/ALr93KUr
	I9UaEidQtY1iQhMcYKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmWr3-00CxwK-5R; Fri, 28 May 2021 07:24:25 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmWqr-00Cxr0-CF
 for linux-mtd@lists.infradead.org; Fri, 28 May 2021 07:24:15 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0BFC582CFA;
 Fri, 28 May 2021 09:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622186652;
 bh=FxlnUYuVBD/ayVoM48CgGS8f69ngxanfNpwZzowWZ3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ac+6gn63xYpXj7HljdRZxwjdmYX9yxyQ4PEk6brMEBSQr7yXEgujGGZylJSc3SE3n
 1wf2tPqsw0gD3gU40kpdagw1V7Cvbcc0vFNhmEm4DaDfSG7qh5EpLuAUn42bLG+x2o
 ive90EwnPjJ7WFPKRohGn/QFShoaBcoXslF9fGTIRMFt/XAQeUWUjcHtZlNpj2Qc12
 g9CBCf/zTYLcs0CwcS26RFFczDPuAX8cdu7Kd4Us8JxQXMAhbd138dMN4C2dpspsaf
 oLzsb/lPRY64So+NfUiWRDWqoU1x3iNTSXiffP35IOiVfiMkWnJOo9ebRii5zK7v5g
 VZy5ltvxg8bNA==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 9572C182BA1;
 Fri, 28 May 2021 09:23:53 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 8356F1A8BC6; Fri, 28 May 2021 09:23:53 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
Date: Fri, 28 May 2021 09:23:50 +0200
Message-Id: <20210528072351.1639575-2-hs@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210528072351.1639575-1-hs@denx.de>
References: <20210528072351.1639575-1-hs@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_002413_600819_CDA8C447 
X-CRM114-Status: GOOD (  13.04  )
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
I must admit that I created the file

Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml

by hand, looking into other yaml files...

Is there a way to check such a file to its correctness?

 .../bindings/mtd/microchip,mchp48l640.yaml    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
new file mode 100644
index 0000000000000..f0290d09d4b25
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
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
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
