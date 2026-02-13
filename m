Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA837EF48CC
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Feb 2026 08:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dccl/tRaUj8zZsEtEFevPW9FLHiBLtHaVys6+BBIR3M=; b=4B1Y8BQGHtKwP0
	p7gTSRDIjhp3UkyoTdgivfmfABh8oDTgF4a/LNgjE9xknix3SoNSkasg8MEKlRaKqo1ecC1pUxUWk
	xMjVVQ7mhqruSwgFXSp0YJIIE3gZL/AGS8WkHpfkPO+EsGGBkPU5HjyGNyLNS1eGIZx91OW+fHPc2
	CWSynIldsCeVKGJJkE4S3alXn5wnwPGO977j8R+mhbgyHvs8vXxS6PE5Cs5R7ZowDyoc+amFRvACM
	jMv6ZcNCXxeP8Iz8NVW/XLJvQZmfNJGUlRt1p2kEu+ULMGZdMX+9nokR6oWeZT34e6FZGyVVIbUQW
	aVXT1k6YsQN60nh5/keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoOP-00000003AW3-3YMH;
	Fri, 13 Feb 2026 08:19:13 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqoOF-00000003AT5-3pPh
	for linux-mtd@lists.infradead.org;
	Fri, 13 Feb 2026 08:19:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B92EE1A0E8E;
	Fri, 13 Feb 2026 08:19:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A815606CC;
	Fri, 13 Feb 2026 08:19:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C830710368E05;
	Fri, 13 Feb 2026 09:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770970739; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6yDp974LQrt0MDs5mJhTng5R7kqy2mlSjAEqesT+EHc=;
	b=R/rh10fv12ZrMWg0slw6wc48DOkSeuVDzW4lm8J3U750kw3QXJaYY2JMIDvuKx7RCtBT6e
	zEngr6rKknPHs/3rzngK/zf6s2b+p1F5BcuJ3Wq2PsdSZNC+tfjkn3SJJY5TgV1topTCHM
	E2MKb0oDbYlhU/LKhrA7o3VbjHzm9lh0j3hSLH8iZzmC9YDU7UhYXZfheJR3F1vU3CBKGr
	tMQJpIegyGXz81nU2eyg651tatAv/r/9iTuKtyTTSAiuZgCp6qpcimtRpddZfPT04lddha
	KrwYagkq9XaW6ZkXwYmdW5T7kzbnkymA0MI8u33A/3zIa0rClONyWUWgv7di6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: <broonie@kernel.org>,  <robh@kernel.org>,  <krzk+dt@kernel.org>,
  <conor+dt@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <tudor.ambarus@linaro.org>,  <pratyush@kernel.org>,  <mwalle@kernel.org>,
  <linux-spi@vger.kernel.org>,  <devicetree@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <praneeth@ti.com>,  <u-kumar1@ti.com>,  <p-mantena@ti.com>,
  <a-dutta@ti.com>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
In-Reply-To: <012a44f3-973f-4f34-be69-286cf924a6c6@ti.com> (Santhosh Kumar
	K.'s message of "Sat, 7 Feb 2026 00:55:49 +0530")
References: <20260113141617.1905039-1-s-k6@ti.com>
	<20260113141617.1905039-10-s-k6@ti.com> <87bji3gkda.fsf@bootlin.com>
	<012a44f3-973f-4f34-be69-286cf924a6c6@ti.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 13 Feb 2026 09:18:54 +0100
Message-ID: <87a4xdxdht.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_001904_403070_DA7D7CB8 
X-CRM114-Status: GOOD (  17.08  )
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

T24gMDcvMDIvMjAyNiBhdCAwMDo1NTo0OSArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0
aS5jb20+IHdyb3RlOgoKPiBPbiAwNS8wMi8yNiAyMzowOSwgTWlxdWVsIFJheW5hbCB3cm90ZToK
Pj4gT24gMTMvMDEvMjAyNiBhdCAxOTo0NjoxNCArMDUzMCwgU2FudGhvc2ggS3VtYXIgSyA8cy1r
NkB0aS5jb20+IHdyb3RlOgo+PiAKPj4+IEltcGxlbWVudCB0aGUgc3BpX2NvbnRyb2xsZXJfbWVt
X29wcyBleGVjdXRlX3R1bmluZyBjYWxsYmFjayB0byBlbmFibGUKPj4+IFBIWSB0dW5pbmcgc3Vw
cG9ydCBmb3IgdGhlIENhZGVuY2UgY29udHJvbGxlci4gUEhZIHR1bmluZyBvcHRpbWl6ZXMgZGF0
YQo+Pj4gY2FwdHVyZSB0aW1pbmcgYXQgaGlnaCBmcmVxdWVuY2llcyBieSBjYWxpYnJhdGluZyB0
aGUgcmVhZCBkYXRhIGNhcHR1cmUKPj4+IGRlbGF5IHRocm91Z2ggdGhlIGNvbnRyb2xsZXIncyBQ
SFkgaW50ZXJmYWNlLgo+Pj4KPj4+IFR1bmluZyBhbGdvcml0aG0gZnVuY3Rpb25zIChjcXNwaV9w
aHlfdHVuaW5nX2Rkci9zZHIgYW5kCj4+PiBjcXNwaV9waHlfcHJlL3Bvc3RfY29uZmlnKSBhcmUg
cGxhY2Vob2xkZXJzIHRvIGJlIGltcGxlbWVudGVkCj4+PiBpbiBzdWJzZXF1ZW50IGNvbW1pdHMu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogU2FudGhvc2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+Cj4+
PiAtLS0KPj4+ICAgZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jIHwgMjQxICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjQxIGluc2Vy
dGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVh
ZHNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNwaS5jCj4+PiBpbmRleCAwZGYy
ODZkMjQyNTYuLmI4YjBlODVmNGY2OCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1j
YWRlbmNlLXF1YWRzcGkuYwo+Pj4gKysrIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UtcXVhZHNw
aS5jCj4+PiBAQCAtMzIsNiArMzIsNyBAQAo+Pj4gICAgICNkZWZpbmUgQ1FTUElfTkFNRQkJCSJj
YWRlbmNlLXFzcGkiCj4+PiAgICNkZWZpbmUgQ1FTUElfTUFYX0NISVBTRUxFQ1QJCTQKPj4+ICsj
ZGVmaW5lIENRU1BJX0FNNjU0X05PTl9QSFlfQ0xLX1JBVEUJMjUwMDAwMDAKPj4+ICAgICBzdGF0
aWNfYXNzZXJ0KENRU1BJX01BWF9DSElQU0VMRUNUIDw9IFNQSV9ERVZJQ0VfQ1NfQ05UX01BWCk7
Cj4+PiAgIEBAIC02NSw2ICs2Niw3IEBAIHN0cnVjdCBjcXNwaV9zdDsKPj4+ICAgc3RydWN0IGNx
c3BpX2ZsYXNoX3BkYXRhIHsKPj4+ICAgCXN0cnVjdCBjcXNwaV9zdAkqY3FzcGk7Cj4+PiAgIAl1
MzIJCWNsa19yYXRlOwo+Pj4gKwl1MzIJCW5vbl9waHlfY2xrX3JhdGU7Cj4+IFRoaXMgaXMgdGhl
IHNlY29uZCAoYW5kIGxhc3QpIG1haW4gaXNzdWUgSSBoYXZlIHdpdGggdGhlIHNlcmllcyBhcyBp
dAo+PiBpcwo+PiByaWdodCBub3cuIFdlIGNhbm5vdCBzZXQgdGhpcyB0eXBlIG9mIGZyZXF1ZW5j
eSBpbiB0aGUgZHJpdmVyIElNTywgaXQgaXMKPj4gdG9vIGJvYXJkIHNwZWNpZmljLgo+PiBXZSBj
dXJyZW50bHkgaGF2ZSBhIERUIHByb3BlcnR5IGZvciB0aGUgU1BJIG1heGltdW0gc3VwcG9ydGVk
Cj4+IGZyZXF1ZW5jeS4gSSBiZWxpZXZlIHRoaXMgaXMgbm8gbG9uZ2VyIGVub3VnaC4gV2h5IG5v
dCBtYWtpbmcgdGhpcwo+PiBmcmVxdWVuY3kgcHJvcGVydHkgYW4gYXJyYXk/IEZpcnN0IGZyZXF1
ZW5jeSB3b3VsZCBiZSB0aGUgZGVmYXVsdCwKPj4gbm9uIHR1bmVkIG1heGltdW0gZnJlcXVlbmN5
LiBUaGUgc2Vjb25kIHdvdWxkIGJlIHRoZSBtYXhpbXVtIGZyZXF1ZW5jeQo+PiByZWFjaGFibGUg
d2hlbiB0dW5pbmcgdGhlIFBIWS4KPgo+IElmIHRoZSBjb25jZXJuIGlzIG9ubHkgYWJvdXQgd2hl
cmUgdGhpcyBpcyBzZXQsIHdlIGNvdWxkIGludHJvZHVjZSBhIERUCj4gcHJvcGVydHkgc3VjaCBh
cyAibm9uLXBoeS1tYXgtZnJlcSIgdG8gY2FycnkgdGhpcyBpbmZvcm1hdGlvbi4gVGhpcwo+IHdv
dWxkIGFsbG93IHVzIHRvIGF2b2lkIGFueSBjaGFuZ2VzIHRvIHRoZSBleGlzdGluZyAic3BpLW1h
eC1mcmVxdWVuY3kiCj4gaGFuZGxpbmcuIExldCBtZSBrbm93IHlvdXIgdGhvdWdodHMgb24gdGhp
cy4KCk5hbWluZyBpcyBkaWZmaWN1bHQsIG5vbi1waHktbWF4LWZyZXEgaXMgdG9vIFRJIHNwZWNp
ZmljLiBJIHdhcwpwcm9wb3NpbmcgdGhlIGV2b2x1dGlvbiBvZiBzcGktbWF4LWZyZXF1ZW5jeSBi
ZWNhdXNlIGl0IGlzIGJhY2t3YXJkCmNvbXBhdGlibGUuIFRoZSBuYW1pbmcgY2FuIGJlIGRpc2N1
c3NlZCBhZnRlciB5b3Ugc2VuZCBhIHByb3Bvc2FsLCBidXQKZG8gbm90IGluY2x1ZGUgIm5vbi1w
aHkiIGluIGl0LiBJdCBzaGFsbCByZWZsZWN0IHRoZSBmYWN0IHRoYXQgd2l0aCBmaW5lCnR1bmlu
ZyB3ZSBjYW4gcmVhY2ggaGlnaGVyIGZyZXF1ZW5jaWVzIG9uIGNlcnRhaW4gb3BlcmF0aW9ucy4K
Ck1hcmssIGFueSB0YWtlIG9uIHRoaXM/Cgo+IEknbGwgYWxzbyB0ZXN0IHRoZSBhcHByb2FjaCB5
b3Ugc3VnZ2VzdGVkIGFuZCBzaGFyZSBteSBpbnB1dHMgYmFzZWQgb24KPiB0aGUgcmVzdWx0cy4g
QnkgdGhlIHdheSwgd2hlcmUgYXJlIHlvdSBpbnNpc3RpbmcgdG8gYWRqdXN0L3N3aXRjaCB0bwo+
IHRoZSBtYXhpbXVtIGZyZXF1ZW5jeSAtIHdpdGhpbiB0aGUgY29udHJvbGxlciBkcml2ZXIgb3Ig
aW4gdGhlCj4gc3BpLWNvcmU/CgpJdCBpcyBwcmVmZXJhYmxlIHRvIG1ha2UgdGhlIGRlY2lzaW9u
cyBpbiB0aGUgY29yZSBhbmQgYXZvaWQgYmVpbmcgc21hcnQKaW4gY29udHJvbGxlciBkcml2ZXJz
LCBpZiBwb3NzaWJsZS4KClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
