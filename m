Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A84E9C001DC
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 21:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0V4NCh6FcAooCWRoxuAkYaT/WcXvAd2GklBgYH5OfZ8=; b=YVze/tjzH71Bxp
	z8JRn3PG4g5ONX0e5duKXSA2nwalmoPM235OLT3FpiCcMBlzj/fD4ZUZ7oRxyGbit/syqxFtJNUL3
	gMZLM1ck0kmjb2G8OcGHBHEc3QCcV8DA0IiIzExyW7Gmg1/FQ6qsLdrmhrRRJXz+tqxGadD3hAQqo
	3aZRK7A8qNGLtIoz5gOGE5p5F+RmHXwE11ZzB4DJb1U6Q//tamaA9IgTuvHZeUTBOqomz59cG7CeH
	mno3pneIGz8tlFXP50AHbuZKGK3vjGMM+5yAnXnFvPIklsPUe7itcByA2NFjwLRiPfihU0Ry1ZEPK
	iyAnmm7Ml0110CsZxGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMF9F-0091h3-1R;
	Wed, 19 Jul 2023 21:55:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMF9B-0091e8-0w;
	Wed, 19 Jul 2023 21:55:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C3FB561821;
	Wed, 19 Jul 2023 21:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A022C433C9;
	Wed, 19 Jul 2023 21:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689803748;
	bh=pkUJ9QknpHULZVZcp8D9JqCbZ6N2TitJflc1Z3PXKSs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kpXB2lmdfnDWm/Gm+SRsLxwy+2zj/tNeojULasgHOsJqO+/ZeM/aHwo9UNSs1BkRf
	 8Fewn3kF6F+I0cbXe8wQgZb31DxA2w/A+fqddSc051fyAP4OtPacBwadviuEK9pyKL
	 Ok6IMkHjxRnQtu2ywiShsBgqBnQrG7s/s7c2exJvS1Tam+GqORCUO3Xs+s1YwH1jeO
	 wLOqn9nPWQsTVQ80QGFkKw8hp7zt3jzJGHxiEr8k2KV8n7/oae3DPoPhCEc7G9nKIh
	 VRUMeuefngsW8bIPg1kuCnN3qPMkktBbbgOOHy82n3WD0AbfplqBZaH5acL6vmKVDj
	 dnrVEye/wo3DA==
Message-ID: <59fd7be902941bb55a162a0edc4e2809.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-2-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org> <20230630-topic-oxnas-upstream-remove-v2-2-fb6ab3dea87c@linaro.org>
Subject: Re: [PATCH v2 02/15] dt-bindings: clk: oxnas: remove obsolete bindings
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, linux-oxnas@groups.io, Neil Armstrong <neil.armstrong@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Conor Dooley <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Neil Armstrong <neil.armstrong@linaro.org>, Paolo Abeni <pabeni@redhat.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Vignesh Raghavendra <vigneshr@ti.com>
Date: Wed, 19 Jul 2023 14:55:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_145549_469959_94BA4D85 
X-CRM114-Status: UNSURE (   9.97  )
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

Quoting Neil Armstrong (2023-06-30 09:58:27)
> Due to lack of maintenance and stall of development for a few years now,
> and since no new features will ever be added upstream, remove the
> OX810 and OX820 clock bindings.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Applied to clk-next

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
