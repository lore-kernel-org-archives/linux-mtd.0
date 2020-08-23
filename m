Return-Path: <SRS0=ofzb=CB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D88C433DF
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:20:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 611852072D
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Aug 2020 16:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N0J0hyLR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WU2RoaJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 611852072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiStYt2Td0IPM3nZ/nYktjKp3j254vUO9ahnSggENT8=; b=N0J0hyLRgr6r2hKs3+pi99jMi9
	x0omoIi9+rWR403U2W9kRns1aN0d3xf4nSV9zmd/vCbP7x769VVM4oDZ/WhSy01jrAL39EKXPatbn
	Zl6HKCVN06mCBdVCiWnKO0Dz4DMidRnNAzfzKhBabVDO6Rn7fKeeCWOaR9Fr5dV8mBJX8xNrR5C6S
	FMe2ki9v5JaV951Pc4TMBOuxaCv7hPcio+sRvAMtLjCbEursBP//W2/x9XAmH7rSOSlkfPv9EdvKZ
	UdG3cOouVOl8RbMnbbrHdmZr07O7zxiK7DKVLOkPVkmW4Q7W91c5zPH0d0HnKZ/qlAmLD08GTghTi
	DF4xEWQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9sij-0006AI-PM; Sun, 23 Aug 2020 16:19:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9sfo-0004Kh-Gz; Sun, 23 Aug 2020 16:16:49 +0000
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF7222076D;
 Sun, 23 Aug 2020 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598199407;
 bh=zn6SwQvRqTQI9Av55ZFXzkgJGiEIGN9PfDf4Q2x9mwU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WU2RoaJcPkOYCWG3H88Wf9mVI6pdoaJGzjaINJp+gE0Tka89iqCWOu59r4O0cu7IK
 RjVRixJieVJLRUEee6NA60Ent4ezbm3dToAQyOXK8VLmBjk5WvxnAsvZu2Go3V/Ul5
 4gdOZCyyM5CwvjCEagYWGLTouKHjaCAuwXX6NyV4=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 11/22] dt-bindings: thermal: imx8mm-thermal: Add i.MX 8M Nano
 compatible
Date: Sun, 23 Aug 2020 18:15:39 +0200
Message-Id: <20200823161550.3981-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200823161550.3981-1-krzk@kernel.org>
References: <20200823161550.3981-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_121648_693301_A94B9300 
X-CRM114-Status: GOOD (  11.85  )
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anson Huang <Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DTSes with new i.MX 8M SoCs introduce their own compatibles so add them
to fix dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
    compatible:0: 'fsl,imx8mn-tmu' is not one of ['fsl,imx8mm-tmu', 'fsl,imx8mp-tmu']
    From schema: Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
    compatible: ['fsl,imx8mn-tmu', 'fsl,imx8mm-tmu'] is too long

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: tmu@30260000:
    compatible: Additional items are not allowed ('fsl,imx8mm-tmu' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/thermal/imx8mm-thermal.yaml    | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
index 38852877b8e3..89c54e08ee61 100644
--- a/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/imx8mm-thermal.yaml
@@ -18,9 +18,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mm-tmu
-      - fsl,imx8mp-tmu
+    oneOf:
+      - enum:
+          - fsl,imx8mm-tmu
+          - fsl,imx8mp-tmu
+      - items:
+          - const: fsl,imx8mn-tmu
+          - const: fsl,imx8mm-tmu
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
