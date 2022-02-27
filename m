Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D711CC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 27 Feb 2022 21:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNm/RCkaMT0xEuMS6rPU7v8zWIty3HjoZ5ioGZlcjqI=; b=18oTQdfBOtwFP7
	kX4sDFXxksBREWa6ncd+kILkuPiteIe/4K/vZD9Z/pNHEvqvjXo0Bh82re5tD1Vb9l53GQNfOl5e4
	3578TItKUhn3HXA5ydo9dvqDiQ2qve87X4U9+ivMm+qL7XI7zKGZlwYh0yDokTdyniblebwdxYvie
	RGvUKaADzHFpVuGD54ntpdPBoUHPgcFDC5P5sj4YMrP9uca+w+GPRNGsQMhQHONKmGcILt+Uzxdhd
	3PqlRUJkjGWDROsgkddeZl/Ria25Vpxep2G7LMfpLAvVpxs1M++HogVmOJ+UDNR1Z17m/3rR5eR4F
	IW+SC/IdSsCpXM3qdbHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOQkp-00AC6K-HA; Sun, 27 Feb 2022 21:06:55 +0000
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOQkk-00AC39-Li
 for linux-mtd@lists.infradead.org; Sun, 27 Feb 2022 21:06:53 +0000
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.105])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 44B8422DC0;
 Sun, 27 Feb 2022 21:06:46 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sun, 27 Feb
 2022 22:06:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00115e110f1-ecce-4d7f-bb2b-9bf0158c7309,
 3C1F276A0880C75D3AA0293DFE804433F7F83470) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ceace047-6d07-1ca3-c1ae-7137456975c5@kaod.org>
Date: Sun, 27 Feb 2022 22:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/10] spi: aspeed: Add support for direct mapping
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
 <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-5-clg@kaod.org>
 <20220225091219.bv62jm3nehg4e4z4@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220225091219.bv62jm3nehg4e4z4@ti.com>
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0b4b9ae5-d348-4927-88b8-76128bb7f478
X-Ovh-Tracer-Id: 16710043469378063236
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrleekgddugeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeeljeefveejheeihfegleegleduudeluedvffetudeigedvgfetveefteekteefnecuffhomhgrihhnpegsuhhfrdhinhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220227_130651_040634_4BF37B95 
X-CRM114-Status: GOOD (  22.42  )
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

T24gMi8yNS8yMiAxMDoxMiwgUHJhdHl1c2ggWWFkYXYgd3JvdGU6Cj4gT24gMTQvMDIvMjIgMTA6
NDJBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4+IFVzZSBkaXJlY3QgbWFwcGluZyB0byBy
ZWFkIHRoZSBmbGFzaCBkZXZpY2UgY29udGVudHMuIFRoaXMgb3BlcmF0aW9uCj4+IG1vZGUgaXMg
Y2FsbGVkICJDb21tYW5kIG1vZGUiIG9uIEFzcGVlZCBTb0MgU01DIGNvbnRyb2xsZXJzLiBJdCB1
c2VzIGEKPj4gQ29udHJvbCBSZWdpc3RlciBmb3IgdGhlIHNldHRpbmdzIHRvIGFwcGx5IHdoZW4g
YSBtZW1vcnkgb3BlcmF0aW9uIGlzCj4+IHBlcmZvcm1lZCBvbiB0aGUgZmxhc2ggZGV2aWNlIG1h
cHBpbmcgd2luZG93Lgo+Pgo+PiBJZiB0aGUgd2luZG93IGlzIG5vdCBiaWcgZW5vdWdoLCBmYWxs
IGJhY2sgdG8gdGhlICJVc2VyIG1vZGUiIHRvCj4+IHBlcmZvcm0gdGhlIHJlYWQuCj4+Cj4+IERp
cmVjdCBtYXBwaW5nIGZvciB3cml0ZXMgd2lsbCBjb21lIGxhdGVyIHdoZW4gdmFsaWRhdGVkLgo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+PiAt
LS0KPj4gICBkcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jIHwgNjcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDY1IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktYXNw
ZWVkLXNtYy5jIGIvZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwo+PiBpbmRleCAwYWVmZjZm
NDY4YWYuLjhkMzNmY2I3NzM2YSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLWFzcGVl
ZC1zbWMuYwo+PiArKysgYi9kcml2ZXJzL3NwaS9zcGktYXNwZWVkLXNtYy5jCj4+IEBAIC0zNDUs
OCArMzQ1LDggQEAgc3RhdGljIGludCBkb19hc3BlZWRfc3BpX2V4ZWNfb3Aoc3RydWN0IHNwaV9t
ZW0gKm1lbSwgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKm8KPj4gICAJCWlmICghb3AtPmFkZHIu
bmJ5dGVzKQo+PiAgIAkJCXJldCA9IGFzcGVlZF9zcGlfcmVhZF9yZWcoY2hpcCwgb3ApOwo+PiAg
IAkJZWxzZQo+PiAtCQkJcmV0ID0gYXNwZWVkX3NwaV9yZWFkX3VzZXIoY2hpcCwgb3AsIG9wLT5h
ZGRyLnZhbCwKPj4gLQkJCQkJCSAgIG9wLT5kYXRhLm5ieXRlcywgb3AtPmRhdGEuYnVmLmluKTsK
Pj4gKwkJCW1lbWNweV9mcm9taW8ob3AtPmRhdGEuYnVmLmluLCBjaGlwLT5haGJfYmFzZSArIG9w
LT5hZGRyLnZhbCwKPj4gKwkJCQkgICAgICBvcC0+ZGF0YS5uYnl0ZXMpOwo+IAo+IFdoeSBjaGFu
Z2UgdGhpcz8gZXhlY19vcCBzaG91bGQgYmUgaW5kZXBlbmRlbnQgZnJvbSBkaXJtYXAgQVBJcy4g
QW5kIHlvdQo+IGRvbid0IGV2ZW4gZG8gdGhlIGFoYl93aW5kb3dfc2l6ZSBjaGVja3MgaGVyZS4K
Cm5vIGluZGVlZC4gTm93IHRoYXQgZGlyZWN0IG1hcCBpcyBjb25maWd1cmVkLCBhbGwgcmVhZHMg
b2YgZmxhc2ggY29udGVudHMKc2hvdWxkIGdvIHRocm91Z2ggdGhlIGRpcmVjdCBtYXAgb3AuIFRo
aXMgaXMgbW9zdGx5IGZvciB0aGUgUkRTRkRQIGNvbW1hbmQKd2hpY2ggaGFzIGEgZGlmZmVyZW50
IGFkZHJlc3Mgc3BhY2UgYW5kIHVzZXMgM0IuCgpUaGVvcmV0aWNhbGx5LCB3ZSBzaG91bGQgYmUg
YWJsZSB0byB1c2UgbWVtY3B5X2Zyb21pbygpIGFuZCBtZW1jcHlfdG9pbygpCmZvciBhbGwgY29t
bWFuZHMgYnV0IG5vdCBhbGwgY29udHJvbGxlcnMgKDYgb2YgdGhlbSkgc3VwcG9ydCB0aGlzIG1v
ZGUuCgpUaGFua3MsCgpDLgoKCj4gCj4+ICAgCX0gZWxzZSB7Cj4+ICAgCQlpZiAoIW9wLT5hZGRy
Lm5ieXRlcykKPj4gICAJCQlyZXQgPSBhc3BlZWRfc3BpX3dyaXRlX3JlZyhjaGlwLCBvcCk7Cj4+
IEBAIC00MjYsMTAgKzQyNiw3MyBAQCBzdGF0aWMgaW50IGFzcGVlZF9zcGlfY2hpcF9zZXRfZGVm
YXVsdF93aW5kb3coc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCkKPj4gICAJcmV0dXJuIGNo
aXAtPmFoYl93aW5kb3dfc2l6ZSA/IDAgOiAtMTsKPj4gICB9Cj4+ICAgCj4+ICtzdGF0aWMgaW50
IGFzcGVlZF9zcGlfZGlybWFwX2NyZWF0ZShzdHJ1Y3Qgc3BpX21lbV9kaXJtYXBfZGVzYyAqZGVz
YykKPj4gK3sKPj4gKwlzdHJ1Y3QgYXNwZWVkX3NwaSAqYXNwaSA9IHNwaV9jb250cm9sbGVyX2dl
dF9kZXZkYXRhKGRlc2MtPm1lbS0+c3BpLT5tYXN0ZXIpOwo+PiArCXN0cnVjdCBhc3BlZWRfc3Bp
X2NoaXAgKmNoaXAgPSAmYXNwaS0+Y2hpcHNbZGVzYy0+bWVtLT5zcGktPmNoaXBfc2VsZWN0XTsK
Pj4gKwlzdHJ1Y3Qgc3BpX21lbV9vcCAqb3AgPSAmZGVzYy0+aW5mby5vcF90bXBsOwo+PiArCXUz
MiBjdGxfdmFsOwo+PiArCWludCByZXQgPSAwOwo+PiArCj4+ICsJY2hpcC0+Y2xrX2ZyZXEgPSBk
ZXNjLT5tZW0tPnNwaS0+bWF4X3NwZWVkX2h6Owo+PiArCj4+ICsJLyogT25seSBmb3IgcmVhZHMg
Ki8KPj4gKwlpZiAob3AtPmRhdGEuZGlyICE9IFNQSV9NRU1fREFUQV9JTikKPj4gKwkJcmV0dXJu
IC1FT1BOT1RTVVBQOwo+PiArCj4+ICsJaWYgKGRlc2MtPmluZm8ubGVuZ3RoID4gY2hpcC0+YWhi
X3dpbmRvd19zaXplKQo+PiArCQlkZXZfd2Fybihhc3BpLT5kZXYsICJDRSVkIHdpbmRvdyAoJWRN
QikgdG9vIHNtYWxsIGZvciBtYXBwaW5nIiwKPj4gKwkJCSBjaGlwLT5jcywgY2hpcC0+YWhiX3dp
bmRvd19zaXplID4+IDIwKTsKPj4gKwo+PiArCS8qIERlZmluZSB0aGUgZGVmYXVsdCBJTyByZWFk
IHNldHRpbmdzICovCj4+ICsJY3RsX3ZhbCA9IHJlYWRsKGNoaXAtPmN0bCkgJiB+Q1RSTF9JT19D
TURfTUFTSzsKPj4gKwljdGxfdmFsIHw9IGFzcGVlZF9zcGlfZ2V0X2lvX21vZGUob3ApIHwKPj4g
KwkJb3AtPmNtZC5vcGNvZGUgPDwgQ1RSTF9DT01NQU5EX1NISUZUIHwKPj4gKwkJQ1RSTF9JT19E
VU1NWV9TRVQob3AtPmR1bW15Lm5ieXRlcyAvIG9wLT5kdW1teS5idXN3aWR0aCkgfAo+PiArCQlD
VFJMX0lPX01PREVfUkVBRDsKPj4gKwo+PiArCS8qIFR1bmUgNEJZVEUgYWRkcmVzcyBtb2RlICov
Cj4+ICsJaWYgKG9wLT5hZGRyLm5ieXRlcykgewo+PiArCQl1MzIgYWRkcl9tb2RlID0gcmVhZGwo
YXNwaS0+cmVncyArIENFX0NUUkxfUkVHKTsKPj4gKwo+PiArCQlpZiAob3AtPmFkZHIubmJ5dGVz
ID09IDQpCj4+ICsJCQlhZGRyX21vZGUgfD0gKDB4MTEgPDwgY2hpcC0+Y3MpOwo+PiArCQllbHNl
Cj4+ICsJCQlhZGRyX21vZGUgJj0gfigweDExIDw8IGNoaXAtPmNzKTsKPj4gKwkJd3JpdGVsKGFk
ZHJfbW9kZSwgYXNwaS0+cmVncyArIENFX0NUUkxfUkVHKTsKPj4gKwl9Cj4+ICsKPj4gKwkvKiBS
RUFEIG1vZGUgaXMgdGhlIGNvbnRyb2xsZXIgZGVmYXVsdCBzZXR0aW5nICovCj4+ICsJY2hpcC0+
Y3RsX3ZhbFtBU1BFRURfU1BJX1JFQURdID0gY3RsX3ZhbDsKPj4gKwl3cml0ZWwoY2hpcC0+Y3Rs
X3ZhbFtBU1BFRURfU1BJX1JFQURdLCBjaGlwLT5jdGwpOwo+PiArCj4+ICsJZGV2X2luZm8oYXNw
aS0+ZGV2LCAiQ0UlZCByZWFkIGJ1c3dpZHRoOiVkIFsweCUwOHhdXG4iLAo+PiArCQkgY2hpcC0+
Y3MsIG9wLT5kYXRhLmJ1c3dpZHRoLCBjaGlwLT5jdGxfdmFsW0FTUEVFRF9TUElfUkVBRF0pOwo+
PiArCj4+ICsJcmV0dXJuIHJldDsKPj4gK30KPj4gKwo+PiArc3RhdGljIGludCBhc3BlZWRfc3Bp
X2Rpcm1hcF9yZWFkKHN0cnVjdCBzcGlfbWVtX2Rpcm1hcF9kZXNjICpkZXNjLAo+PiArCQkJCSAg
dTY0IG9mZnNldCwgc2l6ZV90IGxlbiwgdm9pZCAqYnVmKQo+PiArewo+PiArCXN0cnVjdCBhc3Bl
ZWRfc3BpICphc3BpID0gc3BpX2NvbnRyb2xsZXJfZ2V0X2RldmRhdGEoZGVzYy0+bWVtLT5zcGkt
Pm1hc3Rlcik7Cj4+ICsJc3RydWN0IGFzcGVlZF9zcGlfY2hpcCAqY2hpcCA9ICZhc3BpLT5jaGlw
c1tkZXNjLT5tZW0tPnNwaS0+Y2hpcF9zZWxlY3RdOwo+PiArCj4+ICsJLyogU3dpdGNoIHRvIFVT
RVIgY29tbWFuZCBtb2RlIGlmIG1hcHBpbmcgd2luZG93IGlzIHRvbyBzbWFsbCAqLwo+PiArCWlm
IChjaGlwLT5haGJfd2luZG93X3NpemUgPCBvZmZzZXQgKyBsZW4pCj4+ICsJCWFzcGVlZF9zcGlf
cmVhZF91c2VyKGNoaXAsICZkZXNjLT5pbmZvLm9wX3RtcGwsIG9mZnNldCwgbGVuLCBidWYpOwo+
PiArCWVsc2UKPj4gKwkJbWVtY3B5X2Zyb21pbyhidWYsIGNoaXAtPmFoYl9iYXNlICsgb2Zmc2V0
LCBsZW4pOwo+PiArCj4+ICsJcmV0dXJuIGxlbjsKPj4gK30KPj4gKwo+PiAgIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3BpX2NvbnRyb2xsZXJfbWVtX29wcyBhc3BlZWRfc3BpX21lbV9vcHMgPSB7Cj4+
ICAgCS5zdXBwb3J0c19vcCA9IGFzcGVlZF9zcGlfc3VwcG9ydHNfb3AsCj4+ICAgCS5leGVjX29w
ID0gYXNwZWVkX3NwaV9leGVjX29wLAo+PiAgIAkuZ2V0X25hbWUgPSBhc3BlZWRfc3BpX2dldF9u
YW1lLAo+PiArCS5kaXJtYXBfY3JlYXRlID0gYXNwZWVkX3NwaV9kaXJtYXBfY3JlYXRlLAo+PiAr
CS5kaXJtYXBfcmVhZCA9IGFzcGVlZF9zcGlfZGlybWFwX3JlYWQsCj4+ICAgfTsKPj4gICAKPj4g
ICBzdGF0aWMgdm9pZCBhc3BlZWRfc3BpX2NoaXBfc2V0X3R5cGUoc3RydWN0IGFzcGVlZF9zcGlf
Y2hpcCAqY2hpcCwgaW50IHR5cGUpCj4+IC0tIAo+PiAyLjM0LjEKPj4KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
