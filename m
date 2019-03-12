Return-Path: <SRS0=+O2D=RP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F72C43381
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 10:28:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDFB2147C
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2019 10:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YDdeWpsK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDFB2147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnJGAi2+pGaryGoTgUgSk/+E0GYLfe7PQSJqYeAbJRY=; b=YDdeWpsKnBQEds
	ixTe9Uz8UHCNCBxQD7DF2ca1ZEXXBDuah5QxokOBm/s8/3VvSOh66w17IH1tOxrLuh0OT/sB7g/Gf
	o/CESpnMeuWLP1OHO+GwMqyfkXY2LXkNIfdSuiEbh36Ycfq56yQn56F8W4u1tSD5vTrL7pEzjz1nM
	EZTjwpudMMtIawqrHQTXvKOpNHdq6JacAxB2sqTC8KNJ65j+bR7r0B41tvHEhpMy7WBzUqE+nW6ew
	zJ+t81ZmVpb6VR+txk57vzj/0/v4MD2Bpb3bDVYrDvl7pCYYsDNfgdezkL6sSreMI3qTPPqbj28SI
	WEvfbJDojskWdZCovi8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3ee8-000365-7v; Tue, 12 Mar 2019 10:28:32 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3ee4-00035V-55
 for linux-mtd@lists.infradead.org; Tue, 12 Mar 2019 10:28:30 +0000
Received: from xps13 (aaubervilliers-681-1-31-179.w90-88.abo.wanadoo.fr
 [90.88.150.179]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 38B05240016;
 Tue, 12 Mar 2019 10:28:11 +0000 (UTC)
Date: Tue, 12 Mar 2019 11:28:11 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v3 2/9] mtd: rawnand: denali: refactor syndrome layout
 handling for raw access
Message-ID: <20190312112811.1af0bb00@xps13>
In-Reply-To: <1552380290-19951-3-git-send-email-yamada.masahiro@socionext.com>
References: <1552380290-19951-1-git-send-email-yamada.masahiro@socionext.com>
 <1552380290-19951-3-git-send-email-yamada.masahiro@socionext.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_032828_493770_4389AE15 
X-CRM114-Status: GOOD (  19.03  )
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
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWFzYWhpcm8sCgpNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPiB3cm90ZSBvbiBUdWUsIDEyIE1hcgoyMDE5IDE3OjQ0OjQzICswOTAwOgoKPiBUaGUgRGVu
YWxpIElQIGFkb3B0cyB0aGUgc3luZHJvbWUgcGFnZSBsYXlvdXQgKHBheWxvYWQgYW5kIEVDQyBh
cmUKPiBpbnRlcmxlYXZlZCkuIFRoZSAqX3BhZ2VfcmF3KCkgYW5kICpfb29iKCkgY2FsbGJhY2tz
IGFyZSBjb21wbGljYXRlZAo+IGJlY2F1c2UgdGhleSBtdXN0IGhpZGUgdGhlIHVuZGVybHlpbmcg
bGF5b3V0IHVzZWQgYnkgdGhlIGhhcmR3YXJlLAo+IGFuZCBhbHdheXMgcmV0dXJuIGNvbnRpZ3Vv
dXMgaW4tYmFuZCBhbmQgb3V0LW9mLWJhbmQgZGF0YS4KPiAKPiBDdXJyZW50bHksIHNpbWlsYXIg
Y29kZSBpcyBkdXBsaWNhdGVkIHRvIHJlb3JnYW5pemUgdGhlIGRhdGEgbGF5b3V0Lgo+IEZvciBl
eGFtcGxlLCBkZW5hbGlfcmVhZF9wYWdlX3JhdygpIGFuZCBkZW5hbGlfd3JpdGVfcGFnZV9yYXco
KSBsb29rCj4gYWxtb3N0IHRoZSBzYW1lLgo+IAo+IFRoZSBpZGVhIGZvciByZWZhY3RvcmluZyBp
cyB0byBzcGxpdCB0aGUgY29kZSBpbnRvIHR3byBwYXJ0czoKPiAgIFsxXSBjb252ZXJzaW9uIG9m
IHBhZ2UgbGF5b3V0Cj4gICBbMl0gd2hhdCB0byBkbyBhdCBldmVyeSBFQ0MgY2h1bmsgYm91bmRh
cnkKPiAKPiBGb3IgWzFdLCBJIHdyb3RlIGRlbmFsaV9yYXdfcGF5bG9hZF9vcCgpIGFuZCBkZW5h
bGlfcmF3X29vYl9vcCgpLgo+IFRoZXkgbWFuaXB1bGF0ZSBkYXRhIGZvciB0aGUgRGVuYWxpIGNv
bnRyb2xsZXIncyBzcGVjaWZpYyBwYWdlIGxheW91dAo+IG9mIGluLWJhbmQsIG91dC1vZi1iYW5k
LCByZXNwZWN0aXZlbHkuCj4gCj4gVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB3cml0ZSBhbmQgcmVh
ZCBpcyBqdXN0IHRoZSBvcGVyYXRpb24gYXQKPiBFQ0MgY2h1bmsgYm91bmRhcmllcy4gRm9yIGV4
YW1wbGUsIGRlbmFsaV9yZWFkX29vYigpIGNhbGxzCj4gbmFuZF9jaGFuZ2VfcmVhZF9jb2x1bW5f
b3AoKSwgd2hlcmVhcyBkZW5hbGlfd3JpdGVfb29iKCkgY2FsbHMKPiBuYW5kX2NoYW5nZV93cml0
ZV9jb2x1bW5fb3AoKS4gU28sIEkgaW1wbGVtZW50ZWQgWzJdIGFzIGEgY2FsbGJhY2sKPiBwYXNz
ZWQgaW50byBbMV0uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFzYWhpcm8gWWFtYWRhIDx5YW1hZGEu
bWFzYWhpcm9Ac29jaW9uZXh0LmNvbT4KPiAtLS0KPiAKClsuLi5dCgo+ICBzdGF0aWMgaW50IGRl
bmFsaV9yZWFkX3BhZ2VfcmF3KHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsIHVpbnQ4X3QgKmJ1ZiwK
PiAgCQkJCWludCBvb2JfcmVxdWlyZWQsIGludCBwYWdlKQo+ICB7Cj4gKwlzdHJ1Y3QgZGVuYWxp
X25hbmRfaW5mbyAqZGVuYWxpID0gdG9fZGVuYWxpKGNoaXApOwo+ICAJc3RydWN0IG10ZF9pbmZv
ICptdGQgPSBuYW5kX3RvX210ZChjaGlwKTsKPiAtCXN0cnVjdCBkZW5hbGlfbmFuZF9pbmZvICpk
ZW5hbGkgPSBtdGRfdG9fZGVuYWxpKG10ZCk7Cj4gLQlpbnQgd3JpdGVzaXplID0gbXRkLT53cml0
ZXNpemU7Cj4gLQlpbnQgb29ic2l6ZSA9IG10ZC0+b29ic2l6ZTsKPiAtCWludCBlY2Nfc3RlcHMg
PSBjaGlwLT5lY2Muc3RlcHM7Cj4gLQlpbnQgZWNjX3NpemUgPSBjaGlwLT5lY2Muc2l6ZTsKPiAt
CWludCBlY2NfYnl0ZXMgPSBjaGlwLT5lY2MuYnl0ZXM7Cj4gIAl2b2lkICp0bXBfYnVmID0gZGVu
YWxpLT5idWY7Cj4gLQlpbnQgb29iX3NraXAgPSBkZW5hbGktPm9vYl9za2lwX2J5dGVzOwo+IC0J
c2l6ZV90IHNpemUgPSB3cml0ZXNpemUgKyBvb2JzaXplOwo+IC0JaW50IHJldCwgaSwgcG9zLCBs
ZW47Cj4gKwlzaXplX3Qgc2l6ZSA9IG10ZC0+d3JpdGVzaXplICsgbXRkLT5vb2JzaXplOwo+ICsJ
aW50IHJldDsKPiArCj4gKwlpZiAoIWJ1ZikKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gIAly
ZXQgPSBkZW5hbGlfZGF0YV94ZmVyKGNoaXAsIHRtcF9idWYsIHNpemUsIHBhZ2UsIDEsIDApOwo+
ICAJaWYgKHJldCkKPiAgCQlyZXR1cm4gcmV0Owo+ICAKPiAtCS8qIEFycmFuZ2UgdGhlIGJ1ZmZl
ciBmb3Igc3luZHJvbWUgcGF5bG9hZC9lY2MgbGF5b3V0ICovCj4gLQlpZiAoYnVmKSB7Cj4gLQkJ
Zm9yIChpID0gMDsgaSA8IGVjY19zdGVwczsgaSsrKSB7Cj4gLQkJCXBvcyA9IGkgKiAoZWNjX3Np
emUgKyBlY2NfYnl0ZXMpOwo+IC0JCQlsZW4gPSBlY2Nfc2l6ZTsKPiAtCj4gLQkJCWlmIChwb3Mg
Pj0gd3JpdGVzaXplKQo+IC0JCQkJcG9zICs9IG9vYl9za2lwOwo+IC0JCQllbHNlIGlmIChwb3Mg
KyBsZW4gPiB3cml0ZXNpemUpCj4gLQkJCQlsZW4gPSB3cml0ZXNpemUgLSBwb3M7Cj4gLQo+IC0J
CQltZW1jcHkoYnVmLCB0bXBfYnVmICsgcG9zLCBsZW4pOwo+IC0JCQlidWYgKz0gbGVuOwo+IC0J
CQlpZiAobGVuIDwgZWNjX3NpemUpIHsKPiAtCQkJCWxlbiA9IGVjY19zaXplIC0gbGVuOwo+IC0J
CQkJbWVtY3B5KGJ1ZiwgdG1wX2J1ZiArIHdyaXRlc2l6ZSArIG9vYl9za2lwLAo+IC0JCQkJICAg
ICAgIGxlbik7Cj4gLQkJCQlidWYgKz0gbGVuOwo+IC0JCQl9Cj4gLQkJfQo+IC0JfQo+ICsJcmV0
ID0gZGVuYWxpX3Jhd19wYXlsb2FkX29wKGNoaXAsIGJ1ZiwgZGVuYWxpX21lbWNweV9pbiwgdG1w
X2J1Zik7CgpIb25lc3RseSwgSSBzdGlsbCBkb24ndCBsaWtlIHBhc3NpbmcgZGVuYWxpX21lbWNw
eV9pbi9vdXQgYXMgcGFyYW1ldGVyLgoKQmVzaWRlcyB0aGF0LCBvbmNlIHlvdSdsbCBoYXZlIGFk
ZGVkIGhlbHBlcnMgdG8gYXZvaWQgYWJ1c2luZyB0aGUKdGVybmFyeSBvcGVyYXRvciBpbiA0Lzks
IHRoZSByZXN0IGxvb2tzIGZpbmUgYnkgbWUuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
