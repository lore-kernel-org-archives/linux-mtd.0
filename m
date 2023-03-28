Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C81C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuZUwKHwa3eeyvuDtFNUIFZmj5OMzMZ135thBFyn10s=; b=D01hg/jWtCxi8+
	B5/eP9EyM5YEzuu6ol5WrRbKsPu/zhGzu1mSfR6BBuyJmqJ1t3PfRxMKgA9Xo8Qnn6rU+lt922F0y
	ZlcsGlE2loXosJG1hPh0MpV+ypFZSrBQhAZEubipayC1b+X+/S/j5r1OeIsZ7c10rstTHo0mG2Acp
	30uc643f0i0LEFhkFwmZax/NbCrmoY4IMS7sDAeD8u/QPwzUxIa2RA3tSmXPcqgiFZnnIn8gttz2R
	7wDztaCVeRASV4wuW7c+s2jkoKJsG4ixdJ9gOk7Blx2hO/qVEjStZvd3eKRm68YF57rcd9pKOZFFe
	+6iHCeRXOy1PHV7dcXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phEEl-00FUKa-0p;
	Tue, 28 Mar 2023 18:40:03 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phEEg-00FUIq-1l;
	Tue, 28 Mar 2023 18:40:00 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 723C35FD11;
	Tue, 28 Mar 2023 21:39:53 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1680028793;
	bh=FKSXkxzpcregzzfc8LNxNe/imIDwFEKPHvMo25ayGiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=iXw7Hw10rLCW8FE+ohGYVDEi5BPwn9CzmW24kCubDHroJ9I0mByvJHUvph0hWISOx
	 K9dnq2VX+iH4mHwzQ8Bt1D5+yFILTbJ9MrQA0bz1m3VilQGhA/NwNHzsIpo8DHnaXa
	 tToouWFKFGfVI+nLhBL+amSRF6ZVRWrPAz5AE8b1AakRLlkVGO6jSjyTAWxHzE4o36
	 1SIwj+3A480u2QvibB2uikV2Tl/oUN/f3JuqvsFeclMrhzpRr5JNjb3RkAOCv1RGhx
	 2kfbDT4ejK0bVZWlDsR5I9X+zJzWSdytWWiTV1PdZmys89l6ipHJ0Sr+CHHtuw+q6s
	 weW82HhJ5YrxQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue, 28 Mar 2023 21:39:52 +0300 (MSK)
Message-ID: <e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
Date: Tue, 28 Mar 2023 21:36:27 +0300
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
From: Arseniy Krasnov <avkrasnov@sberdevices.ru>
In-Reply-To: <20230328185001.5661132b@xps-13>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/03/28 16:12:00 #21022880
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_113959_275070_D4B9DCB5 
X-CRM114-Status: GOOD (  23.52  )
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

CgpPbiAyOC4wMy4yMDIzIDE5OjUwLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IEhpIEFyc2VuaXks
Cj4gCj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFR1ZSwgMjggTWFyIDIwMjMg
MTg6NTY6MTkgKzAzMDA6Cj4gCj4+IEhlbGxvIQo+Pgo+PiBATWlxdWVsIFJheW5hbCwgd2hhdCBp
cyB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2g/Cj4gCj4gUGxlYXNlLCBpdCdzIGJlZW4gNiBkYXlz
LCB0aGVyZSBpcyBhbHNvIGEgbWFpbnRhaW5lciAoTGlhbmcpIGluCj4gYmV0d2VlbiwgSSdtIGZp
bmUgd2l0aCB0aGUgcGF0Y2ggYnV0IGl0IHdhcyB0b28gbGF0ZSB0byB0YWtlIGl0IGFzCj4gcGFy
dCBvZiBteSBwcmV2aW91cyBmaXhlcyBQUi4gQXMgc2FpZCBlYXJsaWVyIHRvZGF5IG9uIHRoZSBt
YWlsaW5nIGxpc3QKPiB0byBDaHJpc3RvcGhlIEkgd2lsbCBtYWtlIGFub3RoZXIgZml4ZXMgUFIg
bmV4dCB3ZWVrIChJJ2xsIHdhaXQgZm9yIHRoZQo+IGN1cnJlbnQgb25lIHRvIGJlIHBhcnQgb2Yg
dGhlIG5leHQgLXJjIHRhZykuCgpUaGFua3MgZm9yIGRldGFpbHMsIHN1cmUgbm8gcHJvYmxlbSBm
b3IgUFIgb24gdGhlIG5leHQgd2VlayEgWWVzLCBMaWFuZyBpcyBhCm1haW50YWluZXIsIGJ1dCBp
IGRpZG4ndCBzZWUgYW55IGZlZWRiYWNrcyBmcm9tIGhpbSBvbiBteSBwcmV2aW91cyBmaXhlcyBm
b3IKdGhpcyBkcml2ZXIuCgo+IAo+IEJ5IHRoZSB3YXkgYW55IHJlYXNvbiBub3QgdG8gaGF2ZSBD
YydlZCBzdGFibGU/CgpTb3JyeSwgd2hhdCBkbyBZb3UgbWVhbj8gSSd2ZSBpbmNsdWRlZCBsaW51
eC1tdGQgbWFpbGluZyBsaXN0cywgdGhlcmUgaXMKb25lIG1vcmUgbGlzdCBmb3IgbXRkIHJldmll
d3M/IEkgd2lsbCBhcHByZWNpYXRlIGlmIFlvdSBjYW4gcG9pbnQgbWUKClRoYW5rcywgQXJzZW5p
eQoKPiAKPj4KPj4gVGhhbmtzLCBBcnNlbml5Cj4+Cj4+IE9uIDIzLjAzLjIwMjMgMTA6NTcsIEFy
c2VuaXkgS3Jhc25vdiB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMjIuMDMuMjAyMyAyMzoxMCwgTWFy
dGluIEJsdW1lbnN0aW5nbCB3cm90ZTogIAo+Pj4+IEhlbGxvIEFyc2VuaXksCj4+Pj4KPj4+PiB0
aGFuayB5b3UgZm9yIHN1Ym1pdHRpbmcgdGhpcyBmaXghICAKPj4+IFRoYW5rcyEgIAo+Pj4+Cj4+
Pj4gT24gV2VkLCBNYXIgMjIsIDIwMjMgYXQgNzo0NeKAr1BNIEFyc2VuaXkgS3Jhc25vdgo+Pj4+
IDxhdmtyYXNub3ZAc2JlcmRldmljZXMucnU+IHdyb3RlOiAgCj4+Pj4+Cj4+Pj4+IFZhbGlkIG1h
c2sgaXMgMHgzRkZGLCB3aXRob3V0IHRoaXMgcGF0Y2ggdGhlIGZvbGxvd2luZyBwcm9ibGVtcyB3
ZXJlCj4+Pj4+IGZvdW5kOgo+Pj4+Pgo+Pj4+PiAxKSBbICAgIDAuOTM4OTE0XSBDb3VsZCBub3Qg
ZmluZCBhIHZhbGlkIE9ORkkgcGFyYW1ldGVyIHBhZ2UsIHRyeWluZwo+Pj4+PiAgICAgICAgICAg
ICAgICAgICBiaXQtd2lzZSBtYWpvcml0eSB0byByZWNvdmVyIGl0Cj4+Pj4+ICAgIFsgICAgMC45
NDczODRdIE9ORkkgcGFyYW1ldGVyIHJlY292ZXJ5IGZhaWxlZCwgYWJvcnRpbmcKPj4+Pj4KPj4+
Pj4gMikgUmVhZCB3aXRoIGRpc2FibGVkIEVDQyBtb2RlIHdhcyBicm9rZW4uCj4+Pj4+Cj4+Pj4+
IEZpeGVzOiA4ZmFlODU2YzUzNTAgKCJtdGQ6IHJhd25hbmQ6IG1lc29uOiBhZGQgc3VwcG9ydCBm
b3IgQW1sb2dpYyBOQU5EIGZsYXNoIGNvbnRyb2xsZXIiKQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBB
cnNlbml5IEtyYXNub3YgPEFWS3Jhc25vdkBzYmVyZGV2aWNlcy5ydT4gIAo+Pj4+IFRoaXMgbWF0
Y2hlcyB3aGF0IEkgY2FuIHNlZSBpbiB0aGUgb2xkIHZlbmRvciBkcml2ZXIsIHNvOiAgCj4+PiBN
b3Jlb3ZlciBpdCB3YXMgY2xlYXIgdGhhdCBtYXNrIG9mIDB4M2YgaXMgdG9vIHNtYWxsIGZvciBs
ZW5ndGggb2YgZGF0YSBpbgo+Pj4gYnl0ZXMsIGZvciBleGFtcGxlIGZvciAyMDQ4ICsgT09CIHNp
emUuICAKPj4+PiBBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0
aW5nbEBnb29nbGVtYWlsLmNvbT4KPj4+Pgo+Pj4+IFsuLi5dICAKPj4+Pj4gLSAgICAgICAgICAg
ICAgIGNtZCA9IChsZW4gJiBHRU5NQVNLKDUsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGly
KTsKPj4+Pj4gKyAgICAgICAgICAgICAgIGNtZCA9IChsZW4gJiBHRU5NQVNLKDEzLCAwKSkgfCBz
Y3JhbWJsZXIgfCBETUFfRElSKGRpcik7ICAKPj4+PiBNeSB1bmRlcnN0YW5kaW5nIG9mIHRoZSB2
ZW5kb3IgZHJpdmVyIGlzIHRoYXQgdGhpcyAibGVuIiBpcyBvbmx5IHVzZWQKPj4+PiBmb3IgInJh
dyIgYWNjZXNzIChteSBvd24gd29yZHM6IGFueSBhY2Nlc3MgdGhhdCBkb2Vzbid0IHVzZSB0aGUg
SFcgRUNDCj4+Pj4gZW5naW5lKS4gIAo+Pj4gRXhhY3RseSwgJ2xlbicgaXMgb25seSBmb3IgcmF3
IGFjY2Vzcy4gIAo+Pj4+IEFzIGEgZnV0dXJlIGltcHJvdmVtZW50IChubyBuZWVkIHRvIHVwZGF0
ZSByZS1zZW5kIHRoaXMgcGF0Y2gpIGl0Cj4+Pj4gd291bGQgYmUgZ3JlYXQgdG8gaGF2ZSBhICNk
ZWZpbmUgd2l0aCBhIG1lYW5pbmdmdWwgbmFtZSBmb3IKPj4+PiAiR0VOTUFTSygxMywgMCkiICht
YXliZSBzb21ldGhpbmcgbGlrZSBORkNfQ01EX1JBV19MRU5HVEgpIGFzIGl0J3MKPj4+PiB1c2Vk
IGluIG11bHRpcGxlIHBsYWNlcyBub3cgIAo+Pj4gQWNrCj4+Pgo+Pj4gVGhhbmtzLCBBcnNlbml5
ICAKPj4+Pgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+IE1hcnRpbiAgCj4gCj4gCj4gVGhh
bmtzLAo+IE1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
