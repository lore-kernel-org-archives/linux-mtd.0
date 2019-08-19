Return-Path: <SRS0=wiZC=WP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68065C3A59B
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 09:22:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C3DE2184D
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Aug 2019 09:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="az3iOxFV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="osS0LYtr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C3DE2184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8FuJxSQwnTWBKVGLOwK1SjpWohH1J8xd1oK8UsU05g=; b=az3iOxFVcT8/wK
	W+KARGIMTsF+xvls/GesW4jVDhrbT9EZ5y3dmTkhJ0NuNd15HeJaAB2N4yMK+t58VvkpR5ul31pTk
	dJPjOkl7p/+BhMLGprb2cRMjR/Iy1PK6rWwwYyZRxg+7bG9pTSA8V3DbDppFpFNKzOo9AA8fWDYn0
	ss91dKfWa9SneUQw0hnoET49DN6AXv/yIWGTU18de81DeXQYiE60iZHq+hwToJxQuD0+mZlDGhxGn
	lfW7njmAnj5oWgD/hNCS6xy/tTrp1MMEFWVBF7ZTv0vhj8khMdU+K+Oi5H0l1IJwA4eAN2nHf+VzM
	YYUkAaFnxLOgCeyQ4n3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzdrI-0004rv-P2; Mon, 19 Aug 2019 09:21:48 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzdpb-0002kR-KH
 for linux-mtd@bombadil.infradead.org; Mon, 19 Aug 2019 09:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mo4fE9xiDwuq/JOARJXN4C1vT6elVtfNQseskBqQSyk=; b=osS0LYtr4hsZETXsIDwInsHjLF
 I2VqCp7tla7+tCQjdIRcOLT0tIuONE+wFoYEAcZFoPssC6ZXdPjlJHKDThoTIj7kBZenRY14EWIiu
 R4lalKDwmOqZsEKdUN29mfes1I1OhvTU/l34y+YLlARI3Y8O1nbgXYY5Z/piNwPVY/RueedlH/Yvd
 eZk+5qJXX19Q6KT1lY8CpD+KB+JnImqb521KqsQid0EeDgwUOS58xQtsmhSpX4CaFJL8oMqYRPNBl
 zmOe1CnB1dW9RJbXtUl1GMx9nC6qGC3djW8esZvWCA14cRfZCJpYTz5p5XL6lw0e1nFLGvElrof3v
 HeC52iZA==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzdpY-0002kj-JL
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2019 09:20:02 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 5038F20000C;
 Mon, 19 Aug 2019 09:19:19 +0000 (UTC)
Date: Mon, 19 Aug 2019 11:19:18 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH 6/8] mtd: spinand: micron: Turn driver
 implementation generic
Message-ID: <20190819111918.6be79570@xps13>
In-Reply-To: <MN2PR08MB5951F13BC1D1D111681CCB4BB8A80@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-7-sshivamurthy@micron.com>
 <20190807120408.031b8d1b@xps13>
 <MN2PR08MB5951F13BC1D1D111681CCB4BB8A80@MN2PR08MB5951.namprd08.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: Chuanhong Guo <gch981213@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jeff Kletsky <git-commits@allycomm.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgpJIG5lZWQgeW91ciBvcGluaW9uIG9uIHRoZSBxdWVzdGlvbiBiZWxvdy4KCiJT
aGl2YW11cnRoeSBTaGFzdHJpIChzc2hpdmFtdXJ0aHkpIiA8c3NoaXZhbXVydGh5QG1pY3Jvbi5j
b20+IHdyb3RlIG9uCk1vbiwgMTkgQXVnIDIwMTkgMDk6MDM6MzggKzAwMDA6Cgo+IEhpIE1pcXVl
bCwKPiAKPiA+IAo+ID4gSGkgU2hpdmEsCj4gPiAKPiA+IHNoaXZhLmxpbnV4d29ya3NAZ21haWwu
Y29tIHdyb3RlIG9uIE1vbiwgMjIgSnVsIDIwMTkgMDc6NTY6MTkgKzAyMDA6Cj4gPiAgIAo+ID4g
PiBGcm9tOiBTaGl2YW11cnRoeSBTaGFzdHJpIDxzc2hpdmFtdXJ0aHlAbWljcm9uLmNvbT4KPiA+
ID4gIAo+ID4gCj4gPiBJIGFtIG5vdCBzdXJlIHRoZSAidHVybiBpbXBsZW1lbmF0YXRpb24gZ2Vu
ZXJpYyIgdGl0bGUgZGVzY3JpYmVzIHdoYXQKPiA+IHlvdSBkby4KPiA+ICAgCj4gPiA+IERyaXZl
ciBpcyByZWRlc2lnbmVkIHVzaW5nIHBhcmFtZXRlciBwYWdlIHRvIHN1cHBvcnQgTWljcm9uIFNQ
SSBOQU5ECj4gPiA+IGZsYXNoZXMuICAKPiA+IAo+ID4gUmVkZXNpZ25lZCBpcyBwZXJoYXBzIGEg
Yml0IHRvbyBtdWNoLgo+ID4gCj4gPiAiICAKPiA+ID4gVGhlIHJlYXNvbiB3aHkgc3BpbmFuZF9z
ZWxlY3Rfb3BfdmFyaWFudCBnbG9iYWxpemVkIGlzIHRoYXQgdGhlIE1pY3Jvbgo+ID4gPiBkcml2
ZXIgbm8gbG9uZ2VyIGNhbGxpbmcgc3BpbmFuZF9tYXRjaF9hbmRfaW5pdC4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogU2hpdmFtdXJ0aHkgU2hhc3RyaSA8c3NoaXZhbXVydGh5QG1pY3Jvbi5j
b20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jICAgfCAgMiAr
LQo+ID4gPiAgZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgfCA2MSArKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLSAgCj4gPiAtLS0gIAo+ID4gPiAgaW5jbHVkZS9saW51eC9tdGQv
c3BpbmFuZC5oICAgfCAgNCArKysKPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9u
cygrKSwgMTggZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9uYW5kL3NwaS9jb3JlLmMgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3JlLmMKPiA+ID4gaW5k
ZXggN2FlNzZkYWI5MTQxLi5hYWU3MTVkMzg4YjcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
bXRkL25hbmQvc3BpL2NvcmUuYwo+ID4gPiArKysgYi9kcml2ZXJzL210ZC9uYW5kL3NwaS9jb3Jl
LmMKPiA+ID4gQEAgLTkyMCw3ICs5MjAsNyBAQCBzdGF0aWMgdm9pZCBzcGluYW5kX21hbnVmYWN0
dXJlcl9jbGVhbnVwKHN0cnVjdCAgCj4gPiBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkgIAo+ID4g
PiAgCQlyZXR1cm4gc3BpbmFuZC0+bWFudWZhY3R1cmVyLT5vcHMtPmNsZWFudXAoc3BpbmFuZCk7
Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKgo+
ID4gPiArY29uc3Qgc3RydWN0IHNwaV9tZW1fb3AgKgo+ID4gPiAgc3BpbmFuZF9zZWxlY3Rfb3Bf
dmFyaWFudChzdHJ1Y3Qgc3BpbmFuZF9kZXZpY2UgKnNwaW5hbmQsCj4gPiA+ICAJCQkgIGNvbnN0
IHN0cnVjdCBzcGluYW5kX29wX3ZhcmlhbnRzICp2YXJpYW50cykKPiA+ID4gIHsKPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL21pY3Jvbi5jICAKPiA+IGIvZHJpdmVycy9t
dGQvbmFuZC9zcGkvbWljcm9uLmMgIAo+ID4gPiBpbmRleCA5NWJjNTI2NGViYzEuLjZmZGU5M2Vj
MjNhMSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiA+
ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiA+ID4gQEAgLTkwLDIyICs5
MCwxMCBAQCBzdGF0aWMgaW50IG1pY3Jvbl9lY2NfZ2V0X3N0YXR1cyhzdHJ1Y3QgIAo+ID4gc3Bp
bmFuZF9kZXZpY2UgKnNwaW5hbmQsICAKPiA+ID4gIAlyZXR1cm4gLUVJTlZBTDsKPiA+ID4gIH0K
PiA+ID4KPiA+ID4gLXN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1pY3Jvbl9zcGlu
YW5kX3RhYmxlW10gPSB7Cj4gPiA+IC0JU1BJTkFORF9JTkZPKCJNVDI5RjJHMDFBQkFHRCIsIDB4
MjQsCj4gPiA+IC0JCSAgICAgTkFORF9NRU1PUkcoMSwgMjA0OCwgMTI4LCA2NCwgMjA0OCwgNDAs
IDIsIDEsIDEpLAo+ID4gPiAtCQkgICAgIE5BTkRfRUNDUkVRKDgsIDUxMiksCj4gPiA+IC0JCSAg
ICAgU1BJTkFORF9JTkZPX09QX1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLAo+ID4gPiAt
CQkJCQkgICAgICAmd3JpdGVfY2FjaGVfdmFyaWFudHMsCj4gPiA+IC0JCQkJCSAgICAgICZ1cGRh
dGVfY2FjaGVfdmFyaWFudHMpLAo+ID4gPiAtCQkgICAgIDAsCj4gPiA+IC0JCSAgICAgU1BJTkFO
RF9FQ0NJTkZPKCZtaWNyb25fb29ibGF5b3V0X29wcywKPiA+ID4gLQkJCQkgICAgIG1pY3Jvbl9l
Y2NfZ2V0X3N0YXR1cykpLAo+ID4gPiAtfTsKPiA+ID4gLSAgCj4gPiAKPiA+IEkgZG9uJ3Qga25v
dyBpZiBpdCBpcyB3aXNlIHRvIGRyb3AgdGhpcyBzdHJ1Y3R1cmUuCj4gPiAgIAo+ID4gPiAgc3Rh
dGljIGludCBtaWNyb25fc3BpbmFuZF9kZXRlY3Qoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kKQo+ID4gPiAgewo+ID4gPiArCWNvbnN0IHN0cnVjdCBzcGlfbWVtX29wICpvcDsKPiA+ID4g
IAl1OCAqaWQgPSBzcGluYW5kLT5pZC5kYXRhOwo+ID4gPiAtCWludCByZXQ7Cj4gPiA+Cj4gPiA+
ICAJLyoKPiA+ID4gIAkgKiBNaWNyb24gU1BJIE5BTkQgcmVhZCBJRCBuZWVkIGEgZHVtbXkgYnl0
ZSwKPiA+ID4gQEAgLTExNCwxNiArMTAyLDU1IEBAIHN0YXRpYyBpbnQgbWljcm9uX3NwaW5hbmRf
ZGV0ZWN0KHN0cnVjdCAgCj4gPiBzcGluYW5kX2RldmljZSAqc3BpbmFuZCkgIAo+ID4gPiAgCWlm
IChpZFsxXSAhPSBTUElOQU5EX01GUl9NSUNST04pCj4gPiA+ICAJCXJldHVybiAwOwo+ID4gPgo+
ID4gPiAtCXJldCA9IHNwaW5hbmRfbWF0Y2hfYW5kX2luaXQoc3BpbmFuZCwgbWljcm9uX3NwaW5h
bmRfdGFibGUsCj4gPiA+IC0JCQkJICAgICBBUlJBWV9TSVpFKG1pY3Jvbl9zcGluYW5kX3RhYmxl
KSwgIAo+ID4gaWRbMl0pOwo+ID4gCj4gPiBJIGFtIG5vdCBzdXJlIHRoaXMgaXMgdGhlIHJpZ2h0
IHNvbHV0aW9uLiBJIHdvdWxkIGtlZXAgdGhpcyBjYWxsIGFuZAo+ID4gb3ZlcndyaXRlIHdoYXQg
eW91IG5lZWQgdG8gb3ZlcndyaXRlIHdpdGggdGhlIGZpeHVwIGhvb2suCj4gPiAgIAo+IAo+IFRo
ZW4sIEkgd2lsbCBoYXZlIGR1bW15IHN0cnVjdHVyZSBsaWtlIGJlbG93Lgo+IAo+IHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1pY3Jvbl9zcGluYW5kX3RhYmxlW10gPSB7ICAgICAg
ICAgICAgICAgICAgICAgIAo+ICAgICAgICAgU1BJTkFORF9JTkZPKE5VTEwsIDAsICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAKPiAgICAgICAgICAgICAgICAgICAgICBOQU5EX01FTU9SRygwLCAwLCAwLCAwLCAwLCAwLCAw
LCAwLCAwKSwgICAgICAgICAgIAo+ICAgICAgICAgICAgICAgICAgICAgIE5BTkRfRUNDUkVRKDAs
IDApLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgCj4gICAgICAgICAgICAgICAgICAgICAgU1BJTkFORF9JTkZPX09Q
X1ZBUklBTlRTKCZyZWFkX2NhY2hlX3ZhcmlhbnRzLCAgICAgICAgICAgICAgCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50
cywgICAgICAgICAgICAgCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZ1cGRhdGVfY2FjaGVfdmFyaWFudHMpLCAgICAgICAgICAgCj4gICAgICAgICAgICAg
ICAgICAgICAgMCwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+ICAgICAgICAgICAg
ICAgICAgICAgIFNQSU5BTkRfRUNDSU5GTygmbWljcm9uX29vYmxheW91dF9vcHMsICAgICAgICAg
ICAgICAgICAgICAgIAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtaWNy
b25fZWNjX2dldF9zdGF0dXMpKSwgICAgICAgICAgICAgICAgICAgIAo+IH07ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgCj4gCj4gTGV0IG1lIGtub3cgaWYgeW91IGFyZSB0aGlu
a2luZyBmb3IgZGlmZmVyZW50IGFwcHJvYWNoLgo+IAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
