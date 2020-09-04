Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60C2C433E2
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:26:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F3B2074D
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:26:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yXAsdVrx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="z7iZ9wUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F3B2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nMUVk2ALOBKL3USq2kVu+WCsF10yycGinu9dfvNAbeQ=; b=yXAsdVrxSFcsY229wRC8FaQ2Gx
	arn4ww6WPLRYz9Gc6IvngVbDOmJVm63KPIj0jJUzPa17WWZp55Vpe8y5U4ZBsSi4AcM6O6PgBysEr
	4zn01bowZSLR6kAjvyY2dRKGPTexHaX1cWPYH0Ksn8qB8Zz/ef09khfkJri2qJYzCbQDd2QDDk5Dg
	jqLqSdDklCnrOmuVhLt578TqMIC+eHIxndBSnoJ+nA/jiybC9RnlIr1b8qV5uOvgSOksBNBUu3Gdh
	PQKgHTlOJ8Su4VsDtpfnanf/JdfhTEOBwctDhfD/fgK29DX5H8myrRqgZ/bLuVP/ExkhzR38A4nbk
	tXGnQ0wQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDak-0007oY-1L; Fri, 04 Sep 2020 15:25:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDZu-0007R0-34; Fri, 04 Sep 2020 15:24:39 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A5552084D;
 Fri,  4 Sep 2020 15:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233077;
 bh=v4kspojzNvFxtIF19ahKwZXqd6Y9OL3DS8cTRXDb9qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=z7iZ9wUQJIOXCrS8Q/zfdNYzy5666J8kslGAxJ2kaesaLs6cIEvHykP9AgV35fqYG
 Rr/V6umH7EEeuBZw/1fohrgXRkmeky2fJrfqCa0zW/jLeUAzK4Rl055vvzWwajE2eg
 oo1CnqGzgSuo+lMG36bsogYz47AZtQYWgrSKeip8=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 04/14] dt-bindings: serial: fsl-lpuart: Fix compatible
 matching
Date: Fri,  4 Sep 2020 17:23:54 +0200
Message-Id: <20200904152404.20636-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904152404.20636-1-krzk@kernel.org>
References: <20200904152404.20636-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_112438_241574_0304257F 
X-CRM114-Status: GOOD (  12.26  )
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

The i.MX 8QXP DTSes use two compatibles so update the binding to fix
dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
    compatible: ['fsl,imx8qxp-lpuart', 'fsl,imx7ulp-lpuart'] is too long
    From schema: Documentation/devicetree/bindings/serial/fsl-lpuart.yaml

  arch/arm64/boot/dts/freescale/imx8qxp-mek.dt.yaml: serial@5a060000:
    compatible: Additional items are not allowed ('fsl,imx7ulp-lpuart' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

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
