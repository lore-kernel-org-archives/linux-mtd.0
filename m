Return-Path: <SRS0=0ZJr=25=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6015FC282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FEF420692
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZPwBimNE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOLe1VNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FEF420692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=12B+mTBrgs2dFgLedPilqmiFDGqdaTr0tSxdPXaD1+I=; b=ZPwBimNEIDEGQ0DuxsRHCrQOIV
	qZS4/mHdp6aJEpJOrYabhDkUlkd/hXrOwzRVHmGQ1aIcnkClFaKBpUWEgGhizaJT5jjRuQRp7fQfe
	yKYN8JiYLaaNiEigozlwYc6s5mllA5Hv+u+wo8/yM/FrVEVVR+dANBxGflJMwsCcj8bSuV8zeSxc/
	lcxjUrdTATvbKlAa1coQ2oxJIy64JVdM0Z+8dl6a/R1KcGuoiHoCxVexNAv3iwadRKSYP1JPqKhOo
	tmjkNm5EhVkTlO91/N8yxm0tCEaHwwNd40V/sTUVg5GMPq+f0/MrguDQLrKIKk5PJQb1veL5wGzrs
	nRZD749w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipINL-0001Cm-FK; Wed, 08 Jan 2020 20:56:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKv-0006O0-8j; Wed, 08 Jan 2020 20:53:55 +0000
Received: by mail-wr1-x443.google.com with SMTP id y17so4943270wrh.5;
 Wed, 08 Jan 2020 12:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6wZ7x22wSXIg5bl9Oow5ZKhvHAS5XTDENGb2Cb6nT5M=;
 b=kOLe1VNJ78Dhvq4QYaA8kd+GrZDXdFnLdaMSxdj9vIFC69Ismok3BjzzU7GMw0oKif
 k4mxQm8XjndK9iiVCjRHL4Lh1gzaDDD//2CzGtuXg4JuaaAJqK5KDBnstz28OzlEgFsE
 zfO5/JVdsbN20xILLbDCsOTqGHJpL3tLJWoGhYoG5Cc0pUflX06IzdzZcc1RUVYwS28+
 yclPK7y9D5XuVrgHlV+wqg7cJArx1ZlPl/yejz7kDeYPVEch/yKA4dQyy3YTWHYjgwf/
 5pj/FLaZ36chPFoSyWV+HkLs3x2rUzoRgK5zcALjA8CRw1DXS8OKJ48SJmu+Cx0/CTQs
 a7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6wZ7x22wSXIg5bl9Oow5ZKhvHAS5XTDENGb2Cb6nT5M=;
 b=RCq6F3hb0gpIfNJ2gg2KqeJZHdhO0nPaS5ai+6rPacc5WNqxupiLuJRpZD4G66AyQr
 yQa/gr4JzO4zGUy0Glenu4hfHO6Q2ypO7D2bqyqht8+9pGdx0jFjt9bCfmK+KU9Q1tb8
 qEjLft5pAFtsdk/Ps49KnWQuaP2i+uKAjUax3DfvAGSbyfSU01aRiNP8C16N4/1GUj5D
 IsSh4jJ/xrLtcpKz1q03ukVQ4cre6ccpn9VPfvjv/xTDWxfYzbkNoKxVl1iFiK4YSAQM
 Ua+otsDST6rT2Z+Jh6fyA8Vor/HpODsNBtHkjcdsEIUHN0yVYiX2Rp0o+uFi19evYyc4
 TYUg==
X-Gm-Message-State: APjAAAVjlEvxDChJxjqrmPO4eeMxfgM9nq1+aDPuwZDoj0173qgdyoe4
 dVhsNCqFtipsztEKXRxCfsE=
X-Google-Smtp-Source: APXvYqy2OynSIqj7hv4Oh/Z1uZuPF0gapDkWQQTlinfn9ySqo2/ZfkPS/B0kyZUjHdYpsFFpyQngBQ==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr6594981wro.209.1578516832028; 
 Wed, 08 Jan 2020 12:53:52 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:51 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 05/10] ARM: dts: rockchip: add nandc nodes for rk3288
Date: Wed,  8 Jan 2020 21:53:33 +0100
Message-Id: <20200108205338.11369-6-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125353_423021_13188123 
X-CRM114-Status: GOOD (  10.89  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 heiko@sntech.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Jianqun Xu <jay.xu@rock-chips.com>

Add nandc nodes for rk3288.

Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rk3288.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 415c75f57..704a101d8 100644
--- a/arch/arm/boot/dts/rk3288.dtsi
+++ b/arch/arm/boot/dts/rk3288.dtsi
@@ -30,6 +30,8 @@
 		mshc1 = &sdmmc;
 		mshc2 = &sdio0;
 		mshc3 = &sdio1;
+		nandc0 = &nandc0;
+		nandc1 = &nandc1;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -596,6 +598,28 @@
 		status = "disabled";
 	};
 
+	nandc0: nand-controller@ff400000 {
+		compatible = "rockchip,nandc-v6";
+		reg = <0x0 0xff400000 0x0 0x4000>;
+		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_NANDC0>, <&cru HCLK_NANDC0>;
+		clock-names = "clk_nandc", "hclk_nandc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
+	nandc1: nand-controller@ff410000 {
+		compatible = "rockchip,nandc-v6";
+		reg = <0x0 0xff410000 0x0 0x4000>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_NANDC1>, <&cru HCLK_NANDC1>;
+		clock-names = "clk_nandc", "hclk_nandc";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	usb_host0_ehci: usb@ff500000 {
 		compatible = "generic-ehci";
 		reg = <0x0 0xff500000 0x0 0x100>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
