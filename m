Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A2DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 14:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecs5gREO4XcmhvRNFqHt/o0bYBEV3s5buFYfREjjP+Q=; b=H+I8YFLWPdpzB4
	ilypRGSan3uw9bIR7zoVcuMLQqQACoHwUdoMZRZQVgt8g53RDC22yQo/x6rtWy+iVBXH4A7E/g1kQ
	iyRWIsSWDusrcQR8sTCGPI8wW9cgRGpt0JTPAggiNRh00ZLREj9epj8QUq/TME+DdUakU+bDHvVg0
	Ceor4U/vV+5opQZKMYhwn+aWjjTifzgqzdHe7NUy5rA7GVAmVT3r8WG/LSpDG7mLnTP0uqOUTjuyk
	BVOQXokvOUhHfeFDRxnL3uhDGhHi8yRHWbnYiVU8aNAsvTt0CN4gpNVxEgGdd3LqasEDrlj7M/utz
	XHezsOYkva92KQb7+ZWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Z2A-00CaMp-Dq; Wed, 29 Jun 2022 14:51:15 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Z24-00CaI2-4V; Wed, 29 Jun 2022 14:51:09 +0000
Received: by mail-il1-x136.google.com with SMTP id a7so5351447ilj.2;
        Wed, 29 Jun 2022 07:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pwGATE3wVInOXzoFm3DL2iTGSvGusyPbH0jPamzrOPg=;
        b=B9oiCLcIrwwsffiAV8BVsVBfXybUkA5/wZMduPrd4uxnlky8stLK2tfDvUXny6iXKr
         JgHfuIg1T4A2bBVpND7mj4ZD6v4EfH9ADxTObhcX6xPh3I7vZ9BQG5yE8imCWk/OhbYC
         y77BYpEagODmPwREXk1EwgFqaosr/xKUAyn8S+8EchzGzV3HtL4IfoKvDu4K5Msq2ALx
         f3dq0MlZFz4EQr6JyLTd/ftNsrK8HspcqE3W8redGkzLH/HNAK9wWORCS20wSfpKl6n9
         0fVin9rSjvVAY9WniBd6EJIncRKM5IK1k+ieCfjqPXFzsZhYgwSjUnYxv8hhRn4qPsQK
         coGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pwGATE3wVInOXzoFm3DL2iTGSvGusyPbH0jPamzrOPg=;
        b=VqzHxwTwW4qgldUqnv/2hSdvB4MFyOifiZKOtIec+iML4r2AyQB8VNbhsFdSch70uS
         onBs3PkbwqZunRNMOS1mW0grcucz7+ZJ5f4ArO51DRV7nD3gRo7WJ1Jdi8eKK2gnast4
         X3Dw5/eA6l0i6RsVEanqerd2K3HE4hoAtJ9RRU9Sl+qOETm2YOoJLvvKw16iwB7MyTrV
         juSdmQfNVgICS8dj5HzpYmBmB/FzFBm3RdYcmIKVR79C13/sasHTZsn+R76ZTVpKvwPq
         iX1cxhOUjGrWsxGCm8JYH2pSOFgujmEvNrxoBr78GF5KJT30fd5gyd96wGdfycezVjf8
         V4Tw==
X-Gm-Message-State: AJIora9Ii5vGNt5DM9z1DqYNlYYI+OLUGbxZVjuV6EuERNJo+7XwUjMy
	xOYt3vUaJh1sszU/ZGSTals4cUtO7rQKUdryTmc=
X-Google-Smtp-Source: AGRyM1siTyQHr7dYH2cCZ2A9wYi3Xsx12U7qGA8A84nAaysz0D1Kg/QCuzQFR25at5Ho6J2u+X/CmeSal2jIei9STV8=
X-Received: by 2002:a05:6e02:168e:b0:2da:a9f0:c1aa with SMTP id
 f14-20020a056e02168e00b002daa9f0c1aamr2147237ila.151.1656514266336; Wed, 29
 Jun 2022 07:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de> <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 29 Jun 2022 16:50:55 +0200
Message-ID: <CANiq72nmXBv2z-LzEZe47iL39T2Bjjqr4pJqOCta-JCL4rZ9QA@mail.gmail.com>
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
	Adrien Grassein <adrien.grassein@gmail.com>, Peter Senna Tschudin <peter.senna@gmail.com>, 
	Martin Donnelly <martin.donnelly@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
	Douglas Anderson <dianders@chromium.org>, Stefan Mavrodiev <stefan@olimex.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Florian Fainelli <f.fainelli@gmail.com>, 
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
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, openipmi-developer@lists.sourceforge.net, 
	linux-integrity <linux-integrity@vger.kernel.org>, linux-clk@vger.kernel.org, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	chrome-platform@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	linux-input <linux-input@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-leds@vger.kernel.org, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, patches@opensource.cirrus.com, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>, linux-omap@vger.kernel.org, 
	MTD Maling List <linux-mtd@lists.infradead.org>, 
	Network Development <netdev@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Platform Driver <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-serial@vger.kernel.org, USB list <linux-usb@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, 
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>, 
	linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_075108_252801_C6D12129 
X-CRM114-Status: GOOD (  14.43  )
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

T24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgNDowOCBQTSBVd2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToKPgo+ICBkcml2ZXJzL2F1eGRpc3BsYXkv
aHQxNmszMy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVy
cy9hdXhkaXNwbGF5L2xjZDJzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMyAr
LS0KCkFja2VkLWJ5OiBNaWd1ZWwgT2plZGEgPG9qZWRhQGtlcm5lbC5vcmc+CgpDaGVlcnMsCk1p
Z3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
