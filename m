Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9266606A31C
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VYHqxSo2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m/CME3Fz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EuZqMHhtEJQm/S5VtKc2QInos35s6afRq/5bP9RSE8s=; b=VYHqxSo2z7m/IIOz0qLpQN5OlV
	J+eDIcYcMl8aLxsVfNydWa5ZrCixBRW4lReW8DsrvdZlwRHQ/QXRxfnyO200hBYLf9x2M8yWPGcjX
	W3tyQ4MmxE0mm2u9uwQQYA4gu8MvBYbMXRdumKRmaZO5iEu8DYkVaPf4gbds1V9dD+IlUtYnfSBXF
	DZaTzBF0DyyKY13kBe3yxosKKWu2gK//M+5GCXQXXYNRgpumT5coWMcYqM7jzw5u5JFLekNr3G8B4
	mZsrjgE0zJONNCvceqAvzZw+P26SbiXoGApBHwtE9axqFKsIgM3bQMGUoEePCBzzMFjFHS0qfm7o8
	iUDUZpUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQABz-0000000Ggw5-0z7l;
	Sun, 08 Nov 2026 21:12:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQABx-0000000Ggvi-2SzT
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:12:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DDDD61849;
	Sun,  8 Nov 2026 21:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6740A1F0089F;
	Sun,  8 Nov 2026 21:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794172364;
	bh=EPjROwjsgFSz78GoWhDnke4RAWwqEVi60B+CTkdOY/g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m/CME3FzCJck3vABeKx9WKq9n0+T+XD4d9R+OuGizoen9VmJPoY1DndmI9mFahz9h
	 aP0RU5KNpQN83SbzM0B2UG4Rl7pF7cXrss4wEFbsdrVJGhJxmu4AfSW2PGrAh/wte0
	 cIzYT1/qNyWQeyGjcabNx7zzeSHL/+I6cozpnNBIJ4poQSG54OC18rf4DqPOIYNelQ
	 Xm0wzyID8wPvUdEqpPkSIlzSlndqmZGRigh1TNs0HxNhgC1GPICRmPvtSTjXhlXv32
	 MUnq3YVU9LFlnDz4wUrSpqD73kgIH1u4xdgcCPPBVJOlg70dPTYiERq4RWI7RVh5hu
	 /mpwTQxITSivA==
Message-ID: <sashiko-outbox-204066@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: nandsim: validate overridesize before
 shifting
To: "James Hilliard" <james.hilliard1@gmail.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "David
 Woodhouse" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, "wang wei" <a929244872@163.com>
In-Reply-To: <20261108-submit-nandsim-overridesize-bound-v1-v1-1-9cde7657a69b@gmail.com>
References: <20261108-submit-nandsim-overridesize-bound-v1-v1-1-9cde7657a69b@gmail.com>
Date: Sun, 08 Nov 2026 21:12:44 +0000
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
bm8gbmV3IGlzc3VlcwppbiB0aGlzIHBhdGNoLCBidXQgbm90aWNlZCAxIHJlbGF0ZWQgcHJlLWV4
aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90CmludHJvZHVjZToKLSBbQ3JpdGljYWxdIG10ZDogcmF3
bmFuZDogbmFuZHNpbTogdW5zaWduZWQgaW50ZWdlciBvdmVyZmxvdyBpbgogIG5zX2luaXQoKSBb
MV0KLS0KCmNvbW1pdCAxNzJhZWExOThjMmVlMDI1OWNlNzQ3MzRmNGI1ZGFiMWQwOGZhMTk1CkF1
dGhvcjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgptdGQ6IHJh
d25hbmQ6IG5hbmRzaW06IHZhbGlkYXRlIG92ZXJyaWRlc2l6ZSBiZWZvcmUgc2hpZnRpbmcKClRo
aXMgY29tbWl0IHZhbGlkYXRlcyB0aGUgb3ZlcnJpZGVzaXplIHNoaWZ0IGNvdW50IHVzaW5nCmNo
ZWNrX3NobF9vdmVyZmxvdygpIGJlZm9yZSBjb21wdXRpbmcgdGhlIGVyYXNlYmxvY2sgY291bnQg
YW5kIHRvdGFsIE1URApkZXZpY2Ugc2l6ZS4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25h
bmQvcmF3L25hbmRzaW0uYyBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L25hbmRzaW0uYwo+IGluZGV4
IGZlOTY4MDM3Zjc1YTIuLjY3MTZlYWZiNGIwMDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvbmFuZHNpbS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5j
CgpbIC4uLiBdCgo+IEBAIC0yMzQxLDIxICsyMzQyLDIxIEBAIHN0YXRpYyBpbnQgX19pbml0IG5z
X2luaXRfbW9kdWxlKHZvaWQpCj4gIAl9Cj4gIAo+ICAJaWYgKG92ZXJyaWRlc2l6ZSkgewo+IC0J
CXVpbnQ2NF90IG5ld19zaXplID0gKHVpbnQ2NF90KW5zbXRkLT5lcmFzZXNpemUgPDwgb3ZlcnJp
ZGVzaXplOwo+ICAJCXN0cnVjdCBuYW5kX21lbW9yeV9vcmdhbml6YXRpb24gKm1lbW9yZzsKPiAr
CQl1bnNpZ25lZCBpbnQgZXJhc2VibG9ja3M7Cj4gIAkJdTY0IHRhcmdldHNpemU7Cj4gIAo+ICAJ
CW1lbW9yZyA9IG5hbmRkZXZfZ2V0X21lbW9yZygmY2hpcC0+YmFzZSk7Cj4gIAo+IC0JCWlmIChu
ZXdfc2l6ZSA+PiBvdmVycmlkZXNpemUgIT0gbnNtdGQtPmVyYXNlc2l6ZSkgewo+ICsJCWlmIChj
aGVja19zaGxfb3ZlcmZsb3coMVUsIG92ZXJyaWRlc2l6ZSwgJmVyYXNlYmxvY2tzKSkgewo+ICAJ
CQlOU19FUlIoIm92ZXJyaWRlc2l6ZSBpcyB0b28gYmlnXG4iKTsKPiAgCQkJcmV0ID0gLUVJTlZB
TDsKPiAgCQkJZ290byBjbGVhbnVwX25hbmQ7Cj4gIAkJfQo+ICAKPiAgCQkvKiBOLkIuIFRoaXMg
cmVsaWVzIG9uIG5hbmRfc2NhbiBub3QgZG9pbmcgYW55dGhpbmcgd2l0aCB0aGUgc2l6ZSBiZWZv
cmUgd2UgY2hhbmdlIGl0ICovCj4gLQkJbnNtdGQtPnNpemUgPSBuZXdfc2l6ZTsKPiAtCQltZW1v
cmctPmVyYXNlYmxvY2tzX3Blcl9sdW4gPSAxIDw8IG92ZXJyaWRlc2l6ZTsKPiArCQluc210ZC0+
c2l6ZSA9ICh1NjQpbnNtdGQtPmVyYXNlc2l6ZSAqIGVyYXNlYmxvY2tzOwo+ICsJCW1lbW9yZy0+
ZXJhc2VibG9ja3NfcGVyX2x1biA9IGVyYXNlYmxvY2tzOwoKW1NldmVyaXR5OiBDcml0aWNhbF0K
VGhpcyBwcm9ibGVtIHdhc24ndCBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2gsIGJ1dCBjYW4gYSBs
YXJnZQpvdmVycmlkZXNpemUgdGhhdCBwYXNzZXMgY2hlY2tfc2hsX292ZXJmbG93KCkgc3RpbGwg
b3ZlcmZsb3cgdGhlIDMyLWJpdApucy0+Z2VvbS5wZ251bSBpbiBuc19pbml0KCkgWzFdPwoKZHJp
dmVycy9tdGQvbmFuZC9yYXcvbmFuZHNpbS5jOm5zX2luaXQoKSB7CgkuLi4KCW5zLT5nZW9tLnRv
dHN6ICAgID0gbXRkLT5zaXplOwoJbnMtPmdlb20ucGdzeiAgICAgPSBtdGQtPndyaXRlc2l6ZTsK
CS4uLgoJbnMtPmdlb20ucGdudW0gICAgPSBkaXZfdTY0KG5zLT5nZW9tLnRvdHN6LCBucy0+Z2Vv
bS5wZ3N6KTsKCS4uLgp9CgpCZWNhdXNlIGVhY2ggZXJhc2VibG9jayBjb250YWlucyBtdWx0aXBs
ZSBwYWdlcywgYW4gZXJhc2VibG9jayBjb3VudCB0aGF0CmZpdHMgaW4gdW5zaWduZWQgaW50IGNh
biBzdGlsbCBwcm9kdWNlIGEgdG90YWwgcGFnZSBjb3VudCBleGNlZWRpbmcKVUlOVF9NQVguICBU
cnVuY2F0aW5nIG5zLT5nZW9tLnBnbnVtIGNhdXNlcyBuc19pbml0KCkgdG8gYWxsb2NhdGUgYQpz
bWFsbGVyIHBhZ2UgYXJyYXkgdGhhbiBtdGQtPnNpemUgcmVxdWlyZXMsIGxlYWRpbmcgdG8gb3V0
LW9mLWJvdW5kcwphY2Nlc3NlcyBkdXJpbmcgc2ltdWxhdGVkIGZsYXNoIG9wZXJhdGlvbnMuCgpb
MV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC0zYzM3OWE3My02NWRmLTRiNWYtODE3
OS05NWNlYjJmNDQ3MTcKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28u
ZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDgtc3VibWl0LW5hbmRzaW0tb3ZlcnJpZGVzaXplLWJvdW5k
LXYxLXYxLTEtOWNkZTc2NTdhNjliQGdtYWlsLmNvbT9wYXJ0PTEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
