Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD64C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 16:33:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 472C62067C
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 16:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rcIHaSsl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SNtHfi1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 472C62067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd2rSN0VWB8da7GfjR2WWGQOCi36ssoJaSRH6bB49Lc=; b=rcIHaSslvU7Qae70WkGXDJAfln
	D+X5SSvpBWcQ5pTe0/kqGZB7ifrx8pjiTxgNQfBa5FD/CIT30tc2iYXQCZH48t9yfcK9WlrVxzlg2
	d25q2zSmdGzEDkleAlMmSMzJ70+NmhXIrW8vD6w8+t/ACbC6q/hkwLAaNPgB+kUbLP7Td/JZDbibP
	JhRPB20tFmbFx7Zzi57Kcl+pziwdbXjG4EsCkmTrKAdFfxPxfNht47har65qcaUpFNg9mmArToBP6
	WFUmeClRCY6nyQGKX+IRQ8N77mERTngsjVZUQHvlQ5uEMV+AkuU4y/sylAUAA8/So+PrArJ/4aUfD
	S/fsdUEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAFPH-00028Z-Lj; Mon, 24 Aug 2020 16:33:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAFKz-0007qN-JH; Mon, 24 Aug 2020 16:28:53 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7115420738;
 Mon, 24 Aug 2020 16:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598286528;
 bh=oGMgQUbt8WNzS5RCzjRyum21Cxzr14wZYyuSrHfBP2M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SNtHfi1f78SmcdBGTBgoM3jOejs7NERNPLniDOZ0H5575eGcUlaZOep8EqmBUNqol
 BE7Yaxey7A9qot+A3EXHg8WwA6MRwvzewtdD3KNSb2aMBuTvN+uKghNuNLfeZH6oN0
 IYp/ElKvhyXZAMp5GMmiwbLwAQBn13+olpuwuipc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guenter Roeck <linux@roeck-us.net>,
 Li Yang <leoyang.li@nxp.com>, Han Xu <han.xu@nxp.com>,
 Frank Li <frank.li@nxp.com>, Fugang Duan <fugang.duan@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 14/19] dt-bindings: arm: fsl: Fix Toradex Colibri i.MX 8
 binding
Date: Mon, 24 Aug 2020 18:26:47 +0200
Message-Id: <20200824162652.21047-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824162652.21047-1-krzk@kernel.org>
References: <20200824162652.21047-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_122850_071130_1AB40C4A 
X-CRM114-Status: GOOD (  13.61  )
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

The Toradex Colibri i.MX 8 Evaluation board has two Toradex compatibles
so it needs separate entry.  This fixes dtbs_check warning:

  arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: /:
    compatible: ['toradex,colibri-imx8x-eval-v3', 'toradex,colibri-imx8x', 'fsl,imx8qxp'] is not valid under any of the given schemas (Possible causes of the failure):
    arch/arm64/boot/dts/freescale/imx8qxp-colibri-eval-v3.dt.yaml: /: compatible: ['toradex,colibri-imx8x-eval-v3', 'toradex,colibri-imx8x', 'fsl,imx8qxp'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 37592e7bfee9..377fc2a4c159 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -379,7 +379,13 @@ properties:
               - einfochips,imx8qxp-ai_ml  # i.MX8QXP AI_ML Board
               - fsl,imx8qxp-mek           # i.MX8QXP MEK Board
               - toradex,colibri-imx8x         # Colibri iMX8X Module
+          - const: fsl,imx8qxp
+
+      - description: Toradex Colibri i.MX8 Evaluation Board
+        items:
+          - enum:
               - toradex,colibri-imx8x-eval-v3 # Colibri iMX8X Module on Colibri Evaluation Board V3
+          - const: toradex,colibri-imx8x
           - const: fsl,imx8qxp
 
       - description:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
