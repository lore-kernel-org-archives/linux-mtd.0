Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D6CC001B0
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jul 2023 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6epbgxKLWb0vvFs8zPkCWy+O/BUWdxZ7pc0vu1Y/Wk0=; b=mZeULROLIvydGzzYV0yuB9sOCc
	RNsTUvGKUkdkuLtl2FH6Zrgs28aSQuzxfGJabCcrFB1UKcjkSpPP9+0agq1EX3ARnadNzOoUgFROO
	HqiQhb3/jvUmrSqc+DhWEzmPMFAjzKjjXCif8rBewWZoyJWdymG9zmkBsTr84BBcuDkHoxcXhEKJ8
	5p/2DlCHDNrgzksgbxfMIyF9/hlGKhvH886x+ech5wW3f9ZlJP/e1UAWUlGCi/NR7cAOH+pmBivDB
	wiIE4UaYvkat/lgq1a/dtI8D0UKTw1DlRgpb7D3UmbqPZxFi2vdfYpXh2pyfasBYWJO3EyILU8/5j
	O3FEUQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfUD-00DIoH-0R;
	Tue, 04 Jul 2023 12:50:29 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGfU9-00DInB-2n
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jul 2023 12:50:27 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3112f5ab0b1so6200973f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jul 2023 05:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688475023; x=1691067023;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=khN7qL20jiNV+2YUoL2VVrDQ7HuxSVd+7myuCssgPgE=;
        b=lhpZ5J9XdadmPSr1QR/AG8UcCx6nsBh7S96ptZWO01NVbdAD32ga6ND/rHGK/0nLeG
         OcILfAAZH2QGjuXC0E1sxnz8ySI0riahZV4a/8Vh0qOFuPLDeYuLhNivNpQ42YBQZpR1
         n52OFNS0gHnHJ4ORnADm7dkH4XGhkKGL6bdV3HcGb/JLkgwlITETOv6im3jy+/aeghKo
         SoRqplSJRCRJRm91vnJY56FDVLzwhoIazir8wpfpbMjF7lfBWguiZ9/WFTsJGIwwwgsO
         /SRYchDhQsYGOB5Pi+dm1/EQ35yHwT5u3gaFUFxuzSwiOobh/h9Vc1OIagL99AHBAmRV
         s8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688475023; x=1691067023;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khN7qL20jiNV+2YUoL2VVrDQ7HuxSVd+7myuCssgPgE=;
        b=fziQOPz9qObUO+Jv47g1SOCQ3V/BjMhEQtazvy8FqwBzqQLYYUgMM5OnbIXfZv1bA0
         pjHgMx1+v3DDFu6RF+DIv+ihYqEu2M0Cv3U/5sojsup6KcsKA1BYWEpEhIUadAeOY1el
         ILOw5cEwjw5U7QfxHpylTaPsZC6ZkmgHZUCWuTaIdy5RGQgIoaKu/uCvSWe/gfCLjYbc
         4C8x+vPHoj51cHh7bCVMoSUJiQkDRe/7VfrUW//lyO63m9B4M+H4YsfBxQpZ8Oh/9dNq
         h/zu/ZuPX/8exl/mCNUnekHNZeb90PSW+8pXSUr9o1ozy6hq5Gb/VyIo1XH8sgbB/A5d
         frew==
X-Gm-Message-State: ABy/qLYAbTM4IDmJiI/kgJREb97xm1Jbwdi06d2NRPUZKsUMqYMhepy+
	kIBVRBGmMwawbjD0eUr66L9BrQ==
X-Google-Smtp-Source: APBJJlGYnTg9Odl6AdblWp67O67QkMbjypzSdthrdvhcA+ODLfuCZz/bh+UKd6Sl1gTFpqUPb6nUyw==
X-Received: by 2002:a5d:4203:0:b0:313:f395:f5a3 with SMTP id n3-20020a5d4203000000b00313f395f5a3mr9492911wrq.38.1688475023459;
        Tue, 04 Jul 2023 05:50:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:106:cd85:84ae:7b? ([2a01:e0a:982:cbb0:106:cd85:84ae:7b])
        by smtp.gmail.com with ESMTPSA id g5-20020adff405000000b003143cb109d5sm2634842wro.14.2023.07.04.05.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 05:50:23 -0700 (PDT)
Message-ID: <12266deb-4602-c557-fd80-689765fbf302@linaro.org>
Date: Tue, 4 Jul 2023 14:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 06/15] dt-bindings: mtd: oxnas-nand: remove obsolete
 bindings
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Sebastian Reichel <sre@kernel.org>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-oxnas@groups.io,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-6-fb6ab3dea87c@linaro.org>
 <20230704103026.6db56915@xps-13>
Organization: Linaro Developer Services
In-Reply-To: <20230704103026.6db56915@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_055025_904152_B1301209 
X-CRM114-Status: GOOD (  14.71  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKT24gMDQvMDcvMjAyMyAxMDozMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBI
aSBOZWlsLAo+IAo+IG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmcgd3JvdGUgb24gRnJpLCAzMCBK
dW4gMjAyMyAxODo1ODozMSArMDIwMDoKPiAKPj4gRHVlIHRvIGxhY2sgb2YgbWFpbnRlbmFuY2Ug
YW5kIHN0YWxsIG9mIGRldmVsb3BtZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4+IGFuZCBzaW5j
ZSBubyBuZXcgZmVhdHVyZXMgd2lsbCBldmVyIGJlIGFkZGVkIHVwc3RyZWFtLCByZW1vdmUgdGhl
Cj4+IGZvciBPWDgxMCBhbmQgT1g4MjAgbmFuZCBiaW5kaW5ncy4KPj4KPj4gQWNrZWQtYnk6IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4gQWNr
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPj4gQWNrZWQt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4+IEFja2VkLWJ5OiBEYW5pZWwgR29s
bGUgPGRhbmllbEBtYWtyb3RvcGlhLm9yZz4KPj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJv
bmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+Cj4gCj4gQWNrZWQtYnk6IE1pcXVlbCBSYXlu
YWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gCj4gSSBhc3N1bWUgdGhlc2UgdHdvIG10
ZCByZWxhdGVkIHBhdGNoZXMgd2lsbCBiZSBwaWNrZWQtdXAgdGhyb3VnaCB0aGUKPiBzb2MgdHJl
ZSBhcyB3ZWxsLCBpZiB0aGF0J3Mgbm90IHRoZSBjYXNlIGp1c3QgcGluZyBtZSBhbmQgSSdsbCB0
YWtlCj4gdGhlbS4KCkFzIG9mIHRvZGF5LCB0aGVyZSdzIG5vIHN0cm9uZyBwbGFuLCBzbyBtYWlu
dGFpbmVycyBjYW4gcGljayB0aGVpciBwYXRjaGVzCmFuZCBJJ2xsIHByb2JhYmx5IGZ1bm5lbCB0
aGUgcmVtYWluaW5nIG9uZXMgdmlhIGEgZmluYWwgU29DIFBSLgoKVGhhbmtzLApOZWlsCgo+IAo+
IFRoYW5rcywKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
