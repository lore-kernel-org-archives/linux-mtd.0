Return-Path: <SRS0=Gzls=3N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC99EC2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:32:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFFA20709
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Jan 2020 16:32:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FTYsRhHc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aypsDmrw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EFFA20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cz2nDlFS7plxYB5wzFZRvRNxuQWfIC0uzT4SWI/lffo=; b=FTYsRhHcElWtUcH/fjWT6pCIj8
	ZdiTrxi53RkRtejUDSY6DYZpNam2CDlvAw8GW+UfBmw1+Fk8ERyU7RCelcShXwl6MmGZKPUahq7HT
	TwvtQlkkCRli5F/OVMTwn/WccJjw5glPHJFhQ5bSDmA9c5elMggZ1BzP+el7EE0rPB0ag+/bUsF5k
	aOXmkkDAF96H8Vsm9y4VRYpClfJhQk1ofBB2hfTzYAe0OyhvwliaGmEVsY8s2am45hT4EvdCBvPtj
	s3Q7AU3Cpwkk1EGiBBMzBeZLfr0/6vBUPIflT14b0vfJlXOm2W0yvT4lzUj01vBETcZk27r/eMIaQ
	gvY/Cl6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iv1sg-0004IH-Ra; Fri, 24 Jan 2020 16:32:26 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iv1qb-0002VG-PO; Fri, 24 Jan 2020 16:30:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id c14so2701042wrn.7;
 Fri, 24 Jan 2020 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MtdDB+Ad0iU6rgEXiY5ujEmZtuAHwTecRPkyhRx/V2g=;
 b=aypsDmrwK+xusSVzi2cZtehPj6u2rMYRKcLIcd7vaZKL9HP3ckHFO7r/vJcuSZRKUP
 MiwlmPlW2p0W1mVmSYtktOpTy8maE6t1NQBtEdCjYGq0y6q038wHvYwM7go3ufq4MQHC
 WiTZB1YzTgRPDQG3JhNHenWlhlbgC4jnLXwF1iLCKsHDPhrPQBVY1Kgt7+G1kw6sPrxL
 H5m6wpSxHXCjZIORK5n7hH3MnwSMsm88lWdnqpMU7Aa++P5WbH/B+8Fv9G/yt1jMLFnZ
 Pz9sVgYp+e26LgWBevXEdoXFJlfa93dx5o9ywNTN5WguJJ0vYnwnqpaSycneBzh8GStZ
 /U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MtdDB+Ad0iU6rgEXiY5ujEmZtuAHwTecRPkyhRx/V2g=;
 b=taJ8492pp3d0klZ6wazsgFZSlgTfWil6BKsyDSmXS8BAOgm4zMf91Zy2t5hTInL8+M
 qTQshgVPwwPgSeyobXOsND2LDenHok8cNk6w6MzB0SkCGv8it6wudnVqhNSsBCQ793tH
 Wbmyy09bseuqdBmN46VpJRWUHaDVPNKs3kzBCZZvRIaOTQZShEwULoHA1Ea12gh3loEl
 g4w4TnC0kSLJ/6iZsFnC0l0KvWQDhSEXMjAFWH/4h85pLsSFlh+wGxpMg9+UbWIx3GGr
 9uW25Jr8Qwl2UtDxUyWqrLl6jRwmGWhQJsEre4sTFbHamoFxl/ZvK1rLVbJM9NKJq59M
 l5Bw==
X-Gm-Message-State: APjAAAUxZ2BPK/z9/vtw2oVoJa52/q4ADh8qnq2GseeEfYzOZ2gV5Wla
 3m0mi4hXQQ/PlY25EDBCHTE=
X-Google-Smtp-Source: APXvYqxFNPosxjrpJ4H+Ptr3l58QXTCusDkQ0TCFfKpKOQXiyqk42bKBWvVxtpm37CGxyH9wfVwwKg==
X-Received: by 2002:a5d:45cc:: with SMTP id b12mr5002968wrs.424.1579883416466; 
 Fri, 24 Jan 2020 08:30:16 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id 205sm1977304wmd.42.2020.01.24.08.30.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 08:30:16 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v2 05/10] ARM: dts: rockchip: add nandc nodes for rk3288
Date: Fri, 24 Jan 2020 17:29:56 +0100
Message-Id: <20200124163001.28910-6-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200124163001.28910-1-jbx6244@gmail.com>
References: <20200124163001.28910-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200124_083017_935626_EC3DA5E8 
X-CRM114-Status: GOOD (  10.60  )
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
 richard@nod.at, shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, yifeng.zhao@rock-chips.com,
 linux-arm-kernel@lists.infradead.org, heiko@sntech.de
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
 arch/arm/boot/dts/rk3288.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288.dtsi
index 415c75f57..ebb833a1a 100644
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
@@ -596,6 +598,24 @@
 		status = "disabled";
 	};
 
+	nandc0: nand-controller@ff400000 {
+		compatible = "rockchip,rk3288-nand-controller";
+		reg = <0x0 0xff400000 0x0 0x4000>;
+		interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC0>, <&cru SCLK_NANDC0>;
+		clock-names = "hclk_nandc", "clk_nandc";
+		status = "disabled";
+	};
+
+	nandc1: nand-controller@ff410000 {
+		compatible = "rockchip,rk3288-nand-controller";
+		reg = <0x0 0xff410000 0x0 0x4000>;
+		interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_NANDC1>, <&cru SCLK_NANDC1>;
+		clock-names = "hclk_nandc", "clk_nandc";
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
