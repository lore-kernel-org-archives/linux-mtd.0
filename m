Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDF3C74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XSMTdFoYeZmCiEvYfn1eCAdMqslzkzXoRuXp3H2kZ0=; b=yOnOiWbrhc3EkE
	JcEblI29iD6/KWA7yruWfWJRlKFOj/Vvl/kIF7IdpuJcctPi1jZckWxqKNtAZh5mODsTFeLPD137g
	FAqlLSDLRlaMrGCp9NkAoywZJb+HkZxdfMxH/iWeeKK2eWR1ezAQ940h1oLxij84b5zmLdCvTw1p7
	fRFxyYui46ea6S0Rofu+oHCgUd1Z0g/2IksHcsoOIa+Rsn3UOv/ZfNqtJglXT6NaIPwCfLl54WNqc
	3jas0jyv1Y5+6pkssy4u1KFbFuvlRSM+RHm6v3TazQkHGiH8E/runqdTAap3F3U3nr09GCp0H6ojf
	DDQrqTRWhYtt0KGmWSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQah-00Gy0M-2Z;
	Wed, 29 Mar 2023 07:51:31 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQac-00Gxy0-1e;
	Wed, 29 Mar 2023 07:51:28 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 63C595FD03;
	Wed, 29 Mar 2023 10:51:24 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680076284;
	bh=1EpXE2p+9++IAW20D9jacIOjh/MMVTBYGoinNNmPdMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=p3VmP8k++tSVzWe5WgQKers/1sKQ4QnPfP7pRqlQuxRWjEhPWCMBMT2CXMHOTBZR7
	 5gWRX6V2U5oNP79v7MAh6LPXaVA5GIfaYlFCaxakibVMZAhIrLx/EmaVhN7sMgoKVv
	 5/0wjruX9BxjLGEXtwoSdoCOfknMqL8VITrrX6/h0efZnC4RXEw6dCWUPo2HV40Zk0
	 uxeiLEaVGvbBrOuJVzPRWfwOJYiHLflZYdP57NxCabLTvHRjzPXw+qEO89RsWrr7Rz
	 q1d7aHVY4mE8640barURUOH3B8uCFdTv81zjycXYpknqyAYFyO/upvR/a1USBB62OI
	 w8bEdI5w51Htw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 29 Mar 2023 10:51:24 +0300 (MSK)
Message-ID: <221e0556-761b-f1b1-abc0-ea3d2e6b884f@sberdevices.ru>
Date: Wed, 29 Mar 2023 10:48:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in command
 word
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
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
 <2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
 <20230329093145.52790647@xps-13>
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230329093145.52790647@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/29 04:10:00 #21025776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_005126_892090_12964C21 
X-CRM114-Status: GOOD (  17.65  )
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

CgpPbiAyOS4wMy4yMDIzIDEwOjMxLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhlbGxvLAo+IAo+
IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3cm90ZSBvbiBXZWQsIDI5IE1hciAyMDIzIDEwOjEy
OjEwICswMzAwOgo+IAo+PiBPbiAyOC4wMy4yMDIzIDIzOjI1LCBNYXJ0aW4gQmx1bWVuc3Rpbmds
IHdyb3RlOgo+Pj4gSGkgQXJzZW5peSwKPj4+Cj4+PiBPbiBUdWUsIE1hciAyOCwgMjAyMyBhdCA4
OjM54oCvUE0gQXJzZW5peSBLcmFzbm92Cj4+PiA8YXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1PiB3
cm90ZToKPj4+IFsuLi5dICAKPj4+Pj4KPj4+Pj4gQnkgdGhlIHdheSBhbnkgcmVhc29uIG5vdCB0
byBoYXZlIENjJ2VkIHN0YWJsZT8gIAo+Pj4+Cj4+Pj4gU29ycnksIHdoYXQgZG8gWW91IG1lYW4/
IEkndmUgaW5jbHVkZWQgbGludXgtbXRkIG1haWxpbmcgbGlzdHMsIHRoZXJlIGlzCj4+Pj4gb25l
IG1vcmUgbGlzdCBmb3IgbXRkIHJldmlld3M/IEkgd2lsbCBhcHByZWNpYXRlIGlmIFlvdSBjYW4g
cG9pbnQgbWUgIAo+Pj4gInN0YWJsZSIgdHlwaWNhbGx5IHJlZmVycyB0byB0aGUgc3RhYmxlIHRy
ZWUgd2hlcmUgZml4ZXMgZm9yIGFscmVhZHkKPj4+IHJlbGVhc2VkIGtlcm5lbCB2ZXJzaW9ucyBh
cmUgbWFpbnRhaW5lZC4KPj4+IFdoZW4gTWlxdWVsIGFwcGxpZXMgdGhlIHBhdGNoIGl0IHdpbGwg
ZWl0aGVyIGxhbmQgaW4gdGhlIG5leHQgLXJjIG9mCj4+PiB0aGUgY3VycmVudCBkZXZlbG9wbWVu
dCBjeWNsZSAodHlwaWNhbGx5IGFwcGxpZXMgdG8gZml4ZXMgLSBjdXJyZW50bHkKPj4+IDYuMy1y
YzUpIG9yIC1yYzEgb2YgdGhlIG5leHQga2VybmVsIHZlcnNpb24gKHR5cGljYWxseSBhcHBsaWVz
IHRvIG5ldwo+Pj4gZmVhdHVyZXMsIGNsZWFudXBzLCBldGMuIC0gY3VycmVudGx5IDYuNC1yYzEp
Lgo+Pj4KPj4+IExldCdzIHNheSB5b3UgYXJlIGZpeGluZyBhIGJ1ZyBub3cgYnV0IHdhbnQgdGhl
IGZpeCB0byBiZSBpbmNsdWRlZCBpbgo+Pj4gNi4xIExUUyAobG9uZyB0ZXJtIHN0YWJsZSkgb3Ig
b3RoZXIgc3RhYmxlIHJlbGVhc2UuCj4+PiBJbiB0aGlzIGNhc2UgaXQncyByZWNvbW1lbmRlZCB0
byBDYyB0aGUgbWFpbnRhaW5lcnMgb2YgdGhlIHN0YWJsZQo+Pj4gdHJlZXMgYXMgcGFydCBvZiB5
b3VyIHBhdGNoLCBzZWUgWzBdLgo+Pj4gVGhhdCB3YXkgb25jZSB0aGUgY29tbWl0IHdpdGggeW91
ciBmaXggaGl0cyBMaW51cyBUb3J2YWxkcyBsaW51eCB0cmVlCj4+PiBpdCB3aWxsIGJlIGJhY2tw
b3J0ZWQgYnkgdGhlIHN0YWJsZSB0ZWFtIHdpdGhpbiBhIGZldyBkYXlzIChhc3N1bWluZwo+Pj4g
b2YgY291cnNlIHRoYXQgdGhlIHBhdGNoIGFwcGxpZXMgY2xlYW5seSB0byBvbGRlciB2ZXJzaW9u
cywgaWYgbm90Cj4+PiB0aGV5J3JlIG5vdGlmeWluZyB5b3UpLgo+Pj4gTm90ZTogZXZlbiB3aXRo
b3V0IENjJ2luZyB0aGUgc3RhYmxlIG1haW50YWluZXJzIHlvdXIgY29tbWl0IG1heSBiZQo+Pj4g
YmFja3BvcnRlZCAoc2VtaS1hdXRvbWF0aWNhbGx5KSBpZiBpdCBoYXMgYSBGaXhlcyB0YWcgYW5k
IHRoZSBzdGFibGUKPj4+IG1haW50YWluZXJzIGZpbmQgeW91ciBjb21taXQuIEJ1dCBteSB1bmRl
cnN0YW5kaW5nIGlzIHRoYXQgaXQncwo+Pj4gZWFzaWVzdCBmb3IgdGhlbSBpZiB0aGV5J3JlIGV4
cGxpY2l0bHkgQ2MnZWQgb24gdGhlIHBhdGNoLgo+Pj4KPj4+IEkgaG9wZSB0aGlzIG1ha2VzIHNl
bnNlLiBJZiBub3Q6IGRvbid0IGhlc2l0YXRlIHRvIGFzay4gIAo+IAo+IFRoYXQgaXMgYW4gZXhj
ZWxsZW50IHN1bW1hcnksIEkgc2hvdWxkIGNvcHkvcGFzdGUgaXQgc29tZXRpbWVzIDopCj4gCj4+
Cj4+IEhlbGxvISBUaGFua3MgZm9yIHRoaXMgZGV0YWlsZWQgZXhwbGFuYXRpb24sIHRoYXQgcmVh
bGx5IGhlbHBzIQo+IAo+IFNvIElPVywgSSBhbSBhc2tpbmcgeW91IHRvIHNlbmQgYSB2MiB3aXRo
IGFuIGFkZGl0aW9uYWwgbGluZSBpbiB0aGUKPiBjb21taXQsIHJpZ2h0IG5leHQgIkZpeGVzIjoK
PiAKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwoKRG9uZSEKClRoYW5rcywgQXJzZW5peQoK
PiAKPiBUaGFua3MsCj4gTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
