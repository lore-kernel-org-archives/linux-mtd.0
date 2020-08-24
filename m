Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB87C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:08:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A49D2074D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJcgQ2rO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xroCTR8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A49D2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d7+Do5LO8h3vj4GoAsPqg0jSgoVOdMgteOOwuOkwV8E=; b=PJcgQ2rOzZakkH1ldF45g14MC6
	d2P184Y4nzlDVF2QJRmkFnDALBDMP1SXu6pNRosFumTBiZs90B0m/5PjS2C6GPZHHG1GTAi1u4Bua
	Ac0SGUCYuMqdYimPuhd01IQdTDVAka/AaaTAt0KwbBnlI7JuIDaP34Ruk6zOlUE+rhYc7bFdQ/69m
	xur+o7bb0joPDzB7j6+okICR3rCXQgrZ0+xxAS6lsSt0QaDXxis1ojLrOVwOpC06HZBLpa7Ud8o8m
	0c//PKHwfXixXCm22oA/8T1jhxb2ugfJKnDw1tKO3Nr68jhpgXVv3fos2wAVMjHt7mZrvXTCaMom1
	jjmY6ktA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAHoP-0005Jp-S2; Mon, 24 Aug 2020 19:07:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAHoK-0005IJ-Ty; Mon, 24 Aug 2020 19:07:17 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF8FC2074D;
 Mon, 24 Aug 2020 19:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598296035;
 bh=D49DFnKwX3H2+4/JHutRBjl6onsdr+JMHUvotdX4JOA=;
 h=From:To:Cc:Subject:Date:From;
 b=xroCTR8eKxl6V1lvgh/HrBdL5yumIzn+QzqCpV0HmoTNHLBcd3BOlUqvYqiQ83PtV
 +jE0X2cY7O73uflWwXcWluqNlVZ9SdesRA885D2C0dd3UtzB5zoCx2kjOhk6I+djzV
 DXQeTZZ+iNeRWQbKb9Y2vaA8SQNF3ozNUVvJU0vc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Adam Ford <aford173@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>, Robin Gong <yibin.gong@nxp.com>,
 Li Jun <jun.li@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/16] dt-bindings: mfd: rohm,
 bd71847-pmic: Correct clock properties requirements
Date: Mon, 24 Aug 2020 21:06:46 +0200
Message-Id: <20200824190701.8447-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_150717_069207_686F95B3 
X-CRM114-Status: GOOD (  12.45  )
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

The input clock and number of clock provider cells are not required for
the PMIC to operate.  They are needed only for the optional bd718x7
clock driver.

Add also clock-output-names as driver takes use of it.

This fixes dtbs_check warnings like:

    arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b: 'clocks' is a required property
    arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b: '#clock-cells' is a required property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/mfd/rohm,bd71847-pmic.yaml       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
index 77bcca2d414f..5d531051a153 100644
--- a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
@@ -38,6 +38,9 @@ properties:
   "#clock-cells":
     const: 0
 
+  clock-output-names:
+    maxItems: 1
+
 # The BD71847 abd BD71850 support two different HW states as reset target
 # states. States are called as SNVS and READY. At READY state all the PMIC
 # power outputs go down and OTP is reload. At the SNVS state all other logic
@@ -116,12 +119,14 @@ required:
   - compatible
   - reg
   - interrupts
-  - clocks
-  - "#clock-cells"
   - regulators
 
 additionalProperties: false
 
+dependencies:
+  '#clock-cells': [clocks]
+  clocks: ['#clock-cells']
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
