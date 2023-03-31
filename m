Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181C4C6FD18
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJhEjk25bPfFvoBQ+RPWAqHl86Lo5xK7g4QBvKK1DKo=; b=GB5gyusBcUcAXh
	msV3fjmud+CAtynqr+VkwOMjiUoqrgd6q8cjQN6QkAHDb8vrRbW1+hm/WiKPEP9p1/K21RB4te6Va
	2LpVdb2U/pxAMhDSd6TVr/9Q0tVSUglW87ExyXweXvvy75AVowJe+H+N2g2LgO2e/OuN/ONNBYQZq
	cI6tX6X1V7ow3eOM7230spQ7AsbXIOVyqjfDpc8CVnp2UbRcsJBrShoyL1SrrTe5fn/ENNRiGTjrw
	u/E3IzwMkC5xkX40qJkuMSotK8RgtQVCHzAA1LbWrvPJx44sIAOQhPj3aT8jQEgqxnbfRHu4KHGZP
	6eksOoMyHupGf+YJQgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAFI-006ROX-2k;
	Fri, 31 Mar 2023 08:36:28 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAE7-006QXS-1E
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:16 +0000
Received: by mail-wm1-f53.google.com with SMTP id s13so12402954wmr.4
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DTkJHErpGDJ9v7s3ekjmHN8aO4NJsl7q6Q7QZM8QMbI=;
        b=faT7qty2v9mj8Ix42YBnnqiE2BD/zQGcq3gccefKHMH/YuuU8LZ4svbUGwYDSn15al
         dV8wJKJcQkWAkZM70cK6ds9puxEMg+C3u4wDRMDaz725C3hxxzMEWJE391gJ0Jg17AuP
         2fMwEoAleea02+Mxb5yclghoO9G4SJu8nA59Aoxwhz+3THjb/xNVjz8bcn1LLjJut8Dh
         r9V9XVaLp5rt0pbcKx4qinpPznoE0FdbJ4fkafGpL7j5amy06u/P8iDihjNYx6eNP2wS
         pFAPQVIUhgzR6VO3W5CM2AjgrdOkVOZ4ja1cG+v2J+H7pw4pFcKcCt3cz+G4ysJYcdMY
         jfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251703;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTkJHErpGDJ9v7s3ekjmHN8aO4NJsl7q6Q7QZM8QMbI=;
        b=ruSpTCGTYdvg919IUlrxeeID2MZJ3TcI2nMQrbo5PV/bKdcqBREfEF03SQNm44BSk0
         ElMrCgWKSuzCobxXzqq5P2HS/DanfgKJQsSKj/uwlvWIqkGFZJgV4bDpE+rhZmntq5jo
         5e/ozFtC7cHeKHSN0mK9ms7tuoZS+nq8cktm9PI+KBGDt396dhkmoyx1AiZmPqTnZmpc
         uGCVrsusD+Kie/5cDLluRKA0Q/kTpjHHldc9PUCHXmoejjhaMIIMLnPrqKzUoTwmnr2z
         SUOcKf9/Wm4+x8e1s0q3rJu1lY743bpmKNrvOuj2dw53aQrazLNJgo50rzwzKf9omboQ
         a6vw==
X-Gm-Message-State: AO0yUKXLq2/U8Ze0d4EYm31H8NEEvrh3uuFElbYlA2NPowdGvLyVITwO
	fz87ClUX5qSsKIwVUn/XDc/hLA==
X-Google-Smtp-Source: AK7set+EJ3ur6/ee9yCfqdjB5MLNFawGDsn0ZJD+xQ08Aa57oAcgfY47mb3l6TfHxYQ73tsX3o+sPw==
X-Received: by 2002:a1c:7714:0:b0:3ee:3f7:35aa with SMTP id t20-20020a1c7714000000b003ee03f735aamr21641887wmi.19.1680251703765;
        Fri, 31 Mar 2023 01:35:03 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:52 +0200
Subject: [PATCH RFC 14/20] dt-bindings: pinctrl: oxnas,pinctrl: remove
 obsolete bindings
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-14-5bd58fd1dd1f@linaro.org>
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
X-CRM114-CacheID: sfid-20230331_013515_473542_AABEAEED 
X-CRM114-Status: GOOD (  12.98  )
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
OX810 and OX820 pinctrl bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/pinctrl/oxnas,pinctrl.txt  | 56 ----------------------
 1 file changed, 56 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
deleted file mode 100644
index b1159434f593..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/oxnas,pinctrl.txt
+++ /dev/null
@@ -1,56 +0,0 @@
-* Oxford Semiconductor OXNAS SoC Family Pin Controller
-
-Please refer to pinctrl-bindings.txt, ../gpio/gpio.txt, and
-../interrupt-controller/interrupts.txt for generic information regarding
-pin controller, GPIO, and interrupt bindings.
-
-OXNAS 'pin configuration node' is a node of a group of pins which can be
-used for a specific device or function. This node represents configurations of
-pins, optional function, and optional mux related configuration.
-
-Required properties for pin controller node:
- - compatible: "oxsemi,ox810se-pinctrl" or "oxsemi,ox820-pinctrl"
- - oxsemi,sys-ctrl: a phandle to the system controller syscon node
-
-Required properties for pin configuration sub-nodes:
- - pins: List of pins to which the configuration applies.
-
-Optional properties for pin configuration sub-nodes:
-----------------------------------------------------
- - function: Mux function for the specified pins.
- - bias-pull-up: Enable weak pull-up.
-
-Example:
-
-pinctrl: pinctrl {
-	compatible = "oxsemi,ox810se-pinctrl";
-
-	/* Regmap for sys registers */
-	oxsemi,sys-ctrl = <&sys>;
-
-	pinctrl_uart2: pinctrl_uart2 {
-		uart2a {
-			pins = "gpio31";
-			function = "fct3";
-		};
-		uart2b {
-			pins = "gpio32";
-			function = "fct3";
-		};
-	};
-};
-
-uart2: serial@900000 {
-	compatible = "ns16550a";
-	reg = <0x900000 0x100000>;
-	clocks = <&sysclk>;
-	interrupts = <29>;
-	reg-shift = <0>;
-	fifo-size = <16>;
-	reg-io-width = <1>;
-	current-speed = <115200>;
-	no-loopback-test;
-	resets = <&reset 22>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart2>;
-};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
