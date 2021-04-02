Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1183C433B4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:50:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B0DF61005
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 06:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B0DF61005
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ZWX2BsIGhR1A84hdGrNSUWn/zTz3t6b8EdKQMISiUI=; b=Tj7hp0MpOS6KyQ9lhngTXIz8e
	YJ9h1KVEHpCxOfmz8bMiU+0EcPrs2JsydEUdR5TlsM7VxMVu0op5mMfAQwxFGcIlI61UI9PHUVm09
	7n5Pw64535qG0jKTmmt/hpbTflg33VG/sZs/JNYt5MtaXrDTnFcvO7dybEVpmGZE6//RYiswBsfZa
	mENOcKvtlp88dYu1c1jWmVx88tRl/81MXx2NZTsD1G4Ig5WMUvX04blab7Kzxo7Fac+0/X4I/XnVR
	8uJe1k/aQZ+aYL4K+sw78LffX8Ki7SSI/nX/4gOWmHkAP4fPbmlvvf2IPpFpO1vgCz8A2exZCrG6E
	5cvLMYR3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSDch-00C96k-Ar; Fri, 02 Apr 2021 06:49:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSDcP-00C92u-JU
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 06:49:23 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 20100C0005;
 Fri,  2 Apr 2021 06:49:20 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/5] dt-binding: mtd: nand: Document gpio-cs property
Date: Fri,  2 Apr 2021 08:49:11 +0200
Message-Id: <20210402064915.220781-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210402064915.220781-1-miquel.raynal@bootlin.com>
References: <20210402064915.220781-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_074921_800096_ED5247D8 
X-CRM114-Status: GOOD (  12.00  )
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

To reach higher capacities, arrays of chips are now pretty common.
Unfortunately, most of the controllers have been designed a decade ago
and did not all anticipate the need for several chip-selects. The new
cs-gpios property allows to workaround this limitation by adding as many
GPIO chip-select as needed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index d0e422f4b3e0..6238ce683903 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -38,6 +38,15 @@ properties:
 
   ranges: true
 
+  cs-gpios:
+    description:
+      Array of chip-select available to the controller. The first
+      entries are a 1:1 mapping of the available chip-select on the
+      NAND controller (even if they are not used). As many additional
+      chip-select as needed may follow and should be phandles of GPIO
+      lines. 'reg' entries of the NAND chip subnodes become indexes of
+      this array when this property is present.
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
@@ -157,14 +166,19 @@ examples:
     nand-controller {
       #address-cells = <1>;
       #size-cells = <0>;
+      gpio-cs = <0>, <&gpioA 1>; /* A single native CS is available */
 
       /* controller specific properties */
 
       nand@0 {
-        reg = <0>;
+        reg = <0>; /* Native CS */
         nand-use-soft-ecc-engine;
         nand-ecc-algo = "bch";
 
         /* controller specific properties */
       };
+
+      nand@1 {
+        reg = <1>; /* GPIO CS */
+      };
     };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
