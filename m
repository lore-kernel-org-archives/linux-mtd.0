Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37CBC76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 09:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Z3702H9nTYr2JCtypvdiLIvuy95sXoVX+LAksgT+1A=; b=2dEHuojdxL0F3c
	Kl2laA7b8q0177ljFk3jp9Yu3khuZutMitDzR8JIELFXSskAO3Kegq529wxWIxJT31u3UAcOXtpEK
	xutlorTtoXgKG4LH/rMtWrOPn4pEdnnf4o3c+FXE+011Y835Wrv/LyJ/F5t6xD0OZfJcwRBrVqju6
	JqZ6vS9usMEIXixRC7UMha/cJRKL0bFEGXn6qRPgXX4Z9YC5+v9rMD/Lxl7CD/l0RC3QXpTyDs+qo
	v+MbSzSoQw84JC+BPO7SScc3YS88WGK4v7tjo0P0PfDbxQKrcS3ALigGkkFSAkHDT2gV2qRZUe7EO
	T4hhlV3vLoMGflPpf4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBK9-006k5W-1m;
	Fri, 31 Mar 2023 09:45:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBK6-006k3f-2g
	for linux-mtd@bombadil.infradead.org;
	Fri, 31 Mar 2023 09:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=; b=eJgLlOCzYf15hYDSrrcnYdQsOP
	196L3J2pCCIvaoBYThBx2x72MKcXDikx6W5eye4soCsyurKlXgalmM4zh+G3lkwi5T+4dat11THga
	t81eVTYWLSL4iYsOXGPMLnXdmVgcVSzFQOvpvHBjUvtWw/6t3MpI3ysbUgIgIM/KKNmO7pquB8zWJ
	VBXMb+iGxMPW5mJdWqF+CjImmFDwsoOJApwBzm9y0lDxU5coMrRyZBl3VKOSC5YTaOhQG24H6rm7J
	Wtzb7tHrGbVanS8kybDgGkBHrfyMHp36CjiISMwNCioWOz0LGOvyR3z1uBUGCFiQtbagLRVjrFvZ2
	azmWAK4A==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAE3-007Ywc-0e
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 08:35:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id v1so21593291wrv.1
        for <linux-mtd@lists.infradead.org>; Fri, 31 Mar 2023 01:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
        b=JRJQX3qf6nbWRRhjPQNrARTIyJRjN85WbOZTRhfjLkq95loPYQtmcz9uuRtmXD+gF0
         pbjlvjWUpM5s35eLwCfaIEAjNdqCVJqUbIoJ0QQ+NUMzZjtV7Kxbb9qHdGemp2rn+kMY
         Iogew4j3vSCvnnTWMPSv3pUmltFB4eJLvdhtB7DgxhbLKFxRNR7Kae+MW+amWDOuGH+K
         0TIBTDavzQ/ATWYsYCgjlgvssAy0cZ+yRGjNI/IOQWRKqbCot7nTCcwYctdEE3g9Fhow
         0GHMU5sij/cF06KleMdx4uNj5gz06aYrtqcKb/iZZ8GuVraLGpO2QvwZWp3MdMXVyQ6A
         wvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5/X3/1Tx5hLaqv79uU7wuySkv7lfnq2I4RAVqFuiIk=;
        b=Wr3Gf7Q8EA2ZrYiM5XuMW/dXPARqr5/3+vlpbZfUojn9pHB2BZRJ1cErvJRSQwtNie
         haampTioJVKLqPRr601Wss8DKNx/PqFuscmVAabm7AaPNKK7vvEEj4QmOmrDF79BLOWK
         Fx2PHGJyTk3cTbTbLmTNuGCzsogfPSzGigWCeLLiRZh/nMGIbQ/0kRilqphqp0ZTmt+/
         f/kkGOVBQYSbdS4itWsh/46xW5Qd2Zu54Ba6qRAVzcclwSGU7lTN+WAeLTu4awze1SBw
         rnIgcGr01L5j7aKt5CEn2BKkHINTyB8s6dvhjOsNxDbEO7W0kRnSoiApQxdHyCNUhk+H
         C8Aw==
X-Gm-Message-State: AAQBX9e5KzVZGpuVTJUy8YtqJay+nfQ5uskVJTdRBevlvZ+ZXPayxRrv
	Gu74V3Sz4T6BYAcbjomUEk3Imw==
X-Google-Smtp-Source: AKy350aYemXoWmOPKcUW9zRssljXvnRo5Q8xdKbF8v8OuSCqLpxJ51RrFOLM7mEYYMCY0HOKI4STBA==
X-Received: by 2002:adf:f04b:0:b0:2d8:57b1:db6c with SMTP id t11-20020adff04b000000b002d857b1db6cmr18990831wro.9.1680251709411;
        Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:35:09 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:56 +0200
Subject: [PATCH RFC 18/20] irqchip: irq-versatile-fpga: remove obsolete
 oxnas compatible
MIME-Version: 1.0
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-18-5bd58fd1dd1f@linaro.org>
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
X-CRM114-CacheID: sfid-20230331_093518_524242_A0A3DDF0 
X-CRM114-Status: GOOD (  11.31  )
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
and since no new features will ever be added upstream, remove support
for OX810 and OX820 IRQ controller.

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
