Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C8DC7618A
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Mar 2023 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79B8XuBU56z9qWs8d7KyiD6QJxZxjUGS9XLNsrNMx24=; b=btCj8KVhnFFLQY
	3OAztXZjatZUUrc25fiVih1AT1za7oP39k/Kb9cSuotE4JhuP+VpCpqn7xJEnEKym2kWOWYZ5x51/
	Hgp5oQkUwnIQF6D36EEPLro24cN6kcWQDwnBlR7ke1YXCO8Eflf6StYnIPdf9J6fqwSr80knLHxYI
	of3U+IhxKAe04IWtbytLZos6nY13+ke+4+5JY9rlmfQcSjU5kUColvKNyYQRwsG/sSst6seVE874O
	dEKWpg7YQ3ovb5RH2hEvmrDab+1dBYqAPXdNIu4U98805xx9l9lZBjRiCurvxc9bpM7+i1bdPhftn
	y71/eOf3hXOpcC9hHTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCzH-008gql-3A;
	Mon, 20 Mar 2023 10:43:35 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCzC-008gox-08;
	Mon, 20 Mar 2023 10:43:32 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 5543C5FD0F;
	Mon, 20 Mar 2023 13:43:16 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1679308996;
	bh=iyUXeu3+jkqtK4aQs+x6vXU9UqkcLHAPrhpZ7EOKuCQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=eV7CpVjqOf2rynWDJ0YHKRjUdBwvUla8SDE2+t0+b0Nb6HZrnn66w7hv8oOa1+Ced
	 j6snk9n5lHC0dC2+MCOg7P350vllYHTamMfgeQybKlI1jmXJOXFsKfsebii5dYlZLW
	 pUZ50EleSJyANUJDSvRzlWRqlsrnqcpCMynPdoU7wZWd4fo+TRIirsyrcibsZ9vILh
	 fpFvwNNWL630XPKjwFBg4M6+KNDdWi12/nNpG61n397oLDauw/bB5WuVEPkRRh//hx
	 qOWFRlV7GNoB8cQS3mzfQVweLzSxa2BWdzDG9Av+1SQp/YOCpwcdp/mowh+xpQKryd
	 ensde3VAvEWzA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 20 Mar 2023 13:43:15 +0300 (MSK)
Date: Mon, 20 Mar 2023 13:43:14 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Arseniy Krasnov
	<avkrasnov@sberdevices.ru>, Liang Yang <liang.yang@amlogic.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Kevin
 Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
	<jianxin.pan@amlogic.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [RFC PATCH v1] mtd: rawnand: meson: invalidate cache on polling
 ECC bit
Message-ID: <20230320104314.i2stk665xbrleb53@CAB-WSD-L081021>
References: <d4ef0bd6-816e-f6fa-9385-f05f775f0ae2@sberdevices.ru>
 <20f7f1f8-e8f8-b3e1-251e-27db71ab6840@sberdevices.ru>
 <20230313121808.27170d1b@xps-13>
 <dc46c06f-6b36-3c1c-bf96-2ef37e29dfdb@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dc46c06f-6b36-3c1c-bf96-2ef37e29dfdb@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/20 04:57:00 #20976224
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_034330_437448_F9F79024 
X-CRM114-Status: GOOD (  31.12  )
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

SGVsbG8gZ3V5cyEKCldhcyBpdCBhcHBsaWVkIHRvIHNvbWUgbmFuZCAncHJlcGFyZS1mb3ItbWVy
Z2UnIHJlbGVhc2UgYnJhbmNoPwoKT24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgMTI6MjM6MTJQTSAr
MDEwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4gT24gMTMvMDMvMjAyMyAxMjoxOCwgTWlxdWVs
IFJheW5hbCB3cm90ZToKPiA+IEhpIEFyc2VuaXksCj4gPiAKPiA+IGF2a3Jhc25vdkBzYmVyZGV2
aWNlcy5ydSB3cm90ZSBvbiBNb24sIDEzIE1hciAyMDIzIDEwOjM2OjExICswMzAwOgo+ID4gCj4g
PiA+IEhlbGxvLAo+ID4gPiAKPiA+ID4gd2UgcmVwcm9kdWNlZCB0aGlzIHByb2JsZW0gb24gb25l
IG9mIG91ciBib2FyZHMuIEl0IHRyaWdnZXJzIHZlcnkgcmFyZQo+ID4gPiB3aGVuICd1c2xlZXBf
cmFuZ2UoKScgaXMgcHJlc2VudCwgYnV0IHdoZW4gc2xlZXBpbmcgaXMgcmVtb3ZlZCAtIGl0IGZp
cmVzCj4gPiA+IGFsd2F5cy4gSSBzdXBwb3NlIHByb2JsZW0gaXMgd2l0aCBjYWNoaW5nLCBhcyAn
aW5mb19idWYnIG1lbW9yeSBpcyBtYXBwZWQgYnkKPiA+ID4gJ2RtYV9tYXBfc2luZ2xlKCknLgo+
ID4gCj4gPiBUaGUgZml4IGxvb2tzIHJlYWxseSBsZWdpdGltYXRlLCBpbmRlZWQgSSBnZXQgdGhh
dCB0aGUgdXNsZWVwX3JhbmdlKCkKPiA+IG1pZ2h0IG1ha2UgaXQgd29yayBtb3N0IG9mIHRoZSB0
aW1lIGJ1dCBub3QgYWx3YXlzLiBIYXZpbmcgdGhpcyBiaXQgaW4KPiA+IGEgRE1BIGJ1ZiBhcmVh
IGlzIGEgYml0IHN0cmFuZ2UuIFdlbGwsIHRoZSBmaXggTEdUTSBhbnl3YXkuCj4gCj4gWWVwIGl0
IGxvb2tzIGxlZ2l0aW1hdGUhCj4gCj4gTEdUTQo+IAo+IAo+IFJldmlld2VkLWJ5OiBOZWlsIEFy
bXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KPiAKPiA+IAo+ID4gPiAKPiA+ID4g
VGhhbmtzLCBBcnNlbml5Cj4gPiA+IAo+ID4gPiBPbiAxMy4wMy4yMDIzIDEwOjMyLCBBcnNlbml5
IEtyYXNub3Ygd3JvdGU6Cj4gPiA+ID4gJ2luZm9fYnVmJyBtZW1vcnkgaXMgY2FjaGVkIGFuZCBk
cml2ZXIgcG9sbHMgRUNDIGJpdCBpbiBpdC4gVGhpcyBiaXQKPiA+ID4gPiBpcyBzZXQgYnkgdGhl
IE5BTkQgY29udHJvbGxlci4gSWYgJ3VzbGVlcF9yYW5nZSgpJyByZXR1cm5zIGJlZm9yZSBkZXZp
Y2UKPiA+ID4gPiBzZXRzIHRoaXMgYml0LCAnaW5mb19idWYnIHdpbGwgYmUgY2FjaGVkIGFuZCBk
cml2ZXIgd29uJ3Qgc2VlIHVwZGF0ZSBvZgo+ID4gPiA+IHRoaXMgYml0IGFuZCB3aWxsIGxvb3Ag
Zm9yZXZlci4KPiA+ID4gPiAKPiA+ID4gPiBGaXhlczogOGZhZTg1NmM1MzUwICgibXRkOiByYXdu
YW5kOiBtZXNvbjogYWRkIHN1cHBvcnQgZm9yIEFtbG9naWMgTkFORCBmbGFzaCBjb250cm9sbGVy
IikKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVy
ZGV2aWNlcy5ydT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21l
c29uX25hbmQuYyB8IDggKysrKysrKy0KPiA+ID4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVz
b25fbmFuZC5jCj4gPiA+ID4gaW5kZXggNWVlMDEyMzFhYzRjLi4yYzA1YzA4YTBlYWYgMTAwNjQ0
Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPiA+ID4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4gPiA+ID4gQEAgLTE3Niw2
ICsxNzYsNyBAQCBzdHJ1Y3QgbWVzb25fbmZjIHsKPiA+ID4gPiAgIAlkbWFfYWRkcl90IGRhZGRy
Owo+ID4gPiA+ICAgCWRtYV9hZGRyX3QgaWFkZHI7Cj4gPiA+ID4gKwl1MzIgaW5mb19ieXRlczsK
PiA+ID4gPiAgIAl1bnNpZ25lZCBsb25nIGFzc2lnbmVkX2NzOwo+ID4gPiA+ICAgfTsKPiA+ID4g
PiBAQCAtNTAzLDYgKzUwNCw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX2RtYV9idWZmZXJfc2V0
dXAoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwgdm9pZCAqZGF0YWJ1ZiwKPiA+ID4gPiAgIAkJCQkJ
IG5mYy0+ZGFkZHIsIGRhdGFsZW4sIGRpcik7Cj4gPiA+ID4gICAJCQlyZXR1cm4gcmV0Owo+ID4g
PiA+ICAgCQl9Cj4gPiA+ID4gKwkJbmZjLT5pbmZvX2J5dGVzID0gaW5mb2xlbjsKPiA+ID4gPiAg
IAkJY21kID0gR0VOQ01ESUFERFJMKE5GQ19DTURfQUlMLCBuZmMtPmlhZGRyKTsKPiA+ID4gPiAg
IAkJd3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPiA+ID4gPiBAQCAt
NTIwLDggKzUyMiwxMCBAQCBzdGF0aWMgdm9pZCBtZXNvbl9uZmNfZG1hX2J1ZmZlcl9yZWxlYXNl
KHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4gPiA+ID4gICAJc3RydWN0IG1lc29uX25mYyAqbmZj
ID0gbmFuZF9nZXRfY29udHJvbGxlcl9kYXRhKG5hbmQpOwo+ID4gPiA+ICAgCWRtYV91bm1hcF9z
aW5nbGUobmZjLT5kZXYsIG5mYy0+ZGFkZHIsIGRhdGFsZW4sIGRpcik7Cj4gPiA+ID4gLQlpZiAo
aW5mb2xlbikKPiA+ID4gPiArCWlmIChpbmZvbGVuKSB7Cj4gPiA+ID4gICAJCWRtYV91bm1hcF9z
aW5nbGUobmZjLT5kZXYsIG5mYy0+aWFkZHIsIGluZm9sZW4sIGRpcik7Cj4gPiA+ID4gKwkJbmZj
LT5pbmZvX2J5dGVzID0gMDsKPiA+ID4gPiArCX0KPiA+ID4gPiAgIH0KPiA+ID4gPiAgIHN0YXRp
YyBpbnQgbWVzb25fbmZjX3JlYWRfYnVmKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsIHU4ICpidWYs
IGludCBsZW4pCj4gPiA+ID4gQEAgLTcxMCw2ICs3MTQsOCBAQCBzdGF0aWMgdm9pZCBtZXNvbl9u
ZmNfY2hlY2tfZWNjX3BhZ2VzX3ZhbGlkKHN0cnVjdCBtZXNvbl9uZmMgKm5mYywKPiA+ID4gPiAg
IAkJdXNsZWVwX3JhbmdlKDEwLCAxNSk7Cj4gPiA+ID4gICAJCS8qIGluZm8gaXMgdXBkYXRlZCBi
eSBuZmMgZG1hIGVuZ2luZSovCj4gPiA+ID4gICAJCXNtcF9ybWIoKTsKPiA+ID4gPiArCQlkbWFf
c3luY19zaW5nbGVfZm9yX2NwdShuZmMtPmRldiwgbmZjLT5pYWRkciwgbmZjLT5pbmZvX2J5dGVz
LAo+ID4gPiA+ICsJCQkJCURNQV9GUk9NX0RFVklDRSk7Cj4gPiA+ID4gICAJCXJldCA9ICppbmZv
ICYgRUNDX0NPTVBMRVRFOwo+ID4gPiA+ICAgCX0gd2hpbGUgKCFyZXQpOwo+ID4gPiA+ICAgfQo+
ID4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IE1pcXXDqGwKPiAKCi0tIApUaGFuayB5b3UsCkRtaXRy
eQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
