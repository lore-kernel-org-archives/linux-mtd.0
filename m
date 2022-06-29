Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1793C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+0qtK6ObXmhqEuNjw/8xDbCvLK9eSePinUq1hClkTI=; b=FDCEVa1QawIwGM
	B6/aFbpUwFYKjsflq3wVZV3w7BQnLhOX25TO9pbxnd8Kh+jZT5+STDFQqqjVjDd9mGv7R6s7Bx6w8
	CI5uAgpVl92N0jKneZ/y8R5l9/paKUtlip2bU8CCkwfgjnzr4NaqmJXJIKehOML4H7ZMmvfGWQxuF
	mc4RUN9mLR+X4HzQ1OvUxbBm0podOQRZky02vMunf2snLVFeK4R0H8e9UMTFbzozdAeVz9bj8G+uy
	TZXgj7JAlVnMvQtmtrCeMXtg97ONz3E1wtMS1b675NrU5b6igqkRSDphh0dw4ph4CGzVxAVkmE/EN
	Vo/ZaAGCCMUjUnC8LcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6TtR-00AdhL-JH; Wed, 29 Jun 2022 09:21:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6TtM-00AdeM-8r; Wed, 29 Jun 2022 09:21:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA2E161E2A;
	Wed, 29 Jun 2022 09:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6A5C34114;
	Wed, 29 Jun 2022 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656494506;
	bh=HQ25Ow2lpsqgoUrUW/nG+URV4v3uVvi69tP+dqJVwS8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KDGJ+ZX0QDwKOanqLEHq4R3Rgk4gw7YBpXQ1tp5J2PbFlN9SFFfxpykmheKoDEBKH
	 GZdb6/Vu19P209bnRNGK3ZFDu4CTBf7M/1tGbAgk0qvALDE6m6bUxa1i55igZp5mYn
	 M9nKXnXHahfEJ1/gD9uIZsD8u8SACyrjQAA5RstBhscMb/v3jVsSe8amKh8qkDuMrS
	 GSpJXwgYiOg6nUIYiiXl948rxcrWW3Rc1By0vwkqaGsbNa0kxgo7uX8LQpEE5EFJvC
	 lXPBmC+HFU37tkvSye7TN5YXt1OC7tohvK8VYqANalwO76xOIXwCRjtMw86pXFhld/
	 h03Us4Elobz6g==
Date: Wed, 29 Jun 2022 11:20:42 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa@kernel.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <uwe@kleine-koenig.org>, Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, Scott Wood
 <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda
 <ojeda@kernel.org>, Corey Minyard <minyard@acm.org>, Peter Huewe
 <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Luca
 Ceresoli <luca@lucaceresoli.net>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael
 Hennerich <michael.hennerich@analog.com>, Linus Walleij
 <linus.walleij@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Phong LE
 <ple@baylibre.com>, Adrien Grassein <adrien.grassein@gmail.com>, Peter
 Senna Tschudin <peter.senna@gmail.com>, Martin Donnelly
 <martin.donnelly@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>,
 Douglas Anderson <dianders@chromium.org>, Stefan Mavrodiev
 <stefan@olimex.com>, Thierry Reding <thierry.reding@gmail.com>, Sam
 Ravnborg <sam@ravnborg.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Javier Martinez Canillas
 <javierm@redhat.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
 <benjamin.tissoires@redhat.com>, Jean Delvare <jdelvare@suse.com>, George
 Joseph <george.joseph@fairview5.com>, Juerg Haefliger <juergh@gmail.com>,
 Riku Voipio <riku.voipio@iki.fi>, Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>, Marc Hulsman <m.hulsman@tudelft.nl>,
 Rudolf Marek <r.marek@assembler.cz>, Peter Rosin <peda@axentia.se>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Dan Robertson <dan@dlrobertson.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
 Tomasz Duszynski <tduszyns@gmail.com>, Kevin Tsai <ktsai@capellamicro.com>,
 Crt Mori <cmo@melexis.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Nick Dyer <nick@shmanahar.org>, Bastien Nocera <hadess@hadess.net>, Hans de
 Goede <hdegoede@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Jan-Simon
 Moeller <jansimon.moeller@gmx.de>, Colin Leroy <colin@colino.net>, Joe
 Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>,
 Jasmin Jessich <jasmin@anw.at>, Matthias Schwarzott <zzam@gentoo.org>, Olli
 Salonen <olli.salonen@iki.fi>, Akihiro Tsukada <tskd08@gmail.com>, Kieran
 Bingham <kieran.bingham@ideasonboard.com>, Tianshu Qiu
 <tian.shu.qiu@intel.com>, Dongchun Zhu <dongchun.zhu@mediatek.com>, Shawn
 Tu <shawnx.tu@intel.com>, Martin Kepplinger <martink@posteo.de>, Ricardo
 Ribalda <ribalda@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Leon Luo <leonl@leopardimaging.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>, Daniele Alessandrelli
 <daniele.alessandrelli@intel.com>, Michael Tretter
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Kyungmin Park <kyungmin.park@samsung.com>,
 Heungjun Kim <riverful.kim@samsung.com>, Ramesh Shanmugasundaram
 <rashanmu@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Niklas
 =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>, Jimmy
 Su <jimmy.su@intel.com>, Arec Kao <arec.kao@intel.com>, "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>, Shunqian Zheng <zhengsq@rock-chips.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Chiranjeevi Rapolu
 <chiranjeevi.rapolu@intel.com>, Daniel Scally <djrscally@gmail.com>, Wenyou
 Yang <wenyou.yang@microchip.com>, Petr Cvek <petrcvekcz@gmail.com>, Akinobu
 Mita <akinobu.mita@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Mats Randgaard <matrandg@cisco.com>, Tim
 Harvey <tharvey@gateworks.com>, Matt Ranostay <matt.ranostay@konsulko.com>,
 Eduardo Valentin <edubezval@gmail.com>, "Daniel W. S. Almeida"
 <dwlsalmeida@gmail.com>, Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Support Opensource <support.opensource@diasemi.com>,
 Robert Jones <rjones@gateworks.com>, Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bartlomiej Zolnierkiewicz
 <b.zolnierkie@samsung.com>, Tony Lindgren <tony@atomide.com>, Jonathan
 =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, Arnd Bergmann
 <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Eric Piel
 <eric.piel@tremplin-utc.net>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Woojung
 Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, George
 McCollister <george.mccollister@gmail.com>, Ido Schimmel
 <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>, Jeremy Kerr
 <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>,
 Charles Gorand <charles.gorand@effinnov.com>, Krzysztof Opasiak
 <k.opasiak@samsung.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Mark Gross <markgross@kernel.org>, Maximilian Luz
 <luzmaximilian@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Pali
 =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Tobias Schrammm <t.schramm@manjaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Jens Frederich <jfrederich@gmail.com>, Jon
 Nettleton <jon.nettleton@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Felipe Balbi <balbi@kernel.org>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, Helge
 Deller <deller@gmx.de>, Evgeniy Polyakov <zbr@ioremap.net>, Wim Van
 Sebroeck <wim@linux-watchdog.org>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Johannes Berg
 <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, James Schulman <james.schulman@cirrus.com>, David Rhodes
 <david.rhodes@cirrus.com>, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Fabio
 Estevam <festevam@gmail.com>, Kevin Cernekee <cernekee@chromium.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Maxime Ripard
 <maxime@cerno.tech>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?= <alsi@bang-olufsen.dk>,
 Lucas Stach <l.stach@pengutronix.de>, Jagan Teki
 <jagan@amarulasolutions.com>, Biju Das <biju.das.jz@bp.renesas.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Alex Deucher <alexander.deucher@amd.com>,
 Lyude Paul <lyude@redhat.com>, Xin Ji <xji@analogixsemi.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito89@gmail.com>, Yang Li <yang.lee@linux.alibaba.com>, Angela
 Czubak <acz@semihalf.com>, Alistair Francis <alistair@alistair23.me>, Eddie
 James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, Nathan
 Chancellor <nathan@kernel.org>, Antoniu Miclaus
 <antoniu.miclaus@analog.com>, Alexandru Ardelean <ardeleanalex@gmail.com>,
 Dmitry Rokosov <DDRokosov@sberdevices.ru>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Stephan Gerhold
 <stephan@gerhold.net>, Miaoqian Lin <linmq006@gmail.com>, Gwendal Grignou
 <gwendal@chromium.org>, Yang Yingliang <yangyingliang@huawei.com>, Paul
 Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@0x0f.com>, Haibo
 Chen <haibo.chen@nxp.com>, Cai Huoqing <cai.huoqing@linux.dev>, Marek Vasut
 <marex@denx.de>, Jose Cazarin <joseespiriki@gmail.com>, Dan Carpenter
 <dan.carpenter@oracle.com>, Jean-Baptiste Maneyrol
 <jean-baptiste.maneyrol@tdk.com>, Michael Srba <Michael.Srba@seznam.cz>,
 Nikita Travkin <nikita@trvn.ru>, Maslov Dmitry <maslovdmitry@seeed.cc>,
 Jiri Valek - 2N <valek@2n.cz>, Arnaud Ferraris
 <arnaud.ferraris@collabora.com>, Zheyu Ma <zheyuma97@gmail.com>, Marco
 Felsch <m.felsch@pengutronix.de>, Oliver Graute
 <oliver.graute@kococonnector.com>, Zheng Yongjun
 <zhengyongjun3@huawei.com>, CGEL ZTE <cgel.zte@gmail.com>, Minghao Chi
 <chi.minghao@zte.com.cn>, Evgeny Novikov <novikov@ispras.ru>, Sean Young
 <sean@mess.org>, Kirill Shilimanov <kirill.shilimanov@huawei.com>, Moses
 Christopher Bollavarapu <mosescb.dev@gmail.com>, Paul Kocialkowski
 <paul.kocialkowski@bootlin.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Dongliang Mu <mudongliangabcd@gmail.com>, Colin Ian King
 <colin.king@intel.com>, lijian <lijian@yulong.com>, Kees Cook
 <keescook@chromium.org>, Yan Lei <yan_lei@dahuatech.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Jonas Malaco <jonas@protocubo.io>, wengjianfeng
 <wengjianfeng@yulong.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Tom Rix <trix@redhat.com>, Yizhuo
 <yzhai003@ucr.edu>, Martiros Shakhzadyan <vrzh@vrzh.net>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Sven Peter <sven@svenpeter.dev>, Alyssa
 Rosenzweig <alyssa@rosenzweig.io>, Hector Martin <marcan@marcan.st>,
 Saranya Gopal <saranya.gopal@intel.com>, Guido =?UTF-8?B?R8O8bnRoZXI=?=
 <agx@sigxcpu.org>, Sing-Han Chen <singhanc@nvidia.com>, Wayne Chang
 <waynec@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Alexey
 Dobriyan <adobriyan@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Vincent Knecht <vincent.knecht@mailoo.org>, Stephen Kitt <steve@sk2.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Alexey
 Khoroshilov <khoroshilov@ispras.ru>, Randy Dunlap <rdunlap@infradead.org>,
 Alejandro Tafalla <atafalla@dnyon.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Seven Lee <wtli@nuvoton.com>, Mac Chiang
 <mac.chiang@intel.com>, David Lin <CTLIN0@nuvoton.com>, Daniel Beer
 <daniel.beer@igorinstitute.com>, Ricard Wanderlof <ricardw@axis.com>, Simon
 Trimmer <simont@opensource.cirrus.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>, Nicola Lunghi
 <nick83ola@gmail.com>, Adam Ford <aford173@gmail.com>,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, openipmi-developer@lists.sourceforge.net,
 linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chrome-platform@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 linux-media@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220629112042.221af80b@thinkpad>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
	<20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_022148_451257_08E13EE4 
X-CRM114-Status: GOOD (  21.37  )
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

T24gVHVlLCAyOCBKdW4gMjAyMiAxNjowMzoxMiArMDIwMApVd2UgS2xlaW5lLUvDtm5pZyA8dS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKCj4gRnJvbTogVXdlIEtsZWluZS1L
w7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4KPiAKPiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkg
YW4gaTJjIGRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiBpcyBtb3N0bHkgaWdub3JlZC4KPiAoT25s
eSBhbiBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQgaWYgdGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRo
YXQgdGhlCj4gZXJyb3IgaXMgaWdub3JlZC4pCj4gCj4gU28gY2hhbmdlIHRoZSBwcm90b3R5cGUg
b2YgdGhlIHJlbW92ZSBmdW5jdGlvbiB0byByZXR1cm4gbm8gdmFsdWUuIFRoaXMKPiB3YXkgZHJp
dmVyIGF1dGhvcnMgYXJlIG5vdCB0ZW1wdGVkIHRvIGFzc3VtZSB0aGF0IHBhc3NpbmcgYW4gZXJy
b3IgdG8KPiB0aGUgdXBwZXIgbGF5ZXIgaXMgYSBnb29kIGlkZWEuIEFsbCBkcml2ZXJzIGFyZSBh
ZGFwdGVkIGFjY29yZGluZ2x5Lgo+IFRoZXJlIGlzIG5vIGludGVuZGVkIGNoYW5nZSBvZiBiZWhh
dmlvdXIsIGFsbCBjYWxsYmFja3Mgd2VyZSBwcmVwYXJlZCB0bwo+IHJldHVybiAwIGJlZm9yZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgoKRm9yCgo+ICBkcml2ZXJzL2xlZHMvbGVkcy10dXJyaXMtb21uaWEuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KCkFja2VkLWJ5OiBNYXJlayBCZWjDum4g
PGthYmVsQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
