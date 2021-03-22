Return-Path: <SRS0=4x3R=IU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71B5C433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:21:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 756DA61983
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Mar 2021 18:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 756DA61983
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JJ1NardAfVFov3oTOS2jcNiQix0LGL45VZTfsVQG3Oc=; b=l4/GZOrchJ+kiREKSl/OGsLs0
	gWZYCEEl/DrzCsJMORZPxEKaoM/vxaZZrqB3ACJFMDEXiMLuWAZ6KgNgpk3NvOkW20FKVYQWgFUN5
	0VPv8Hvlt8rpnP45uLQ3gdFJIHLB16Dhha/z0ZZlHYfv3o64WZ1N6adIeN6mp6jjH7oLVlphP2R8Z
	ELI+ePPvtQiEI58jEPi2VCkmr8dztBkNymk8zzQSZaXKoE0QbjsplOsCwfoh6UDrnu5hmTRB0NqOT
	irrPwgTaolGv7za83pwI7v/jSnWe4uVovi9wP+DKl0awoFyZXWBe+f2B3LS3tbWUqKUzC3x/s1u2s
	kwRNJcNiA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPAK-00CEp2-PW; Mon, 22 Mar 2021 18:20:37 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOP9s-00CEi1-JT
 for linux-mtd@lists.infradead.org; Mon, 22 Mar 2021 18:20:11 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id A561A2224F;
 Mon, 22 Mar 2021 19:20:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1616437207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qw8umJ2JoyZ8T0bgCSEERZKN81p4KztCiLS9kzIRYso=;
 b=RNQEXo0C8OUA6uRVl2yUsqB98r2YYrxfTL8VbFlkXWdFPwAXR6ZF1bGN5vzGgSLbOmJe8X
 HpwP6e1aog5RaiKkb969xPhWkBrHRw7i5NeoW9cgtGWv0pEzd+hFGnYBQpN2DlqWoHfknt
 9IjyQLCMtvszXWHvvus1YzptrnAbtIc=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Michael Walle <michael@walle.cc>
Subject: [RFC PATCH 2/4] dt-bindings: mtd: add YAML schema for the generic MTD
 bindings
Date: Mon, 22 Mar 2021 19:19:47 +0100
Message-Id: <20210322181949.2805-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210322181949.2805-1-michael@walle.cc>
References: <20210322181949.2805-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_182008_790324_62A9D53B 
X-CRM114-Status: GOOD (  16.35  )
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

Convert MTD's common.txt to mtd.yaml.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Btw, I've asked Miquel if I can add it as the maintainer.

 .../devicetree/bindings/mtd/common.txt        | 16 +-------
 .../devicetree/bindings/mtd/mtd.yaml          | 39 +++++++++++++++++++
 2 files changed, 40 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtd.yaml

diff --git a/Documentation/devicetree/bindings/mtd/common.txt b/Documentation/devicetree/bindings/mtd/common.txt
index fc068b923d7a..ae16f9ea8606 100644
--- a/Documentation/devicetree/bindings/mtd/common.txt
+++ b/Documentation/devicetree/bindings/mtd/common.txt
@@ -1,15 +1 @@
-* Common properties of all MTD devices
-
-Optional properties:
-- label: user-defined MTD device name. Can be used to assign user
-  friendly names to MTD devices (instead of the flash model or flash
-  controller based name) in order to ease flash device identification
-  and/or describe what they are used for.
-
-Example:
-
-	flash@0 {
-		label = "System-firmware";
-
-		/* flash type specific properties */
-	};
+This file has been moved to mtd.yaml.
diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
new file mode 100644
index 000000000000..321259aab0f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mtd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MTD (Memory Technology Device) Device Tree Bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+properties:
+  $nodename:
+    pattern: "^flash(@.*)?$"
+
+  label:
+    description:
+      User-defined MTD device name. Can be used to assign user friendly
+      names to MTD devices (instead of the flash model or flash controller
+      based name) in order to ease flash device identification and/or
+      describe what they are used for.
+
+additionalProperties: true
+
+examples:
+  - |
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            reg = <0>;
+            compatible = "some,flash";
+            label = "System-firmware";
+        };
+    };
+
+...
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
