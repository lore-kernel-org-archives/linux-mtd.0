Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A50606A334
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 23:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T+11tlUf;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WUtlTmpR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V2ZfYMAM6OVv0oeYLY6WfB3R/njALvfjjMiA4KmBmug=; b=T+11tlUf1ah7yOloHwb4mdO8Aj
	Z3egStE+YBGjOcVN7NWJz2YAhr3WF1ZuvOz9yMAASyEhaAnx/DWPR+qskAroQ6jELNT6+6yDDE4ak
	A45Lv6Ard7sbXLVfFCjDaL7Yy68c8bXCKFDRDn0Fm+jpOFPTrg+sA2cJ/JcxATYB8EOESBUng93D5
	hvXJ2ov/AOBl9rdmpbZhbXX7Dn9CAuxfceOfX6MPL6XZ31pP4j15w1x8Hoh8IRyLjsLJ4ExWf5tb5
	v5jy4mG4tbl9T4LxoQJnGfenhB+eQIFqAH/YvQPU8rboeIVqkqN7zWGe12wx2rLEXhXt+yDQfqywy
	Fk3yZmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuwJ-00000000YXw-3lRw;
	Sat, 21 Nov 2026 23:56:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUuwH-00000000YXI-15Zp
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 23:56:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BDC24446E8;
	Sat, 21 Nov 2026 23:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE121F000C6;
	Sat, 21 Nov 2026 23:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795305371;
	bh=8VZUzEaLVXB2uioSeHz7Q9Ov/sdCniXCNcl2ZbM59cQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WUtlTmpRIF9aBv4cfy0s1iNz6DzAIzpA/sEsl9OZ7aYS3mcxFZ6uAV0WNwqItXSyn
	 Z1GrwHiL8o/b3TSyfoznnoey2/GjWsXFxtSgNm+1yKWU4LlCkjbe6dNHiq6+QmiOT5
	 BpZ4hJImnaRG4jbQJ7g1brC4YFCe97EQER4wJHJ+NsEvf9IqW83xmogsyicZBJ8NYY
	 ow81CoL6dM5DIdJ7K2rfrBWv5adravjAmklLPPXhU5lKdloowMt9j9yXtTaO3WNGrh
	 pv66EcHjhdmHH9xkQj7BzvsmhHeiQ9+eICwSErknLrWuGy8tvH7GJqNGW4bbHG9tnV
	 sxcb/t5gKhIvQ==
Message-ID: <sashiko-outbox-227519@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: spinand: micron: add support for MT29F1G01AAADD
To: =?utf-8?b?VsOtdCBLYXrDrWs=?= <vitkazik@vitkazik.cz>, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Cc: tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org
In-Reply-To: <20261121234125.16093-1-vitkazik@vitkazik.cz>
References: <20261121234125.16093-1-vitkazik@vitkazik.cz>
Date: Sat, 21 Nov 2026 23:56:10 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbXRkOiBzcGluYW5kOiBt
aWNyb246IGRpdmlkZS1ieS16ZXJvIGluCiAgbWljcm9uXzRfb29ibGF5b3V0X2VjYygpIHdoZW4g
bm8gRUNDCi0tCgpjb21taXQgNGM0MGFlZjA1OTI0NjNlZjEwMjdiOTA3MGIyMjljZjg0MTIxMmQ4
MgpBdXRob3I6IFbDrXQgS2F6w61rIDx2aXRrYXppa0B2aXRrYXppay5jej4KCm10ZDogc3BpbmFu
ZDogbWljcm9uOiBhZGQgc3VwcG9ydCBmb3IgTVQyOUYxRzAxQUFBREQKClRoaXMgY29tbWl0IGFk
ZHMgU1BJIE5BTkQgdGFibGUgc3VwcG9ydCBhbmQgYW4gT09CIGxheW91dCBkZWZpbml0aW9uIGZv
ciB0aGUKTWljcm9uIE1UMjlGMUcwMUFBQUREIChNNjhBKSBmbGFzaCBjaGlwLgoKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Nw
aS9taWNyb24uYwo+IGluZGV4IDM2ZjZjYmJkNzQ2MmMuLmNjNmVmZjBlNTRjMjQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvbWljcm9uLmMKPiArKysgYi9kcml2ZXJzL210ZC9u
YW5kL3NwaS9taWNyb24uYwo+IEBAIC0xMzQsNiArMTM0LDIzIEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgbXRkX29vYmxheW91dF9vcHMgbWljcm9uXzRfb29ibGF5b3V0ID0gewo+ICAJLmZyZWUgPSBt
aWNyb25fNF9vb2JsYXlvdXRfZnJlZSwKPiAgfTsKPiAgCj4gK3N0YXRpYyBpbnQgbWljcm9uX202
OGFfb29ibGF5b3V0X2ZyZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAo+ICsJ
CQkJICAgICAgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCj4gK3sKPiArCWlmIChzZWN0
aW9uID49IDQpCj4gKwkJcmV0dXJuIC1FUkFOR0U7Cj4gKwo+ICsJcmVnaW9uLT5vZmZzZXQgPSAo
c2VjdGlvbiAqIDE2KSArIDI7Cj4gKwlyZWdpb24tPmxlbmd0aCA9IDY7Cj4gKwo+ICsJcmV0dXJu
IDA7Cj4gK30KPiArCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMgbWlj
cm9uX202OGFfb29ibGF5b3V0ID0gewo+ICsJLmVjYyA9IG1pY3Jvbl80X29vYmxheW91dF9lY2Ms
Cj4gKwkuZnJlZSA9IG1pY3Jvbl9tNjhhX29vYmxheW91dF9mcmVlLAo+ICt9OwoKW1NldmVyaXR5
OiBNZWRpdW1dCkNhbiB3aXJpbmcgbWljcm9uXzRfb29ibGF5b3V0X2VjYyBpbnRvIG1pY3Jvbl9t
NjhhX29vYmxheW91dCBjYXVzZSBhIGRpdmlkZSBieQp6ZXJvIGluIG1pY3Jvbl80X29vYmxheW91
dF9lY2MoKSB3aGVuIHRoZSBkZXZpY2UgaXMgcHJvYmVkIHdpdGhvdXQgYW4gRUNDCmVuZ2luZSAo
c3VjaCBhcyB3aXRoIG5hbmQtbm8tZWNjLWVuZ2luZSBpbiBEZXZpY2UgVHJlZSk/Cgpkcml2ZXJz
L210ZC9uYW5kL3NwaS9taWNyb24uYzptaWNyb25fNF9vb2JsYXlvdXRfZWNjKCkgewogICAgLi4u
CglpZiAoc2VjdGlvbiA+PSBzcGluYW5kLT5iYXNlLm1lbW9yZy5wYWdlc2l6ZSAvCgkJCW10ZC0+
ZWNjX3N0ZXBfc2l6ZSkKCQlyZXR1cm4gLUVSQU5HRTsKICAgIC4uLgp9CgpXaGVuICFuYW5kLT5l
Y2MuZW5naW5lLCBzcGluYW5kX2luaXQoKSBzdGlsbCBpbnN0YWxscwpzcGluYW5kLT5lY2NpbmZv
Lm9vYmxheW91dCB3aGlsZSBsZWF2aW5nIG10ZC0+ZWNjX3N0ZXBfc2l6ZSBhdCAwLiAgRHVyaW5n
CnNwaW5hbmRfcHJvYmUoKSwgbXRkX2RldmljZV9yZWdpc3RlcigpIC0+IGFkZF9tdGRfZGV2aWNl
KCkgLT4KbXRkX2RlYnVnZnNfcG9wdWxhdGUoKSBjYWxscyBtdGRfb29ibGF5b3V0X2VjYyhtdGQs
IDAsICZyZWdpb24pLCB3aGljaCBpbnZva2VzCm1pY3Jvbl80X29vYmxheW91dF9lY2MoKSBhbmQg
ZGl2aWRlcyBieSBtdGQtPmVjY19zdGVwX3NpemUuCgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMTIxMjM0MTI1LjE2MDkzLTEtdml0
a2F6aWtAdml0a2F6aWsuY3o/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
