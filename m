Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E24FEB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 16:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QtC4OOVhvOVwxozZuOPwCicG7RgEygzzLxIxZBB9VBY=; b=BV7s2uIO308esK
	hFXtGwgb/4WreEfPJhjLT8ZBDGkKVfcip/71JAyJOsB3MhMpyPuUaRi3MbSZFipuvLqXX3XlMx4FB
	PyONgR49N+zpTHlJ5BgsatIaWx3U1lkBojtTbgPrNI7y0AsfscDxuIaiqlYmae5GiCXxxYtQQ5d5i
	mNrPyW5Dsfgym/TP0gXFR0GDu5+KED+CATXHe4N4o2rFg3261941OPCzSA0YlYIvUqCf0bjbDQ6yl
	vgM6YUXvbDJ4LAmWWdbcfyee/k/N3EYUwkugPQYNZPtvx+1qvg8qGfRnQfYrdGwNXdRRZHllGnI/g
	vipFwHRIOdpy/KnHcJ9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHTH-0047PI-0c;
	Fri, 30 Jun 2023 16:59:47 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHSQ-0046hJ-0J
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 16:58:59 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-313f1085ac2so2317253f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2023 09:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144332; x=1690736332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlU+UgpZzYjQ8Qz1hoTyGS42vPJJFIQhlwcsmTQ11ZM=;
        b=a6hqvXY1JZ53EuG1WH+aJvzumRxz8MhojSkJAkXi5hAQb5v5fGuTTh4KK4Uw3cUajv
         PSjqHesy/jV0RaO96YTj4rT462zAZY19OyAkphRPRykyxTQTW/ANH1DuGHCOO/JulfVg
         nLaQqkH3L0YtaMY5x2h3+NvSw4clXziXBZzJBYWjnzXrs53abbtjZYHMibeluJrAODfz
         mWAKd7fyLySIipmS+LO9d+UPhPX5vI4CZ/owp3JTgP91N7FWy9g3So2NQhDOWWDzeCAH
         jPf+E8YYg5uOZXJkf2PACxH6JZw4pWGh/bZkOUTqSVZVfahLS0EYYq8uio+V4gidJnEr
         kDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144332; x=1690736332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlU+UgpZzYjQ8Qz1hoTyGS42vPJJFIQhlwcsmTQ11ZM=;
        b=dlzDjPdAbXLfxUD98VDXZxTEIzxpOW4SjTHwmOPsdVi9OyUkRSjv1RlkkzMq1NFwTH
         e7K0TH0NcK1WD5gMwlEHfQ2th4yGBtkzbaEq5L4cAT6sWwJKWfFO3iURUc+Alo8K99uf
         e34OTyqjic0z7ixndspz+EHLNRjVfLs1/0ZvSVieYCBLHbMu+NVOBTBEzqyOVWwBmBVA
         p5jPLDESO6PudxUi4WMADsEffBD1M8D1bc4OA2nTfe5umpc/hNor/4v4ZOKVyKflVrpa
         IyS0Egz2Z4o3jwAMX4V+Ro9RsHajre1UrxHial41JLvu3vJfEHv9HICv4paicQNuU6cD
         z/Fg==
X-Gm-Message-State: ABy/qLbiYEnEu9moCjNY6zoF8Xhf4rcKHg3cZtScKU4zyaF9J68r+9Oq
	JdcZsFwNYTK+tdDBNiJboeb86g==
X-Google-Smtp-Source: APBJJlGMQoq8MJdB0hfT3I6T0d0F1LVt3vu4+o1NWHKLvHvj4GZq3IgRqC7tve+tvUz9c8RXUpjMNw==
X-Received: by 2002:adf:cc81:0:b0:314:d19:fc31 with SMTP id p1-20020adfcc81000000b003140d19fc31mr2913745wrj.51.1688144332721;
        Fri, 30 Jun 2023 09:58:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:35 +0200
Subject: [PATCH v2 10/15] dt-bindings: pinctrl: oxnas,pinctrl: remove
 obsolete bindings
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-10-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lU0Rgil/ev1/BqzGapYknrWAekAzhIDCjFFvr/Tl7mg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm4+5/g0rcYb66QxjBIlFiUjvocLVgWZT6mtpaE
 GF1Pn0+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuAAKCRB33NvayMhJ0dPvD/
 93ZAw/LIPqNPF0li9/7yv9xUx84tStF1AkO8ltYZ00U95njJe5mPlivwj+pDdPNLiCEk2nmUPunY3M
 7CuVgtBbHpWcIqx8BDZ70S3yrj6NvQ4MaoES6FuoTEwqXEc8PMvk6wEkEjfL0M13jSe/oNVrYgnzlq
 tenzbEkFaTh5Hgi4XxDqiMvprL37YdzCRzmsoic5XqS2eewnvUAUqy+rhQ1GdnpyiOVv8V0tp4Pqm5
 9cOwbashPgyJeWOsmnzN6Rae795M5pTBkJx1knCyQtXZLKEPNifnQOCfpzSjIFHuPMTqYDQzeZetvI
 fjP4q1vHO1m6hvP6sYHb4iMNXi4ho37b8eUabnUBZP2syBsyP+UBeL0f6wMbDE4Bqyc8i2Me9rXVVD
 qbaKXAAZzqiZgNKBbCRSU+kwDU0/mZVH9BNnAORdEYeYo4XSglwuLtKubLamhA1DHbMmeO5spP202f
 3O5Rg17wscN4iJbKsZjfzH4YJ2Vx0gMqEO77pyJhyhxiLkXDfiHiX3ESELQpbUQb76vCDlxOvUNIis
 sLVWN+pk3K2ckjcQhpsFrL3blpXjHiNTZDdFkjiMf2MdFl69K2sRxnNDEvBZCAAkMBXGExG5t6kuE5
 YzCjrEAZmHYK/h/PtJt2bj+n/N+O8EIkQJnxiI6dKaSy/UtKIirJ4XpqqPqw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_095854_179273_0876288D 
X-CRM114-Status: GOOD (  13.39  )
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
OX810 and OX820 pinctrl bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
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
