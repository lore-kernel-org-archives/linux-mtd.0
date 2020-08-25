Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 117A7C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:41:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B612075E
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 19:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WB8v6Frt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wZYN9o64"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B612075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWAROORp184rs45IPUNAm55IBiFoGT0XLunt8VSWuN0=; b=WB8v6FrtoDEbePhA5PyDjBi6qK
	6r3ELBoPzIaRmjYcYflWbmUx1e+wOmdBtvcdQw6iGYtw32HABoiqJM7AOT209DsgNptR/Edbf8fyZ
	6jnLeEcMt1cOQJ/nlusBPavXtFNY3bh/MUmy/sZKe1Alp4E+v93mBbarxaIti++9IReJKyVGODqyB
	AtONouN+sH0tLc8/L/DK5N1T8q5Dydzl0Bi1+xgkalG913WXQg1D92xvEnJkzys3RGHKXr6nCpgNJ
	RG+rJg+DFrn+4U3Ir+gsGukCHKWUzSogtZu6gEuj6fWSoY3b3GIKaBgVH5hfXXw2hnUVmyCY4bZAk
	qC45qGsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAeoN-0001tx-SO; Tue, 25 Aug 2020 19:40:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAelK-0008OQ-Pb; Tue, 25 Aug 2020 19:37:43 +0000
Received: from localhost.localdomain (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79B9B2076C;
 Tue, 25 Aug 2020 19:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598384261;
 bh=oLRBjrakobO00fQoSHuH7N5PbZAoKW+gBHMvclqPiN4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wZYN9o640+VFHGKh1osxq8NjcnAVTCAs0ov9HzZBc6xlW9uvTt88RXvE/chPYzK1A
 8Z5yemHpf3GD/1tQGnMTagBv5e1hNVAhv3XYkXtJCM54QXePe9Xq2vdBnkl3U5MbXK
 CKWDGAtOnMYsoXLtfGVazUeI07XZvl30zs0l+7HU=
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
Subject: [PATCH v3 12/19] dt-bindings: mmc: fsl-imx-esdhc: Fix i.MX 8
 compatible matching
Date: Tue, 25 Aug 2020 21:35:29 +0200
Message-Id: <20200825193536.7332-13-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200825193536.7332-1-krzk@kernel.org>
References: <20200825193536.7332-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_153743_065985_9AC212B7 
X-CRM114-Status: GOOD (  13.07  )
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

The i.MX 8 DTSes use two compatibles so update the binding to fix
dtbs_check warnings like:

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
    compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long
    From schema: Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml

  arch/arm64/boot/dts/freescale/imx8mn-evk.dt.yaml: mmc@30b40000:
    compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was unexpected)

  arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: mmc@30b40000:
    compatible: ['fsl,imx8mn-usdhc', 'fsl,imx7d-usdhc'] is too long

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Remove moved compatibles.

Changes since v1:
1. Handle also fsl,imx8mm-usdhc and fsl,imx8qxp-usdhc
---
 .../bindings/mmc/fsl-imx-esdhc.yaml           | 37 ++++++++++---------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
index 10b45966f1b8..e71d13c2d109 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
@@ -21,23 +21,26 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - fsl,imx25-esdhc
-      - fsl,imx35-esdhc
-      - fsl,imx51-esdhc
-      - fsl,imx53-esdhc
-      - fsl,imx6q-usdhc
-      - fsl,imx6sl-usdhc
-      - fsl,imx6sx-usdhc
-      - fsl,imx6ull-usdhc
-      - fsl,imx7d-usdhc
-      - fsl,imx7ulp-usdhc
-      - fsl,imx8mq-usdhc
-      - fsl,imx8mm-usdhc
-      - fsl,imx8mn-usdhc
-      - fsl,imx8mp-usdhc
-      - fsl,imx8qm-usdhc
-      - fsl,imx8qxp-usdhc
+    oneOf:
+      - enum:
+          - fsl,imx25-esdhc
+          - fsl,imx35-esdhc
+          - fsl,imx51-esdhc
+          - fsl,imx53-esdhc
+          - fsl,imx6q-usdhc
+          - fsl,imx6sl-usdhc
+          - fsl,imx6sx-usdhc
+          - fsl,imx6ull-usdhc
+          - fsl,imx7d-usdhc
+          - fsl,imx7ulp-usdhc
+      - items:
+          - enum:
+              - fsl,imx8mm-usdhc
+              - fsl,imx8mn-usdhc
+              - fsl,imx8mp-usdhc
+              - fsl,imx8mq-usdhc
+              - fsl,imx8qxp-usdhc
+          - const: fsl,imx7d-usdhc
 
   reg:
     maxItems: 1
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
