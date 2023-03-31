Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B832C76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 09:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zsGeUypejZZgMPt8YNFcx3JEr9kS03FKYXfusa952ok=; b=XAGz+JEzoDtSMI
	LDcZNvifHKFMmagowuRcwEUsyzzZ1KjpWmmy7Du0tdObD/XxGECZ7gWWa1m1ikgJeoDeB6GelAO49
	XTjtv0O2FIKz+xTes0GPoqDYaEEtLeaso/ThCdHDXVgsGG/TAfWi4gMDRNxoa5nSb6q4riHS2rcMJ
	6fRRNd56fPtShO6ruWuqUNM67PbxM4MrSjtyglCcbnfF4Duw3hWKzXIbB/gL1DUcPLWxDzuln2+6F
	zHBNfbmD47a/yGsSBAR4oFOZG9D+RtuV1kIEkscuuSGk1hpko2keyIrUuVTqvtqEpIW3+TQHaMm06
	FkoutQmspn2QwhFjaszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBKK-006kAI-2E;
	Fri, 31 Mar 2023 09:45:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBKI-006k8X-2j
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Mar 2023 09:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2eM9F2Ux8ijetoy1aUe1DlA6v+PK0BvM3d2NvEyh+tc=; b=MpdjjCqEuov6U3IO0xz0HrbVF/
	f7/x14z4tsh3GGTDn1qV1Ysrhtew6R7iW+DfGPkUzto9Jq7BkBl+q3fTKQ1xz/iOS1xNyfcG0At7f
	kKV1qc47Qy/OPxGxPqJuEZ7jdH1ehcDbsYwsY3ouWjw85bwuhGeWWqECL95N6c9yCSyEOVblPR5of
	+KJ/EVwVuvgdWL6m6LbP8XlFi7q8OzI+PiNjS7xH+Hm5lrGpzKALTZpwKpAsh6pBiizMxWXskEvWI
	E4Pdf1pAi8RzgVIcqmi6yJ6GTUpZaBIhtSCiKgcF+GKtVosiGM1G+Ge1zG3IY2pEtHfLLwlJr5oMr
	MkqUlaog==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piADz-007YwT-2T
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so13345742wmq.3
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eM9F2Ux8ijetoy1aUe1DlA6v+PK0BvM3d2NvEyh+tc=;
        b=gQVJsVy7NCZuVzYpLt8LnlTZ4QiBCAvEtswZR5oJW7Ax0HOgbVCS1q7DduvuSrz3QB
         pLE1CWF04GtF3enverLrqHldhVlUiSzPI7jrCSXgCi8UbDyMtPe3IkVfZ/GyjLRNwIpm
         /ujMu4TZMw9sO2KrNxxvotVxPY8pNrd2cZ+rxfIlO1AGdIvXdy/mWIQx2vBfL7KdoUDl
         0ZqApcxpBmf6hsRwz4UwQhP9pGz9VYRQa9EqPOw/udhpkAp/VDerl/tq65d5+3IX/Zho
         UMY82QBbst7fDEeY2LrSQCea+YXbhisFv4q8WpzBVbD+tTkWIamYbAGIdiAl8cUCfiN1
         MdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eM9F2Ux8ijetoy1aUe1DlA6v+PK0BvM3d2NvEyh+tc=;
        b=V98tL2G12BN57SY0qErJaNMRt9VhWu5ddlGuMxD51WWJqEgmOrjHt1kMszyxPqA4b8
         X7ybCc7Fix8q1cgXpri9nWe+ZuW0g1+Kl+JQOKcZKL3BkZWfceSkkdMfQFyQ0yjf0bxo
         Ogi9zZXrMNdubmUgzw8w+Vlc2FiFN33ivMkD5Oo5pTTEdpQcr+TXfPYV1JO+1xkqINdS
         W1Mbou/Xo4Vzbp6janfmdRmfJwYMvC+OCDHa+L/izQZQ3KnIJhRV3L1+nvYfgXEIyYbO
         lYK6giBXAOU/RqwIZf4HsypfJyZzZFBuzAPnO7OIOaYjpweJNcqbl8oyu2FI9fvHOdVP
         SKUg==
X-Gm-Message-State: AO0yUKVOknUooACsJvfAK/C1W22wnPxQMEwfqQCUuGaiEPuI/5sytiov
	5yHydlTWMuRp0zl6yRS+IKVqVw==
X-Google-Smtp-Source: AK7set+0JKF+ryMPRRbzb3BibnuUin7VHaHaaeXAUI+4vnrO4VZbOg/l2Mv5uhL3uMmOeMoG9uBNTQ==
X-Received: by 2002:a05:600c:280e:b0:3ed:551b:b78f with SMTP id m14-20020a05600c280e00b003ed551bb78fmr19188054wmb.4.1680251705130;
        Fri, 31 Mar 2023 01:35:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:53 +0200
Subject: [PATCH RFC 15/20] dt-bindings: gpio: gpio_oxnas: remove obsolete
 bindings
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-15-5bd58fd1dd1f@linaro.org>
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
X-CRM114-CacheID: sfid-20230331_093545_641341_E4D53126 
X-CRM114-Status: GOOD (  13.82  )
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
OX810 and OX820 gpio bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/gpio/gpio_oxnas.txt        | 47 ----------------------
 1 file changed, 47 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt b/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
deleted file mode 100644
index 966514744df4..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio_oxnas.txt
+++ /dev/null
@@ -1,47 +0,0 @@
-* Oxford Semiconductor OXNAS SoC GPIO Controller
-
-Please refer to gpio.txt for generic information regarding GPIO bindings.
-
-Required properties:
- - compatible: "oxsemi,ox810se-gpio" or "oxsemi,ox820-gpio"
- - reg: Base address and length for the device.
- - interrupts: The port interrupt shared by all pins.
- - gpio-controller: Marks the port as GPIO controller.
- - #gpio-cells: Two. The first cell is the pin number and
-   the second cell is used to specify the gpio polarity as defined in
-   defined in <dt-bindings/gpio/gpio.h>:
-      0 = GPIO_ACTIVE_HIGH
-      1 = GPIO_ACTIVE_LOW
- - interrupt-controller: Marks the device node as an interrupt controller.
- - #interrupt-cells: Two. The first cell is the GPIO number and second cell
-   is used to specify the trigger type as defined in
-   <dt-bindings/interrupt-controller/irq.h>:
-      IRQ_TYPE_EDGE_RISING
-      IRQ_TYPE_EDGE_FALLING
-      IRQ_TYPE_EDGE_BOTH
- - gpio-ranges: Interaction with the PINCTRL subsystem, it also specifies the
-   gpio base and count, should be in the format of numeric-gpio-range as
-   specified in the gpio.txt file.
-
-Example:
-
-gpio0: gpio@0 {
-	compatible = "oxsemi,ox810se-gpio";
-	reg = <0x000000 0x100000>;
-	interrupts = <21>;
-	#gpio-cells = <2>;
-	gpio-controller;
-	interrupt-controller;
-	#interrupt-cells = <2>;
-	gpio-ranges = <&pinctrl 0 0 32>;
-};
-
-keys {
-	...
-
-	button-esc {
-		label = "ESC";
-		linux,code = <1>;
-		gpios = <&gpio0 12 0>;
-	};
-};

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
