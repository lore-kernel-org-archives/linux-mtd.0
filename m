Return-Path: <SRS0=xDMw=JV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B8AC433ED
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:10:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2589E61476
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Apr 2021 11:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2589E61476
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kCtca7+DANtbqECg8AUUoMsOOeQKcowMQvkr/oFwt14=; b=ODLnUIwa7JdV1JlX9LpdxWk0d
	PLcVJ5sn/P5enWKEINuAVIqSeLIi1CwE/bhi8mCLi8tgCAo1G+Qf0WFGFXOLQFwE7NSuoZ/phKPBQ
	lx4f7aEK7brSFpYUWsyu13BRvn8EFNI+TdEGKbPopAnV+PyBDP6YQsUDl3TVLvUWyBJ3p9CVnUzYb
	4u8zV0jE8nY9dEe6xrhvKbeG8ShiLH24Pn2cQDJ/kne25TIsSpXRMnDZ9/y7nim8gA4oJRllGLIbS
	DOgUBJeJ1P+2LCLAButEIbKZJSdKtASn1CIfwla+8oCrZmYeGY/t0jlrUU3kWFy5WQrnrHC0kdxow
	y0xB0712A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laG9n-003hFu-Bw; Sat, 24 Apr 2021 11:09:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG7E-003gzr-Fi
 for linux-mtd@desiato.infradead.org; Sat, 24 Apr 2021 11:06:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yUmNwVT3YrVa+lmmEf/AbsFSZKOFCNzLcc4BFA/aGI0=; b=fhhEQtD3+6XzyBG7qzNbIXV1Ml
 UEvEUPZujalD3AGy2588XXSV/B2/l4d/o4qNJup3EmazxHcaw1is2G9BWA0qXD6zgNtoNnO0ggf6r
 P30zt+k4SfR5erxLqMFrsv0+SS+xTlf4IQYVmq8fH+3FuLjSZVDI2gpmPhjEZucZ2utZqJaNsr2IB
 wVwg5w++YJkEKPVVO74vRE7actwQWwyDVt0Ey7o/NcSGvBi3sPED5/3J3oZCDM/N2ivi1MKi7mHjm
 i/s4rECWmHwdZVx3vk23U0cGz1dII9rJABSVUQFCFthWxYqph0CNRoSR7ji3LyHk/sca6SXJpjjH9
 P2busStg==;
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laG7B-00EyjW-Km
 for linux-mtd@lists.infradead.org; Sat, 24 Apr 2021 11:06:23 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id D1E7A2224E;
 Sat, 24 Apr 2021 13:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619262378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUmNwVT3YrVa+lmmEf/AbsFSZKOFCNzLcc4BFA/aGI0=;
 b=OsSrd5SnMAmhm9l6z/0HtHC0y4OXjb7ktzLxxYrduwWtjlmxE+ko9l4h/DR74ToA/Z0SJA
 BjeS1dF4PRe9jjh4qSFuX2SBTqnpdsPvt0PazL4OXvwf0E7upULzyLJTEfqB1xGFiba/Ti
 odvXeR6c4hNKptpjYfUGoNtFY3rlHbM=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/5] dt-bindings: mtd: add YAML schema for the generic MTD
 bindings
Date: Sat, 24 Apr 2021 13:06:05 +0200
Message-Id: <20210424110608.15748-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210424110608.15748-1-michael@walle.cc>
References: <20210424110608.15748-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210424_040621_860360_A35858E4 
X-CRM114-Status: GOOD (  14.33  )
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
Changes since v1:
 - none

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
