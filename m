Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1392C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 10:54:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F7F2075C
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 10:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FoQuDpah"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70F7F2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=egECjFr8C2XQZKR4R5Xat8JhoPg43N2ZUjvL+uuO6f0=; b=FoQuDpahvoJ3vG
	lbXLOfiWmXylpL/t+Eg8RUbXoC5oq9O9E7A6lIO/O0DoGMC/wu5RmyZ7ROB1GlxEOuNTKFwAV90d4
	X2ZFW01jw1oSU/zqay5Zfw1x5l23zM65v2MU8PwF51/ek2bYLEsJwCbMenvK2OUp4/h4mCoywEsOP
	2LTaD2ttMVlS4R1IqPUknuBbQxIzkXN0TwMA4WSV498QlFCZKbOExKOshTJ9LpyOsy6lo/+VJIGgT
	4jnlp0kN5XbzAT3GR666Itjt0yxQfR7CEmIt/g8U/WChD+kUVGkZF7UsNaPDu2lrI+c+6hzITp04n
	OdbAV/1690l7rRxL109A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3f3U-0004Lv-RM; Tue, 12 Mar 2019 10:54:44 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3f3R-0004Lb-CK
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 10:54:43 +0000
X-Originating-IP: 90.88.150.179
Received: from xps13 (aaubervilliers-681-1-31-179.w90-88.abo.wanadoo.fr
 [90.88.150.179]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EDDBE20005;
 Tue, 12 Mar 2019 10:54:26 +0000 (UTC)
Date: Tue, 12 Mar 2019 11:54:25 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 2/9] mtd: rawnand: denali: refactor syndrome layout
 handling for raw access
Message-ID: <20190312115425.612bcdf2@xps13>
In-Reply-To: <CAK7LNATud=QTQ4FGxt1FtSZ06-Boa-jiROp7-wOj192FgXTNLw@mail.gmail.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
 <1552380290-19951-3-git-send-email-yamada.masahiro@socionext.com>
 <20190312112811.1af0bb00@xps13>
 <CAK7LNATud=QTQ4FGxt1FtSZ06-Boa-jiROp7-wOj192FgXTNLw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_035441_715983_A6412F21 
X-CRM114-Status: GOOD (  24.04  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDEyIE1hcgoyMDE5IDE5OjUxOjIxICswOTAwOgoKPiBPbiBUdWUs
IE1hciAxMiwgMjAxOSBhdCA3OjI4IFBNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9v
dGxpbi5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIE1hc2FoaXJvLAo+ID4KPiA+IE1hc2FoaXJvIFlh
bWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+IHdyb3RlIG9uIFR1ZSwgMTIgTWFy
Cj4gPiAyMDE5IDE3OjQ0OjQzICswOTAwOgo+ID4gIAo+ID4gPiBUaGUgRGVuYWxpIElQIGFkb3B0
cyB0aGUgc3luZHJvbWUgcGFnZSBsYXlvdXQgKHBheWxvYWQgYW5kIEVDQyBhcmUKPiA+ID4gaW50
ZXJsZWF2ZWQpLiBUaGUgKl9wYWdlX3JhdygpIGFuZCAqX29vYigpIGNhbGxiYWNrcyBhcmUgY29t
cGxpY2F0ZWQKPiA+ID4gYmVjYXVzZSB0aGV5IG11c3QgaGlkZSB0aGUgdW5kZXJseWluZyBsYXlv
dXQgdXNlZCBieSB0aGUgaGFyZHdhcmUsCj4gPiA+IGFuZCBhbHdheXMgcmV0dXJuIGNvbnRpZ3Vv
dXMgaW4tYmFuZCBhbmQgb3V0LW9mLWJhbmQgZGF0YS4KPiA+ID4KPiA+ID4gQ3VycmVudGx5LCBz
aW1pbGFyIGNvZGUgaXMgZHVwbGljYXRlZCB0byByZW9yZ2FuaXplIHRoZSBkYXRhIGxheW91dC4K
PiA+ID4gRm9yIGV4YW1wbGUsIGRlbmFsaV9yZWFkX3BhZ2VfcmF3KCkgYW5kIGRlbmFsaV93cml0
ZV9wYWdlX3JhdygpIGxvb2sKPiA+ID4gYWxtb3N0IHRoZSBzYW1lLgo+ID4gPgo+ID4gPiBUaGUg
aWRlYSBmb3IgcmVmYWN0b3JpbmcgaXMgdG8gc3BsaXQgdGhlIGNvZGUgaW50byB0d28gcGFydHM6
Cj4gPiA+ICAgWzFdIGNvbnZlcnNpb24gb2YgcGFnZSBsYXlvdXQKPiA+ID4gICBbMl0gd2hhdCB0
byBkbyBhdCBldmVyeSBFQ0MgY2h1bmsgYm91bmRhcnkKPiA+ID4KPiA+ID4gRm9yIFsxXSwgSSB3
cm90ZSBkZW5hbGlfcmF3X3BheWxvYWRfb3AoKSBhbmQgZGVuYWxpX3Jhd19vb2Jfb3AoKS4KPiA+
ID4gVGhleSBtYW5pcHVsYXRlIGRhdGEgZm9yIHRoZSBEZW5hbGkgY29udHJvbGxlcidzIHNwZWNp
ZmljIHBhZ2UgbGF5b3V0Cj4gPiA+IG9mIGluLWJhbmQsIG91dC1vZi1iYW5kLCByZXNwZWN0aXZl
bHkuCj4gPiA+Cj4gPiA+IFRoZSBkaWZmZXJlbmNlIGJldHdlZW4gd3JpdGUgYW5kIHJlYWQgaXMg
anVzdCB0aGUgb3BlcmF0aW9uIGF0Cj4gPiA+IEVDQyBjaHVuayBib3VuZGFyaWVzLiBGb3IgZXhh
bXBsZSwgZGVuYWxpX3JlYWRfb29iKCkgY2FsbHMKPiA+ID4gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1
bW5fb3AoKSwgd2hlcmVhcyBkZW5hbGlfd3JpdGVfb29iKCkgY2FsbHMKPiA+ID4gbmFuZF9jaGFu
Z2Vfd3JpdGVfY29sdW1uX29wKCkuIFNvLCBJIGltcGxlbWVudGVkIFsyXSBhcyBhIGNhbGxiYWNr
Cj4gPiA+IHBhc3NlZCBpbnRvIFsxXS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFzYWhp
cm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICAKPiA+Cj4gPiBbLi4uXQo+ID4gIAo+ID4gPiAgc3RhdGljIGludCBkZW5hbGlfcmVhZF9wYWdl
X3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLCB1aW50OF90ICpidWYsCj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGludCBvb2JfcmVxdWlyZWQsIGludCBwYWdlKQo+ID4gPiAg
ewo+ID4gPiArICAgICBzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpID0gdG9fZGVuYWxp
KGNoaXApOwo+ID4gPiAgICAgICBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9fbXRkKGNo
aXApOwo+ID4gPiAtICAgICBzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpID0gbXRkX3Rv
X2RlbmFsaShtdGQpOwo+ID4gPiAtICAgICBpbnQgd3JpdGVzaXplID0gbXRkLT53cml0ZXNpemU7
Cj4gPiA+IC0gICAgIGludCBvb2JzaXplID0gbXRkLT5vb2JzaXplOwo+ID4gPiAtICAgICBpbnQg
ZWNjX3N0ZXBzID0gY2hpcC0+ZWNjLnN0ZXBzOwo+ID4gPiAtICAgICBpbnQgZWNjX3NpemUgPSBj
aGlwLT5lY2Muc2l6ZTsKPiA+ID4gLSAgICAgaW50IGVjY19ieXRlcyA9IGNoaXAtPmVjYy5ieXRl
czsKPiA+ID4gICAgICAgdm9pZCAqdG1wX2J1ZiA9IGRlbmFsaS0+YnVmOwo+ID4gPiAtICAgICBp
bnQgb29iX3NraXAgPSBkZW5hbGktPm9vYl9za2lwX2J5dGVzOwo+ID4gPiAtICAgICBzaXplX3Qg
c2l6ZSA9IHdyaXRlc2l6ZSArIG9vYnNpemU7Cj4gPiA+IC0gICAgIGludCByZXQsIGksIHBvcywg
bGVuOwo+ID4gPiArICAgICBzaXplX3Qgc2l6ZSA9IG10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2Jz
aXplOwo+ID4gPiArICAgICBpbnQgcmV0Owo+ID4gPiArCj4gPiA+ICsgICAgIGlmICghYnVmKQo+
ID4gPiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPgo+ID4gPiAgICAgICByZXQg
PSBkZW5hbGlfZGF0YV94ZmVyKGNoaXAsIHRtcF9idWYsIHNpemUsIHBhZ2UsIDEsIDApOwo+ID4g
PiAgICAgICBpZiAocmV0KQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+Cj4g
PiA+IC0gICAgIC8qIEFycmFuZ2UgdGhlIGJ1ZmZlciBmb3Igc3luZHJvbWUgcGF5bG9hZC9lY2Mg
bGF5b3V0ICovCj4gPiA+IC0gICAgIGlmIChidWYpIHsKPiA+ID4gLSAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgZWNjX3N0ZXBzOyBpKyspIHsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
IHBvcyA9IGkgKiAoZWNjX3NpemUgKyBlY2NfYnl0ZXMpOwo+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgbGVuID0gZWNjX3NpemU7Cj4gPiA+IC0KPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
IGlmIChwb3MgPj0gd3JpdGVzaXplKQo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwb3MgKz0gb29iX3NraXA7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBlbHNlIGlmIChw
b3MgKyBsZW4gPiB3cml0ZXNpemUpCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxlbiA9IHdyaXRlc2l6ZSAtIHBvczsKPiA+ID4gLQo+ID4gPiAtICAgICAgICAgICAgICAgICAg
ICAgbWVtY3B5KGJ1ZiwgdG1wX2J1ZiArIHBvcywgbGVuKTsKPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgIGJ1ZiArPSBsZW47Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBpZiAobGVuIDwg
ZWNjX3NpemUpIHsKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVuID0gZWNj
X3NpemUgLSBsZW47Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1lbWNweShi
dWYsIHRtcF9idWYgKyB3cml0ZXNpemUgKyBvb2Jfc2tpcCwKPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGxlbik7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGJ1ZiArPSBsZW47Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+IC0g
ICAgICAgICAgICAgfQo+ID4gPiAtICAgICB9Cj4gPiA+ICsgICAgIHJldCA9IGRlbmFsaV9yYXdf
cGF5bG9hZF9vcChjaGlwLCBidWYsIGRlbmFsaV9tZW1jcHlfaW4sIHRtcF9idWYpOyAgCj4gPgo+
ID4gSG9uZXN0bHksIEkgc3RpbGwgZG9uJ3QgbGlrZSBwYXNzaW5nIGRlbmFsaV9tZW1jcHlfaW4v
b3V0IGFzIHBhcmFtZXRlci4KPiA+Cj4gPiBCZXNpZGVzIHRoYXQsIG9uY2UgeW91J2xsIGhhdmUg
YWRkZWQgaGVscGVycyB0byBhdm9pZCBhYnVzaW5nIHRoZQo+ID4gdGVybmFyeSBvcGVyYXRvciBp
biA0LzksIHRoZSByZXN0IGxvb2tzIGZpbmUgYnkgbWUuCj4gPiAgCj4gCj4gCj4gRG8geW91IGhh
dmUgYW55IHN1Z2dlc3Rpb24/CgpNYXliZSByZWdpc3RlciB0aGVzZSB0d28gaGVscGVycyBhdCBw
cm9iZSBhcyBjb250cm9sbGVyIHNwZWNpZmljIGhvb2tzLAp0aGVuIGp1c3QgcGFzcyBhbiBpbi9v
dXQgYm9vbGVhbiB0byB0aGUgZnVuY3Rpb24/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
