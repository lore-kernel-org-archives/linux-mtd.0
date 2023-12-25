Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188CEC3DA6E
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Dec 2023 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtmhjtqxfiwBbh5ht8GUAL1vx2PB6lM9rPbXv8iZRLQ=; b=Hct5tTYhqnsAYP
	pyrhf+6yMeOGddrF/J6pIP4/+1o0DI3G+hLbIK/O9A6geRQjCmIRdx6tcejAltmJDT4aHnb7Q1le3
	RUgEiHTLTLmS1feG+EOuvjnJoX3II1Jk9rDxPnjAObNG/NcVF7FlGs78wwEr2OjimlKN3AD6l6jgt
	Mclq5+pifVA8crZ7LT5OgLK5XVBLteuPC3mWEcdB5vqQ0WuXzw2lMgS8WO97pr9k1MJq6nB+A3Djy
	t8ZKXBltglJ+5K9fTcM+EF7GO1XhS98b+2wzmqvA3BkuFyjXFXxYq7J45xBsdrTDB3qafvrfZUo+2
	pyN/VkUm8KkbFGwXRm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHr3W-00BEXc-0y;
	Mon, 25 Dec 2023 19:56:06 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHr3S-00BEXG-19;
	Mon, 25 Dec 2023 19:56:03 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-67fb9df3699so20587776d6.2;
        Mon, 25 Dec 2023 11:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703534157; x=1704138957; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+5mdzcIi0J0U/jyti3PngFAcX/L3/DjChGGJD4WjO0=;
        b=Vvg2grVL0z1fngOt5HxjceXWlg/NxY8+DDjKN1iUiyv7LT0lX+Et1Ovth/zQjXQWeT
         No8x7C430iNguEJ8cnQqVCcyhle9qi1zdFV+0NrTAe3uPDkKYEkAg2n9dh8tQRMfEHkf
         TZqIXwVmnpyvlK2LBWRE4mBBjYbpHw2FY14le7KsmIKCRA0AUbk76Ca0aLQStWUefqeC
         wBYbWLrSJ576+BoH39j3YIpJOle4tkoJBkD5K2vdpILG8iu3837/3liO+GgymAZnQVs/
         iwf0FkwS6SeGpZaXbuut+mcp7U70n8LcG5YsDcU76NtivzNQLo3Ou/nvmi1B81fa/Rro
         P+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703534157; x=1704138957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+5mdzcIi0J0U/jyti3PngFAcX/L3/DjChGGJD4WjO0=;
        b=OP5OqreDkjj6Uo07BBhk8a5UgJLb9OsXnQNdVRPmJvRfXuHvVFPB+/BPKyyO4Ektzq
         emsodroyez+z4aBcD0+Qdz49oEjyj5g4lMWhbazRR/ZGmrprgri0QIIvKBs7KhfuZqv8
         B4EFDd+2OhS/Z1dJpbMCD90ohMpKk3UnfqMSrNmldu4MKST+ymBMwk9QG3h7SqhCD1vV
         zlJYA5uSTVVNROVfr6XfgVNPbZV4qIEmzHtoQIhJ3FeVjIgPoxnabONA1zNev85/ai9P
         LE+EcjaoYQdYjynq09OxQN0LIxXhwlfShBtq3DCvUmOcp1MB0In/mwMcGn2tmPT0D7RW
         9Kzg==
X-Gm-Message-State: AOJu0Yz1FeMnT5BGYGgY89XpKd9fxyIdJrx6RKVO8zS2UUj/i8PAV0AK
	Ib9A0VJpw8G5b8mZdPk5cAEm1CEnLI54fTGDG+4mP+6bSJo=
X-Google-Smtp-Source: AGHT+IGXQ1DzDW/z7mbnW1aKOma9kP1mZ08AqBa7wFFHcRRfcWmagU8jQFFGhrorFhUOmpGd2hGTlBhrmy9h8xA7nx4=
X-Received: by 2002:ad4:5c49:0:b0:67f:6982:edb4 with SMTP id
 a9-20020ad45c49000000b0067f6982edb4mr13149244qva.14.1703534157222; Mon, 25
 Dec 2023 11:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
 <ZXnxBtqbneUMbvwq@smile.fi.intel.com> <d6e898200b96e816ea8c8c9a847307088ec5821c.camel@maquefel.me>
In-Reply-To: <d6e898200b96e816ea8c8c9a847307088ec5821c.camel@maquefel.me>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 25 Dec 2023 21:55:20 +0200
Message-ID: <CAHp75Vcx8oviLiCu=cnzKcdXjEq9wG=PCiBuPTBYe6FFfUcz7Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/40] ep93xx device tree conversion
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Andy Shevchenko <andy@kernel.org>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231225_115602_397272_3143BEA3 
X-CRM114-Status: UNSURE (   9.70  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMTE6MTPigK9BTSBOaWtpdGEgU2h1YmluCjxuaWtpdGEu
c2h1YmluQG1hcXVlZmVsLm1lPiB3cm90ZToKPiBPbiBXZWQsIDIwMjMtMTItMTMgYXQgMTk6NTkg
KzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToKCi4uLgoKPiBJIGhhdmVuJ3QgZm91bmQgYW55
IG1pc3NpbmcgdGFncywgdGhhdCBiNCBkaWRuJ3QgYXBwbHksIHRoZSBvbmVzIGFib3ZlCj4gcmVm
ZXIgdG8gYSB2ZXJ5IG9sZCBpdGVyYXRpb24gYW5kIHdlcmUgZ2l2ZW4gdG8gY292ZXIgbGV0dGVy
IGFuZCBpCj4gZG9uJ3QgZmVlbCBsaWtlIHRoZXkgbmVlZCB0byBiZSBpbmNsdWRlZC4KCldoZW4g
c29tZWJvZHkgZ2l2ZXMgeW91IGEgdGFnIGFnYWluc3QgYSBjb3ZlciBsZXR0ZXIsIGl0IG1lYW5z
IHRoZQplbnRpcmUgc2VyaWVzIChpZiBub3Qgc3BlbGxlZCBkaWZmZXJlbnRseSkuIGBiNGAgZXZl
biBoYXMgYSBwYXJhbWV0ZXIKLXQgZm9yIHRoYXQgSUlSQy4KCgotLSAKV2l0aCBCZXN0IFJlZ2Fy
ZHMsCkFuZHkgU2hldmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
