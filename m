Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A2CC74A5B
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obcsn59TYbPb8aRDVW22r5oEXrQsekF7dHJidsp96qw=; b=E/w8uy2a1rp65m
	C+Hj2gRtyZNcCT+pDxxHSvOzRXSAzCdp8BGRktKtBxteE9SUmOp23Rd3GWFKpGmw6dgwDbN9bykiK
	M9GFaxYJ0j/F6IcDJk5RdhMZz9fqwSLo6oLIGCGP2PvNnlLeZP/RWT8TVj8OV4NWgjgHOtnQrs3V6
	jTPLDIKSJ8xPVvrqrH2mTZYbMIclQJtCct4lWXXRELWuBLcoRkX1TpjlK9HjWzm5LLqJcGeRsSMFR
	kc/d4Ayjt/j1mAE+A8TbUIODozKvpCOqL1vniE9tBA68ykBrFWEUt+ICwm5UleK1VGYn23ONbkwf3
	qtyoX68v6Ve9Zm2bQqig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSWw-00HNx5-0G;
	Wed, 29 Mar 2023 09:55:46 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSWr-00HNu8-0L;
	Wed, 29 Mar 2023 09:55:43 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 4057F5FD18;
	Wed, 29 Mar 2023 12:55:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680083731;
	bh=Xu3w+5oD+GiV9rELaqeOQYTNoX/ncfYGivas4K/Z+CY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=dwxOga/UDbxGtFpeNNCOLtYUISG5pZeXKljMzUszi/PHkgdCGVKzLroMmp6KczZbQ
	 7qdLFPl0paX9Pbqj3WtNzPsQWX6dV+1STVpqav0oHsWcaZxI9QRC8MTYY+pTJFTVFR
	 Pl0KHb8eAz8uCorr5HFAtZ2Jw9tlZQc6jqWED99P7UN24008Q54yk2y9mfoBLHDyon
	 cbVjjbauC0WTmnSF5I8pE7Mc0XAPXBy8THVxhfi0Ej5DqMKK+Z79bbdjM0dmHlwqyu
	 JRYlk7qFRdWENoAdiKgjo/6ltvkmcj6H6ua5JghpbmXKeW3GNEMqtHnBCtNp7tg/8b
	 YvrogJIyFwT4Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed, 29 Mar 2023 12:55:30 +0300 (MSK)
Date: Wed, 29 Mar 2023 12:55:29 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Arseniy Krasnov
	<avkrasnov@sberdevices.ru>, Liang Yang <liang.yang@amlogic.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
	Yixun Lan <yixun.lan@amlogic.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in
 command word
Message-ID: <20230329095529.4hcydqsmtxin2d4h@CAB-WSD-L081021>
References: <CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
 <fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
 <81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
 <20230328185001.5661132b@xps-13>
 <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
 <CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
 <2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
 <20230329093145.52790647@xps-13>
 <20230329081734.v2kl4okq3ewimvzh@CAB-WSD-L081021>
 <9c7ef736-527b-1659-88d8-cedf56458c30@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9c7ef736-527b-1659-88d8-cedf56458c30@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/29 07:09:00 #21026578
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_025541_495590_9F5F69D2 
X-CRM114-Status: GOOD (  29.38  )
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

T24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMDk6MjA6MTRBTSArMDEwMCwgVHVkb3IgQW1iYXJ1cyB3
cm90ZToKPiAKPiAKPiBPbiAzLzI5LzIzIDA5OjE3LCBEbWl0cnkgUm9rb3NvdiB3cm90ZToKPiA+
IE9uIFdlZCwgTWFyIDI5LCAyMDIzIGF0IDA5OjMxOjQ1QU0gKzAyMDAsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4gPj4gSGVsbG8sCj4gPj4KPiA+PiBhdmtyYXNub3ZAc2JlcmRldmljZXMucnUgd3Jv
dGUgb24gV2VkLCAyOSBNYXIgMjAyMyAxMDoxMjoxMCArMDMwMDoKPiA+Pgo+ID4+PiBPbiAyOC4w
My4yMDIzIDIzOjI1LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+ID4+Pj4gSGkgQXJzZW5p
eSwKPiA+Pj4+Cj4gPj4+PiBPbiBUdWUsIE1hciAyOCwgMjAyMyBhdCA4OjM54oCvUE0gQXJzZW5p
eSBLcmFzbm92Cj4gPj4+PiA8YXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiA+Pj4+
IFsuLi5dICAKPiA+Pj4+Pj4KPiA+Pj4+Pj4gQnkgdGhlIHdheSBhbnkgcmVhc29uIG5vdCB0byBo
YXZlIENjJ2VkIHN0YWJsZT8gIAo+ID4+Pj4+Cj4gPj4+Pj4gU29ycnksIHdoYXQgZG8gWW91IG1l
YW4/IEkndmUgaW5jbHVkZWQgbGludXgtbXRkIG1haWxpbmcgbGlzdHMsIHRoZXJlIGlzCj4gPj4+
Pj4gb25lIG1vcmUgbGlzdCBmb3IgbXRkIHJldmlld3M/IEkgd2lsbCBhcHByZWNpYXRlIGlmIFlv
dSBjYW4gcG9pbnQgbWUgIAo+ID4+Pj4gInN0YWJsZSIgdHlwaWNhbGx5IHJlZmVycyB0byB0aGUg
c3RhYmxlIHRyZWUgd2hlcmUgZml4ZXMgZm9yIGFscmVhZHkKPiA+Pj4+IHJlbGVhc2VkIGtlcm5l
bCB2ZXJzaW9ucyBhcmUgbWFpbnRhaW5lZC4KPiA+Pj4+IFdoZW4gTWlxdWVsIGFwcGxpZXMgdGhl
IHBhdGNoIGl0IHdpbGwgZWl0aGVyIGxhbmQgaW4gdGhlIG5leHQgLXJjIG9mCj4gPj4+PiB0aGUg
Y3VycmVudCBkZXZlbG9wbWVudCBjeWNsZSAodHlwaWNhbGx5IGFwcGxpZXMgdG8gZml4ZXMgLSBj
dXJyZW50bHkKPiA+Pj4+IDYuMy1yYzUpIG9yIC1yYzEgb2YgdGhlIG5leHQga2VybmVsIHZlcnNp
b24gKHR5cGljYWxseSBhcHBsaWVzIHRvIG5ldwo+ID4+Pj4gZmVhdHVyZXMsIGNsZWFudXBzLCBl
dGMuIC0gY3VycmVudGx5IDYuNC1yYzEpLgo+ID4+Pj4KPiA+Pj4+IExldCdzIHNheSB5b3UgYXJl
IGZpeGluZyBhIGJ1ZyBub3cgYnV0IHdhbnQgdGhlIGZpeCB0byBiZSBpbmNsdWRlZCBpbgo+ID4+
Pj4gNi4xIExUUyAobG9uZyB0ZXJtIHN0YWJsZSkgb3Igb3RoZXIgc3RhYmxlIHJlbGVhc2UuCj4g
Pj4+PiBJbiB0aGlzIGNhc2UgaXQncyByZWNvbW1lbmRlZCB0byBDYyB0aGUgbWFpbnRhaW5lcnMg
b2YgdGhlIHN0YWJsZQo+ID4+Pj4gdHJlZXMgYXMgcGFydCBvZiB5b3VyIHBhdGNoLCBzZWUgWzBd
Lgo+ID4+Pj4gVGhhdCB3YXkgb25jZSB0aGUgY29tbWl0IHdpdGggeW91ciBmaXggaGl0cyBMaW51
cyBUb3J2YWxkcyBsaW51eCB0cmVlCj4gPj4+PiBpdCB3aWxsIGJlIGJhY2twb3J0ZWQgYnkgdGhl
IHN0YWJsZSB0ZWFtIHdpdGhpbiBhIGZldyBkYXlzIChhc3N1bWluZwo+ID4+Pj4gb2YgY291cnNl
IHRoYXQgdGhlIHBhdGNoIGFwcGxpZXMgY2xlYW5seSB0byBvbGRlciB2ZXJzaW9ucywgaWYgbm90
Cj4gPj4+PiB0aGV5J3JlIG5vdGlmeWluZyB5b3UpLgo+ID4+Pj4gTm90ZTogZXZlbiB3aXRob3V0
IENjJ2luZyB0aGUgc3RhYmxlIG1haW50YWluZXJzIHlvdXIgY29tbWl0IG1heSBiZQo+ID4+Pj4g
YmFja3BvcnRlZCAoc2VtaS1hdXRvbWF0aWNhbGx5KSBpZiBpdCBoYXMgYSBGaXhlcyB0YWcgYW5k
IHRoZSBzdGFibGUKPiA+Pj4+IG1haW50YWluZXJzIGZpbmQgeW91ciBjb21taXQuIEJ1dCBteSB1
bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQncwo+ID4+Pj4gZWFzaWVzdCBmb3IgdGhlbSBpZiB0aGV5
J3JlIGV4cGxpY2l0bHkgQ2MnZWQgb24gdGhlIHBhdGNoLgo+ID4+Pj4KPiA+Pj4+IEkgaG9wZSB0
aGlzIG1ha2VzIHNlbnNlLiBJZiBub3Q6IGRvbid0IGhlc2l0YXRlIHRvIGFzay4gIAo+ID4+Cj4g
Pj4gVGhhdCBpcyBhbiBleGNlbGxlbnQgc3VtbWFyeSwgSSBzaG91bGQgY29weS9wYXN0ZSBpdCBz
b21ldGltZXMgOikKPiA+Pgo+ID4gCj4gPiBGaW5hbGx5IEkgZnVsbHkgdW5kZXJzdGFuZCB3aHkg
J0ZpeGVzJyB0YWcgaXMgc28gaGVscGZ1bCEKPiA+IFRoYW5rIHlvdSBNYXJ0aW4hCj4gPiAKPiAK
PiBIZXJlJ3MgdGhlIG9mZmljaWFsIGRvY3VtZW50YXRpb246Cj4gaHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC9sYXRlc3QvcHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwKClR1
ZG9yIHRoYW5rIHlvdSBmb3Igc3VnZ2VzdGlvbiEKCkkgZG9uJ3Qgc2VlIGFueXRoaW5nIGFib3V0
IEZpeGVzOiB0YWcgb24gdGhpcyBwYWdlLCBidXQgbG9va3MgbGlrZQonU3VibWl0dGluZyBwYXRj
aGVzJyB0dXRvcmlhbCBoYXMgaXQ6CgoiIiIKQSBGaXhlczogdGFnIGluZGljYXRlcyB0aGF0IHRo
ZSBwYXRjaCBmaXhlcyBhbiBpc3N1ZSBpbiBhIHByZXZpb3VzCmNvbW1pdC4gSXQgaXMgdXNlZCB0
byBtYWtlIGl0IGVhc3kgdG8gZGV0ZXJtaW5lIHdoZXJlIGEgYnVnIG9yaWdpbmF0ZWQsCndoaWNo
IGNhbiBoZWxwIHJldmlldyBhIGJ1ZyBmaXguIFRoaXMgdGFnIGFsc28gYXNzaXN0cyB0aGUgc3Rh
YmxlIGtlcm5lbAp0ZWFtIGluIGRldGVybWluaW5nIHdoaWNoIHN0YWJsZSBrZXJuZWwgdmVyc2lv
bnMgc2hvdWxkIHJlY2VpdmUgeW91cgpmaXguIFRoaXMgaXMgdGhlIHByZWZlcnJlZCBtZXRob2Qg
Zm9yIGluZGljYXRpbmcgYSBidWcgZml4ZWQgYnkgdGhlCnBhdGNoLiBTZWUgRGVzY3JpYmUgeW91
ciBjaGFuZ2VzIGZvciBtb3JlIGRldGFpbHMuCiIiIgotLSAKVGhhbmsgeW91LApEbWl0cnkKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
