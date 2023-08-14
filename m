Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BC7C001DB
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Aug 2023 08:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QVLl6E482ztmpl7QxeuaSgfbHiwlTF+dd6DcHRF7KS4=; b=WivZ4EcuND16VtJpmGckX1aWUt
	SALQ0IlIoxt1UyJguTlD4T0IH4AVYHd2oLUtJyhT3x6YxMY6HhvS2FMuE7J+dbSJmjHoCoQsOxkrN
	bYLI6XNO3nS7cs0/6wo/sQQo5cTvnCnHUq9GUNw0/ilIjP78+aA+lY1GtdAbfX+7R24KZtuZp8g5/
	Rjd6IfQqEit+Q3s/uTYTrJKqYjIBOXUXbVTKJeJajPaxAYLDBMdL2QfUEHHdDHQKXo+ZLyzpWsuWc
	ujVn1T86IzOObvNW6oE6EWmXcZ2D/NO4ep8/6ecAMzt5gKMnLns9iMYma4StVzHCBBVsv2tUZu5gk
	XFyFpGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSlM-00GTcz-0G;
	Mon, 14 Aug 2023 08:17:20 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSlJ-00GTaH-0y
	for linux-mtd@lists.infradead.org;
	Mon, 14 Aug 2023 08:17:19 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31768ce2e81so3662961f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2023 01:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692001034; x=1692605834;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e3CFhGYYBnmc/7BGz71n+APKSrpv4uhL75vkasqQJ4o=;
        b=iQkwPbQN3DsEDOtJk3CJaT+avcrhQmZRMrmuydv4HhzxFDJqxw9vGX/2VyMkUMA1wL
         jk+ff37u88MZw/dBof5+1vAQrQoUsZRVs3rlTi0p0x633eGOAj0RobNrihc/vuOa7pHG
         6eAH/89w+vFWZOFZKuerCFUtKJltGh7FmZ8pO7PYlqTZ0a/VC8XtnkggkA2JAFhJv0Bq
         XuPNI1tM13nTx7WnwNrHP7EJRu30NfUNL14KiE7pfsaKcQNbGHrbWnb6HNFNCHTwS0HG
         GcFhASxwqz+vqOX7V/nyAXR1aQ+K6hWKSIyZVhA20KJfGBBz8iVnsEyNGQ2cl706sOdd
         157Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692001034; x=1692605834;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3CFhGYYBnmc/7BGz71n+APKSrpv4uhL75vkasqQJ4o=;
        b=hMP9xf9B6+yZqGfYN/jkNYUbklzuujmdWNOc/n3FSgJ886p/wnT0PjeKwKf/ph2xNp
         rg1QnSTl5oNTRmFmmlr7JGUYVsjLkKw6RulQVxz5ysGsvuOhBUeBDV/VmMYlfsuv8NbL
         ArsfoDuor4btioRrBwZI3vDGdiMCEadTSQsfCc5jMPYX/Z1iqF6IelnH2F55ekxnee/j
         K9n1GJW9PGVtQyquNKkSWT83s2s3FIktVSeiU604aziN2OlMLyL+twB6NFShYqNG9XBE
         qvNvDzmm9vRte4HJPrYgfhw+sUEepFFEq9DRhrpdW8+2dC26seekK7Y0e3PLiqxJ0AwS
         RiDA==
X-Gm-Message-State: AOJu0YxG58nl17UkSUGXW1wVTmALW6ba2HQ0qp9Q4Pgj4QTwsxdVZYgh
	JLDBPIAVMaSvrg9hJb7klJPJTg==
X-Google-Smtp-Source: AGHT+IEXbvgn6LW0yU+nkhHkcfkiCGwjUBAMcP+fKEDjyEF9E2V8kNEM6NVC/BjPKkIdX0hZ6fKCKg==
X-Received: by 2002:adf:f24e:0:b0:319:7b50:cf5e with SMTP id b14-20020adff24e000000b003197b50cf5emr880096wrp.19.1692001034196;
        Mon, 14 Aug 2023 01:17:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d444d000000b00317f29ad113sm13580045wrr.32.2023.08.14.01.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 01:17:13 -0700 (PDT)
Message-ID: <ff999018-8490-0f58-0a50-e82f1effce5c@linaro.org>
Date: Mon, 14 Aug 2023 10:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove obsolete pinctrl
 driver
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-oxnas@groups.io,
 Arnd Bergmann <arnd@arndb.de>, Daniel Golle <daniel@makrotopia.org>
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
 <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
 <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_011717_339120_6FB3E950 
X-CRM114-Status: GOOD (  12.64  )
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

T24gMDcvMDgvMjAyMyAxNTo0NCwgTGludXMgV2FsbGVpaiB3cm90ZToKPiBPbiBNb24sIEp1bCAz
MSwgMjAyMyBhdCA0OjQ04oCvUE0gTmVpbCBBcm1zdHJvbmcKPiA8bmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4+IE9uIDMwLzA2LzIwMjMgMTg6NTgsIE5laWwgQXJtc3Ryb25nIHdy
b3RlOgo+Pj4gRHVlIHRvIGxhY2sgb2YgbWFpbnRlbmFuY2UgYW5kIHN0YWxsIG9mIGRldmVsb3Bt
ZW50IGZvciBhIGZldyB5ZWFycyBub3csCj4+PiBhbmQgc2luY2Ugbm8gbmV3IGZlYXR1cmVzIHdp
bGwgZXZlciBiZSBhZGRlZCB1cHN0cmVhbSwgcmVtb3ZlIHN1cHBvcnQKPj4+IGZvciBPWDgxMCBh
bmQgT1g4MjAgcGluY3RybCAmIGdwaW8uCj4+Cj4+IERvIHlvdSBwbGFuIHRvIHRha2UgcGF0Y2hl
cyA5LCAxMCAmIDExIG9yIHNob3VsZCBJIGZ1bm5lbCB0aGVtIHZpYSBhIGZpbmFsIFNvQyBQUiA/
Cj4gCj4gSSB0cmllZCB0byBhcHBseSB0aGVtIHRvIHRoZSBwaW5jdHJsIHRyZWUgYnV0IHRoYXQg
ZmFpbHMgLi4uCj4gQ291bGQgeW91IHJlYmFzZSBwYXRjaGVzIDksMTAsMTEgb250byBteSAiZGV2
ZWwiIGJyYW5jaAo+IGFuZCBzZW5kIHNlcGFyYXRlbHk/IFRoZW4gSSB3aWxsIGFwcGx5IHRoZW0g
cmlnaHQgYXdheS4KClN1cmUsIHNlbnQgdGhlbSByaWdodCBub3chCgpUaHgsCk5laWwKCj4gCj4g
WW91cnMsCj4gTGludXMgV2FsbGVpagoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
