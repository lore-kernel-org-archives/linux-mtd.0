Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D2EB64D7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jun 2023 17:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DNDGrLUKbM4sC/SuXUoBRt2o8xj6CZL6EgMDwMczk0=; b=dn+DUdv2KfKvm+
	2NRWDnp1DuXOkfWJutbVNs9Fb77WlJEDHHu0j56RtohGCADkNKF1LQCdVPSjeOEHJmtk8yxUuqEbj
	XtmFQLoyYBfx+MGeawsCWzZpcXreKp61xDUP37uzncewGecRWXzXVCpg5Nw6VMly+qb7z9aojH9Nr
	IJzcZMBEpU5txtFKk0ItvzOWgitSYKdYsf+6/cS8KUGd1zSKmAXy0ImvHOw+pSu6wa9pAK5f7ZMFx
	VELBm6hKFQNsLWibpSvobNAU1UwtDNtrI0WVZH+sTXpxLzmXyJzcJlJ3YmN3e0RsCSor8EIGGaNiL
	AENVt+7XoktezimhU9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHTn-0047jH-17;
	Fri, 30 Jun 2023 17:00:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFHSU-0046lv-2z
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jun 2023 16:59:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-314172bb818so2325238f8f.1
        for <linux-mtd@lists.infradead.org>; Fri, 30 Jun 2023 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688144337; x=1690736337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=safrMj4vy3+0ORPoAOcHGXU9yJdkC+AfKJ9DByswV9U=;
        b=lLnVdrw2EiSYW0TzS5oXpXUn00LFUe5uWezU6Knq3a+K5EfgjWi3VLLM93y7J4J8C+
         M0pw6AKbbhMm4vPquXrsqqvMYa9nxJlrpAoxOGQGp3HZtNHqszxo4s9fctQz7IUO7mtM
         Bd8yHsc9Iw7jFE7JQYq0uvCATVQ0ZT/KA1Fz2Qfc13038jdpksmKW4VyfbGLfT1oi62V
         444cv4OU6WcOT2oDcWtibODh7coMduW5w+z+CO22s/94ex6kjrQ7fiWC0oTbuVD80o/y
         VyRZaU6E5AAbCNhUr1B7dLPtMMF37+w5JppHPZspuG+mRwhXtKCoSUrXMnrrqe9xt4Rl
         Q5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688144337; x=1690736337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=safrMj4vy3+0ORPoAOcHGXU9yJdkC+AfKJ9DByswV9U=;
        b=ajt+KSAiHq0DoLdVMBf41n4rkUeqc6RYuZ5IlmdofNkUwuSp4VS3V3ndi3jbDF8q0A
         4w80+WMWVklTZeJSXNkOMpKEaZm32/k5mi2jyhTEoagsYodX0G1tArR4rtKF2jPlLHiv
         +fzecghw7cz26pOBtPAN4ndMggHC42UNJea4+4AljGtZNP6zJeRKUvKPA9jFzB5G2Fw2
         llK77l6MqD7Psxdc50CGitCTTpLbj8WcCfHw7eUzvPV+goZletgNNlQNcUUnzSI/Nq5A
         qSjtMCb/j/rzIrurnkZHeq7pA2fSBRg60ell1VzVsHGDvclRa4h5CFgih5mxbpXSSeDx
         w59g==
X-Gm-Message-State: ABy/qLZjrv9HZsisPBC0XPhvWNNhvH5+x1H1PGPJmoHuQd3vcXGZ8pSy
	AW/ALubUsPrmqaJklBRUATdx7A==
X-Google-Smtp-Source: APBJJlEKyEGgCYGMVtZF4uOEb2+kQTTFHk1HYk7zoA+qJfRnhfllehuKYiRJedUqKHunCJKD/gD5YA==
X-Received: by 2002:adf:ed0a:0:b0:314:13e2:2f6c with SMTP id a10-20020adfed0a000000b0031413e22f6cmr2444572wro.58.1688144337623;
        Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id u14-20020adfdb8e000000b003112ab916cdsm18913772wri.73.2023.06.30.09.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 09:58:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 30 Jun 2023 18:58:38 +0200
Subject: [PATCH v2 13/15] irqchip: irq-versatile-fpga: remove obsolete
 oxnas compatible
MIME-Version: 1.0
Message-Id: <20230630-topic-oxnas-upstream-remove-v2-13-fb6ab3dea87c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Hwq/1nyBJbIaeaNsvFzhDu1oXx5gpF7OJ2azvf7yeno=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBknwm5eVilyz5juesTZ+I8YEmM7E2RHfvZxVYP1ZZV
 mwVWJPmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZJ8JuQAKCRB33NvayMhJ0dq1EA
 Cn2KcT1QQ1o1T7+RYh3kPUyZMDiiOc1DSphO3W/uzuy17B2do61hFjY0ldTR9LVnga9ZpODHRUkIR7
 XY925yWYXfnrJgPmf02FEU37ju1/RJ424oSZMlsZ99qOyF0Gd4/pCCGcSwDiVhFH6+gx4ASuiOTZc9
 UNHnfQjGBOcD/HnhgwB38S+QSpueoaTYDT6Mjc5cX0SBcGXjGp9Bx+Md99BODkp4Hd9Y5mJ+CY/+8/
 w1GO8w/7Dmb7m79QwPWi6c/G5/i5MHFpAl9kc2QU/6ynyI5xPJUoJiFFLZAlNngwtVPWJENg0Q1UBw
 YN7jBh7yKomkrlxp6NW4WKFYSEFaKt4ybYtjmo+3DmpbQO/yc6r1k1bl46qufJJWzK1fE7phMItHf/
 1EO6h4/9HG5YhAEmtw4VuXyotDSG7xHUX84iTUqisRFHtkh3aq+vcCh42Glx+/g9amw3FUDvIQw9lm
 B7w/d/CgDk94Qs0gp/nKv8v/o1/fZMhTgS2mZbSXar3CcvfJEaoG3oNjk0VIK8iHwEbgROuQgEGKbz
 evwteKmyZKDOO1c/lCrJmD/4h3CnxXB9HxUynW1SZXjBIpchVe5SetsPfmEo1WkJzkyQvNovTcLpaJ
 rjkszeLvxd0rHZrpvV22nNfMyHRdmt4uWeyFu7fIz0koHI40RGLbE+d44/5Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_095858_988805_D60DFC5A 
X-CRM114-Status: GOOD (  11.77  )
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
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/irqchip/irq-versatile-fpga.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index ba543ed9c154..5018a06060e6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -242,5 +242,4 @@ static int __init fpga_irq_of_init(struct device_node *node,
 }
 IRQCHIP_DECLARE(arm_fpga, "arm,versatile-fpga-irq", fpga_irq_of_init);
 IRQCHIP_DECLARE(arm_fpga_sic, "arm,versatile-sic", fpga_irq_of_init);
-IRQCHIP_DECLARE(ox810se_rps, "oxsemi,ox810se-rps-irq", fpga_irq_of_init);
 #endif

-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
