Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27693C4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Dec 2023 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tZcDj0rWdWboAUqS+zsFchCeSqzHlx+CajZfmlO6uI=; b=BjHZ6mZcNY4pbb
	Zw4f0mnu5Dh7mkNsSLJruA1aga8XuITDGbcJqMfR4IXmvCRXOf6A4VAf5/7r8oomeuZ4UaH3gO7no
	gJMueg3r14Hv/yW8WAe7YQGd2LANT7wPkU8y7MBKQ0/zQzc6StYk9Py4YZJlJzqtUpjUKOsYJ27VV
	XMb4mVOdeBHVHB2yaqMkAq73XFDkYqom3GpWq6jMxcDIXSSpV68bMAsDM0NY2e2mTzG9GDDoor68m
	2ngFtl+NwdVRaea8ttiI0SkLuX1Xikp2rGqHTZAYygnv6uhIxjtV9LIvT52/f/E/tlNFdyGkQDTuy
	OQER7a8KdJr3osaoQULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD3OY-00BrsZ-1b;
	Tue, 12 Dec 2023 14:05:58 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD3OV-00Brrp-2s
	for linux-mtd@lists.infradead.org;
	Tue, 12 Dec 2023 14:05:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8BFF8E0002;
	Tue, 12 Dec 2023 14:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702389952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8VgCEu9GpjqJrf+SumYZk2dGW/A3Nbxfr4XJ0APRxZs=;
	b=BQnsfRN2Q+kLg7bzZvez/qL4QLdRn+pFSg8c1FZ/YF2OVoSyOJAj1R6rwt0uDPArfPQ3vV
	6wdhNvf3KCjEprppYqoafwkNdoW9n8zC5mkOJ4TruaZba/r3rWnjcary3RAVnMeqrwGHf2
	tfRDonIUwsxe0kJXcaeSsZjgLkEPIZ2/EcZ4THs/4O+YwD7pB0ouWUpBm7Bp+h0TN3teAq
	xA6Ylq/MDwHbsgTawPYFosctRZgN0KQoQFMoRG1wloIzW/QPSq33RUetApKQRLloBfti8+
	qiTksBELzNZlWb7dslWsuonqffvdoh05NNtouedFOAgHf3Q5fPTJQRZv1sDHlQ==
Date: Tue, 12 Dec 2023 15:05:45 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann
 <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Christophe
 Kerello <christophe.kerello@foss.st.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Johan Jonker <jbx6244@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v6 20/40] mtd: rawnand: add support for ts72xx
Message-ID: <20231212150545.61806147@xps-13>
In-Reply-To: <29970d694d155dee0c76612f453eaa06a929e2c1.camel@maquefel.me>
References: <20231212-ep93xx-v6-0-c307b8ac9aa8@maquefel.me>
	<20231212-ep93xx-v6-20-c307b8ac9aa8@maquefel.me>
	<2023121220-shine-caviar-68dc@gregkh>
	<29970d694d155dee0c76612f453eaa06a929e2c1.camel@maquefel.me>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_060556_342734_0AD663B6 
X-CRM114-Status: GOOD (  19.51  )
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

SGVsbG8sCgpuaWtpdGEuc2h1YmluQG1hcXVlZmVsLm1lIHdyb3RlIG9uIFR1ZSwgMTIgRGVjIDIw
MjMgMTE6MzU6NDggKzAzMDA6Cgo+IEhlbGxvIEdyZWchCj4gCj4gT24gVHVlLCAyMDIzLTEyLTEy
IGF0IDA5OjMwICswMTAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gPiBPbiBUdWUsIERl
YyAxMiwgMjAyMyBhdCAxMToyMDozN0FNICswMzAwLCBOaWtpdGEgU2h1YmluIHZpYSBCNCBSZWxh
eQo+ID4gd3JvdGU6ICAKPiA+ID4gRnJvbTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBt
YXF1ZWZlbC5tZT4KPiA+ID4gCj4gPiA+IFRlY2hub2xvZ2ljIFN5c3RlbXMgaGFzIGl0J3Mgb3du
IG5hbmQgY29udHJvbGxlciBpbXBsZW1lbnRhdGlvbiBpbgo+ID4gPiBDUExELgo+ID4gPiAKPiA+
ID4gU2lnbmVkLW9mZi1ieTogTmlraXRhIFNodWJpbiA8bmlraXRhLnNodWJpbkBtYXF1ZWZlbC5t
ZT4KPiA+ID4gLS0tCj4gPiA+IMKgZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZ8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDcgKwo+ID4gPiDCoGRy
aXZlcnMvbXRkL25hbmQvcmF3L01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+ID4gPiDCoGRyaXZlcnMvbXRkL25hbmQvcmF3L3RlY2hu
b2xvZ2ljLW5hbmQtY29udHJvbGxlci5jIHwgMjIwCj4gPiA+ICsrKysrKysrKysrKysrKysrKysr
Kwo+ID4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgMjI4IGluc2VydGlvbnMoKykKPiA+ID4gCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiA+IGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4gPiBpbmRleCBjYmY4YWU4NWUxYWUuLjM5MzdjMTBk
ZWExYyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvS2NvbmZpZwo+ID4g
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnCj4gPiA+IEBAIC00NDksNiArNDQ5
LDEzIEBAIGNvbmZpZyBNVERfTkFORF9SRU5FU0FTCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBF
bmFibGVzIHN1cHBvcnQgZm9yIHRoZSBOQU5EIGNvbnRyb2xsZXIgZm91bmQgb24gUmVuZXNhcwo+
ID4gPiBSLUNhcgo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgR2VuMyBhbmQgUlovTjEgU29DIGZh
bWlsaWVzLgo+ID4gPiDCoAo+ID4gPiArY29uZmlnIE1URF9OQU5EX1RTNzJYWAo+ID4gPiArwqDC
oMKgwqDCoMKgwqB0cmlzdGF0ZSAidHM3Mnh4IE5BTkQgY29udHJvbGxlciIKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgZGVwZW5kcyBvbiBBUkNIX0VQOTNYWCAmJiBIQVNfSU9NRU0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgaGVscAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoCBFbmFibGVzIHN1cHBvcnQgZm9y
IE5BTkQgY29udHJvbGxlciBvbiB0czcyeHggU0JDcy4KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqAg
VGhpcyBpcyBhIGxlZ2FjeSBkcml2ZXIgYmFzZWQgb24gZ2VuX25hbmQuICAKPiA+IAo+ID4gV2h5
IGlzIGEgbmV3ICJsZWdhY3kgZHJpdmVyIiBiZWluZyB3cml0dGVuIHRoZXNlIGRheXM/wqAgV2h5
IG5vdCBkbyBpdAo+ID4gcHJvcGVybHk/ICAKPiAKPiBTb3JyeSwgbXkgYmFkLCBkZXNjcmlwdGlv
biBpcyBhIGxlZnRvdmVyIGZyb20gb2xkZXIgZGVzY3JpcHRpb24gKHdoZW4gaQo+IHdhcyBhbGxv
d2VkIHRvIHN1Ym1pdCBhIGxlZ2FjeSBvbmUpLgo+IAo+IFRoZSBkcml2ZXIgaXMgbW9zdGx5IG5l
dywgc2hpbnkgYW5kIGFwcHJvdmVkIGJ5IE1pcXVlbDoKPiAKPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjMxMDA0MTAzOTExLjJhYTY1MzU0QHhwcy0xMy8KPiAKPiBUaGUgS0NvbmZp
ZyBkZXNjcmlwdGlvbiBzaG91bGQgYmUgZml4ZWQuCgpJbmRlZWQsIGxhdGVyIHN1Ym1pc3Npb25z
IGNhcnJpZWQgYSBicmFuZCBuZXcgaW1wbGVtZW50YXRpb24gd2hpY2ggbm8KbG9uZ2VyIGxldmVy
YWdlcyBhbnkgbGVnYWN5IGhvb2suIFRoZSBLY29uZmlnIGRlc2NyaXB0aW9uIGlzIHdyb25nLApn
b29kIGNhdGNoLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
