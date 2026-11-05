Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57AC606A32F
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 04:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QFvbSib7;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Asb4veEU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o74sr59+unEmG7PtgQ0rIKpagHJoZpbuZEhm9bwCKBU=; b=QFvbSib7i/aqyNa9vYqK/hmbDE
	aGuzAI9VSGx9G4oK41AmUAX3V2FMiq4phSkaXKwieHYNxmUZa7SGWMTcYVRQ/JJLDVCffMVhjBiFw
	FpBeorrgmsMwfr2uZ/03YYFBZ0hJfJcp3RVgL14+alxqih4dEyrmXcSQ3ubMcjuv3UmCuE6hNXQw5
	WIyIok+eIduewGlE1dgCYDA/YGysAURby1F6eOMSZDhNKl5ju7cOW+yltoJKUtUC4pM2dtv/a1CQW
	f5QepMgbGuKj9Nb98jsQkGG7keLVa3SXIVw7S8wNCJjba9oD12Qcb5Kb4a//wm/IFvylj0AAxvusP
	oVgGmJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOosc-00000007kpn-1IZW;
	Thu, 05 Nov 2026 04:15:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOosa-00000007kpd-21W9
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 04:15:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A89CB60267;
	Thu,  5 Nov 2026 04:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E71D1F000C1;
	Thu,  5 Nov 2026 04:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793852111;
	bh=KBN8WRFYWZ3Yh/LhmH3W+g9ysQSLNsjV5+OTOMR7Q80=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Asb4veEUK4Y96FM00ZHD9iMl/BEqw1OOrnnc/Ma33uE8E8df5sICC8AKVXqWUc1zU
	 li7DsQ5ddqmgLdg8OlwxDp6TgKHXjsGbdRhCdXSwporDnhk/CK97Biur9oWJVr0PpI
	 S65liMlq4uKOlKZ+o80sMlCfXUB5gMIqbaZzclancoAZwKKG2oOnuXSIuqhVbfU63T
	 L0GeYR0u5NdQ5lnuFKI9PJn3la9bvQxpEqRVXjfYCjFUuTMjvzSCR99Zju+KoYORgs
	 oSVxZLurqldthcjTerUSwSynN1SZmJx+Ds+UPKd1FIxhxUVTNrNlR1vfnlcB/Klqm8
	 czoXHViBwaPMg==
Message-ID: <sashiko-outbox-198544@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: core: avoid overflow when checking data bounds
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Boris
 Brezillon" <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20261104-submit-mtd-oob-bounds-v1-v1-1-05209fce5a3e@gmail.com>
References: <20261104-submit-mtd-oob-bounds-v1-v1-1-05209fce5a3e@gmail.com>
Date: Thu, 05 Nov 2026 04:15:10 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogY29yZTogbXRk
X2NoZWNrX29vYl9vcHMoKSBhbGxvd3Mgb2ZmcyA9PSBtdGQtPnNpemUgYW5kIE9PQiB1bmRlcmZs
b3cKLS0KCmNvbW1pdCBjNjFmNjcwZDgzZmViMGEyYTk3ZGE1N2Y5Zjk2OTVlZDlhY2M3NGRiCkF1
dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgptdGQ6IGNv
cmU6IGF2b2lkIG92ZXJmbG93IHdoZW4gY2hlY2tpbmcgZGF0YSBib3VuZHMKClRoaXMgY29tbWl0
IHVwZGF0ZXMgbXRkX2NoZWNrX29vYl9vcHMoKSB0byB2YWxpZGF0ZSB0aGUgc3RhcnRpbmcgb2Zm
c2V0CmFnYWluc3QgdGhlIGRldmljZSBzaXplIGJlZm9yZSBjb21wYXJpbmcgb3BzLT5sZW4gd2l0
aCB0aGUgcmVtYWluaW5nCmNhcGFjaXR5LCBhdm9pZGluZyBhbiBpbnRlZ2VyIG92ZXJmbG93IGlu
IG9mZnMgKyBvcHMtPmxlbi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBi
L2RyaXZlcnMvbXRkL210ZGNvcmUuYwo+IGluZGV4IDQ5MWEyN2QwMzE1ZmEuLmRkYTk3NmVmNTJj
OWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCj4gKysrIGIvZHJpdmVycy9t
dGQvbXRkY29yZS5jCj4gQEAgLTE2NzAsNyArMTY3MCw3IEBAIHN0YXRpYyBpbnQgbXRkX2NoZWNr
X29vYl9vcHMoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZmZzLAo+ICAJaWYgKCFvcHMt
Pm9vYmJ1ZikKPiAgCQlvcHMtPm9vYmxlbiA9IDA7Cj4gIAo+IC0JaWYgKG9mZnMgPCAwIHx8IG9m
ZnMgKyBvcHMtPmxlbiA+IG10ZC0+c2l6ZSkKPiArCWlmIChvZmZzIDwgMCB8fCBvZmZzID4gbXRk
LT5zaXplIHx8IG9wcy0+bGVuID4gbXRkLT5zaXplIC0gb2ZmcykKPiAgCQlyZXR1cm4gLUVJTlZB
TDsKCltTZXZlcml0eTogSGlnaF0KRG9lcyBhbGxvd2luZyBvZmZzID09IG10ZC0+c2l6ZSB3aGVu
IG9wcy0+bGVuID09IDAgaGVyZSBsZWF2ZSB0d28KaXNzdWVzIHdoZW4gcmVxdWVzdHMgYXJlIG1h
ZGUgYXQgdGhlIGV4YWN0IGVuZCBvZiB0aGUgZGV2aWNlPwoKRmlyc3QsIGZvciBhbiBPT0Itb25s
eSByZXF1ZXN0IChvcHMtPmRhdGJ1ZiA9PSBOVUxMLCBvcHMtPmxlbiA9PSAwLApvcHMtPm9vYmxl
biA+IDApIGF0IG9mZnMgPT0gbXRkLT5zaXplLCBleGVjdXRpb24gZW50ZXJzIHRoZSBpZiAob3Bz
LT5vb2JsZW4pCmJsb2NrIGluIG10ZF9jaGVja19vb2Jfb3BzKCk6CgoJaWYgKG9wcy0+b29ibGVu
KSB7CgkJc2l6ZV90IG1heG9vYmxlbjsKCgkJaWYgKG9wcy0+b29ib2ZmcyA+PSBtdGRfb29iYXZh
aWwobXRkLCBvcHMpKQoJCQlyZXR1cm4gLUVJTlZBTDsKCgkJbWF4b29ibGVuID0gKChzaXplX3Qp
KG10ZF9kaXZfYnlfd3MobXRkLT5zaXplLCBtdGQpIC0KCQkJCSAgICAgIG10ZF9kaXZfYnlfd3Mo
b2ZmcywgbXRkKSkgKgoJCQkgICAgIG10ZF9vb2JhdmFpbChtdGQsIG9wcykpIC0gb3BzLT5vb2Jv
ZmZzOwoJCWlmIChvcHMtPm9vYmxlbiA+IG1heG9vYmxlbikKCQkJcmV0dXJuIC1FSU5WQUw7Cgl9
CgpXaGVuIG9mZnMgPT0gbXRkLT5zaXplLCBtdGRfZGl2X2J5X3dzKG10ZC0+c2l6ZSwgbXRkKSAt
IG10ZF9kaXZfYnlfd3Mob2ZmcywgbXRkKQppcyAwLiBJZiAwIDwgb3BzLT5vb2JvZmZzIDwgbXRk
X29vYmF2YWlsKG10ZCwgb3BzKSwgc3VidHJhY3Rpbmcgb3BzLT5vb2JvZmZzCmZyb20gMCB3cmFw
cyB0aGUgdW5zaWduZWQgc2l6ZV90IG1heG9vYmxlbiB0byBTSVpFX01BWCAtIG9wcy0+b29ib2Zm
cyArIDEuClRoZSBvcHMtPm9vYmxlbiA+IG1heG9vYmxlbiBjaGVjayB0aGVuIGZhaWxzIHRvIHJl
amVjdCB0aGUgcmVxdWVzdCwgYW5kCm10ZF9yZWFkX29vYigpIG9yIG10ZF93cml0ZV9vb2IoKSBm
b3J3YXJkcyBhbiBvdXQtb2YtcmFuZ2UgT09CIG9wZXJhdGlvbiBhdApvZmZzID09IG10ZC0+c2l6
ZSB0byB0aGUgZHJpdmVyLiBUaGlzIGNhbiBiZSB0cmlnZ2VyZWQgZnJvbSB1c2Vyc3BhY2Ugdmlh
Cm10ZGNoYXJfcmVhZG9vYigpIG9yIG10ZGNoYXJfd3JpdGVvb2IoKSB3aGVuIHN0YXJ0ID09IG10
ZC0+c2l6ZSArIDEgYW5kCmxlbmd0aCA9PSAxOgoKCW9wcy5vb2JsZW4gPSBsZW5ndGg7CglvcHMu
b29ib2ZmcyA9IHN0YXJ0ICYgKG10ZC0+d3JpdGVzaXplIC0gMSk7CglvcHMuZGF0YnVmID0gTlVM
TDsKCS4uLgoJc3RhcnQgJj0gfigodWludDY0X3QpbXRkLT53cml0ZXNpemUgLSAxKTsKCXJldCA9
IG10ZF93cml0ZV9vb2IobXRkLCBzdGFydCwgJm9wcyk7CgpTZWNvbmQsIGV2ZW4gd2hlbiBib3Ro
IG9wcy0+bGVuID09IDAgYW5kIG9wcy0+b29ibGVuID09IDAgYXQgb2ZmcyA9PSBtdGQtPnNpemUs
Cm5laXRoZXIgbXRkX2NoZWNrX29vYl9vcHMoKSBub3IgbXRkX3JlYWRfb29iKCkgLyBtdGRfd3Jp
dGVfb29iKCkgc2hvcnQtY2lyY3VpdHMKemVyby1sZW5ndGggcmVxdWVzdHMgYmVmb3JlIGNhbGxp
bmcgaW50byB0aGUgZHJpdmVyIHZpYSBtdGRfcmVhZF9vb2Jfc3RkKCkgb3IKbXRkX3dyaXRlX29v
Yl9zdGQoKS4gRHJpdmVycyBzdWNoIGFzIG5hbmRfZG9fcmVhZF9vcHMoKSBhbmQgbmFuZF9kb19y
ZWFkX29vYigpCmluIGRyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRfYmFzZS5jIGltbWVkaWF0ZWx5
IGNvbXB1dGUgdGhlIHRhcmdldCBjaGlwIGZyb20KdGhlIG9mZnNldCBiZWZvcmUgY2hlY2tpbmcg
dGhlIGxlbmd0aDoKCgljaGlwbnIgPSAoaW50KShmcm9tID4+IGNoaXAtPmNoaXBfc2hpZnQpOwoJ
bmFuZF9zZWxlY3RfdGFyZ2V0KGNoaXAsIGNoaXBucik7CgpXaGVuIGZyb20gPT0gbXRkLT5zaXpl
IG9uIHRoZSBtYXN0ZXIgZGV2aWNlLCBjaGlwbnIgZXF1YWxzCm5hbmRkZXZfbnRhcmdldHMoJmNo
aXAtPmJhc2UpLCB0cmlnZ2VyaW5nIHRoZSBXQVJOX09OIGluIG5hbmRfc2VsZWN0X3RhcmdldCgp
CmFuZCBpc3N1aW5nIGFuIG91dC1vZi1ib3VuZHMgcGFnZSBvcGVyYXRpb24uCgpTaG91bGQgbXRk
X2NoZWNrX29vYl9vcHMoKSByZWplY3Qgb2ZmcyA+PSBtdGQtPnNpemUgKG9yIHNob3J0LWNpcmN1
aXQgZW1wdHkKb3BlcmF0aW9ucyBpbiBtdGRfcmVhZF9vb2IoKSBhbmQgbXRkX3dyaXRlX29vYigp
IHdoaWxlIHJlamVjdGluZwpvZmZzID49IG10ZC0+c2l6ZSBmb3IgYW55IG5vbi1lbXB0eSBkYXRh
IG9yIE9PQiByZXF1ZXN0KSwgc2ltaWxhciB0byBob3cKbXRkX3BvaW50KCksIG10ZF91bnBvaW50
KCksIGFuZCBtdGRfcGFuaWNfd3JpdGUoKSBjaGVjayBvZmZzID49IG10ZC0+c2l6ZT8KCi0tIApT
YXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEx
MDQtc3VibWl0LW10ZC1vb2ItYm91bmRzLXYxLXYxLTEtMDUyMDlmY2U1YTNlQGdtYWlsLmNvbT9w
YXJ0PTEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
