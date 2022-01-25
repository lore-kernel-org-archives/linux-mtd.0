Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6452C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+gWLQoqkGTkJ2ouNh/UxGvD5h9Lnmn/Uuv3Sauetis=; b=PA/XEHe3i4j/E1
	p5tX7lEswpesgn4kVqENWN7nV7vSXUxsYv1nZH6EIRfVMML+CeFAriS6K5kY8SaGtr2sMXiqeQq1h
	/NXfgPRuAlZXNkSkKSBQcY+sLlglIj8G8oESJZ+8GmH1A05fYJEKhRO/qwby2OO14aEnK9BsiZxJG
	FoMQIDh+pf7544v6vxdcsX8oeDlQOfpq5VrkpObCfXrx7dLm6+Io3j6boV+AD+6yfDORtu3Lb+npk
	AdstDEa+gLIjjvgrJjXV72q2S3XHOcuQhozuENF8W7qHUeCaXxgnKWSewadYzwD0uMeDyAuQGTnQ2
	WtN3UGlDOsUGtxylYeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIZd-007Jov-Pw; Tue, 25 Jan 2022 09:57:15 +0000
Received: from proxima.lasnet.de ([2a01:4f8:121:31eb:3::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCINc-007FNB-9g; Tue, 25 Jan 2022 09:44:50 +0000
Received: from [IPV6:2003:e9:d71e:a9f7:7a7b:6f31:a637:f96b]
 (p200300e9d71ea9f77a7b6f31a637f96b.dip0.t-ipconnect.de
 [IPv6:2003:e9:d71e:a9f7:7a7b:6f31:a637:f96b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: stefan@datenfreihafen.org)
 by proxima.lasnet.de (Postfix) with ESMTPSA id F07DEC038E;
 Tue, 25 Jan 2022 10:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datenfreihafen.org;
 s=2021; t=1643103874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GoIG+75u1/C8Q0IQMWQkza+f14Geqz2ci3clcv5LbbA=;
 b=sGVaqmb8ajP7SMAimYbwmLeoz3qwgAKJtXKJhVBI6LVnprU3zcENtw8CSuIVtlDP12Ftcg
 omtJC4WBLS9wYTTYBNtwuVwIpt9p+QXLrBu2J5mSbkoUdwkk6Q2U+dEAkWJcH84zrQEyei
 x733CU2siv1QufCl/+nKqBu3Gb9hr+Y2jwgbd/nGY+h+cGoJ1aMrkQ/Xr04xLClVQrb7Zb
 TfJLM6l+udOvFgWOaiKtuRju9kT+LL2mscfBK+X4SZcr+cFkeecEEkxb8wgAwr3nuwM406
 TQmICGSC57YvMB7lqOtVDQPqzsvnI2bxJ1XBFEpgEaxjDEmWG5ZeH7Hj87MfNg==
Message-ID: <c82b8cc0-ef82-9e8a-525c-8d811376bfae@datenfreihafen.org>
Date: Tue, 25 Jan 2022 10:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 5/5] spi: make remove callback a void function
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Markuss Broks <markuss.broks@gmail.com>, Emma Anholt <emma@anholt.net>,
 David Lechner <david@lechnology.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Dan Robertson <dan@dlrobertson.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Antti Palosaari <crope@iki.fi>, Lee Jones <lee.jones@linaro.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Ulf Hansson
 <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Thomas Kopp <thomas.kopp@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Alexander Aring <alex.aring@gmail.com>, Harry Morris <h.morris@cascoda.com>,
 Varka Bhadram <varkabhadram@gmail.com>, Xue Liu <liuxuenetmail@gmail.com>,
 Alan Ott <alan@signal11.us>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Christian Lamparter <chunkeey@googlemail.com>, Kalle Valo
 <kvalo@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Solomon Peachy <pizza@shaftnet.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Mark Greer <mgreer@animalcreek.com>, Benson Leung <bleung@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Stephan Gerhold <stephan@gerhold.net>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Mike Looijmans <mike.looijmans@topic.nl>,
 Gwendal Grignou <gwendal@chromium.org>, Cai Huoqing <caihuoqing@baidu.com>,
 Minghao Chi <chi.minghao@zte.com.cn>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, =?UTF-8?Q?Ronald_Tschal=c3=a4r?=
 <ronald@innovation.ch>, Marco Felsch <m.felsch@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Jon Hunter <jonathanh@nvidia.com>, Andrew Morton
 <akpm@linux-foundation.org>, Heiko Schocher <hs@denx.de>,
 Fabio Estevam <festevam@gmail.com>, Colin Ian King <colin.king@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>, Matt Kline
 <matt@bitbashing.io>, Torin Cooper-Bennun <torin@maxiluxsystems.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
 =?UTF-8?Q?Stefan_M=c3=a4tje?= <stefan.maetje@esd.eu>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Wei Yongjun <weiyongjun1@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Nanyong Sun <sunnanyong@huawei.com>, Yang Shen <shenyang39@huawei.com>,
 dingsenjie <dingsenjie@yulong.com>, Aditya Srivastava
 <yashsri421@gmail.com>, Stefan Wahren <stefan.wahren@i2se.com>,
 Peter Zijlstra <peterz@infradead.org>, Michael Walle <michael@walle.cc>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 wengjianfeng <wengjianfeng@yulong.com>, Sidong Yang <realwakka@gmail.com>,
 Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>,
 Zhang Qilong <zhangqilong3@huawei.com>, Will Deacon <will@kernel.org>,
 Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
 Davidlohr Bueso <dbueso@suse.de>, Claudius Heine <ch@denx.de>,
 Jiri Prchal <jiri.prchal@aksignal.cz>, linux-kernel@vger.kernel.org,
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
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
 <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
From: Stefan Schmidt <stefan@datenfreihafen.org>
In-Reply-To: <20220123175201.34839-6-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_014449_154355_875EBC0D 
X-CRM114-Status: GOOD (  18.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CkhlbGxvLgoKT24gMjMuMDEuMjIgMTg6NTIsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IFRo
ZSB2YWx1ZSByZXR1cm5lZCBieSBhbiBzcGkgZHJpdmVyJ3MgcmVtb3ZlIGZ1bmN0aW9uIGlzIG1v
c3RseSBpZ25vcmVkLgo+IChPbmx5IGFuIGVycm9yIG1lc3NhZ2UgaXMgcHJpbnRlZCBpZiB0aGUg
dmFsdWUgaXMgbm9uLXplcm8gdGhhdCB0aGUKPiBlcnJvciBpcyBpZ25vcmVkLikKPiAKPiBTbyBj
aGFuZ2UgdGhlIHByb3RvdHlwZSBvZiB0aGUgcmVtb3ZlIGZ1bmN0aW9uIHRvIHJldHVybiBubyB2
YWx1ZS4gVGhpcwo+IHdheSBkcml2ZXIgYXV0aG9ycyBhcmUgbm90IHRlbXB0ZWQgdG8gYXNzdW1l
IHRoYXQgcGFzc2luZyBhbiBlcnJvciB0bwo+IHRoZSB1cHBlciBsYXllciBpcyBhIGdvb2QgaWRl
YS4gQWxsIGRyaXZlcnMgYXJlIGFkYXB0ZWQgYWNjb3JkaW5nbHkuCj4gVGhlcmUgaXMgbm8gaW50
ZW5kZWQgY2hhbmdlIG9mIGJlaGF2aW91ciwgYWxsIGNhbGxiYWNrcyB3ZXJlIHByZXBhcmVkIHRv
Cj4gcmV0dXJuIDAgYmVmb3JlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCgpbLi4uXQoKPiAgIGRyaXZl
cnMvbmV0L2llZWU4MDIxNTQvYWRmNzI0Mi5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0t
LQo+ICAgZHJpdmVycy9uZXQvaWVlZTgwMjE1NC9hdDg2cmYyMzAuYyAgICAgICAgICAgICAgICAg
ICAgfCAgNCArLS0tCj4gICBkcml2ZXJzL25ldC9pZWVlODAyMTU0L2NhODIxMC5jICAgICAgICAg
ICAgICAgICAgICAgICB8ICA2ICsrLS0tLQo+ICAgZHJpdmVycy9uZXQvaWVlZTgwMjE1NC9jYzI1
MjAuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0tCj4gICBkcml2ZXJzL25ldC9pZWVl
ODAyMTU0L21jcjIwYS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgIGRyaXZl
cnMvbmV0L2llZWU4MDIxNTQvbXJmMjRqNDAuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0t
LQoKWy4uLl0KCkZvciB0aGUgaWVlZTgwMjE1NCBkcml2ZXJzOgoKQWNrZWQtYnk6IFN0ZWZhbiBT
Y2htaWR0IDxzdGVmYW5AZGF0ZW5mcmVpaGFmZW4ub3JnPgoKcmVnYXJkcwpTdGVmYW4gU2NobWlk
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
