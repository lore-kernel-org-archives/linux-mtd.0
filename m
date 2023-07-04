Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCF7EB64DD
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 08:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2gfiJ+xOJJrRWgvt27XTgPZiXWvZ9v1CmmGSbSjOeU=; b=kw3MXdmstBdLCl
	TD8mmZGY/R+DEeaZZ9pMHybS5Y+oqiNuWq2BXyHFoLlGIGZiOxBfBSlv2O2O8XXdhtXBSBNijJkgO
	ZVsDdN3gC2NlJa6zEq+vOz5QG3dFd5c3sJ4X5c7UUEXfYCRvujBAb8vIt+3BxbXt1v2cw054w3rtE
	JB2JKMLaerjqo/tKac28/rQ3fn5LmMrzSDAOtrqVIZXC08mRrzopnwZrgCC9IppNXYGuy0Ym5unf1
	ITCaWk8OGrw8Si5hCBmMA83YiE3MOh/LHK6rXcJb9FADJfpWMoGt5n+HSTlAnfaU9OTTPzDnt507O
	2rPBBrY2wn65R/TbXWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbRh-00CZiQ-1Z;
	Tue, 04 Jul 2023 08:31:37 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbRe-00CZhN-0b;
	Tue, 04 Jul 2023 08:31:35 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688459489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/2nxspQ98fwNJAu0SjHz3G4mz9iwCTkXgxHl1xUEiQ=;
	b=l7RebWX60EbI/s4YPsMUh6Ly4U5Tigled8rWGTkd2NfIhz5Smw5HXzAVucxqs8LK4H3BJS
	7hj2xaPPyqT0qySLVr0wgcerksXJLZuBMcrmjp+Df/17szZzo/x0sEfv6c42QHaYlhR62w
	nV0QPdDsJZ7IwJu2RHHX5mc85kislZlYZKl3nV4rEHljBvnK4lgGhX1g8YE0earPmi5/cH
	+xO3wUf5ilERm8EIrj81OVSbuq6MT2KXap0C+AfbQNKnyB5p1z8swNoSDXR/9/gekBwpJH
	kzjZMaN/ShOEzVuRKDThZ8+yzkSt5rRzbt5LDU/iWzgA0hqm20gPkJGj5AKZ9g==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1682C60013;
	Tue,  4 Jul 2023 08:30:27 +0000 (UTC)
Date: Tue, 4 Jul 2023 10:30:26 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Sebastian Reichel
 <sre@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-oxnas@groups.io, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel
 Golle <daniel@makrotopia.org>
Subject: Re: [PATCH v2 06/15] dt-bindings: mtd: oxnas-nand: remove obsolete
 bindings
Message-ID: <20230704103026.6db56915@xps-13>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-6-fb6ab3dea87c@linaro.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
	<20230630-topic-oxnas-upstream-remove-v2-6-fb6ab3dea87c@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_013134_536190_BD5B5A10 
X-CRM114-Status: GOOD (  10.77  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTmVpbCwKCm5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAzMCBKdW4g
MjAyMyAxODo1ODozMSArMDIwMDoKCj4gRHVlIHRvIGxhY2sgb2YgbWFpbnRlbmFuY2UgYW5kIHN0
YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4gYW5kIHNpbmNlIG5vIG5l
dyBmZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJlYW0sIHJlbW92ZSB0aGUKPiBmb3Ig
T1g4MTAgYW5kIE9YODIwIG5hbmQgYmluZGluZ3MuCj4gCj4gQWNrZWQtYnk6IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPiBBY2tlZC1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IEFja2VkLWJ5OiBEYW5pZWwgR29sbGUgPGRhbmllbEBt
YWtyb3RvcGlhLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1z
dHJvbmdAbGluYXJvLm9yZz4KCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFs
QGJvb3RsaW4uY29tPgoKSSBhc3N1bWUgdGhlc2UgdHdvIG10ZCByZWxhdGVkIHBhdGNoZXMgd2ls
bCBiZSBwaWNrZWQtdXAgdGhyb3VnaCB0aGUKc29jIHRyZWUgYXMgd2VsbCwgaWYgdGhhdCdzIG5v
dCB0aGUgY2FzZSBqdXN0IHBpbmcgbWUgYW5kIEknbGwgdGFrZQp0aGVtLgoKVGhhbmtzLApNaXF1
w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
