Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651B3C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8DrBT9xcqP1/+GeBP/30D0q5ZkHcfuVNnQgGApJiDQ=; b=xdn5YVoA3EEeo/
	/3C/QsTjlptfqGIgttdn7vXsX7rDkhu6iI8CQWa/RvfVov8vI3p8QghqfMuL8y1H22Lg8zYvyFRiJ
	OhlOurAx08F2P03Plm0cpyqpf7ObxcaXWO3/0rn3u/GF7/P91dai9Q4BgBtWHQnL0WjZlJEQd/xyV
	6K65fe461vvrKejg1E86mnCfgX8dL2Or66A/M2TLHv/sT5DaAwfI+7MHfBGYSlAi0vTBgRXUFcLzy
	zIEOCOCLxpQ4BxT4ycDy8FigmgoBjF4xbT2JxHRLJdnP49TWsi73aq4ChcE8LbB5dPGgTIXJVu50w
	F0WHL2CewNwH+tAeZHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaXd-00000009DcA-1JcY;
	Mon, 26 May 2025 16:19:09 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZNp-000000096N6-11fD;
	Mon, 26 May 2025 15:04:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFB2444225;
	Mon, 26 May 2025 15:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748271892;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCbLRnD850Fw84D6O+/v5XHafNaaAGbfyOsK8To1nVE=;
	b=px3wU1eRkJ/axr/5DuhnZySKrn823eNaAIJXbZcAmaqq4qeYcle/G8QC7ZsPXuBfqgUfA5
	j9UtCvuxzUT5A1xXY1Po4PCIRoRj/UYUvff9JIXuTSFDpA7KBjR1wfOWeVD/7/YChB4k6k
	OccO5Dc6ZOmBH1W60DJj3fdi7jALdeVeqR+U/9rbTTM1YBDMzgagRRa7zs6wL9Q2HF+Ggl
	lZR8EQV0hFy/i3wUKXQGcb6+9G9tfBRSFOtl6/n8GoMSf0r2Iy6B5ejdMC9jPJn6kFCLCK
	x5mkCnLV2MqtCm+ayiflRELaT0mOKkuuwcU+khwFj5kXsikeBoHem+BuFAnX/A==
Date: Mon, 26 May 2025 17:04:46 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Hector Martin <marcan@marcan.st>, Sven Peter
 <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Vincent Shih
 <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Alessandro
 Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Evgeniy Polyakov <zbr@ioremap.net>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Romain Gantois
 <romain.gantois@bootlin.com>
Subject: Re: [PATCH V5] nvmem: add explicit config option to read old syntax
 fixed OF cells
Message-ID: <20250526170446.1190e046@kmaincent-XPS-13-7390>
In-Reply-To: <20230927204446.4231-1-zajec5@gmail.com>
References: <20230927204446.4231-1-zajec5@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeekfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefguddtfeevtddugeevgfevtdfgvdfhtdeuleetffefffffhffgteekvdefudeiieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghlohepkhhmrghinhgtvghnthdqigfrufdqudefqdejfeeltddpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehgedprhgtphhtthhopeiirghjvggtheesghhmrghilhdrtghomhdprhgtphhtthhopehsrhhinhhivhgrshdrkhgrnhgurghgrghtlhgrsehlihhnrghrohdrohhrghdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhit
 ghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtthhopehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdprhgtphhtthhopegrlhihshhsrgesrhhoshgvnhiifigvihhgrdhioh
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_080458_123844_99BEE9B2 
X-CRM114-Status: GOOD (  14.32  )
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

TGUgV2VkLCAyNyBTZXAgMjAyMyAyMjo0NDo0NiArMDIwMCwKUmFmYcWCIE1pxYJlY2tpIDx6YWpl
YzVAZ21haWwuY29tPiBhIMOpY3JpdCA6Cgo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxA
bWlsZWNraS5wbD4KPiAKPiBCaW5kaW5nIGZvciBmaXhlZCBOVk1FTSBjZWxscyBkZWZpbmVkIGRp
cmVjdGx5IGFzIE5WTUVNIGRldmljZSBzdWJub2Rlcwo+IGhhcyBiZWVuIGRlcHJlY2F0ZWQuIEl0
IGhhcyBiZWVuIHJlcGxhY2VkIGJ5IHRoZSAiZml4ZWQtbGF5b3V0IiBOVk1FTQo+IGxheW91dCBi
aW5kaW5nLgo+IAo+IE5ldyBzeW50YXggaXMgbWVhbnQgdG8gYmUgY2xlYXJlciBhbmQgc2hvdWxk
IGhlbHAgYXZvaWRpbmcgaW1wcmVjaXNlCj4gYmluZGluZ3MuCj4gCj4gTlZNRU0gc3Vic3lzdGVt
IGFscmVhZHkgc3VwcG9ydHMgdGhlIG5ldyBiaW5kaW5nLiBJdCBzaG91bGQgYmUgYSBnb29kCj4g
aWRlYSB0byBsaW1pdCBzdXBwb3J0IGZvciBvbGQgc3ludGF4IHRvIGV4aXN0aW5nIGRyaXZlcnMg
dGhhdCBhY3R1YWxseQo+IHN1cHBvcnQgJiB1c2UgaXQgKHdlIGNhbid0IGJyZWFrIGJhY2t3YXJk
IGNvbXBhdGliaWxpdHkhKS4gVGhhdCB3YXkgd2UKPiBhZGRpdGlvbmFsbHkgZW5jb3VyYWdlIG5l
dyBiaW5kaW5ncyAmIGRyaXZlcnMgdG8gaWdub3JlIGRlcHJlY2F0ZWQKPiBiaW5kaW5nLgo+IAo+
IEl0IHdhc24ndCBjbGVhciAodG8gbWUpIGlmIHJ0YyBhbmQgdzEgY29kZSBhY3R1YWxseSB1c2Vz
IG9sZCBzeW50YXgKPiBmaXhlZCBjZWxscy4gSSBlbmFibGVkIHRoZW0gdG8gZG9uJ3QgcmlzayBh
bnkgYnJlYWthZ2UuCgpIZWxsbywKCldhcyB0aGVyZSBhIHJlYXNvbiB0byBub3QgYWRkIHRoZSBs
ZWdhY3kgZmxhZyB0byBhbGwgdGhlIGRyaXZlcnMgdGhhdCB3YXMKc3VwcG9ydGluZyBudm1lbSBh
dCB0aGUgdGltZSBudm1lbSBmaXhlZCBsYXlvdXQgd2FzIHN1cHBvcnRlZD8KCkkganVzdCBmYWNl
ZCBhIG52bWVtIGxheW91dCByZWdyZXNzaW9uIG9uIGJvYXJkIHdpdGggYW4gYXQyNCBlZXByb20u
CgpDb21taXQ6IDI3ZjY5OWU1NzhiMSBudm1lbTogY29yZTogYWRkIHN1cHBvcnQgZm9yIGZpeGVk
IGNlbGxzICpsYXlvdXQqCiQgZ2l0IGdyZXAgbnZtZW1fY29uZmlnIGRyaXZlcnMvIHwgY3V0IC1k
ICc6JyAtZiAxIHwgc29ydCAtdQpkcml2ZXJzL2h3bW9uL3BtYnVzL2FkbTEyNjYuYwpkcml2ZXJz
L2lpby9wcmVzc3VyZS9ibXAyODAtY29yZS5jCmRyaXZlcnMvbWVkaWEvaTJjL292Mjc0MC5jCmRy
aXZlcnMvbWVkaWEvaTJjL3ZpZGVvLWkyYy5jCmRyaXZlcnMvbWlzYy9lZXByb20vYXQyNC5jCmRy
aXZlcnMvbWlzYy9lZXByb20vYXQyNS5jCmRyaXZlcnMvbWlzYy9lZXByb20vZWVwcm9tXzkzeHg0
Ni5jCmRyaXZlcnMvbXRkL210ZGNvcmUuYwpkcml2ZXJzL252bWVtL2FwcGxlLWVmdXNlcy5jCmRy
aXZlcnMvbnZtZW0vYmNtLW9jb3RwLmMKZHJpdmVycy9udm1lbS9icmNtX252cmFtLmMKZHJpdmVy
cy9udm1lbS9jb3JlLmMKZHJpdmVycy9udm1lbS9pbXgtaWltLmMKZHJpdmVycy9udm1lbS9pbXgt
b2NvdHAuYwpkcml2ZXJzL252bWVtL2lteC1vY290cC1lbGUuYwpkcml2ZXJzL252bWVtL2lteC1v
Y290cC1zY3UuYwpkcml2ZXJzL252bWVtL2p6NDc4MC1lZnVzZS5jCmRyaXZlcnMvbnZtZW0vbGFu
OTY2Mi1vdHBjLmMKZHJpdmVycy9udm1lbS9sYXllcnNjYXBlLXNmcC5jCmRyaXZlcnMvbnZtZW0v
bHBjMTh4eF9lZXByb20uYwpkcml2ZXJzL252bWVtL2xwYzE4eHhfb3RwLmMKZHJpdmVycy9udm1l
bS9tZXNvbi1lZnVzZS5jCmRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1c2UuYwpkcml2ZXJzL252
bWVtL21pY3JvY2hpcC1vdHBjLmMKZHJpdmVycy9udm1lbS9tdGstZWZ1c2UuYwpkcml2ZXJzL252
bWVtL214cy1vY290cC5jCmRyaXZlcnMvbnZtZW0vbmludGVuZG8tb3RwLmMKZHJpdmVycy9udm1l
bS9xY29tLXNwbWktc2RhbS5jCmRyaXZlcnMvbnZtZW0vcWZwcm9tLmMKZHJpdmVycy9udm1lbS9y
YXZlLXNwLWVlcHJvbS5jCmRyaXZlcnMvbnZtZW0vcm1lbS5jCmRyaXZlcnMvbnZtZW0vcm9ja2No
aXAtZWZ1c2UuYwpkcml2ZXJzL252bWVtL3JvY2tjaGlwLW90cC5jCmRyaXZlcnMvbnZtZW0vc2My
N3h4LWVmdXNlLmMKZHJpdmVycy9udm1lbS9zbnZzX2xwZ3ByLmMKZHJpdmVycy9udm1lbS9zcHJk
LWVmdXNlLmMKZHJpdmVycy9udm1lbS9zdG0zMi1yb21lbS5jCmRyaXZlcnMvbnZtZW0vc3VucGx1
cy1vY290cC5jCmRyaXZlcnMvbnZtZW0vc3VueGlfc2lkLmMKZHJpdmVycy9udm1lbS91LWJvb3Qt
ZW52LmMKZHJpdmVycy9udm1lbS91bmlwaGllci1lZnVzZS5jCmRyaXZlcnMvbnZtZW0vdmY2MTAt
b2NvdHAuYwpkcml2ZXJzL252bWVtL3p5bnFtcF9udm1lbS5jCmRyaXZlcnMvcnRjL252bWVtLmMK
ZHJpdmVycy9ydGMvcnRjLWFieDgweC5jCmRyaXZlcnMvcnRjL3J0Yy1jbW9zLmMKZHJpdmVycy9y
dGMvcnRjLWRzMTMwNS5jCmRyaXZlcnMvcnRjL3J0Yy1kczEzMDcuYwpkcml2ZXJzL3J0Yy9ydGMt
ZHMxMzQzLmMKZHJpdmVycy9ydGMvcnRjLWRzMTUxMS5jCmRyaXZlcnMvcnRjL3J0Yy1kczE1NTMu
Ywpkcml2ZXJzL3J0Yy9ydGMtZHMxNjg1LmMKZHJpdmVycy9ydGMvcnRjLWRzMTc0Mi5jCmRyaXZl
cnMvcnRjL3J0Yy1kczMyMzIuYwpkcml2ZXJzL3J0Yy9ydGMtaXNsMTIwMjYuYwpkcml2ZXJzL3J0
Yy9ydGMtaXNsMTIwOC5jCmRyaXZlcnMvcnRjL3J0Yy1tNDh0NTkuYwpkcml2ZXJzL3J0Yy9ydGMt
bTQ4dDg2LmMKZHJpdmVycy9ydGMvcnRjLW1lc29uLmMKZHJpdmVycy9ydGMvcnRjLW9tYXAuYwpk
cml2ZXJzL3J0Yy9ydGMtcGNmMjEyNy5jCmRyaXZlcnMvcnRjL3J0Yy1wY2Y4NTA2My5jCmRyaXZl
cnMvcnRjL3J0Yy1wY2Y4NTM2My5jCmRyaXZlcnMvcnRjL3J0Yy1ycDVjMDEuYwpkcml2ZXJzL3J0
Yy9ydGMtcnYzMDI4LmMKZHJpdmVycy9ydGMvcnRjLXJ2MzAyOWMyLmMKZHJpdmVycy9ydGMvcnRj
LXJ2MzAzMi5jCmRyaXZlcnMvcnRjL3J0Yy1ydjg4MDMuYwpkcml2ZXJzL3J0Yy9ydGMtcng4NTgx
LmMKZHJpdmVycy9ydGMvcnRjLXN0azE3dGE4LmMKZHJpdmVycy9ydGMvcnRjLXN1bjZpLmMKZHJp
dmVycy9ydGMvcnRjLXRpLWszLmMKZHJpdmVycy9zb2MvYXRtZWwvc2ZyLmMKZHJpdmVycy9zb2Mv
dGVncmEvZnVzZS9mdXNlLXRlZ3JhLmMKZHJpdmVycy90aHVuZGVyYm9sdC9udm0uYwpkcml2ZXJz
L3cxL3NsYXZlcy93MV9kczI1MHguYwoKLS0gCkvDtnJ5IE1haW5jZW50LCBCb290bGluCkVtYmVk
ZGVkIExpbnV4IGFuZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
