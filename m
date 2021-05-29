Return-Path: <SRS0=Jc64=KY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 425E2C4708E
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 10:28:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 078D961205
	for <linux-mtd@archiver.kernel.org>; Sat, 29 May 2021 10:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 078D961205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBtpIKHeHe8qZPMtsjUboPhazXhTBkHc2Gg/yBFfeXk=; b=LhIXyFtl/drtrS
	8fDHrzv0XKL/EubssKOzC0BpFVmMUIqCi0QjGIKq5CsCzV3JythE84LU7lOpevEaGJVF1es1O/Y0E
	XhTQVoHL2mKn4/1Rr8yUd9sZ3IX5qMJpYzRmcAPqWM+91egyauFwc8uHrgPD9v5yh2+ZmSS3U9lPl
	9yIrxD9nERWO1+08mx68VMtGttPR7wyBIfnncm+QAohCIgyfHoNxj1QBiVKOpDnVv8u0mPR9c5wwS
	jVasg4jrZ5f7BqeUQivhhTQXBF6AzHXlOaGW/LcCAaucitWVneqE+6YcvB3FDjXn2qa5dsNL6e6vY
	4iJhGQAaQ0ZlnfyMiCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmwCQ-004l3T-0H; Sat, 29 May 2021 10:28:10 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmwCF-004kz0-OO
 for linux-mtd@lists.infradead.org; Sat, 29 May 2021 10:28:01 +0000
Received: from mail-internal.denx.de (p578adb1c.dip0.t-ipconnect.de
 [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: noc@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 03F4781ECA;
 Sat, 29 May 2021 12:27:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1622284078;
 bh=B5KI7ifeeOuKGZWeMhm6fI1KYhbpiukyN7ZgTTDJmkk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wyKgrJp9rZODqz1fxi0AJurwAS3eN8qPJsKqwv8dJpTSn4VHbx9puzoDqKzdpShAT
 iezGNOFHnpuJJfwyG/3c9m38NV5hNeRe6+7cHcnXI7dx/b0T3QYyJbhjpC2ddcl5O4
 csEHbJkTq9jioDATkoNIFhybSIR4W6WGlpkdvfpFwD2PUwHhy79RPwwQDzD5yZDWtI
 nNB3yrlSKJxcr4msvnFCOVd6REEg7PY7zdD3Y0rBUZhqiEvXYIDiXbPUqC21LoQObj
 PGVqtFmLSTZVep01/emTNDIIkpS0N1ju2WCD7zSrN8kYH6mbL+FeFbV0ysEGHs3TuL
 k3CSTKNP16fFQ==
Received: from pollux.denx.de (pollux [192.168.1.1])
 by mail-internal.denx.de (Postfix) with ESMTP id 9A0CD182BA4;
 Sat, 29 May 2021 12:27:46 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 515)
 id 8EC501A8BC5; Sat, 29 May 2021 12:27:46 +0200 (CEST)
From: Heiko Schocher <hs@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Heiko Schocher <hs@denx.de>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: devices: add devicetree documentation for
 microchip 48l640
Date: Sat, 29 May 2021 12:27:43 +0200
Message-Id: <20210529102744.1251220-2-hs@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529102744.1251220-1-hs@denx.de>
References: <20210529102744.1251220-1-hs@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_032759_966472_BCE4DAD8 
X-CRM114-Status: GOOD (  11.99  )
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
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
