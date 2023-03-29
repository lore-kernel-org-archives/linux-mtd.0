Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8737C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FehRyUz+qhn28EH1jKMfgRpvh7AhnlvwIXPfy9+UB4A=; b=obtphq3mHn3/51
	GXWmxD+x+56Pxth/XLKvRmlKU+l6R5zVqIwXILqSGFzMc5FOTno4yM6vGiQOux/+4iURmr7EdmgPV
	dxis2aZQ3dA01PzhgKWNmcGo+jLgqi3XlHjLUYGfhwIrB9pg0vgNGFfZHofQi1KSVutY9o8IJStJs
	FqQa3eq52tvqM6Ry1yQGLCKaxWVYAstZqfhFaNzWgsKb3p9UdvALC00EwYmsbUKpHFaWfGLNkMgNB
	Sx6WTofV2vFzxLypGgdbLiyzkkEjhseVv3T15w3BL3tO0gdi3Bmc1Q8P4XuO62hPYrPlpW0HMPkAU
	zs8fVfLpI7YJ3XI5qVfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQ24-00Gswg-0I;
	Wed, 29 Mar 2023 07:15:44 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQ1y-00GsvG-02;
	Wed, 29 Mar 2023 07:15:40 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id A14135FD02;
	Wed, 29 Mar 2023 10:15:33 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680074133;
	bh=I4syhipQ1flDROQ9dHS52fz4/zkKeopJfk070Erq43s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=RBtZkhTzrqFTtWiMWULOGb5i6y7++DBWeypjF9eLxZ4GclqAuzx4W2eM7CkgN3i2r
	 BtlbIkqL6xNplqyg1XeG52LopVjqai5cO6c8OkJRGGvjsYbLoX0C0274EuSU+qhfdt
	 EdMLdD3Y/meL8UcbfVn2K7iDHqA+wRByEYhF+jg1HGNXm5BZGxgrrLI2fGAwHpnRSC
	 +XgYKOkJnC+PufimVs3zgKLhl+HFrIMQ1dZvCh/j90Kn9M07bhFa3a+nfVKoqdgYgF
	 GECddvrdcZuzhp2wMLbTqaYhfbImx9qJv+rBcsqm20Ncvh8ObRfrGAOAi1AppeRF5L
	 bse3TpAhNJwmw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 29 Mar 2023 10:15:32 +0300 (MSK)
Message-ID: <2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
Date: Wed, 29 Mar 2023 10:12:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Liang Yang
	<liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@sberdevices.ru>, <oxffffaa@gmail.com>
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
 <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
 <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
 <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
 <20230328185001.5661132b@xps-13>
 <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
 <CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/29 04:10:00 #21025776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_001539_237648_B3BF8773 
X-CRM114-Status: GOOD (  21.50  )
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

CgpPbiAyOC4wMy4yMDIzIDIzOjI1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IEhpIEFy
c2VuaXksCj4gCj4gT24gVHVlLCBNYXIgMjgsIDIwMjMgYXQgODozOeKAr1BNIEFyc2VuaXkgS3Jh
c25vdgo+IDxhdmtyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOgo+IFsuLi5dCj4+Pgo+Pj4g
QnkgdGhlIHdheSBhbnkgcmVhc29uIG5vdCB0byBoYXZlIENjJ2VkIHN0YWJsZT8KPj4KPj4gU29y
cnksIHdoYXQgZG8gWW91IG1lYW4/IEkndmUgaW5jbHVkZWQgbGludXgtbXRkIG1haWxpbmcgbGlz
dHMsIHRoZXJlIGlzCj4+IG9uZSBtb3JlIGxpc3QgZm9yIG10ZCByZXZpZXdzPyBJIHdpbGwgYXBw
cmVjaWF0ZSBpZiBZb3UgY2FuIHBvaW50IG1lCj4gInN0YWJsZSIgdHlwaWNhbGx5IHJlZmVycyB0
byB0aGUgc3RhYmxlIHRyZWUgd2hlcmUgZml4ZXMgZm9yIGFscmVhZHkKPiByZWxlYXNlZCBrZXJu
ZWwgdmVyc2lvbnMgYXJlIG1haW50YWluZWQuCj4gV2hlbiBNaXF1ZWwgYXBwbGllcyB0aGUgcGF0
Y2ggaXQgd2lsbCBlaXRoZXIgbGFuZCBpbiB0aGUgbmV4dCAtcmMgb2YKPiB0aGUgY3VycmVudCBk
ZXZlbG9wbWVudCBjeWNsZSAodHlwaWNhbGx5IGFwcGxpZXMgdG8gZml4ZXMgLSBjdXJyZW50bHkK
PiA2LjMtcmM1KSBvciAtcmMxIG9mIHRoZSBuZXh0IGtlcm5lbCB2ZXJzaW9uICh0eXBpY2FsbHkg
YXBwbGllcyB0byBuZXcKPiBmZWF0dXJlcywgY2xlYW51cHMsIGV0Yy4gLSBjdXJyZW50bHkgNi40
LXJjMSkuCj4gCj4gTGV0J3Mgc2F5IHlvdSBhcmUgZml4aW5nIGEgYnVnIG5vdyBidXQgd2FudCB0
aGUgZml4IHRvIGJlIGluY2x1ZGVkIGluCj4gNi4xIExUUyAobG9uZyB0ZXJtIHN0YWJsZSkgb3Ig
b3RoZXIgc3RhYmxlIHJlbGVhc2UuCj4gSW4gdGhpcyBjYXNlIGl0J3MgcmVjb21tZW5kZWQgdG8g
Q2MgdGhlIG1haW50YWluZXJzIG9mIHRoZSBzdGFibGUKPiB0cmVlcyBhcyBwYXJ0IG9mIHlvdXIg
cGF0Y2gsIHNlZSBbMF0uCj4gVGhhdCB3YXkgb25jZSB0aGUgY29tbWl0IHdpdGggeW91ciBmaXgg
aGl0cyBMaW51cyBUb3J2YWxkcyBsaW51eCB0cmVlCj4gaXQgd2lsbCBiZSBiYWNrcG9ydGVkIGJ5
IHRoZSBzdGFibGUgdGVhbSB3aXRoaW4gYSBmZXcgZGF5cyAoYXNzdW1pbmcKPiBvZiBjb3Vyc2Ug
dGhhdCB0aGUgcGF0Y2ggYXBwbGllcyBjbGVhbmx5IHRvIG9sZGVyIHZlcnNpb25zLCBpZiBub3QK
PiB0aGV5J3JlIG5vdGlmeWluZyB5b3UpLgo+IE5vdGU6IGV2ZW4gd2l0aG91dCBDYydpbmcgdGhl
IHN0YWJsZSBtYWludGFpbmVycyB5b3VyIGNvbW1pdCBtYXkgYmUKPiBiYWNrcG9ydGVkIChzZW1p
LWF1dG9tYXRpY2FsbHkpIGlmIGl0IGhhcyBhIEZpeGVzIHRhZyBhbmQgdGhlIHN0YWJsZQo+IG1h
aW50YWluZXJzIGZpbmQgeW91ciBjb21taXQuIEJ1dCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQg
aXQncwo+IGVhc2llc3QgZm9yIHRoZW0gaWYgdGhleSdyZSBleHBsaWNpdGx5IENjJ2VkIG9uIHRo
ZSBwYXRjaC4KPiAKPiBJIGhvcGUgdGhpcyBtYWtlcyBzZW5zZS4gSWYgbm90OiBkb24ndCBoZXNp
dGF0ZSB0byBhc2suCgpIZWxsbyEgVGhhbmtzIGZvciB0aGlzIGRldGFpbGVkIGV4cGxhbmF0aW9u
LCB0aGF0IHJlYWxseSBoZWxwcyEKClRoYW5rcywgQXJzZW5peQoKPiAKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gTWFydGluCj4gCj4gCj4gWzBdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwv
djQuMTUvcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwjb3B0aW9uLTEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
