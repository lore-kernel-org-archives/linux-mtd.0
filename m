Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3802BF3092A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Mar 2026 09:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRO+7xrYvdQn4CMTfdsRwhD3kv5NemocI//fetHWJ9A=; b=dLDAy6Gj1Q0JyH
	g0uwZjr5ta+jSuhHG0BqUd45QqV0d9EC+J2+UdpKozo9rwJUnGwSWcgGSg5NBOD7uiovtMAmfLwgs
	RRyuIDAruTzxWVPaVBp9Q+KaiAe5XgKWDckr1jeDVQKaGWMhzGgUiHPrGD22+Bn+0slq/wA3IDdWI
	wz507Icwf7sPzgRbGRQ86g+cCgB6uLXgNUGbM6hCWaLN6CNMRSvuT0KLvhJNhz53/07obZtJKy4N+
	rqMCHWeD+H3NJaHgjYSzh10usApOAO7Ln8mGCw3xeAOL9WusDrN7QRHklSzGoa3F+UH9TgYbijQVR
	zA8UauJSfyln0aQ5b2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5F4-00000001Qhv-1ren;
	Thu, 05 Mar 2026 09:43:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5F2-00000001Qhf-3xG2
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=sb47bLopwDRLC5J3uAYZg0LFklpkyKvQunefwmeTams=; b=b8dnDa0q9B3EuURt3CpttxG30z
	bQHzPW18QzbUtLaKWZ7mfccFFNfn7lNjEsV/mQDRlB8ybOuXxcdNh/9XD3Qp8C3Z7Bwbo+QvePj0z
	zLTp2xOd4UCvtVV2DfhGDCdn3hLXwVf/7o6zjsZNdwJ1C9x898PdyukvlntsHrYStLzSdNi/WgTD8
	f41LdbGXOglUulva87EQjRXLEdufNnHEib5qFSILgmjifCtAjqlyybNQKyVBIjTpm4mjlJDkU2B6l
	1O1q9HfKJbSH6gZu5WXv76BWI4T3X44yUSeQeox6hiH1svfwPpvJlX5mKmTPlAKwCGvVr//BekxmE
	xM1ffyjg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5Ez-0000000ElZW-2J4z
	for linux-mtd@lists.infradead.org;
	Thu, 05 Mar 2026 09:43:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 33EC04E42566;
	Thu,  5 Mar 2026 09:43:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3A955FDEB;
	Thu,  5 Mar 2026 09:43:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3CF8F103697F1;
	Thu,  5 Mar 2026 10:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772703808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=sb47bLopwDRLC5J3uAYZg0LFklpkyKvQunefwmeTams=;
	b=bXK1gu6J7ay7a68D7nPXR5xQVhLiZacnJbh1I8p2gZN0vPfoA531M2Gbc0LCIezghjQNOW
	H+Ro4ekCByLVmspDgNulHKjWBokdS+IxN+3o2XSFe55qW+xSiGZCCyreXbg89CwlnK50bc
	tX4KHC2uitPqueFNnhdLLJMDXbmgtxGdrWHko5gksW/Z6ghDSJY7eNc/nW2Nk3SwBeqx4q
	IIh2A1U5ybayI80OJ/fk8nElwnvGUdyCP5e7JaljnjNX3foSJ/TFPfR5lN0Wi70qvGKjPY
	6TlESW/0auIYXl7znkgKolv3sYAkQXPIrtD/B38fDX/Ucct6cOespDUAV5QmMw==
Message-ID: <c3676b98-a0d2-402a-8d6e-8eb0325d32ef@bootlin.com>
Date: Thu, 5 Mar 2026 10:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] mtd: rawnand: sunxi: do not count BBM bytes twice
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 James Hilliard <j.hilliard@upstreamdata.ca>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-4-richard.genoud@bootlin.com>
 <1947198.tdWV9SEqCh@jernej-laptop>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <1947198.tdWV9SEqCh@jernej-laptop>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_094333_678191_0777957F 
X-CRM114-Status: GOOD (  21.52  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMjEvMDIvMjAyNiDDoCAxMDoyMSwgSmVybmVqIMWga3JhYmVjIGEgw6ljcml0wqA6Cj4gRG5l
IHBldGVrLCAyMC4gZmVicnVhciAyMDI2IG9iIDE3OjEwOjA4IFNyZWRuamVldnJvcHNraSBzdGFu
ZGFyZG5pIMSNYXMgamUgUmljaGFyZCBHZW5vdWQgbmFwaXNhbChhKToKPj4gQkJNIGlzIHBhcnQg
b2YgVVNFUl9EQVRBIHNlY3Rpb24sIHNvIHdlIHNob3VsZCByZW1vdmUgaXQgdHdpY2UKPj4KPj4g
VGhpcyB3YXMgd29ya2luZyBvayBiZWNhdXNlIHdlIGFyZSBvbiB0aGUgc2FmZSBzaXplLCBhZHZl
cnRpc2luZyB0aGF0Cj4+IHRoZXJlIHdhcyAyIGJ5dGVzIGxlc3MgYXZhaWxhYmxlIHRoYW4gcmVh
bGl0eS4KPiAKPiBNaXNzaW5nICJpbiIgYmVmb3JlICJyZWFsaXR5Ii4Kb2sKCj4gCj4+Cj4+IEJ1
dCB3ZSBjYW4ndCBjaGFuZ2Ugb2xkIHBsYXRmb3Jtcywgc2luY2UgaXQgbWF5IGxlYWQgdG8gYSBk
aWZmZXJlbnQgRUNDCj4+IHN0cmVuZ3RoLCBzbywgaW50cm9kdWNlIGEgbGVnYWN5IGZsYWcgZm9y
IG9sZCBwbGF0Zm9ybXMsIGFuZCBzd2l0Y2ggdGhlCj4+IG5ldyBwbGF0Zm9ybXMgdG8gdGhlIGNv
cnJlY3QgY291bnQuCj4gCj4gVGhlcmUgYXJlbid0IGFueSB1c2VycyBvZiBINi9INjE2IGRyaXZl
ciwgcmlnaHQ/IElmIGl0IHdvdWxkIGJlLCBFQ0Mgc3RyZW5ndGgKPiBjYW4ndCBiZSBjaGFuZ2Vk
LCBzaW5jZSBpdCBjYW4gaW1wYWN0IHN5c3RlbXMsIHdoaWNoIGFscmVhZHkgdXNlIGl0LgpBRkFJ
SywgdGhlIG9ubHkgdXNlcnMgZm9yIG5vdyB3b3VsZCBiZSBvbiB3aGF0c21pbmVyIGJvYXJkcyBh
bmQgYXJlIG5vdCAKaW1wYWN0ZWQgYnkgdGhpcyAodGhlIEVDQyBzdHJlbmd0aCB3b24ndCBjaGFu
Z2UgZnJvbSAzMiB0byA0MGJpdHMgb24gCnRob3NlIGJvYXJkcykuCihBZGRpbmcgSmFtZXMgaW4g
Q2MsIGFzIGhlIG1heSBrbm93IG1vcmUgb24gdGhlIHN1YmplY3QpCgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBKZXJuZWoKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBHZW5vdWQgPHJpY2hh
cmQuZ2Vub3VkQGJvb3RsaW4uY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9z
dW54aV9uYW5kLmMgfCAyMyArKysrKysrKysrKysrKysrKysrKy0tLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jCj4+IGluZGV4IDljNmUwNjI1ZTM0Zi4uOTlkMzA1YmJkYTUzIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9zdW54aV9uYW5kLmMKPj4gKysrIGIvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4+IEBAIC0yODEsNiArMjgxLDggQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3Qgc3VueGlfbmFuZF9jaGlwICp0b19zdW54aV9uYW5kKHN0cnVjdCBuYW5k
X2NoaXAgKm5hbmQpCj4+ICAgICogQGhhc19lY2NfYmxvY2tfNTEyOglJZiB0aGUgRUNDIGNhbiBo
YW5kbGUgNTEyQiBvciBvbmx5IDEwMjRCIGNodW5ja3MKPj4gICAgKiBAaGFzX2VjY19jbGs6CUlm
IHRoZSBjb250cm9sbGVyIG5lZWRzIGFuIEVDQyBjbG9jay4KPj4gICAgKiBAaGFzX21idXNfY2xr
OglJZiB0aGUgY29udHJvbGxlciBuZWVkcyBhIG1idXMgY2xvY2suCj4+ICsgKiBAbGVnYWN5X21h
eF9zdHJlbmd0aDpJZiB0aGUgbWF4aW1pemUgc3RyZW5ndGggZnVuY3Rpb24gd2FzIG9mZiBieSAy
IGJ5dGVzCj4+ICsgKgkJCU5COiB0aGlzIHNob3VsZCBub3QgYmUgdXNlZCBpbiBuZXcgY29udHJv
bGxlcnMKPj4gICAgKiBAcmVnX2lvX2RhdGE6CUkvTyBkYXRhIHJlZ2lzdGVyCj4+ICAgICogQHJl
Z19lY2NfZXJyX2NudDoJRUNDIGVycm9yIGNvdW50ZXIgcmVnaXN0ZXIKPj4gICAgKiBAcmVnX3Vz
ZXJfZGF0YToJVXNlciBkYXRhIHJlZ2lzdGVyCj4+IEBAIC0zMTAsNiArMzEyLDcgQEAgc3RydWN0
IHN1bnhpX25mY19jYXBzIHsKPj4gICAJYm9vbCBoYXNfZWNjX2Jsb2NrXzUxMjsKPj4gICAJYm9v
bCBoYXNfZWNjX2NsazsKPj4gICAJYm9vbCBoYXNfbWJ1c19jbGs7Cj4+ICsJYm9vbCBsZWdhY3lf
bWF4X3N0cmVuZ3RoOwo+PiAgIAl1bnNpZ25lZCBpbnQgcmVnX2lvX2RhdGE7Cj4+ICAgCXVuc2ln
bmVkIGludCByZWdfZWNjX2Vycl9jbnQ7Cj4+ICAgCXVuc2lnbmVkIGludCByZWdfdXNlcl9kYXRh
Owo+PiBAQCAtMTgxMSwxMCArMTgxNCwyMiBAQCBzdGF0aWMgaW50IHN1bnhpX25hbmRfaHdfZWNj
X2N0cmxfaW5pdChzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLAo+PiAgIAkJZWNjLT5zaXplID0gMTAy
NDsKPj4gICAJCW5zZWN0b3JzID0gbXRkLT53cml0ZXNpemUgLyBlY2MtPnNpemU7Cj4+ICAgCj4+
IC0JCS8qIFJlc2VydmUgMiBieXRlcyBmb3IgdGhlIEJCTSAqLwo+PiAtCQlieXRlcyA9IChtdGQt
Pm9vYnNpemUgLSAyKSAvIG5zZWN0b3JzOwo+PiArCQkvKgo+PiArCQkgKiBUaGUgMiBCQk0gYnl0
ZXMgc2hvdWxkIG5vdCBiZSByZW1vdmVkIGZyb20gdGhlIGdyYW5kIHRvdGFsLAo+PiArCQkgKiBi
ZWNhdXNlIHRoZXkgYXJlIHBhcnQgb2YgdGhlIFVTRVJfREFUQV9TWi4KPj4gKwkJICogQnV0IHdl
IGNhbid0IG1vZGlmeSB0aGF0IGZvciBvbGRlciBwbGF0Zm9ybSBzaW5jZSBpdCBtYXkKPj4gKwkJ
ICogcmVzdWx0IGluIGEgc3Ryb25nZXIgRUNDIGF0IHRoZSBlbmQsIGFuZCBicmVhayB0aGUKPj4g
KwkJICogY29tcGF0aWJpbGl0eS4KPj4gKwkJICovCj4+ICsJCWlmIChuZmMtPmNhcHMtPmxlZ2Fj
eV9tYXhfc3RyZW5ndGgpCj4+ICsJCQlieXRlcyA9IChtdGQtPm9vYnNpemUgLSAyKSAvIG5zZWN0
b3JzOwo+PiArCQllbHNlCj4+ICsJCQlieXRlcyA9IG10ZC0+b29ic2l6ZSAvIG5zZWN0b3JzOwo+
PiAgIAo+PiAtCQkvKiA0IG5vbi1FQ0MgYnl0ZXMgYXJlIGFkZGVkIGJlZm9yZSBlYWNoIEVDQyBi
eXRlcyBzZWN0aW9uICovCj4+ICsJCS8qCj4+ICsJCSAqIFVTRVJfREFUQV9TWiBub24tRUNDIGJ5
dGVzIGFyZSBhZGRlZCBiZWZvcmUgZWFjaCBFQ0MgYnl0ZXMKPj4gKwkJICogc2VjdGlvbiwgdGhl
eSBjb250YWluIHRoZSAyIEJCTSBieXRlcwo+PiArCQkgKi8KPj4gICAJCWJ5dGVzIC09IFVTRVJf
REFUQV9TWjsKPj4gICAKPj4gICAJCS8qIGFuZCBieXRlcyBoYXMgdG8gYmUgZXZlbi4gKi8KPj4g
QEAgLTIzNzksNiArMjM5NCw3IEBAIHN0YXRpYyBjb25zdCB1OCBzdW54aV91c2VyX2RhdGFfbGVu
X2g2W10gPSB7Cj4+ICAgCj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfY2FwcyBz
dW54aV9uZmNfYTEwX2NhcHMgPSB7Cj4+ICAgCS5oYXNfZWNjX2Jsb2NrXzUxMiA9IHRydWUsCj4+
ICsJLmxlZ2FjeV9tYXhfc3RyZW5ndGggPSB0cnVlLAo+PiAgIAkucmVnX2lvX2RhdGEgPSBORkNf
UkVHX0ExMF9JT19EQVRBLAo+PiAgIAkucmVnX2VjY19lcnJfY250ID0gTkZDX1JFR19BMTBfRUND
X0VSUl9DTlQsCj4+ICAgCS5yZWdfdXNlcl9kYXRhID0gTkZDX1JFR19BMTBfVVNFUl9EQVRBLAo+
PiBAQCAtMjQwMCw2ICsyNDE2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW54aV9uZmNfY2Fw
cyBzdW54aV9uZmNfYTEwX2NhcHMgPSB7Cj4+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdW54aV9u
ZmNfY2FwcyBzdW54aV9uZmNfYTIzX2NhcHMgPSB7Cj4+ICAgCS5oYXNfbWRtYSA9IHRydWUsCj4+
ICAgCS5oYXNfZWNjX2Jsb2NrXzUxMiA9IHRydWUsCj4+ICsJLmxlZ2FjeV9tYXhfc3RyZW5ndGgg
PSB0cnVlLAo+PiAgIAkucmVnX2lvX2RhdGEgPSBORkNfUkVHX0EyM19JT19EQVRBLAo+PiAgIAku
cmVnX2VjY19lcnJfY250ID0gTkZDX1JFR19BMTBfRUNDX0VSUl9DTlQsCj4+ICAgCS5yZWdfdXNl
cl9kYXRhID0gTkZDX1JFR19BMTBfVVNFUl9EQVRBLAo+Pgo+IAo+IAo+IAo+IAoKCi0tIApSaWNo
YXJkIEdlbm91ZCwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
