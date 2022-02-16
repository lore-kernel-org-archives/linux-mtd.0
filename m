Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635DBC433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Feb 2022 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icYiMFkqQJzBAszGkL7i1Y2c85V0+0UHUw/Xk/0dDL4=; b=v4wvUlDQJTM329
	y7Y7z3nAoupnpYitRCH4pdTTNgHZgBgbToQ1DYxuji+lRW/4wm6U07ACPeIiwc07kWTL0UK2XHn2D
	LGF0wDMcx/Gy4U4YAUd8AXuQtDAwUmFz6ITP/1oRbJQTjdiF9hxOEYiyIhNjH5qB6YZJb/D7pMY3K
	DvvvzCEBDaEg1Y3phKuvzngusSgCP4PHiSWSkul4rEcJoPKngm/2Fnw3bL5rlR1IWXxAfL/NOj8OD
	OSXr94UNbOZtz3aWE22hEMNvyuDBiQkkdxoc6m0StnU9w1oyRW906L0PKNO9KGNhzhxfODU+xVT/3
	5kVORFTYVqLl97uvd2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKFS4-0063f1-TI; Wed, 16 Feb 2022 08:14:17 +0000
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKFQt-0063A4-Rg
 for linux-mtd@lists.infradead.org; Wed, 16 Feb 2022 08:13:06 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3D56D24B44;
 Wed, 16 Feb 2022 08:12:56 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 09:12:54 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0010590fb10-4626-4deb-8236-9a8be91dbf44,
 CB3E44AF90526EF3DA3218D7163352937EBBBEE5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <d517d453-ddd5-8c9e-7b1f-56f5f83d2f1e@kaod.org>
Date: Wed, 16 Feb 2022 09:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 10/10] spi: aspeed: Activate new spi-mem driver
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: <linux-spi@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Mark Brown <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, 
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery
 <andrew@aj.id.au>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, devicetree
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-11-clg@kaod.org>
 <CACPK8XdvczyZ1QHtFm7JJAC7AY+QmWSx0MarUwLjUyOtC9DnSQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XdvczyZ1QHtFm7JJAC7AY+QmWSx0MarUwLjUyOtC9DnSQ@mail.gmail.com>
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 365dd3b7-2a44-4f14-8514-26cf6445fd31
X-Ovh-Tracer-Id: 12828503540660800388
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeehgdduudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_001304_242572_FBD9C50A 
X-CRM114-Status: GOOD (  19.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMi8xNi8yMiAwODowMiwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IE9uIE1vbiwgMTQgRmViIDIw
MjIgYXQgMDk6NDMsIEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+IHdyb3RlOgo+Pgo+
PiBUaGUgcHJldmlvdXMgZHJpdmVyIHVzaW5nIHRoZSBNVEQgU1BJIE5PUiBpbnRlcmZhY2UgaXMg
a2VwdCBpbiBjYXNlIHdlCj4+IGZpbmQgc29tZSBpc3N1ZXMgYnV0IHdlIHNob3VsZCByZW1vdmUg
aXQgcXVpY2tseSBvbmNlIHRoZSBuZXcgZHJpdmVyCj4+IHVzaW5nIHRoZSBzcGktbWVtIGludGVy
ZmFjZSBoYXMgYmVlbiBzdWZmaWNpZW50bHkgZXhwb3NlZC4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAKPiBJIHN1Z2dlc3Qgd2UgZHJvcCB0
aGUgZGVmY29uZmlnIGNoYW5nZXMgZnJvbSBib3RoIHRoaXMgcGF0Y2ggYW5kIHRoZQo+IGZpcnN0
LiBUaGlzIHdheSB3ZSdsbCBhbHdheXMgaGF2ZSB0aGUgbmV3IGRyaXZlciBiZWluZyBidWlsdCwg
d2l0aAo+IGxlc3MgY2h1cm4uCj4gCj4gSWYgeW91IHN0cm9uZ2x5IHByZWZlciB0aGUgd2F5IHlv
dSd2ZSBkb25lIGl0IHRoZW4gdGhhdCdzIGZpbmUgdG9vLgoKSSBhbSBmaW5lIHdpdGggdGhhdCwg
YnV0LCB3aXRoIG9ubHkgcGF0Y2ggMSwgdGhlIGRlZmNvbmZpZyBmaWxlcyB3b3VsZApiZSByZWZl
cmVuY2luZyBhbiBub24tZXhpc3RpbmcgQ09ORklHLiBJcyB0aGF0IG9rID8KClRoYW5rcywKCkMu
CgoKCj4gCj4+IC0tLQo+PiAgIGFyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNvbmZpZyB8
IDIgKy0KPj4gICBhcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9kZWZjb25maWcgfCAyICstCj4+
ICAgYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25maWcgIHwgMiArLQo+PiAgIGFyY2gv
YXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnICB8IDIgKy0KPj4gICA0IGZpbGVzIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNvbmZpZyBiL2FyY2gvYXJtL2NvbmZpZ3MvYXNw
ZWVkX2c0X2RlZmNvbmZpZwo+PiBpbmRleCA5NjQ1MzY0NDRjZDcuLmI0YTFiMmVkMWExNyAxMDA2
NDQKPj4gLS0tIGEvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzRfZGVmY29uZmlnCj4+ICsrKyBi
L2FyY2gvYXJtL2NvbmZpZ3MvYXNwZWVkX2c0X2RlZmNvbmZpZwo+PiBAQCAtNjQsNyArNjQsNyBA
QCBDT05GSUdfTVREX0JMT0NLPXkKPj4gICBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUj15
Cj4+ICAgQ09ORklHX01URF9TUElfTk9SPXkKPj4gICAjIENPTkZJR19NVERfU1BJX05PUl9VU0Vf
NEtfU0VDVE9SUyBpcyBub3Qgc2V0Cj4+IC1DT05GSUdfU1BJX0FTUEVFRF9TTUNfTVREX1NQSV9O
T1I9eQo+PiArQ09ORklHX1NQSV9BU1BFRURfU01DPXkKPj4gICBDT05GSUdfTVREX1VCST15Cj4+
ICAgQ09ORklHX01URF9VQklfRkFTVE1BUD15Cj4+ICAgQ09ORklHX01URF9VQklfQkxPQ0s9eQo+
PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzVfZGVmY29uZmlnIGIvYXJj
aC9hcm0vY29uZmlncy9hc3BlZWRfZzVfZGVmY29uZmlnCj4+IGluZGV4IGU4MDkyMzZjYTg4Yi4u
Y2NjNDI0MGVlNGI1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9jb25maWdzL2FzcGVlZF9nNV9k
ZWZjb25maWcKPj4gKysrIGIvYXJjaC9hcm0vY29uZmlncy9hc3BlZWRfZzVfZGVmY29uZmlnCj4+
IEBAIC0xMDMsNyArMTAzLDcgQEAgQ09ORklHX01URF9CTE9DSz15Cj4+ICAgQ09ORklHX01URF9Q
QVJUSVRJT05FRF9NQVNURVI9eQo+PiAgIENPTkZJR19NVERfU1BJX05PUj15Cj4+ICAgIyBDT05G
SUdfTVREX1NQSV9OT1JfVVNFXzRLX1NFQ1RPUlMgaXMgbm90IHNldAo+PiAtQ09ORklHX1NQSV9B
U1BFRURfU01DX01URF9TUElfTk9SPXkKPj4gK0NPTkZJR19TUElfQVNQRUVEX1NNQz15Cj4+ICAg
Q09ORklHX01URF9VQkk9eQo+PiAgIENPTkZJR19NVERfVUJJX0ZBU1RNQVA9eQo+PiAgIENPTkZJ
R19NVERfVUJJX0JMT0NLPXkKPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlf
djVfZGVmY29uZmlnIGIvYXJjaC9hcm0vY29uZmlncy9tdWx0aV92NV9kZWZjb25maWcKPj4gaW5k
ZXggNDkwODNlZjA1ZmIwLi44MGEzYWUwMmQ3NTkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvYXJtL2Nv
bmZpZ3MvbXVsdGlfdjVfZGVmY29uZmlnCj4+ICsrKyBiL2FyY2gvYXJtL2NvbmZpZ3MvbXVsdGlf
djVfZGVmY29uZmlnCj4+IEBAIC0xMDMsNyArMTAzLDcgQEAgQ09ORklHX01URF9SQVdfTkFORD15
Cj4+ICAgQ09ORklHX01URF9OQU5EX0FUTUVMPXkKPj4gICBDT05GSUdfTVREX05BTkRfT1JJT049
eQo+PiAgIENPTkZJR19NVERfU1BJX05PUj15Cj4+IC1DT05GSUdfU1BJX0FTUEVFRF9TTUNfTVRE
X1NQSV9OT1I9eQo+PiArQ09ORklHX1NQSV9BU1BFRURfU01DPXkKPj4gICBDT05GSUdfTVREX1VC
ST15Cj4+ICAgQ09ORklHX0JMS19ERVZfTE9PUD15Cj4+ICAgQ09ORklHX0FUTUVMX1NTQz1tCj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZyBiL2FyY2gv
YXJtL2NvbmZpZ3MvbXVsdGlfdjdfZGVmY29uZmlnCj4+IGluZGV4IGZjMWI2OTI1NmI2NC4uMzM1
NzI5OThkYmJlIDEwMDY0NAo+PiAtLS0gYS9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNv
bmZpZwo+PiArKysgYi9hcmNoL2FybS9jb25maWdzL211bHRpX3Y3X2RlZmNvbmZpZwo+PiBAQCAt
MjE3LDcgKzIxNyw3IEBAIENPTkZJR19NVERfTkFORF9EQVZJTkNJPXkKPj4gICBDT05GSUdfTVRE
X05BTkRfU1RNMzJfRk1DMj15Cj4+ICAgQ09ORklHX01URF9OQU5EX1BMMzVYPXkKPj4gICBDT05G
SUdfTVREX1NQSV9OT1I9eQo+PiAtQ09ORklHX1NQSV9BU1BFRURfU01DX01URF9TUElfTk9SPW0K
Pj4gK0NPTkZJR19TUElfQVNQRUVEX1NNQz1tCj4+ICAgQ09ORklHX01URF9VQkk9eQo+PiAgIENP
TkZJR19CTEtfREVWX0xPT1A9eQo+PiAgIENPTkZJR19CTEtfREVWX1JBTT15Cj4+IC0tCj4+IDIu
MzQuMQo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
