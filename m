Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94870C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 327672078D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 19:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tUJfQlsj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFcrLVjO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 327672078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lpLjpv+nGAoSLZVh8SKEXTz0k2NhTJeMk3h5TLnhSU=; b=tUJfQlsjtcMIDqyWw314CKabev
	hYXJ/zS7DjeOpc2MuB5pwHSykZX5fGH0H0fT6/y3IYp+mHc++mwkMQCzPx5vA1haIe9RvMBP5cgUs
	efhKNQzkydy5EcN1hGWZb7nGWGeo0dU5LOp6YsCkA64IlLMeifOlJWgJrAYnjgbrcGyYrstlTLNUy
	8HagwKlZg+9guaYiV5T5TRZz/vD/Y/0yFEyyO2Ut5MVCgIhxkbPSwXvMDcsToFIG03xXulV8+cJYd
	01A9jEbfHJEgrqE9qOBoHAX7C8V+JVHAaNBtVUghGSxDxfsjS8nd8uH4E37XptFCAETwKpYWsx509
	SPV+pyTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAHs3-0007Ha-0C; Mon, 24 Aug 2020 19:11:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAHp5-0005b9-EL; Mon, 24 Aug 2020 19:08:05 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B6EF20866;
 Mon, 24 Aug 2020 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598296082;
 bh=Hn72MHPN13T3SxFJctnkzgUT/lUEXMXAJFvr00iCQY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RFcrLVjO+Nfn6MUqrRxAufmBkUBYLGbY9D66tylHuSlGgc6JluYirjB7joGQWyrEV
 j1zHwheeQZ0xmrQ3EdGCsOVGiyptwnyZMOp2bLqNolPn3/GOPL9G+SKokZJyhT55Xb
 CYoXGAHu7gZZbRGZp8mbQuJvtb+FO1AxUGDJLhiE=
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
Subject: [PATCH 10/16] arm64: dts: imx8mq-evk: Align pin configuration group
 names with schema
Date: Mon, 24 Aug 2020 21:06:55 +0200
Message-Id: <20200824190701.8447-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824190701.8447-1-krzk@kernel.org>
References: <20200824190701.8447-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_150803_683254_E118174F 
X-CRM114-Status: GOOD (  14.47  )
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

Device tree schema expects pin configuration groups to end with 'grp'
suffix, otherwise dtbs_check complain with a warning like:

    ... do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index a088831d2e24..7c6808814856 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -407,7 +407,7 @@
 		>;
 	};
 
-	pinctrl_reg_usdhc2: regusdhc2grpgpio {
+	pinctrl_reg_usdhc2: regusdhc2gpiogrp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_SD2_RESET_B_GPIO2_IO19		0x41
 		>;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
