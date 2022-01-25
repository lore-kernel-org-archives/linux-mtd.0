Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7F6C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jan 2022 09:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zdR8sdndMnj8aCQOxVaVlK+tGBSOhfUTJeEMjjYufJI=; b=Q9MW56eg6lSi1k
	U5RwSTzNKMXKYNLwYvIdl5w+6HN24MJUjPMTirZzjxDnSa15MUXCMUBChpaRHzVYuznyoql5WYCjr
	gP2osxuc0YYN4MMAEqWINXyRKdBRTz/n9uYYrTVaS0c0FULiBtJFZsYYypP1ssOkIDZ5GCNTNurCY
	lISkjig1+wGoPIyWwkwMZ4qnzmNQfEqvlt38P3v6n6ak22n3kal63kdiLUYdjWDwjB+ZFju6515m0
	FbgeaLkI79LPkDe0JEvbs2TwRCFqbRloU6Tq+Jxt3rkDtNTj2igZYydy28HJLOXtX5yPOsEOMUahy
	fEaNKUs4/b/S0Nka12zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCIRj-007H2Q-8S; Tue, 25 Jan 2022 09:49:03 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCIAC-007AH2-8T
 for linux-mtd@lists.infradead.org; Tue, 25 Jan 2022 09:31:00 +0000
Received: by mail-ua1-x932.google.com with SMTP id l1so34365929uap.8
 for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2022 01:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1mm7+Qmz3LImo4aFwbhXIFkzVEgm/HAOzd6fbdAVMrg=;
 b=kCmCEgQ+xOVJqgvY6mIiDwGpng9RE64Ri/x5bVEJVgfKmrbder8yB0SJa9j3j/iO6u
 VSlwxJi1GtMfRaX9rz0Fi8V70QZmpTm/yg+yqKEhFTP/kvAigM6NlkG016BHxBuEGBud
 aKKG3vXyGKhkWECz7g02ij5pN8RBjRbfSAGJhF2s+s/E8Wzq61/RmUZzmkHINs6y38kj
 8W/C1tUsfkR71I5xYVxyEgRhxjIz/FmTGO/CwLqL3papla/+aWUpb3kyrOT/GpbDGqeC
 c1kCPdzAMoEjl9Ka3L/ozlubTR502/GpTZoRLS5kuqKqPkl9NQ2lJSPzTzJVIDppuhpp
 EfLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1mm7+Qmz3LImo4aFwbhXIFkzVEgm/HAOzd6fbdAVMrg=;
 b=ZkKeVbOYE/Q2GcBLDl/UxO1E0xAo4BFQJGh3SSh6LcnuT/iVb1jKaksk3fX3QbkTJ/
 BFOy6Qy65fdlclFNytAp7/Y2tpJbfRSje31ySRBg/+iu7mzk7poUb9TBb88TGinbRKzK
 wTabcQzA0hIToaapFI2NAfpOVxbU+69PDGVuXmqHt05brgpGMxNhMMgyLuwfekl5O/n5
 a47L1UnwpzurJjNXQRnf1rPQoOO8G3owIXBpNoSXbeay/eQAAOHBhzKQGjI8bcx8oUZe
 ZlZP9LMDtsSUow+yIBI7AfBYUAvwTAJ1XZXDbY5pKLkMox9jLWYCDIJdrjb/7ahb5eSu
 jsKQ==
X-Gm-Message-State: AOAM532dgp2TIVgrO4Iwn5J4lfdh/YQaTaHDPaMhtbO/kYI5kxNHQ2Wv
 98QF3kaH8UDRTo/2tgG7R8+20NlfZyLjBEr1VuYFIg==
X-Google-Smtp-Source: ABdhPJwHGGkAwOnsd7qe0zHQAqHAUzi5PBqvJQ90yr1sdZ5zdG5wkLeKm2Z8HhNpFMDsTHL1nOGUCrWQS9pCXlyV9Y0=
X-Received: by 2002:a67:8c2:: with SMTP id 185mr712613vsi.19.1643103053912;
 Tue, 25 Jan 2022 01:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220123175201.34839-1-u.kleine-koenig@pengutronix.de>
From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 25 Jan 2022 09:30:43 +0000
Message-ID: <CAF2Aj3g0uxj7=m+USWz9QvmQ511DN83e9WsVDW-484aEdix4hg@mail.gmail.com>
Subject: Re: [PATCH 0/5] spi: make remove callback a void function
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
 Michael Hennerich <michael.hennerich@analog.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kent Gustavsson <kent@minoris.se>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Charles-Antoine Couret <charles-antoine.couret@nexvision.fr>,
 Antti Palosaari <crope@iki.fi>, 
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
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, 
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
 Julia Lawall <julia.lawall@inria.fr>,
 =?UTF-8?Q?Ronald_Tschal=C3=A4r?= <ronald@innovation.ch>, 
 Marco Felsch <m.felsch@pengutronix.de>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, Jon Hunter <jonathanh@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Heiko Schocher <hs@denx.de>, 
 Fabio Estevam <festevam@gmail.com>, Colin Ian King <colin.king@intel.com>, 
 Dan Carpenter <dan.carpenter@oracle.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, 
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
 linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, kernel@pengutronix.de, 
 Noralf Tronnes <notro@tronnes.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Guenter Roeck <groeck@google.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_013056_362618_0B35022D 
X-CRM114-Status: GOOD (  18.28  )
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

TXkgdXN1YWwgbWFpbGVyIHdvbid0IGxldCBtZSByZXBseSB0byB0aGlzIG1hbnkgcGVvcGxlLCBz
byBJJ20gdXNpbmcgR21haWwuCgpObyBpZGVhIHdoYXQgY2hhb3MgdGhpcyB3aWxsIGNhdXNlLCBi
dXQgaGVyZSBnb2VzIC4uLgoKPiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYW4gc3BpIGRyaXZlcidz
IHJlbW92ZSBmdW5jdGlvbiBpcyBtb3N0bHkgaWdub3JlZC4KPiAoT25seSBhbiBlcnJvciBtZXNz
YWdlIGlzIHByaW50ZWQgaWYgdGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRoYXQgdGhlCj4gZXJyb3Ig
aXMgaWdub3JlZC4pCj4KPiBTbyBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiB0aGUgcmVtb3ZlIGZ1
bmN0aW9uIHRvIHJldHVybiBubyB2YWx1ZS4gVGhpcwo+IHdheSBkcml2ZXIgYXV0aG9ycyBhcmUg
bm90IHRlbXB0ZWQgdG8gYXNzdW1lIHRoYXQgcGFzc2luZyBhbiBlcnJvciB0bwo+IHRoZSB1cHBl
ciBsYXllciBpcyBhIGdvb2QgaWRlYS4gQWxsIGRyaXZlcnMgYXJlIGFkYXB0ZWQgYWNjb3JkaW5n
bHkuCj4gVGhlcmUgaXMgbm8gaW50ZW5kZWQgY2hhbmdlIG9mIGJlaGF2aW91ciwgYWxsIGNhbGxi
YWNrcyB3ZXJlIHByZXBhcmVkIHRvCj4gcmV0dXJuIDAgYmVmb3JlLgo+Cj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAt
LS0KClsuLi5dCgo+ICBkcml2ZXJzL21mZC9hcml6b25hLXNwaS5jICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tZmQvZGE5MDUyLXNwaS5jICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAzICstLQo+ICBkcml2ZXJzL21mZC9lengtcGNhcC5jICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tZmQvbWFk
ZXJhLXNwaS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVy
cy9tZmQvbWMxM3h4eC1zcGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4g
IGRyaXZlcnMvbWZkL3JzbXVfc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0tLQo+ICBkcml2ZXJzL21mZC9zdG1wZS1zcGkuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstLS0KPiAgZHJpdmVycy9tZmQvdHBzNjU5MTItc3BpLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0tLQoKPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvYW1z
MzY5ZmcwNi5jICAgICAgICAgfCAgMyArLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvY29y
Z2lfbGNkLmMgICAgICAgICAgICAgICB8ICAzICstLQo+ICBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdo
dC9pbGk5MjJ4LmMgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2w0ZjAwMjQydDAzLmMgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMvdmlk
ZW8vYmFja2xpZ2h0L2xtczUwMWtmMDMuYyAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRyaXZlcnMv
dmlkZW8vYmFja2xpZ2h0L2x0djM1MHF2LmMgICAgICAgICAgICAgICAgIHwgIDMgKy0tCj4gIGRy
aXZlcnMvdmlkZW8vYmFja2xpZ2h0L3RkbzI0bS5jICAgICAgICAgICAgICAgICAgfCAgMyArLS0K
PiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdG9zYV9sY2QuYyAgICAgICAgICAgICAgICB8ICA0
ICstLS0KPiAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvdmdnMjQzMmE0LmMgICAgICAgICAgICB8
ICA0ICstLS0KCklmIGl0J3Mgb2theSB3aXRoIE1hcmssIGl0J3Mgb2theSB3aXRoIG1lLgoKQWNr
ZWQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvm
nY7nkLzmlq9dCkxpbmFybyBTZXJ2aWNlcyBQcmluY2lwbGUgVGVjaG5pY2FsIExlYWQKTGluYXJv
Lm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86
IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
