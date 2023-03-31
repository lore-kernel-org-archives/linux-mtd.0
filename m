Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75527C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBCtQH7I9hBg5vqE2Xpxh2RneAgcbpFeZyB6JkoDDZw=; b=ZTSwAE04MkRZ0d
	F5nxIh9HPXPZD+j/i3qIIDE7glA9lZZgK8LMZs8tIc1UeRg+Jx7V95zIVJseJ4dPuRcHkZZP3j3J5
	v/i+wSd+m4pmC8ZjCu+RS5CntRyzFqNc39wtQd4spBKAVA3NsMQI1ocloY3Bll+1xgetF7pVsoCeF
	2uVO/QWJETEQEkYA8h2QXgvDdWiyRNngGwZK8kUdV1USuhcVnbEbg2bupXwCxlq0OUxFxVo9w2KyE
	1Tyu1T8PGLDoeuzTKqwBghO+a9X5x+N00h+lHrxDav1gzG/KtDXInk58eLlM+k2qnpsGxAEniHsyY
	NTsezaBXIWT2QLDZrqwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBMJ-006lRy-0B;
	Fri, 31 Mar 2023 09:47:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBM6-006lKz-32
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Mar 2023 09:47:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e2XVUgcXhhuEI3xNnuwh8AFlDinLYyU1iswACd61bmI=; b=FuQLZg6PaEWNe99fYIRaL4hR3/
	scabEwJCup8dc3NMybDkrki38wUeN0q2oVJHsAL4obI9kTT35FtBVQkEHwYVgqficMtoG6bgcQlec
	+6rXqS2fmTEp2wErjozjUBWBHiTqwx+u4UtE2uaEcoQs7KdFAYMg7msKxTeTNJl7lmYqAwO1IGLS2
	N3CBQvgPhjQsVyqCkwBMQ1iFHGb/hp1EhZWwpqp5VytEMb0jRZuzglnujup5lb8kE/1AY3RFAwqI/
	1wqZW8+ObRM6yOqmLzhTJrwtrokGkx1HIY3yPJ6E2E/MF/L7gLk6+lSBQMpswYjmN30YJhoLZPAzp
	JFH6tc/A==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piADy-007Yw6-1d
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id i9so21597372wrp.3
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2XVUgcXhhuEI3xNnuwh8AFlDinLYyU1iswACd61bmI=;
        b=kGHKFCRY2/20Z1rCTqcYJVgU3cd0wi3wDJXSMUyFVmZc5j+V1KaiZPKiBhBCNWiEmk
         YTJR/O1xNUVyGTEJU7oVvd4EgpSvsIeWc4G/vW2FHJAqvr1kgXR0guIzHaF0b/f40umh
         vl0zURjjjrylWlJemjFV4xwD8kY/633aitJ0VVNsQRTNDNLcU4QFEFBQI5Tugl9mdmvg
         udtFPfIzb33L0bIbMKt5hHXVZJ/EmVQBNEEcbXpC9ggPMZBn5+Hkia/GFYA4U/4x+oy3
         mXHaaqPyZzupgnB9Wh3WgukGpxphE0upGxLInLzuYg3CiYPeQuCGDmHn/E7to5cUt0TD
         JMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2XVUgcXhhuEI3xNnuwh8AFlDinLYyU1iswACd61bmI=;
        b=sCjux7Qdig4VlLCHap93vAAnXxrckjQrZtZabQrHae3ujyr8jGiZF4L46bs1eASCcP
         Ov2MTkxm3CDcGt4w5yQZyNXZNA9hh687eLuUi0A3e9TpQsa0cjZ/89MqWGusFKWP+n2E
         CzyFIb1htK2SM1sApk8Y0Y7SHnVjuhNqBJqPOijZLC2XK9w9olQ+udUFFrT5FW8XXKi6
         qyJGlY6FGmVKwr9irruUCEb3UYQIxiOYzUnHnoHLAVRpl5JEib/uffG55Ojv66WnxJFm
         1FdgjYNP28spqNqZ4DRIJkp9cj5F4nqa+6YelQyPz2MhQCcMIbn4z84I4iTHWqXD/3ze
         lsiA==
X-Gm-Message-State: AAQBX9fUxN6KB4u/1Xgb1htvr+yoHczgqixXnFQWDI07yQwtAW3Yk8Yg
	tPWfJgU9BGxFEOm4FJqAqvUZeQ==
X-Google-Smtp-Source: AKy350aNpaM25UKb9HFn6P6W9+ACITvL4WD6p7Ljzn1vIWq606qr2KNRuWDoLeB1DkeoT9ecCJBieQ==
X-Received: by 2002:a5d:6e54:0:b0:2da:45f4:c053 with SMTP id j20-20020a5d6e54000000b002da45f4c053mr18574691wrz.52.1680251700946;
        Fri, 31 Mar 2023 01:35:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:50 +0200
Subject: [PATCH RFC 12/20] dt-bindings: net: oxnas-dwmac: remove obsolete
 bindings
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-12-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_093526_974902_98FE0CB9 
X-CRM114-Status: GOOD (  14.88  )
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

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 dwmac glue.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/net/oxnas-dwmac.txt        | 41 ----------------------
 1 file changed, 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt b/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
deleted file mode 100644
index 27db496f1ce8..000000000000
--- a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Oxford Semiconductor OXNAS DWMAC Ethernet controller
-
-The device inherits all the properties of the dwmac/stmmac devices
-described in the file stmmac.txt in the current directory with the
-following changes.
-
-Required properties on all platforms:
-
-- compatible:	For the OX820 SoC, it should be :
-		- "oxsemi,ox820-dwmac" to select glue
-		- "snps,dwmac-3.512" to select IP version.
-		For the OX810SE SoC, it should be :
-		- "oxsemi,ox810se-dwmac" to select glue
-		- "snps,dwmac-3.512" to select IP version.
-
-- clocks: Should contain phandles to the following clocks
-- clock-names:	Should contain the following:
-		- "stmmaceth" for the host clock - see stmmac.txt
-		- "gmac" for the peripheral gate clock
-
-- oxsemi,sys-ctrl: a phandle to the system controller syscon node
-
-Example :
-
-etha: ethernet@40400000 {
-	compatible = "oxsemi,ox820-dwmac", "snps,dwmac-3.512";
-	reg = <0x40400000 0x2000>;
-	interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-		     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-	interrupt-names = "macirq", "eth_wake_irq";
-	mac-address = [000000000000]; /* Filled in by U-Boot */
-	phy-mode = "rgmii";
-
-	clocks = <&stdclk CLK_820_ETHA>, <&gmacclk>;
-	clock-names = "gmac", "stmmaceth";
-	resets = <&reset RESET_MAC>;
-
-	/* Regmap for sys registers */
-	oxsemi,sys-ctrl = <&sys>;
-
-};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
