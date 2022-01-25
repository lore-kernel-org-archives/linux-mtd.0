Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0397C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 10:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qdbzuHp4bj0RG4mOyF9xF/lVspIvg1t5fdAewo0jZBw=; b=j7Pukd+f3Pem3h
	7lL6kIEBrprPN0HArAveMFytiycQAydMwu61qOYMwI4BAvdqYfjUHIvKlc03vvS4Hip7up5AL/mru
	+JAz133s0/6fPzxNKwrARsKiWliPJ0G56SVUQKPFkP1lMapoXmz+wIEegck5lZqDc2r0GCd38CqFd
	h/VwpcVHDIT5s1XxQ4bpBEQ69IECSNXnIWJdDaKZwrxxBHV4a4EuStOYMJG3Aa3avBsfxqV9tgiWh
	DqMkxQtWTbxY08X9Jn17OeQFYAocFu38/UuwiEbQ7G+vAuLa4aI241NKgfVHSpF/DZHU71r/70ZXv
	CfBGIha8TzGXNiurOIMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCJCx-007Tyb-Pb; Tue, 25 Jan 2022 10:37:51 +0000
Received: from mail-pj1-f54.google.com ([209.85.216.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCJCt-007TxL-T5; Tue, 25 Jan 2022 10:37:49 +0000
Received: by mail-pj1-f54.google.com with SMTP id q63so14885343pja.1;
 Tue, 25 Jan 2022 02:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KUBI31PDeAnUzGFlBJuIh4dmvfrE44RhBRVMq2wEYSI=;
 b=z1YJS0F5WFSAH77ifyaryuKeTecbasxxQdzlEckDanC57hX54u5Oh6L20V8uMTgFY1
 eEF0RACIOapAtnv1yjL7zdTDNtkEDmiaLZbIfqutRwjq/t89m/d13E1pTwbECeQr1zj5
 kdZ5OT6ZeQbYL6AzFIgy/oyUsb6Ai+olY0BkC+OCDfIkL32BBIvRqLywMBYnaGCfsnLm
 FmGEXymzrx35gyv/JNq6zOgwypmM1pETHGnDV9YoAE4qDOcpJ8VaOW7vclAc7lRymcZb
 f5U887B4Peet7D8P6rS7nSzI8TAaYzjUfvw4j4jsrbBPFf3YSr2wI/3GRhMGcgrqJ0iN
 0ITQ==
X-Gm-Message-State: AOAM532JKqs3tCy+ym6OPWeph2DGnxkpQAmDomhrla8ALwQgetizsQTM
 5Np+dYmlTv7jX1EVd50h2p+8ymX8Sx3xiivV
X-Google-Smtp-Source: ABdhPJxNY87buAXrFFd4OKdA/bnLglJR1I9obRHHmITGldWD/m0qtpBqj6BoXBkQOLrvF7/9NNV70A==
X-Received: by 2002:a17:902:d2cb:b0:14b:6611:4c6b with SMTP id
 n11-20020a170902d2cb00b0014b66114c6bmr4951003plc.7.1643107064057; 
 Tue, 25 Jan 2022 02:37:44 -0800 (PST)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com.
 [209.85.210.181])
 by smtp.gmail.com with ESMTPSA id f6sm6251302pfv.30.2022.01.25.02.37.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:37:43 -0800 (PST)
Received: by mail-pf1-f181.google.com with SMTP id e28so14896633pfj.5;
 Tue, 25 Jan 2022 02:37:42 -0800 (PST)
X-Received: by 2002:a05:6102:34e:: with SMTP id
 e14mr295625vsa.68.1643107051968; 
 Tue, 25 Jan 2022 02:37:31 -0800 (PST)
MIME-Version: 1.0
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Jan 2022 11:37:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWCRyyq1=5+YnXgt2=B-qXMGWXC4XtnP_GHGvghdaH_XQ@mail.gmail.com>
Message-ID: <CAMuHMdWCRyyq1=5+YnXgt2=B-qXMGWXC4XtnP_GHGvghdaH_XQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Markuss Broks <markuss.broks@gmail.com>, Emma Anholt <emma@anholt.net>, 
 David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>, 
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dan Robertson <dan@dlrobertson.com>, Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Antti Palosaari <crope@iki.fi>, Lee Jones <lee.jones@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Kopp <thomas.kopp@microchip.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, 
 Harry Morris <h.morris@cascoda.com>, Varka Bhadram <varkabhadram@gmail.com>, 
 Xue Liu <liuxuenetmail@gmail.com>, Alan Ott <alan@signal11.us>, 
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
 Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo <kvalo@kernel.org>, 
 Ajay Singh <ajay.kathat@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Solomon Peachy <pizza@shaftnet.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Mark Greer <mgreer@animalcreek.com>, 
 Benson Leung <bleung@chromium.org>, Hans de Goede <hdegoede@redhat.com>, 
 Mark Gross <markgross@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, 
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Mack <daniel@zonque.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephan Gerhold <stephan@gerhold.net>, 
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Mike Looijmans <mike.looijmans@topic.nl>, 
 Gwendal Grignou <gwendal@chromium.org>, Cai Huoqing <caihuoqing@baidu.com>, 
 Minghao Chi <chi.minghao@zte.com.cn>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Julia Lawall <Julia.Lawall@inria.fr>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>, 
 Marco Felsch <m.felsch@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Heiko Schocher <hs@denx.de>, 
 Fabio Estevam <festevam@gmail.com>, Colin Ian King <colin.king@intel.com>, 
 Dan Carpenter <dan.carpenter@oracle.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Matt Kline <matt@bitbashing.io>, Torin Cooper-Bennun <torin@maxiluxsystems.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 =?UTF-8?Q?Stefan_M=C3=A4tje?= <stefan.maetje@esd.eu>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Wei Yongjun <weiyongjun1@huawei.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Nanyong Sun <sunnanyong@huawei.com>, 
 Yang Shen <shenyang39@huawei.com>, dingsenjie <dingsenjie@yulong.com>, 
 Aditya Srivastava <yashsri421@gmail.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, 
 Peter Zijlstra <peterz@infradead.org>, Michael Walle <michael@walle.cc>, 
 Yang Li <yang.lee@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 wengjianfeng <wengjianfeng@yulong.com>, Sidong Yang <realwakka@gmail.com>, 
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, 
 Zhang Qilong <zhangqilong3@huawei.com>, Will Deacon <will@kernel.org>, 
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 Davidlohr Bueso <dbueso@suse.de>, 
 Claudius Heine <ch@denx.de>, Jiri Prchal <jiri.prchal@aksignal.cz>,
 linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-media@vger.kernel.org, patches@opensource.cirrus.com, 
 alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-can@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org, 
 linux-wireless@vger.kernel.org, libertas-dev@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-spi@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_023747_956254_54F295EA 
X-CRM114-Status: GOOD (  25.74  )
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

T24gU3VuLCBKYW4gMjMsIDIwMjIgYXQgNjo1NCBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkg
YW4gc3BpIGRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiBpcyBtb3N0bHkgaWdub3JlZC4KPiAoT25s
eSBhbiBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQgaWYgdGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRo
YXQgdGhlCj4gZXJyb3IgaXMgaWdub3JlZC4pCj4KPiBTbyBjaGFuZ2UgdGhlIHByb3RvdHlwZSBv
ZiB0aGUgcmVtb3ZlIGZ1bmN0aW9uIHRvIHJldHVybiBubyB2YWx1ZS4gVGhpcwo+IHdheSBkcml2
ZXIgYXV0aG9ycyBhcmUgbm90IHRlbXB0ZWQgdG8gYXNzdW1lIHRoYXQgcGFzc2luZyBhbiBlcnJv
ciB0bwo+IHRoZSB1cHBlciBsYXllciBpcyBhIGdvb2QgaWRlYS4gQWxsIGRyaXZlcnMgYXJlIGFk
YXB0ZWQgYWNjb3JkaW5nbHkuCj4gVGhlcmUgaXMgbm8gaW50ZW5kZWQgY2hhbmdlIG9mIGJlaGF2
aW91ciwgYWxsIGNhbGxiYWNrcyB3ZXJlIHByZXBhcmVkIHRvCj4gcmV0dXJuIDAgYmVmb3JlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5n
dXRyb25peC5kZT4KCj4gIGRyaXZlcnMvc3BpL3NwaS1zbGF2ZS1zeXN0ZW0tY29udHJvbC5jICAg
ICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS1zbGF2ZS10aW1lLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvc3BpL3NwaS5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTEgKystLS0tLS0tLS0KPiAgZHJpdmVy
cy9zcGkvc3BpZGV2LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0t
CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5i
ZT4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0t
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
