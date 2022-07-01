Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2694CC43334
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Jul 2022 18:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JeMYqEdhCQKWlbT/bNFIxLjKpvXgCPF9g5f4KE7w8eI=; b=vRhRiQao1e7S0+hVF/VT80r6mU
	hpshbZJrZklXksyJtK/iUBDMwmJpq8uJ4HpRYwcTLC8nayUQAj6Rj4qpEw3h1YlKVwnhHoJAN/Lc7
	Gnivv2d6uA0PPPnVqSrFL9WTQCBlXA/69BB8SMaCpLSoEaEe2YTMhNZ47Z33RRaQuDYlofoGxvdFc
	ZtavNmQGuqMKzmjr1dfcVNKsn7tnwAbOYgW3oSaeGrf6Xr/EbAw7qwE90UiEwOr0/OVdy99RIOBCD
	2rkbhEj7LOe9fVYcfUk7zYyr8T2Jsiky4LFOX/tyVxsPpwvPFpixBLJkJkB57mCBtb3mYxLNUf3DJ
	neiMaYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7LEL-006M91-9H; Fri, 01 Jul 2022 18:19:01 +0000
Received: from mail-vi1eur05on2135.outbound.protection.outlook.com ([40.107.21.135] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7LEF-006M4X-Fc; Fri, 01 Jul 2022 18:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5xaZNS9YkQAA4IRbpfFSdJ7ihM1u6gpHb9gUle52f4uYsNnBl2Y1HC7C+Gwv1+gOkzgt+SrM1go65jeeGlPuxZ+oSUGYHxk6VURQWBJyVb2Ghx+bK9jsBb4OyqEPMk7285/IeB44OPDJ8nAVIhte8Gcet8ziAXk2HbfNnJhW6mK5gkONb19nv44g5MpRRQi4yI/QJlm4HJttBZRzT2/efbIzP8ZK7bnfGfD2BJqYRJBfiubi40oVqHzeQntXlbqgXdnS+U7pEuXsPnfZ6asWfwgHl4rw0p3hC1Rv0/CXAkVgbhQtq2WbDzJg9Mj9VsuLRaRRsHlEpZkc2B9gTdIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d9xpzPqVYAgwPLCnJG7IfZSJEh9UMzLzMOjw4DnB994=;
 b=GOwfaoBzhhzjoX6z0r2dQLynJ4LDMPPaXEbZr0b2sfqDh6/H0xjQIVJP2Wp1ByngqIFANVAWAYrU+8GquJBDhmqNSJPXP+AAm+gNHN2X33Qq4cBvhaqtUaj6fTjY64bNnamyDPiBzTdaBldwyah6vdaCmnFz0gWXF7UXf4WF4v+c1kLo/NMMV12Fe3KIPr0Dhssgsc7JkmHCGFXKruUgTjNjQ2t3GYdcmOv26HsJCreUp2N3dg2BH4bdLvDVwOKLMi80lEnAymPWV4WXgn3PYSJz2zjPjIL0dWAQPPZgyxM7mslDlP84dSrsHqLY8kgsKmgwnWaNBHgF5ygt8+kDeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d9xpzPqVYAgwPLCnJG7IfZSJEh9UMzLzMOjw4DnB994=;
 b=A+2TT0uR5CJU8xlX302W7U5F48QbULEo+YsrOweRzsfR0ZRSL0OsRiJeYSTUbeL9lCYPSXdocrnPCCRSzHRSKt0GAFuuK7qU9EsuTTfH7l3cXnMqT1biKLFO1ZmPDeZBzfCh2w1CXdhQnyhD6kOMc9Wm3azv5yTQCTyMQZqhGy4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com (2603:10a6:208:ed::15)
 by AM7PR02MB6484.eurprd02.prod.outlook.com (2603:10a6:20b:1b1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 1 Jul
 2022 18:18:46 +0000
Received: from AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45]) by AM0PR02MB4436.eurprd02.prod.outlook.com
 ([fe80::11f2:df70:b231:2b45%4]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 18:18:46 +0000
Message-ID: <23b70c51-4bd7-84f9-e72c-ba6547eedf7d@axentia.se>
Date: Fri, 1 Jul 2022 20:18:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Wolfram Sang <wsa@kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Russell King <linux@armlinux.org.uk>, Scott Wood <oss@buserror.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>, Corey Minyard <minyard@acm.org>,
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Luca Ceresoli <luca@lucaceresoli.net>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Michael Hennerich <michael.hennerich@analog.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Phong LE <ple@baylibre.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Douglas Anderson <dianders@chromium.org>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Jean Delvare <jdelvare@suse.com>, George Joseph
 <george.joseph@fairview5.com>, Juerg Haefliger <juergh@gmail.com>,
 Riku Voipio <riku.voipio@iki.fi>, Robert Marko <robert.marko@sartura.hr>,
 Luka Perkov <luka.perkov@sartura.hr>, Marc Hulsman <m.hulsman@tudelft.nl>,
 Rudolf Marek <r.marek@assembler.cz>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Dan Robertson <dan@dlrobertson.com>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Tomasz Duszynski <tduszyns@gmail.com>,
 Kevin Tsai <ktsai@capellamicro.com>, Crt Mori <cmo@melexis.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick@shmanahar.org>,
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 Jan-Simon Moeller <jansimon.moeller@gmx.de>, =?UTF-8?Q?Marek_Beh=c3=ban?=
 <kabel@kernel.org>, Colin Leroy <colin@colino.net>,
 Joe Tessler <jrt@google.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Antti Palosaari <crope@iki.fi>,
 Jasmin Jessich <jasmin@anw.at>, Matthias Schwarzott <zzam@gentoo.org>,
 Olli Salonen <olli.salonen@iki.fi>, Akihiro Tsukada <tskd08@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, Shawn Tu <shawnx.tu@intel.com>,
 Martin Kepplinger <martink@posteo.de>, Ricardo Ribalda <ribalda@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Leon Luo <leonl@leopardimaging.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>,
 "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Heungjun Kim <riverful.kim@samsung.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Jimmy Su <jimmy.su@intel.com>, Arec Kao <arec.kao@intel.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Shunqian Zheng <zhengsq@rock-chips.com>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
 Daniel Scally <djrscally@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Mats Randgaard <matrandg@cisco.com>, Tim Harvey <tharvey@gateworks.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Eduardo Valentin <edubezval@gmail.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Robert Jones <rjones@gateworks.com>, Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tony Lindgren <tony@atomide.com>, =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?=
 <j.neuschaefer@gmx.net>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 George McCollister <george.mccollister@gmail.com>,
 Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>,
 Matt Johnston <matt@codeconstruct.com.au>,
 Charles Gorand <charles.gorand@effinnov.com>,
 Krzysztof Opasiak <k.opasiak@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Mark Gross <markgross@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, =?UTF-8?Q?Pali_Roh=c3=a1r?=
 <pali@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Tobias Schrammm <t.schramm@manjaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Jens Frederich <jfrederich@gmail.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Felipe Balbi <balbi@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Evgeniy Polyakov <zbr@ioremap.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Johannes Berg <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, =?UTF-8?Q?Nuno_S=c3=a1?=
 <nuno.sa@analog.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>,
 Kevin Cernekee <cernekee@chromium.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Alvin_=c5=a0ipraga?=
 <alsi@bang-olufsen.dk>, Lucas Stach <l.stach@pengutronix.de>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Lyude Paul <lyude@redhat.com>,
 Xin Ji <xji@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Yang Li <yang.lee@linux.alibaba.com>, Angela Czubak <acz@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Nathan Chancellor <nathan@kernel.org>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Alexandru Ardelean <ardeleanalex@gmail.com>,
 Dmitry Rokosov <DDRokosov@sberdevices.ru>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Stephan Gerhold <stephan@gerhold.net>, Miaoqian Lin <linmq006@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Paul Cercueil <paul@crapouillou.net>, Daniel Palmer <daniel@0x0f.com>,
 Haibo Chen <haibo.chen@nxp.com>, Cai Huoqing <cai.huoqing@linux.dev>,
 Marek Vasut <marex@denx.de>, Jose Cazarin <joseespiriki@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
 Michael Srba <Michael.Srba@seznam.cz>, Nikita Travkin <nikita@trvn.ru>,
 Maslov Dmitry <maslovdmitry@seeed.cc>, Jiri Valek - 2N <valek@2n.cz>,
 Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 Zheyu Ma <zheyuma97@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
 Oliver Graute <oliver.graute@kococonnector.com>,
 Zheng Yongjun <zhengyongjun3@huawei.com>, CGEL ZTE <cgel.zte@gmail.com>,
 Minghao Chi <chi.minghao@zte.com.cn>, Evgeny Novikov <novikov@ispras.ru>,
 Sean Young <sean@mess.org>, Kirill Shilimanov
 <kirill.shilimanov@huawei.com>,
 Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 Colin Ian King <colin.king@intel.com>, lijian <lijian@yulong.com>,
 Kees Cook <keescook@chromium.org>, Yan Lei <yan_lei@dahuatech.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jonas Malaco <jonas@protocubo.io>,
 wengjianfeng <wengjianfeng@yulong.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Tom Rix <trix@redhat.com>,
 Yizhuo <yzhai003@ucr.edu>, Martiros Shakhzadyan <vrzh@vrzh.net>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sven Peter
 <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Hector Martin <marcan@marcan.st>, Saranya Gopal <saranya.gopal@intel.com>,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Sing-Han Chen <singhanc@nvidia.com>, Wayne Chang <waynec@nvidia.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Vincent Knecht <vincent.knecht@mailoo.org>,
 Stephen Kitt <steve@sk2.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Randy Dunlap <rdunlap@infradead.org>, Alejandro Tafalla
 <atafalla@dnyon.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Seven Lee <wtli@nuvoton.com>, Mac Chiang <mac.chiang@intel.com>,
 David Lin <CTLIN0@nuvoton.com>, Daniel Beer <daniel.beer@igorinstitute.com>,
 Ricard Wanderlof <ricardw@axis.com>,
 Simon Trimmer <simont@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 Nicola Lunghi <nick83ola@gmail.com>, Adam Ford <aford173@gmail.com>,
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
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: GV3P280CA0069.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::30) To AM0PR02MB4436.eurprd02.prod.outlook.com
 (2603:10a6:208:ed::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35b97d70-9d53-435a-bdda-08da5b8e22b6
X-MS-TrafficTypeDiagnostic: AM7PR02MB6484:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	vzChXohioRsHMfghJ5DgMO1CzBWBEheYRx7EtN0uNy9oOHWXqIk0jDSm9a5jy6/z7EHDKaikwrcKQY92OExj1jew9G991gwN8YUn7QKOQosVGv3Z6CJOsWZ+c30sDCljKLMIiJvgiDSoQKT+8JMuDWCPfFO3YmELn33KHn0OrSjiYC3ot39ejoiYmeGTqv54qpaoRXu+jpPjgNagufDxiT/B7AXF5HaimcBdY/FDoukGbZcNJOQqGv/EuxOe+OYjvjVL4/SbLTasuOdiQrYtXmijyp6x3DizUWKLPQSVVcyzzthRilHeDhat8Lwu2isx4HYmAK6buRwpD8+JQbNzlhuByD/RaaL85bxr93FaKdywfidBucgKS/GCX9i6D69Xt5n5v40Yfndm3W2Yej/+dOnOJtalv9yagNACQ8998v9ZfKcRh0D+br1uRMRH6TPCgKwvAaT8dpWCaJhfxhgzlBDywh+GHHqztfFaLVSvBdsZaoGi4GzhfjMNdal6ncuR4PEARpk1ey0OhNAqQHnhL2YzbISzuJWoOv+iExDoYP3j2AOZoMGiPGzCTGbd+Atreod9SRVCbZv/4suBGv+LEP5XrcravOI2sQ/qd21KF0jrHhV9LEsYGDVGwNkSEi29cx3khF9PmqsUVSL01AMa24iQzvOK9+67Plf0BPrwfw7MoeKHubjHYwcdtYMZDzrUsWGlMoccLnVxpaQlbtT1gB5SQ6M4v7r6laeOzyVcJU2rFMKEAhBP3lEyrEsDhHfe2sZXL3R14Bv94Evh4fr4nsbnZIyvwYmOsx3kEjVNVgQdk1XPlSo7u9A96QehSVTwxwWYRUXTWiW+fXyt9utdJA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR02MB4436.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39830400003)(396003)(366004)(346002)(136003)(376002)(7416002)(7366002)(2616005)(7336002)(7276002)(7406005)(8936002)(86362001)(478600001)(5660300002)(6506007)(6666004)(4744005)(6512007)(41300700001)(2906002)(26005)(38100700002)(31696002)(83380400001)(186003)(31686004)(110136005)(316002)(36756003)(6486002)(76576003)(66556008)(8676002)(88732003)(66946007)(4326008)(54906003)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?bjVtdjdXeHdlMUZNZGR2Z2lTeHRadllpMEQ5SHo1ZGFHSlI3OW96YnZDOUlL?=
 =?utf-8?B?S3lMZW1JeTFVQ3dsTDUraHd6U2krQUNOWVpob0hvcVNvN0FZZkpId2RWUFZh?=
 =?utf-8?B?c2oxZ0wzcGxQRy9RTlhLTmc4VElDWXZTUkJTWFNDNWdBMHFWUUpVcEZSK2JF?=
 =?utf-8?B?Z2NtSFZRZGt0ZGwwVXQ5WlREem5oamRUUzU0Z29OOHQ3Sk5mOUI4S0ZONEJT?=
 =?utf-8?B?TjZ0TjBjcDJVNW1sMHowSko2RkFLZklzNUlVUVFJVkFoZFVodDVlcWZYWThJ?=
 =?utf-8?B?WUMvVzNJa2F4OFN4dTAwT1BGY3dWOXVPQjB0WDBmU3BXWDdVNzhtTG5wZFJG?=
 =?utf-8?B?S2xUZ2hlWFRVS1NjaDVLUm9TamFoQXV5WW5hcjBjamtPOVJSM3NINGtvMmpN?=
 =?utf-8?B?Vjg4eFdDU0VGWXA2R2plbDlJT1BxeHBYVDI0Yk9uNmFrMk5pWGROUEk5OHd4?=
 =?utf-8?B?RDB2S01xY1lxUUhML3dWeWF4YVBhT3lTRmN6emkyVmFYRW9mWmptQjJqNlBW?=
 =?utf-8?B?VjhmeHF5ZVloVjI5REpiakY5Mi9zVU1qZU8yTzlKTGltbWpNbFZNSnhNWmZQ?=
 =?utf-8?B?dEVja2ROUmxxVjhoUWJNai9ZMDNjY3NSYmF2SXFCZUNNcHJZWiszTmM3TUhj?=
 =?utf-8?B?YTN0MXFBcldYN0F1eGVzSkJpNDBPVTNLTTNKOGZ3NldnVmo1VXdsNGV5RVVN?=
 =?utf-8?B?ayt2L2dtYlAwUDVvRk9aak1ScmVTY01EK01jRWlBSUtUeEdQWFl1L29jUnlp?=
 =?utf-8?B?c2xNSFhlZU1FTHhaYVp2dXN4QXU3bU5YczBHdVZSbFFVakxZNmp5VHBMTXlu?=
 =?utf-8?B?Wk40VXBETkJ2bVpzV2ZGTitBL0tyUFcyVmFNZGhuak40S0ZlZkxpV1VwQkUx?=
 =?utf-8?B?ZlE4OHNWTlQzc2hxL3Z5Q0ZoTGQyZ0V6dUE2RnF3VzhnSkd1eHFlNWx4R25m?=
 =?utf-8?B?VmRWMzVHbFpBR0FmZk9tbWNmWEVRdXZVb3lxWFdvSTVFTUQ4RllGQmo0UVNI?=
 =?utf-8?B?UmVIcGpWMFM2QzZnWEU4TTZEVG1qVE1oVmRrcStsK2JWTytvRjJ6UU9CZ0w2?=
 =?utf-8?B?Z05ZdEhGZU1kREIwQSttcUlFY2M2OVJhaXM5L0ErNi85SG5QSFJtbTNTVTly?=
 =?utf-8?B?RldPSXdUbjZPVXNGa01xTUhpdGV0OWFGN3oyQnMrcGE3RFVYRGRPWWtVQWhT?=
 =?utf-8?B?UFVCSzJJa2ZTTllKR21wb1R6WkRzdSt4dkRjZ0tIZnpXaUIvOHZvbE0wWlVr?=
 =?utf-8?B?NS9wZmxuZzZBZC9zeUhWd0VLVXI3K2VyV3lIOWNUUXlkdm81YUNCY0ZPZFVJ?=
 =?utf-8?B?T1gxVThnREZBcU5ZTUJaRnNEd0FzVGhvWTZaLzRkNnRJR3FxQTE2UU5kcTJa?=
 =?utf-8?B?YktXS1g1Z2VqVEVRYnJRM2lvcFNIY0NjS3JsOWRTMDlzZGMxa0pKcXRYWmU3?=
 =?utf-8?B?VDVrWUFYRVRIN0NUTjRLTEtPU0cyN3dvbFV0amFBTWtQV0hOTklCb2U4aWFp?=
 =?utf-8?B?TEI3ckt2akdiajRUdEp1eGZ3SkZYVDB6YjVUZWV4MHJKYmx3bVFPS1VlTzBH?=
 =?utf-8?B?bUE3QlVCL2hMTlhENU5KR1J5N0crUHVvcWJDMlRnNUV5T3NSLzRXU3E0YXJR?=
 =?utf-8?B?ZStWbnI5RTYzUE5kd3VCMzEweGlCV0hEN1VocUhJbkRab3lWODl0S1QzOUxj?=
 =?utf-8?B?bGVsWWl1djk4a21SL09TRnd4WDQrK1B4WnpNcm94ZXVkOEFjK2wwSkNsd2JV?=
 =?utf-8?B?VTkvVlV1amV0QjhwNlEwUVRxL3lGR0xzQmRDb2ZhcUw5eWEzU2RCRmRZa3Er?=
 =?utf-8?B?c0diOC9pdTR3V0ExL1hpWS9CUG44R2RQci93UUNDUG5BMDVvSkowZkV6ZlE4?=
 =?utf-8?B?VHNCYTZMSjhtVk9pemFINHU4dURrNGlLbjY1Z3g5b1R6aElCMkRvdTFTdnFl?=
 =?utf-8?B?RnJqMUNJYURHeGU2RnhlV014ODl2dTYrS2lPR21qMmhaZWU3UG5KQ3ZUeXJt?=
 =?utf-8?B?TDhmY0dFeHpTNnp1TjcybHpzR1JSczFhQVpuQTRJNUFnL2RmNi9NTDhHN2FU?=
 =?utf-8?B?dDBhUGcxQS9JTVpZQ2cyR05WdGR2bGtGeTZOR0poVmtVSDg3KzRsZXU5end5?=
 =?utf-8?Q?PS8vfUp9/wumobatJ4oqkDV4f?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b97d70-9d53-435a-bdda-08da5b8e22b6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR02MB4436.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 18:18:45.9418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nFh0/44uvyj3javqv3b8IjXK7y15J32AjB08PgER4p7+h3bXau7gVVrkFFI7qx3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6484
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_111856_393278_3634584C 
X-CRM114-Status: GOOD (  10.33  )
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

MjAyMi0wNi0yOCBhdCAxNjowMywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gRnJvbTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9yZz4KPiAKPiBUaGUgdmFsdWUgcmV0
dXJuZWQgYnkgYW4gaTJjIGRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiBpcyBtb3N0bHkgaWdub3Jl
ZC4KPiAoT25seSBhbiBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQgaWYgdGhlIHZhbHVlIGlzIG5v
bi16ZXJvIHRoYXQgdGhlCj4gZXJyb3IgaXMgaWdub3JlZC4pCj4gCj4gU28gY2hhbmdlIHRoZSBw
cm90b3R5cGUgb2YgdGhlIHJlbW92ZSBmdW5jdGlvbiB0byByZXR1cm4gbm8gdmFsdWUuIFRoaXMK
PiB3YXkgZHJpdmVyIGF1dGhvcnMgYXJlIG5vdCB0ZW1wdGVkIHRvIGFzc3VtZSB0aGF0IHBhc3Np
bmcgYW4gZXJyb3IgdG8KPiB0aGUgdXBwZXIgbGF5ZXIgaXMgYSBnb29kIGlkZWEuIEFsbCBkcml2
ZXJzIGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5Lgo+IFRoZXJlIGlzIG5vIGludGVuZGVkIGNoYW5n
ZSBvZiBiZWhhdmlvdXIsIGFsbCBjYWxsYmFja3Mgd2VyZSBwcmVwYXJlZCB0bwo+IHJldHVybiAw
IGJlZm9yZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgoKRm9yIGRyaXZlcnMgSSdtIGludm9sdmVkIGluLCBuYW1l
bHk6Cgo+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LWx0YzQzMDYuYyAgICAgICAgICAgICAg
ICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTQxLmMg
ICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11
eC1wY2E5NTR4LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KPiAgc291bmQvc29jL2Nv
ZGVjcy9tYXg5ODYwLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KCkFj
a2VkLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgoKQ2hlZXJzLApQZXRlcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
