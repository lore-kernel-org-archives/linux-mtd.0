Return-Path: <SRS0=x3fM=EE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85174C4363A
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 16:21:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B09D2076D
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Oct 2020 16:21:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n6x8P4Du";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFnfg7Io"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B09D2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j9GxrTjjnKkKG+bpzPKjO/uCtvfnEmzjLAzifHt91CI=; b=n6x8P4DuB0NPPyM1/GA47/tLYU
	EBLQ2Cgjtcm17DTrHyHXZ4lCUZ/Dhals9NyTX06JnWUjqgjrOPqMu7BQLIkphZXlNh+CJPllLsaDB
	rzJKgsdJp+cCMvFTWzM31BMZm4j2HrU/gXUdvmSnjH940GCpi07l1ukQqC6ypMk7AnJ7zIw7Mf8xy
	1VvsOGHeQIAssOf/n17zMjwZ3KqVHlXb+BjL6/hkjVLNO3ypK1YW9D0O/GrHrcEOkFMFbm93xmDti
	Q+Y5QGxt2BUN+O/ItisB/ZEk8EETzfJK4HUtkGELlM73442uq0zzqwWYLCiPUP0y+1eXwy5R940Ns
	dKWGessQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYAff-0002se-7c; Thu, 29 Oct 2020 16:21:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYAf6-0002en-Kw
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2020 16:20:33 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37AFF2076D;
 Thu, 29 Oct 2020 16:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603988427;
 bh=3qAjnhHz1kcAriq2G1giteB+HNPzOLqsVeeCAC7VxDA=;
 h=From:To:Cc:Subject:Date:From;
 b=RFnfg7Iow8R1ZrzmX0c9C4MoxZBa5/xOtn/SaXjH8mu7prmUQwnPrjLb6XIdfxdX6
 rnxNtUIBO3fBDzyCpaSRP5+12k3IAz1BuXmg0oQJoOqxgltltMlv9Vq0wBirElIaaf
 XkrJbcjOJ8ouAITA0mvpKa+I5VP9Ly5yaeURnkWE=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] dt-bindings: mtd: gpmi-nand: Fix matching of clocks on
 different SoCs
Date: Thu, 29 Oct 2020 17:20:21 +0100
Message-Id: <20201029162021.80839-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_122028_932808_1274269F 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Driver requires different amount of clocks for different SoCs.  Describe
these requirements properly to fix dtbs_check warnings like:

    arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: clock-names:1: 'gpmi_apb' was expected

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v3:
1. Go back to fixed order of clocks, after explanation from Rob.

Changes since v1:
1. Do not require order of clocks (use pattern).
---
 .../devicetree/bindings/mtd/gpmi-nand.yaml    | 76 +++++++++++++++----
 1 file changed, 61 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
index 28ff8c581837..9d764e654e1d 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
@@ -9,9 +9,6 @@ title: Freescale General-Purpose Media Interface (GPMI) binding
 maintainers:
   - Han Xu <han.xu@nxp.com>
 
-allOf:
-  - $ref: "nand-controller.yaml"
-
 description: |
   The GPMI nand controller provides an interface to control the NAND
   flash chips. The device tree may optionally contain sub-nodes
@@ -58,22 +55,10 @@ properties:
   clocks:
     minItems: 1
     maxItems: 5
-    items:
-      - description: SoC gpmi io clock
-      - description: SoC gpmi apb clock
-      - description: SoC gpmi bch clock
-      - description: SoC gpmi bch apb clock
-      - description: SoC per1 bch clock
 
   clock-names:
     minItems: 1
     maxItems: 5
-    items:
-      - const: gpmi_io
-      - const: gpmi_apb
-      - const: gpmi_bch
-      - const: gpmi_bch_apb
-      - const: per1_bch
 
   fsl,use-minimum-ecc:
     type: boolean
@@ -107,6 +92,67 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: "nand-controller.yaml"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx23-gpmi-nand
+              - fsl,imx28-gpmi-nand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SoC gpmi io clock
+        clock-names:
+          items:
+            - const: gpmi_io
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx6q-gpmi-nand
+              - fsl,imx6sx-gpmi-nand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SoC gpmi io clock
+            - description: SoC gpmi apb clock
+            - description: SoC gpmi bch clock
+            - description: SoC gpmi bch apb clock
+            - description: SoC per1 bch clock
+        clock-names:
+          items:
+            - const: gpmi_io
+            - const: gpmi_apb
+            - const: gpmi_bch
+            - const: gpmi_bch_apb
+            - const: per1_bch
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx7d-gpmi-nand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: SoC gpmi io clock
+            - description: SoC gpmi bch apb clock
+        clock-names:
+          minItems: 2
+          maxItems: 2
+          items:
+            - const: gpmi_io
+            - const: gpmi_bch_apb
+
 examples:
   - |
     nand-controller@8000c000 {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
