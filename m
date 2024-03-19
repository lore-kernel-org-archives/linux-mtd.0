Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA1BC54E60
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2024 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uw64ObE/r4dUAF0D8uFaBpl1D+zFeNubrHgdu3M1/h0=; b=2dAh47Tf/KUgVc
	MqNEZBjfhhZLp/xKUaFZJrha+M1s+Y+7Ax9eBWYVfhe1+SU8Nm5j6+DrcXsO56yKMC3BP40x8vDAW
	ei8qZsu73EI9WHb/2PukCg7oaoZWEWDazIAE2C1KVfvMxLjMgK9Xs3PcDdeBxBacw3n42DsufUGV9
	abHi2DQRHMF6bHXmMjVQ/iTtLEmeRmJR4n9g0YF3NL2D9+eWQ5byDvuP4gRPW9ZvghEAE7/gnSZch
	R3e35lqdpYDslmokKdqx8ZoiiGgAT8AVqxwwlUUnGYNvwtHZDkgz4q2Cvq6BNw6/8Bee/TXdTUJXK
	XoAz0JOBn6tuJRLv+ESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVt4-0000000C7BF-3ulA;
	Tue, 19 Mar 2024 09:36:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmVsh-0000000C6uw-2uTy;
	Tue, 19 Mar 2024 09:35:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1def142ae7bso35128865ad.3;
        Tue, 19 Mar 2024 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710840937; x=1711445737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8lLJjV9sz++A3S70yTL0kgzPdOoYGF0BKRxiCCU5iY=;
        b=SuuS6Ct5fsj/UnKnHlUOOKFp8kggPaQVcUK+acKPNvlBR7ftiFKU1SyW7hJ5scV7Md
         SjTVgNrJvcmytXbYsYQ/PJNuUam7BeUlXMSPSTfIkOBN/23i6DvKtZDumyDPFqmB/RB5
         eULpNjJkj2/Ue/sPaj2gHgdqLWxkQY4l/y4J5e9/PCx+nzQLruN8jdVrtlEAXGOikEAZ
         c3I+lk/wHKxxjhsSxkQuXEo1UHL4hpQTALgm4UANooaD9Ou7HacITAPrvjtz4siLrIyd
         Vl7Tdd7oawE+HiMQ82EOjT9ZREIgC+tdKEy95iaPASOS/oXc9xZDylU4vzxLoHQ59JYw
         xxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840937; x=1711445737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8lLJjV9sz++A3S70yTL0kgzPdOoYGF0BKRxiCCU5iY=;
        b=vq+wnd8+ZaShKw/sKv1Q49CUJiHER++msfSbagJc3gaoDUEjF4yTGEs9PtYhWS6Q4z
         rmexM0OjIu2ymtEIJyDrnjb+yFwzMy8sUB/pfL1FUzQgulB5v7qPNf1jc7r9QKYMM4nv
         WC9pClR2urgsWUQhemqGSaWvWxsHDLF4h3WBXjlUP+NuotMQ2+VSOzxF+ZEjcIejMhtn
         Vdw7eKAj568jr0yZzcGNI5QClJ76Rr3Mb/ZzOMXronkynjB3Qd10eObz3QfqpLkn4MJ3
         bnbr5zs/ux2wHv0jNGKcT71tLnqaXsbcKDQo5ByzxKvKNwIJ9SrltFTnaF5rS6EjfoEn
         SWrw==
X-Forwarded-Encrypted: i=1; AJvYcCVkH9D4kVbM0AmowxlUsQV4w/nwJa+bLAzBYixAee4EjUQ35MKDPzYeHWQa+4qH21Pczb9a8MesyXgUuVCzxRBeL8wYHeNkJbK8ZAYNyC8mJ5GGxvQiKHtwxxEhDz2RRfwEuXDWxSM6+xrV66Pf32OuUTgc
X-Gm-Message-State: AOJu0YxrLi6kMn/tH4bG6MTkPugP7fl6IsJ6B2Wo9wZU6CyG+yzXqWqf
	Hu4z9wOFPJdqBNS5w2at0r5DhDl9DdFgTi4eKz1Rmm2H7Y7V+usahjRnGgQJXAQ=
X-Google-Smtp-Source: AGHT+IGMXcgzPbiRbAaZnXiJWR2s96AphzV/ePKBVZUQDbytucyVA3PArFmkTCYWRUbf042LO6gbGA==
X-Received: by 2002:a17:902:cecc:b0:1dd:8bc5:afe3 with SMTP id d12-20020a170902cecc00b001dd8bc5afe3mr18719900plg.1.1710840937439;
        Tue, 19 Mar 2024 02:35:37 -0700 (PDT)
Received: from localhost.localdomain ([129.41.58.3])
        by smtp.gmail.com with ESMTPSA id n5-20020a170903110500b001ddc0bc5934sm10942432plh.249.2024.03.19.02.35.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:35:37 -0700 (PDT)
From: Manojkiran Eda <manojkiran.eda@gmail.com>
To: patrick.rudolph@9elements.com,
	chiawei_wang@aspeedtech.com,
	ryan_chen@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	manojkiran.eda@gmail.com,
	jk@codeconstruct.com.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 3/4] ARM: dts: aspeed: Add eSPI node
Date: Tue, 19 Mar 2024 15:04:04 +0530
Message-Id: <20240319093405.39833-4-manojkiran.eda@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240319093405.39833-1-manojkiran.eda@gmail.com>
References: <20240319093405.39833-1-manojkiran.eda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_023539_967859_6CCB9A34 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This commit adds eSPI to the device tree for aspeed 5/6th
generation SoCs.

Signed-off-by: Manojkiran Eda <manojkiran.eda@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g5.dtsi | 19 +++++++++++++++++++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
index 04f98d1dbb97..eaf7d82b6f46 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g5.dtsi
@@ -343,6 +343,25 @@ sdhci1: sdhci@200 {
 					status = "disabled";
 				};
 			};
+			espi: espi@1e6ee000 {
+				compatible = "aspeed,ast2500-espi", "simple-mfd", "syscon";
+				reg = <0x1e6ee000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e6ee000 0x1000>;
+
+				espi_ctrl: espi-ctrl@0 {
+					compatible = "aspeed,ast2500-espi-ctrl";
+					reg = <0x0 0x800>,<0x0 0x4000000>;
+					reg-names = "espi_ctrl","espi_flash";
+					interrupts = <23>;
+					clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+					status = "disabled";
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_espi_default>;
+				};
+			};
 
 			gpio: gpio@1e780000 {
 				#gpio-cells = <2>;
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index c4d1faade8be..094e14442101 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -454,6 +454,26 @@ video: video@1e700000 {
 				status = "disabled";
 			};
 
+			espi: espi@1e6ee000 {
+				compatible = "aspeed,ast2500-espi", "simple-mfd", "syscon";
+				reg = <0x1e6ee000 0x1000>;
+
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0x0 0x1e6ee000 0x1000>;
+
+				espi_ctrl: espi-ctrl@0 {
+					compatible = "aspeed,ast2500-espi-ctrl";
+					reg = <0x0 0x800>,<0x0 0x4000000>;
+					reg-names = "espi_ctrl","espi_flash";
+					interrupts = <23>;
+					clocks = <&syscon ASPEED_CLK_GATE_ESPICLK>;
+					status = "disabled";
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_espi_default>;
+				};
+			};
+
 			gpio0: gpio@1e780000 {
 				#gpio-cells = <2>;
 				gpio-controller;
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
