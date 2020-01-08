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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47602C282DD
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9B5620692
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jan 2020 20:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6lL+F6X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0kSxlvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9B5620692
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Os65L0X71amg2SztMgYkYCCCn+Ry5V++wZoYncRmMbE=; b=o6lL+F6XbdPyu/i4oebptn3XGZ
	UHjopWgvBt5d6gpXc4ysM4kpw3ut35KDnmehFp24SSpNyvSwl7BRpn216pjANth2Npnd4QdKZ1r7/
	8+02XWOV5TDMSjd+q2WiMhgPppvKnRQpVidSTTcds1hChMW0uKH6lCYeR6rDJAMf9aq6/Hai8f6ZQ
	k6d68a77hBHKRSRxa9jnDZ5dsz6TJxbFjGRYiz9gNzKVjg+IFCk00QcL51RD0cswAi4qnEwhxGh6t
	H6bqGdSKSsKuvhBve5GtJOr6BgyLmjA17Y/jCHFoe9lcgr4F/00ugIpeDowXSIxocACARTCU+olCu
	wAcnvRaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipIP7-0002fY-U8; Wed, 08 Jan 2020 20:58:13 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipIKx-0006Pb-I9; Wed, 08 Jan 2020 20:53:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id z7so4852703wrl.13;
 Wed, 08 Jan 2020 12:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=F8uH8Ohf0/3msxdVq/elVtV9phQ+l7EJ3TnSIFW8Fo0=;
 b=e0kSxlvMjAEUSAiUAW4ICM7lkFZ2+g0/XlA56tjVT6RbtvXsMljyPPsICZYaqnXjEx
 1Pl4fd1uchMzmbVCnXpwAADD3730auQp71lV3yeD/fHM/5DzT19YSdDVsjQTAzwJEWRI
 CQmC7v74Akdutq2yKBONZZjXl/KmT5+BX3AiQ80n6/RQGUXtd7pxwsvwMPq1UuRnE0iY
 OM84XVb8kdffdl/ij1JdieMxy4k8CZ++CcuyzQYtaAZ9Bv0NnEH6p+6w68lBsC60WvZM
 stZMy9Q8f9Cj2VTkBiDlSmAXUxENYvar+5YXCp8XxRMxh1XOXQhRKynw0+g0w0gdAyZn
 RMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=F8uH8Ohf0/3msxdVq/elVtV9phQ+l7EJ3TnSIFW8Fo0=;
 b=ebunRywdG9ohhhIROcUOZat7JawSt5hMua32//S31yI3bibLxR/Cw4PFHbhDaLoCye
 4ClhYknJKo2l/xaWnTpe/JlTFnimSXJB94ypuDkqU9aC26CFvVGqbrFkFVTdJfQKI4DV
 1tBGxBbmNzZ6mV5WDIjQ3QLRrm/pyn39d+gVy7DgweQgvcdTZBJxPMIukMipJTjofZYG
 Myltrm1PdG2uhJkDNH/1WgP2BrEkhrAT2KtYBl3liVjala8u4x6Zz6bjLsXQsLybPWe/
 c3734mo0VF43U6i7SB9ez0WYUQ53xJiAAzjZ3kEyQFt6iW+Cj7iT5uvhFXob+naVEKj1
 iwWw==
X-Gm-Message-State: APjAAAWYnz20eYTKQUL4BvxOPEUN4+h9/00qbrNcl7IIHDIuBhKwOOIH
 KAXjjimVclodVInisvwLLY0=
X-Google-Smtp-Source: APXvYqzc+xNsRHv3qmj0V/9o6spPl+YMOp2ERxVsBuT5Qvll3hQ2GWvJTQUwG9znzVyhruZwbxDrog==
X-Received: by 2002:a5d:4e0a:: with SMTP id p10mr6657980wrt.229.1578516834066; 
 Wed, 08 Jan 2020 12:53:54 -0800 (PST)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id c5sm311835wmd.42.2020.01.08.12.53.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jan 2020 12:53:53 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: miquel.raynal@bootlin.com
Subject: [RFC PATCH v1 07/10] arm64: dts: rockchip: add nandc node for px30
Date: Wed,  8 Jan 2020 21:53:35 +0100
Message-Id: <20200108205338.11369-8-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200108205338.11369-1-jbx6244@gmail.com>
References: <20200108205338.11369-1-jbx6244@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_125355_841902_799C6F13 
X-CRM114-Status: GOOD (  11.33  )
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

From: Dingqiang Lin <jon.lin@rock-chips.com>

Add nandc node for px30.

Signed-off-by: Dingqiang Lin <jon.lin@rock-chips.com>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 9a0f77ea4..3f46b8852 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -25,6 +25,7 @@
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		i2c3 = &i2c3;
+		nandc0 = &nandc0;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
@@ -924,6 +925,20 @@
 		status = "disabled";
 	};
 
+	nandc0: nand-controller@ff3b0000 {
+		compatible = "rockchip,nandc-v9";
+		reg = <0x0 0xff3b0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_NANDC>, <&cru HCLK_NANDC>;
+		clock-names = "clk_nandc", "hclk_nandc";
+		assigned-clocks = <&cru SCLK_NANDC>;
+		assigned-clock-parents = <&cru SCLK_NANDC_DIV50>;
+		power-domains = <&power PX30_PD_MMC_NAND>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	vopb: vop@ff460000 {
 		compatible = "rockchip,px30-vop-big";
 		reg = <0x0 0xff460000 0x0 0xefc>;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
