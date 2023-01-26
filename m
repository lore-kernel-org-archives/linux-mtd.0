Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CFEC54E94
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Jan 2023 08:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNhwixMWbeMxOWL/dShKa4mkdtswudsyiFOFwvSRBLA=; b=GaJ9v3B/Pr7o1g
	Uvt0sBrauP+igYzaemndYqn3q2uBu7SFewR14Bjl7MGnlrtevpjANhCRO3HkxfsCYXvDlOfkpFt+G
	ECbH6KP99YkGmnS61KcYUU85q5fXwPr/Y8/5pq8sepRAx2NaYMvdK0b4vmEbuS4D7ioVNAIM7UFSc
	a1hBYpyI786Wf4XZcPoK7H+Hy7YqfPjVtZnR4exKvv8D6seK3UkucQh1u6Z27/6xd2Bis/0/nyGVu
	86fsmPIeYveYHoraH7RNVA+2mNdW/SooWLf2sv44C7PoJVlPo/XKY2wkF5tXHGVOaVK8WHVEjLu8U
	IhVj9dgzJ8zloOHbGA5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxws-00A6OS-Sc; Thu, 26 Jan 2023 08:49:35 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxqK-00A3n4-1R
	for linux-mtd@lists.infradead.org; Thu, 26 Jan 2023 08:42:50 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B17EA20005;
	Thu, 26 Jan 2023 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1674722563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GKvBFREFo1QxDB3p3koRcJ3KYeBE1Z7zOVPCpCgnJw=;
	b=UMgrjHYZJLOSxOIO3K0m8noVCN/wyuNDocyKz7+we+Zq6FOYY4dwxXHj25wprcKRY8ixfg
	r6rmp4HS/GJMFL/gdaZ93dPnw7/fDumwaiX/Zr2kAmVkvITTSUj8FuhX5U/puES65hnLZt
	5V7RM1kddA/bz2ng/h4gT1N1fXtrPx4pvvLuelQJUCiQoUnpD4bF76goHSPzHUImqZikug
	t+EHad9OJX0ZiMS9hVVJ4k7PRaAnTrpv9QZGkSnrWOgJXEBd910JjDnECTRZG/0zdg/rmA
	oqc4ulbkPM1RgG1b7K7tYD5N3vxtRYVEt6uwtPoOLi/S3amexNgjeeo2BBLm0Q==
Date: Thu, 26 Jan 2023 09:42:40 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-mtd@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Marek Vasut <marex@denx.de>, Francesco
 Dolcini <francesco.dolcini@toradex.com>, u-boot@lists.denx.de
Subject: Re: [PATCH v4] mtd: parsers: ofpart: add workaround for #size-cells
 0
Message-ID: <20230126094240.158fd4f4@xps-13>
In-Reply-To: <Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
References: <20230124104444.330913-1-francesco@dolcini.it>
	<Y8/7k1HHjJbHvWDB@kroah.com>
	<Y9GZ8c9VDXC582IA@francesco-nb.int.toradex.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_004248_418615_E3CECEB9 
X-CRM114-Status: GOOD (  39.52  )
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

SGkgR3JlZywKCmZyYW5jZXNjb0Bkb2xjaW5pLml0IHdyb3RlIG9uIFdlZCwgMjUgSmFuIDIwMjMg
MjI6MDY6NTcgKzAxMDA6Cgo+IEhlbGxvIE1pcXVlbCwgR3JlZyBhbmQgYWxsCj4gCj4gT24gVHVl
LCBKYW4gMjQsIDIwMjMgYXQgMDQ6Mzg6NTlQTSArMDEwMCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdy
b3RlOgo+ID4gT24gVHVlLCBKYW4gMjQsIDIwMjMgYXQgMTE6NDQ6NDRBTSArMDEwMCwgRnJhbmNl
c2NvIERvbGNpbmkgd3JvdGU6ICAKPiA+ID4gRnJvbTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5j
ZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPgo+ID4gPiAKPiA+ID4gQWRkIGEgbWVjaGFuaXNtIHRv
IGhhbmRsZSB0aGUgY2FzZSBpbiB3aGljaCBwYXJ0aXRpb25zIGFyZSBwcmVzZW50IGFzCj4gPiA+
IGRpcmVjdCBjaGlsZCBvZiB0aGUgbmFuZCBjb250cm9sbGVyIG5vZGUgYW5kICNzaXplLWNlbGxz
IGlzIHNldCB0byA8MD4uCj4gPiA+IAo+ID4gPiBUaGlzIGNvdWxkIGhhcHBlbiBpZiB0aGUgbmFu
ZC1jb250cm9sbGVyIG5vZGUgaW4gdGhlIERUUyBpcyBzdXBwb3NlZCB0bwo+ID4gPiBoYXZlICNz
aXplLWNlbGxzIHNldCB0byAwLCBidXQgZm9yIHNvbWUgaGlzdG9yaWNhbCByZWFzb24vYnVnIGl0
IHdhcyBzZXQKPiA+ID4gdG8gMSBpbiB0aGUgcGFzdCwgYW5kIHRoZSBmaXJtd2FyZSAoZS5nLiBV
LUJvb3QpIGlzIGFkZGluZyB0aGUgcGFydGl0aW9uCj4gPiA+IGFzIGRpcmVjdCBjaGlsZHJlbiBv
ZiB0aGUgbmFuZC1jb250cm9sbGVyIGRlZmF1bHRpbmcgdG8gI3NpemUtY2VsbHMKPiA+ID4gYmVp
bmcgdG8gMS4KPiA+ID4gCj4gPiA+IFRoaXMgcHJldmVudHMgYSByZWFsIGJvb3QgZmFpbHVyZSBv
biBjb2xpYnJpLWlteDcgdGhhdCBoYXBwZW5lZCBkdXJpbmcgdjYuMQo+ID4gPiBkZXZlbG9wbWVu
dCBjeWNsZXMuCj4gPiA+IAo+ID4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
WTRkZ0JUR05XcE02U1FYSUBmcmFuY2VzY28tbmIuaW50LnRvcmFkZXguY29tLwo+ID4gPiBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjEyMDIwNzE5MDAuMTE0Mzk1MC0xLWZy
YW5jZXNjb0Bkb2xjaW5pLml0Lwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY2VzY28gRG9sY2lu
aSA8ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+ID4gPiAtLS0KPiA+
ID4gSSBkbyBub3QgZXhwZWN0IHRoaXMgcGF0Y2ggdG8gYmUgYmFja3BvcnRlZCB0byBzdGFibGUs
IGhvd2V2ZXIgSSB3b3VsZCBleHBlY3QKPiA+ID4gdGhhdCB3ZSBkbyBub3QgYmFja3BvcnQgbmFu
ZC1jb250cm9sbGVyIGR0cyBjbGVhbnVwcyBuZWl0aGVyLgo+ID4gPiAKPiA+ID4gdjQ6Cj4gPiA+
ICBmaXhlZCB3cm9uZyBFbmdsaXNoIHNwZWxsaW5nIGluIHRoZSBjb21tZW50Cj4gPiA+IAo+ID4g
PiB2MzoKPiA+ID4gIG1pbm9yIGZvcm1hdHRpbmcgY2hhbmdlLCByZW1vdmVkIG5vdCBuZWVkZWQg
bmV3LWxpbmUgYW5kIHNwYWNlLiAKPiA+ID4gCj4gPiA+IHYyOgo+ID4gPiAgZml4dXAgc2l6ZS1j
ZWxscyBvbmx5IHdoZW4gcGFydGl0aW9ucyBhcmUgZGlyZWN0IGNoaWxkcmVuIG9mIHRoZSBuYW5k
LWNvbnRyb2xsZXIKPiA+ID4gIGNvbXBsZXRlbHkgcmV2aXNlZCBjb21taXQgbWVzc2FnZSwgY29t
bWVudHMgYW5kIHdhcm5pbmcgcHJpbnQKPiA+ID4gIHVzZSBwcl93YXJuIGluc3RlYWQgb2YgcHJf
d2Fybl9vbmNlCj4gPiA+ICBhZGRlZCBSZXZpZXdlZC1ieSBHcmVnCj4gPiA+ICByZW1vdmVkIGNj
OnN0YWJsZUAgYW5kIGZpeGVzIHRhZywgc2luY2UgdGhlIHByb2JsZW1hdGljIGNvbW1pdCB3YXMg
cmV2ZXJ0ZWQKPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL210ZC9wYXJzZXJzL29mcGFydF9jb3Jl
LmMgfCAxOSArKysrKysrKysrKysrKysrKysrCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5z
ZXJ0aW9ucygrKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3BhcnNlcnMv
b2ZwYXJ0X2NvcmUuYyBiL2RyaXZlcnMvbXRkL3BhcnNlcnMvb2ZwYXJ0X2NvcmUuYwo+ID4gPiBp
bmRleCAxOTIxOTBjNDJmYzguLmU3YjhlOWQwYTkxMCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVy
cy9tdGQvcGFyc2Vycy9vZnBhcnRfY29yZS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3BhcnNl
cnMvb2ZwYXJ0X2NvcmUuYwo+ID4gPiBAQCAtMTIyLDYgKzEyMiwyNSBAQCBzdGF0aWMgaW50IHBh
cnNlX2ZpeGVkX3BhcnRpdGlvbnMoc3RydWN0IG10ZF9pbmZvICptYXN0ZXIsCj4gPiA+ICAKPiA+
ID4gIAkJYV9jZWxscyA9IG9mX25fYWRkcl9jZWxscyhwcCk7Cj4gPiA+ICAJCXNfY2VsbHMgPSBv
Zl9uX3NpemVfY2VsbHMocHApOwo+ID4gPiArCQlpZiAoIWRlZGljYXRlZCAmJiBzX2NlbGxzID09
IDApIHsKPiA+ID4gKwkJCS8qCj4gPiA+ICsJCQkgKiBUaGlzIGlzIGEgdWdseSB3b3JrYXJvdW5k
IHRvIG5vdCBjcmVhdGUKPiA+ID4gKwkJCSAqIHJlZ3Jlc3Npb24gb24gZGV2aWNlcyB0aGF0IGFy
ZSBzdGlsbCBjcmVhdGluZwo+ID4gPiArCQkJICogcGFydGl0aW9ucyBhcyBkaXJlY3QgY2hpbGRy
ZW4gb2YgdGhlIG5hbmQgY29udHJvbGxlci4KPiA+ID4gKwkJCSAqIFRoaXMgY2FuIGhhcHBlbiBp
biBjYXNlIHRoZSBuYW5kIGNvbnRyb2xsZXIgbm9kZSBoYXMKPiA+ID4gKwkJCSAqICNzaXplLWNl
bGxzIGVxdWFsIHRvIDAgYW5kIHRoZSBmaXJtd2FyZSAoZS5nLgo+ID4gPiArCQkJICogVS1Cb290
KSBqdXN0IGFkZCB0aGUgcGFydGl0aW9ucyB0aGVyZSBhc3N1bWluZwo+ID4gPiArCQkJICogMzIt
Yml0IGFkZHJlc3NpbmcuCj4gPiA+ICsJCQkgKgo+ID4gPiArCQkJICogSWYgeW91IGdldCB0aGlz
IHdhcm5pbmcgeW91ciBmaXJtd2FyZSBhbmQvb3IgRFRTCj4gPiA+ICsJCQkgKiBzaG91bGQgYmUg
cmVhbGx5IGZpeGVkLgo+ID4gPiArCQkJICoKPiA+ID4gKwkJCSAqIFRoaXMgaXMgd29ya2luZyBv
bmx5IGZvciBkZXZpY2VzIHNtYWxsZXIgdGhhbiA0R2lCLgo+ID4gPiArCQkJICovCj4gPiA+ICsJ
CQlwcl93YXJuKCIlczogb2ZwYXJ0IHBhcnRpdGlvbiAlcE9GICglcE9GKSAjc2l6ZS1jZWxscyBp
cyB3cm9uZ2x5IHNldCB0byA8MD4sIGFzc3VtaW5nIDwxPiBmb3IgcGFyc2luZyBwYXJ0aXRpb25z
LlxuIiwKPiA+ID4gKwkJCQltYXN0ZXItPm5hbWUsIHBwLCBtdGRfbm9kZSk7ICAKPiA+IAo+ID4g
VGhpcyBpcyBhIGRyaXZlciwgYWx3YXlzIHVzZSBkZXZfKigpIGNhbGxzLCBub3QgcHJfKigpIGNh
bGxzIHNvIHRoYXQgd2UKPiA+IGtub3cgd2hhdCBpcyBiZWluZyByZWZlcnJlZCB0byBleGFjdGx5
LiAgCj4gCj4gSXMgdGhpcyByZWFzb25hYmxlIGhlcmU/IFdoZXJlIGNhbiBJIGdldCB0aGUgc3Ry
dWN0IGRldmljZT8KPiAKPiBJbiBnZW5lcmFsIHRoaXMgZmlsZSB1c2VzIG9ubHkgcHJfKiBkZWJ1
ZyBBUEkgYW5kIG1lc3NhZ2VzIGFyZSBhYm91dCBPRgo+IG5vZGVzL3Byb3BlcnRpZXMsIG5vdCBh
Ym91dCBhIGRldmljZS4KCkknbSBhbHNvIHNrZXB0aWNhbCBoZXJlLCB0aGlzIGlzIG5vdCBhIGRl
dmljZSBkcml2ZXIsIGl0J3MgYSBnZW5lcmljCnBhcnNlciBhbmQgaXQgc2VlbXMgbW9yZSBhcHBy
b3ByaWF0ZSB0byB3YXJuIGFib3V0IGFuIG9mIG5vZGUgcmF0aGVyCnRoYW4gYSBzdHJ1Y3QgZGV2
aWNlLgoKTVREIGRldmljZXMgaW5oZXJpdCBmcm9tIHN0cnVjdCBkZXZpY2UgKG10ZC0+ZGV2KSB3
aGljaCBJIGd1ZXNzCm1pZ2h0IGJlIHVzZWQgaGVyZS4gVGhlIGJ1cyBpbmZyYXN0cnVjdHVyZSBk
ZXZpY2UKKG10ZC0+ZGV2aWNlLT5wYXJlbnRzKSBpcyBsZXNzIGFwcHJvcHJpYXRlIGFzIGl0IHNv
bWV0aW1lcyBwb2ludHMgYXQgdGhlCmNvbnRyb2xsZXIgKHJhdyBOQU5EKSBhbmQgc29tZXRpbWVz
IGF0IHRoZSBzcGkgZGV2aWNlIChTUEktTkFORCwgU1BJCk5PUikuCgpwcl93YXJuIGlzIGZpbmUg
aGVyZSBJTUhPLCBidXQgaWYgR3JlZyBpbnNpc3QsIHN3aXRjaCBpdCB0byBkZXZfd2FybiwgSQpk
b24ndCBtaW5kLiBNYXliZSBpdCBpcyB3b3J0aCB0ZXN0aW5nIHRoYXQgZGV2X3dhcm4gc3RpbGwg
ZGlzcGxheXMgYW4KZWFzeS10by11bmRlcnN0YW5kIG1lc3NhZ2UgaW4gdGhhdCBjYXNlLgoKPiA+
IEkgdGFrZSBiYWNrIG15ICJyZXZpZXdlZC1ieSIgbGluZSBhYm92ZSwgcGxlYXNlIGZpeCB0aGlz
IHVwIHRvIG5vdCBuZWVkCj4gPiBwcl93YXJuLCBidXQgdG8gdXNlIGRldl93YXJuKCkgaW5zdGVh
ZC4gIAo+IAo+IEZyYW5jZXNjbwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
