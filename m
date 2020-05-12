Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85042C54E4B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:20:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520D920675
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 07:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pTZKh699"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520D920675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kj5B72IsDynNG/wcCYS8/WOshcaUUG4UGxT6EYZBClk=; b=pTZKh699e/awYJ
	0TbAi1CttmhIrB3uxMymQfwNVHnCn96KQemRAGxA6GQxS2Dr3IcBfUmjrsdLf2mrTTghSIFBCFLcm
	DlA/omz2hbgQxwy3neHhERG2f5MDuqLUoJG/rtRzbbKvd5rPLKNedoPxU/UWbd+RTYgWS9rFVgHxb
	pwgNRL9x/lHKFPzYPYsMEjgeQE1SDxY5I5vmg0zrnAKCfO9YbdPtYyMD/Os3HW63BT3xlPNbfEdgt
	sup+XWkCcGWzUi12qT+psYv+vb90e7h6pmUoMGjcaFnP5I3K+qB9Fnt21/J3dt2zC+oH9lq6qvVz5
	mvkxXhIeWoGFzGruZHjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYPCw-0004Bx-Ew; Tue, 12 May 2020 07:20:06 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYPCt-000348-1k
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 07:20:04 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BCD32C000D;
 Tue, 12 May 2020 07:19:59 +0000 (UTC)
Date: Tue, 12 May 2020 09:19:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: rawnand: brcmnand: improve hamming oob layout
Message-ID: <20200512091958.0d153319@xps13>
In-Reply-To: <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
References: <20200504185945.2776148-1-noltari@gmail.com>
 <20200512060023.684871-1-noltari@gmail.com>
 <20200512060023.684871-3-noltari@gmail.com>
 <20200512090844.21bcaf22@xps13>
 <5377BB9D-35EB-4531-8E03-A7483D3134E4@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_002003_374482_07D5CDF9 
X-CRM114-Status: GOOD (  20.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, kdasu.kdev@gmail.com, richard@nod.at,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, computersforpeace@gmail.com,
 sumit.semwal@linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgw4FsdmFybywKCsOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9sdGFyaUBnbWFpbC5jb20+
IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKMDk6MTI6MTAgKzAyMDA6Cgo+IEhpIE1pcXVlbCwK
PiAKPiBJIGFsc28gaGFkIGEgaGFyZCB0aW1lIHVuZGVyc3RhbmRpbmcgeW91ciBlbWFpbC4KPiBJ
dCB3YXMgcXVpdGUgbWlzbGVhZGluZy4KPiAKPiA+IEVsIDEyIG1heSAyMDIwLCBhIGxhcyA5OjA4
LCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiBlc2NyaWJpw7M6Cj4g
PiAKPiA+IEhpIMOBbHZhcm8sCj4gPiAKPiA+IMOBbHZhcm8gRmVybsOhbmRleiBSb2phcyA8bm9s
dGFyaUBnbWFpbC5jb20+IHdyb3RlIG9uIFR1ZSwgMTIgTWF5IDIwMjAKPiA+IDA4OjAwOjIzICsw
MjAwOgo+ID4gICAKPiA+PiBUaGUgY3VycmVudCBjb2RlIGdlbmVyYXRlcyA4IG9vYiBzZWN0aW9u
czoKPiA+PiBTMQkxLTUKPiA+PiBFQ0MJNi04Cj4gPj4gUzIJOS0xNQo+ID4+IFMzCTE2LTIxCj4g
Pj4gRUNDCTIyLTI0Cj4gPj4gUzQJMjUtMzEKPiA+PiBTNQkzMi0zNwo+ID4+IEVDQwkzOC00MAo+
ID4+IFM2CTQxLTQ3Cj4gPj4gUzcJNDgtNTMKPiA+PiBFQ0MJNTQtNTYKPiA+PiBTOAk1Ny02Mwo+
ID4+IAo+ID4+IENoYW5nZSBpdCBieSBtZXJnaW5nIGNvbnRpbnVvdXMgc2VjdGlvbnM6Cj4gPj4g
UzEJMS01Cj4gPj4gRUNDCTYtOAo+ID4+IFMyCTktMjEKPiA+PiBFQ0MJMjItMjQKPiA+PiBTMwky
NS0zNwo+ID4+IEVDQwkzOC00MAo+ID4+IFM0CTQxLTUzCj4gPj4gRUNDCTU0LTU2Cj4gPj4gUzUJ
NTctNjMKPiA+PiAKPiA+PiBGaXhlczogZWY1ZWVlYTZlOTExICgibXRkOiBuYW5kOiBicmNtOiBz
d2l0Y2ggdG8gbXRkX29vYmxheW91dF9vcHMiKSAgCj4gPiAKPiA+IFNvcnJ5IGZvciBsZWFkaW5n
IHlvdSB0aGUgd3Jvbmcgd2F5LCBhY3R1YWxseSB0aGlzIHBhdGNoIGRvZXMgbm90Cj4gPiBkZXNl
cnZlIGEgRml4ZXMgdGFnLiAgCj4gCj4gRG8gSSBuZWVkIHRvIHJlc2VuZCB0aGlzIGFnYWluPwo+
IExvb2tzIGxpa2Ugbm8gbWF0dGVyIHdoYXQgSSBkbyBpdOKAmXMgYWx3YXlzIHdyb25nLi4uCgpQ
bGVhc2UgZG9uJ3QgZ2l2ZSB1cCEgSXQgaXMgbm9ybWFsIHRvIHdvcmsgYmFjayBhbmQgZm9ydGgg
d2l0aCB0aGUKY29tbXVuaXR5LiBJIG5lZWQgdGhlIHBhdGNoIHRvIGJlIGNsZWFyIGFuZCBidWct
ZnJlZSBzbyBJIGFzayB5b3UgdG8KbWFrZSBjaGFuZ2VzIGFuZCBhc2sgcXVlc3Rpb25zLCB0aGF0
J3MgaG93IGl0IHdvcmtzLiBCdXQgYWxsIHlvdXIKcGF0Y2hlcyBhcmUgZW5oYW5jaW5nIHRoaXMg
ZHJpdmVyIHNvIHBsZWFzZSBrZWVwIHBvc3RpbmchCgo+IAo+ID4gICAKPiA+PiBTaWduZWQtb2Zm
LWJ5OiDDgWx2YXJvIEZlcm7DoW5kZXogUm9qYXMgPG5vbHRhcmlAZ21haWwuY29tPgo+ID4+IC0t
LQo+ID4+IHYzOiBpbnZlcnQgcGF0Y2ggb3JkZXIKPiA+PiB2Mjoga2VlcCBvcmlnaW5hbCBjb21t
ZW50IGFuZCBmaXggY29ycmVjdGx5IHNraXAgYnl0ZSA2IGZvciBzbWFsbC1wYWdlIG5hbmQKPiA+
PiAKPiA+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIHwgMzcgKysr
KysrKysrKysrLS0tLS0tLS0tLS0tCj4gPj4gMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDE5IGRlbGV0aW9ucygtKQo+ID4+IAo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYnJjbW5h
bmQvYnJjbW5hbmQuYwo+ID4+IGluZGV4IDFjMTA3MDExMWViYy4uMGExZDc2ZmRlMzdiIDEwMDY0
NAo+ID4+IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2JyY21uYW5kL2JyY21uYW5kLmMKPiA+
PiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9icmNtbmFuZC9icmNtbmFuZC5jCj4gPj4gQEAg
LTExMDAsMzMgKzExMDAsMzIgQEAgc3RhdGljIGludCBicmNtbmFuZF9oYW1taW5nX29vYmxheW91
dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiA+PiAJc3RydWN0IGJy
Y21uYW5kX2NmZyAqY2ZnID0gJmhvc3QtPmh3Y2ZnOwo+ID4+IAlpbnQgc2FzID0gY2ZnLT5zcGFy
ZV9hcmVhX3NpemUgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xazsKPiA+PiAJaW50IHNlY3RvcnMgPSBj
ZmctPnBhZ2Vfc2l6ZSAvICg1MTIgPDwgY2ZnLT5zZWN0b3Jfc2l6ZV8xayk7Cj4gPj4gKwl1MzIg
bmV4dDsKPiA+PiAKPiA+PiAtCWlmIChzZWN0aW9uID49IHNlY3RvcnMgKiAyKQo+ID4+ICsJaWYg
KHNlY3Rpb24gPiBzZWN0b3JzKQo+ID4+IAkJcmV0dXJuIC1FUkFOR0U7Cj4gPj4gCj4gPj4gLQlv
b2JyZWdpb24tPm9mZnNldCA9IChzZWN0aW9uIC8gMikgKiBzYXM7Cj4gPj4gKwluZXh0ID0gKHNl
Y3Rpb24gKiBzYXMpOwo+ID4+ICsJaWYgKHNlY3Rpb24gPCBzZWN0b3JzKQo+ID4+ICsJCW5leHQg
Kz0gNjsKPiA+PiAKPiA+PiAtCWlmIChzZWN0aW9uICYgMSkgewo+ID4+IC0JCW9vYnJlZ2lvbi0+
b2Zmc2V0ICs9IDk7Cj4gPj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA3Owo+ID4+ICsJaWYgKHNl
Y3Rpb24pIHsKPiA+PiArCQlvb2JyZWdpb24tPm9mZnNldCA9ICgoc2VjdGlvbiAtIDEpICogc2Fz
KSArIDk7Cj4gPj4gCX0gZWxzZSB7Cj4gPj4gLQkJb29icmVnaW9uLT5sZW5ndGggPSA2Owo+ID4+
IC0KPiA+PiAtCQkvKiBGaXJzdCBzZWN0b3Igb2YgZWFjaCBwYWdlIG1heSBoYXZlIEJCSSAqLwo+
ID4+IC0JCWlmICghc2VjdGlvbikgewo+ID4+IC0JCQkvKgo+ID4+IC0JCQkgKiBTbWFsbC1wYWdl
IE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiA+PiAtCQkJICogTkFO
RCB1c2UgYnl0ZXMgMCBhbmQgMS4KPiA+PiAtCQkJICovCj4gPj4gLQkJCWlmIChjZmctPnBhZ2Vf
c2l6ZSA+IDUxMikgewo+ID4+IC0JCQkJb29icmVnaW9uLT5vZmZzZXQgKz0gMjsKPiA+PiAtCQkJ
CW9vYnJlZ2lvbi0+bGVuZ3RoIC09IDI7Cj4gPj4gLQkJCX0gZWxzZSB7Cj4gPj4gLQkJCQlvb2Jy
ZWdpb24tPmxlbmd0aC0tOwo+ID4+IC0JCQl9Cj4gPj4gKwkJLyoKPiA+PiArCQkgKiBTbWFsbC1w
YWdlIE5BTkQgdXNlIGJ5dGUgNiBmb3IgQkJJIHdoaWxlIGxhcmdlLXBhZ2UKPiA+PiArCQkgKiBO
QU5EIHVzZSBieXRlcyAwIGFuZCAxLgo+ID4+ICsJCSAqLwo+ID4+ICsJCWlmIChjZmctPnBhZ2Vf
c2l6ZSA+IDUxMikgewo+ID4+ICsJCQlvb2JyZWdpb24tPm9mZnNldCA9IDI7Cj4gPj4gKwkJfSBl
bHNlIHsKPiA+PiArCQkJb29icmVnaW9uLT5vZmZzZXQgPSAwOwo+ID4+ICsJCQluZXh0LS07ICAK
PiA+IAo+ID4gVGhpcyBuZXh0LS0gc2VlbXMgdmVyeSBzdHJhbmdlLCBjYW4geW91IGV4cGxhaW4/
ICAKPiAKPiBJbiB0aGlzIGNhc2UgbmV4dCB3aWxsIGJlIDYgKHdoaWNoIGlzIHRoZSBmaXJzdCBF
Q0MgYnl0ZSkuCj4gSG93ZXZlciwgZm9yIHNtYWxsIHBhZ2UgTkFORHMgYnl0ZSA1IGlzIHJlc2Vy
dmVkIGZvciBCQlQsIHNvIHdlIHdhbnQgbmV4dCB0byBiZSA1IG9ubHkgaW4gdGhpcyBjYXNlLgoK
VGhhdCdzIGNsZWFyLCBwbGVhc2UgYWRkIGEgY29tbWVudCB0aGVyZSB0aGVuLgoKPiAKPiA+ICAg
Cj4gPj4gCQl9Cj4gPj4gCX0KPiA+PiAKPiA+PiArCW9vYnJlZ2lvbi0+bGVuZ3RoID0gbmV4dCAt
IG9vYnJlZ2lvbi0+b2Zmc2V0Owo+ID4+ICsKPiA+PiAJcmV0dXJuIDA7Cj4gPj4gfQo+ID4+ICAg
Cj4gPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4gTWlxdcOobCAgCj4gCj4gUmVnYXJkcywKPiDDgWx2
YXJvLgoKCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
