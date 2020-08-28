Return-Path: <SRS0=a+HT=CG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F5AC433E6
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:53:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A4420848
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Aug 2020 16:53:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYpqG77/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ec2OVget"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A4420848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZyp6yBwqanelbmuodB5jsf/25e/OEOX2RoW6HQfk9A=; b=qYpqG77/BqV9GHNS55RZ3rjpMZ
	L455e5x5jLJTqCYadv51RoJbacxmC2/Zw4zzLWUXLO9BCssYlQSKS54m0YRSkrnwwJu4nlW4tcx3y
	CoT3mAYN9POBEuAVDJT0dRYeHQbOf0cLJA1AGWGjYKpg59A8C2M7yvdXqYf23fVFLQVU3gEi7YEw8
	16JrZ1JucJAHXJ1uRwqnkzz/k+mQ/qnSFCHi9YDKyZazjnpo7iuGEJmY9sQfe8GybYOY57/6alusx
	bIFC+t2DCZv9Slq4hn6CibtjiKVl88uBPapK3n/JehlZzKeXw7yLPlWP9N1Mpo6wdbay9To7GZ00M
	HBPADFcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhbz-0006iA-7y; Fri, 28 Aug 2020 16:52:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhZH-0005D5-Nw; Fri, 28 Aug 2020 16:49:36 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 053032100A;
 Fri, 28 Aug 2020 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598633375;
 bh=ldF6UHOHHJVbzEDB7ln+iQ6yBk9UNL7dYnbB0GYXwD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ec2OVgetZCt/A8lcosbZYAsAPiVGkVKlLMJh3LlHj3h0NCeyw36wC3rVsOpgbaGq8
 TaqnrNwQN5SwVdAFALOI/kpb1842OVoNHLyFzK9vNmSw7LkR65q4SI4zyPRzwhHebC
 QACHh1WhDBTCafZuyt0GS2zYWkQDYdhRtuba0i4I=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Anson Huang <Anson.Huang@nxp.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Han Xu <han.xu@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/19] arm64: dts: imx8mm-evk: Add 32.768 kHz clock to PMIC
Date: Fri, 28 Aug 2020 18:47:39 +0200
Message-Id: <20200828164750.10377-9-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828164750.10377-1-krzk@kernel.org>
References: <20200828164750.10377-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_124935_946767_FBD84FCF 
X-CRM114-Status: GOOD (  14.36  )
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

The ROHM BD71847 PMIC has a 32.768 kHz clock.  Adding necessary parent
allows to probe the bd718x7 clock driver fixing boot errors:

    bd718xx-clk bd71847-clk.1.auto: No parent clk found
    bd718xx-clk: probe of bd71847-clk.1.auto failed with error -22

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index 3cb8b6bcb657..0115f07bbc9d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -149,6 +149,10 @@
 		interrupts = <3 GPIO_ACTIVE_LOW>;
 		rohm,reset-snvs-powered;
 
+		#clock-cells = <0>;
+		clocks = <&osc_32k 0>;
+		clock-output-names = "clk-32k-out";
+
 		regulators {
 			buck1_reg: BUCK1 {
 				regulator-name = "buck1";
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
