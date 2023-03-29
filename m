Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB3C761AF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Mar 2023 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kO45pzqqEZ7veBXUObXsGNTY95orx+2JLrZoF0K/JtM=; b=UxPw44B1eY8uny
	z09YGzK/aFPLfzBv+W99jpeatEt9n016qmhfJNP+BbgzdDQhEx0okzVEKRE8VatWLA35y0nHy6zOo
	GTNXWblkuq6jUR4JLAHlTKtlPFgYiyzkIPr7wU3Ce72e8Nc9dTfP0yNnV2E/IHdMyqYUrZX1VTuzZ
	9rQpx8hRkAJyXLTKPFt6NK3kK/DuazBMGBDPGDrWTDtH7MCWChRQcrEEXRvl61sormzRU38yskSGS
	tMuz9cd1JGTcfZa96jNGc2pKg/j0RkUfFFgdCo/6y0V/8CCsrGtd3u6ePW2l0NAcht8K5SkMn9KdA
	A1ORkiXPbhEKZKfkG4AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phQHp-00GvQe-0p;
	Wed, 29 Mar 2023 07:32:01 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phQHk-00GvOB-10;
	Wed, 29 Mar 2023 07:31:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 99F6320008;
	Wed, 29 Mar 2023 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680075110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y5Tz+W9L5sIsVCnWkSfJ3WHW6H3+KUzYvv4GXzZD7MA=;
	b=AqBaobXJksPG1S257DuMCuggbk3BSsTl842Ld5g4y3m4Qx3qZVsb4EwOdr0NHIioQwW4lk
	lrQWv35/JL7ihJLLf6xXaVbdunE3un7PGWueSNJ1zpd2HcqtQQlK+0MWlcbOVU7aCh8fv2
	DeCL+/b13ZV3O79ygOjLUr0hJI0nMqwTC52mJbBypIS6Q30CV5LKWbL+o0SjfwOA44SrFP
	ZamVMaCVq0gMaGXfmPLSuxQ79n1gK1ChR3NkpzrjLVaeP/k7tY9AjJRgWVKoiUSK4qmFYW
	LGmSnbovVrimfYUCheZggtBxKHD+F2KEiSpBAKAIMQw9RlU0bqoZQ9o2CUgYFA==
Date: Wed, 29 Mar 2023 09:31:45 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Liang Yang
 <liang.yang@amlogic.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <kernel@sberdevices.ru>, <oxffffaa@gmail.com>
Subject: Re: [PATCH v1] mtd: rawnand: meson: fix bitmask for length in
 command word
Message-ID: <20230329093145.52790647@xps-13>
In-Reply-To: <2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
References: <d4338bd5-125c-a9e7-cb46-6f5e1da05cfa@sberdevices.ru>
	<CAFBinCB3yuyNJD=7UJ7jzf45Masms_PD4sm42YNjO8M4cr+4wg@mail.gmail.com>
	<fe2ed378-cdac-dbb3-acd2-ff542bd7e887@sberdevices.ru>
	<81632eee-533e-5e44-1520-5321a06c6797@sberdevices.ru>
	<20230328185001.5661132b@xps-13>
	<e8edcbc8-5c72-b29e-21d7-6f4438391924@sberdevices.ru>
	<CAFBinCCCNYJV4RBbM78r3yGPnY4oNKySEFRkzBgUD3xYJGkJmw@mail.gmail.com>
	<2fed42ad-11cb-6199-6adb-d9272209f5e2@sberdevices.ru>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_003156_677386_86E10506 
X-CRM114-Status: GOOD (  26.86  )
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

SGVsbG8sCgphdmtyYXNub3ZAc2JlcmRldmljZXMucnUgd3JvdGUgb24gV2VkLCAyOSBNYXIgMjAy
MyAxMDoxMjoxMCArMDMwMDoKCj4gT24gMjguMDMuMjAyMyAyMzoyNSwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiA+IEhpIEFyc2VuaXksCj4gPiAKPiA+IE9uIFR1ZSwgTWFyIDI4LCAyMDIz
IGF0IDg6MznigK9QTSBBcnNlbml5IEtyYXNub3YKPiA+IDxhdmtyYXNub3ZAc2JlcmRldmljZXMu
cnU+IHdyb3RlOgo+ID4gWy4uLl0gIAo+ID4+Pgo+ID4+PiBCeSB0aGUgd2F5IGFueSByZWFzb24g
bm90IHRvIGhhdmUgQ2MnZWQgc3RhYmxlPyAgCj4gPj4KPiA+PiBTb3JyeSwgd2hhdCBkbyBZb3Ug
bWVhbj8gSSd2ZSBpbmNsdWRlZCBsaW51eC1tdGQgbWFpbGluZyBsaXN0cywgdGhlcmUgaXMKPiA+
PiBvbmUgbW9yZSBsaXN0IGZvciBtdGQgcmV2aWV3cz8gSSB3aWxsIGFwcHJlY2lhdGUgaWYgWW91
IGNhbiBwb2ludCBtZSAgCj4gPiAic3RhYmxlIiB0eXBpY2FsbHkgcmVmZXJzIHRvIHRoZSBzdGFi
bGUgdHJlZSB3aGVyZSBmaXhlcyBmb3IgYWxyZWFkeQo+ID4gcmVsZWFzZWQga2VybmVsIHZlcnNp
b25zIGFyZSBtYWludGFpbmVkLgo+ID4gV2hlbiBNaXF1ZWwgYXBwbGllcyB0aGUgcGF0Y2ggaXQg
d2lsbCBlaXRoZXIgbGFuZCBpbiB0aGUgbmV4dCAtcmMgb2YKPiA+IHRoZSBjdXJyZW50IGRldmVs
b3BtZW50IGN5Y2xlICh0eXBpY2FsbHkgYXBwbGllcyB0byBmaXhlcyAtIGN1cnJlbnRseQo+ID4g
Ni4zLXJjNSkgb3IgLXJjMSBvZiB0aGUgbmV4dCBrZXJuZWwgdmVyc2lvbiAodHlwaWNhbGx5IGFw
cGxpZXMgdG8gbmV3Cj4gPiBmZWF0dXJlcywgY2xlYW51cHMsIGV0Yy4gLSBjdXJyZW50bHkgNi40
LXJjMSkuCj4gPiAKPiA+IExldCdzIHNheSB5b3UgYXJlIGZpeGluZyBhIGJ1ZyBub3cgYnV0IHdh
bnQgdGhlIGZpeCB0byBiZSBpbmNsdWRlZCBpbgo+ID4gNi4xIExUUyAobG9uZyB0ZXJtIHN0YWJs
ZSkgb3Igb3RoZXIgc3RhYmxlIHJlbGVhc2UuCj4gPiBJbiB0aGlzIGNhc2UgaXQncyByZWNvbW1l
bmRlZCB0byBDYyB0aGUgbWFpbnRhaW5lcnMgb2YgdGhlIHN0YWJsZQo+ID4gdHJlZXMgYXMgcGFy
dCBvZiB5b3VyIHBhdGNoLCBzZWUgWzBdLgo+ID4gVGhhdCB3YXkgb25jZSB0aGUgY29tbWl0IHdp
dGggeW91ciBmaXggaGl0cyBMaW51cyBUb3J2YWxkcyBsaW51eCB0cmVlCj4gPiBpdCB3aWxsIGJl
IGJhY2twb3J0ZWQgYnkgdGhlIHN0YWJsZSB0ZWFtIHdpdGhpbiBhIGZldyBkYXlzIChhc3N1bWlu
Zwo+ID4gb2YgY291cnNlIHRoYXQgdGhlIHBhdGNoIGFwcGxpZXMgY2xlYW5seSB0byBvbGRlciB2
ZXJzaW9ucywgaWYgbm90Cj4gPiB0aGV5J3JlIG5vdGlmeWluZyB5b3UpLgo+ID4gTm90ZTogZXZl
biB3aXRob3V0IENjJ2luZyB0aGUgc3RhYmxlIG1haW50YWluZXJzIHlvdXIgY29tbWl0IG1heSBi
ZQo+ID4gYmFja3BvcnRlZCAoc2VtaS1hdXRvbWF0aWNhbGx5KSBpZiBpdCBoYXMgYSBGaXhlcyB0
YWcgYW5kIHRoZSBzdGFibGUKPiA+IG1haW50YWluZXJzIGZpbmQgeW91ciBjb21taXQuIEJ1dCBt
eSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQncwo+ID4gZWFzaWVzdCBmb3IgdGhlbSBpZiB0aGV5
J3JlIGV4cGxpY2l0bHkgQ2MnZWQgb24gdGhlIHBhdGNoLgo+ID4gCj4gPiBJIGhvcGUgdGhpcyBt
YWtlcyBzZW5zZS4gSWYgbm90OiBkb24ndCBoZXNpdGF0ZSB0byBhc2suICAKClRoYXQgaXMgYW4g
ZXhjZWxsZW50IHN1bW1hcnksIEkgc2hvdWxkIGNvcHkvcGFzdGUgaXQgc29tZXRpbWVzIDopCgo+
IAo+IEhlbGxvISBUaGFua3MgZm9yIHRoaXMgZGV0YWlsZWQgZXhwbGFuYXRpb24sIHRoYXQgcmVh
bGx5IGhlbHBzIQoKU28gSU9XLCBJIGFtIGFza2luZyB5b3UgdG8gc2VuZCBhIHYyIHdpdGggYW4g
YWRkaXRpb25hbCBsaW5lIGluIHRoZQpjb21taXQsIHJpZ2h0IG5leHQgIkZpeGVzIjoKCkNjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
