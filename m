Return-Path: <SRS0=HQC9=DB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE1EC4346E
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:43:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA9523600
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2020 08:43:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UgR5H2gB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABA9523600
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei0LwvX7FLGatpWdRSGqQzkEzQCkeABZR3UWHRs8DL8=; b=UgR5H2gBGgMfo+ouqMa+Qc6KFk
	ExYFXU6F5eAzk7UKUqlTjdWfEZipKt8/dlat36TPr/ViQIvh7cVZDIN3qqaYo8SlfMAmdxsmPFVr5
	b/kB9KmuAIsOHPg/1OcKx2gnuPUwhDAJXESJ2kwZetptr0oIc05kngBXM9HxLNMA/Le2C4VU8k4Ll
	cIGQUx00DZkCpeqjFR2hzXTygXy7In+PKDmF6UfA3S2aJAw0VLQF9e2oPlX/K9mW4U5CYc3mghGzC
	TrUX78W+2jQsMHFN5aZIStuINAPUfm/g/le+r3kvZC4XOUmkBrPff1QqaPDlJOFKhpPI87Yvaqe5W
	OFlhRWdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLMq1-0005gr-Eu; Thu, 24 Sep 2020 08:42:49 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLMpy-0005fw-AJ
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2020 08:42:47 +0000
IronPort-SDR: MvyEz21cP8/U4WIvCN+NQDBfAJc77gCebCjJxJk2NDI4ZjyMNWYjFF9uXgtjo5InsvMeAt1Z71
 HCMa39jKJnJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148797961"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="148797961"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 01:42:44 -0700
IronPort-SDR: Km/Iub+VG7BAkmgYwQ3GZCuzH4wGS96ZQqneJlZxSjCA0IN6LlrogODbD0BPzmb6CXYHS7x1q+
 apLXZA1I1E9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="291962626"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
 by fmsmga008.fm.intel.com with ESMTP; 24 Sep 2020 01:42:40 -0700
From: "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
To: miquel.raynal@bootlin.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v14 1/2] dt-bindings: mtd: Add Nand Flash Controller support
 for Intel LGM SoC
Date: Thu, 24 Sep 2020 16:42:31 +0800
Message-Id: <20200924084232.41631-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200924084232.41631-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200924084232.41631-1-vadivel.muruganx.ramuthevar@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_044246_487467_41094E59 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, christophe.kerello@st.com, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 tglx@linutronix.de, qi-ming.wu@intel.com, robert.jarzmik@free.fr,
 piotrs@cadence.com
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
 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
new file mode 100644
index 000000000000..313daec4d783
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
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
+    const: intel,lgm-nand
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+       - const: ebunand
+       - const: hsnand
+       - const: nand_cs0
+       - const: nand_cs1
+       - const: addr_sel0
+       - const: addr_sel1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
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
+  - reg-names
+  - clocks
+  - dmas
+  - dma-names
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    nand-controller@e0f00000 {
+      compatible = "intel,lgm-nand";
+      reg = <0xe0f00000 0x100>,
+            <0xe1000000 0x300>,
+            <0xe1400000 0x8000>,
+            <0xe1c00000 0x1000>,
+            <0x17400000 0x4>,
+            <0x17c00000 0x4>;
+      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
+        "addr_sel0", "addr_sel1";
+      clocks = <&cgu0 125>;
+      dmas = <&dma0 8>, <&dma0 9>;
+      dma-names = "tx", "rx";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-ecc-mode = "hw";
+      };
+    };
+
+...
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
