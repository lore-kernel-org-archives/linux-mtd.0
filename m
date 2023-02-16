Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FFEC61DA4
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Feb 2023 18:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JLoCI9fdafaDOjTeDnLTTMmot7tyfp6BpQdLh7OI0PU=; b=BtdRIlo1gOL3bo
	+AKZZhrl35xewJQpneDcAvDDS3+EynbbrK4LAgL5tAoeLSnKbe915k2h80QW/Mga0/53NM+sKwgGj
	lFWAUFBe4qSDL4z3bdbXbvna/PpBqfsbBlrGzzx5evzlQK4oxBJZ2+j61HAyP7GrADZrO8y8Pq8/H
	EBn+gZvLoH6iAdUFELDxhh/cyu/w3jkW6kICfYMhbTfjBkBkbn+ops05lfcPsqlx4qGAPTmUPzW7Z
	A7lt8cT6Zp41I5z4BeXRfjsUCC/zbOYakziujMDmpKaJxs2m7b4PpVQWL9a8EtDHjgowfftsBnKnV
	hckAoCnznED5k0SE0p3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSihj-00BRUi-RA; Thu, 16 Feb 2023 18:09:59 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSihX-00BRQc-P5; Thu, 16 Feb 2023 18:09:50 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 84DB95FD10;
	Thu, 16 Feb 2023 21:09:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1676570975;
	bh=z5UG361hCIWFEkGyGnVDugO/SaElkWLy0fUsxj+i3NU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=d0wvCXoFrHsB9M1elFZFVOHrP2h1+bgtqOUAgW5xhTTkDMFkwtkayiziGyEuxNBaK
	 s0MqPpa9AtmOesCgcDHqjwmFjg8zxmEJwyk/murcRHsN9Ke0Vr8jS+apJvk7zdeHlD
	 y8iyxXG69iUJlvdGshhRaJqeHgxNfLmarC+I/RFFAaGQhVtbgw5HxwVAwBxIvkwpVe
	 1wNT8iFVZL9yQ2ZwK2peNGf4G7wINkszNA12o3jNXOWsuAybB+2Aj5rhXHEc8R447e
	 5ZvDHGeHwkNZwRD35WmyVFEQeIeBdZCkJZ84h6MAekpSqdQZ2azuCKBMsUgSSHuivR
	 KsJgIjDN1eDhQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 16 Feb 2023 21:09:34 +0300 (MSK)
Date: Thu, 16 Feb 2023 21:09:34 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: =?utf-8?B?0JrRgNCw0YHQvdC+0LIg0JDRgNGB0LXQvdC40Lk=?=
	<AVKrasnov@sberdevices.ru>
CC: Liang Yang <liang.yang@amlogic.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krasnov Arseniy
	<oxffffaa@gmail.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH] mtd: rawnand: meson: initialize struct with zeroes
Message-ID: <20230216180934.52xup4bvvmttzwpz@CAB-WSD-L081021>
References: <8881a365-e218-916a-e68d-d889797279be@sberdevices.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8881a365-e218-916a-e68d-d889797279be@sberdevices.ru>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/16 08:39:00 #20868660
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_100948_219080_34728A2C 
X-CRM114-Status: GOOD (  17.94  )
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

T24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgMDg6NTc6MzJQTSArMDMwMCwg0JrRgNCw0YHQvdC+0LIg
0JDRgNGB0LXQvdC40Lkgd3JvdGU6Cj4gVGhpcyBzdHJ1Y3R1cmUgbXVzdCBiZSB6ZXJvZWQsIGJl
Y2F1c2UgaXQncyBmaWVsZCAnaHctPmNvcmUnIGlzIHVzZWQgYXMKPiAncGFyZW50JyBpbiAnY2xr
X2NvcmVfZmlsbF9wYXJlbnRfaW5kZXgoKScsIGJ1dCBpdCB3aWxsIGJlIHVuaW5pdGlhbGl6ZWQu
Cj4gVGhlIGZvbGxvd2luZyBiYWNrdHJhY2UgaXMgcmVzdWx0IG9mIHRoZSBkZXJlZmVyZW5jZSBv
ZiBzdWNoIHBvaW50ZXI6Cj4gCj4gWyAgICAxLjA4MTMxOV0gIF9fY2xrX3JlZ2lzdGVyKzB4NDE0
LzB4ODIwCj4gWyAgICAxLjA4NTExM10gIGRldm1fY2xrX3JlZ2lzdGVyKzB4NjQvMHhkMAo+IFsg
ICAgMS4wODg5OTVdICBtZXNvbl9uZmNfcHJvYmUrMHgyNTgvMHg2ZWMKPiBbICAgIDEuMDkyODc1
XSAgcGxhdGZvcm1fcHJvYmUrMHg3MC8weGYwCj4gWyAgICAxLjA5NjQ5OF0gIHJlYWxseV9wcm9i
ZSsweGM4LzB4M2UwCj4gWyAgICAxLjEwMDAzNF0gIF9fZHJpdmVyX3Byb2JlX2RldmljZSsweDg0
LzB4MTkwCj4gWyAgICAxLjEwNDM0Nl0gIGRyaXZlcl9wcm9iZV9kZXZpY2UrMHg0NC8weDEyMAo+
IFsgICAgMS4xMDg0ODddICBfX2RyaXZlcl9hdHRhY2grMHhiNC8weDIyMAo+IFsgICAgMS4xMTIy
ODJdICBidXNfZm9yX2VhY2hfZGV2KzB4NzgvMHhkMAo+IFsgICAgMS4xMTYwNzddICBkcml2ZXJf
YXR0YWNoKzB4MmMvMHg0MAo+IFsgICAgMS4xMTk2MTNdICBidXNfYWRkX2RyaXZlcisweDE4NC8w
eDI0MAo+IFsgICAgMS4xMjM0MDhdICBkcml2ZXJfcmVnaXN0ZXIrMHg4MC8weDE0MAo+IFsgICAg
MS4xMjcyMDNdICBfX3BsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcisweDMwLzB4NDAKPiBbICAgIDEu
MTMxODYwXSAgbWVzb25fbmZjX2RyaXZlcl9pbml0KzB4MjQvMHgzMAoKSSBzdXBwb3NlIGl0IHdv
dWxkIGJlIGJldHRlciB0byBoYXZlICdmaXhlcycgdGFnIGhlcmUsIGxpa2U6CgpGaXhlczogMWU0
ZDNiYTY2ODg4ICgibXRkOiByYXduYW5kOiBtZXNvbjogZml4IHRoZSBjbG9jayIpCgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFyc2VuaXkgS3Jhc25vdiA8QVZLcmFzbm92QHNiZXJkZXZpY2VzLnJ1Pgo+
IC0tLQo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jh
dy9tZXNvbl9uYW5kLmMKPiBpbmRleCA1ZWUwMTIzMWFjNGMuLjMwZTMyNmFkYWJmYyAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPiBAQCAtOTkxLDcgKzk5MSw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMgbWVzb25fb29ibGF5b3V0X29wcyA9IHsKPiAg
Cj4gIHN0YXRpYyBpbnQgbWVzb25fbmZjX2Nsa19pbml0KHN0cnVjdCBtZXNvbl9uZmMgKm5mYykK
PiAgewo+IC0Jc3RydWN0IGNsa19wYXJlbnRfZGF0YSBuZmNfZGl2aWRlcl9wYXJlbnRfZGF0YVsx
XTsKPiArCXN0cnVjdCBjbGtfcGFyZW50X2RhdGEgbmZjX2RpdmlkZXJfcGFyZW50X2RhdGFbMV0g
PSB7MH07Cj4gIAlzdHJ1Y3QgY2xrX2luaXRfZGF0YSBpbml0ID0gezB9Owo+ICAJaW50IHJldDsK
Ci0tIApUaGFuayB5b3UsCkRtaXRyeQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
