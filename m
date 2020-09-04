Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE421C433E2
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A522074D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0D5d7EHw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPRO3QqF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A522074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XzzR/N24f17aztohuDxtdRjqe3XvhBeeo5JAh48yOA=; b=0D5d7EHwqMlXDNZAbFpzXMwpdr
	ANDOpYZuSAw2sjqrzsdc2e00L2TToV3qflQgWus+8PqZznCCUcrx9gZ11RlkJIO8kOWPLg5+W9Ehp
	seQ2uC4LAm24FWh9Uaasgff7lcIQDy+oVNWJEsxdRf/LImYqaXQzqcfWnSuHONZ25A817xn0b9kn1
	+W2rlb7gBjOHnGjhoNsIIussIVuT4priGvWyCmi+SC+j2KX/HciyEhsysVZ0gIdx+yFHnK7rvbKSp
	RTZ1EBsv/Sw4989GJscq2AcREPVJ9Ph5aYyOJzDHFm3pEmTzxX6I5LOn4YxCYCLVqM13Amoz0qnNN
	nWuMkEvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDbx-0008WB-Qc; Fri, 04 Sep 2020 15:26:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDa3-0007V3-Br; Fri, 04 Sep 2020 15:24:51 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FCE920770;
 Fri,  4 Sep 2020 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233086;
 bh=85RKMTmKECIMFM6DGRK+YX/4QokPxJS+EKnA8zzJN1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HPRO3QqFu2PYgg6UY4MmE1tLVsH2LS6zKrpnuJRGkPidYM9DGoujYsBN/jmljDqPK
 S3BlGPyw++TbsH0MPLmALrU4qZv+IOMIGR6g7iXVpVpNgBR3Tdq1vyFoA0wI1OlmFX
 MIPZKtWGqBSM0X/jYuJbbpwTw3VHs4AARoShEoGc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 06/14] dt-bindings: reset: fsl,
 imx7-src: Add i.MX 8M compatibles
Date: Fri,  4 Sep 2020 17:23:56 +0200
Message-Id: <20200904152404.20636-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904152404.20636-1-krzk@kernel.org>
References: <20200904152404.20636-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_112447_548645_757D0651 
X-CRM114-Status: GOOD (  11.92  )
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
Cc: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
    compatible:0: 'fsl,imx8mm-src' is not one of ['fsl,imx7d-src', 'fsl,imx8mq-src', 'fsl,imx8mp-src']
    From schema: Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
    compatible:1: 'syscon' was expected

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: reset-controller@30390000:
    compatible: ['fsl,imx8mm-src', 'fsl,imx8mq-src', 'syscon'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/reset/fsl,imx7-src.yaml          | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml b/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml
index 569cd3bd3a70..00430e2eabc8 100644
--- a/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml
+++ b/Documentation/devicetree/bindings/reset/fsl,imx7-src.yaml
@@ -22,12 +22,19 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - fsl,imx7d-src
-          - fsl,imx8mq-src
-          - fsl,imx8mp-src
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx7d-src
+              - fsl,imx8mq-src
+              - fsl,imx8mp-src
+          - const: syscon
+      - items:
+          - enum:
+              - fsl,imx8mm-src
+              - fsl,imx8mn-src
+          - const: fsl,imx8mq-src
+          - const: syscon
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
