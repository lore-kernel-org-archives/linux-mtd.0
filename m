Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D67DC4743D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 05:37:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C18156128A
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 05:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C18156128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDYa8qTAt6YeU0wdxkjO5PvulKzcMJ6x2OWcZOamAo4=; b=2OUlDKmzmgk7eF
	wPLy/ooETlne0SN0hpEXOfSXX+rzPjYXwwjzdNjCRfUDERKss9kVcTdVDqZAKMCQg3YZ+qkUHrMTA
	EmwTMIP/8W88SX237eT0hOa/kGAewcgH4QOSG4phg36vAyBM/jbc13dP3sgOwlKQFugMBHYaDT4yS
	47SOrHkZR+RX3HhBsxFJyg/wFnxyUky1nhM11YB5HbJJQ5kvPIqfQLH6RZcZbvCqh47cbIfuxfAcU
	pbBzdGg657MDHiq2FEMShx8HfHuP+gb77lqNjl+F+BVrnhdiL6UQok69Kjpun5qlvrBGCAs9xZ/3I
	V0w67BZwDUIuAwGuCrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrZqE-003eic-95; Fri, 11 Jun 2021 05:36:26 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrZpb-003ecy-RH; Fri, 11 Jun 2021 05:35:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15B5Zief052852;
 Fri, 11 Jun 2021 00:35:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1623389744;
 bh=OK1BBN5vDtJG0Xmb5r7XtXcCR1ZluEMiVIvUDOuvIUU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Ek2HwlpdqJTn6XkMx6o8ViwEXoLzn2IPa/+qVQ8tllbXuvoZc0K0i9HC7tizfcyIw
 yhrXwC9QaYREQOvcy1XAYQZsw8lCUKILlWZRWujr+Kpbg5ovZfBqcGlgq83KDCZnbh
 HUOXEQJsu2mo6Db+f+ovDUpIxIru/3InXO7h5BK4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15B5ZisO100919
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Jun 2021 00:35:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 11
 Jun 2021 00:35:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 11 Jun 2021 00:35:43 -0500
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15B5ZbTL088083;
 Fri, 11 Jun 2021 00:35:41 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>, Linux ARM
 Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/2] dt-bindings: mtd: Convert cypress,
 hyperflash to YAML schema
Date: Fri, 11 Jun 2021 11:05:32 +0530
Message-ID: <20210611053533.16701-2-vigneshr@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611053533.16701-1-vigneshr@ti.com>
References: <20210611053533.16701-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_223547_986649_1DE2DD4D 
X-CRM114-Status: GOOD (  12.11  )
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

Convert cypress,hyperflash bindings to YAML schema

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../bindings/mtd/cypress,hyperflash.yaml      | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.yaml

diff --git a/Documentation/devicetree/bindings/mtd/cypress,hyperflash.yaml b/Documentation/devicetree/bindings/mtd/cypress,hyperflash.yaml
new file mode 100644
index 000000000000..4341c0b0410c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cypress,hyperflash.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/cypress,hyperflash.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HyperFlash serial NOR flash chips
+
+maintainers:
+  - Vignesh Raghavendra <vigneshr@ti.com>
+
+allOf:
+  - $ref: "mtd.yaml#"
+
+properties:
+  compatible:
+    items:
+      - const: cypress,hyperflash
+      - const: cfi-flash
+    description:
+      HyperFlash serial NOR flash chips compliant with Cypress HyperBus
+      specification and supports Cypress CFI specification 1.5 command set.
+
+  reg:
+    maxItems: 1
+
+  partitions:
+    type: object
+
+  '#address-cells': true
+  '#size-cells': true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    memory-controller {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        flash@0 {
+            #address-cells = <1>;
+            #size-cells = <1>;
+            compatible = "cypress,hyperflash", "cfi-flash";
+            reg = <0x0 0x4000000>;
+        };
+    };
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
