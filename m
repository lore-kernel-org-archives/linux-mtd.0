Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF8CA9EBE
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 18:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5aknzfwmGfPoHrkoMP/7K0+8KidAo1Fadd7FC53k3fE=; b=sYe0uVhXZS6Q2N
	vJLbJAn5nI4XZyMImqIirMo0WtXAZX9GBDVUzxtT4qlRkBoejEluTwyf11z3vLWrdAWpyI6aoG+lg
	7KwtL52SN8bheQD8GDjYCNqxYrYSewFJqafnPZMb8X19vYk8sdSfRP2q9klC6J69KU4dxydCd8EC9
	ZeueKg0VrnOfgtqSAWHs0HOcZJ36ayzwvdUvJ3O09PPZ15Tj8kjCSM+G2cuHLnJM19L3TEpwjjYk3
	t1o0KV+eJBNsSPb81aSzKu6XctedpJcmSpr9iydJXDtaaZ63BziC8fK0yquez34EXd9O5vfQxytq4
	JUgQJvbLZ6CSgDgGa15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbeS-00000008Mtt-1YP0;
	Sat, 10 Oct 2026 18:18:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFbeQ-00000008Mti-21uq
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 18:18:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D501340774;
	Sat, 10 Oct 2026 18:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B979C1F000FF;
	Sat, 10 Oct 2026 18:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791656309;
	bh=MibGS/SpY0Ht5gaekMQ0o/eJhlHCrk+F8KrkjlZ3ZDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSUqUjhs8JB8WpDj8yztKXZhVbc6EY77S5ELQMVm6BCxtosTcbXOrLgMzqn+wgftU
	 DHlAeAf9bGGm+zhbrMa+05fUlij/t9lrqCDrv8kDeetGuUZ57Z3AZcixlZXfHsU/LF
	 VNm/8MGAlIyIGDFN9O7e+wFtUk87azQ+7c6Afd5VPuOUqZAvHx9hW/Adt0FOpJNZHb
	 B6ar9H9vf/wtdxHvPoIrSYYkLPu4unHPa24lA0wzNhy/tNgXzogAUYD5ko7fwbO8P0
	 RMtlaDTH8i7QRB2zR+Ur4Yb2Iyn3sNRuQMJjYjqmu00XakzraIbHgs1D2OCJWtY8RP
	 Z41ZWeOc79ZVA==
Message-ID: <sashiko-outbox-166799@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mtd: cfi_cmdset_0002: implement point() for
 simple linear maps
To: "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, vigneshr@ti.com, richard@nod.at, tsbogend@alpha.franken.de
Cc: dwmw2@infradead.org, corbet@lwn.net, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, ulli.kroll@googlemail.com, linux-mtd@lists.infradead.org, kaloz@openwrt.org, linusw@kernel.org, linux-kernel@vger.kernel.org, john@phrozen.org, nico@fluxnic.net
In-Reply-To: <20261010180840.2152492-3-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
 <20261010180840.2152492-3-orgads@gmail.com>
Date: Sat, 10 Oct 2026 18:18:28 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogY2ZpX2NtZHNl
dF8wMDAyOiBGTF9QT0lOVCBkZWFkbG9ja3MgYW5kIGhhbmdzIFhJUCBlcmFzZXMgdmlhIEZMX1hJ
UF9XSElMRV9FUkFTSU5HCi0tCgpjb21taXQgNWYzYjM1NDNkNWVlNmRhZDVlODE3MWQ4NmVhN2Ey
OTBhYmFiNzM3ZQpBdXRob3I6IE9yZ2FkIFNoYW5laCA8b3JnYWRzQGdtYWlsLmNvbT4KCm10ZDog
Y2ZpX2NtZHNldF8wMDAyOiBpbXBsZW1lbnQgcG9pbnQoKSBmb3Igc2ltcGxlIGxpbmVhciBtYXBz
CgpUaGlzIGNvbW1pdCBhZGRzIGEgcG9pbnQoKSBhbmQgdW5wb2ludCgpIHBhaXIgZm9yIGNmaV9j
bWRzZXRfMDAwMiwgbW9kZWxlZApvbiBjZmlfaW50ZWxleHRfcG9pbnQoKSwgYWxsb3dpbmcgbGlu
ZWFybHkgbWFwcGVkIGNoaXBzIHRvIGJlIHNjYW5uZWQgaW4KcGxhY2UuIEl0IGhhbmRsZXMgRkxf
UE9JTlQgb3BlcmF0aW9ucyBhbmQgZW5zdXJlcyB0aGF0IGEgcG9pbnQgZG9lcyBub3QKc3VzcGVu
ZCBhbiBlcmFzZSwgYnV0IHdhaXRzIGZvciBpdCB0byBmaW5pc2ggaW5zdGVhZC4KCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jIGIvZHJpdmVycy9tdGQv
Y2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiBpbmRleCA1MTdkYjJmMjcwN2Y0Li5iMDMzMDgzOWEy
MTMzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5jCj4g
KysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKClsgLi4uIF0KCj4gQEAg
LTkwNiw4ICs5MjYsMTIgQEAgc3RhdGljIGludCBnZXRfY2hpcChzdHJ1Y3QgbWFwX2luZm8gKm1h
cCwgc3RydWN0IGZsY2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyBhZHIKPiAgCQlyZXR1cm4gMDsK
PiAgCj4gIAljYXNlIEZMX0VSQVNJTkc6Cj4gKwkJLyoKPiArCQkgKiBOb3QgZm9yIGEgcG9pbnQ6
IHRoZSBlcmFzZSB3b3VsZCBzdGF5IHN1c3BlbmRlZCBmb3IgYXMKPiArCQkgKiBsb25nIGFzIGl0
IGlzIGhlbGQsIHdoaWNoIGZvciBjcmFtZnMgaXMgdGhlIHdob2xlIG1vdW50Lgo+ICsJCSAqLwo+
ICAJCWlmICghY2ZpcCB8fCAhKGNmaXAtPkVyYXNlU3VzcGVuZCAmICgweDF8MHgyKSkgfHwKPiAt
CQkgICAgIShtb2RlID09IEZMX1JFQURZIHx8IG1vZGUgPT0gRkxfUE9JTlQgfHwKPiArCQkgICAg
IShtb2RlID09IEZMX1JFQURZIHx8Cj4gIAkJICAgIChtb2RlID09IEZMX1dSSVRJTkcgJiYgKGNm
aXAtPkVyYXNlU3VzcGVuZCAmIDB4MikpKSkKPiAgCQkJZ290byBzbGVlcDsKCltTZXZlcml0eTog
SGlnaF0KVGhpcyBwYXRjaCBjb3JyZWN0bHkgcHJldmVudHMgRkxfUE9JTlQgZnJvbSBzdXNwZW5k
aW5nIGFuIGVyYXNlIGhlcmUsIGJ1dApkb2VzIHRoaXMgYWxzbyBuZWVkIHRvIGJlIGFwcGxpZWQg
dG8gRkxfWElQX1dISUxFX0VSQVNJTkc/CgpJZiBtdGRfcG9pbnQoKSBpcyBjYWxsZWQgZHVyaW5n
IEZMX1hJUF9XSElMRV9FUkFTSU5HLCBnZXRfY2hpcCgpIHN0aWxsCmFsbG93cyBtb2RlID09IEZM
X1BPSU5UOgoKZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmM6Z2V0X2NoaXAoKSB7
CiAgICAuLi4KCWNhc2UgRkxfWElQX1dISUxFX0VSQVNJTkc6CgkJaWYgKG1vZGUgIT0gRkxfUkVB
RFkgJiYgbW9kZSAhPSBGTF9QT0lOVCAmJgoJCSAgICAoIWNmaXAgfHwgIShjZmlwLT5FcmFzZVN1
c3BlbmQmMikpKQoJCQlnb3RvIHNsZWVwOwoJCWNoaXAtPm9sZHN0YXRlID0gY2hpcC0+c3RhdGU7
CgkJY2hpcC0+c3RhdGUgPSBGTF9SRUFEWTsKCQlyZXR1cm4gMDsKICAgIC4uLgp9CgpUaGlzIGFs
bG93cyBkb19wb2ludF9vbmVjaGlwKCkgdG8gc3VjY2Vzc2Z1bGx5IGNoYW5nZSBjaGlwLT5zdGF0
ZSB0byBGTF9QT0lOVAp3aGlsZSBsZWF2aW5nIGNoaXAtPm9sZHN0YXRlIGFzIEZMX1hJUF9XSElM
RV9FUkFTSU5HLgoKWyAuLi4gXQoKPiBAQCAtOTYwLDggKzk4NCwxMyBAQCBzdGF0aWMgaW50IGdl
dF9jaGlwKHN0cnVjdCBtYXBfaW5mbyAqbWFwLCBzdHJ1Y3QgZmxjaGlwICpjaGlwLCB1bnNpZ25l
ZCBsb25nIGFkcgo+ICAJCXJldHVybiAtRUlPOwo+ICAKPiAgCWNhc2UgRkxfUE9JTlQ6Cj4gLQkJ
LyogT25seSBpZiB0aGVyZSdzIG5vIG9wZXJhdGlvbiBzdXNwZW5kZWQuLi4gKi8KPiAtCQlpZiAo
bW9kZSA9PSBGTF9SRUFEWSAmJiBjaGlwLT5vbGRzdGF0ZSA9PSBGTF9SRUFEWSkKPiArCQkvKgo+
ICsJCSAqIE9ubHkgaWYgdGhlcmUncyBubyBvcGVyYXRpb24gc3VzcGVuZGVkOiB0aGUgY2hpcCBp
cyBpbgo+ICsJCSAqIGFycmF5IG1vZGUsIHNvIHJlYWRzLCBmdXJ0aGVyIHBvaW50cyBhbmQgdGhl
IHJlYm9vdAo+ICsJCSAqIHJlc2V0ICh3aGljaCBvbmx5IHJlLWVudGVycyBhcnJheSBtb2RlKSBj
YW4gZ28gYWhlYWQuCj4gKwkJICovCj4gKwkJaWYgKChtb2RlID09IEZMX1JFQURZIHx8IG1vZGUg
PT0gRkxfUE9JTlQgfHwKPiArCQkgICAgIG1vZGUgPT0gRkxfU0hVVERPV04pICYmIGNoaXAtPm9s
ZHN0YXRlID09IEZMX1JFQURZKQo+ICAJCQlyZXR1cm4gMDsKPiAgCQlmYWxsdGhyb3VnaDsKPiAg
CWRlZmF1bHQ6CgpbU2V2ZXJpdHk6IEhpZ2hdCklmIGNoaXAtPm9sZHN0YXRlIGlzIEZMX1hJUF9X
SElMRV9FUkFTSU5HIGJlY2F1c2UgaXQgd2Fzbid0IGZpbHRlcmVkIG91dAphYm92ZSwgd2lsbCBz
dWJzZXF1ZW50IG9wZXJhdGlvbnMgZGVhZGxvY2sgaGVyZT8KCkJlY2F1c2Ugb2xkc3RhdGUgaXMg
bm90IEZMX1JFQURZLCBub3JtYWwgcmVhZCBvcGVyYXRpb25zIChGTF9SRUFEWSkgd291bGQKZmFs
bCB0aHJvdWdoIHRvIHRoZSBzbGVlcCBibG9jayBpbmRlZmluaXRlbHkgdW50aWwgdGhlIHBvaW50
IGlzIHJlbGVhc2VkCih3aGljaCBmb3IgY3JhbWZzIGlzIHRoZSBtb3VudCBsaWZldGltZSkuCgpD
b3VsZCB0aGlzIGFsc28gY2F1c2UgdGhlIFhJUCBiYWNrZ3JvdW5kIGVyYXNlIGxvb3AgdG8gc3Bp
biBpbmRlZmluaXRlbHkKd2FpdGluZyBmb3IgY2hpcC0+c3RhdGUgdG8gcmV0dXJuIHRvIEZMX1hJ
UF9XSElMRV9FUkFTSU5HPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MTAxMDE4MDg0MC4yMTUyNDkyLTEtb3JnYWRzQGdtYWlsLmNv
bT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
