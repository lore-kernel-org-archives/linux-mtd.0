Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEAEEB64DC
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jul 2023 08:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hEUgqY4GbY/piioTU8z2M5tjLm4jme1uPN01spI5V0=; b=uzxYEb9lXdE6IH
	9exoqBeqFJJWyjtUC4oEhD9H5x9b9hMSC6gO1HrpVcE7mABB9ElH7SlsWAVpdWVYwjk+Q0PqssAL2
	LEjjOR4qf2R/Set/KzGvKMgrwZmOgvHNnDa0hzsUop0u3RvyG27upCSNjhC86bRcVxA8f8/EONCYs
	oFX94v+RmtHmLTHwUNt8/92kMYHBK35Ljc7ec/EIm1RsJMMcNkNA8aHs5gCuCv1B0DIry95P3Jv4q
	5xc3khmaHs9EkjK8nzuHmPrDtHkrtqc7UWEjWV6GsSMu+sR4D+5JS1CVvEZqlMlf5RaIkXAGSRX2R
	Min6Pi2IJh47rAhWJpaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEhR-009iQt-0b;
	Mon, 03 Jul 2023 08:14:21 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEhO-009iPZ-20
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jul 2023 08:14:20 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-47e611669e5so13103e0c.3
        for <linux-mtd@lists.infradead.org>; Mon, 03 Jul 2023 01:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688372056; x=1690964056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11QJYwMbaUBpF9NueY3t6DsMt9/06w7p8RRvTfLIaJc=;
        b=L0Xoku72iyScuyAAlvdURXBApKe96vcZyauApjEXYrGVlSdQ5+Noqx/dJGtVL5x6q/
         jlFR5a9BhO9sA8f3jeglFFz63W5kpnijEXV3GbujV4lA4VrnyUUly7d3Wcix3txlUZKX
         0zTnULX0ieClGA2akWPTDF84ad2rXwBO7fEXhu1OYcHAAKgyVmkRs6hX/zxDaek+K+yy
         +Dq303IKCVITitnmnDhFbe5F+dSDTjXUpTQlniD7u22PH7eeed9b8JO4qs6ZdKwCYj/I
         dMxjHx7kBRx/dGnktAFbMiPelHl/QS1H0Ujo5z344HSwUz0dNoig8gIxg/cBlzWUnRon
         rbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688372056; x=1690964056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11QJYwMbaUBpF9NueY3t6DsMt9/06w7p8RRvTfLIaJc=;
        b=MaqxJsNTM1zO5sA8JgBOZ4x8Jqy9ytAYozFWfI5wMtSQ8smlqF9q2GqPl8G3uUZ8ec
         JPv2LvorToiY+quK2YhCQipMNZgh5Xn5sUxjfEfppBVBuYqJjB9c+SsJj/wkPr6er5Fj
         PJwASibetyYXXcHeVVvSRduFoATrrtKv3i4sXRLSzSS8EapkOLKl5br108zoucrXWZFm
         lMOO366FZuXZjQGlDLkyxKqoP9aGNcBl3j3DPO2aEToUxMKmm3PMiQFwevusrA1cOlfY
         xzuDf9nANmvM8wFWww+OUzJitwNykYcMXIuN/YZ4xUB1G8Rj3Ytd3f259WDhBNR1SxrR
         OitA==
X-Gm-Message-State: ABy/qLYvTzt4J+L+NNSp7InSS60NM/1tF4Wdi8FaKL/yvGpzDTvwJcgI
	CMcBIdeZRWn49fGELuSPxTkQqaMQRAnskzmkVeh5qw==
X-Google-Smtp-Source: APBJJlGUXmmzazOU3H2rwPItzzs5yY59Pr2doU3bzs7pqr02Nwa0JTfP80SKVHXrdbTVZhHGNnsVQtkzPqxhjzQX+Tw=
X-Received: by 2002:a1f:c1d0:0:b0:471:5939:f4f2 with SMTP id
 r199-20020a1fc1d0000000b004715939f4f2mr3056599vkf.8.1688372056011; Mon, 03
 Jul 2023 01:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-11-fb6ab3dea87c@linaro.org>
In-Reply-To: <20230630-topic-oxnas-upstream-remove-v2-11-fb6ab3dea87c@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jul 2023 10:14:04 +0200
Message-ID: <CAMRc=McTEPt_gb5HX98khmxvQDX-VQQ62uBF=p4dr_QqouL0kQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/15] dt-bindings: gpio: gpio_oxnas: remove obsolete bindings
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-oxnas@groups.io, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Daniel Golle <daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_011418_890102_4E1E4C11 
X-CRM114-Status: GOOD (  10.53  )
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

T24gRnJpLCBKdW4gMzAsIDIwMjMgYXQgNjo1OOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IER1ZSB0byBsYWNrIG9mIG1haW50ZW5hbmNl
IGFuZCBzdGFsbCBvZiBkZXZlbG9wbWVudCBmb3IgYSBmZXcgeWVhcnMgbm93LAo+IGFuZCBzaW5j
ZSBubyBuZXcgZmVhdHVyZXMgd2lsbCBldmVyIGJlIGFkZGVkIHVwc3RyZWFtLCByZW1vdmUgdGhl
Cj4gT1g4MTAgYW5kIE9YODIwIGdwaW8gYmluZGluZ3MuCj4KPiBBY2tlZC1ieTogS3J6eXN6dG9m
IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgo+IEFja2VkLWJ5OiBM
aW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gQWNrZWQtYnk6IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gQWNrZWQtYnk6IERhbmllbCBHb2xsZSA8ZGFuaWVs
QG1ha3JvdG9waWEub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPgo+IC0tLQoKQWNrZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJhcnRvc3ouZ29sYXN6ZXdza2lAbGluYXJvLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
