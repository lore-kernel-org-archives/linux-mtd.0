Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A673BC001B0
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWowQcQgU7+Z2ekUn65m/GldHJ8FT4XZmQLWo1wtass=; b=2C6BdPF016HGeH
	i7/jvC5JMV4OQO0BGZoAOEFWdrcxLySTR7Qh8QLweq7XvG1rFcXfAUkk3EpPbVPe24ziV56jYMZ+u
	sma0qE8NcpnTFoBe76aYZFEee7cQdivSeL8BMki/KGNYZz91+IMz1uDyzgdnykPcpZC8tjmCpybol
	pf/EEZ4julvdenKWCIP6aBuNGuV+1ztn0yydGCg2eZlox6yr+oFht0cwpflphx/x69v0c/WTFAyy0
	vZOPelwo9xNOfAUMTg1/Xe4OWpArb0LW4FTFn37Yi9gc9sVJ4LpX+g2GHMfDuUUKTbeQX7I+bKcBe
	8bwbVB5TUUE4TzEZrC1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHSX-0046pp-32;
	Fri, 30 Jun 2023 16:59:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHSJ-0046bp-2w
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 16:58:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc0981733so19151405e9.3
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2023 09:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144326; x=1690736326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YODS5EdidiMqfLgv+cP+/rbRFBcpTpOT0mtC9T2xjaQ=;
        b=dA2yCv2NZ72e+wHH9SORhU04cJvJPzsV6as6SCcKplgrM/qbmCh0lwzaHw9dUXaL6b
         mcGptOvELZ+aB8LWxO+IVF6U3kvxAWhsltw/B1PHXOVWpWLMcChUcBLLlhX5ljIP/duB
         cUe3X89BZMnACgmde0D+xGTgdf4AgI+VX5eRY5lyG7AsR3BbJ+YHGSqpG4UX3tGEEmc3
         PcTRBxHt9h40rEpd4f2UJi7bOF8MIHnl/X+u31AivrVCBh9urFQ7+UaQrZY07I8rFs9s
         DuNjry4zxdY0x6eZNraAjT3GQqP6XTAoJ6rnCOHRWPhC3rRsCMZerfuBQlGKgmOViVP7
         zGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144326; x=1690736326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YODS5EdidiMqfLgv+cP+/rbRFBcpTpOT0mtC9T2xjaQ=;
        b=aCc+zfw95wgbJsEeqQv8Y8MTXQs71Szigbs+92u+qAr/skgA0iQjp3F5ojiGNYCGZo
         3Yxyzd4Bd/vph7O1yuzeASmHQAvBABUdMXemhWjDDyAhCO6+eKKaPjAzrlXR9XQMZmTB
         1HDkQyXl4/54ETu41/0Y+0b6n3yRvx5aBigIJVAEZ77OaVw2kgu6Vi9k7nIyT+TpV0J9
         SbH1a0PKRRzwtA5XOnxTKtcXf8Rdqt4IGK1y8YwDFnf6NbzXgubqwlk0NDzDutmgISBC
         JJuSqHXsVTkx/ssQMXHjyhBBGZDBYJNYh/uYzTBGb7K0XiYI607hD0mGdz7QOjwex+dl
         S7nQ==
X-Gm-Message-State: AC+VfDwdAJhYa8zQV7W+wUg5BKeoyZK3LJlccSi8VxxqRMvYB913ayH+
	YrzVTKv5AthM4W7UC7fOqWj9uw==
X-Google-Smtp-Source: ACHHUZ7LMrMA78ocv3Tff31XW7n3ukSVcuxlhHrPo8yNKeKKvHDiMykie0NMER5g/1Kygz1grYs10w==
X-Received: by 2002:a05:600c:2243:b0:3fa:9d0f:f1e1 with SMTP id a3-20020a05600c224300b003fa9d0ff1e1mr2902423wmm.35.1688144326214;
        Fri, 30 Jun 2023 09:58:46 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:45 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:31 +0200
Subject: [PATCH v2 06/15] dt-bindings: mtd: oxnas-nand: remove obsolete
 bindings
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-6-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
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
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=38rvOQ5JzytmoL2e8XQMRnUMzYw1/Raq4YBpYNRm4dw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm2BW8UwSX3d9Pq718ni0310vOQ0HNcYv2IvLHm
 CF9ZdzKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JtgAKCRB33NvayMhJ0Z6yEA
 DQB8ET5EMV67bFiwvw6CHMW/yDZltqA2FQRkT6U0VMXkLspqXbvM5YCSVAJhE0aCOEuSp86cn+sn6B
 fWYyhHNqZR/5Y90GsYVlPN/uNgiwV7djdZJcv8Hr7dPiSDl9hpicmk/oMOjbbFk2/KsZEk4/D8hL52
 m4IUWBoCJlfxhDkSxtZFzKva3EJAGRdSXqKgBs6YFkjMklmRCCde69vPew6/N3svQGqbofvbgY1pcx
 qEn3jwLXNAv/R3f8+pMwEnhekYBxCSGhJZ0QKi2x1b4NC2YUnXjuF96hUl5KnjeNbekLihkL+Zixgl
 qNIiEuLWuFXKNCqbzpVgy3DM+VAkjyQ42Hc3PG31OYbYWTnLSrdi9m4LOcuBUEcETWUuBEIdKz8qgn
 uIIfwD/QwhkEqppN4NSnquwiHhfE/O0qsSOVji2MLteguNXuK2nFacu8zRElULaoSvez4BkfP3E0Hx
 6Qk6g08mNZi9io9R1ZtfGcNJ59QnSZPgbu/iCZpDuGGufzmA0BMF7Hv9Y/aDSO51z947Gg9kG8gxD6
 5/7/Li9DDTGcigSq41lgglOTJqSnGHn/8GoZIqTpQyxBSiJa/VRJv0Fp6XxxEee8EmIUwV12YGJgmk
 xB17WN5EDw0VCkcayM+CD9hpDPnRn8ZJCsjJ3wabBHR4HQ8BcT8pvuxHAm5A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_095847_964904_B0F581B2 
X-CRM114-Status: GOOD (  11.39  )
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

Due to lack of maintenance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
for OX810 and OX820 nand bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/mtd/oxnas-nand.txt         | 41 ----------------------
 1 file changed, 41 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt b/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
deleted file mode 100644
index 2ba07fc8b79c..000000000000
--- a/Documentation/devicetree/bindings/mtd/oxnas-nand.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Oxford Semiconductor OXNAS NAND Controller
-
-Please refer to nand-controller.yaml for generic information regarding MTD NAND bindings.
-
-Required properties:
- - compatible: "oxsemi,ox820-nand"
- - reg: Base address and length for NAND mapped memory.
-
-Optional Properties:
- - clocks: phandle to the NAND gate clock if needed.
- - resets: phandle to the NAND reset control if needed.
-
-Example:
-
-nandc: nand-controller@41000000 {
-	compatible = "oxsemi,ox820-nand";
-	reg = <0x41000000 0x100000>;
-	clocks = <&stdclk CLK_820_NAND>;
-	resets = <&reset RESET_NAND>;
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	nand@0 {
-		reg = <0>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		nand-ecc-mode = "soft";
-		nand-ecc-algo = "hamming";
-
-		partition@0 {
-			label = "boot";
-			reg = <0x00000000 0x00e00000>;
-			read-only;
-		};
-
-		partition@e00000 {
-			label = "ubi";
-			reg = <0x00e00000 0x07200000>;
-		};
-	};
-};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
