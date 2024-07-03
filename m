Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1FDC30653
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2024 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joTWB2Gyl739IpSiOEQ+T46S4Q1Y2z6OYMlxnOLmd0M=; b=DafkRD/pJpTmSo
	92FN3PzSeQkmXB96HsCDCGLkbUG3xsPOhe+GTImI2OAbbTXenZ1uk5O7j68TSo4VJHnbcft21bjZ+
	nT6CTJnwnSBm9O6DD731rP61mVuo0xm+oPqU4yzytPCt8d5oeUQJP4oHigPiFVwG6ZVaiJEUz9je6
	BexR5LHwes+QE3WAQsSwcpFxAAdntaYhzeBixh+vPIvOj2xRUouZw35zgVXuM+wFhsByIHCGMHnyX
	3WhqhCD+j1ouE9O3aKnhRJsS1SNagYQQ+1crbDKxFc6St/0y2TiBnf0b/RL4W9Wy1L8PKEBfk/Ujp
	Kt51RiIMPNMqBIGBHCqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Ob-0000000AYPh-2NOu;
	Wed, 03 Jul 2024 14:55:45 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1OY-0000000AYME-3gMD
	for linux-mtd@lists.infradead.org;
	Wed, 03 Jul 2024 14:55:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C4973240005;
	Wed,  3 Jul 2024 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720018537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cRYZ45OF53fIrCFZk+IUAjejhzMX236LoAYLsLRpLZk=;
	b=ZXue8dpzx9QdMyd8LRoQUb/7UbyLfMrk+hX3cf1A0pyQAyFBwnsgQKAre+XaulYP2oKdhM
	Qmr7nTOzM9UUTdkmUSw1tD7AolEcBzH3QSwGHX/ZCUFPWOyR77D7TDIrsQLORP21I/KUzx
	f6SUIdob4e14/NjRLmC7N667Px6Vi0p9KAy4SJtIOuUs4SqzBVrnxhy5aYJMvUbPa0mjrl
	MxR80FL/+pOoHz9etBHoWM2GTiu0ezQ8prsIeDdjDQQzM4EJOD0VK4DSsbhcxGHdiTQRoF
	XwIIbww8P7cLaJBqlP5zTv1f0fpVFNdUbGTwACkvdKKgni0kQqKsMfUbKGrhtg==
Date: Wed, 3 Jul 2024 16:55:34 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Greg Ungerer <gerg@kernel.org>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Stefan Agner <stefan@agner.ch>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] arch: m68k: Add definitions for flash NFC
 support
Message-ID: <20240703165534.699d238a@xps-13>
In-Reply-To: <a9c34972-a933-49f4-98e4-cbcc321022e2@kernel.org>
References: <20240627-upstream-nfc-mcf5441x-v2-0-312929d09ee5@yoseli.org>
	<20240627-upstream-nfc-mcf5441x-v2-1-312929d09ee5@yoseli.org>
	<20240628094511.75cc9c78@xps-13>
	<b974df45-daf5-4156-8532-cf9e2be8bdfa@yoseli.org>
	<a9c34972-a933-49f4-98e4-cbcc321022e2@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075543_204128_7F6747E1 
X-CRM114-Status: GOOD (  29.94  )
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

SGkgR3JlZywKCmdlcmdAa2VybmVsLm9yZyB3cm90ZSBvbiBXZWQsIDMgSnVsIDIwMjQgMjM6MzA6
MDkgKzEwMDA6Cgo+IE9uIDMvNy8yNCAwMjo0NCwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3JvdGU6
Cj4gPiBIaSBNaXF1ZWwsCj4gPiAKPiA+IE9uIDI4LzA2LzIwMjQgMDk6NDUsIE1pcXVlbCBSYXlu
YWwgd3JvdGU6ICAKPiA+PiBIaSBKZWFuLU1pY2hlbCAmIEdlZXJ0LAo+ID4+Cj4gPj4gamVhbm1p
Y2hlbC5oYXV0Ym9pc0B5b3NlbGkub3JnIHdyb3RlIG9uIFRodSwgMjcgSnVuIDIwMjQgMTg6MDU6
MjggKzAyMDA6Cj4gPj4gIAo+ID4+PiBBZGQgYSBmZXcgZGVmaW5pdGlvbnMsIGFzIHRoZSBiYXNl
IGFkZHJlc3MgZm9yIHRoZSBORkMgZm9yIHRoZSBNNTQ0MXguCj4gPj4+Cj4gPj4+IFNpZ25lZC1v
ZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWljaGVsLmhhdXRib2lzQHlvc2VsaS5v
cmc+Cj4gPj4+IC0tLQo+ID4+PiDCoCBhcmNoL202OGsvaW5jbHVkZS9hc20vbTU0NDF4c2ltLmgg
fCA3ICsrKysrKysKPiA+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+ID4+
Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQxeHNpbS5oIGIv
YXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQxeHNpbS5oCj4gPj4+IGluZGV4IGY0OGNmNjNiZDc4
Mi4uZDRlZTFlYWI3YzRhIDEwMDY0NAo+ID4+PiAtLS0gYS9hcmNoL202OGsvaW5jbHVkZS9hc20v
bTU0NDF4c2ltLmgKPiA+Pj4gKysrIGIvYXJjaC9tNjhrL2luY2x1ZGUvYXNtL201NDQxeHNpbS5o
Cj4gPj4+IEBAIC05OSw2ICs5OSw3IEBACj4gPj4+IMKgICNkZWZpbmUgTUNGSU5UMl9QSVQxwqDC
oMKgwqDCoMKgwqAgMTQKPiA+Pj4gwqAgI2RlZmluZSBNQ0ZJTlQyX1BJVDLCoMKgwqDCoMKgwqDC
oCAxNQo+ID4+PiDCoCAjZGVmaW5lIE1DRklOVDJfUElUM8KgwqDCoMKgwqDCoMKgIDE2Cj4gPj4+
ICsjZGVmaW5lIE1DRklOVDJfTkZDwqDCoMKgwqDCoMKgwqAgMjUKPiA+Pj4gwqAgI2RlZmluZSBN
Q0ZJTlQyX1JUQ8KgwqDCoMKgwqDCoMKgIDI2Cj4gPj4+IMKgIC8qCj4gPj4+IEBAIC0zMzMsNCAr
MzM0LDEwIEBACj4gPj4+IMKgICNkZWZpbmUgTUNGX0lSUV9CT0ZGMcKgwqDCoMKgwqDCoMKgIChN
Q0ZJTlQxX1ZFQ0JBU0UgKyBNQ0ZJTlQxX0ZMRVhDQU4xX0JPRkYpCj4gPj4+IMKgICNkZWZpbmUg
TUNGX0lSUV9FUlIxwqDCoMKgwqDCoMKgwqAgKE1DRklOVDFfVkVDQkFTRSArIE1DRklOVDFfRkxF
WENBTjFfRVJSKQo+ID4+PiArLyoKPiA+Pj4gKyAqIEZsYXNoIG1vZHVsZQo+ID4+PiArICovCj4g
Pj4+ICsjZGVmaW5lIE1DRl9ORkNfQkFTRcKgwqDCoMKgwqDCoMKgIDB4ZmMwZmMwMDAKPiA+Pj4g
KyNkZWZpbmUgTUNGX05GQ19TSVpFwqDCoMKgwqDCoMKgwqAgKDB4ZmMwZmZmM2IgLSAweGZjMGZj
MDAwKQo+ID4+PiArI2RlZmluZSBNQ0ZfTkZDX0lTUsKgwqDCoMKgwqDCoMKgIChNQ0ZJTlQyX1ZF
Q0JBU0UgKyBNQ0ZJTlQyX05GQykgIAo+ID4+Cj4gPj4gSSdtIHNvcnJ5IGJ1dCB0aGlzIGZlZWxz
IHJlYWxseSBiYWNrd2FyZHMuIFBsYXRmb3JtIGRhdGEgYXMgQwo+ID4+IHN0cnVjdHVyZXMgYXJl
IGFscmVhZHkgbGVnYWN5LCBidXQgZGVmaW5pbmcgdGhlc2UgaW5mb3JtYXRpb24gaW4KPiA+PiBz
b21lIGFyY2ggaGVhZGVycyBhbmQgdXNpbmcgdGhlbSBkaXJlY3RseSBmcm9tIGRyaXZlcnMgcmVh
bGx5IHNlZW1zCj4gPj4gZXZlbiAid3JvbmdlciIgdG8gbWUuIFdoYXQncyB0aGUgbWlkL2xvbmcg
dGVybSBwbGFuIGZvciB0aGlzPyBJZiB0aGUKPiA+PiBwbGF0Zm9ybXMgYXJlIHN0aWxsIGluIHVz
ZSB0b2RheSBhbmQgbmVlZCB0byBiZSBtYWludGFpbmVkLCB3aHkgbm90Cj4gPj4gZmluYWxseSBl
bmFibGluZyBkZXZpY2UgdHJlZSBzdXBwb3J0PyBJIGtub3cgaXQncyBoYXJkZXIgdG8gZG8gdGhh
biB0bwo+ID4+IHNheSwgYnV0IEknZCBsaWtlIHNvbWUgcmVhbGx5IGdvb2QgZXhwbGFuYXRpb24g
b24gd2h5IHdlIHNob3VsZCBhY2NlcHQKPiA+PiB0byBkbyB0aGlzIGluIDIwMjQgYmVjYXVzZSBp
dCBmZWVscyByYXRoZXIgaW5hZGVxdWF0ZS4gIAo+ID4gCj4gPiBUaGFua3MgZm9yIHlvdXIgcmV2
aWV3ICEKPiA+IAo+ID4gSSBhZ3JlZSB3aXRoIHlvdSBpdCBpcyBsZWdhY3kuIEkgdXNlIGEgbG90
IG9mIEFSTSBwbGF0Zm9ybXMgYW5kIGRldmljZS10cmVlIGlzIGluZGVlZCBncmVhdC4gVGhvdWdo
LCBzd2l0Y2hpbmcgdGhlIG02OGsgYXJjaGl0ZWN0dXJlIHRvIHVzZSB0aGlzIHNvdW5kcyByZWFs
bHkgdG91Z2guCj4gPiAKPiA+IEkgd2lsbCBvYnZpb3VzbHkgbGV0IEdlZXJ0IGFuZCBtYXliZSBv
dGhlcnMgYW5zd2VyLCBidXQgbXkgZmVlbGluZyBpcyBpdCBpcyBub3QgcmVhbGx5IHdvcnRoIGl0
IHRvIGltcGxlbWVudCB0aGUgZHRzIG9uIHRob3NlIHBsYXRmb3JtcyBhcmUgdGhleSBhcmUgbm90
IHRoYXQgdXNlZCAoY29tcGFyZWQsIGFnYWluLCB0byBBUk0gZm9yIGluc3RhbmNlKS4gIAo+IAo+
IEl0IHdvdWxkIGJlIG5pY2UgdG8gdXNlIGRldmljZXRyZWVzIG9uIENvbGRGaXJlLCBidXQgSSBh
bSBub3QgYXdhcmUgb2YgYW55b25lCj4gY3VycmVudGx5IHdvcmtpbmcgb24gaXQuIFNvIEkgZG9u
J3QgdGhpbmsgd2Ugd2lsbCBzZWUgaXQgYW55IHRpbWUgc29vbi4KPiBTbyBjdXJyZW50bHkgYWxs
IHN1cHBvcnRlZCBDb2xkRmlyZSBwZXJpcGhlcmFscyBhcmUgImxlZ2FjeSIgYW5kIHVzZSB0aGUK
PiBvbGQgcGxhdGZvcm0gbW9kZWwuCgpJdCdzIG5vdCB0aGUgb2xkIHBsYXRmb3JtIG1vZGVsLCBp
dCBpcyBvbGRlciB0aGFuIHRoZSBvbGQgcGxhdGZvcm0KbW9kZWwuIFRoaXMgc2VyaWVzIGhhcmRj
b2RlcyBhIHBoeXNpY2FsIG9mZnNldCBpbiBhIGRyaXZlci4gV2UgYXJlIG5vdApldmVuIHRhbGtp
bmcgYWJvdXQgYSBDIHN0cnVjdHVyZSBkZWZpbmluZyBwbGF0Zm9ybSBkYXRhLgoKPiA+IEFGQUlL
IHRoZSBwbGF0Zm9ybSBkYXRhIGlzIG5vdCBvZmZpY2lhbHkgY29uc2lkZXJlZCBkZXByZWNhdGVk
ID8gQXMgaXQgY29uY2VybnMgYSBmZXcgcGxhdGZvcm1zIG91dCB0aGVyZS4uLiAgCj4gCj4gQ2Vy
dGFpbmx5IG5vdCBvZmZpY2lhbGx5IGRlcHJlY2F0ZWQuIG02OGsgaW4gYWxsIGl0cyBmb3JtcyBp
cyBjdXJyZW50bHkgd2VsbCBtYWludGFpbmVkCj4gKGlmIG5vdCBuZWNlc3NhcmlseSBhIGxvdCBv
ZiBuZXcgZGV2ZWxvcG1lbnQpLgoKVGhlIHBsYXRmb3JtIGlzIG5vdCBkZXByZWNhdGVkLCBpdCBp
cyBldmVuIG1haW50YWluZWQsIGJ1dCBzYXlpbmcgdGhhdApoYXJkd2FyZSBzdXBwb3J0IHVzaW5n
IHBsYWluIEMgc3RydWN0dXJlcyBhbmQgbWFjaGluZSBkcml2ZXJzIGlzCmRlcHJlY2F0ZWQgZG9l
c24ndCBodXJ0IG1lLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
