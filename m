Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9406ECC6B19
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPIq4CKa+Zs5rpF2VNiFWh/JXsY26Ij2Hp7pClQESHo=; b=qcliiO7CaH+hoc
	BbOmKGcWUXBjSytnZvZnMvutfks2DKDFN1X7DLxsU+zVvVUUqRbepJ8mjtiNaCQrKSkQdZtyrTEyd
	UMpE8dt2CYo1qg0ZsFDa4ZGQrDHv5iG9o4p4q7GpZ4CUr4QZq4vTLWLlxzbUaoe1TfWS+mp0b63TM
	k1T6w/9KIbhYNBbgK4BaVxt+xSuqeYN6nB7yeNAhGoHaXIJtAvalknN4H2aR05FulJ/eYh4FnTy3X
	AIvJ3+nQL9e2e9dzQHKOcCHUWcd6EHPNo6kbtGk2XflCV8JVkooiPHGLoq2OC9o2h3vpyfO2r0R40
	DKkHPsQsYazNjlX3zZnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeXg-0000000DMfY-1ZE5;
	Tue, 13 Oct 2026 15:35:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeXd-0000000DMeA-1WHE
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 15:35:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B8C31C653F0;
	Tue, 13 Oct 2026 15:36:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 019D760362;
	Tue, 13 Oct 2026 15:35:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15A9611D717CE;
	Tue, 13 Oct 2026 17:35:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791905741; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EraYlQSOG3Kmw8zxzgg1U+mxAvQiXdVcq1oNRQOWmLg=;
	b=ZMjVsRfSESj9Y/TlgYyp4BICLyGyzJ6ramQT4KbdED3XMtfcOVlSuXQsddgTDjuph5mXh1
	yjzG0SpSMxxI19ddIQsEXkHqMM2g//4BdZQxV40pEv/plj+y9+mfN0Htz6Qy3n9uACDbQP
	fRyQ8WQ7pb06QBhir0WZlaHnF+1e1CF4kP6Hx1e2gFx+4Gdw2va7OZx6hNxOGLkR3JTOSN
	e9326crYH896IlWB6sIQkQxP6cfnW7NRhjN+FcXDIL5HhPuwqVKdg3iPvi6s1RBSjCKUvc
	2EDidiCK2PGHRuJ4PI9sAweZKBWQ1cMKVki+3QQetBrxKqOlqvMvF2r/9LVEiQ==
Message-ID: <e6772c3b70828bb9aca7f3b1c24d4a03107728a4.camel@bootlin.com>
Subject: Re: [PATCH v2 3/7] mtd: spi-nor: Add support for panic writes
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: sashiko-reviews@lists.linux.dev, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, Takahiro Kuwano
 <takahiro.kuwano@infineon.com>, Miquel Raynal	 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mark Brown <broonie@kernel.org>, Thomas Petazzoni	
 <thomas.petazzoni@bootlin.com>
Cc: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, Bharat
 Bhushan <bbhushan2@marvell.com>,  Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, Tanmay Jagdale <tanmay@marvell.com>
Date: Tue, 13 Oct 2026 17:35:33 +0200
In-Reply-To: <sashiko-outbox-169903@kernel.org>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
	 <20261013141350.189996-4-paul.cercueil@bootlin.com>
	 <sashiko-outbox-169903@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_083549_569093_938E80B1 
X-CRM114-Status: GOOD (  16.54  )
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

SGkgU2FzaGlrbywKCkxlIG1hcmRpIDEzIG9jdG9icmUgMjAyNiDDoCAxNDoyNyArMDAwMCwgc2Fz
aGlrby1ib3RAa2VybmVsLm9yZyBhIMOpY3JpdMKgOgo+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250
cmlidXRpb24hIFNhc2hpa28gQUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsIGlzc3VlKHMpCj4g
dG8gY29uc2lkZXI6Cj4gLSBbQ3JpdGljYWxdIHBtOiBzcGktbWVtOiBtaXNoYW5kbGVkIHBtX3J1
bnRpbWVfZ2V0X2lmX2FjdGl2ZSgpIHNpbGVudGx5Cj4gYnJlYWtzIHBhbmljIHdyaXRlCj4gLSBb
SGlnaF0gbW06IHNwaS1ub3I6IHBhbmljIHdyaXRlIGFsbG9jYXRpb24gdXNlcyBzbGVlcGluZyBH
RlAgbWFzawo+IC0gW0hpZ2hdIHNwaTogc3BpLW1lbTogcGFuaWMgd3JpdGUgZmFsbGJhY2sgcGF0
aCBzbGVlcHMgb24gRU5PVFNVUFAKPiAtLQo+IAo+IGNvbW1pdCBhMWY5ZjA1MzQ3MGZmMTBmYTEw
YzEzM2RjNWFlYjA4MjdiYzM2N2ExCj4gQXV0aG9yOiBUYW5tYXkgSmFnZGFsZSA8dGFubWF5QG1h
cnZlbGwuY29tPgo+IAo+IMKgwqDCoCBtdGQ6IHNwaS1ub3I6IEFkZCBzdXBwb3J0IGZvciBwYW5p
YyB3cml0ZXMKPiDCoMKgwqAgCj4gwqDCoMKgIElmIHRoZSBTUEkgY29udHJvbGxlciBzdXBwb3J0
cyBpdCwgcHJvdmlkZSB0aGUgZnVuY3Rpb25hbGl0eSBvZiBkb2luZyBhCj4gwqDCoMKgIHBhbmlj
IHdyaXRlLgo+IMKgwqDCoCAKPiDCoMKgwqAgVXBkYXRlIHRoZSBzcGktbm9yIGNvcmUgY29kZSBh
bmQgY29udHJvbGxlcnMgdG8gbWFrZSBzdXJlIHRoZXkgd29uJ3QgdHJ5Cj4gwqDCoMKgIHRvIGdy
YWIgbG9ja2VkIG11dGV4ZXMgb3Igc2xlZXAgd2hlbiBkb2luZyBhIHBhbmljIHdyaXRlLCBhcyBw
cmVlbXB0aW9uCj4gwqDCoMKgIGFuZCBJUlFzIGFyZSBkaXNhYmxlZC4KPiAKPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jCj4gPiBpbmRleCAyNTA5ZmI5ODNkNGYyLi4yODFhY2M1NGIzMjQ1IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5jCj4gCj4gWyAuLi4gXQo+IAo+ID4gQEAgLTIxOTYsNiArMjIzNSw3IEBAIHN0YXRp
YyBpbnQgc3BpX25vcl9yZWFkKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3QKPiA+IGZyb20s
IHNpemVfdCBsZW4sCj4gPiDCoHN0YXRpYyBpbnQgc3BpX25vcl9vY3RhbF9kdHJfd3JpdGUoc3Ry
dWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IHRvLCBzaXplX3QKPiA+IGxlbiwKPiA+IMKgCQkJCcKg
wqAgY29uc3QgdTggKmJ1ZikKPiA+IMKgewo+ID4gKwlnZnBfdCBtbV9mbGFncyA9IEdGUF9LRVJO
RUw7Cj4gPiDCoAl1OCAqdG1wX2J1ZjsKPiA+IMKgCXNpemVfdCBieXRlc193cml0dGVuOwo+ID4g
wqAJbG9mZl90IHN0YXJ0LCBlbmQ7Cj4gPiBAQCAtMjIwNCw3ICsyMjQ0LDEwIEBAIHN0YXRpYyBp
bnQgc3BpX25vcl9vY3RhbF9kdHJfd3JpdGUoc3RydWN0IHNwaV9ub3IKPiA+ICpub3IsIGxvZmZf
dCB0bywgc2l6ZV90IGxlbiwKPiA+IMKgCWlmIChJU19BTElHTkVEKHRvLCAyKSAmJiBJU19BTElH
TkVEKGxlbiwgMikpCj4gPiDCoAkJcmV0dXJuIHNwaV9ub3Jfd3JpdGVfZGF0YShub3IsIHRvLCBs
ZW4sIGJ1Zik7Cj4gPiDCoAo+ID4gLQl0bXBfYnVmID0ga21hbGxvYyhub3ItPnBhcmFtcy0+cGFn
ZV9zaXplLCBHRlBfS0VSTkVMKTsKPiA+ICsJaWYgKG5vci0+bXRkLm9vcHNfcGFuaWNfd3JpdGUp
Cj4gPiArCQltbV9mbGFncyB8PSBHRlBfQVRPTUlDOwo+ID4gKwo+ID4gKwl0bXBfYnVmID0ga21h
bGxvYyhub3ItPnBhcmFtcy0+cGFnZV9zaXplLCBtbV9mbGFncyk7Cj4gCj4gW1NldmVyaXR5OiBI
aWdoXQo+IERvZXMgdGhpcyBiaXR3aXNlIE9SIHN1Y2Nlc3NmdWxseSByZW1vdmUgdGhlIHNsZWVw
YWJsZSBfX0dGUF9ESVJFQ1RfUkVDTEFJTQo+IGZsYWc/Cj4gCj4gQmVjYXVzZSBtbV9mbGFncyBp
cyBpbml0aWFsaXplZCB0byBHRlBfS0VSTkVMICh3aGljaCBpbmNsdWRlcwo+IF9fR0ZQX0RJUkVD
VF9SRUNMQUlNKSwgYml0d2lzZSBPUmluZyBHRlBfQVRPTUlDIGludG8gdGhlIG1hc2sgZG9lcyBu
b3QKPiBjbGVhciB0aGUgX19HRlBfRElSRUNUX1JFQ0xBSU0gYml0LiBUaGlzIG1lYW5zIHRoZSBy
ZXN1bHRpbmcgbWFzayBzdGlsbAo+IGluc3RydWN0cyB0aGUgcGFnZSBhbGxvY2F0b3IgdGhhdCBp
dCBpcyBhbGxvd2VkIHRvIHNsZWVwIGFuZCBlbnRlciBkaXJlY3QKPiByZWNsYWltLgoKTXkgYmFk
LCBpdCBzaG91bGQgYmUgR0ZQX0tFUk5FTCAqb3IqIEdGUF9BVE9NSUMuIEdvb2QgY2F0Y2guCgpD
aGVlcnMsCi1QYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
