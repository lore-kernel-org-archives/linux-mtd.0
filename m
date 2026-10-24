Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA3A606A322
	for <linux-mtd@archiver.kernel.org>; Sat, 24 Oct 2026 00:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gggi3R5A;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZI8wNMAW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h3X2t49f6c8aETyGfULCIklVuxaKtMlZwVgc1vEPjos=; b=Gggi3R5Aq5xn3t0D1pKxp6X5GP
	Ci7qGYG8jF2RL7pTS1EsDANjAo7PeQRl1/LUTkAceb1CQAw8iVT8G43FDL3uZzgu/wTm/5351tUXo
	IRFIEJd8w1Gj1RqeoUjl0HyqH0Pd0v5PKm1cmVsKT3m2U3Yr9MxuWg7pPLk60ABZZ5xY+EU/QmK0g
	5yU9X4xmiCKdyOrvEhKlE79RlieY1e8pJNaT8b6f2w/GOmXiOBvXRqDXtvuYl4S+HJ2xEtOum/g6+
	DfGQt4kCZpxFcQ4Ed4KjDqsYtyJgIz8AKQcXGGvASSsRlGfYIsJddCUgxVi0meaITGfDOnkxXKzCQ
	U7wP1Sdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjP-0000000HFxl-2SrX;
	Sat, 24 Oct 2026 00:35:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjO-0000000HFxf-1hQw
	for linux-mtd@lists.infradead.org;
	Sat, 24 Oct 2026 00:35:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D083040804;
	Sat, 24 Oct 2026 00:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550FC1F01825;
	Sat, 24 Oct 2026 00:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792802129;
	bh=xeXBCU5odziayrve+cfk+4wfqKSLCL6LwV1dkT233bk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZI8wNMAWLJVQslViA3GTpogEhQBdGVITN616TGqOVYyprqEEirRDGxhRwmxD7qipR
	 OsQWHa+QmjwdO8bLpv+QmakiOQIC3mDwJESJBQorMd43SDDb/VccOJQwzU+QGvKTgT
	 t8cvKe3ejbtzeXMqJX3GDXoRegWC7jAJMgpBrAHc4DT24tdqY02Qwt3Ukp6LWoizBE
	 QYOL/H8ppGg2mx38itzLiZVATMXWltMjim/HqrGELIXJASMAe/P2nVo/1n7NGdyU0C
	 m4Ai7pqrYH4Ru8fIYdRDKuMqcaccPZ6G25n7d5lI6kB6IdlFQBKYa+Tq9ypU/3cTMp
	 zE/CS8VlwQO+A==
Message-ID: <sashiko-outbox-183460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: Describe locking support for
 MX25L51245G
To: "Marek Vasut" <marex@nabladev.com>, linux-mtd@lists.infradead.org
Cc: "Cheng Ming Lin" <chengminglin@mxic.com.tw>, "Michael Walle" <mwalle@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
In-Reply-To: <20261024001658.222147-1-marex@nabladev.com>
References: <20261024001658.222147-1-marex@nabladev.com>
Date: Sat, 24 Oct 2026 00:35:28 +0000
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
bWFjcm9uaXg6IHVuaGFuZGxlZCAtRU9QTk9UU1VQUCBpbiBteDI1bDUxMjQ1X2xhdGVfaW5pdF9m
aXh1cHMoKQotLQoKY29tbWl0IDk4YTM5NTMwMmQwYmJmMDU5ZTFkMTJjODhkZjRjNjMwZjdkZTIz
ZjgKQXV0aG9yOiBNYXJlayBWYXN1dCA8bWFyZXhAbmFibGFkZXYuY29tPgoKbXRkOiBzcGktbm9y
OiBEZXNjcmliZSBsb2NraW5nIHN1cHBvcnQgZm9yIE1YMjVMNTEyNDVHCgpUaGlzIHBhdGNoIGlu
dHJvZHVjZXMgYSAubGF0ZV9pbml0IGZpeHVwIGZvciBNWDI1TDUxMjQ1RyAoSkVERUMgSUQgMHhj
MjIwMWEpCnRoYXQgcmVhZHMgdGhlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgKG9wY29kZSAweDE1
KSB0byBjaGVjayB0aGUgT1RQIFRCIGJpdAphbmQgY29uZGl0aW9uYWxseSBlbmFibGVzIDQtQlAg
dG9wLW9ubHkgbG9ja2luZyBzdXBwb3J0LgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3Bp
LW5vci9tYWNyb25peC5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9tYWNyb25peC5jCj4gaW5kZXgg
YjNmZGI0YjJmYTFjYS4uMTFlNzFlMjU0YTU0YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL21hY3Jvbml4LmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL21hY3Jvbml4LmMK
PiBAQCAtMTUsNiArMTUsOSBAQAo+ICAjZGVmaW5lIE1YSUNfTk9SX1JFR19ET1BJX0VOCTB4MgkJ
LyogRW5hYmxlIE9jdGFsIERUUiAqLwo+ICAjZGVmaW5lIE1YSUNfTk9SX1JFR19TUElfRU4JMHgw
CQkvKiBFbmFibGUgU1BJICovCj4gIAo+ICsjZGVmaW5lIE1YMjVMNTEyNDVHX09QX1JEQ1IJMHgx
NQo+ICsjZGVmaW5lIE1YMjVMNTEyNDVHX0NSX1RCCUJJVCgzKQo+ICsKPiAgLyogQ29udmVydCBk
dW1teSBjeWNsZXMgdG8gYml0IHBhdHRlcm4gKi8KPiAgI2RlZmluZSBNWElDX05PUl9SRUdfREMo
cCkgXAo+ICAJKCgyMCAtIChwKSkgPj4gMSkKPiBAQCAtMjUsNiArMjgsNDkgQEAKPiAgCQkgICBT
UElfTUVNX09QX05PX0RVTU1ZLAkJCQlcCj4gIAkJICAgU1BJX01FTV9PUF9EQVRBX09VVChuZGF0
YSwgYnVmLCAwKSkKPiAgCj4gK3N0YXRpYyBpbnQgbXgyNWw1MTI0NV9yZWFkX2NyKHN0cnVjdCBz
cGlfbm9yICpub3IsIHU4ICpjcikKPiArewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAobm9yLT5z
cGltZW0pIHsKPiArCQlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSV9NRU1fT1AoU1BJX01FTV9P
UF9DTUQoTVgyNUw1MTI0NUdfT1BfUkRDUiwgMCksCj4gKwkJCQkJCSAgU1BJX01FTV9PUF9OT19B
RERSLCBTUElfTUVNX09QX05PX0RVTU1ZLAo+ICsJCQkJCQkgIFNQSV9NRU1fT1BfREFUQV9JTigx
LCBjciwgMCkpOwo+ICsKPiArCQlzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChub3IsICZvcCwgbm9y
LT5yZWdfcHJvdG8pOwo+ICsKPiArCQlyZXQgPSBzcGlfbWVtX2V4ZWNfb3Aobm9yLT5zcGltZW0s
ICZvcCk7Cj4gKwl9IGVsc2Ugewo+ICsJCXJldCA9IHNwaV9ub3JfY29udHJvbGxlcl9vcHNfcmVh
ZF9yZWcobm9yLCBNWDI1TDUxMjQ1R19PUF9SRENSLCBjciwgMSk7Cj4gKwl9Cj4gKwo+ICsJaWYg
KHJldCkKPiArCQlkZXZfZGJnKG5vci0+ZGV2LCAiZXJyb3IgJWQgcmVhZGluZyBDUlxuIiwgcmV0
KTsKPiArCj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IG14MjVsNTEyNDVf
bGF0ZV9pbml0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+ICt7Cj4gKwlpbnQgcmV0Owo+
ICsKPiArCXJldCA9IG14MjVsNTEyNDVfcmVhZF9jcihub3IsIG5vci0+Ym91bmNlYnVmKTsKPiAr
CWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKCltTZXZlcml0eTogSGlnaF0KQ291bGQgcmV0dXJu
aW5nIC1FT1BOT1RTVVBQIGZyb20gbXgyNWw1MTI0NV9sYXRlX2luaXRfZml4dXBzKCkgY2F1c2Ug
YSBwcm9iZQpyZWdyZXNzaW9uIG9uIGNvbnRyb2xsZXJzIHdpdGggcmVzdHJpY3RlZCBvcGNvZGUg
c2V0cz8KCkR1cmluZyBwcm9iZSwgdGhlIGNhbGwgY2hhaW4gaXM6CgogIHNwaV9ub3JfcHJvYmUo
KQogICAgc3BpX25vcl9zY2FuKCkKICAgICAgc3BpX25vcl9pbml0X3BhcmFtcygpCiAgICAgICAg
c3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKCkKICAgICAgICAgIG14MjVsNTEyNDVfbGF0ZV9pbml0
X2ZpeHVwcygpCiAgICAgICAgICAgIG14MjVsNTEyNDVfcmVhZF9jcigpCiAgICAgICAgICAgICAg
c3BpX21lbV9leGVjX29wKCkKCkluIGRyaXZlcnMvc3BpL3NwaS1tZW0uYzpzcGlfbWVtX2V4ZWNf
b3AoKToKCglpZiAoIXNwaV9tZW1faW50ZXJuYWxfc3VwcG9ydHNfb3AobWVtLCBvcCkpCgkJcmV0
dXJuIC1FT1BOT1RTVVBQOwoKT24gcmVzdHJpY3RlZCBTUEkgY29udHJvbGxlcnMgc3VjaCBhcyBk
cml2ZXJzL3NwaS9zcGktaW50ZWwuYywKaW50ZWxfc3BpX3N1cHBvcnRzX21lbV9vcCgpIGNoZWNr
cyB0aGUgb3BlcmF0aW9uIGFnYWluc3QKSU5URUxfU1BJX0dFTkVSSUNfT1BTIHZpYSBpbnRlbF9z
cGlfbWF0Y2hfbWVtX29wKCk6CgoJaW9wID0gaW50ZWxfc3BpX21hdGNoX21lbV9vcChpc3BpLCBv
cCk7CglpZiAoIWlvcCkgewoJCWRldl9kYmcoaXNwaS0+ZGV2LCAiJSN4IG5vdCBzdXBwb3J0ZWRc
biIsIG9wLT5jbWQub3Bjb2RlKTsKCQlyZXR1cm4gZmFsc2U7Cgl9CgpQcmV2aW91c2x5LCBmbGFz
aGVzIG1hdGNoaW5nIEpFREVDIElEIDB4YzIyMDFhIHVzZWQgbWFjcm9uaXhfcXBwNGJfZml4dXBz
IGFuZApwcm9iZWQgdXNpbmcgc3RhbmRhcmQgb3Bjb2RlcyBwcmVzZW50IGluIElOVEVMX1NQSV9H
RU5FUklDX09QUy4gQmVjYXVzZQpNWDI1TDUxMjQ1R19PUF9SRENSICgweDE1KSBpcyBub3QgaW4g
SU5URUxfU1BJX0dFTkVSSUNfT1BTLApteDI1bDUxMjQ1X3JlYWRfY3IoKSByZXR1cm5zIC1FT1BO
T1RTVVBQLCB3aGljaCBjYXVzZXMKc3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKCkgYW5kIHNwaV9u
b3Jfc2NhbigpIHRvIGZhaWwgcHJvYmUgZW50aXJlbHkuCgpTaG91bGQgbXgyNWw1MTI0NV9sYXRl
X2luaXRfZml4dXBzKCkgaWdub3JlIC1FT1BOT1RTVVBQIChsZWF2aW5nClNOT1JfRl9IQVNfTE9D
SyB1bnNldCBhbmQgcmV0dXJuaW5nIDApIHdoZW4gdGhlIGNvbnRyb2xsZXIgZG9lcyBub3Qgc3Vw
cG9ydApyZWFkaW5nIENSPwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlr
by5kZXYvIy9wYXRjaHNldC8yMDI2MTAyNDAwMTY1OC4yMjIxNDctMS1tYXJleEBuYWJsYWRldi5j
b20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
