Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E58C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 13:13:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F75214D8
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 13:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dN03bOdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F75214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kzGbXAO5WBROec9u3DWNW1Zm2dPCvwngBdi7WKB1+78=; b=dN03bOdz8g+IeD
	yrIE2cCAY1gX2YrmzcBCqk3OX7BG5qxgbEySw656xajoLIpW/zbLBkYzqyZBVtPHygK4elJLv/RTb
	D0xy0IVMBZR0MMUMSagwN04L5SzCoODjRKhHbk5Ln6idoVoPovZXx49cN2Tn3xeN3mrdIKVrAaOpd
	l62TLFCJASk9e/+RBV6aNuCvhgHvFWqRNO7xq97oDw5+4OmRub/I4UrqZa7KIbrzZh9yO8fd6jHR4
	U9tct/r2GzitjRXLV5OxhRn4I8Crejh6JPFaSp4MsZBLQ8AlhvPv9TaBeDHdIM+O9o5jdpP/T5qQq
	PBz0/AXve+SNXQW3RPig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3hDz-0004xb-Vp; Tue, 12 Mar 2019 13:13:43 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3hDv-0004wn-GF
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 13:13:41 +0000
X-Originating-IP: 90.88.22.102
Received: from xps13 (aaubervilliers-681-1-80-102.w90-88.abo.wanadoo.fr
 [90.88.22.102]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A803160014;
 Tue, 12 Mar 2019 13:13:28 +0000 (UTC)
Date: Tue, 12 Mar 2019 14:13:27 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 2/9] mtd: rawnand: denali: refactor syndrome layout
 handling for raw access
Message-ID: <20190312141327.31c6af3f@xps13>
In-Reply-To: <CAK7LNAT_h7o4Rbzsgmd8Z6G3Pq3Uhvdqyhp2-ArCb8hfnreEpA@mail.gmail.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
 <1552380290-19951-3-git-send-email-yamada.masahiro@socionext.com>
 <20190312112811.1af0bb00@xps13>
 <CAK7LNATud=QTQ4FGxt1FtSZ06-Boa-jiROp7-wOj192FgXTNLw@mail.gmail.com>
 <20190312115425.612bcdf2@xps13>
 <CAK7LNAT_h7o4Rbzsgmd8Z6G3Pq3Uhvdqyhp2-ArCb8hfnreEpA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_061339_845566_B5AFF193 
X-CRM114-Status: GOOD (  28.70  )
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
Y29tPiB3cm90ZSBvbiBUdWUsIDEyIE1hcgoyMDE5IDIwOjA3OjI3ICswOTAwOgoKPiBIaSBNaXF1
ZWwsCj4gCj4gCj4gT24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgNzo1NCBQTSBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBNYXNhaGlybywK
PiA+Cj4gPiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQuY29tPiB3
cm90ZSBvbiBUdWUsIDEyIE1hcgo+ID4gMjAxOSAxOTo1MToyMSArMDkwMDoKPiA+ICAKPiA+ID4g
T24gVHVlLCBNYXIgMTIsIDIwMTkgYXQgNzoyOCBQTSBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5
bmFsQGJvb3RsaW4uY29tPiB3cm90ZTogIAo+ID4gPiA+Cj4gPiA+ID4gSGkgTWFzYWhpcm8sCj4g
PiA+ID4KPiA+ID4gPiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDEyIE1hcgo+ID4gPiA+IDIwMTkgMTc6NDQ6NDMgKzA5MDA6Cj4g
PiA+ID4gIAo+ID4gPiA+ID4gVGhlIERlbmFsaSBJUCBhZG9wdHMgdGhlIHN5bmRyb21lIHBhZ2Ug
bGF5b3V0IChwYXlsb2FkIGFuZCBFQ0MgYXJlCj4gPiA+ID4gPiBpbnRlcmxlYXZlZCkuIFRoZSAq
X3BhZ2VfcmF3KCkgYW5kICpfb29iKCkgY2FsbGJhY2tzIGFyZSBjb21wbGljYXRlZAo+ID4gPiA+
ID4gYmVjYXVzZSB0aGV5IG11c3QgaGlkZSB0aGUgdW5kZXJseWluZyBsYXlvdXQgdXNlZCBieSB0
aGUgaGFyZHdhcmUsCj4gPiA+ID4gPiBhbmQgYWx3YXlzIHJldHVybiBjb250aWd1b3VzIGluLWJh
bmQgYW5kIG91dC1vZi1iYW5kIGRhdGEuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQ3VycmVudGx5LCBz
aW1pbGFyIGNvZGUgaXMgZHVwbGljYXRlZCB0byByZW9yZ2FuaXplIHRoZSBkYXRhIGxheW91dC4K
PiA+ID4gPiA+IEZvciBleGFtcGxlLCBkZW5hbGlfcmVhZF9wYWdlX3JhdygpIGFuZCBkZW5hbGlf
d3JpdGVfcGFnZV9yYXcoKSBsb29rCj4gPiA+ID4gPiBhbG1vc3QgdGhlIHNhbWUuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGhlIGlkZWEgZm9yIHJlZmFjdG9yaW5nIGlzIHRvIHNwbGl0IHRoZSBjb2Rl
IGludG8gdHdvIHBhcnRzOgo+ID4gPiA+ID4gICBbMV0gY29udmVyc2lvbiBvZiBwYWdlIGxheW91
dAo+ID4gPiA+ID4gICBbMl0gd2hhdCB0byBkbyBhdCBldmVyeSBFQ0MgY2h1bmsgYm91bmRhcnkK
PiA+ID4gPiA+Cj4gPiA+ID4gPiBGb3IgWzFdLCBJIHdyb3RlIGRlbmFsaV9yYXdfcGF5bG9hZF9v
cCgpIGFuZCBkZW5hbGlfcmF3X29vYl9vcCgpLgo+ID4gPiA+ID4gVGhleSBtYW5pcHVsYXRlIGRh
dGEgZm9yIHRoZSBEZW5hbGkgY29udHJvbGxlcidzIHNwZWNpZmljIHBhZ2UgbGF5b3V0Cj4gPiA+
ID4gPiBvZiBpbi1iYW5kLCBvdXQtb2YtYmFuZCwgcmVzcGVjdGl2ZWx5Lgo+ID4gPiA+ID4KPiA+
ID4gPiA+IFRoZSBkaWZmZXJlbmNlIGJldHdlZW4gd3JpdGUgYW5kIHJlYWQgaXMganVzdCB0aGUg
b3BlcmF0aW9uIGF0Cj4gPiA+ID4gPiBFQ0MgY2h1bmsgYm91bmRhcmllcy4gRm9yIGV4YW1wbGUs
IGRlbmFsaV9yZWFkX29vYigpIGNhbGxzCj4gPiA+ID4gPiBuYW5kX2NoYW5nZV9yZWFkX2NvbHVt
bl9vcCgpLCB3aGVyZWFzIGRlbmFsaV93cml0ZV9vb2IoKSBjYWxscwo+ID4gPiA+ID4gbmFuZF9j
aGFuZ2Vfd3JpdGVfY29sdW1uX29wKCkuIFNvLCBJIGltcGxlbWVudGVkIFsyXSBhcyBhIGNhbGxi
YWNrCj4gPiA+ID4gPiBwYXNzZWQgaW50byBbMV0uCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEubWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4K
PiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gIAo+ID4gPiA+Cj4gPiA+ID4gWy4uLl0KPiA+ID4gPiAg
Cj4gPiA+ID4gPiAgc3RhdGljIGludCBkZW5hbGlfcmVhZF9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9j
aGlwICpjaGlwLCB1aW50OF90ICpidWYsCj4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBpbnQgb29iX3JlcXVpcmVkLCBpbnQgcGFnZSkKPiA+ID4gPiA+ICB7Cj4gPiA+ID4g
PiArICAgICBzdHJ1Y3QgZGVuYWxpX25hbmRfaW5mbyAqZGVuYWxpID0gdG9fZGVuYWxpKGNoaXAp
Owo+ID4gPiA+ID4gICAgICAgc3RydWN0IG10ZF9pbmZvICptdGQgPSBuYW5kX3RvX210ZChjaGlw
KTsKPiA+ID4gPiA+IC0gICAgIHN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpkZW5hbGkgPSBtdGRf
dG9fZGVuYWxpKG10ZCk7Cj4gPiA+ID4gPiAtICAgICBpbnQgd3JpdGVzaXplID0gbXRkLT53cml0
ZXNpemU7Cj4gPiA+ID4gPiAtICAgICBpbnQgb29ic2l6ZSA9IG10ZC0+b29ic2l6ZTsKPiA+ID4g
PiA+IC0gICAgIGludCBlY2Nfc3RlcHMgPSBjaGlwLT5lY2Muc3RlcHM7Cj4gPiA+ID4gPiAtICAg
ICBpbnQgZWNjX3NpemUgPSBjaGlwLT5lY2Muc2l6ZTsKPiA+ID4gPiA+IC0gICAgIGludCBlY2Nf
Ynl0ZXMgPSBjaGlwLT5lY2MuYnl0ZXM7Cj4gPiA+ID4gPiAgICAgICB2b2lkICp0bXBfYnVmID0g
ZGVuYWxpLT5idWY7Cj4gPiA+ID4gPiAtICAgICBpbnQgb29iX3NraXAgPSBkZW5hbGktPm9vYl9z
a2lwX2J5dGVzOwo+ID4gPiA+ID4gLSAgICAgc2l6ZV90IHNpemUgPSB3cml0ZXNpemUgKyBvb2Jz
aXplOwo+ID4gPiA+ID4gLSAgICAgaW50IHJldCwgaSwgcG9zLCBsZW47Cj4gPiA+ID4gPiArICAg
ICBzaXplX3Qgc2l6ZSA9IG10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOwo+ID4gPiA+ID4g
KyAgICAgaW50IHJldDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgIGlmICghYnVmKQo+ID4g
PiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAg
ICAgICByZXQgPSBkZW5hbGlfZGF0YV94ZmVyKGNoaXAsIHRtcF9idWYsIHNpemUsIHBhZ2UsIDEs
IDApOwo+ID4gPiA+ID4gICAgICAgaWYgKHJldCkKPiA+ID4gPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIHJldDsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAtICAgICAvKiBBcnJhbmdlIHRoZSBidWZmZXIg
Zm9yIHN5bmRyb21lIHBheWxvYWQvZWNjIGxheW91dCAqLwo+ID4gPiA+ID4gLSAgICAgaWYgKGJ1
Zikgewo+ID4gPiA+ID4gLSAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgZWNjX3N0ZXBzOyBp
KyspIHsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBwb3MgPSBpICogKGVjY19zaXpl
ICsgZWNjX2J5dGVzKTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBsZW4gPSBlY2Nf
c2l6ZTsKPiA+ID4gPiA+IC0KPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBpZiAocG9z
ID49IHdyaXRlc2l6ZSkKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBv
cyArPSBvb2Jfc2tpcDsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICBlbHNlIGlmIChw
b3MgKyBsZW4gPiB3cml0ZXNpemUpCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBsZW4gPSB3cml0ZXNpemUgLSBwb3M7Cj4gPiA+ID4gPiAtCj4gPiA+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgbWVtY3B5KGJ1ZiwgdG1wX2J1ZiArIHBvcywgbGVuKTsKPiA+ID4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICBidWYgKz0gbGVuOwo+ID4gPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgIGlmIChsZW4gPCBlY2Nfc2l6ZSkgewo+ID4gPiA+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGVuID0gZWNjX3NpemUgLSBsZW47Cj4gPiA+ID4gPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBtZW1jcHkoYnVmLCB0bXBfYnVmICsgd3JpdGVzaXplICsgb29i
X3NraXAsCj4gPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVu
KTsKPiA+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJ1ZiArPSBsZW47Cj4g
PiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPiA+ID4gLSAgICAgICAgICAgICB9
Cj4gPiA+ID4gPiAtICAgICB9Cj4gPiA+ID4gPiArICAgICByZXQgPSBkZW5hbGlfcmF3X3BheWxv
YWRfb3AoY2hpcCwgYnVmLCBkZW5hbGlfbWVtY3B5X2luLCB0bXBfYnVmKTsgIAo+ID4gPiA+Cj4g
PiA+ID4gSG9uZXN0bHksIEkgc3RpbGwgZG9uJ3QgbGlrZSBwYXNzaW5nIGRlbmFsaV9tZW1jcHlf
aW4vb3V0IGFzIHBhcmFtZXRlci4KPiA+ID4gPgo+ID4gPiA+IEJlc2lkZXMgdGhhdCwgb25jZSB5
b3UnbGwgaGF2ZSBhZGRlZCBoZWxwZXJzIHRvIGF2b2lkIGFidXNpbmcgdGhlCj4gPiA+ID4gdGVy
bmFyeSBvcGVyYXRvciBpbiA0LzksIHRoZSByZXN0IGxvb2tzIGZpbmUgYnkgbWUuCj4gPiA+ID4g
IAo+ID4gPgo+ID4gPgo+ID4gPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbj8gIAo+ID4KPiA+
IE1heWJlIHJlZ2lzdGVyIHRoZXNlIHR3byBoZWxwZXJzIGF0IHByb2JlIGFzIGNvbnRyb2xsZXIg
c3BlY2lmaWMgaG9va3MsCj4gPiB0aGVuIGp1c3QgcGFzcyBhbiBpbi9vdXQgYm9vbGVhbiB0byB0
aGUgZnVuY3Rpb24/Cj4gPiAgCj4gCj4gU29ycnksIEkgZG8gbm90IHVuZGVyc3RhbmQuCj4gCj4g
QXJlIHlvdSBzdWdnZXN0aW5nIHRvIGRvIGxpa2UgZm9sbG93cyBpbiBwcm9iZSA/Cj4gCj4gZGVu
YWxpLT5jaGFuZ2VfY29sdW1uX3JlYWRfcmF3ID0gZGVuYWxpX21lbWNweV9pbjsKPiBkZW5hbGkt
PmNoYW5nZV9jb2x1bW5fd3JpdGVfcmF3ID0gZGVuYWxpX21lbWNweV9vdXQ7Cj4gZGVuYWxpLT5j
aGFuZ2VfY29sdW1uX3JlYWRfb29iID0gZGVuYWxpX2NoYW5nZV9yZWFkX2NvbHVtbl9vcDsKPiBk
ZW5hbGktPmNoYW5nZV9jb2x1bW5fd3JpdGVfb29iID0gZGVuYWxpX2NoYW5nZV93cml0ZV9jb2x1
bW5fb3A7Cj4gCj4gCj4gQWxsIHRoZSA0IGhvb2tzIGFyZSBhbHdheXMgbmVlZGVkCj4gcmVnYXJk
bGVzcyBvZiBhbnkgcHJvYmVkIGZlYXR1cmVzLgo+IAo+IAo+IFRoZSByZXN1bHQgaXMganVzdCB0
ZXh0dWFsIHJlcGxhY2VtZW50Cj4gZGVuYWxpXyogd2l0aCBkZW5hbGktPiouCj4gCj4gV2hhdCdz
IHRoZSBwb2ludCBvZiBjb3B5aW5nIGZpeGVkIGZ1bmN0aW9uIGFkZHJlc3Nlcwo+IHRvIGRlbmFs
aSBzdHJ1Y3R1cmU/Cj4gCj4gCgpXaGF0IEkgZG9uJ3QgbGlrZSBpcyB0aGUgZnVuY3Rpb24gcG9p
bnRlciBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlci4gWW91CmNhbiB1c2UgdGhlIGZ1bmN0aW9ucyBk
ZWZpbmVkIHN0YXRpY2FsbHkgaWYgeW91IHByZWZlciBhcyBsb25nIGFzIHRoZQpwYXJhbWV0ZXIg
aXMganVzdCBhIGJvb2xlYW4gZm9yIGluc3RhbmNlPwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
