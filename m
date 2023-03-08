Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48F7C6FD1E
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Mar 2023 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+7cNWT4nVP9O4qoLt0NpiZG1Prjb3qwHcdjfZEQ2Eb4=; b=lyXAnoWj8ww89x
	KvFMPHaQG2ZBWXWGXE31s5NRF/f5Z3en3uDvl+XiBD0dfsbef3yPj9ujeNykJr7GX995xpJ8KdwIE
	drdIRNGADCD34ZNZYKmICImsqm/n0HQ1PwMEp/EKCf5n2YKJ4jIvN8FbKnnvYg9XaNOQfQ3UpPx5f
	XBtemACXf2qyh5a9tKqRrEftaGgdtfeA350GDJK0vkrJFB/SQTrdvUNjAP0JnpSyaMZ3tcJaTPICN
	9OW6QreWLw3aK0NGYnqMKLrBz5NkeONbe/pZbMGtb5xMHoaAvtQKUcxBbb1+xnxMdAC2KFknYgQBi
	7sVPtdvl4hV7DfPUzgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwl1-005wxc-HT; Wed, 08 Mar 2023 16:35:15 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZwkv-005wvf-Ge; Wed, 08 Mar 2023 16:35:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 80F85FF811;
	Wed,  8 Mar 2023 16:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678293300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lUqLGRcG0w1R1iyEPwO1Ebbfe3rcU5gyLFk3k2avVAA=;
	b=aHrGdIQeeaiSvYoxSkLc+KAYSRX4ac2bF5cebMcenP1fS2MSr2Knm0vLB2OazwSvbodCvH
	ngNLG2Qkv7cwBX15KF36vC4m+gfmMsAw32l/HChTK739+bFor3Ya7fTEwEfCsMB6j8F5IA
	RzZqXkwxa1dp7Wy86wS7S9tFCtqbmrM2NvGOeOoP02m8zdKIqAymEDeXyy0rwnfnaYf08F
	8MhV9B8uD4Ht0JD0Hhb1m2PiSPW1P8k7lUrV+dI4RkgATib9HdhOihqM4U60ZNPH2vr68V
	pF+33zGbMA2taiYfi7KHopl6udaUGxzqC8X2EXQaW80UuRJ95luD65pOC+ArPw==
Date: Wed, 8 Mar 2023 17:34:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Claudiu Beznea
 <claudiu.beznea@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy
 Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Orson
 Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vincent Shih <vincent.sunplus@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rtc@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V2] nvmem: add explicit config option to read OF fixed
 cells
Message-ID: <20230308173256.3837b87b@xps-13>
In-Reply-To: <20230224072903.20945-1-zajec5@gmail.com>
References: <20230224072903.20945-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_083509_849383_A1CBB927 
X-CRM114-Status: GOOD (  29.36  )
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

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBGcmksIDI0IEZlYiAyMDIzIDA4
OjI5OjAzICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gTlZNRU0gc3Vic3lzdGVtIGxvb2tzIGZvciBmaXhlZCBOVk1FTSBjZWxscyAoc3BlY2lm
aWVkIGluIERUKSBieQo+IGRlZmF1bHQuIFRoaXMgYmVoYXZpb3VyIG1hZGUgc2Vuc2UgaW4gZWFy
bHkgZGF5cyBiZWZvcmUgYWRkaW5nIHN1cHBvcnQKPiBmb3IgZHluYW1pYyBjZWxscy4KPiAKPiBX
aXRoIGV2ZXJ5IG5ldyBzdXBwb3J0ZWQgTlZNRU0gZGV2aWNlIHdpdGggZHluYW1pYyBjZWxscyBj
dXJyZW50Cj4gYmVoYXZpb3VyIGJlY29tZXMgbm9uLW9wdGltYWwuIEl0IHJlc3VsdHMgaW4gdW5u
ZWVkZWQgaXRlcmF0aW5nIG92ZXIgRFQKPiBub2RlcyBhbmQgbWF5IHJlc3VsdCBpbiBmYWxzZSBk
aXNjb3Zlcnkgb2YgY2VsbHMgKGRlcGVuZGluZyBvbiB1c2VkIERUCj4gcHJvcGVydGllcykuCj4g
Cj4gVGhpcyBiZWhhdmlvdXIgaGFzIGFjdHVhbGx5IGNhdXNlZCBhIHByb2JsZW0gYWxyZWFkeSB3
aXRoIHRoZSBNVEQKPiBzdWJzeXN0ZW0uIE1URCBzdWJwYXJ0aXRpb25zIHdlcmUgaW5jb3JyZWN0
bHkgdHJlYXRlZCBhcyBOVk1FTSBjZWxscy4KClRoYXQncyB0cnVlLCBidXQgSSBleHBlY3QgdGhp
cyB0byBiZSByZWFsbHkgTVREIHNwZWNpZmljLgoKQSBjb25jcmV0ZSBwcm9wb3NhbCBiZWxvdy4K
Cj4gQWxzbyB3aXRoIHVwY29taW5nIHN1cHBvcnQgZm9yIE5WTUVNIGxheW91dHMgbm8gbmV3IGJp
bmRpbmcgb3IgZHJpdmVyCj4gc2hvdWxkIHN1cHBvcnQgZml4ZWQgY2VsbHMgZGVmaW5lZCBpbiBk
ZXZpY2Ugbm9kZS4KCkknbSBub3Qgc3VyZSBJIGFncmVlIHdpdGggdGhpcyBzdGF0ZW1lbnQuIFdl
IGFyZSBub3QgcHJldmVudGluZyBuZXcKYmluZGluZy9kcml2ZXIgdG8gdXNlIGZpeGVkIGNlbGxz
LCBvci4uLj8gV2Ugb2ZmZXIgYSBuZXcgd2F5IHRvIGV4cG9zZQpudm1lbSBjZWxscyB3aXRoIGFu
b3RoZXIgd2F5IHRoYW4gImZpeGVkLW9mZnNldCIgYW5kICJmaXhlZC1zaXplIiBPRgpub2Rlcy4K
Cj4gU29sdmUgdGhpcyBieSBtb2RpZnlpbmcgZHJpdmVycyBmb3IgYmluZGluZ3MgdGhhdCBzdXBw
b3J0IHNwZWNpZnlpbmcKPiBmaXhlZCBOVk1FTSBjZWxscyBpbiBEVC4gTWFrZSB0aGVtIGV4cGxp
Y2l0bHkgdGVsbCBOVk1FTSBzdWJzeXN0ZW0gdG8KPiByZWFkIGNlbGxzIGZyb20gRFQuCj4gCj4g
SXQgd2Fzbid0IGNsZWFyICh0byBtZSkgaWYgcnRjIGFuZCB3MSBjb2RlIGFjdHVhbGx5IHVzZXMg
Zml4ZWQgY2VsbHMuIEkKPiBlbmFibGVkIHRoZW0gdG8gZG9uJ3QgcmlzayBhbnkgYnJlYWthZ2Uu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+
IFtmb3IgZHJpdmVycy9udm1lbS9tZXNvbi17ZWZ1c2UsbXgtZWZ1c2V9LmNdCj4gQWNrZWQtYnk6
IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+
Cj4gLS0tCj4gVjI6IEZpeCBzdG0zMi1yb21lbS5jIHR5cG8gYnJlYWtpbmcgaXRzIGNvbXBpbGF0
aW9uCj4gICAgIFBpY2sgTWFydGluJ3MgQWNrZWQtYnkKPiAgICAgQWRkIHBhcmFncmFwaCBhYm91
dCBsYXlvdXRzIGRlcHJlY2F0aW5nIHVzZV9maXhlZF9vZl9jZWxscwo+IC0tLQo+ICBkcml2ZXJz
L210ZC9tdGRjb3JlLmMgICAgICAgICAgfCAyICsrCj4gIGRyaXZlcnMvbnZtZW0vYXBwbGUtZWZ1
c2VzLmMgICB8IDEgKwo+ICBkcml2ZXJzL252bWVtL2NvcmUuYyAgICAgICAgICAgfCA4ICsrKysr
LS0tCj4gIGRyaXZlcnMvbnZtZW0vaW14LW9jb3RwLXNjdS5jICB8IDEgKwo+ICBkcml2ZXJzL252
bWVtL2lteC1vY290cC5jICAgICAgfCAxICsKPiAgZHJpdmVycy9udm1lbS9tZXNvbi1lZnVzZS5j
ICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vbWVzb24tbXgtZWZ1c2UuYyB8IDEgKwo+ICBkcml2
ZXJzL252bWVtL21pY3JvY2hpcC1vdHBjLmMgfCAxICsKPiAgZHJpdmVycy9udm1lbS9tdGstZWZ1
c2UuYyAgICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vcWNvbS1zcG1pLXNkYW0uYyB8IDEgKwo+
ICBkcml2ZXJzL252bWVtL3FmcHJvbS5jICAgICAgICAgfCAxICsKPiAgZHJpdmVycy9udm1lbS9y
YXZlLXNwLWVlcHJvbS5jIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vcm9ja2NoaXAtZWZ1c2UuYyB8
IDEgKwo+ICBkcml2ZXJzL252bWVtL3NjMjd4eC1lZnVzZS5jICAgfCAxICsKPiAgZHJpdmVycy9u
dm1lbS9zcHJkLWVmdXNlLmMgICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vc3RtMzItcm9tZW0u
YyAgICB8IDEgKwo+ICBkcml2ZXJzL252bWVtL3N1bnBsdXMtb2NvdHAuYyAgfCAxICsKPiAgZHJp
dmVycy9udm1lbS9zdW54aV9zaWQuYyAgICAgIHwgMSArCj4gIGRyaXZlcnMvbnZtZW0vdW5pcGhp
ZXItZWZ1c2UuYyB8IDEgKwo+ICBkcml2ZXJzL252bWVtL3p5bnFtcF9udm1lbS5jICAgfCAxICsK
PiAgZHJpdmVycy9ydGMvbnZtZW0uYyAgICAgICAgICAgIHwgMSArCj4gIGRyaXZlcnMvdzEvc2xh
dmVzL3cxX2RzMjUweC5jICB8IDEgKwo+ICBpbmNsdWRlL2xpbnV4L252bWVtLXByb3ZpZGVyLmgg
fCAyICsrCj4gIDIzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2RyaXZlcnMvbXRk
L210ZGNvcmUuYwo+IGluZGV4IDBmZWFjYjlmYmRhYy4uMWJiNDc5YzBmNzU4IDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+
IEBAIC01MjMsNiArNTIzLDcgQEAgc3RhdGljIGludCBtdGRfbnZtZW1fYWRkKHN0cnVjdCBtdGRf
aW5mbyAqbXRkKQo+ICAJY29uZmlnLmRldiA9ICZtdGQtPmRldjsKPiAgCWNvbmZpZy5uYW1lID0g
ZGV2X25hbWUoJm10ZC0+ZGV2KTsKPiAgCWNvbmZpZy5vd25lciA9IFRISVNfTU9EVUxFOwo+ICsJ
Y29uZmlnLnVzZV9maXhlZF9vZl9jZWxscyA9IG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5vZGUs
ICJudm1lbS1jZWxscyIpOwoKSSBhbSB3b25kZXJpbmcgaG93IG10ZCBzcGVjaWZpYyB0aGlzIGlz
PyBGb3IgbWUgYWxsIE9GIG5vZGVzIGNvbnRhaW5pbmcKdGhlIG52bWVtLWNlbGxzIGNvbXBhdGli
bGUgc2hvdWxkIGJlIHRyZWF0ZWQgYXMgY2VsbHMgcHJvdmlkZXJzIGFuZApwb3B1bGF0ZSBudm1l
bSBjZWxscyBhcyBmb3IgZWFjaCBjaGlsZHJlbi4KCldoeSBkb24ndCB3ZSBqdXN0IGNoZWNrIGZv
ciB0aGlzIGNvbXBhdGlibGUgdG8gYmUgcHJlc2VudD8gaW4KbnZtZW1fYWRkX2NlbGxzX2Zyb21f
b2YoKSA/IEFuZCBpZiBub3Qgd2UganVzdCBza2lwIHRoZSBvcGVyYXRpb24uCgpUaGlzIHdheSB3
ZSBzdGlsbCBmb2xsb3cgdGhlIGJpbmRpbmdzIChldmVuIHRob3VnaCB1c2luZyBudm1lbS1jZWxs
cyBpbgp0aGUgY29tcGF0aWJsZSBwcm9wZXJ0eSB0byByZXF1aXJlIGNlbGxzIHBvcHVsYXRpb24g
d2FzIGEgbWlzdGFrZSBpbgp0aGUgZmlyc3QgcGxhY2UsIGFzIGRpc2N1c3NlZCBpbiB0aGUgZGV2
bGluayB0aHJlYWQgcmVjZW50bHkpIGJ1dCB0aGVyZQppcyBubyBuZWVkIGZvciBhIHBlci1kcml2
ZXIgY29uZmlnIG9wdGlvbj8KCj4gIAljb25maWcucmVnX3JlYWQgPSBtdGRfbnZtZW1fcmVnX3Jl
YWQ7Cj4gIAljb25maWcuc2l6ZSA9IG10ZC0+c2l6ZTsKPiAgCWNvbmZpZy53b3JkX3NpemUgPSAx
Owo+IEBAIC04OTEsNiArODkyLDcgQEAgc3RhdGljIHN0cnVjdCBudm1lbV9kZXZpY2UgKm10ZF9v
dHBfbnZtZW1fcmVnaXN0ZXIoc3RydWN0IG10ZF9pbmZvICptdGQsCj4gIAljb25maWcubmFtZSA9
IGthc3ByaW50ZihHRlBfS0VSTkVMLCAiJXMtJXMiLCBkZXZfbmFtZSgmbXRkLT5kZXYpLCBjb21w
YXRpYmxlKTsKPiAgCWNvbmZpZy5pZCA9IE5WTUVNX0RFVklEX05PTkU7Cj4gIAljb25maWcub3du
ZXIgPSBUSElTX01PRFVMRTsKPiArCWNvbmZpZy51c2VfZml4ZWRfb2ZfY2VsbHMgPSB0cnVlOwo+
ICAJY29uZmlnLnR5cGUgPSBOVk1FTV9UWVBFX09UUDsKPiAgCWNvbmZpZy5yb290X29ubHkgPSB0
cnVlOwo+ICAJY29uZmlnLmlnbm9yZV93cCA9IHRydWU7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bnZtZW0vYXBwbGUtZWZ1c2VzLmMgYi9kcml2ZXJzL252bWVtL2FwcGxlLWVmdXNlcy5jCj4gaW5k
ZXggOWI3Yzg3MTAyMTA0Li4wMTE5YmFjNDNiMmMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9udm1l
bS9hcHBsZS1lZnVzZXMuYwo+ICsrKyBiL2RyaXZlcnMvbnZtZW0vYXBwbGUtZWZ1c2VzLmMKPiBA
QCAtMzYsNiArMzYsNyBAQCBzdGF0aWMgaW50IGFwcGxlX2VmdXNlc19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJc3RydWN0IHJlc291cmNlICpyZXM7Cj4gIAlzdHJ1Y3Qg
bnZtZW1fY29uZmlnIGNvbmZpZyA9IHsKPiAgCQkuZGV2ID0gJnBkZXYtPmRldiwKPiArCQkudXNl
X2ZpeGVkX29mX2NlbGxzID0gdHJ1ZSwKPiAgCQkucmVhZF9vbmx5ID0gdHJ1ZSwKPiAgCQkucmVn
X3JlYWQgPSBhcHBsZV9lZnVzZXNfcmVhZCwKPiAgCQkuc3RyaWRlID0gc2l6ZW9mKHUzMiksCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZW0vY29yZS5jIGIvZHJpdmVycy9udm1lbS9jb3JlLmMK
PiBpbmRleCAxNzRlZjM1NzRlMDcuLjY3ODNjZDg0NzhkNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L252bWVtL2NvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbnZtZW0vY29yZS5jCj4gQEAgLTg0NCw5ICs4
NDQsMTEgQEAgc3RydWN0IG52bWVtX2RldmljZSAqbnZtZW1fcmVnaXN0ZXIoY29uc3Qgc3RydWN0
IG52bWVtX2NvbmZpZyAqY29uZmlnKQo+ICAJaWYgKHJ2YWwpCj4gIAkJZ290byBlcnJfcmVtb3Zl
X2NlbGxzOwo+ICAKPiAtCXJ2YWwgPSBudm1lbV9hZGRfY2VsbHNfZnJvbV9vZihudm1lbSk7Cj4g
LQlpZiAocnZhbCkKPiAtCQlnb3RvIGVycl9yZW1vdmVfY2VsbHM7Cj4gKwlpZiAoY29uZmlnLT51
c2VfZml4ZWRfb2ZfY2VsbHMpIHsKPiArCQlydmFsID0gbnZtZW1fYWRkX2NlbGxzX2Zyb21fb2Yo
bnZtZW0pOwo+ICsJCWlmIChydmFsKQo+ICsJCQlnb3RvIGVycl9yZW1vdmVfY2VsbHM7Cj4gKwl9
Cj4gIAo+ICAJZGV2X2RiZygmbnZtZW0tPmRldiwgIlJlZ2lzdGVyaW5nIG52bWVtIGRldmljZSAl
c1xuIiwgY29uZmlnLT5uYW1lKTsKPiAgCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
