Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C20C433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 19:22:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95E62073A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 19:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dkIPRmZL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="MYnTcWmk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D95E62073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yD9VS1Y6h9f2VLn9tmkAttCrmuJRYmOVrC2JzUCk5vc=; b=dkIPRmZLcMAUXfX65TLh2/X3Ju
	pRpCXxEwTBf2+XI/QZTncb58wAXFU4E1VtCnQkvKoIfmg5iAP4jqdsJXRkiutmyINFqNMCgGg3az6
	Ja8oborbaACbKYeKsqfCGKS5GaJzhqwst6h8BYU5krLoBlKlHhV60wuF1jwqIyDLf0oXWHMMSXbFE
	5XwjQC6idbhXt2y2ehvF6dj3Sif3HD3iBMRHhYkY7smFND3IhOW7X812tDsAywPdJRmM6aR8Lg914
	tcd3Qvn+C4CInMhiqJVJNleQiPrZ1OaL9B11gdbjz49wg4WDExJ3HXjoWAfCmg7MiQGTTNo5+2RFO
	I/Xan2hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBjvp-0006xQ-8F; Fri, 28 Aug 2020 19:21:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBjvh-0006vM-1a; Fri, 28 Aug 2020 19:20:54 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EC8620897;
 Fri, 28 Aug 2020 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598642452;
 bh=tCiKCoT33Ggoi/1v/hk0H+qANkB2eST5EjHvrPEODE4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MYnTcWmka2xDbOWnMi2rNhLPwPrt9uvs9bJsfWUPtY0ZNNmVpfCvhGRcwJ9GrWRnc
 POx6/jYAx9p/vjUpUfoPW9OKrEWN3jzwfUGPEfYIZHU4EuTVkiDfTTaUjFQ7NzY1AB
 1fw1RXTf7I6pueX5kXDnlLVTMOLHR5H2ao5aAYmc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] ARM: dts: imx23: Align GPMI NAND node name with schema
Date: Fri, 28 Aug 2020 21:20:35 +0200
Message-Id: <20200828192037.22897-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828192037.22897-1-krzk@kernel.org>
References: <20200828192037.22897-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_152053_242698_65C5297C 
X-CRM114-Status: GOOD (  14.54  )
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

Device tree schema expects NAND controller to be named
"nand-controller", otherwise dtbs_check complain with a warning like:

    arch/arm/boot/dts/imx28-eukrea-mbmx283lc.dt.yaml: gpmi-nand@8000c000:
        $nodename:0: 'gpmi-nand@8000c000' does not match '^nand-controller(@.*)?'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/imx23-evk.dts | 2 +-
 arch/arm/boot/dts/imx23.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx23-evk.dts b/arch/arm/boot/dts/imx23-evk.dts
index 0b2701ca2921..8cbaf1c81174 100644
--- a/arch/arm/boot/dts/imx23-evk.dts
+++ b/arch/arm/boot/dts/imx23-evk.dts
@@ -53,7 +53,7 @@
 
 	apb@80000000 {
 		apbh@80000000 {
-			gpmi-nand@8000c000 {
+			nand-controller@8000c000 {
 				pinctrl-names = "default";
 				pinctrl-0 = <&gpmi_pins_a &gpmi_pins_fixup>;
 				status = "okay";
diff --git a/arch/arm/boot/dts/imx23.dtsi b/arch/arm/boot/dts/imx23.dtsi
index 18289f6fb1f3..7f4c602454a5 100644
--- a/arch/arm/boot/dts/imx23.dtsi
+++ b/arch/arm/boot/dts/imx23.dtsi
@@ -76,7 +76,7 @@
 				status = "disabled";
 			};
 
-			gpmi-nand@8000c000 {
+			nand-controller@8000c000 {
 				compatible = "fsl,imx23-gpmi-nand";
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
