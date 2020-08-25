Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD56C433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:47:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409302074D
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:47:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mtWOvJ3o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOkLt8Y8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 409302074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hT79dBiOKp/gjRuDXOZ9ViNk5vaV1FvvnRLbcbkfoI8=; b=mtWOvJ3oIdHHn94pfN+3ebi+AQ
	/drNhldO7CtOb4eju/M4UP/6w4zN1gIIswba+x8j6ZOKadceV0qUC1J5Qq28AFVoLDBSNWzExT//Y
	myRgVTrPAz3LUsFEliwM0k34cCPf5Rm7lHi8cIkj46p2dwuzSCKiryUUv+R2Gs/IIwtPPOxukz0hz
	xM1d8CKX9TK+LbQ4W1cqBfeVmb/lAONmYIROOj6CPesotx0kNzY317jRHPjzAAjxZT67kXimjUUud
	rl2AVYGNZHgI8XbDKQ+6D4qYd1p8CuusA8f1tcuhlrN9Cb+DOAdMFAqTJHgYjv4J77YaraFBtH2cr
	lx/92bGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAeu9-0000PG-Vd; Tue, 25 Aug 2020 19:46:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAelx-0000M7-8j; Tue, 25 Aug 2020 19:38:23 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9A6C2075E;
 Tue, 25 Aug 2020 19:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598384298;
 bh=M4HsMpi+RByLc2WfD2hU1auUVsDqshtSVqJUE+BFQVI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oOkLt8Y8H/gwVZuCXJOtYYkPoy7sPNwaLw4UhvOunN6Z8R3ikXyDrTfJfSLfesO9a
 gCmGLV4zq8C6d6N8i4Mm+6pe7XdOVDi/AHw28KlDiLU6apTZNIXzh62bbgT+mDV0hv
 4eC1Vml69ym2WYaSIHI/js2lICJeCRjDeBbYU4m4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Anson Huang <Anson.Huang@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Han Xu <han.xu@nxp.com>, Frank Li <frank.li@nxp.com>,
 Fugang Duan <fugang.duan@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: [PATCH v3 17/19] dt-bindings: serial: fsl-lpuart: Fix compatible
 matching
Date: Tue, 25 Aug 2020 21:35:34 +0200
Message-Id: <20200825193536.7332-18-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825193536.7332-1-krzk@kernel.org>
References: <20200825193536.7332-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_153822_136555_B744FD73 
X-CRM114-Status: GOOD (  13.21  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The i.MX 8QXP DTSes use two compatibles so update the binding to fix
dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
    compatible: ['fsl,imx8qxp-lpuart', 'fsl,imx7ulp-lpuart'] is too long
    From schema: Documentation/devicetree/bindings/serial/fsl-lpuart.yaml

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
    compatible: Additional items are not allowed ('fsl,imx7ulp-lpuart' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Remove moved compatibles.

Changes since v1:
1. New patch.
---
 .../devicetree/bindings/serial/fsl-lpuart.yaml  | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index e82c2cf9fef7..bd21060d26e0 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -14,13 +14,16 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - fsl,vf610-lpuart
-      - fsl,ls1021a-lpuart
-      - fsl,ls1028a-lpuart
-      - fsl,imx7ulp-lpuart
-      - fsl,imx8qxp-lpuart
-      - fsl,imx8qm-lpuart
+    oneOf:
+      - enum:
+          - fsl,vf610-lpuart
+          - fsl,ls1021a-lpuart
+          - fsl,ls1028a-lpuart
+          - fsl,imx7ulp-lpuart
+          - fsl,imx8qm-lpuart
+      - items:
+          - const: fsl,imx8qxp-lpuart
+          - const: fsl,imx7ulp-lpuart
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
