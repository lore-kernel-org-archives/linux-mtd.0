Return-Path: <SRS0=R0RB=KO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACF1C433B4
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 19:02:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FBB36108D
	for <linux-mtd@archiver.kernel.org>; Wed, 19 May 2021 19:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FBB36108D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5NDUSDWS2eQZD457RyJemwIVGh2wPf0ShSMf16ktX20=; b=epjPqsy2Mib36tkfShrchcLjf
	o5eSdLy9KPX7tjrmshte8zGKPWwdeAe4hEbwMAwxceVSvxrB28/DvuT7ySUM2FOVZoDBVbfDpnIoa
	GKdQdEYjWgMxk7iCFiiNMcFZXq7gXVQCNuMpAiSw/7cpZVEoAvwz7r2Q77SwLa51eVGVShLTjbfuw
	mqwHjufL6oZqukLeUieoZWhEUi61OpzrQLjj8DUYl/V6u0bOYXLSjFfthDrmL8UidPiRMhEhj2wFD
	mw6D9pws4kavX7APygGMtEmAJYG0KrOJvCyjwN0EcmzSpmtMLUGe7QzC+e6kE457/h19/SOmHd+6X
	pwPMPeCzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljRRW-004p6c-Jp; Wed, 19 May 2021 19:01:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuY-004lPr-3f
 for linux-mtd@desiato.infradead.org; Wed, 19 May 2021 18:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=CM1gHgaHCy2AZOjy1K/+eQQxEKqr07KSgG7p+tEF7/s=; b=FQERFOv1ATIgmFAFL15iCnubZf
 7jziy8SIQW2zQ+snBaZ78BUef9b9h0w6wbLlrvWS9wc3Wm2J2rGz0aif1pQqT74Kx+ZN4//T+pjQI
 cqksDhfaVZJSGIfREG3rvHk2jx3YjUnt7CuD0pdSyXvrPP+WNw5U3oSlMgr+VUzStLypuQB4vY5yi
 8GeMPA9HnnBl6sOfMJ5Gj/loRST7aabZDv69DjnRI884+pyfQ/plq3B4KjUs2VxrJUrPEJH1Dmj1T
 qb5QyWTj7sv/V0VTwig0VFIrsf5Aa3R2lIVR/RZgsab4cB5CkU7Unrjhz3PAxBljgvKpnC/31I3Xn
 kWJjvamg==;
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljQuV-00FhA7-EO
 for linux-mtd@lists.infradead.org; Wed, 19 May 2021 18:27:12 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B83C8C0007;
 Wed, 19 May 2021 18:27:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v20 18/19] dt-bindings: mtd: pl353-nand: Describe this
 hardware controller
Date: Wed, 19 May 2021 20:26:35 +0200
Message-Id: <20210519182636.1110080-19-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
References: <20210519182636.1110080-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_112711_639769_9D16DC98 
X-CRM114-Status: GOOD (  12.40  )
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

Add a yaml description of this NAND controller which is described as a
subnode of the SMC bus.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/mtd/arm,pl353-nand-r2p1.yaml     | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml

diff --git a/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
new file mode 100644
index 000000000000..609726ed72de
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/arm,pl353-nand-r2p1.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/arm,pl353-nand-r2p1.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: PL353 NAND Controller device tree bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - arm,pl353-nand-r2p1
+
+  reg:
+    items:
+      - items:
+        - description: CS with regard to the parent ranges property
+        - description: Offset of the memory region requested by the device
+        - description: Length of the memory region requested by the device
+
+  "#address-cells": true
+  "#size-cells": true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: true
+
+examples:
+  - |
+    nand0: nand-controller@0,0 {
+      compatible = "arm,pl353-nand-r2p1";
+      reg = <0 0 0x1000000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
