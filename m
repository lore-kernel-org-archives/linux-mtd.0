Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A768C88E64
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUyhnqw3F0xnQbJQc/eC19Xmzy8bFqM0tPxvuNlm7fI=; b=pDb5INE/m57J/z
	QF/XgFH+ps7J9mqB+isMgPxiTy7T2cd6iEeu6bT6HniHNQcffm/gjka3WjcAbh9aPVa520WUEG3YT
	6J2KWtPV2Q3aPtG7jf+AmcVJUTNhfILx74NPrqWH1t820cLEh8kGlfgZPuGzgwlZ3KdOmQOUnyeF+
	RhJew8y2WRZahJWL9TtHcTQri2G97NTYx5LnS4WbESIGZeVKrxp9OXy+pRHLEanrqYMM8a0jdP2cM
	5YZESY3yVjPVPLj1aVlKHlKne84DiSFM49+ohii8hanYPePtigdyuvpbTHrP7rI8eZ7Py55JOYIZA
	3xp0NGitB4lF1Psz9zsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61xB-00000002iPZ-37QV;
	Mon, 14 Sep 2026 08:22:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61xA-00000002iP6-2TVm
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:22:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BC3F560008;
	Mon, 14 Sep 2026 08:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53281F000FF;
	Mon, 14 Sep 2026 08:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374135;
	bh=guhZ8FW83pVELG408pA0FyuTIeBbIAqtyDJVtprHt5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VT0aqoxNJoMyCEsElwqUdK6d8/rVV7fP8NxuVYjX2/7IkgG82xxL9rGYbl8wTy9G5
	 6htHWfBvu4f7HhfR/YPUrrsOc3nUKl5IUsiIZnuRMG7DCoNNj4v5Pdy+dmTJrnB4af
	 H+aIO5tTWiWmSHjjfMBbAsVyuYXfkWfGEUkv3CuUkMKufgEkze6+t4gKy5CsKiYi4w
	 IUwk3PiwNC1RmVsiaq1ZodHpaQHmgDC1fKVbHY0bcD6yfPpSS2za4vghcmtqMEKr6W
	 wZM2vnbxchuzQtamydqPVkQzP0Y1CPP43asMml4a17L53cUWXq7+xqO8Hv0e+ttn95
	 Y0wH6cqNARM/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: fix the lock left held by
 spi_nor_rww_start_exclusive()
To: pratyush@kernel.org, mwalle@kernel.org, "Itai Handler" <itai.handler@gmail.com>
Cc: takahiro.kuwano@infineon.com, linux-kernel@vger.kernel.org, vigneshr@ti.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, stable@vger.kernel.org, richard@nod.at
In-Reply-To: <20260914081149.1916589-2-itai.handler@gmail.com>
References: <20260914081149.1916589-1-itai.handler@gmail.com>
 <20260914081149.1916589-2-itai.handler@gmail.com>
Date: Mon, 14 Sep 2026 08:22:14 +0000
Message-Id: <20260914082214.E53281F000FF@smtp.kernel.org>
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6CgpQcmUtZXhpc3RpbmcgaXNzdWVzOgot
IFtIaWdoXSBNaXNzaW5nIHNwaV9ub3JfdW5wcmVwKCkgb24gZXJyb3IgcGF0aCB3aGVuIHdhaXRf
ZXZlbnRfa2lsbGFibGUoKSBmYWlscyBpbiBzcGlfbm9yX3ByZXBfYW5kX2xvY2soKSBhbmQgaXRz
IHZhcmlhbnRzLgotLQoKY29tbWl0IGM4MTc4MDE3NzJjZDg3YzlkNWZlMTAxZTY3ZjE0YmYwZDA2
Yzk3ZGYKQXV0aG9yOiBJdGFpIEhhbmRsZXIgPGl0YWkuaGFuZGxlckBnbWFpbC5jb20+ClN1Ympl
Y3Q6IG10ZDogc3BpLW5vcjogZml4IHRoZSBsb2NrIGxlZnQgaGVsZCBieSBzcGlfbm9yX3J3d19z
dGFydF9leGNsdXNpdmUoKQoKVGhpcyBjb21taXQgY2hhbmdlcyBzcGlfbm9yX3J3d19zdGFydF9l
eGNsdXNpdmUoKSB0byB1c2Ugc2NvcGUtYmFzZWQKbXV0ZXggY2xlYW51cCBoZWxwZXJzIGluc3Rl
YWQgb2YgbWFudWFsbHkgbG9ja2luZyB3aXRob3V0IHVubG9ja2luZy4KVGhpcyBmaXhlcyBhIGRl
YWRsb2NrIGFuZCBhbGxvd3Mgb3BlcmF0aW9ucyB0byBwcm9jZWVkIHdoZW4gdGhlIGZsYXNoCmlz
IGJ1c3kgYnkgZW5zdXJpbmcgdGhlIG11dGV4IGlzIHJlbGVhc2VkIHVwb24gcmV0dXJuaW5nLgoK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+IGluZGV4IGNjZjQzOTZjZGNkMDQuLjhiYzExN2I0NmUwMjggMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+IEBAIC0xMzEwLDcgKzEzMTAsNyBAQCBzdGF0aWMgYm9vbCBzcGlfbm9y
X3J3d19zdGFydF9leGNsdXNpdmUoc3RydWN0IHNwaV9ub3IgKm5vcikKPiAgewo+ICAJc3RydWN0
IHNwaV9ub3Jfcnd3ICpyd3cgPSAmbm9yLT5yd3c7Cj4gIAo+IC0JbXV0ZXhfbG9jaygmbm9yLT5s
b2NrKTsKPiArCWd1YXJkKG11dGV4KSgmbm9yLT5sb2NrKTsKPiAgCj4gIAlpZiAocnd3LT5vbmdv
aW5nX2lvIHx8IHJ3dy0+b25nb2luZ19yZCB8fCByd3ctPm9uZ29pbmdfcGUpCj4gIAkJcmV0dXJu
IGZhbHNlOwoKW1NldmVyaXR5OiBIaWdoXQpUaGlzIGlzIGEgcHJlLWV4aXN0aW5nIGlzc3VlLCBi
dXQgd2hpbGUgcmV2aWV3aW5nIHRoZSB3YWl0IGNvbmRpdGlvbiBoZXJlLApJIG5vdGljZWQgYSBt
aXNzaW5nIGNsZWFudXAgcGF0aCBpbiBzcGlfbm9yX3ByZXBfYW5kX2xvY2soKSBhbmQgaXRzIHBy
b2dyYW0sCmVyYXNlLCBhbmQgcmVhZCB2YXJpYW50cy4KCkxvb2tpbmcgYXQgc3BpX25vcl9wcmVw
X2FuZF9sb2NrKCkgaW4gZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMsIGl0IHN0YXJ0cwpieSBj
YWxsaW5nIHNwaV9ub3JfcHJlcCgpIHdoaWNoIGFjcXVpcmVzIHJlc291cmNlcyBsaWtlIGEgaGFy
ZHdhcmUgbXV0ZXggYW5kCmNsb2NrLiBXaGVuIHBhcmFsbGVsIGxvY2tpbmcgaXMgZW5hYmxlZCwg
aXQgY2FsbHMgd2FpdF9ldmVudF9raWxsYWJsZSgpOgoKZHJpdmVycy9tdGQvc3BpLW5vci9jb3Jl
LmM6c3BpX25vcl9wcmVwX2FuZF9sb2NrKCkgewogICAgLi4uCglyZXQgPSBzcGlfbm9yX3ByZXAo
bm9yKTsKCWlmIChyZXQpCgkJcmV0dXJuIHJldDsKCglpZiAoIXNwaV9ub3JfdXNlX3BhcmFsbGVs
X2xvY2tpbmcobm9yKSkKCQltdXRleF9sb2NrKCZub3ItPmxvY2spOwoJZWxzZQoJCXJldCA9IHdh
aXRfZXZlbnRfa2lsbGFibGUobm9yLT5yd3cud2FpdCwKCQkJCQkgIHNwaV9ub3Jfcnd3X3N0YXJ0
X2V4Y2x1c2l2ZShub3IpKTsKCglyZXR1cm4gcmV0Owp9CgpJZiB3YWl0X2V2ZW50X2tpbGxhYmxl
KCkgaXMgaW50ZXJydXB0ZWQgYnkgYSBmYXRhbCBzaWduYWwsIGl0IHJldHVybnMKLUVSRVNUQVJU
U1lTLiBEb2VzIHRoaXMgZGlyZWN0bHkgcmV0dXJuIHRoZSBlcnJvciBhbmQgc2tpcCBzcGlfbm9y
X3VucHJlcCgpPwoKU2luY2UgdGhlIGNvbnRyb2xsZXIncyAucHJlcGFyZSBob29rIGFjcXVpcmVz
IGhhcmR3YXJlIHJlc291cmNlcywgd291bGQKcmV0dXJuaW5nIGRpcmVjdGx5IGhlcmUgY2F1c2Ug
YSBwZXJtYW5lbnQgZGVhZGxvY2sgb24gdGhlIG5leHQgYWNjZXNzIGFuZCBhCnJlc291cmNlIGxl
YWs/CgpVc2Vyc3BhY2UgdHJpZ2dlcmluZyBJL08gb24gYW4gUldXIGZsYXNoIGNhbiBiZSBzaWdu
YWxlZCB3aGlsZSB3YWl0aW5nIGZvcgpvbmdvaW5nIEkvTyB0byBmaW5pc2gsIHNvIHRoaXMgZXJy
b3IgcGF0aCBzZWVtcyByZWFjaGFibGUuIAoKRG9lcyB0aGlzIHNhbWUgcGF0dGVybiBhcHBlYXIg
aW4gc3BpX25vcl9wcmVwX2FuZF9sb2NrX3BlKCkgdXNpbmcKc3BpX25vcl9yd3dfc3RhcnRfcGUo
KSBhbmQgaW4gc3BpX25vcl9wcmVwX2FuZF9sb2NrX3JkKCkgdXNpbmcKc3BpX25vcl9yd3dfc3Rh
cnRfcmQoKT8KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjA5MTQwODExNDkuMTkxNjU4OS0xLWl0YWkuaGFuZGxlckBnbWFpbC5jb20/
cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
