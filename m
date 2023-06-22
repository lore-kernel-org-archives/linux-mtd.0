Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D73EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 21:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTmAhEig3yjsvrz+o1/DSFdmhk6dldSNGbHoum3T90Q=; b=tHNBsTQMUUwR3+
	GF9yJoP4mN8YiKXwZH9kAAhwmwa03oEW1AeUmwot1SVFZ3lsp6Y85qJw58AQyse70R5g5wH1Mh0uU
	o79JVmoKXERCDlGY7N7FwWoZX48w3I/Lx3j3/DRkJ9atBMd1LVUS36J/Gsn+RMMWRzMGGqQEOyoWS
	kweaZznufG/wH3by3c9svFCBtiFh0XR0icwYoFkRM20GOZtaLhSlOSbWxNZjwsunkZJ0AUgIqODCu
	gYCJRhnEQdwhdZN7BlEi2dG7krMyy3Lk7gp0LkaVFqqLXoMFeeSF5zDNvZtC7pzP1wnOnjJOKQJO3
	XVmUQnR9RPWgnbICWbIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRbD-001o6D-1P;
	Thu, 22 Jun 2023 21:12:15 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCRbA-001o5G-1e
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 21:12:14 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687468329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LXBxOv1Qdi/653r8JWnE7xZVB+XwwXdkMsVpgvCzHXU=;
	b=k2piV+cLuTvDlgE87x4z2kY+aBB/gmNFXIyObeNGw1itlklPaDxubdseOGG6BFjvit0sLd
	dM/BypL0YNGEIEtzW7pfANDrK/uAMx6N19CSDD4MmuJq4DTHgzKki22lbwtHrswUumRaan
	383RT/5waaTpF7vJ+rMbKZdbgCwCZn859fubslCFCOw56CiEpyHlF0Lq9Td2bV20QxPQ9/
	73e9E8FQEiMspuXKy02bgTH2InEfMiYPeJA4f8K5O8ljYJMdBe9HQPRK/YFvEjQVCbBI0K
	08bCH7wipxbFfAFOtcn3H3C+94Yjrl4PdgG3zLuGWIJMYRN/JC/8KOWkgHY0/A==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08EE5240006;
	Thu, 22 Jun 2023 21:12:05 +0000 (UTC)
Date: Thu, 22 Jun 2023 23:12:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Julien Su <juliensu@mxic.com.tw>, Jaime
 Liao <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, JaimeLiao
 <jaimeliao.tw@gmail.com>
Subject: Re: [PATCH v2 3/3] mtd: rawnand: Support for sequential cache reads
Message-ID: <20230622231202.42646e4c@xps-13>
In-Reply-To: <yw1xfs6j4k6q.fsf@mansr.com>
References: <20230112093637.987838-1-miquel.raynal@bootlin.com>
	<20230112093637.987838-4-miquel.raynal@bootlin.com>
	<yw1xfs6j4k6q.fsf@mansr.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_141212_809750_A41C8415 
X-CRM114-Status: GOOD (  28.06  )
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

SGkgTcOlbnMsCgptYW5zQG1hbnNyLmNvbSB3cm90ZSBvbiBUaHUsIDIyIEp1biAyMDIzIDE1OjU5
OjI1ICswMTAwOgoKPiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPiB3
cml0ZXM6Cj4gCj4gPiBGcm9tOiBKYWltZUxpYW8gPGphaW1lbGlhby50d0BnbWFpbC5jb20+Cj4g
Pgo+ID4gQWRkIHN1cHBvcnQgZm9yIHNlcXVlbnRpYWwgY2FjaGUgcmVhZHMgZm9yIGNvbnRyb2xs
ZXJzIHVzaW5nIHRoZSBnZW5lcmljCj4gPiBjb3JlIGhlbHBlcnMgZm9yIHRoZWlyIGZhc3QgcmVh
ZC93cml0ZSBoZWxwZXJzLgo+ID4KPiA+IFNlcXVlbnRpYWwgcmVhZHMgbWF5IHJlZHVjZSB0aGUg
b3ZlcmhlYWQgd2hlbiBhY2Nlc3NpbmcgcGh5c2ljYWxseQo+ID4gY29udGludW91cyBkYXRhIGJ5
IGxvYWRpbmcgaW4gY2FjaGUgdGhlIG5leHQgcGFnZSB3aGlsZSB0aGUgcHJldmlvdXMKPiA+IHBh
Z2UgZ2V0cyBzZW50IG91dCBvbiB0aGUgTkFORCBidXMuCj4gPgo+ID4gVGhlIE9ORkkgc3BlY2lm
aWNhdGlvbiBwcm92aWRlcyB0aGUgZm9sbG93aW5nIGFkZGl0aW9uYWwgY29tbWFuZHMgdG8KPiA+
IGhhbmRsZSBzZXF1ZW50aWFsIGNhY2hlZCByZWFkczoKPiA+Cj4gPiAqIDB4MzEgLSBSRUFEIENB
Q0hFIFNFUVVFTlRJQUw6Cj4gPiAgIFJlcXVpcmVzIHRoZSBOQU5EIGNoaXAgdG8gbG9hZCB0aGUg
bmV4dCBwYWdlIGludG8gY2FjaGUgd2hpbGUga2VlcGluZwo+ID4gICB0aGUgY3VycmVudCBjYWNo
ZSBhdmFpbGFibGUgZm9yIGhvc3QgcmVhZHMuCj4gPiAqIDB4M0YgLSBSRUFEIENBQ0hFIEVORDoK
PiA+ICAgVGVsbHMgdGhlIE5BTkQgY2hpcCB0aGlzIGlzIHRoZSBlbmQgb2YgdGhlIHNlcXVlbnRp
YWwgY2FjaGUgcmVhZCwgdGhlCj4gPiAgIGN1cnJlbnQgY2FjaGUgc2hhbGwgcmVtYWluIGFjY2Vz
c2libGUgZm9yIHRoZSBob3N0IGJ1dCBubyBtb3JlCj4gPiAgIGludGVybmFsIGNhY2hlIGxvYWRp
bmcgb3BlcmF0aW9uIGlzIHJlcXVpcmVkLgo+ID4KPiA+IE9uIHRoZSBidXMsIGEgbXVsdGkgcGFn
ZSByZWFkIG9wZXJhdGlvbiBpcyBjdXJyZW50bHkgaGFuZGxlZCBsaWtlIHRoaXM6Cj4gPgo+ID4g
CTAwIC0tIEFERFIxIC0tIDMwIC0tIFdBSVRfUkRZICh0Uit0UlIpIC0tIERBVEExX0lOCj4gPiAJ
MDAgLS0gQUREUjIgLS0gMzAgLS0gV0FJVF9SRFkgKHRSK3RSUikgLS0gREFUQTJfSU4KPiA+IAkw
MCAtLSBBRERSMyAtLSAzMCAtLSBXQUlUX1JEWSAodFIrdFJSKSAtLSBEQVRBM19JTgo+ID4KPiA+
IFNlcXVlbnRpYWwgY2FjaGVkIHJlYWRzIG1heSBpbnN0ZWFkIGJlIGFjaGlldmVkIHdpdGg6Cj4g
Pgo+ID4gCTAwIC0tIEFERFIxIC0tIDMwIC0tIFdBSVRfUkRZICh0UikgLS0gXAo+ID4gCQkgICAg
ICAgMzEgLS0gV0FJVF9SRFkgKHRSQ0JTWSt0UlIpIC0tIERBVEExX0lOIFwKPiA+IAkJICAgICAg
IDMxIC0tIFdBSVRfUkRZICh0UkNCU1krdFJSKSAtLSBEQVRBMl9JTiBcCj4gPiAJCSAgICAgICAz
RiAtLSBXQUlUX1JEWSAodFJDQlNZK3RSUikgLS0gREFUQTNfSU4KPiA+Cj4gPiBCZWxvdyBhcmUg
dGhlIHJlYWQgc3BlZWQgdGVzdCByZXN1bHRzIHdpdGggcmVndWxhciByZWFkcyBhbmQKPiA+IHNl
cXVlbnRpYWwgY2FjaGVkIHJlYWRzLCBvbiBOWFAgaS5NWDYgVkFSLVNPTS1TT0xPIGluIG1hcHBp
bmcgbW9kZSB3aXRoCj4gPiBhIE5BTkQgY2hpcCBjaGFyYWN0ZXJpemVkIHdpdGggdGhlIGZvbGxv
d2luZyB0aW1pbmdzOgo+ID4gKiB0UjogMjAgwrVzCj4gPiAqIHRSQ0JTWTogNSDCtXMKPiA+ICog
dFJSOiAyMCBucwo+ID4gYW5kIHRoZSBmb2xsb3dpbmcgZ2VvbWV0cnk6Cj4gPiAqIGRldmljZSBz
aXplOiAyIE1pQgo+ID4gKiBlcmFzZWJsb2NrIHNpemU6IDEyOCBraUIKPiA+ICogcGFnZSBzaXpl
OiAyIGtpQgo+ID4KPiA+ID09PT09PT09PT09PT0gTm9ybWFsIHJlYWQgQCAzM01IeiA9PT09PT09
PT09PT09PT09PQo+ID4gbXRkX3NwZWVkdGVzdDogZXJhc2VibG9jayByZWFkIHNwZWVkIGlzIDE1
NjMzIEtpQi9zCj4gPiBtdGRfc3BlZWR0ZXN0OiBwYWdlIHJlYWQgc3BlZWQgaXMgMTU1MTUgS2lC
L3MKPiA+IG10ZF9zcGVlZHRlc3Q6IDIgcGFnZSByZWFkIHNwZWVkIGlzIDE1Mzk4IEtpQi9zCj4g
PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+
Cj4gPiA9PT09PT09PT0gU2VxdWVudGlhbCBjYWNoZSByZWFkIEAgMzNNSHogPT09PT09PT09PT0K
PiA+IG10ZF9zcGVlZHRlc3Q6IGVyYXNlYmxvY2sgcmVhZCBzcGVlZCBpcyAxODI4NSBLaUIvcwo+
ID4gbXRkX3NwZWVkdGVzdDogcGFnZSByZWFkIHNwZWVkIGlzIDE1ODc1IEtpQi9zCj4gPiBtdGRf
c3BlZWR0ZXN0OiAyIHBhZ2UgcmVhZCBzcGVlZCBpcyAxNjI1MyBLaUIvcwo+ID4gPT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPgo+ID4gV2Ugb2Jz
ZXJ2ZSBhbiBvdmVyYWxsIHNwZWVkIGltcHJvdmVtZW50IG9mIGFib3V0IDUlIHdoZW4gcmVhZGlu
Zwo+ID4gMiBwYWdlcywgdXAgdG8gMTUlIHdoZW4gcmVhZGluZyBhbiBlbnRpcmUgYmxvY2suIFRo
aXMgaXMgZHVlIHRvIHRoZQo+ID4gfjE0dXMgZ2FpbiBvbiBlYWNoIGFkZGl0aW9uYWwgcGFnZSBy
ZWFkICh0UiAtICh0UkNCU1kgKyB0UlIpKS4KPiA+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBN
aXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogSmFpbWVMaWFvIDxqYWltZWxpYW8udHdAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNlLmMgfCAxMTkgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLQo+ID4gIGluY2x1ZGUvbGludXgvbXRkL3Jhd25hbmQuaCAgICAgIHwgICA5ICsrKwo+
ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pICAK
PiAKPiBUaGlzIGNoYW5nZSBicm9rZSBzb21ldGhpbmcgb24gYSBUSSBBTTM1MTcgYmFzZWQgc3lz
dGVtLiAgV2hhdCBJJ20KPiBub3RpY2luZyBpcyB0aGF0IHRoZSB1LWJvb3QgZndfc2V0ZW52IHRv
b2wgaXMgZmFpbGluZyBkdWUgdG8gdGhlCj4gTUVNR0VUQkFEQkxPQ0sgaW9jdGwgcmVwb3J0aW5n
IHNvbWUgYmxvY2tzIGFzIGJhZCB3aGVuIHRoZXkgYXJlIG5vdC4KPiBFdmVyeXRoaW5nIGVsc2Ug
aXMsIHNvbWVob3csIHdvcmtpbmcgZmluZS4gIFJldmVydGluZyB0aGlzIGNvbW1pdCBmaXhlcwo+
IGl0LCB0aG91Z2ggSSBkb24ndCBrbm93IHdoeS4gIEknbSBzZWVpbmcgdGhlIHNhbWUgYmVoYXZp
b3VyIG9uIG11bHRpcGxlCj4gZGV2aWNlcywgc28gSSBkb3VidCB0aGVyZSBpcyBhIHByb2JsZW0g
d2l0aCB0aGUgZmxhc2ggbWVtb3J5Lgo+IAo+IElzIHRoZXJlIGFueXRoaW5nIEkgY2FuIHRlc3Qg
dG8gZ2V0IG1vcmUgaW5mb3JtYXRpb24/Cj4gCgpNYXkgSSBrbm93IHdoYXQgTkFORCBjaGlwIHlv
dSBhcmUgdXNpbmc/CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
