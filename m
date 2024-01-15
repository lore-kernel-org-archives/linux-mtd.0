Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A757C3DA79
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Jan 2024 20:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1IgP/yKMLZWcYDOg70rUIP0/uHpHjuXPvgvcjifynns=; b=KCkaPlEky7JcMR
	stCHnB7yoZVHbrX6e9+qBKR6sVAYM/GedWlgbStVhVtc5XWLye+JAlc98X2GdYag7KP3la623f7oS
	8Mh20dtTWNdZTVyRYr0x+q/Tp4+8XbWJau1yqdOIw76S9CbLTH4jqXTv4hZ1x1Qujv7VPxM+m0c6j
	dW4TK2CUFZr054P1u6ONoN/YpbsFIghL5HMp+mFN0/oXZ08FcBSJEqC/xe3Avq3UM5sd9taVwpx0o
	K4swTVNP5yxYJfjXmMjmZyO9732kLDOHBHsKR43LXTTvjibJeX1zwKD1xhqguQgEw9Al57FxF4xlY
	Z29J+YhkAySpUoOvoTcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPTU9-00A8mq-0Y;
	Mon, 15 Jan 2024 20:23:05 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPTU6-00A8lf-0G
	for linux-mtd@lists.infradead.org;
	Mon, 15 Jan 2024 20:23:03 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSJ-0004fv-Vc; Mon, 15 Jan 2024 21:21:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSC-0005fw-T0; Mon, 15 Jan 2024 21:21:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSC-000N73-2E;
	Mon, 15 Jan 2024 21:21:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-fpga@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sergey Kozlov <serjk@netup.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-mmc@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Rob Herring <robh@kernel.org>,
	linux-mtd@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Michal Simek <michal.simek@amd.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	Helge Deller <deller@gmx.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Kalle Valo <kvalo@kernel.org>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	libertas-dev@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	James Clark <james.clark@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 00/33] spi: get rid of some legacy macros
Date: Mon, 15 Jan 2024 21:12:46 +0100
Message-ID: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6320; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=4XhGTLODNw8yhIWMecN5LnSB/9sNwzZ7ZtVxoa/j52s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlpZHAtVz/M7HYOTe/qdG2V00aOQMH7pbvHciH8 Vd+hMtY79eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZaWRwAAKCRCPgPtYfRL+ TmMcB/9KE9qwNyMSSIfdofdQbKyCv4Jl+hXy0kKEYM/VNzbklICtWwj9498FhxF8B9thFSDK3gp DulZCe7rJn+MKx/eJphonzR1LVWev1YTJ2kkqaeBZRIN4i1mYHInwS35ESw2q+zwzVxxA5C1ESX kW25rOyy4D74faKClkI6O9XJ8+8hTw+2V1FDTJCM3vzxmqJnOLbi+YQW48FklGIPMoSqjx8aCyd SI61u1H7VyOe/EymwrynrT3G6SCnlHBYtfL1qLmsfALHT2BaON0BD/T5W5/wZjxuPBbtdlD253K rqyhVZMP3ez427R7zZKU1qhJqs7O6YTGrydt0et9PARzYGe0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_122302_272287_C4CB458A 
X-CRM114-Status: GOOD (  18.93  )
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

SGVsbG8sCgpJbiBjb21taXQgOGNhYWI3NWZkMmMyICgic3BpOiBHZW5lcmFsaXplIFNQSSAibWFz
dGVyIiB0byAiY29udHJvbGxlciIiKQpzb21lIGZ1bmN0aW9ucyB3ZXJlIHJlbmFtZWQuIEZ1cnRo
ZXIgc29tZSBjb21wYXQgZGVmaW5lcyB3ZXJlIGludHJvZHVjZWQKdG8gbWFwIHRoZSBvbGQgbmFt
ZXMgdG8gdGhlIG5ldyBvbmVzLgoKSW4gdGhpcyBzZXJpZXMgYWxsIGRyaXZlcnMgc3RpbGwgdXNp
bmcgdGhlIG9sZCBuYW1lcyBhcmUgY2hhbmdlZCB0byB1c2UKdGhlIG5ldyBvbmVzIGFuZCB0aGVu
IGluIHBhdGNoICMzMiB0aGUgY29tcGF0IGRlZmluZXMgYXJlIGRyb3BwZWQuClZhcmlhYmxlcyBh
bmQgc3RydWN0IG1lbWJlcnMgb2YgdHlwZSBwb2ludGVyIHRvIHN0cnVjdCBzcGlfY29udHJvbGxl
ciB0aGF0IHdlcmUKbmFtZWQgIm1hc3RlciIgKG1hdGNoaW5nIHRoZSBvbGQgbmFtZSBvZiBzcGlf
Y29udHJvbGxlcikgd2VyZSByZW5hbWVkIHRvCiJjdGxyIiwgd2hpY2ggc2xpZ2h0bHkgaW5jcmVh
c2VkIHRoZSBjb3VudCBvZiB0b3VjaGVkIGxpbmVzLCBidXQgaXMgbmljZQpmb3IgY29uc2lzdGVu
Y3kuCgpQYXRjaCAjMTggYW5kICMxOSB0b3VjaCB0aGUgc2FtZSBkcml2ZXIsIG90aGVyd2lzZSB0
aGUgcGF0Y2hlcyAjMSAtICMzMQphcmUgcGFpcndpc2UgaW5kZXBlbmRlbnQgYW5kIGNvdWxkIGJl
IGFwcGxpZWQgYnkgdGhlaXIgcmVzcGVjdGl2ZQptYWludGFpbmVycy4gVGhlIGFsdGVybmF0aXZl
IGlzIHRvIGxldCBhbGwgcGF0Y2hlcyBnbyB2aWEgdGhlIHNwaSB0cmVlLgpNYXJrLCB3aGF0J3Mg
eW91ciBwcmVmZXJlbmNlIGhlcmU/CgpQYXRjaCAjMzMgdXBkYXRlcyB0aGUgZG9jdW1lbnRhdGlv
bi4gKFRoaXMgb25lIGlzIGEgYml0IGZ1enp5LCBiZWNhdXNlCml0IGFsc28gZG9lcyBzb21lIHMv
bWFzdGVyL2hvc3QvIHdoaWNoIGRvZXNuJ3QgbWF0Y2ggdGhlIHJlbWFpbmRlciBvZgp0aGUgc2Vy
aWVzKS4gQWxzbyBwYXRjaCAjMTggaXMgYW4gaW1wcm92ZW1lbnQgSSBub3RpY2VkIHdoaWxlIHRv
dWNoaW5nCnRoaXMgZHJpdmVyIHRoYXQgZG9lc24ndCBtYXRjaCB0aGUgc2VyaWVzJyB0b3BpYy4g
SSBzdGlsbCBrZXB0IGl0CmluY2x1ZGVkIGhlcmUuIElmIHlvdSBzaG91bGQgbm90IGxpa2UgaXQs
IGl0IGNhbiBqdXN0IGJlIGRyb3BwZWQuCgpCZXN0IHJlZ2FyZHMKVXdlCgpVd2UgS2xlaW5lLUvD
tm5pZyAoMzMpOgogIGZwZ2E6IGljZTQwLXNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFz
dGVyIiB0byAiY29udHJvbGxlciIKICBpZWVlODAyMTU0OiBjYTgyMTA6IEZvbGxvdyByZW5hbWlu
ZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgaWlvOiBhZGM6IGFkX3NpZ21hX2Rl
bHRhOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIElu
cHV0OiBweHNwYWQgLSBmb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9s
bGVyIgogIElucHV0OiBzeW5hcHRpY3Mtcm1pNCAtIGZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1h
c3RlciIgdG8gImNvbnRyb2xsZXIiCiAgbWVkaWE6IG1nYjQ6IEZvbGxvdyByZW5hbWluZyBvZiBT
UEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgbWVkaWE6IG5ldHVwX3VuaWR2YjogRm9sbG93
IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICBtZWRpYTogdXNiL21z
aTI1MDA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAg
bWVkaWE6IHY0bDItc3ViZGV2OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJj
b250cm9sbGVyIgogIG1pc2M6IGdlaGMtYWNoYzogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFz
dGVyIiB0byAiY29udHJvbGxlciIKICBtbWM6IG1tY19zcGk6IEZvbGxvdyByZW5hbWluZyBvZiBT
UEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgbXRkOiBkYXRhZmxhc2g6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgbXRkOiByYXduYW5kOiBmc2xf
ZWxiYzogTGV0IC5wcm9iZSByZXRyeSBpZiBsb2NhbCBidXMgaXMgbWlzc2luZwogIG5ldDoga3M4
ODUxOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIG5l
dDogdmVydGV4Y29tOiBtc2UxMDJ4OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRv
ICJjb250cm9sbGVyIgogIHBsYXRmb3JtL2Nocm9tZTogY3Jvc19lY19zcGk6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgc3BpOiBiaXRiYW5nOiBGb2xs
b3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTogY2FkZW5j
ZS1xdWFkc3BpOiBEb24ndCBlbWl0IGVycm9yIG1lc3NhZ2Ugb24gYWxsb2NhdGlvbiBlcnJvcgog
IHNwaTogY2FkZW5jZS1xdWFkc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRv
ICJjb250cm9sbGVyIgogIHNwaTogY2F2aXVtOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTogZ2VuaS1xY29tOiBGb2xsb3cgcmVuYW1pbmcgb2Yg
U1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTogbG9vcGJhY2stdGVzdDogRm9sbG93
IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICBzcGk6IHNsYXZlLW10
Mjd4eDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICBz
cGk6IHNwaWRldjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxl
ciIKICBzdGFnaW5nOiBmYnRmdDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAi
Y29udHJvbGxlciIKICBzdGFnaW5nOiBncmV5YnVzOiBzcGk6IEZvbGxvdyByZW5hbWluZyBvZiBT
UEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgdHBtX3Rpc19zcGk6IEZvbGxvdyByZW5hbWlu
ZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgdXNiOiBnYWRnZXQ6IG1heDM0MjBf
dWRjOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIHZp
ZGVvOiBmYmRldjogbW1wOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250
cm9sbGVyIgogIHdpZmk6IGxpYmVydGFzOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIi
IHRvICJjb250cm9sbGVyIgogIHNwaTogZnNsLWxpYjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAi
bWFzdGVyIiB0byAiY29udHJvbGxlciIKICBzcGk6IERyb3AgY29tcGF0IGxheWVyIGZyb20gcmVu
YW1pbmcgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgRG9jdW1lbnRhdGlvbjogc3BpOiBVcGRh
dGUgZG9jdW1lbnRhdGlvbiBmb3IgcmVuYW1pbmcgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCgog
Li4uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QgICAgICAgIHwgIDIgKy0KIERv
Y3VtZW50YXRpb24vc3BpL3NwaS1zdW1tYXJ5LnJzdCAgICAgICAgICAgICB8IDc0ICsrKysrKysr
Ky0tLS0tLS0tLS0KIGRyaXZlcnMvY2hhci90cG0vdHBtX3Rpc19zcGlfbWFpbi5jICAgICAgICAg
ICB8ICA0ICstCiBkcml2ZXJzL2ZwZ2EvaWNlNDAtc3BpLmMgICAgICAgICAgICAgICAgICAgICAg
fCAgNCArLQogZHJpdmVycy9paW8vYWRjL2FkX3NpZ21hX2RlbHRhLmMgICAgICAgICAgICAgIHwg
MTQgKystLQogZHJpdmVycy9pbnB1dC9qb3lzdGljay9wc3hwYWQtc3BpLmMgICAgICAgICAgIHwg
IDQgKy0KIGRyaXZlcnMvaW5wdXQvcm1pNC9ybWlfc3BpLmMgICAgICAgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfY29yZS5jICAgICAgICAgICAgfCAxNCAr
Ky0tCiAuLi4vbWVkaWEvcGNpL25ldHVwX3VuaWR2Yi9uZXR1cF91bmlkdmJfc3BpLmMgfCA0OCAr
KysrKystLS0tLS0KIGRyaXZlcnMvbWVkaWEvdXNiL21zaTI1MDAvbXNpMjUwMC5jICAgICAgICAg
ICB8IDM4ICsrKysrLS0tLS0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItc3BpLmMgICAg
ICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21pc2MvZ2VoYy1hY2hjLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAgOCArLQogZHJpdmVycy9tbWMvaG9zdC9tbWNfc3BpLmMgICAgICAgICAgICAgICAg
ICAgIHwgIDYgKy0KIGRyaXZlcnMvbXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jICAgICAgICAg
ICB8ICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMgICAgICAgICAg
fCAgMyArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvbWljcmVsL2tzODg1MV9zcGkuYyAgICAgIHwg
IDQgKy0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3ZlcnRleGNvbS9tc2UxMDJ4LmMgICAgICB8ICAy
ICstCiBkcml2ZXJzL25ldC9pZWVlODAyMTU0L2NhODIxMC5jICAgICAgICAgICAgICAgfCAgMiAr
LQogLi4uL25ldC93aXJlbGVzcy9tYXJ2ZWxsL2xpYmVydGFzL2lmX3NwaS5jICAgIHwgIDIgKy0K
IGRyaXZlcnMvcGxhdGZvcm0vY2hyb21lL2Nyb3NfZWNfc3BpLmMgICAgICAgICB8ICA4ICstCiBk
cml2ZXJzL3NwaS9zcGktYXRoNzkuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJp
dmVycy9zcGkvc3BpLWJpdGJhbmcuYyAgICAgICAgICAgICAgICAgICAgIHwgNjQgKysrKysrKyst
LS0tLS0tLQogZHJpdmVycy9zcGkvc3BpLWJ1dHRlcmZseS5jICAgICAgICAgICAgICAgICAgIHwg
IDYgKy0KIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyAgICAgICAgICAgICB8ICA3
ICstCiBkcml2ZXJzL3NwaS9zcGktY2F2aXVtLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNiAr
LQogZHJpdmVycy9zcGkvc3BpLWNhdml1bS5oICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMgICAgICAgICAgICAgICAgICAgICB8ICA2ICstCiBk
cml2ZXJzL3NwaS9zcGktZnNsLWxpYi5jICAgICAgICAgICAgICAgICAgICAgfCAxNCArKy0tCiBk
cml2ZXJzL3NwaS9zcGktZ2VuaS1xY29tLmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJp
dmVycy9zcGkvc3BpLWdwaW8uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZl
cnMvc3BpL3NwaS1sbTcwbGxwLmMgICAgICAgICAgICAgICAgICAgICB8ICA2ICstCiBkcml2ZXJz
L3NwaS9zcGktbG9vcGJhY2stdGVzdC5jICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9z
cGkvc3BpLW9jLXRpbnkuYyAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KIGRyaXZlcnMvc3Bp
L3NwaS1vbWFwLXV3aXJlLmMgICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL3NwaS9z
cGktc2xhdmUtbXQyN3h4LmMgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9zcGkvc3Bp
LXhpbGlueC5jICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvc3BpL3NwaS14
dGVuc2EteHRmcGdhLmMgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3NwaS9zcGkuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9zcGkvc3BpZGV2LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9m
YnRmdC1jb3JlLmMgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9z
cGlsaWIuYyAgICAgICAgICAgICAgfCA2NiArKysrKysrKy0tLS0tLS0tLQogZHJpdmVycy91c2Iv
Z2FkZ2V0L3VkYy9tYXgzNDIwX3VkYy5jICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvbW1wL2h3L21tcF9zcGkuYyAgICAgICAgICB8IDI2ICsrKy0tLS0KIGluY2x1ZGUvbGlu
dXgvc3BpL3NwaS5oICAgICAgICAgICAgICAgICAgICAgICB8IDIwICstLS0tCiBpbmNsdWRlL2xp
bnV4L3NwaS9zcGlfYml0YmFuZy5oICAgICAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9tZWRp
YS92NGwyLWNvbW1vbi5oICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KIDQ2IGZpbGVzIGNoYW5n
ZWQsIDI0OSBpbnNlcnRpb25zKCspLCAyNjcgZGVsZXRpb25zKC0pCgoKYmFzZS1jb21taXQ6IDhk
MDRhN2UyZWUzZmQ2YWFiYjgwOTZiMDBjNjRkYjBkNzM1YmM4NzQKLS0gCjIuNDMuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
