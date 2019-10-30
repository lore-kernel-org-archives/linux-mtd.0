Return-Path: <SRS0=8kzJ=YX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B262CA9EC5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 13:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248E92080F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Oct 2019 13:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OfDS15Fz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 248E92080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVSQJ0cE+hgAXwH7ZR7MwYxssUj8I7t4kXbkbVg0PcY=; b=OfDS15FzKTfowY
	l/RFu6mrv1fNsi1zJ62XMIC94lYquxkLAEOxWGdSuSL9wMd/FMIbHucSXNUvNRBD/RkHhmokLwvDc
	AwJXvy5dPcXftFzNi3YdRnq/UrP1Ch9jKWqKpLhs8tN9JasZs+v4rL+FsRr9btKseSFlFUnsNZ5aq
	tL0nAiNfTBfmx75xS5z830UQOwW4YQrLeVOu0hMi4MXhjGRp5I6cljXVEV+SoFy6Nx5TmjozNZUTG
	iGak4A23NUSFbrzILlTynaypTohF87ZVdppGJmSk68/tcpq4W80m+GeEyWv4qpXLDUnVWJ7Q9C9Ul
	xWszEt07YIJRQK/HmD/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPo6k-00085n-Sj; Wed, 30 Oct 2019 13:33:54 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPo6h-00085J-UX
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2019 13:33:53 +0000
X-Originating-IP: 91.217.168.176
Received: from xps13 (unknown [91.217.168.176])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id B2CED4000D;
 Wed, 30 Oct 2019 13:33:38 +0000 (UTC)
Date: Wed, 30 Oct 2019 14:33:37 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Saurav Girepunje <saurav.girepunje@gmail.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1] mtd: devices: phram.c: Fix multiple kfree statement
 from phram_setup
Message-ID: <20191030143337.159ff861@xps13>
In-Reply-To: <CAEZuxTSjS=0CP0+tJOst23pX+-g1cXoDcX1Jemz+8s4NTokKUg@mail.gmail.com>
References: <20191029170849.GA6279@saurav> <20191030092036.38cf4f11@xps13>
 <CAEZuxTSjS=0CP0+tJOst23pX+-g1cXoDcX1Jemz+8s4NTokKUg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_063352_122543_C926ECCA 
X-CRM114-Status: GOOD (  22.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgU2F1cmF2LAoKU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2LmdpcmVwdW5qZUBnbWFpbC5jb20+
IHdyb3RlIG9uIFdlZCwgMzAgT2N0IDIwMTkKMTY6NTc6MDYgKzA1MzA6Cgo+IEFyZSB5b3UgYSBy
b2JvdD8KPiBObwo+IAo+IFRoYW5rcyBmb3IgeW91IGlucHV0LiBXaWxsIGRvcnAgdGhpcyBwYXRj
aCBpZiB5b3UgYXJlIG5vdCBjb252aW5jZWQgZm9yCj4gY2hhbmdlcy4KPiAKPiBEdWUgdG8geW91
ciBzdWdnZXN0aW9ucyBvbmx5IEkgbGVhcm5lZCBob3cgdG8gYWRkIHZlcnNpb24gYW5kIGNoYW5n
ZSBsb2cgaW4KPiBwYXRjaCBmaWxlLiBIb3dldmVyIEkgZGlkIG1pc3Rha2UgaW4gdGhpcyBwYXRj
aCB2ZXJzaW9uIGFuZCBjaGFuZ2UgbG9nIGJ1dAo+IEkgbGVhcm5lZCBhYm91dCBpdC5CZWZvcmUg
c2VuZGluZyB0aGlzIEkgd2FzIHRvdGFsbHkgdW5hd2FyZSBhYm91dCB0aGVzZQo+IHRoaW5ncy4K
PiAKPiBUaGFua3MgYWdhaW4gZm9yIHlvdXIgaGVscC4uLi4KCk9rIHRoZW4gcGxlYXNlIGhhdmUg
YSBsb29rIGF0IHRoaXMsIGZpcnN0OgpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9s
YXRlc3Qvc291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0
CgpBbmQgcGxlYXNlIG1ha2Ugc3VyZSB5b3UgYWRkcmVzcyB0aGUgY29tbWVudHMuIEkgdG9sZCB5
b3UgdG8gZml4IGEKdHlwbywgeW91IGFkZGVkIGl0IGluIHlvdXIgY2hhbmdlbG9nIGJ1dCB5b3Ug
Zm9yZ290IHRvIGFjdHVhbGx5IGRvIHRoZQpjaGFuZ2UuIFBsZWFzZSBkbyBub3QgaHVycnkgd2hl
biB5b3Ugd2FudCB0byBzdWJtaXQgY2hhbmdlcyBhbmQgcmVyZWFkCnRoZW0gYmVmb3JlIGFjdHVh
bGx5IHNlbmRpbmcgdGhlbS4KCj4gCj4gT24gV2VkLCAzMCBPY3QsIDIwMTksIDE6NTAgUE0gTWlx
dWVsIFJheW5hbCwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gd3JvdGU6Cj4gCj4gPiBT
YXVyYXYsCj4gPgo+ID4gU2F1cmF2IEdpcmVwdW5qZSA8c2F1cmF2LmdpcmVwdW5qZUBnbWFpbC5j
b20+IHdyb3RlIG9uIFR1ZSwgMjkgT2N0IDIwMTkKPiA+IDIyOjM4OjQ5ICswNTMwOgo+ID4KPiA+
IEFyZSB5b3UgYSByb2JvdD8KPiA+ICAKPiA+ID4gUmVtb3ZlIG11bHRpcGxlIGtmcmVlIHN0YXRl
bWVudCBmcm9tIHBocmFtX3NldHVwKCkgaW4gcGhyYW0uYyAgCj4gPgo+ID4gVGhpcyBkb2VzIG5v
dCBkZXNjcmliZSB3aGF0IHlvdSBhcmUgZG9pbmcsIHlvdSBkb24ndCByZW1vdmUgdGhlbSB5b3UK
PiA+IGZhY3Rvcml6ZSB0aGVtLiBBbmQgaG9uZXN0bHkgSSBhbSBub3QgY29udmluY2VkIHRoaXMg
Y2hhbmdlIGlzIHVzZWZ1bAo+ID4gaW4gb2xkIGNvZGUuCj4gPiAgCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFNhdXJhdiBHaXJlcHVuamUgPHNhdXJhdi5naXJlcHVuamVAZ21haWwuY29tPgo+
ID4gPiAtLS0KPiA+ID4KPiA+ID4gQ2hhbmdlIGluIHYxOiAgCj4gPgo+ID4gWW91ciBmaXJzdCB2
ZXJzaW9uIGlzIHYxLCBob3cgY2FuIHlvdSBiZSBhdCB2MT8gSXQgaXMgYWxtb3N0IHYzIGFscmVh
ZHkhCj4gPiAgCj4gPiA+Cj4gPiA+IC0gQWRkIGNoYW5nZSBzdWdnZXN0ZWQgYnkgTWlxdWVsIFJh
eW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiA+ID4gICAiVGhlIGdvdG8gc3RhdGVt
ZW50IHNob3VsZCBub3QgZGVzY3JpYmUgZnJvbSB3aGVyZSBpdCBpcyBjYWxsZWQgYnV0IHRoZQo+
ID4gPiAgICBhY3Rpb24gaXQgaXMgc3VwcG9zZWQgdG8gdGFrZS4gJ2dvdG8gZnJlZV9uYW07JyB3
b3VsZCBiZSBiZXR0ZXIuIiAgCj4gPgo+ID4gVGhpcyBpcyBhIGNvcHkvcGFzdGUgb2Ygd2hhdCBJ
IGhhdmUgc2FpZC4gV2hhdCBJIHdhbnQgeW91IHRvIHdyaXRlIGlzOgo+ID4KPiA+ICIKPiA+IC0g
UmVuYW1lIHRoZSBnb3RvIHN0YXRlbWVudCB0byBkZXNjcmliZSBibGEgYmxhIGJsYS4KPiA+IC0g
Rml4IHRoZSB0eXBvIGluIHRoZSBnb3RvIGxhYmVsLgo+ID4gIgo+ID4gIAo+ID4gPgo+ID4gPiAg
ZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jIHwgOCArKysrLS0tLQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYyBiL2RyaXZlcnMvbXRkL2RldmljZXMv
cGhyYW0uYwo+ID4gPiBpbmRleCBjNDY3Mjg2Y2EwMDcuLjM4Zjk1YTE1MTdhYyAxMDA2NDQKPiA+
ID4gLS0tIGEvZHJpdmVycy9tdGQvZGV2aWNlcy9waHJhbS5jCj4gPiA+ICsrKyBiL2RyaXZlcnMv
bXRkL2RldmljZXMvcGhyYW0uYwo+ID4gPiBAQCAtMjQzLDIyICsyNDMsMjIgQEAgc3RhdGljIGlu
dCBwaHJhbV9zZXR1cChjb25zdCBjaGFyICp2YWwpCj4gPiA+Cj4gPiA+ICAgICAgIHJldCA9IHBh
cnNlX251bTY0KCZzdGFydCwgdG9rZW5bMV0pOwo+ID4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiA+
IC0gICAgICAgICAgICAga2ZyZWUobmFtZSk7Cj4gPiA+ICAgICAgICAgICAgICAgcGFyc2VfZXJy
KCJpbGxlZ2FsIHN0YXJ0IGFkZHJlc3NcbiIpOwo+ID4gPiArICAgICAgICAgICAgIGdvdG8gZnJl
ZV9uYW07ICAKPiA+Cj4gPiBDb21lIG9uZS4uLgo+ID4KPiA+Cj4gPiBUaGFua3MsCj4gPiBNaXF1
w6hsCj4gPiAgCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
