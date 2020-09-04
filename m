Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F86C2D0A7
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:25:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7416420772
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iuTyOMTZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1fI7OCKR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7416420772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnNq5HOaEuAhwNXCI+rWxQZRFgncqdiDCXOYWvRliPA=; b=iuTyOMTZMOXzKzh1rYuA/JgWT8
	tI8+TVfL7DjWD3ckOYNiPXJ5kZ+c1qCUJVgOpfQRAV9HNHFREcEYteUPz4rVM7YG3uuf6+PjxNhd3
	x4jR9/5dNUNNFbv1le6jDsIRxY9vRnslCW5AHJyXI0nTgga/5+HzpKfj/JdmExD+KQy6ELcvRi1bq
	H9Y5wKXJHXYVuS9mEpqCZ3E66l25I5Ftszn7h4uGvp2rTmuzcKs+9QLL2EfYH3aFQtPYzs7SDxdHF
	lqI1X6dNM/7rWcyHH05WJ8EDV7yL7qm5VlKpNx8eNDEE0g18uaBcFLMe8raYOBdrrKL7J7tPvhFD7
	T704fApg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDZl-0007OC-SY; Fri, 04 Sep 2020 15:24:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDZg-0007Mz-JE; Fri, 04 Sep 2020 15:24:25 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16B7B20772;
 Fri,  4 Sep 2020 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233063;
 bh=6pQee/lEOtd6XVjbMxZhh087Cotb2fe4tMAUouVEZXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1fI7OCKRsmVbQYS6N2dVp6SPO5K4qz0jslg76k2kM48ER4goWCfSme/YryOk0UzfS
 oJfT7Oi4nQDBp2aBJykUg8ECPs0VynIcSDOBWFJpHOZlNcmdXlmr2cwxVLXPvxAJU+
 D49qN+u9rtCXOjJzO6VCooJVdFYuIOMiTdp8FIHQ=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 01/14] dt-bindings: perf: fsl-imx-ddr: Add i.MX 8M
 compatibles
Date: Fri,  4 Sep 2020 17:23:51 +0200
Message-Id: <20200904152404.20636-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904152404.20636-1-krzk@kernel.org>
References: <20200904152404.20636-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_112424_724588_2239AD02 
X-CRM114-Status: GOOD (  11.88  )
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

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: ddr-pmu@3d800000:
    compatible:0: 'fsl,imx8mm-ddr-pmu' is not one of ['fsl,imx8-ddr-pmu', 'fsl,imx8m-ddr-pmu', 'fsl,imx8mp-ddr-pmu']
    From schema: Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: ddr-pmu@3d800000:
    compatible: ['fsl,imx8mm-ddr-pmu', 'fsl,imx8m-ddr-pmu'] is too long

  arch/arm64/boot/dts/freescale/imx8mm-evk.dt.yaml: ddr-pmu@3d800000:
    compatible: Additional items are not allowed ('fsl,imx8m-ddr-pmu' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Handle also fsl,imx8mp-ddr-pmu
---
 .../devicetree/bindings/perf/fsl-imx-ddr.yaml    | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml b/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
index 9ed8f44adabe..5aad9f4e0b2a 100644
--- a/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
+++ b/Documentation/devicetree/bindings/perf/fsl-imx-ddr.yaml
@@ -11,10 +11,18 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8-ddr-pmu
-      - fsl,imx8m-ddr-pmu
-      - fsl,imx8mp-ddr-pmu
+    oneOf:
+      - enum:
+          - fsl,imx8-ddr-pmu
+          - fsl,imx8m-ddr-pmu
+          - fsl,imx8mp-ddr-pmu
+      - items:
+          - enum:
+              - fsl,imx8mm-ddr-pmu
+              - fsl,imx8mn-ddr-pmu
+              - fsl,imx8mq-ddr-pmu
+              - fsl,imx8mp-ddr-pmu
+          - const: fsl,imx8m-ddr-pmu
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
