Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2C3C7619A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Apr 2023 11:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvcBcyLADPMtmgtjhsEZ5Lf85LdWd53TvYhgZGaJgkg=; b=vSm7OXE9I2guOD
	WfghbBdxXabOK8Qy0yTt2l3uRBePc2C/92sIqlYqbaI6VGp1KI2mjsSXaPIUqnaO7d6+web1WlfWd
	DrJxSQxy7woEgLhYFR7vA0kV4UYB4wFbJuJzAmZZfYk11fSHrJHY/kqZH0ehldk+5tUqkXIityO8y
	giL3wjQTGz9Oh91D2Q+dlJZ4Aivl3rpwNfW9yktu2ysGUQoNKa2/lj/nAjHlV22PAvF3vG6AP0FvI
	SamIjX0P6lzCk4n58qYu5PvtWGwEQVmAXnDwXbR4pJRCnwn+DMuHQUfwsz/QAc5eU85zL7v9tQTzT
	8GSNt9Yk0Rd2naNblgNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYtE-002vSx-2N;
	Wed, 12 Apr 2023 11:43:52 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYt9-002vQk-2F;
	Wed, 12 Apr 2023 11:43:50 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 9D03B5FD61;
	Wed, 12 Apr 2023 14:43:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1681299813;
	bh=0thXj7LpCNhaF+hkJiRsRop/FhKHj2sfDcU1g5bpUNg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=W8mOdJkKfI1zcOXHvmMGmqWaefeCM7ua//z0q853eqxsDKZwR8Li6IpQXxJWNpuna
	 T5iVf8OSRxpzjKpLqpwjmRv86KEmXF5QD252zhc8bgxGn2fxZTx/lQa07u70bFppfY
	 2kVAItJnyriwe4Xx0mN4TOsQ78xVVBAUZfoOvqPKUM/kZ/JgeecRGkWMjoC45b4E0k
	 cCHwr1X6iD7OFgYnhX4W1umvpoL2Rr/fXUv/JdRu75GCr7a3ZLpvkeXgPNaJPhlfZE
	 yOGQApyGzQUTm+TUvM+I5wSMsHThD67AsjzZEE1xSQN0fu6Ro3mcIpXI205lespRu9
	 EHvW4mI4Aic3g==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 12 Apr 2023 14:43:32 +0300 (MSK)
Date: Wed, 12 Apr 2023 14:43:26 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Liang Yang <liang.yang@amlogic.com>
CC: Arseniy Krasnov <avkrasnov@sberdevices.ru>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Message-ID: <20230412114326.fn3nm5r3rzlnqgg7@CAB-WSD-L081021>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <4baac18b-c223-d346-503c-f5f9ae49320d@amlogic.com>
 <fe03919a-3468-b79e-5971-1f7671684ee9@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fe03919a-3468-b79e-5971-1f7671684ee9@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/04/12 04:12:00 #21090163
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_044348_446751_B4CAB980 
X-CRM114-Status: GOOD (  38.94  )
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

SGVsbG8gTGlhbmcsCgpPbiBXZWQsIEFwciAxMiwgMjAyMyBhdCAwNzozNjozMFBNICswODAwLCBM
aWFuZyBZYW5nIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDIwMjMvNC8xMiAxODo1MSwgTGlhbmcgWWFu
ZyB3cm90ZToKPiA+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcv
bWVzb25fbmFuZC5jCj4gPiA+ID4gPiA+ID4gYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9u
YW5kLmMKPiA+ID4gPiA+ID4gPiBpbmRleCBmODRhMTAyMzhlNGQuLmYyZjI0NzJjYjUxMSAxMDA2
NDQKPiA+ID4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMK
PiA+ID4gPiA+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiA+
ID4gPiA+ID4gPiBAQCAtODU4LDkgKzg1OCwxMiBAQCBzdGF0aWMgaW50Cj4gPiA+ID4gPiA+ID4g
bWVzb25fbmZjX3JlYWRfcGFnZV9zdWIoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPiA+ID4gPiA+
ID4gPiDCoCBzdGF0aWMgaW50IG1lc29uX25mY19yZWFkX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2No
aXAgKm5hbmQsIHU4ICpidWYsCj4gPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpbnQgb29iX3JlcXVpcmVkLCBpbnQgcGFnZSkKPiA+ID4gPiA+ID4g
PiDCoCB7Cj4gPiA+ID4gPiA+ID4gK8KgwqDCoCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRf
dG9fbXRkKG5hbmQpOwo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqAgdTggKm9vYl9idWYgPSBuYW5k
LT5vb2JfcG9pOwo+ID4gPiA+ID4gPiA+IMKgwqDCoMKgwqAgaW50IHJldDsKPiA+ID4gPiA+ID4g
PiArwqDCoMKgIG1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOwo+ID4gPiA+ID4gPiAK
PiA+ID4gPiA+ID4gSSdtIHN1cnByaXNlZCByYXcgcmVhZHMgZG8gbm90IHJlYWQgdGhlIGVudGly
ZSBPT0I/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFllcyEgU2VlbXMgaW4gY2FzZSBvZiByYXcgYWNj
ZXNzICh3aGF0IGkgc2VlIGluIHRoaXMgZHJpdmVyKQo+ID4gPiA+ID4gbnVtYmVyIG9mIE9PQiBi
eXRlcyByZWFkCj4gPiA+ID4gPiBzdGlsbCBkZXBlbmRzIG9uIEVDQyBwYXJhbWV0ZXJzOiBmb3Ig
ZWFjaCBwb3J0aW9uIG9mIGRhdGEKPiA+ID4gPiA+IGNvdmVyZWQgd2l0aCBFQ0MgY29kZSB3ZSBj
YW4KPiA+ID4gPiA+IHJlYWQgaXQncyBFQ0MgY29kZSBhbmQgInVzZXIgYnl0ZXMiIGZyb20gT09C
IC0gaXQgaXMgd2hhdCBpCj4gPiA+ID4gPiBzZWUgYnkgZHVtcGluZyBETUEgYnVmZmVyIGJ5Cj4g
PiA+ID4gPiBwcmludGsoKS4gRm9yIGV4YW1wbGUgSSdtIHdvcmtpbmcgd2l0aCAySyBOQU5EIHBh
Z2VzLCBlYWNoCj4gPiA+ID4gPiBwYWdlIGhhcyAyIHggMUsgRUNDIGJsb2Nrcy4KPiA+ID4gPiA+
IEZvciBlYWNoIEVDQyBibG9jayBJIGhhdmUgMTYgT09CIGJ5dGVzIHdoaWNoIEkgY2FuIGFjY2Vz
cyBieQo+ID4gPiA+ID4gcmVhZC93cml0ZS4gRWFjaCAxNiBieXRlcwo+ID4gPiA+ID4gY29udGFp
bnMgMiBieXRlcyBvZiB1c2VyJ3MgZGF0YSBhbmQgMTQgYnl0ZXMgRUNDIGNvZGVzLiBTbwo+ID4g
PiA+ID4gd2hlbiBJIHJlYWQgcGFnZSBpbiByYXcgbW9kZQo+ID4gPiA+ID4gY29udHJvbGxlciBy
ZXR1cm5zIDMyIGJ5dGVzICgyIHggKDIgKyAxNCkpIG9mIE9PQi4gV2hpbGUgT09CCj4gPiA+ID4g
PiBpcyByZXBvcnRlZCBhcyA2NCBieXRlcy4KPiA+ID4gPiAKPiA+ID4gPiBJbiBhbGwgbW9kZXMs
IHdoZW4geW91IHJlYWQgT09CLCB5b3Ugc2hvdWxkIGdldCB0aGUgZnVsbCBPT0IuIFRoZSBmYWN0
Cj4gPiA+ID4gdGhhdCBFQ0MgY29ycmVjdGlvbiBpcyBlbmFibGVkIG9yIGRpc2FibGVkIGRvZXMg
bm90IG1hdHRlci4gSWYgdGhlIE5BTkQKPiA+ID4gPiBmZWF0dXJlcyBPT0Igc2VjdGlvbnMgb2Yg
NjQgYnl0ZXMsIHlvdSBzaG91bGQgZ2V0IHRoZSA2NCBieXRlcy4KPiA+ID4gPiAKPiA+ID4gPiBX
aGF0IGhhcHBlbnMgc29tZXRpbWVzLCBpcyB0aGF0IHNvbWUgb2YgdGhlIGJ5dGVzIGFyZSBub3Qg
cHJvdGVjdGVkCj4gPiA+ID4gYWdhaW5zdCBiaXRmbGlwcywgYnV0IHRoZSBwb2xpY3kgaXMgdG8g
cmV0dXJuIHRoZSBmdWxsIGJ1ZmZlci4KPiA+ID4gCj4gPiA+IE9rLCBzbyB0byBjbGFyaWZ5IGNh
c2UgZm9yIHRoaXMgTkFORCBjb250cm9sbGVyOgo+ID4gPiAxKSBJbiBib3RoIEVDQyBhbmQgcmF3
IG1vZGVzIGkgbmVlZCB0byByZXR1cm4gdGhlIHNhbWUgcmF3IE9PQiBkYXRhCj4gPiA+IChlLmcu
IHVzZXIgYnl0ZXMKPiA+ID4gwqDCoMKgICsgRUNDIGNvZGVzKT8KPiA+ID4gMikgSWYgSSBoYXZl
IGFjY2VzcyB0byBvbmx5IDMyIGJ5dGVzIG9mIE9PQiAoaW4gY2FzZSBhYm92ZSksIEkgbXVzdAo+
ID4gPiByZXBvcnQgdGhhdCBzaXplCj4gPiA+IMKgwqDCoCBvZiBPT0IgaXMgb25seSAzMiBieXRl
cyBkdXJpbmcgaW5pdGlhbGl6YXRpb24/Cj4gPiA+IAo+ID4gPiBUaGFua3MsIEFyc2VuaXkKPiA+
IAo+ID4gWWVzLiBpdCBzaG91bGQgcmV0dXJuIGFsbCB0aGUgT09CIGRhdGEuIGkgbWFrZSBhIG1p
c3Rha2Ugb24gcmF3IHJlYWQgYW5kCj4gPiB0aGVyZSBpcyB3cm9uZyBjb2RlIGluIG1lc29uX25m
Y19yZWFkX3BhZ2VfcmF3KCkuCj4gPiAgwqDCoMKgwqBtZXNvbl9uZmNfZ2V0X2RhdGFfb29iKG5h
bmQsIGJ1Ziwgb29iX2J1Zik7Cj4gPiBjaGFuZ2VkIHRvOgo+ID4gIMKgwqDCoMKgaWYgKG9vYl9y
ZXF1aXJlZCkKPiA+ICDCoMKgwqDCoMKgwqDCoCBtZW1jcHkob29iX2J1ZiwgYnVmICsgbXRkLT53
cml0ZXNpemUsIG10ZC0+b29ic2l6ZSkKPiAKPiBTb3JyeSwgcGxlYXNlIGlnbm9yZSB0aGlzLiB0
aGUgcHJldmlvdXMgY29kZSBpcyByaWdodC4KPiAKPiB0aGUgY29udHJvbGxlciBjaGFuZ2VzIHRo
ZSBsYXlvdXQgb2Ygb25lIHBhZ2U7IHRoZSBwaHlzaWNhbCBsYXlvdXQgaXMgMjA0OAo+IG1haW4g
ZGF0YSArIDY0IG9vYiBkYXRhLiBhZnRlciB3cml0aW5nIGludG8gTkFORCBwYWdlLCBpdCBpcyBz
dG9yZWQKPiBsaWtlIHRoaXM6IDEwMjQgbWFpbiBkYXRhICsgMiB1c2VyIGJ5dGVzICsgMTQgRUND
IHBhcml0eSBieXRlcyArIDEwMjQgbWFpbgo+IGRhdGEgKyAyIHVzZXIgYnl0ZXMgKyAxNCBFQ0Mg
cGFyaXR5IGJ5dGVzLiBzbyB0aGF0IGlzIHJpZ2h0IHdlIG9ubHkgZ2V0IDQKPiB1c2VyIGJ5dGVz
IGFuZCAyOCBFQ0MgcGFyaXR5IGJ5dGVzLCB0b3RhbCAzMiBieXRlcy4gdGhhdCBpcyB0aGUgYmVo
YXZpb3Igb2YKPiB0aGUgY29udHJvbGxlciB0aGF0IHRyYW5zZmVycmluZyBvbmUgRUNDIHBhZ2Uo
MUtCKSBicmluZ3MgYmFjayBvbmx5IDIgdXNlcgo+IGJ5dGVzLgo+IAo+IGJlY2F1c2UgbGF5b3V0
IGlzIGNoYW5nZWQgYnkgY29udHJvbGxlciwgc28gZ28gYmFjayB0byB0aGUgZnVuY3Rpb24uCj4g
bWVzb25fbmZjX2dldF9kYXRhX29vYihuYW5kLCBidWYsIG9vYl9idWYpIHRyeSB0byBnZXQgdGhl
IHJpZ2h0IHVzZXIgYW5kIGVjYwo+IHBhcml0eSBieXRlcyBmcm9tIHRoZSByaWdodCBwb3MuIGFm
dGVyIHRoYXQsIHRoZSBvdGhlciBvb2IgYnl0ZXMgaXMgbm90Cj4gcmVhZGluZyBmcm9tIE5BTkQg
Zmxhc2guCgpJIGhhdmUgYWx3YXlzIGJlZW4gdW5kZXIgdGhlIGltcHJlc3Npb24gdGhhdCBOQU5E
IE9PQiBsYXlvdXQgZmFsbHMgdW5kZXIgdGhlCnJlc3BvbnNpYmlsaXR5IG9mIHRoZSBmbGFzaCBk
cml2ZXIuIElzIHRoaXMgc3BlY2lmaWMgdG8gdGhlIEFtbG9naWMgTkFORCwKYW5kIGRvZXMgaXQg
bWFwIHRoZSBmbGFzaCBsYXlvdXQgdG8gdGhlIGludGVybmFsIGNvbnRyb2xsZXIgbGF5b3V0PwpG
b3IgZXhhbXBsZSwgZGlmZmVyZW50IE9PQiBsYXlvdXRzIGV4aXN0IGJldHdlZW4gTWFjcm9uaXgg
YW5kIEVTTVQuCgpBcG9sb2dpZXMgZm9yIGFueSBjb25mdXNpb24sIGFuZCB0aGFuayB5b3UgaW4g
YWR2YW5jZSBmb3IgYW55IGhlbHAgaW4KY2xhcmlmeWluZyB0aGlzIG1hdHRlci4KCi0tIApUaGFu
ayB5b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
