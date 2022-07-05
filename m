Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F51AC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Jul 2022 20:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mf3NUmI9Q3Nm+ewU3S+Bt8PdT7xTf2/mVB42ftm4nGY=; b=tdtz740ptFtYW2
	MBtRfZHUnGcNbjmm6XfK74JmOXM9nclWj1qqQZHUg8if1Dug5U1RQ9U+tGdx211eqi92UBIP01Xgt
	ytSpbSOsKXj2pQOTnEheZ0JS2S5ywsPVHzKfMw/7GU/4a5Lio3o6RCkXBgQbywcMGIQ4loWCJcEAs
	0SAXWewnPtxTBb7M/z8l9bluDFlMU44yxNdN8rUnpoglQx1DN2hwurcL+HnaMC9DtA0kR32Mlq5Lj
	wtd+FqmIM4BeXiBj2A58BtOPHNUqPGZD5qHiIwepsVLDhWXkWJw6ekXBcXBiI4XNGG2GQvQJhrpJJ
	CP2ZdXOScnQ4g5g9ueiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ou3-002Yfp-9d; Tue, 05 Jul 2022 20:12:11 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8otz-002Ydr-2X; Tue, 05 Jul 2022 20:12:08 +0000
Received: by mail-qk1-x72f.google.com with SMTP id n10so9575256qkn.10;
        Tue, 05 Jul 2022 13:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:reply-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
        b=jzyDqqOsmOiFQpBNDEIIiq2MN35QtJrUD2/ujzSWycMbbCOOa/kXWzucbOzXvgJPlM
         l41OpTnwJFtVKAh9ESeTZGx5QRNGnFLf7Ve6XK/dYXbRSWYolxdZFruwb2QvUjtDqKp3
         XPq8C5Jcp4JG3opZdh2U+imHALhK3sBAHCCrGSqp8Vv6nsMRfMt39kYqHYOSFDIblB6A
         qByLsJ7MJ8hdI1n2d+9GcDpXsaJ8cJ751FUYmiFAN8pTN8GWtaPdCiQlJR4UCA74w7VK
         BYLuDVNV9YmL+YjlB3aU/m2FQ5afMCy9VI/vJGznIenuOAJI2wSPMGBH0t9pzT1ABtei
         oFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :reply-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=OTC6txqtQct8PJfU00O4zbYgNzmzFUtn37nCnhn8x1k=;
        b=E8yn0Hz9QxF3ZgyZtCdQJpYAzHWHrBQIxhZ6ttHjc84nP7gycMQ4oHLP4EbzWpnXJ/
         hv09JXIFzCLZDkVL9eaOIu0oxzWAmNuTLLJQVVmbd6aKnxspVaau4B5Oj2VfgHeQDFoV
         lSypgvigq/jW1Dl5JJYD4PV4vxa3VaPaYe1wINItapFlLgA5V4uwta74Nsd3DxxhOd6a
         EPjH3mtmrS9neRO2BJwbTYVdPBneV/KDP5yS9PgFPiKTbyuh7RHF5whuXhLHztJvWKCb
         w6IPtdAlBW/SXoxIwT/A6kXYHMwI3LW5gKdU2Xj07b+60jbNnVFEAYl8JTAt6UgQJrFi
         EfZA==
X-Gm-Message-State: AJIora8bv5T6tnIilvcwgNMdIpIBgL0SEGUNsuwYNaACQBhLpCBqADXa
	AXDmf6ZGpq20rgJ9S8qdMzRlmko3/NFC
X-Google-Smtp-Source: AGRyM1v0OJ93Nu3s63zVNhYbXwTamj5LdNYK8gxlMvIKZ0kjVcSqwnmSr3p+XEHk7rqxFSougreCpA==
X-Received: by 2002:a05:620a:385:b0:6af:1f2b:9168 with SMTP id q5-20020a05620a038500b006af1f2b9168mr24692503qkm.170.1657051922136;
        Tue, 05 Jul 2022 13:12:02 -0700 (PDT)
Received: from serve.minyard.net ([47.184.144.75])
        by smtp.gmail.com with ESMTPSA id r8-20020a05620a298800b006b4689e3425sm5643578qkp.129.2022.07.05.13.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 13:12:01 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:1895:1b49:2a68:29f7])
	by serve.minyard.net (Postfix) with ESMTPSA id B3B861800BD;
	Tue,  5 Jul 2022 20:11:57 +0000 (UTC)
Date: Tue, 5 Jul 2022 15:11:56 -0500
From: Corey Minyard <minyard@acm.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Luca Ceresoli <luca@lucaceresoli.net>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>, Phong LE <ple@baylibre.com>,
	Adrien Grassein <adrien.grassein@gmail.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Martin Donnelly <martin.donnelly@ge.com>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Douglas Anderson <dianders@chromium.org>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jean Delvare <jdelvare@suse.com>,
	George Joseph <george.joseph@fairview5.com>,
	Juerg Haefliger <juergh@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Robert Marko <robert.marko@sartura.hr>,
	Luka Perkov <luka.perkov@sartura.hr>,
	Marc Hulsman <m.hulsman@tudelft.nl>,
	Rudolf Marek <r.marek@assembler.cz>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Dan Robertson <dan@dlrobertson.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Tomasz Duszynski <tduszyns@gmail.com>,
	Kevin Tsai <ktsai@capellamicro.com>, Crt Mori <cmo@melexis.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Nick Dyer <nick@shmanahar.org>, Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>,
	Jan-Simon Moeller <jansimon.moeller@gmx.de>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Colin Leroy <colin@colino.net>, Joe Tessler <jrt@google.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Antti Palosaari <crope@iki.fi>, Jasmin Jessich <jasmin@anw.at>,
	Matthias Schwarzott <zzam@gentoo.org>,
	Olli Salonen <olli.salonen@iki.fi>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Shawn Tu <shawnx.tu@intel.com>,
	Martin Kepplinger <martink@posteo.de>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Leon Luo <leonl@leopardimaging.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Heungjun Kim <riverful.kim@samsung.com>,
	Ramesh Shanmugasundaram <rashanmu@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Jimmy Su <jimmy.su@intel.com>, Arec Kao <arec.kao@intel.com>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Wenyou Yang <wenyou.yang@microchip.com>,
	Petr Cvek <petrcvekcz@gmail.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mats Randgaard <matrandg@cisco.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Matt Ranostay <matt.ranostay@konsulko.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	"Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Robert Jones <rjones@gateworks.com>,
	Andy Shevchenko <andy@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Tony Lindgren <tony@atomide.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	George McCollister <george.mccollister@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Charles Gorand <charles.gorand@effinnov.com>,
	Krzysztof Opasiak <k.opasiak@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mark Gross <markgross@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Jens Frederich <jfrederich@gmail.com>,
	Jon Nettleton <jon.nettleton@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
	Evgeniy Polyakov <zbr@ioremap.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Maxime Ripard <maxime@cerno.tech>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Lucas Stach <l.stach@pengutronix.de>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Alex Deucher <alexander.deucher@amd.com>,
	Lyude Paul <lyude@redhat.com>, Xin Ji <xji@analogixsemi.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Angela Czubak <acz@semihalf.com>,
	Alistair Francis <alistair@alistair23.me>,
	Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alexandru Ardelean <ardeleanalex@gmail.com>,
	Dmitry Rokosov <DDRokosov@sberdevices.ru>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Miaoqian Lin <linmq006@gmail.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Palmer <daniel@0x0f.com>, Haibo Chen <haibo.chen@nxp.com>,
	Cai Huoqing <cai.huoqing@linux.dev>, Marek Vasut <marex@denx.de>,
	Jose Cazarin <joseespiriki@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Michael Srba <Michael.Srba@seznam.cz>,
	Nikita Travkin <nikita@trvn.ru>,
	Maslov Dmitry <maslovdmitry@seeed.cc>,
	Jiri Valek - 2N <valek@2n.cz>,
	Arnaud Ferraris <arnaud.ferraris@collabora.com>,
	Zheyu Ma <zheyuma97@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Oliver Graute <oliver.graute@kococonnector.com>,
	Zheng Yongjun <zhengyongjun3@huawei.com>,
	CGEL ZTE <cgel.zte@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>,
	Evgeny Novikov <novikov@ispras.ru>, Sean Young <sean@mess.org>,
	Kirill Shilimanov <kirill.shilimanov@huawei.com>,
	Moses Christopher Bollavarapu <mosescb.dev@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Dongliang Mu <mudongliangabcd@gmail.com>,
	Colin Ian King <colin.king@intel.com>, lijian <lijian@yulong.com>,
	Kees Cook <keescook@chromium.org>, Yan Lei <yan_lei@dahuatech.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jonas Malaco <jonas@protocubo.io>,
	wengjianfeng <wengjianfeng@yulong.com>,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>,
	Wei Yongjun <weiyongjun1@huawei.com>, Tom Rix <trix@redhat.com>,
	Yizhuo <yzhai003@ucr.edu>, Martiros Shakhzadyan <vrzh@vrzh.net>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Saranya Gopal <saranya.gopal@intel.com>,
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
	Sing-Han Chen <singhanc@nvidia.com>,
	Wayne Chang <waynec@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Stephen Kitt <steve@sk2.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alejandro Tafalla <atafalla@dnyon.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Seven Lee <wtli@nuvoton.com>, Mac Chiang <mac.chiang@intel.com>,
	David Lin <CTLIN0@nuvoton.com>,
	Daniel Beer <daniel.beer@igorinstitute.com>,
	Ricard Wanderlof <ricardw@axis.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Viorel Suman <viorel.suman@nxp.com>,
	Nicola Lunghi <nick83ola@gmail.com>, Adam Ford <aford173@gmail.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, chrome-platform@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220705201156.GL908082@minyard.net>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_131207_179079_4D0653F0 
X-CRM114-Status: GOOD (  12.51  )
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
Reply-To: minyard@acm.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgMDQ6MDM6MTJQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gRnJvbTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3ZUBrbGVpbmUta29lbmlnLm9y
Zz4KPiAKPiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYW4gaTJjIGRyaXZlcidzIHJlbW92ZSBmdW5j
dGlvbiBpcyBtb3N0bHkgaWdub3JlZC4KPiAoT25seSBhbiBlcnJvciBtZXNzYWdlIGlzIHByaW50
ZWQgaWYgdGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRoYXQgdGhlCj4gZXJyb3IgaXMgaWdub3JlZC4p
Cj4gCj4gU28gY2hhbmdlIHRoZSBwcm90b3R5cGUgb2YgdGhlIHJlbW92ZSBmdW5jdGlvbiB0byBy
ZXR1cm4gbm8gdmFsdWUuIFRoaXMKPiB3YXkgZHJpdmVyIGF1dGhvcnMgYXJlIG5vdCB0ZW1wdGVk
IHRvIGFzc3VtZSB0aGF0IHBhc3NpbmcgYW4gZXJyb3IgdG8KPiB0aGUgdXBwZXIgbGF5ZXIgaXMg
YSBnb29kIGlkZWEuIEFsbCBkcml2ZXJzIGFyZSBhZGFwdGVkIGFjY29yZGluZ2x5Lgo+IFRoZXJl
IGlzIG5vIGludGVuZGVkIGNoYW5nZSBvZiBiZWhhdmlvdXIsIGFsbCBjYWxsYmFja3Mgd2VyZSBw
cmVwYXJlZCB0bwo+IHJldHVybiAwIGJlZm9yZS4KCkZvciBJUE1JIHBvcnRpb25zIGJlbG93OgoK
QWNrZWQtYnk6IENvcmV5IE1pbnlhcmQgPGNuaW55YXJkQG12aXN0YS5jb20+Cgo+ICAKPiAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIGxjZDJzX2kyY19pZFtdID0gewo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2NoYXIvaXBtaS9pcG1iX2Rldl9pbnQuYyBiL2RyaXZlcnMvY2hhci9p
cG1pL2lwbWJfZGV2X2ludC5jCj4gaW5kZXggZGI0MDAzN2ViMzQ3Li5hMGU5ZTgwZDkyZWUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9jaGFyL2lwbWkvaXBtYl9kZXZfaW50LmMKPiArKysgYi9kcml2
ZXJzL2NoYXIvaXBtaS9pcG1iX2Rldl9pbnQuYwo+IEBAIC0zNDEsMTQgKzM0MSwxMiBAQCBzdGF0
aWMgaW50IGlwbWJfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgCXJldHVybiAw
Owo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IGlwbWJfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpCj4gK3N0YXRpYyB2b2lkIGlwbWJfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGll
bnQpCj4gIHsKPiAgCXN0cnVjdCBpcG1iX2RldiAqaXBtYl9kZXYgPSBpMmNfZ2V0X2NsaWVudGRh
dGEoY2xpZW50KTsKPiAgCj4gIAlpMmNfc2xhdmVfdW5yZWdpc3RlcihjbGllbnQpOwo+ICAJbWlz
Y19kZXJlZ2lzdGVyKCZpcG1iX2Rldi0+bWlzY2Rldik7Cj4gLQo+IC0JcmV0dXJuIDA7Cj4gIH0K
PiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaTJjX2RldmljZV9pZCBpcG1iX2lkW10gPSB7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9pcG1pL2lwbWlfaXBtYi5jIGIvZHJpdmVycy9jaGFy
L2lwbWkvaXBtaV9pcG1iLmMKPiBpbmRleCBhYjE5YjRiMzMxN2UuLjI1YzAxMGM5ZWMyNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2NoYXIvaXBtaS9pcG1pX2lwbWIuYwo+ICsrKyBiL2RyaXZlcnMv
Y2hhci9pcG1pL2lwbWlfaXBtYi5jCj4gQEAgLTQyNCw3ICs0MjQsNyBAQCBzdGF0aWMgdm9pZCBp
cG1pX2lwbWJfcmVxdWVzdF9ldmVudHModm9pZCAqc2VuZF9pbmZvKQo+ICAJLyogV2UgZG9uJ3Qg
ZmV0Y2ggZXZlbnRzIGhlcmUuICovCj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgaXBtaV9pcG1iX3Jl
bW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICtzdGF0aWMgdm9pZCBpcG1pX2lwbWJf
cmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gIHsKPiAgCXN0cnVjdCBpcG1pX2lw
bWJfZGV2ICppaWRldiA9IGkyY19nZXRfY2xpZW50ZGF0YShjbGllbnQpOwo+ICAKPiBAQCAtNDM4
LDggKzQzOCw2IEBAIHN0YXRpYyBpbnQgaXBtaV9pcG1iX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50KQo+ICAJaXBtaV9pcG1iX3N0b3BfdGhyZWFkKGlpZGV2KTsKPiAgCj4gIAlpcG1p
X3VucmVnaXN0ZXJfc21pKGlpZGV2LT5pbnRmKTsKPiAtCj4gLQlyZXR1cm4gMDsKPiAgfQo+ICAK
PiAgc3RhdGljIGludCBpcG1pX2lwbWJfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL2lwbWkvaXBtaV9zc2lmLmMgYi9kcml2ZXJzL2No
YXIvaXBtaS9pcG1pX3NzaWYuYwo+IGluZGV4IGZjNzQyZWU5YzA0Ni4uMTNkYTAyMWU3YzZiIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvY2hhci9pcG1pL2lwbWlfc3NpZi5jCj4gKysrIGIvZHJpdmVy
cy9jaGFyL2lwbWkvaXBtaV9zc2lmLmMKPiBAQCAtMTI4MSwxMyArMTI4MSwxMyBAQCBzdGF0aWMg
dm9pZCBzaHV0ZG93bl9zc2lmKHZvaWQgKnNlbmRfaW5mbykKPiAgCX0KPiAgfQo+ICAKPiAtc3Rh
dGljIGludCBzc2lmX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICtzdGF0aWMg
dm9pZCBzc2lmX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ICB7Cj4gIAlzdHJ1
Y3Qgc3NpZl9pbmZvICpzc2lmX2luZm8gPSBpMmNfZ2V0X2NsaWVudGRhdGEoY2xpZW50KTsKPiAg
CXN0cnVjdCBzc2lmX2FkZHJfaW5mbyAqYWRkcl9pbmZvOwo+ICAKPiAgCWlmICghc3NpZl9pbmZv
KQo+IC0JCXJldHVybiAwOwo+ICsJCXJldHVybjsKPiAgCj4gIAkvKgo+ICAJICogQWZ0ZXIgdGhp
cyBwb2ludCwgd2Ugd29uJ3QgZGVsaXZlciBhbnl0aGluZyBhc3ljaHJvbm91c2x5Cj4gQEAgLTEz
MDMsOCArMTMwMyw2IEBAIHN0YXRpYyBpbnQgc3NpZl9yZW1vdmUoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCkKPiAgCX0KPiAgCj4gIAlrZnJlZShzc2lmX2luZm8pOwo+IC0KPiAtCXJldHVybiAw
Owo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IHJlYWRfcmVzcG9uc2Uoc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCwgdW5zaWduZWQgY2hhciAqcmVzcCkKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
