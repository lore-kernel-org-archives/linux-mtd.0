Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BD7C00140
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Aug 2022 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWEiguOfQoy0sUcPA6H1Njhl86tA1+CnlkSSRFlpi0k=; b=O5sI0LagvC3jgI
	jYd0wAiW/Sp78vNNGvgi2gK0+Wgv0qtSdQHkGprzIOKFWNQVJerTai9ONI1wIpOaInUbEuyz81RWP
	Rx3l6tFD6DCv79Xzw1NAIa0CG5qZ6+7hHTjQUPCZehaNeTRwsYsIt0j3KRKpIWqNng/ABVqEZ1J9S
	bfcxuKXiTVUHpRtG/v2iZH0UDboDwuAlCDvOavZLNJ+/MdDSD2OgoRd9+DAs/u/54dMhOQCap6DsA
	ygqKk98Iqpn4WCjxckvNF3bMsph+Q5F8S7quMUxfYE/JEb9G8veGtKRSyrM6ZGr5ETYR6WX0hAr1U
	QMF19qCI3md7Bazhkh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL7So-00FOy8-3F; Mon, 08 Aug 2022 18:26:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oL7Sk-00FOvH-Ff
	for linux-mtd@lists.infradead.org; Mon, 08 Aug 2022 18:26:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2F166B80EF0;
	Mon,  8 Aug 2022 18:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E7BC433D6;
	Mon,  8 Aug 2022 18:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659983205;
	bh=0I9URx+gPUqGptctGVhHS9ZIOHnIDlJW8ZgwpkFQxRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5vCqzaw1oiiq5INwMNjZxnNeNYodQMwL8B+u48VrfHPniitIYQXejJkpXswPVj4h
	 4l8qNBI/+U8fXlfzLsTYtSoKugUEg1jDcy9zOC00EypZekaH8NQmynX/TY970wToT9
	 Fb5CioLa7uN/GkyBxByk0f0b1ZwdhOQDXrBP2Gt4rKhKRAFAsv1TmacYOyujC4Mozk
	 YSD5dz7eUpesfLlXk4ROLWD2hQbxmRAqCZg3B9s96g7Nrq0c2bzAHtfw13WpbkfsQ/
	 E+hbTrr3CskqUcVT+g8ULTJdWS8xsqpWTH7nITDmbylEYBBlUxiEqcgu2rVg5r90GQ
	 SzDs5Tv8uiACw==
Received: by pali.im (Postfix)
	id 8CFF7F13; Mon,  8 Aug 2022 20:26:42 +0200 (CEST)
Date: Mon, 8 Aug 2022 20:26:42 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: fsl_elbc: Fix none ECC mode
Message-ID: <20220808182642.edlqreldxikje53l@pali>
References: <20220707184328.3845-1-pali@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220707184328.3845-1-pali@kernel.org>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_112650_828034_2F0EF0B7 
X-CRM114-Status: GOOD (  24.98  )
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

UElORz8KCk9uIFRodXJzZGF5IDA3IEp1bHkgMjAyMiAyMDo0MzoyOCBQYWxpIFJvaMOhciB3cm90
ZToKPiBDb21taXQgZjY0MjRjMjJhYTM2ICgibXRkOiByYXduYW5kOiBmc2xfZWxiYzogTWFrZSBT
VyBFQ0Mgd29yayIpIGFkZGVkCj4gc3VwcG9ydCBmb3Igc3BlY2lmeWluZyBFQ0MgbW9kZSB2aWEg
RFRTIGFuZCBza2lwcGluZyBhdXRvZGV0ZWN0aW9uLgo+IAo+IEJ1dCBpdCBicm9rZSBleHBsaWNp
dCBzcGVjaWZpY2F0aW9uIG9mIEhXIEVDQyBtb2RlIGluIERUUyBhcyBjb3JyZWN0Cj4gc2V0dGlu
Z3MgZm9yIEhXIEVDQyBtb2RlIGFyZSBhcHBsaWVkIG9ubHkgd2hlbiBOT05FIG1vZGUgb3Igbm90
aGluZyB3YXMKPiBzcGVjaWZpZWQgaW4gRFRTIGZpbGUuCj4gCj4gQWxzbyBpdCBzdGFydGVkIGFs
aWFzaW5nIE5PTkUgbW9kZSB0byBiZSBzYW1lIGFzIHdoZW4gRUNDIG1vZGUgd2FzIG5vdAo+IHNw
ZWNpZmllZCBhbmQgZGlzYWxsb3dlZCB1c2FnZSBvZiBPTl9ESUUgbW9kZS4KPiAKPiBGaXggYWxs
IHRoZXNlIGlzc3Vlcy4gVXNlIGF1dG9kZXRlY3Rpb24gb2YgRUNDIG1vZGUgb25seSBpbiBjYXNl
IHdoZW4gbW9kZQo+IHdhcyByZWFsbHkgbm90IHNwZWNpZmllZCBpbiBEVFMgZmlsZSBieSBjaGVj
a2luZyB0aGF0IGVjYyB2YWx1ZSBpcyBpbnZhbGlkLgo+IFNldCBIVyBFQ0Mgc2V0dGluZ3MgZWl0
aGVyIHdoZW4gSFcgRUNDIHdhcyBzcGVjaWZpZWQgaW4gRFRTIG9yIGl0IHdhcwo+IGF1dG9kZXRl
Y3RlZC4gQW5kIGRvIG5vdCBmYWlsIHdoZW4gT05fRElFIG1vZGUgaXMgc2V0Lgo+IAo+IEZpeGVz
OiBmNjQyNGMyMmFhMzYgKCJtdGQ6IHJhd25hbmQ6IGZzbF9lbGJjOiBNYWtlIFNXIEVDQyB3b3Jr
IikKPiBTaWduZWQtb2ZmLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMgfCAyOCArKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2Vs
YmNfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2VsYmNfbmFuZC5jCj4gaW5kZXgg
YWFiOTNiOWU2MDUyLi5hMThkMTIxMzk2YWEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbmFu
ZC9yYXcvZnNsX2VsYmNfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2Vs
YmNfbmFuZC5jCj4gQEAgLTcyNiwzNiArNzI2LDQwIEBAIHN0YXRpYyBpbnQgZnNsX2VsYmNfYXR0
YWNoX2NoaXAoc3RydWN0IG5hbmRfY2hpcCAqY2hpcCkKPiAgCXN0cnVjdCBmc2xfbGJjX3JlZ3Mg
X19pb21lbSAqbGJjID0gY3RybC0+cmVnczsKPiAgCXVuc2lnbmVkIGludCBhbDsKPiAgCj4gLQlz
d2l0Y2ggKGNoaXAtPmVjYy5lbmdpbmVfdHlwZSkgewo+ICAJLyoKPiAgCSAqIGlmIEVDQyB3YXMg
bm90IGNob3NlbiBpbiBEVCwgZGVjaWRlIHdoZXRoZXIgdG8gdXNlIEhXIG9yIFNXIEVDQyBmcm9t
Cj4gIAkgKiBDUyBCYXNlIFJlZ2lzdGVyCj4gIAkgKi8KPiAtCWNhc2UgTkFORF9FQ0NfRU5HSU5F
X1RZUEVfTk9ORToKPiArCWlmIChjaGlwLT5lY2MuZW5naW5lX3R5cGUgPT0gTkFORF9FQ0NfRU5H
SU5FX1RZUEVfSU5WQUxJRCkgewo+ICAJCS8qIElmIENTIEJhc2UgUmVnaXN0ZXIgc2VsZWN0cyBm
dWxsIGhhcmR3YXJlIEVDQyB0aGVuIHVzZSBpdCAqLwo+ICAJCWlmICgoaW5fYmUzMigmbGJjLT5i
YW5rW3ByaXYtPmJhbmtdLmJyKSAmIEJSX0RFQ0MpID09Cj4gIAkJICAgIEJSX0RFQ0NfQ0hLX0dF
Tikgewo+IC0JCQljaGlwLT5lY2MucmVhZF9wYWdlID0gZnNsX2VsYmNfcmVhZF9wYWdlOwo+IC0J
CQljaGlwLT5lY2Mud3JpdGVfcGFnZSA9IGZzbF9lbGJjX3dyaXRlX3BhZ2U7Cj4gLQkJCWNoaXAt
PmVjYy53cml0ZV9zdWJwYWdlID0gZnNsX2VsYmNfd3JpdGVfc3VicGFnZTsKPiAtCj4gIAkJCWNo
aXAtPmVjYy5lbmdpbmVfdHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX09OX0hPU1Q7Cj4gLQkJ
CW10ZF9zZXRfb29ibGF5b3V0KG10ZCwgJmZzbF9lbGJjX29vYmxheW91dF9vcHMpOwo+IC0JCQlj
aGlwLT5lY2Muc2l6ZSA9IDUxMjsKPiAtCQkJY2hpcC0+ZWNjLmJ5dGVzID0gMzsKPiAtCQkJY2hp
cC0+ZWNjLnN0cmVuZ3RoID0gMTsKPiAgCQl9IGVsc2Ugewo+ICAJCQkvKiBvdGhlcndpc2UgZmFs
bCBiYWNrIHRvIGRlZmF1bHQgc29mdHdhcmUgRUNDICovCj4gIAkJCWNoaXAtPmVjYy5lbmdpbmVf
dHlwZSA9IE5BTkRfRUNDX0VOR0lORV9UWVBFX1NPRlQ7Cj4gIAkJCWNoaXAtPmVjYy5hbGdvID0g
TkFORF9FQ0NfQUxHT19IQU1NSU5HOwo+ICAJCX0KPiArCX0KPiArCj4gKwlzd2l0Y2ggKGNoaXAt
PmVjYy5lbmdpbmVfdHlwZSkgewo+ICsJLyogaWYgSFcgRUNDIHdhcyBjaG9zZW4sIHNldHVwIGVj
YyBhbmQgb29iIGxheW91dCAqLwo+ICsJY2FzZSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9IT1NU
Ogo+ICsJCWNoaXAtPmVjYy5yZWFkX3BhZ2UgPSBmc2xfZWxiY19yZWFkX3BhZ2U7Cj4gKwkJY2hp
cC0+ZWNjLndyaXRlX3BhZ2UgPSBmc2xfZWxiY193cml0ZV9wYWdlOwo+ICsJCWNoaXAtPmVjYy53
cml0ZV9zdWJwYWdlID0gZnNsX2VsYmNfd3JpdGVfc3VicGFnZTsKPiArCQltdGRfc2V0X29vYmxh
eW91dChtdGQsICZmc2xfZWxiY19vb2JsYXlvdXRfb3BzKTsKPiArCQljaGlwLT5lY2Muc2l6ZSA9
IDUxMjsKPiArCQljaGlwLT5lY2MuYnl0ZXMgPSAzOwo+ICsJCWNoaXAtPmVjYy5zdHJlbmd0aCA9
IDE7Cj4gIAkJYnJlYWs7Cj4gIAo+IC0JLyogaWYgU1cgRUNDIHdhcyBjaG9zZW4gaW4gRFQsIHdl
IGRvIG5vdCBuZWVkIHRvIHNldCBhbnl0aGluZyBoZXJlICovCj4gKwkvKiBpZiBub25lIG9yIFNX
IEVDQyB3YXMgY2hvc2VuLCB3ZSBkbyBub3QgbmVlZCB0byBzZXQgYW55dGhpbmcgaGVyZSAqLwo+
ICsJY2FzZSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9OT05FOgo+ICAJY2FzZSBOQU5EX0VDQ19FTkdJ
TkVfVFlQRV9TT0ZUOgo+ICsJY2FzZSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9PTl9ESUU6Cj4gIAkJ
YnJlYWs7Cj4gIAo+IC0JLyogc2hvdWxkIHdlIGFsc28gaW1wbGVtZW50ICpfRUNDX0VOR0lORV9D
T05UUk9MTEVSIHRvIGRvIGFzIGFib3ZlPyAqLwo+ICAJZGVmYXVsdDoKPiAgCQlyZXR1cm4gLUVJ
TlZBTDsKPiAgCX0KPiAtLSAKPiAyLjIwLjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
