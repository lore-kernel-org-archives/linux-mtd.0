Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EEBC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:43:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A732075F
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evxamAn9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKmfdSDG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A732075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9NTrz0+jrvt9xcZtYLCtel5dB6MuxPFV66Opg47ZNY=; b=evxamAn9Q6vJMoklZZpOkZ+Jdp
	xB7TcHX6nx8zNSteK3z6mpZ8Fa9ZLzVyvD/IgDeMfqet2YRxUnkf5SsmOJue+eOIjgKjUPiJpC7Wz
	H1kCu772Dgr6gI/mb4JIxraiecB2eKgKU4KWaCBootIXlcMNbne64pc8FuWWoPKUAiNSD8/7NWjPm
	jc0ha+G0Wkfz+TMsRNBePSokprka/GJEMSl3KLpOA+Amu5BxV56t1IrgPQv5pJk37Ce6FwMqr9c0x
	cs0Xzov7uOeghvLqb79srLd4kdOEZ6RuNBeR9a5CAaUox1qxJoZahywTeW9FAGpm2MU4sEyEatDo1
	OsFcIX3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAeqS-00036y-Jx; Tue, 25 Aug 2020 19:43:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAela-00005u-ER; Tue, 25 Aug 2020 19:38:00 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1000C20825;
 Tue, 25 Aug 2020 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598384275;
 bh=6idM7c5GeTkd4WF/BwiDQ4VtDP0G4md0yVL4AgXqZC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mKmfdSDG2vq082YwyLlJ8m7u9I6E1jjOvA/Uwz/CqGicy7yQUYyQWkKQ3QlO0PLvV
 z2pbZFtDKBFbAp0KraAjNZV0eWLG8Auj8PgDnyFz9YCxiGB9b0JXJYm3s7tFo1hJF6
 tHLZ3reDn5SKa9azGV1BHhg24NBpKVU84tPciRPA=
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
Subject: [PATCH v3 14/19] dt-bindings: arm: fsl: Fix Toradex Colibri i.MX 8
 binding
Date: Tue, 25 Aug 2020 21:35:31 +0200
Message-Id: <20200825193536.7332-15-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825193536.7332-1-krzk@kernel.org>
References: <20200825193536.7332-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_153759_088488_79E5A44D 
X-CRM114-Status: GOOD (  12.66  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
