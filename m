Return-Path: <SRS0=4NdN=HE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24259C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 17:54:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B059264F8D
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 17:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B059264F8D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o5i6FQf+0MuR3RWOwY0UuLatFRT/CT71tSMx3k2+2H4=; b=Ie7sIPF3yttxwU7habM/K4FhSh
	u0zo1+55Outcjlpd9I253WP/GDesUg+Mqn1btxKm28mTg5ILeARO7ntxqEvrL9d9eCCaPOFhgep2Q
	QYZejolQFWjXxM4IdCqp6fKCDbhocwXeJY4resyZxw6C6RlGGyxHqBo/oUO71BF/huYRImtP0P+Tk
	QqFANpIlSm5TQEK6ZbhYaQhWfjHwhBeGSDSXwZTuxjY1gxcgNhfcs5OHpsE5boBEXFRMOF2N+uspO
	iJ61eJFhInXAo/A+k5v6E1eQWvnSfjD8nuQDduWhXKM9kIntCAuHPz5wxYROOZ9KD8HYIumzh931X
	gjvX9JeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zs1-0001Q2-Ba; Tue, 02 Feb 2021 17:53:45 +0000
Received: from mail-oi1-f171.google.com ([209.85.167.171])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zry-0001PR-Qn
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2021 17:53:44 +0000
Received: by mail-oi1-f171.google.com with SMTP id n7so23639080oic.11
 for <linux-mtd@lists.infradead.org>; Tue, 02 Feb 2021 09:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8vDbQmL5iEpetuc73BnBxCM6fFf2Ksz8RzcABWCqFJU=;
 b=eqQ8xDlpUAlccIT3aL+GaVfi9h5cEEplp2srb/FC17uuMmNrsR8Yeo8ASdZpZfvtBd
 ZtBWlfJB/HTpnAPguHXrLf3hApCLY0d2KFBHZ/imJyz2VOMzp9v+HS4dvMg3hblQ8AWd
 JDlEZ0Eor7WDtquZWljOlLGNIDlNGjJIdpiJ2+LRaVqR3p3nit0/PXNYX0VvyRepCRHQ
 qAFbJLbGDvfUHtNNZTYxWLezGDrnU0yTgJqZWx/NQWYAh0SJPy5FNEeDR+ovTowz8Fvj
 0V6uVAkB3hfBk9BdI3ljG62Oufb2WRvzRCBERxXaNIc+j+hcGpLVrC5OrmNfVGxlGU1z
 mQyw==
X-Gm-Message-State: AOAM533jhd9gb/HdCpMcd6iQoN0vwm3HccJwffCjjmPpvQWlkHxzTBfq
 cxYnFnO7wQ0s7q/e2BLgVw==
X-Google-Smtp-Source: ABdhPJwIYDUyFnb5s/PSk+AdX838p6dxHfZoKOZ+WzBABVXuE4rg9x/AiinJzkyQAz7JTW4NvyEmIQ==
X-Received: by 2002:aca:c64c:: with SMTP id w73mr3685645oif.168.1612288421912; 
 Tue, 02 Feb 2021 09:53:41 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id a76sm5348460oib.45.2021.02.02.09.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 09:53:40 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mtd: spi-nor: Convert to DT schema format
Date: Tue,  2 Feb 2021 11:53:39 -0600
Message-Id: <20210202175340.3902494-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_125342_892996_5C53183F 
X-CRM114-Status: GOOD (  23.60  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Convert the SPI-NOR binding to DT schema format. Like other memory chips,
the compatible strings are a mess with vendor prefixes not being used
consistently and some compatibles not documented. The resulting schema
passes on 'compatible' checks for most in tree users with the exception
of some oddballs.

I dropped the 'm25p.*-nonjedec' compatible strings as these don't appear
to be used anywhere.

Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/jedec,spi-nor.txt |  91 ----------------
 .../bindings/mtd/jedec,spi-nor.yaml           | 102 ++++++++++++++++++
 2 files changed, 102 insertions(+), 91 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
deleted file mode 100644
index f03be904d3c2..000000000000
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.txt
+++ /dev/null
@@ -1,91 +0,0 @@
-* SPI NOR flash: ST M25Pxx (and similar) serial flash chips
-
-Required properties:
-- #address-cells, #size-cells : Must be present if the device has sub-nodes
-  representing partitions.
-- compatible : May include a device-specific string consisting of the
-               manufacturer and name of the chip. A list of supported chip
-               names follows.
-               Must also include "jedec,spi-nor" for any SPI NOR flash that can
-               be identified by the JEDEC READ ID opcode (0x9F).
-
-               Supported chip names:
-                 at25df321a
-                 at25df641
-                 at26df081a
-                 mr25h128
-                 mr25h256
-                 mr25h10
-                 mr25h40
-                 mx25l4005a
-                 mx25l1606e
-                 mx25l6405d
-                 mx25l12805d
-                 mx25l25635e
-                 n25q064
-                 n25q128a11
-                 n25q128a13
-                 n25q512a
-                 s25fl256s1
-                 s25fl512s
-                 s25sl12801
-                 s25fl008k
-                 s25fl064k
-                 sst25vf040b
-                 m25p40
-                 m25p80
-                 m25p16
-                 m25p32
-                 m25p64
-                 m25p128
-                 w25x80
-                 w25x32
-                 w25q32
-                 w25q64
-                 w25q32dw
-                 w25q80bl
-                 w25q128
-                 w25q256
-
-               The following chip names have been used historically to
-               designate quirky versions of flash chips that do not support the
-               JEDEC READ ID opcode (0x9F):
-                 m25p05-nonjedec
-                 m25p10-nonjedec
-                 m25p20-nonjedec
-                 m25p40-nonjedec
-                 m25p80-nonjedec
-                 m25p16-nonjedec
-                 m25p32-nonjedec
-                 m25p64-nonjedec
-                 m25p128-nonjedec
-
-- reg : Chip-Select number
-- spi-max-frequency : Maximum frequency of the SPI bus the chip can operate at
-
-Optional properties:
-- m25p,fast-read : Use the "fast read" opcode to read data from the chip instead
-                   of the usual "read" opcode. This opcode is not supported by
-                   all chips and support for it can not be detected at runtime.
-                   Refer to your chips' datasheet to check if this is supported
-                   by your chip.
-- broken-flash-reset : Some flash devices utilize stateful addressing modes
-		   (e.g., for 32-bit addressing) which need to be managed
-		   carefully by a system. Because these sorts of flash don't
-		   have a standardized software reset command, and because some
-		   systems don't toggle the flash RESET# pin upon system reset
-		   (if the pin even exists at all), there are systems which
-		   cannot reboot properly if the flash is left in the "wrong"
-		   state. This boolean flag can be used on such systems, to
-		   denote the absence of a reliable reset mechanism.
-
-Example:
-
-	flash: m25p80@0 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "spansion,m25p80", "jedec,spi-nor";
-		reg = <0>;
-		spi-max-frequency = <40000000>;
-		m25p,fast-read;
-	};
diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
new file mode 100644
index 000000000000..5e7e5349f9a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI NOR flash ST M25Pxx (and similar) serial flash chips
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - pattern: "^((((micron|spansion|st),)?\
+              (m25p(40|80|16|32|64|128)|\
+              n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
+              atmel,at25df(321a|641|081a)|\
+              everspin,mr25h(10|40|128|256)|\
+              (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
+              (mxicy|macronix),mx25u(4033|4035)|\
+              (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
+              (sst|microchip),sst25vf(016b|032b|040b)|\
+              (sst,)?sst26wf016b|\
+              (sst,)?sst25wf(040b|080)|\
+              winbond,w25x(80|32)|\
+              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
+          - const: jedec,spi-nor
+      - items:
+          - enum:
+              - issi,is25lp016d
+              - micron,mt25qu02g
+              - mxicy,mx25r1635f
+              - mxicy,mx25u6435f
+              - mxicy,mx25v8035f
+              - spansion,s25sl12801
+              - spansion,s25fs512s
+          - const: jedec,spi-nor
+      - const: jedec,spi-nor
+    description:
+      Must also include "jedec,spi-nor" for any SPI NOR flash that can be
+      identified by the JEDEC READ ID opcode (0x9F).
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency: true
+  spi-rx-bus-width: true
+  spi-tx-bus-width: true
+
+  m25p,fast-read:
+    type: boolean
+    description:
+      Use the "fast read" opcode to read data from the chip instead of the usual
+      "read" opcode. This opcode is not supported by all chips and support for
+      it can not be detected at runtime. Refer to your chips' datasheet to check
+      if this is supported by your chip.
+
+  broken-flash-reset:
+    type: boolean
+    description:
+      Some flash devices utilize stateful addressing modes (e.g., for 32-bit
+      addressing) which need to be managed carefully by a system. Because these
+      sorts of flash don't have a standardized software reset command, and
+      because some systems don't toggle the flash RESET# pin upon system reset
+      (if the pin even exists at all), there are systems which cannot reboot
+      properly if the flash is left in the "wrong" state. This boolean flag can
+      be used on such systems, to denote the absence of a reliable reset
+      mechanism.
+
+  label: true
+
+  partitions:
+    type: object
+
+  '#address-cells': true
+  '#size-cells': true
+
+patternProperties:
+  # Note: use 'partitions' node for new users
+  '^partition@':
+    type: object
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
+            #address-cells = <1>;
+            #size-cells = <1>;
+            compatible = "spansion,m25p80", "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <40000000>;
+            m25p,fast-read;
+        };
+    };
+...
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
