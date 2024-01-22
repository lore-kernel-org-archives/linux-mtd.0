Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23893C47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KZV4DTvKYZ/66PtN2HuLeP4nclCGXQOhFcR20Yjo1TU=; b=jtZb+ImdYFPGhW
	JFTdWFGj1nxo9zFC7XHuClhVUhEiUq0hm3TBNyLuvn5MObGwYi+wOeQ8Nqwqzg6ll8L2cQL45gIGq
	F/V1rknYbMM0jklhCfro0i4j2fd/8vkpZU5KPl7txk9VBvM0scBasbxfz+buhAmHD436yeL0cbr/m
	TTk7Ocsyr4gxlu4nXzTPlV1lj7uhlBo9aRoF7gp8Iw/ulfx2Aq02CcoVWXfVl7QBZAcIQuyMVMmYk
	6iKDWrvHVRYPuJs57pLzrORwgytYESDQoAJMbohgG1FM6Kol7OEmn3LT36ErUNLHsr2Qx7BGIWKk2
	9uU8lbtT0P5sFyqQA46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRykY-00DRaQ-1O;
	Mon, 22 Jan 2024 18:10:22 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRykU-00DRYC-1k
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jan 2024 18:10:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiY-0001lP-N0; Mon, 22 Jan 2024 19:08:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiS-001ePE-PM; Mon, 22 Jan 2024 19:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiS-005Zwj-1m;
	Mon, 22 Jan 2024 19:08:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-fpga@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	Rayyan Ansari <rayyan@ansari.sh>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sergey Kozlov <serjk@netup.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-mmc@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michal Simek <michal.simek@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	linux-mtd@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Max Filippov <jcmvbkbc@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>,
	Alan Stern <stern@rowland.harvard.edu>,
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
Subject: [PATCH v2 00/33] spi: get rid of some legacy macros
Date: Mon, 22 Jan 2024 19:06:55 +0100
Message-ID: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5874; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=r4hNLx1axTK9D2SO1h2Nidy6wdhcdwS0oI6JMP4mupU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlrq7CRGL5rco/IZ7baQyO1t3S9it11eXvRLZKR GbQbTfz3/2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZa6uwgAKCRCPgPtYfRL+ TlSmB/4k7WiBaRL3saK9pl+Gkw8Hqk7HVFstVTQ/rkaYbIsJGY0xZw8/1EJjSObFeB+APA4aMQh I79wzfj/BAi6u9wIsVNiQ9y/G7wHtwifXCuuRBAfRSQICGNo++YWb4VjoViqUrlwFz1on55YRHO fF0At9RAUzuTpDwaPQlercYTSV2fRZOyE6oFjYu50ibPS5RDRAlt5RMXKu+KeNvZIt1a7rYblZd 3X+5IV8boWAzqfA2x+ESE9bxy64tcf4U55YuI4LIo7T/6pTUUmJEXiJK3Hqi+KdRcDIt0RoY0Co KLQSX3Yu+cnQoWcdVVqzWe5P2RjCFOxbxIHkvh+IxoWx5PzK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_101018_733178_4EE7AC88 
X-CRM114-Status: GOOD (  17.60  )
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

SGVsbG8sCgp0aGlzIGlzIHYyIG9mIHRoaXMgcGF0Y2ggc2V0LgoKQ2hhbmdlcyBzaW5jZSAoaW1w
bGljaXQpIHYxLCBzZW50IHdpdGggTWVzc2FnZS1JZDoKY292ZXIuMTcwNTM0ODI2OS5naXQudS5r
bGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlOgoKIC0gUmViYXNlIHRvIHY2LjgtcmMxCiAtIEZp
eCBhIGJ1aWxkIGZhaWx1cmUgb24gc2gKIC0gQWRkZWQgdGhlIHRhZ3MgcmVjZWl2ZWQgaW4gKGlt
cGxpY2l0KSB2MS4KClRoZSBzbGF2ZS1tdDI3eHggZHJpdmVyIG5lZWRzIHNvbWUgbW9yZSB3b3Jr
LiBUaGUgcGF0Y2ggcHJlc2VudGVkIGhlcmUKaXMgZW5vdWdoIGhvd2V2ZXIgdG8gZ2V0IHJpZCBv
ZiB0aGUgZGVmaW5lcyBoYW5kbGVkIGluIHBhdGNoIDMyLgpDbGVhbmluZyB0aGF0IHVwIGlzIG91
dC1vZi1zY29wZSBmb3IgdGhpcyBzZXJpZXMsIHNvIEknbGwgZGVsYXkgdGhhdAp1bnRpbCBsYXRl
ci4KCk5vdGUgdGhhdCBKb25hdGhhbiBDYW1lcm9uIGhhcyBhbHJlYWR5IGFwcGxpZWQgcGF0Y2gg
MyB0byBoaXMgdHJlZSwgaXQKZGlkbid0IGFwcGVhciBpbiBhIHB1YmxpYyB0cmVlIHRob3VnaCB5
ZXQuIEkgc3RpbGwgaW5jbHVkZWQgaXQgaGVyZSB0bwptYWtlIHRoZSBrZXJuZWwgYnVpbGQgYm90
cyBoYXBweS4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgzMyk6CiAgZnBn
YTogaWNlNDAtc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9s
bGVyIgogIGllZWU4MDIxNTQ6IGNhODIxMDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVy
IiB0byAiY29udHJvbGxlciIKICBpaW86IGFkYzogYWRfc2lnbWFfZGVsdGE6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8KICAgICJjb250cm9sbGVyIgogIElucHV0OiBweHNwYWQg
LSBmb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIElucHV0
OiBzeW5hcHRpY3Mtcm1pNCAtIGZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8KICAg
ICJjb250cm9sbGVyIgogIG1lZGlhOiBtZ2I0OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIgogIG1lZGlhOiBuZXR1cF91bmlkdmI6IEZvbGxvdyByZW5hbWlu
ZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgbWVkaWE6IHVzYi9tc2kyNTAwOiBG
b2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIG1lZGlhOiB2
NGwyLXN1YmRldjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxl
ciIKICBtaXNjOiBnZWhjLWFjaGM6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8g
ImNvbnRyb2xsZXIiCiAgbW1jOiBtbWNfc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIgogIG10ZDogZGF0YWZsYXNoOiBGb2xsb3cgcmVuYW1pbmcgb2Yg
U1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIG10ZDogcmF3bmFuZDogZnNsX2VsYmM6IExl
dCAucHJvYmUgcmV0cnkgaWYgbG9jYWwgYnVzIGlzIG1pc3NpbmcKICBuZXQ6IGtzODg1MTogRm9s
bG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICBuZXQ6IHZlcnRl
eGNvbTogbXNlMTAyeDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0bwogICAgImNv
bnRyb2xsZXIiCiAgcGxhdGZvcm0vY2hyb21lOiBjcm9zX2VjX3NwaTogRm9sbG93IHJlbmFtaW5n
IG9mIFNQSSAibWFzdGVyIiB0bwogICAgImNvbnRyb2xsZXIiCiAgc3BpOiBiaXRiYW5nOiBGb2xs
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
dWRjOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvCiAgICAiY29udHJvbGxlciIK
ICB2aWRlbzogZmJkZXY6IG1tcDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAi
Y29udHJvbGxlciIKICB3aWZpOiBsaWJlcnRhczogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFz
dGVyIiB0byAiY29udHJvbGxlciIKICBzcGk6IGZzbC1saWI6IEZvbGxvdyByZW5hbWluZyBvZiBT
UEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgc3BpOiBEcm9wIGNvbXBhdCBsYXllciBmcm9t
IHJlbmFtaW5nICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIERvY3VtZW50YXRpb246IHNwaTog
VXBkYXRlIGRvY3VtZW50YXRpb24gZm9yIHJlbmFtaW5nICJtYXN0ZXIiIHRvCiAgICAiY29udHJv
bGxlciIKCiAuLi4vZHJpdmVyLWFwaS9kcml2ZXItbW9kZWwvZGV2cmVzLnJzdCAgICAgICAgfCAg
MiArLQogRG9jdW1lbnRhdGlvbi9zcGkvc3BpLXN1bW1hcnkucnN0ICAgICAgICAgICAgIHwgNzQg
KysrKysrKysrLS0tLS0tLS0tLQogZHJpdmVycy9jaGFyL3RwbS90cG1fdGlzX3NwaV9tYWluLmMg
ICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvZnBnYS9pY2U0MC1zcGkuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2lpby9hZGMvYWRfc2lnbWFfZGVsdGEuYyAgICAgICAg
ICAgICAgfCAxNCArKy0tCiBkcml2ZXJzL2lucHV0L2pveXN0aWNrL3BzeHBhZC1zcGkuYyAgICAg
ICAgICAgfCAgNCArLQogZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9zcGkuYyAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9jb3JlLmMgICAgICAgICAg
ICB8IDE0ICsrLS0KIC4uLi9tZWRpYS9wY2kvbmV0dXBfdW5pZHZiL25ldHVwX3VuaWR2Yl9zcGku
YyB8IDQ4ICsrKysrKy0tLS0tLQogZHJpdmVycy9tZWRpYS91c2IvbXNpMjUwMC9tc2kyNTAwLmMg
ICAgICAgICAgIHwgMzggKysrKystLS0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1z
cGkuYyAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvbWlzYy9nZWhjLWFjaGMuYyAgICAgICAg
ICAgICAgICAgICAgICB8ICA4ICstCiBkcml2ZXJzL21tYy9ob3N0L21tY19zcGkuYyAgICAgICAg
ICAgICAgICAgICAgfCAgNiArLQogZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfZGF0YWZsYXNoLmMg
ICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L2ZzbF9lbGJjX25hbmQuYyAg
ICAgICAgICB8ICAzICstCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyZWwva3M4ODUxX3NwaS5j
ICAgICAgfCAgNCArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvdmVydGV4Y29tL21zZTEwMnguYyAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvbmV0L2llZWU4MDIxNTQvY2E4MjEwLmMgICAgICAgICAgICAg
ICB8ICAyICstCiAuLi4vbmV0L3dpcmVsZXNzL21hcnZlbGwvbGliZXJ0YXMvaWZfc3BpLmMgICAg
fCAgMiArLQogZHJpdmVycy9wbGF0Zm9ybS9jaHJvbWUvY3Jvc19lY19zcGkuYyAgICAgICAgIHwg
IDggKy0KIGRyaXZlcnMvc3BpL3NwaS1hdGg3OS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0
ICstCiBkcml2ZXJzL3NwaS9zcGktYml0YmFuZy5jICAgICAgICAgICAgICAgICAgICAgfCA2NCAr
KysrKysrKy0tLS0tLS0tCiBkcml2ZXJzL3NwaS9zcGktYnV0dGVyZmx5LmMgICAgICAgICAgICAg
ICAgICAgfCAgNiArLQogZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jICAgICAgICAg
ICAgIHwgIDcgKy0KIGRyaXZlcnMvc3BpL3NwaS1jYXZpdW0uYyAgICAgICAgICAgICAgICAgICAg
ICB8ICA2ICstCiBkcml2ZXJzL3NwaS9zcGktY2F2aXVtLmggICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQogZHJpdmVycy9zcGkvc3BpLWRhdmluY2kuYyAgICAgICAgICAgICAgICAgICAgIHwg
IDYgKy0KIGRyaXZlcnMvc3BpL3NwaS1mc2wtbGliLmMgICAgICAgICAgICAgICAgICAgICB8IDE0
ICsrLS0KIGRyaXZlcnMvc3BpL3NwaS1nZW5pLXFjb20uYyAgICAgICAgICAgICAgICAgICB8ICAy
ICstCiBkcml2ZXJzL3NwaS9zcGktZ3Bpby5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQogZHJpdmVycy9zcGkvc3BpLWxtNzBsbHAuYyAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0K
IGRyaXZlcnMvc3BpL3NwaS1sb29wYmFjay10ZXN0LmMgICAgICAgICAgICAgICB8ICA0ICstCiBk
cml2ZXJzL3NwaS9zcGktb2MtdGlueS5jICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQogZHJp
dmVycy9zcGkvc3BpLW9tYXAtdXdpcmUuYyAgICAgICAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZl
cnMvc3BpL3NwaS1zaC1zY2kuYyAgICAgICAgICAgICAgICAgICAgICB8IDEwICstLQogZHJpdmVy
cy9zcGkvc3BpLXNsYXZlLW10Mjd4eC5jICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMv
c3BpL3NwaS14aWxpbnguYyAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL3Nw
aS9zcGkteHRlbnNhLXh0ZnBnYS5jICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9zcGkv
c3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvc3BpL3Nw
aWRldi5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3N0YWdpbmcv
ZmJ0ZnQvZmJ0ZnQtY29yZS5jICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvc3BpbGliLmMgICAgICAgICAgICAgIHwgNjYgKysrKysrKystLS0tLS0tLS0KIGRyaXZl
cnMvdXNiL2dhZGdldC91ZGMvbWF4MzQyMF91ZGMuYyAgICAgICAgICB8ICAyICstCiBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L21tcC9ody9tbXBfc3BpLmMgICAgICAgICAgfCAyNiArKystLS0tCiBpbmNs
dWRlL2xpbnV4L3NwaS9zcGkuaCAgICAgICAgICAgICAgICAgICAgICAgfCAyMCArLS0tLQogaW5j
bHVkZS9saW51eC9zcGkvc3BpX2JpdGJhbmcuaCAgICAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1
ZGUvbWVkaWEvdjRsMi1jb21tb24uaCAgICAgICAgICAgICAgICAgICB8ICA2ICstCiA0NyBmaWxl
cyBjaGFuZ2VkLCAyNTQgaW5zZXJ0aW9ucygrKSwgMjcyIGRlbGV0aW9ucygtKQoKCmJhc2UtY29t
bWl0OiA2NjEzNDc2ZTIyNWUwOTBjYzlhYWQ0OWJlN2ZhNTA0ZTI5MGRkMzNkCi0tIAoyLjQzLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
