Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA962C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:56:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314FE60FF1
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314FE60FF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OcdOf1PNVpb7Q9LxA1fALF0xc4YKBMCGhNYjPRReQ20=; b=gPsiFOG1oK/231bE0XlAjLlPG
	o8pwXpQ8ri9/tZnPOozufdGwoS6F8quN5/fybD4WaUgbO+jNaBBsk7EI4actyGb/1V4Kyjl3BoAps
	TKqKtPxq4BbDPsu1gQVB8xNZYyC7efedJWLEqZmzYn7nO28O4Og4Lmn8VWqMR3Tr+/75Lg0y8//Ep
	VX+XTwJuAZ8ExwA8jrpHnYOxk4XzyI+oAgylHB6hwkwIq87b92pyc87E0p+u2kS71XFW0Nhf6TuXE
	CO1yqqeKqAwIhr9LkYPV/Pc6wrUcqv3IiUqaTyktVvsmlMxMXKGnmML9667sKUYxLqC1PJI4T7SEI
	klbuOdnzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXN4o-001zn0-Vu; Fri, 16 Apr 2021 11:55:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyk-001yeu-MW
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 11:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=q5mlW+sn5FZ7Xj6idRbO0XplNjAvnEg7p0BfoTeHt+k=; b=h2UdJJ2p4QmpZTlpGhzMuWdtnK
 gVR95UDXlYYAJjxT8VfACEXghgnZjB1wuADEbHQGe1RMzzm6uEzmjWP9lZm9nePJIpxbiQlx4Lgqn
 thoeqmAHWQVaJZYesSzF9fLA03ikSyjc66eX7EVsyEP+DKK0khzaG8T2N17RvslVX+gbiBv1FvFj/
 jqTeTjB6NyV3A/8bOWW0QFFFmjcBRqUC4yfCsFjBjMd04hP5yCAHUgaklS12jYOmgfKYvPPsFBCsn
 nCkniB3KNYwkrHZmP9r5A0lqKyrSOYdJrfxf5hj36pYONfSAfe+ZY6wYoylkKUEcW6Q4ESz0rrDFZ
 AvjGwM6g==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyg-009KfV-GE
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 11:49:41 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2C0C022255;
 Fri, 16 Apr 2021 13:49:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618573775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5mlW+sn5FZ7Xj6idRbO0XplNjAvnEg7p0BfoTeHt+k=;
 b=ek3NUy1sL9NBd33wOCAtZVgnMywkWLXFHPDBBdjkWZGBMwSGCTGAcP6VN0GG4ymmPezY+F
 pZ9CuQ3KaZfM1h5rYsEXZhrHpvRamgy66ZRMpJpLEl84VMpzBosVgUnSQW8pmij9VnshiO
 wXQR4RElNFyebJb+xD2Z9cG34POGTj0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>
Subject: [PATCH 2/5] dt-bindings: mtd: add YAML schema for the generic MTD
 bindings
Date: Fri, 16 Apr 2021 13:49:25 +0200
Message-Id: <20210416114928.27758-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416114928.27758-1-michael@walle.cc>
References: <20210416114928.27758-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_044938_783612_E6F3EE73 
X-CRM114-Status: GOOD (  14.69  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since RFC:
 - use real device compatibles

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
index 000000000000..086b0ecd1604
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
+            compatible = "jedec,spi-nor";
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
