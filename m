Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8894FC352BE
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 08:23:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 597BF221EB
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 08:23:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fban6MZK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 597BF221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Hd1m8+oVrP2EeEUJT7ao6WhHbEpODDfGhGcqNxD7iCI=; b=Fban6MZKADdjiieYcev02HAeLc
	0aSMuLR//MkPZmZ2Ws5hRxjTD0yvmCR1OWKHWuYG2Il0Fmfy0SUBdK4UbUn/6EiPLLEswaA8/eseX
	bQIbrD+aERtYvXttfxxidp9ITVThNo1eBEGlcelrdS2pxbcmBXNnS8X/qFGUwDfQbajnv6GsrBDQz
	R+X5yxkPZOeMLjdXXvAW0HCN4nLp+5UUPY9WGyASzIyl9srgcjUPlGJYoF/192NUqyzgzOSewCHp1
	upQvQKSgUzS8+Xj4Nf8DPhDo6U3BB0F2cGflI3foN66cP66jA8/Bt/0cae0aXx0oSNWEw3B3CpEDr
	ko8DhiEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPMHN-0003PD-KI; Fri, 17 Apr 2020 08:23:17 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPMHI-0003I0-Jg
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 08:23:14 +0000
IronPort-SDR: /wHoMowyuwwyuiDVRMcVjya8ZeZAs5Rs8OfUDxqSxYQDDAUBBlYXO7QdBpta26kTLMTkWyvds9
 PqaqQz3Cm0BQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 01:23:11 -0700
IronPort-SDR: 1qeMkylYjsTBeGuINi5gt8SZbI+2W/zB/4alBR3pVFk+fE/9NrMsE8Cmyqlmd0bguC3nVavda8
 9gTtN28VCyTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="333126197"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by orsmga001.jf.intel.com with ESMTP; 17 Apr 2020 01:23:07 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: mtd: Add YAML for Nand Flash Controller
 support
Date: Fri, 17 Apr 2020 16:21:46 +0800
Message-Id: <20200417082147.43384-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_012312_715741_2E0C1835 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: cheol.yong.kim@intel.com, hauke.mehrtens@intel.com,
 andriy.shevchenko@intel.com, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, richard@nod.at, qi-ming.wu@intel.com, brendanhiggins@google.com,
 linux-mips@vger.kernel.org, robh+dt@kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 boris.brezillon@collabora.com, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add YAML file for dt-bindings to support NAND Flash Controller
on Intel's Lightning Mountain SoC.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
new file mode 100644
index 000000000000..6dd899d367b4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel LGM SoC NAND Controller Device Tree Bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+
+properties:
+  compatible:
+    const: intel,lgm-nand-controller
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    enum:
+      - rx
+      - tx
+
+  pinctrl-names: true
+
+patternProperties:
+  "^pinctrl-[0-9]+$": true
+
+  "^nand@[a-f0-9]+$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 7
+
+      nand-ecc-mode: true
+
+      nand-ecc-algo:
+        const: hw
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - dmas
+
+additionalProperties: false
+
+...
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
