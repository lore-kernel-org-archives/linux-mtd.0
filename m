Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549D3ECE579
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 08:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/E+cMvpVaLYAD378TmQasfi8rC+RA1oXAM8c7HpEW6M=; b=3jQUZbIFUJn62P
	J86aac8UlvQaDry8rpMj+bL9vc8nGJCLGBMMgF7vVwlCmV/d+4radyfRockE/vw0tAONMu/CkRHhY
	yC5NtXBKB7iB+t3o5SL0zanWdv2CASsO9eBPfoqBPpNtMj+/1O912+W4kHD7SO/Ku/X6XVJ2PCbgQ
	V2tqA16ZrCpraN7kdY8w6oQ0vSpQV5RTi1Ks6FDwbiDpBvLdb+Pumi6Jsj+3m8FQbMV3l90f+W0n6
	R1mffBBAAlbWEzYeldz63+ERT1Xvq9IAW+Ad2IVkkp4sN6wlq6B6gkzp7aQic1lye+wXxnrsf4dIz
	LlviVzyZ/Zq2PlcyqyHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna9u-00000001C4S-0c5N;
	Mon, 09 Sep 2024 08:54:06 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sna6U-00000001BZy-2Hmr;
	Mon, 09 Sep 2024 08:50:37 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5365a9574b6so3848547e87.1;
        Mon, 09 Sep 2024 01:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725871832; x=1726476632; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qMJgZ9pgfiljRe+M72ZqUEaho/KQ7dkzOtNSpn7FOBk=;
        b=N93cSYqJPNfCECLgYOhYVhUIdsF4l2jtwZf+K6rHylPN3vsj9iHWcoQA6aPKhFimzV
         EzPsGiWCF/U88l2ACSJp82hi4bFAuVbCj6cQVY0TJSNci0O0TVbFnHUCVax0+NVaaW0I
         3UUGiFp2dnuzccOXlmintRm3+TIGhgnnGmieYmbBU04VbolRyEiDeFjgAX3uO3Htg6VM
         JMqUbnTVJnhtqL+W+wfxTEBbIgPZCdb+5vcWTe8PmwqEZf8RUGETejqbwJehPjUJIpUy
         ANpS+SrdHPHwnPLIaXyJ9Lh0gdxwk4XpG+He5XqURIoJeV0S3LAUBjRe9auJH7gU1FUH
         S9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871832; x=1726476632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMJgZ9pgfiljRe+M72ZqUEaho/KQ7dkzOtNSpn7FOBk=;
        b=sODUAyCuZW9Yu6B37jDFbkpAhEJ1rwe/pAiSRpOeLjQDtSPMsZNOCrEzrSZk0jdBPL
         SiyR662+ifPo4akmeEDRXUyZhwFhAeUIprZeGVs1wmJvClxMhdsROye1ecu58uP6Br2c
         9ItF+1D1HCHcDCpXiZ/GUItpcBkUwhss2qOfJu4hHgHbBHeWfltzZvP1P7QRjwLwnGA0
         0dqeZTzUaKmZQOSATlknE8JdvHpYxVdQIAhEDDJDPOU075wlURwswF23U/rMvCimerM1
         DuRvG6EQi4wo7RWX1gk6+XVrUsQn5ZTY1az+PZd168Jn8XIQQh+Occc9xuJUVRnD1khj
         4XhA==
X-Forwarded-Encrypted: i=1; AJvYcCW4kdmIpGSpkbRNS5JrVJlVLKNj7pgTOrfk/ASuGygl+dUknwJyhsOVAcKw2OJV+gJtb1wQY1VH0JBVgtXl3drQ@lists.infradead.org, AJvYcCW54ubQdKQmkdrCzav4hjcY20qfyKrmYBdk9YXWZ2UmlmsNdy6E8ak7s2iz82lFVICaewtbG3l8msSS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr76pj8gqKSm9AJFBLYWOp73PYsapNcvSEa0PIQf6HKBnCNtjl
	MZtt+QZxH2l3WXH7Uj8nzvQdgnMXtcxWD4YDTbvYengRZpcTmNW1DH015eM/RbCfMtxkJtvpniK
	E+bhi+XomykWPBbcYH5eYtfwk3e4=
X-Google-Smtp-Source: AGHT+IFcTF6tcgjMw6D6S0XG2rYkA0vJft71zEud+Bt80oehc9COujaTfpbyb07ODKbKRYsDsEFhP0R5k4x+NMVw2vM=
X-Received: by 2002:a05:6512:1395:b0:536:555d:11ed with SMTP id
 2adb3069b0e04-536587a67d8mr8746687e87.12.1725871831380; Mon, 09 Sep 2024
 01:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
In-Reply-To: <20240909-ep93xx-v12-0-e86ab2423d4b@maquefel.me>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Sep 2024 11:49:54 +0300
Message-ID: <CAHp75Veusv=f6Xf9-gL3ctoO5Njn7wiWMw-aMN45KbZ=YB=mQw@mail.gmail.com>
Subject: Re: [PATCH v12 00/38] ep93xx device tree conversion
To: nikita.shubin@maquefel.me
Cc: Arnd Bergmann <arnd@arndb.de>, Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
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
	Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	20240904-devm_clk_hw_register_fixed_rate_parent_data-v1-1-7f14d6b456e5@maquefel.me, 
	20240829-cs4271-yaml-v3-1-f1624cc838f6@maquefel.me, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_015034_619523_5C908AE7 
X-CRM114-Status: GOOD (  14.64  )
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

T24gTW9uLCBTZXAgOSwgMjAyNCBhdCAxMToxMuKAr0FNIE5pa2l0YSBTaHViaW4gdmlhIEI0IFJl
bGF5CjxkZXZudWxsK25pa2l0YS5zaHViaW4ubWFxdWVmZWwubWVAa2VybmVsLm9yZz4gd3JvdGU6
Cj4KPiBUaGUgZ29hbCBpcyB0byByZWNpZXZlIEFDS3MgZm9yIGFsbCBwYXRjaGVzIGluIHNlcmll
cyB0byBtZXJnZSBpdCB2aWEgQXJuZCBicmFuY2guCj4KPiBJdCB3YXMgZGVjaWRlZCBmcm9tIHRo
ZSB2ZXJ5IGJlZ2lubmluZyBvZiB0aGVzZSBzZXJpZXMsIG1vc3RseSBiZWNhdXNlCj4gaXQncyBh
IGZ1bGwgY29udmVyc2lvbiBvZiBwbGF0Zm9ybSBjb2RlIHRvIERUIGFuZCBpdCBzZWVtZWQgbm90
Cj4gY29udmVuaWVudCB0byBtYWludGFpbiBjb21wYXRpYmlsaXR5IHdpdGggYm90aCBwbGF0Zm9y
bSBhbmQgRFQuCj4KPiBGb2xsb3dpbmcgcGF0Y2hlcyByZXF1aXJlIGF0dGVudGlvbiBmcm9tIFN0
ZXBoZW4gQm95ZCBvciBjbGsgc3Vic3lzdGVtOgoKRG9lcyBpdCBtZWFuIHlvdSBzdGlsbCBoYXZl
IGEgZmV3IHBhdGNoZXMgd2l0aG91dCB0YWdzPwpXaGF0IGFyZSB0aGVpciByZXNwZWN0aXZlIG51
bWJlcnM/Cgo+IC0gY2xrOiBlcDkzeHg6IGFkZCBEVCBzdXBwb3J0IGZvciBDaXJydXMgRVA5M3h4
Ogo+ICAgLSB0cmlzdGF0ZQo+ICAgLSBkcm9wIE1GRF9TWVNDT04vUkVHTUFQCj4gICAtIGFkZCBB
VVhJTElBUllfQlVTL1JFR01BUF9NTUlPCj4gICAtIHByZWZpeGVkIGFsbCBzdGF0aWMgd2l0aCBl
cDl4eF8KPiAgIC0gcy9jbGtfaHdfcmVnaXN0ZXJfZGRpdigpL2VwOTN4eF9jbGtfcmVnaXN0ZXJf
ZGRpdigpLwo+ICAgLSBzL2Nsa19yZWdpc3Rlcl9kaXYoKS9lcDkzeHhfY2xrX3JlZ2lzdGVyX2Rp
digpLwo+ICAgLSBkcm9wcGVkIGRldm1fZXA5M3h4X2Nsa19od19yZWdpc3Rlcl9maXhlZF9yYXRl
X3BhcmVudF9kYXRhIG1hY3JvCj4gICAtIHMvZGV2bV9lcDkzeHhfY2xrX2h3X3JlZ2lzdGVyX2Zp
eGVkX3JhdGVfcGFyZW50X2RhdGEoKS9kZXZtX2Nsa19od19yZWdpc3Rlcl9maXhlZF9yYXRlX3Bh
cmVudF9kYXRhKCkvCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
