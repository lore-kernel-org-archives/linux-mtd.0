Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699F0C4828D
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Feb 2024 18:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sIECOXt6e9M/1sFh5SDcRfyI6F0lS2z/d0Rlmg2lHvo=; b=xz44KBgU/SAisH
	qMjmA+UUxdBkVinhqf5h6bSv4/RbCiuIj+Ec9j1b0IkRJRXCjop2X2v6LU+c0v7omQnvmCAAx4tke
	VFfnLgKR1Sj+vNUa192id0NsxbhD+9XtVfA2Ah3bjAujrDShQtVBShfpw990hz8fyZdcFKhVsotbG
	LGEWM6SiFgXZCb6MXDyPR7JDy9YShc+uk5BOEKYLy2Kn37QxTFTOwn8O3VhsXFXv5wMvRDZL1LN5A
	chCmI6uXhCcC6O3CMIu8ZCy7j6VDNvdkEznAKKnoDYIge23+K1iX9tD6jWhjHFEul2fEZBoQXiDj6
	tjLCnpR00EW5sP5jocrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmuR-0000000BW74-0wDu;
	Wed, 07 Feb 2024 18:44:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXmuF-0000000BVxK-156d
	for linux-mtd@lists.infradead.org;
	Wed, 07 Feb 2024 18:44:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmtA-0007PF-WC; Wed, 07 Feb 2024 19:43:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt1-0054Wo-Fo; Wed, 07 Feb 2024 19:43:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt1-00HRrh-0y;
	Wed, 07 Feb 2024 19:43:07 +0100
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
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Sergey Kozlov <serjk@netup.ru>,
	Arnd Bergmann <arnd@arndb.de>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-mmc@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	linux-mtd@lists.infradead.org,
	Simon Horman <horms@kernel.org>,
	Ronald Wahl <ronald.wahl@raritan.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	Michal Simek <michal.simek@amd.com>,
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
	Sam Ravnborg <sam@ravnborg.org>,
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-usb@vger.kernel.org,
	Helge Deller <deller@gmx.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Kalle Valo <kvalo@kernel.org>,
	Dmitry Antipov <dmantipov@yandex.ru>,
	libertas-dev@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	James Clark <james.clark@arm.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 00/32] spi: get rid of some legacy macros
Date: Wed,  7 Feb 2024 19:40:14 +0100
Message-ID: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5860; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=s51zDtEtzddF+fOLbQ8v2gtuX5PVGr2PxCfCP0eStY0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw86QixivRCd8jxsnKPB8Ssu0rmVV57zjiJehV Ejr/jxfufWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPOkAAKCRCPgPtYfRL+ TqoZB/9v16XZw2mKXG2KBm/qLQpqoIFtAvhj1rhNwGsvXv87uFIurzYxaSWRcHnoydLYAUjcWin wLRECa33v1gti0Be6oV9BMfvx+Pvhq4lk4RnaSn96oPtZRpq+OTzE2mMSgz0Rgm3Al2XVM+wtll cMJhm+DE3KYghNi+61ohTBgmqcQSwjofaml1oAIf8F12/QJkYPMbKHLFo3eYUENR8f8KW6xfzcA Auq9djKc8DcVzUnZlQ8jFBRc78e3H4Wwojwi6fhxTf6BorMOWK2zEE8p+1QpcaPMCBrTOJnRdaw ZunuM2tkWRUATbyKWfDc9YAdTKZGkKDoDmegK95iBOzv5EQf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_104423_623776_235C2966 
X-CRM114-Status: GOOD (  15.19  )
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

Q2hhbmdlcyBzaW5jZSB2MgooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc3BpL2NvdmVy
LjE3MDU5NDQ5NDMuZ2l0LnUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZSk6CgogLSBEcm9w
IHBhdGNoICJtdGQ6IHJhd25hbmQ6IGZzbF9lbGJjOiBMZXQgLnByb2JlIHJldHJ5IGlmIGxvY2Fs
IGJ1cyBpcwogICBtaXNzaW5nIiB3aGljaCBkb2Vzbid0IGJlbG9uZyBpbnRvIHRoaXMgc2VyaWVz
LgogLSBGaXggYSBidWlsZCBmYWlsdXJlIG5vdGljZWQgYnkgdGhlIGtlcm5lbCBidWlsZCBib3Qg
aW4KICAgZHJpdmVycy9zcGkvc3BpLWF1MTU1MC5jLiAoSSBmYWlsZWQgdG8gY2F0Y2ggdGhpcyBi
ZWNhdXNlIHRoaXMgZHJpdmVyCiAgIGlzIG1pcHMgb25seSwgYnV0IG5vdCBlbmFibGVkIGluIGEg
bWlwcyBhbGxtb2Rjb25maWcuIFRoYXQncyBhIGJpdAogICB1bmZvcnR1bmF0ZSwgYnV0IG5vdCBl
YXNpbHkgZml4YWJsZS4pCiAtIEFkZCB0aGUgUmV2aWV3ZWQtYnk6IGFuZCBBY2tlZC1ieTogdGFn
cyBJIHJlY2VpdmVkIGZvciB2Mi4KCk1hcmsgYWxyZWFkeSBhbm5vdW5jZWQgZm9yIHYyIHRoYXQg
aGUgaXMgd2lsbGluZyB0byBhcHBseSB0aGUgd2hvbGUKc2VyaWVzIHRvIGhpcyBzcGkgdHJlZS4g
QXNzdW1pbmcgbm8gb3RoZXIgc2hvdyBzdG9wZXIgYXJlIGZvdW5kIGluIHRoaXMKdjMsIEkgYXNz
dW1lIHRoYXQncyB0aGUgcGxhbiBzdGlsbCBmb3IgdGhpcyBzZXJpZXMgbm93LgoKVGhhbmtzClV3
ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDMyKToKICBmcGdhOiBpY2U0MC1zcGk6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgaWVlZTgwMjE1NDogY2E4MjEw
OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIGlpbzog
YWRjOiBhZF9zaWdtYV9kZWx0YTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAi
Y29udHJvbGxlciIKICBJbnB1dDogcHhzcGFkIC0gZm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFz
dGVyIiB0byAiY29udHJvbGxlciIKICBJbnB1dDogc3luYXB0aWNzLXJtaTQgLSBmb2xsb3cgcmVu
YW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIG1lZGlhOiBtZ2I0OiBGb2xs
b3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIG1lZGlhOiBuZXR1
cF91bmlkdmI6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIi
CiAgbWVkaWE6IHVzYi9tc2kyNTAwOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRv
ICJjb250cm9sbGVyIgogIG1lZGlhOiB2NGwyLXN1YmRldjogRm9sbG93IHJlbmFtaW5nIG9mIFNQ
SSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICBtaXNjOiBnZWhjLWFjaGM6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgbW1jOiBtbWNfc3BpOiBGb2xs
b3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIG10ZDogZGF0YWZs
YXNoOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIG5l
dDoga3M4ODUxOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVy
IgogIG5ldDogdmVydGV4Y29tOiBtc2UxMDJ4OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIgogIHBsYXRmb3JtL2Nocm9tZTogY3Jvc19lY19zcGk6IEZvbGxv
dyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgc3BpOiBiaXRiYW5n
OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTog
Y2FkZW5jZS1xdWFkc3BpOiBEb24ndCBlbWl0IGVycm9yIG1lc3NhZ2Ugb24gYWxsb2NhdGlvbiBl
cnJvcgogIHNwaTogY2FkZW5jZS1xdWFkc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTogY2F2aXVtOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJ
ICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTogZ2VuaS1xY29tOiBGb2xsb3cgcmVuYW1p
bmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTogbG9vcGJhY2stdGVzdDog
Rm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICBzcGk6IHNs
YXZlLW10Mjd4eDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxl
ciIKICBzcGk6IHNwaWRldjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29u
dHJvbGxlciIKICBzdGFnaW5nOiBmYnRmdDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVy
IiB0byAiY29udHJvbGxlciIKICBzdGFnaW5nOiBncmV5YnVzOiBzcGk6IEZvbGxvdyByZW5hbWlu
ZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgdHBtX3Rpc19zcGk6IEZvbGxvdyBy
ZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgdXNiOiBnYWRnZXQ6IG1h
eDM0MjBfdWRjOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVy
IgogIHZpZGVvOiBmYmRldjogbW1wOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRv
ICJjb250cm9sbGVyIgogIHdpZmk6IGxpYmVydGFzOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJt
YXN0ZXIiIHRvICJjb250cm9sbGVyIgogIHNwaTogZnNsLWxpYjogRm9sbG93IHJlbmFtaW5nIG9m
IFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciIKICBzcGk6IERyb3AgY29tcGF0IGxheWVyIGZy
b20gcmVuYW1pbmcgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiCiAgRG9jdW1lbnRhdGlvbjogc3Bp
OiBVcGRhdGUgZG9jdW1lbnRhdGlvbiBmb3IgcmVuYW1pbmcgIm1hc3RlciIgdG8gImNvbnRyb2xs
ZXIiCgogLi4uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QgICAgICAgIHwgIDIg
Ky0KIERvY3VtZW50YXRpb24vc3BpL3NwaS1zdW1tYXJ5LnJzdCAgICAgICAgICAgICB8IDc0ICsr
KysrKysrKy0tLS0tLS0tLS0KIGRyaXZlcnMvY2hhci90cG0vdHBtX3Rpc19zcGlfbWFpbi5jICAg
ICAgICAgICB8ICA0ICstCiBkcml2ZXJzL2ZwZ2EvaWNlNDAtc3BpLmMgICAgICAgICAgICAgICAg
ICAgICAgfCAgNCArLQogZHJpdmVycy9paW8vYWRjL2FkX3NpZ21hX2RlbHRhLmMgICAgICAgICAg
ICAgIHwgMTQgKystLQogZHJpdmVycy9pbnB1dC9qb3lzdGljay9wc3hwYWQtc3BpLmMgICAgICAg
ICAgIHwgIDQgKy0KIGRyaXZlcnMvaW5wdXQvcm1pNC9ybWlfc3BpLmMgICAgICAgICAgICAgICAg
ICB8ICAyICstCiBkcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfY29yZS5jICAgICAgICAgICAg
fCAxNCArKy0tCiAuLi4vbWVkaWEvcGNpL25ldHVwX3VuaWR2Yi9uZXR1cF91bmlkdmJfc3BpLmMg
fCA0OCArKysrKystLS0tLS0KIGRyaXZlcnMvbWVkaWEvdXNiL21zaTI1MDAvbXNpMjUwMC5jICAg
ICAgICAgICB8IDM4ICsrKysrLS0tLS0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItc3Bp
LmMgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJzL21pc2MvZ2VoYy1hY2hjLmMgICAgICAgICAg
ICAgICAgICAgICAgfCAgOCArLQogZHJpdmVycy9tbWMvaG9zdC9tbWNfc3BpLmMgICAgICAgICAg
ICAgICAgICAgIHwgIDYgKy0KIGRyaXZlcnMvbXRkL2RldmljZXMvbXRkX2RhdGFmbGFzaC5jICAg
ICAgICAgICB8ICAyICstCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyZWwva3M4ODUxX3NwaS5j
ICAgICAgfCAgNCArLQogZHJpdmVycy9uZXQvZXRoZXJuZXQvdmVydGV4Y29tL21zZTEwMnguYyAg
ICAgIHwgIDIgKy0KIGRyaXZlcnMvbmV0L2llZWU4MDIxNTQvY2E4MjEwLmMgICAgICAgICAgICAg
ICB8ICAyICstCiAuLi4vbmV0L3dpcmVsZXNzL21hcnZlbGwvbGliZXJ0YXMvaWZfc3BpLmMgICAg
fCAgMiArLQogZHJpdmVycy9wbGF0Zm9ybS9jaHJvbWUvY3Jvc19lY19zcGkuYyAgICAgICAgIHwg
IDggKy0KIGRyaXZlcnMvc3BpL3NwaS1hdGg3OS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0
ICstCiBkcml2ZXJzL3NwaS9zcGktYXUxNTUwLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQogZHJpdmVycy9zcGkvc3BpLWJpdGJhbmcuYyAgICAgICAgICAgICAgICAgICAgIHwgNjQgKysr
KysrKystLS0tLS0tLQogZHJpdmVycy9zcGkvc3BpLWJ1dHRlcmZseS5jICAgICAgICAgICAgICAg
ICAgIHwgIDYgKy0KIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1YWRzcGkuYyAgICAgICAgICAg
ICB8ICA3ICstCiBkcml2ZXJzL3NwaS9zcGktY2F2aXVtLmMgICAgICAgICAgICAgICAgICAgICAg
fCAgNiArLQogZHJpdmVycy9zcGkvc3BpLWNhdml1bS5oICAgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIGRyaXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMgICAgICAgICAgICAgICAgICAgICB8ICA2
ICstCiBkcml2ZXJzL3NwaS9zcGktZnNsLWxpYi5jICAgICAgICAgICAgICAgICAgICAgfCAxNCAr
Ky0tCiBkcml2ZXJzL3NwaS9zcGktZ2VuaS1xY29tLmMgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQogZHJpdmVycy9zcGkvc3BpLWdwaW8uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IGRyaXZlcnMvc3BpL3NwaS1sbTcwbGxwLmMgICAgICAgICAgICAgICAgICAgICB8ICA2ICstCiBk
cml2ZXJzL3NwaS9zcGktbG9vcGJhY2stdGVzdC5jICAgICAgICAgICAgICAgfCAgNCArLQogZHJp
dmVycy9zcGkvc3BpLW9jLXRpbnkuYyAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KIGRyaXZl
cnMvc3BpL3NwaS1vbWFwLXV3aXJlLmMgICAgICAgICAgICAgICAgICB8ICA0ICstCiBkcml2ZXJz
L3NwaS9zcGktc2gtc2NpLmMgICAgICAgICAgICAgICAgICAgICAgfCAxMCArLS0KIGRyaXZlcnMv
c3BpL3NwaS1zbGF2ZS1tdDI3eHguYyAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3Nw
aS9zcGkteGlsaW54LmMgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQogZHJpdmVycy9zcGkv
c3BpLXh0ZW5zYS14dGZwZ2EuYyAgICAgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvc3BpL3Nw
aS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL3NwaS9zcGlk
ZXYuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZHJpdmVycy9zdGFnaW5nL2Zi
dGZ0L2ZidGZ0LWNvcmUuYyAgICAgICAgICAgIHwgIDQgKy0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3NwaWxpYi5jICAgICAgICAgICAgICB8IDY2ICsrKysrKysrLS0tLS0tLS0tCiBkcml2ZXJz
L3VzYi9nYWRnZXQvdWRjL21heDM0MjBfdWRjLmMgICAgICAgICAgfCAgMiArLQogZHJpdmVycy92
aWRlby9mYmRldi9tbXAvaHcvbW1wX3NwaS5jICAgICAgICAgIHwgMjYgKysrLS0tLQogaW5jbHVk
ZS9saW51eC9zcGkvc3BpLmggICAgICAgICAgICAgICAgICAgICAgIHwgMjAgKy0tLS0KIGluY2x1
ZGUvbGludXgvc3BpL3NwaV9iaXRiYW5nLmggICAgICAgICAgICAgICB8ICAyICstCiBpbmNsdWRl
L21lZGlhL3Y0bDItY29tbW9uLmggICAgICAgICAgICAgICAgICAgfCAgNiArLQogNDcgZmlsZXMg
Y2hhbmdlZCwgMjUzIGluc2VydGlvbnMoKyksIDI3MiBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1p
dDogYjliOThmNTk0YjZmNGMwYjBmYjJkYTQ0OTM0NTNhZWYxODNiY2E0YgotLSAKMi40My4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
