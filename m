Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB5BE75428
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Oct 2023 06:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEVfoJGGWYaWglqJq+wrvq+pNeaPbpZZcQkfhzHvME8=; b=iD9+4iu/DiwjUB
	ipuqjulaKaZB1oqOweaUx1DNbA/zplMejGzcZ9Hg4j/W+xLWCE60aAHFaBnjDMaJ1rBNFfjCES6Qq
	dKm/8SN3DkVFgRnDzJ+JaMZFVqKghjggYezYxqNgC4BpvJFe3aXwWzfhpgypl4ZV990GCfjHVHeOB
	Q4g/ODuY8h46OEB+DskQPnCfY9DyaK345JMsv1IvjpQayrXawEh+F/a6X5HJ4EaDq0RORF2keE7xu
	tkvX6OC37WIviFPVBQuE9uBMzsSZY7F83OilDdE1+BNNi9l43tQawPSQJBG4Ei5mxQl6Xgrdtc2zg
	aZkA6tXRRPEdkYrI8MsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnYzE-00DvGP-0w;
	Tue, 03 Oct 2023 06:34:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnYz7-00DvEh-28;
	Tue, 03 Oct 2023 06:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EAD51CE13C9;
	Tue,  3 Oct 2023 06:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39E1C433C7;
	Tue,  3 Oct 2023 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696314855;
	bh=Ryqz7zCojcMrEL8UuOL0v/jyNiV/Tvh9g3eXU1LCU2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AAlRSjy+ZPVXdvA0otoocH+MR4mkmlZiwM0Qq6ROZJEyMmGSGE+A6KbaKGSezpi7l
	 ZTCzUND2LpxuvzOLyksaUm3ZDB1hgsSeDh4FinK07Ps+wIPBZYy6/s52s3OAShctPi
	 oSJivSz33iUYk+CvBwUzAN2lo/UMZ6SwbE3KgL3zWAjTv+OI6flkEJpNWxSZsWcqOF
	 Wva207ke7oNtBOrUUwVzyft4pGJ7y8gF3mfcv1xM/yoh27FwGVvUGCSW8xLT0ui+MJ
	 whJmGLWJ9L6giK/J1zon59LVlMfeQlHhGpfbnQlvBThtC8UATKTjTXR52pTYAYcEc7
	 yekHR3gUSzE5w==
Received: (nullmailer pid 3548862 invoked by uid 1000);
	Tue, 03 Oct 2023 06:34:09 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Christian Marangi <ansuelsmth@gmail.com>, Hector Martin <marcan@marcan.st>, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, NXP Linux Team <linux-imx@nxp.com>, Komal Bajaj <quic_kbajaj@quicinc.com>, linux-rtc@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mtd@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Vincent Shih <vincent.sunplus@gmail.com>, asahi@lists.linux.dev, Rob Herring <robh+dt@kernel.org>, Anson Huang <Anson.Huang@nxp.com>, Andy Gross <agross@kernel.org>, linux-rockchip@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>,
  Richard Weinberger <richard@nod.at>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Fabio Estevam <festevam@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Bjorn Andersson <andersson@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Sven Peter <sven@svenpeter.dev>, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, Kumar Thella <sthella@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, linux-arm-msm@vger.kernel.org, Keiji Hayashibara <hayashibara.keiji@socionext.com>, Kevin Hilman <khilman@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, linux-mediatek@lists.infradead.org, Lala Lin <lala.lin@mediatek.com>
In-Reply-To: <20231003050355.1631-1-zajec5@gmail.com>
References: <20231003050355.1631-1-zajec5@gmail.com>
Message-Id: <169631484962.3548819.1223779643388796546.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: nvmem: move deprecated cells binding to
 its own file
Date: Tue, 03 Oct 2023 01:34:09 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_233422_073597_B872B3DD 
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

Ck9uIFR1ZSwgMDMgT2N0IDIwMjMgMDc6MDM6NTUgKzAyMDAsIFJhZmHFgiBNacWCZWNraSB3cm90
ZToKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4gCj4gU3VwcG9y
dCBmb3Igb2xkIE5WTUVNIGZpeGVkIGNlbGxzIHdhcyBkZXByZWNhdGVkIGluIGZhdm91ciBvZgo+
ICJmaXhlZC1sYXlvdXQiLiBJdCdzIHN0aWxsIHBhcnQgb2YgdGhlIG52bWVtLnlhbWwgdGhvdWdo
IGFuZCBtYXkgYmUKPiB1bmtub3dpbmdseSB1c2VkIGJ5IG5ldyBiaW5kaW5ncyBhZGRlZCB3aXRo
b3V0IG11Y2ggb2YgYW5hbHl6ZS4KPiAKPiBUbyBtYWtlIGl0IG1vcmUgZGlmZmljdWx0IHRvIGFj
Y2lkZW50YWxseSBzdXBwb3J0IG9sZCBzeW50YXggbW92ZSBpdHMKPiBiaW5kaW5nIHRvIHNlcGFy
YXRlZCBmaWxlIHdpdGggImRlcHJlY2F0ZWQiIGluIGl0cyBuYW1lLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAtLS0KPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbXRkL210ZC55YW1sICAgICAgICAgIHwgIDcgKysrKy0KPiAgLi4uL2Jp
bmRpbmdzL210ZC9wYXJ0aXRpb25zL252bWVtLWNlbGxzLnlhbWwgIHwgIDEgKwo+ICAuLi4vbnZt
ZW0vYW1sb2dpYyxtZXNvbi1neGJiLWVmdXNlLnlhbWwgICAgICAgfCAgMSArCj4gIC4uLi9iaW5k
aW5ncy9udm1lbS9hbWxvZ2ljLG1lc29uNi1lZnVzZS55YW1sICB8ICAxICsKPiAgLi4uL2JpbmRp
bmdzL252bWVtL2FwcGxlLGVmdXNlcy55YW1sICAgICAgICAgIHwgIDEgKwo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9udm1lbS9pbXgtb2NvdHAueWFtbCAgfCAgMSArCj4gIC4uLi9iaW5kaW5n
cy9udm1lbS9tZWRpYXRlayxlZnVzZS55YW1sICAgICAgICB8ICAxICsKPiAgLi4uL252bWVtL21p
Y3JvY2hpcCxzYW1hN2c1LW90cGMueWFtbCAgICAgICAgIHwgIDEgKwo+ICAuLi4vZGV2aWNldHJl
ZS9iaW5kaW5ncy9udm1lbS9teHMtb2NvdHAueWFtbCAgfCAgMSArCj4gIC4uLi9udm1lbS9udm1l
bS1kZXByZWNhdGVkLWNlbGxzLnlhbWwgICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysK
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vbnZtZW0ueWFtbCAgICAgIHwgIDkgLS0t
LS0tCj4gIC4uLi9iaW5kaW5ncy9udm1lbS9xY29tLHFmcHJvbS55YW1sICAgICAgICAgICB8ICAx
ICsKPiAgLi4uL2JpbmRpbmdzL252bWVtL3Fjb20sc2VjLXFmcHJvbS55YW1sICAgICAgIHwgIDEg
Kwo+ICAuLi4vYmluZGluZ3MvbnZtZW0vcWNvbSxzcG1pLXNkYW0ueWFtbCAgICAgICAgfCAgMSAr
Cj4gIC4uLi9iaW5kaW5ncy9udm1lbS9yb2NrY2hpcCxvdHAueWFtbCAgICAgICAgICB8ICAxICsK
PiAgLi4uL2JpbmRpbmdzL252bWVtL3JvY2tjaGlwLWVmdXNlLnlhbWwgICAgICAgIHwgIDEgKwo+
ICAuLi4vbnZtZW0vc29jaW9uZXh0LHVuaXBoaWVyLWVmdXNlLnlhbWwgICAgICAgfCAgMSArCj4g
IC4uLi9iaW5kaW5ncy9udm1lbS9zdW5wbHVzLHNwNzAyMS1vY290cC55YW1sICB8ICAxICsKPiAg
Li4uL2JpbmRpbmdzL3J0Yy9hbWxvZ2ljLG1lc29uNi1ydGMueWFtbCAgICAgIHwgIDEgKwo+ICAx
OSBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9udm1lbS9u
dm1lbS1kZXByZWNhdGVkLWNlbGxzLnlhbWwKPiAKCk15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmlu
ZyAnbWFrZSBEVF9DSEVDS0VSX0ZMQUdTPS1tIGR0X2JpbmRpbmdfY2hlY2snCm9uIHlvdXIgcGF0
Y2ggKERUX0NIRUNLRVJfRkxBR1MgaXMgbmV3IGluIHY1LjEzKToKCnlhbWxsaW50IHdhcm5pbmdz
L2Vycm9yczoKCmR0c2NoZW1hL2R0YyB3YXJuaW5ncy9lcnJvcnM6Ci9idWlsZHMvcm9iaGVycmlu
Zy9kdC1yZXZpZXctY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0
Yy9hbWxvZ2ljLG1lc29uNi1ydGMueWFtbDoKRXJyb3IgaW4gcmVmZXJlbmNlZCBzY2hlbWEgbWF0
Y2hpbmcgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ydGMvbnZtZW0tZGVwcmVj
YXRlZC1jZWxscy55YW1sCi9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctY2kvbGludXgvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9hbWxvZ2ljLG1lc29uNi1ydGMuZXhh
bXBsZS5kdGI6IHJ0Y0A3NDA6IEZhbHNlIHNjaGVtYSBkb2VzIG5vdCBhbGxvdyB7J2NvbXBhdGli
bGUnOiBbJ2FtbG9naWMsbWVzb242LXJ0YyddLCAncmVnJzogW1sxODU2LCAyMF1dLCAnaW50ZXJy
dXB0cyc6IFtbMCwgNzIsIDFdXSwgJ2Nsb2Nrcyc6IFtbNDI5NDk2NzI5NV1dLCAndmRkLXN1cHBs
eSc6IFtbNDI5NDk2NzI5NV1dLCAncmVzZXRzJzogW1s0Mjk0OTY3Mjk1XV0sICcjYWRkcmVzcy1j
ZWxscyc6IFtbMV1dLCAnI3NpemUtY2VsbHMnOiBbWzFdXSwgJ21hY0AwJzogeydyZWcnOiBbWzAs
IDZdXX0sICckbm9kZW5hbWUnOiBbJ3J0Y0A3NDAnXX0KCWZyb20gc2NoZW1hICRpZDogaHR0cDov
L2RldmljZXRyZWUub3JnL3NjaGVtYXMvcnRjL2FtbG9naWMsbWVzb242LXJ0Yy55YW1sIwovYnVp
bGRzL3JvYmhlcnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9ydGMvYW1sb2dpYyxtZXNvbjYtcnRjLmV4YW1wbGUuZHRiOiBydGNANzQwOiBV
bmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dlZCAoJ21hY0AwJyB3YXMgdW5leHBl
Y3RlZCkKCWZyb20gc2NoZW1hICRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcnRj
L2FtbG9naWMsbWVzb242LXJ0Yy55YW1sIwoKZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVm
Y2hlY2tkb2NzKToKClNlZSBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2
aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8yMDIzMTAwMzA1MDM1NS4xNjMxLTEtemFqZWM1QGdtYWls
LmNvbQoKVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMx
LiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2gu
CgpJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4ndCBz
ZWUgdGhlIGFib3ZlCmVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGluc3Rh
bGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hlbWEg
LS11cGdyYWRlCgpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBh
Ym92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBz
ZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVtYS4g
SG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIg
c2NoZW1hLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
