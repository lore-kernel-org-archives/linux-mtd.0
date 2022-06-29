Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBB0C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 06:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U+AeuRx/OHo/DqhDgkUywwP8IN78b73Xt8jH2EVPyCc=; b=DV/dgFbFguoJC9
	Fv6bYHpiO09Shgl+SX0Es6vwzzOHBXI0ZOgVFOzWx1T//UToHiKXDYpsFG+UbmPPsDS3ri0J4B8g5
	giBPSd07lLg7RAG0rJWGizrV8eGNhu0ZtIMbUYxGJO3X83JY2yNBsOiqeNiCqKleKcjfxsQu7arOb
	1LujfpqWNnqj0GYJP/nsIo68khOcd4rb5V6OFikA1g+ASnl03mpjFHpTsJd/sOvCguuDBQL43LSlo
	OCVMjTLOZkdEQk6lqXAv+xqMvD/333GXIXBHJAXl/I7TUQuUmQJQ6njBgcvtBEtZyQ0lPt8Q2q1Ag
	ReYT0ScDM29w1AQhbdPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6RdV-009wDm-4o; Wed, 29 Jun 2022 06:57:17 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6RdO-009w8W-OX; Wed, 29 Jun 2022 06:57:12 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3177f4ce3e2so139010947b3.5;
        Tue, 28 Jun 2022 23:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EEF0s3kbEcxLFpcibr8V8xDuFD7v13Z6e3FjeyphC7I=;
        b=nsSF081Bg9S2+3GOlTH6XrhfGIPeUmWLWid6ZPtp9lP5RC66qSLIT9lGJdv3V1Ly2H
         4zyK4kb3eQ2X4ixLndS9DBelT4Uu0KqQ91O0V9TVHOakGiKDOprxvNtzMPrSPRgHQ/RA
         B6WUHV404SbHT4BxSq7MWNZNDBbfty+btGHitArFlg7IlsD1ZVV9II4UHdM9N2Vm6oMf
         ekHf7UFTEye1J5kZ+HwASbfVPkcujI28uq996nRSJ1Dx9u0s683SCk0D8q/IOtuDbhzQ
         pEH6P4NQkTD5F02v6fauebs93U42BcmVyM9qdAZNavlYJhyTVwuAFQMk/NeeWlN4OtRW
         yiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EEF0s3kbEcxLFpcibr8V8xDuFD7v13Z6e3FjeyphC7I=;
        b=yMWbeNtHEjOc58gWL73uu9aZe1UWSYm2fWpmNBAk6DlZsZXtQ30X5Kv4DvISTWQUQ7
         P7fcrr3/BCWBKmrKmEWz5hX7xo7Fo8D//2ZLvRDABwYrnNaEWCCTSx3Cu/5NuJAS4CIN
         Z0fhp3D4dYG3ENKF4hO7S40ZL+iwwio2eh7GsNauqtro4N6KgTs/If0po5G1o+RNjoJP
         RWDxwUF1uu+1gyA4LN6FcAei1FKq/87Pa/5LOmDcIHhuOcfz/RpEhopid3YPDnKxhFNw
         ELmGhGLTUf+UvnCz+doW033VsskXGBn0/BaBISRbrbE1DHTPV/R1BenJIkGh2iYmHgqe
         rXXQ==
X-Gm-Message-State: AJIora8Fr/perPdE+f9FjwI4TI5imVZQNZwbd56p3HTSUz4ZmYZY4fC8
	8LunDNv2BX2e0+6yX9MQY91+tlvxnt+jgq1/5CM=
X-Google-Smtp-Source: AGRyM1uWOHWVu25nP4xyDAyCW1mA6+5zKehfRh4LhyKSqmaNZ4gJWTIyI8cJ8wsZObnjobzQd9R6TNv/4nUq3TdxAlc=
X-Received: by 2002:a81:d91:0:b0:317:9176:56fe with SMTP id
 139-20020a810d91000000b00317917656femr2208847ywn.381.1656485826739; Tue, 28
 Jun 2022 23:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de> <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 29 Jun 2022 08:56:55 +0200
Message-ID: <CA+MoWDrJKP1YHcBwb8AKBr59eymHEZH9QEKEwOWL2pVK1LFDEQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Russell King <linux@armlinux.org.uk>, 
	Scott Wood <oss@buserror.net>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Corey Minyard <minyard@acm.org>, 
	Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Luca Ceresoli <luca@lucaceresoli.net>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Robert Foss <robert.foss@linaro.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Phong LE <ple@baylibre.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, Martin Donnelly <martin.donnelly@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Douglas Anderson <dianders@chromium.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jean Delvare <jdelvare@suse.com>, 
	George Joseph <george.joseph@fairview5.com>, Juerg Haefliger <juergh@gmail.com>, 
	Riku Voipio <riku.voipio@iki.fi>, Robert Marko <robert.marko@sartura.hr>, 
	Luka Perkov <luka.perkov@sartura.hr>, Marc Hulsman <m.hulsman@tudelft.nl>, 
	Rudolf Marek <r.marek@assembler.cz>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Dan Robertson <dan@dlrobertson.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Tomasz Duszynski <tduszyns@gmail.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Crt Mori <cmo@melexis.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Nick Dyer <nick@shmanahar.org>, 
	Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Jan-Simon Moeller <jansimon.moeller@gmx.de>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Colin Leroy <colin@colino.net>, Joe Tessler <jrt@google.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Antti Palosaari <crope@iki.fi>, Jasmin Jessich <jasmin@anw.at>, Matthias Schwarzott <zzam@gentoo.org>, 
	Olli Salonen <olli.salonen@iki.fi>, Akihiro Tsukada <tskd08@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Dongchun Zhu <dongchun.zhu@mediatek.com>, Shawn Tu <shawnx.tu@intel.com>, 
	Martin Kepplinger <martink@posteo.de>, Ricardo Ribalda <ribalda@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Leon Luo <leonl@leopardimaging.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bingbu Cao <bingbu.cao@intel.com>, 
	"Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Heungjun Kim <riverful.kim@samsung.com>, 
	Ramesh Shanmugasundaram <rashanmu@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Jimmy Su <jimmy.su@intel.com>, Arec Kao <arec.kao@intel.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Shunqian Zheng <zhengsq@rock-chips.com>, 
	Steve Longerbeam <slongerbeam@gmail.com>, Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Wenyou Yang <wenyou.yang@microchip.com>, 
	Petr Cvek <petrcvekcz@gmail.com>, Akinobu Mita <akinobu.mita@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Mats Randgaard <matrandg@cisco.com>, 
	Tim Harvey <tharvey@gateworks.com>, Matt Ranostay <matt.ranostay@konsulko.com>, 
	Eduardo Valentin <edubezval@gmail.com>, "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, 
	Lee Jones <lee.jones@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Support Opensource <support.opensource@diasemi.com>, Robert Jones <rjones@gateworks.com>, 
	Andy Shevchenko <andy@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tony Lindgren <tony@atomide.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Eric Piel <eric.piel@tremplin-utc.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	George McCollister <george.mccollister@gmail.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Matt Johnston <matt@codeconstruct.com.au>, Charles Gorand <charles.gorand@effinnov.com>, 
	Krzysztof Opasiak <k.opasiak@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Mark Gross <markgross@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Tobias Schrammm <t.schramm@manjaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Alessandro Zummo <a.zummo@towertech.it>, Jens Frederich <jfrederich@gmail.com>, 
	Jon Nettleton <jon.nettleton@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Helge Deller <deller@gmx.de>, Evgeniy Polyakov <zbr@ioremap.net>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, James Schulman <james.schulman@cirrus.com>, 
	David Rhodes <david.rhodes@cirrus.com>, Lucas Tanure <tanureal@opensource.cirrus.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Cernekee <cernekee@chromium.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Maxime Ripard <maxime@cerno.tech>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Lucas Stach <l.stach@pengutronix.de>, Jagan Teki <jagan@amarulasolutions.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Alex Deucher <alexander.deucher@amd.com>, Lyude Paul <lyude@redhat.com>, 
	Xin Ji <xji@analogixsemi.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	=?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, Angela Czubak <acz@semihalf.com>, 
	Alistair Francis <alistair@alistair23.me>, Eddie James <eajames@linux.ibm.com>, 
	Joel Stanley <joel@jms.id.au>, Nathan Chancellor <nathan@kernel.org>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Alexandru Ardelean <ardeleanalex@gmail.com>, 
	Dmitry Rokosov <DDRokosov@sberdevices.ru>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stephan Gerhold <stephan@gerhold.net>, 
	Miaoqian Lin <linmq006@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, 
	Yang Yingliang <yangyingliang@huawei.com>, Paul Cercueil <paul@crapouillou.net>, 
	Daniel Palmer <daniel@0x0f.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Marek Vasut <marex@denx.de>, 
	Jose Cazarin <joseespiriki@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Michael Srba <Michael.Srba@seznam.cz>, 
	Nikita Travkin <nikita@trvn.ru>, Maslov Dmitry <maslovdmitry@seeed.cc>, Jiri Valek - 2N <valek@2n.cz>, 
	Arnaud Ferraris <arnaud.ferraris@collabora.com>, Zheyu Ma <zheyuma97@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Oliver Graute <oliver.graute@kococonnector.com>, 
	Zheng Yongjun <zhengyongjun3@huawei.com>, CGEL ZTE <cgel.zte@gmail.com>, 
	Minghao Chi <chi.minghao@zte.com.cn>, Evgeny Novikov <novikov@ispras.ru>, Sean Young <sean@mess.org>, 
	Kirill Shilimanov <kirill.shilimanov@huawei.com>, 
	Moses Christopher Bollavarapu <mosescb.dev@gmail.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Dongliang Mu <mudongliangabcd@gmail.com>, 
	Colin Ian King <colin.king@intel.com>, lijian <lijian@yulong.com>, 
	Kees Cook <keescook@chromium.org>, Yan Lei <yan_lei@dahuatech.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jonas Malaco <jonas@protocubo.io>, 
	wengjianfeng <wengjianfeng@yulong.com>, Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	Wei Yongjun <weiyongjun1@huawei.com>, Tom Rix <trix@redhat.com>, Yizhuo <yzhai003@ucr.edu>, 
	Martiros Shakhzadyan <vrzh@vrzh.net>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Hector Martin <marcan@marcan.st>, Saranya Gopal <saranya.gopal@intel.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Sing-Han Chen <singhanc@nvidia.com>, Wayne Chang <waynec@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Vincent Knecht <vincent.knecht@mailoo.org>, 
	Stephen Kitt <steve@sk2.org>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Randy Dunlap <rdunlap@infradead.org>, 
	Alejandro Tafalla <atafalla@dnyon.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Seven Lee <wtli@nuvoton.com>, Mac Chiang <mac.chiang@intel.com>, David Lin <CTLIN0@nuvoton.com>, 
	Daniel Beer <daniel.beer@igorinstitute.com>, Ricard Wanderlof <ricardw@axis.com>, 
	Simon Trimmer <simont@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Viorel Suman <viorel.suman@nxp.com>, Nicola Lunghi <nick83ola@gmail.com>, 
	Adam Ford <aford173@gmail.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	openipmi-developer@lists.sourceforge.net, linux-integrity@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-input@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org, 
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_235710_840429_205EF6FC 
X-CRM114-Status: GOOD (  15.94  )
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

T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgNDowNSBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+IEZyb206IFV3ZSBLbGVpbmUtS8O2
bmlnIDx1d2VAa2xlaW5lLWtvZW5pZy5vcmc+Cj4KPiBUaGUgdmFsdWUgcmV0dXJuZWQgYnkgYW4g
aTJjIGRyaXZlcidzIHJlbW92ZSBmdW5jdGlvbiBpcyBtb3N0bHkgaWdub3JlZC4KPiAoT25seSBh
biBlcnJvciBtZXNzYWdlIGlzIHByaW50ZWQgaWYgdGhlIHZhbHVlIGlzIG5vbi16ZXJvIHRoYXQg
dGhlCj4gZXJyb3IgaXMgaWdub3JlZC4pCj4KPiBTbyBjaGFuZ2UgdGhlIHByb3RvdHlwZSBvZiB0
aGUgcmVtb3ZlIGZ1bmN0aW9uIHRvIHJldHVybiBubyB2YWx1ZS4gVGhpcwo+IHdheSBkcml2ZXIg
YXV0aG9ycyBhcmUgbm90IHRlbXB0ZWQgdG8gYXNzdW1lIHRoYXQgcGFzc2luZyBhbiBlcnJvciB0
bwo+IHRoZSB1cHBlciBsYXllciBpcyBhIGdvb2QgaWRlYS4gQWxsIGRyaXZlcnMgYXJlIGFkYXB0
ZWQgYWNjb3JkaW5nbHkuCj4gVGhlcmUgaXMgbm8gaW50ZW5kZWQgY2hhbmdlIG9mIGJlaGF2aW91
ciwgYWxsIGNhbGxiYWNrcyB3ZXJlIHByZXBhcmVkIHRvCj4gcmV0dXJuIDAgYmVmb3JlLgo+Cj4g
U2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRy
b25peC5kZT4KPiAtLS0KClsuLi5dCgo+ICBzdGF0aWMgc3RydWN0IGkyY19kZXZpY2VfaWQgbHQ5
NjExdXhjX2lkW10gPSB7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWVn
YWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9t
ZWdhY2hpcHMtc3RkcHh4eHgtZ2UtYjg1MHYzLWZ3LmMKPiBpbmRleCBjY2U5OGJmMmE0ZTcuLjlm
MTc1ZGYxMTU4MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21lZ2FjaGlw
cy1zdGRweHh4eC1nZS1iODUwdjMtZncuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
bWVnYWNoaXBzLXN0ZHB4eHh4LWdlLWI4NTB2My1mdy5jCj4gQEAgLTM1NSwxMSArMzU1LDkgQEAg
c3RhdGljIGludCBzdGRwNDAyOF9nZV9iODUwdjNfZndfcHJvYmUoc3RydWN0IGkyY19jbGllbnQg
KnN0ZHA0MDI4X2kyYywKPiAgICAgICAgIHJldHVybiBnZV9iODUwdjNfcmVnaXN0ZXIoKTsKPiAg
fQo+Cj4gLXN0YXRpYyBpbnQgc3RkcDQwMjhfZ2VfYjg1MHYzX2Z3X3JlbW92ZShzdHJ1Y3QgaTJj
X2NsaWVudCAqc3RkcDQwMjhfaTJjKQo+ICtzdGF0aWMgdm9pZCBzdGRwNDAyOF9nZV9iODUwdjNf
ZndfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpzdGRwNDAyOF9pMmMpCj4gIHsKPiAgICAgICAg
IGdlX2I4NTB2M19sdmRzX3JlbW92ZSgpOwo+IC0KPiAtICAgICAgIHJldHVybiAwOwo+ICB9Cj4K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNlX2lkIHN0ZHA0MDI4X2dlX2I4NTB2M19m
d19pMmNfdGFibGVbXSA9IHsKPiBAQCAtNDA1LDExICs0MDMsOSBAQCBzdGF0aWMgaW50IHN0ZHAy
NjkwX2dlX2I4NTB2M19md19wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqc3RkcDI2OTBfaTJjLAo+
ICAgICAgICAgcmV0dXJuIGdlX2I4NTB2M19yZWdpc3RlcigpOwo+ICB9Cj4KPiAtc3RhdGljIGlu
dCBzdGRwMjY5MF9nZV9iODUwdjNfZndfcmVtb3ZlKHN0cnVjdCBpMmNfY2xpZW50ICpzdGRwMjY5
MF9pMmMpCj4gK3N0YXRpYyB2b2lkIHN0ZHAyNjkwX2dlX2I4NTB2M19md19yZW1vdmUoc3RydWN0
IGkyY19jbGllbnQgKnN0ZHAyNjkwX2kyYykKPiAgewo+ICAgICAgICAgZ2VfYjg1MHYzX2x2ZHNf
cmVtb3ZlKCk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICBzdGF0aWMgY29uc3Qg
c3RydWN0IGkyY19kZXZpY2VfaWQgc3RkcDI2OTBfZ2VfYjg1MHYzX2Z3X2kyY190YWJsZVtdID0g
ewpSZXZpZXdlZC1ieTogUGV0ZXIgU2VubmEgVHNjaHVkaW4gPHBldGVyLnNlbm5hQGdtYWlsLmNv
bT4KClsuLi5dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
