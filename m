Return-Path: <SRS0=Ud6c=HD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5553C433E6
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:15:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5639E64EA0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Feb 2021 15:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5639E64EA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hCBvaKRPinLQrJ4UYULvs01oUPXHmuz5XqhWvYF2Jns=; b=1uzJgVQUVY0WZRWjc3ydDoSY5
	wFcGEi5IfnY18QkdhkhrSGegxYVfZgqhXyoF/WE/1MlMidV7S4zAG61POcvdnvvLspXOOCHqax9SS
	EFi3a+88GDurIrVL3RP3ntJYhG4iK54XI1YUZNl5/v6SGsRNQzIldruMEWV9QaSo6OyiAcnFdzpv9
	DMR7wA4t8jBVuBqMKhPcqBm1dKMKzKck9GQMzVdnxdNKS7UNYlP6TjkbaDbSu38NJG/x54IE5+f+V
	cH/332wurGd3q98AclS/CiIeg5MVJ2OS6JmkFllebQa0MXBodBXWFRVNLzGW6lIkOp9SM6UXA2QRL
	sR+bfvPCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6aua-0002yM-EB; Mon, 01 Feb 2021 15:14:44 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6auX-0002wZ-7E
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2021 15:14:42 +0000
Received: from xps13 (lfbn-tou-1-972-150.w86-210.abo.wanadoo.fr
 [86.210.203.150]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9A515240007;
 Mon,  1 Feb 2021 15:14:34 +0000 (UTC)
Date: Mon, 1 Feb 2021 16:14:33 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20210201161433.0c4ff0e3@xps13>
In-Reply-To: <CAOf5uwnXB-2xXXXxvH9Fo3ngscccA5Hv7iNTbUYRNFs_iLGJqw@mail.gmail.com>
References: <89ae32a0-9b19-4735-90eb-4ffa22aad704@kernel.org>
 <20190802145109.00c4a4eb@collabora.com>
 <b739696d-bb1d-bb04-cd45-3019712e29ad@kernel.org>
 <20190808183651.7c0962e7@collabora.com>
 <694cb2ac-68e6-72b1-3d55-e405b176a17f@kernel.org>
 <20190809082356.0cf60555@collabora.com>
 <ce7157e2-a8d0-7204-4003-8a711acb65b8@kernel.org>
 <20190809093235.09d89e20@collabora.com>
 <c5af9334-f679-6fc9-4d2a-1366a295598a@kernel.org>
 <20190809155934.40c43f29@collabora.com>
 <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
 <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
 <20210201151335.210af8ca@xps13>
 <CAOf5uwkivHhMX_mPJymBZxQge_wc4K1p_1S3gsQYHPV40aaj3w@mail.gmail.com>
 <CAOf5uwnXB-2xXXXxvH9Fo3ngscccA5Hv7iNTbUYRNFs_iLGJqw@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_101441_450079_9DCEAB5C 
X-CRM114-Status: GOOD (  32.13  )
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
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Greg Ungerer <gerg@kernel.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk1pY2hhZWwgTmF6emFyZW5vIFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxh
c29sdXRpb25zLmNvbT4gd3JvdGUgb24KTW9uLCAxIEZlYiAyMDIxIDE2OjA4OjIzICswMTAwOgoK
PiBIaQo+IAo+IE9uIE1vbiwgRmViIDEsIDIwMjEgYXQgMzozMiBQTSBNaWNoYWVsIE5henphcmVu
byBUcmltYXJjaGkKPiA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gSGkKPiA+Cj4gPiBPbiBNb24sIEZlYiAxLCAyMDIxIGF0IDM6MTMgUE0gTWlxdWVsIFJheW5h
bCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6ICAKPiA+ID4KPiA+ID4gSGkgTWlj
aGFlbCwKPiA+ID4KPiA+ID4gTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIDxtaWNoYWVsQGFt
YXJ1bGFzb2x1dGlvbnMuY29tPiB3cm90ZSBvbgo+ID4gPiBTYXQsIDMwIEphbiAyMDIxIDEwOjQx
OjI5ICswMTAwOgo+ID4gPiAgCj4gPiA+ID4gSGkgTWlxdWVsCj4gPiA+ID4KPiA+ID4gPiBjb21t
aXQgZjhlNmFkMTQzODgwNjdmOTFiMjZkMDQ0MTg1ZDk1NjIzZmJjOTUzNQo+ID4gPiA+IEF1dGhv
cjogTWljaGFlbCBUcmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gPiA+
ID4gRGF0ZTogICBGcmkgSmFuIDI5IDA4OjQ2OjUzIDIwMjEgKzAxMDAKPiA+ID4gPgo+ID4gPiA+
ICAgICBtdGQ6IG5hbmQ6IENhbGN1bGF0ZSB0aGUgY2xvY2sgYmVmb3JlIGVuYWJsZSBpdAo+ID4g
PiA+Cj4gPiA+ID4gICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVs
QGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+ID4gPiA+ICAgICBDaGFuZ2UtSWQ6IEk3OWIwZGEzOWRl
MGE5YjMyZWEwYjAwMmZhMjAwZDdmNDRkNGY4Y2U3Cj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGliLmMKPiA+ID4gPiBiL2Ry
aXZlcnMvbXRkL25hbmQvcmF3L2dwbWktbmFuZC9ncG1pLWxpYi5jCj4gPiA+ID4gaW5kZXggMzIy
YTAwODI5MGU1Li4wYmNhNTJiM2JjOGYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvZ3BtaS1uYW5kL2dwbWktbGliLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3Jhdy9ncG1pLW5hbmQvZ3BtaS1saWIuYwo+ID4gPiA+IEBAIC0zNzcsNiArMzc3LDcgQEAg
c3RhdGljIHZvaWQgZ3BtaV9uZmNfY29tcHV0ZV90aW1pbmdzKHN0cnVjdAo+ID4gPiA+IGdwbWlf
bmFuZF9kYXRhICp0aGlzLAo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5ncyAqc2RyKQo+ID4gPiA+ICB7Cj4gPiA+
ID4gICAgICAgICBzdHJ1Y3QgZ3BtaV9uZmNfaGFyZHdhcmVfdGltaW5nICpodyA9ICZ0aGlzLT5o
dzsKPiA+ID4gPiArICAgICAgIHN0cnVjdCByZXNvdXJjZXMgKnIgPSAmdGhpcy0+cmVzb3VyY2Vz
Owo+ID4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50IGRsbF90aHJlc2hvbGRfcHMgPSB0aGlzLT5k
ZXZkYXRhLT5tYXhfY2hhaW5fZGVsYXk7Cj4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgcGVy
aW9kX3BzLCByZWZlcmVuY2VfcGVyaW9kX3BzOwo+ID4gPiA+ICAgICAgICAgdW5zaWduZWQgaW50
IGRhdGFfc2V0dXBfY3ljbGVzLCBkYXRhX2hvbGRfY3ljbGVzLCBhZGRyX3NldHVwX2N5Y2xlczsK
PiA+ID4gPiBAQCAtNDQwLDYgKzQ0MSw4IEBAIHN0YXRpYyB2b2lkIGdwbWlfbmZjX2NvbXB1dGVf
dGltaW5ncyhzdHJ1Y3QKPiA+ID4gPiBncG1pX25hbmRfZGF0YSAqdGhpcywKPiA+ID4gPiAgICAg
ICAgICAgICAgICAgaHctPmN0cmwxbiB8PSBCRl9HUE1JX0NUUkwxX1JETl9ERUxBWShzYW1wbGVf
ZGVsYXlfZmFjdG9yKSB8Cj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQk1f
R1BNSV9DVFJMMV9ETExfRU5BQkxFIHwKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAodXNlX2hhbGZfcGVyaW9kID8gQk1fR1BNSV9DVFJMMV9IQUxGX1BFUklPRCA6IDApOwo+
ID4gPiA+ICsKPiA+ID4gPiArICAgICAgIGNsa19zZXRfcmF0ZShyLT5jbG9ja1swXSwgaHctPmNs
a19yYXRlKTsKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+ID4gIHZvaWQgZ3BtaV9uZmNfYXBwbHlf
dGltaW5ncyhzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMpCj4gPiA+ID4gQEAgLTQ0OSw4ICs0
NTIsNiBAQCB2b2lkIGdwbWlfbmZjX2FwcGx5X3RpbWluZ3Moc3RydWN0IGdwbWlfbmFuZF9kYXRh
ICp0aGlzKQo+ID4gPiA+ICAgICAgICAgdm9pZCBfX2lvbWVtICpncG1pX3JlZ3MgPSByLT5ncG1p
X3JlZ3M7Cj4gPiA+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgZGxsX3dhaXRfdGltZV91czsKPiA+
ID4gPgo+ID4gPiA+IC0gICAgICAgY2xrX3NldF9yYXRlKHItPmNsb2NrWzBdLCBody0+Y2xrX3Jh
dGUpOwo+ID4gPiA+IC0KPiA+ID4gPiAgICAgICAgIHdyaXRlbChody0+dGltaW5nMCwgZ3BtaV9y
ZWdzICsgSFdfR1BNSV9USU1JTkcwKTsKPiA+ID4gPiAgICAgICAgIHdyaXRlbChody0+dGltaW5n
MSwgZ3BtaV9yZWdzICsgSFdfR1BNSV9USU1JTkcxKTsKPiA+ID4gPgo+ID4gPiA+IFJpZ2h0IG5v
dyBJIGhhdmUgdGhpcyBjaGFuZ2UgYXBwbGllZCBhbmQgc2VlbXMgZmluZS4gVGhhdCBpcyB0aGUg
b25seQo+ID4gPiA+IGRpZmZlcmVuY2UgSSBnZXQuIENsb2NrIGlzIGFwcGx5IGEgYml0IGVhcmxp
ZXIgdGhhdCB3aGVuIGlzIGVuYWJsZWQKPiA+ID4gPiBpdC4gIAo+ID4gPgo+ID4gPiBUaGlzIGlz
IHZlcnkgaW50ZXJlc3RpbmcuIFNvIHRoaXMgd291bGQgbWVhbiB0aGUgaXNzdWUgeW91IGFyZQo+
ID4gPiBleHBlcmllbmNpbmcgY29tZXMgZnJvbSB0aGUgY2xvY2sgZHJpdmVyIHdoaWNoIGtpbmQg
b2YgcmV0dXJucyB0b28KPiA+ID4gZWFybHkgZnJvbSBjbGtfc2V0X3JhdGUoKT8gQ291bGQgeW91
IHJlcG9ydCB0aGlzIHRvIHRoZSBjbGsgTUwvTlhQIGNsawo+ID4gPiBtYWludGFpbmVycyBhbmQg
a2VlcCB1cyBpbiBjb3B5PyBJZiBpdCBpcyBhcyBnbG9iYWwgYXMgaXQgc291bmRzLCB3ZQo+ID4g
PiBtaWdodCBub3QgYmUgdGhlIG9ubHkgb25lcyBhZmZlY3RlZC4KPiA+ID4gIAo+ID4KPiA+IFRo
ZSBpbXgyOCBpcyBicm9rZW4gdG9vLCBzbyBpdCdzIGEgZ2VuZXJhbCBwcm9ibGVtLiBJIG5lZWQg
dG8gdHJhY2UgaXQgZG93bgo+ID4gSSBoYXZlIGEgcmV2ZXJ0aW5nIGZvciBsdHMgYnV0IGl0XHMg
bm90IHRoZSB3YXkgdG8gZ28KPiA+ICAKPiAKPiBGb3IgaW14MjggeW91IGFzayB0byBzZXQgdGhl
IHJhdGUgdG8gMjJNaHogYnV0IHlvdSBkb24ndCBjYXJlIGFib3V0IHRoZSBjbG9jawo+IHRoYXQg
eW91IGdldCBiYWNrLiBZb3UgZ2V0IGJhY2sgMTJNaHogYmVjYXVzZSB0aGUgYmFzZSBjbG9jayBp
cyAyNCBNaHogYW5kIHNlZW1zCj4gdGhhdCBpdCBjYW4gbm90IGdldCB0aGUgcG9pbnQuIFlvdSBu
ZWVkIHRvIGNoZWNrIGlmIHRoZSBjbG9jawo+IHJlcXVlc3RlZCBpcyBpbiByYW5nZSBvciBhc2sK
PiBmb3Igc2V0X3JhdGVfY2xrX21pbiB0byBhdm9pZCB0byBoYXZlIHNvbWVudGhpbmcgbG93ZXIu
IFRoZW4gZm9yCj4gaW14NnVsbCBiZWNhdXNlIGlzIHNwb3JhZGljCj4gSSB0aGluayB0aGF0IGlz
IG1vcmUgY29ubmVjdGVkIHRvIHRoZSBjbGtfc2V0X3JhdGUgYW5kIHdoZW4geW91IGNoYW5nZQo+
IHRoZSByZWdpc3Rlci4gQ2FuIG5vdCBiZSBhCj4gc2V0dGluZyB0aW1lPwoKU28sIGlmIEkgdW5k
ZXJzdGFuZCBjb3JyZWN0bHksIHdlIGZhY2UgdHdvIGRpZmZlcmVudCBwcm9ibGVtczoKLSBpbXg2
Kjogc2VlbXMgbGlrZSBhIGNsb2NrIGlzc3VlIHJlZ2FyZGluZyB0aGUgY2xvY2sgc2V0dGxlbWVu
dAotIGlteDI4OiBhY3R1YWwgTkFORCBkcml2ZXIgaXNzdWUgKGRvZXMgbm90IGNoZWNrIHRoZSB2
YWxpZGl0eSBvZiB0aGUKICBuZXcgZnJlcXVlbmN5KS4gVGhpcyBzaG91bGQgYmUgaGFuZGxlZCBw
cm9wZXJseSBpbgogIC0+c2V0dXBfaW50ZXJmYWNlKCkuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
