Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D96606A32C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1mURuXMS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I+NkEUh8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4MTd1Nx2YXtanBzt+dud2vUpqTwGaB8v4isPwRKZDtQ=; b=1mURuXMS/JhXJRDWyk4t730Dn3
	Mk6QWhdKbDce/Hs5ClMzZAz3bEtHBvirHzxZdaHDea/HyCzA7PyxtYRBp41mXpCd6s4Gosk+wAYxK
	3XetDEOGanu8AaNusSjGy7B7U9SzJvN4NtM8dcskeEoMTHVkMsmtVvpi9AfQDzjyW9h3E9bTu9s9i
	vStISmuP4km10m4Hl4nPIRNcJLmvBYbREtJ3zgkIj6+h2nw/O/ddTyykPiNMfWWhBE/bvTTjbubEn
	1oN3nnK8xy/uemne+8rjjG7m0lv3/T2IHoZ48e1CPTKLeeixC9AUHYHIMHeNfaDuWTfdFSKIgwO0U
	SNPQ+qIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMet-0000000Elu6-0Mvo;
	Fri, 20 Nov 2026 11:19:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMeq-0000000Elt2-47NU
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 11:19:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8018F43845;
	Fri, 20 Nov 2026 11:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA3C1F000C4;
	Fri, 20 Nov 2026 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795173596;
	bh=GnXnn31fffHNJ+o2/c9THdYd3jT978TAt7e4GwWm0zw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I+NkEUh8p0/Etj7MgRQIHLrmAVVPg2rCFk6Oq+NhQa+tneG4AaCI4ed4xV46IWr1V
	 jCczV5FgmIr2M4+k9nmxhyX7faUTr4DuUu33atrAiw/veiPfQLLp9JX0yofMPQJJzb
	 u1E5x9hQQB0YSVUm0kLAUaFIqCoteg6bZvDke8EDFKxUv3HOAWGQecVod6YFOA3X6L
	 rUJq/kRQh7yANx5J5GmcFKCHUAR8lI9O4m74SNsfCEl4aFc4lv2pHTVdyi8Yj7BYUx
	 /zxigVqOnekSWWk1HwA76FprNr0ZKxejiEhM/uiDHBppzEYVoM2pOLx+tOIW+POuGR
	 jEWkYxWMzXiEQ==
Message-ID: <sashiko-outbox-225022@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: Reset flash device on resume
To: "Srikanth Boyapally" <srikanth.boyapally@amd.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, michal.simek@amd.com, git@amd.com, "Sai
 Krishna Potthuri" <sai.krishna.potthuri@amd.com>
In-Reply-To: <20261120-nor_11_20-v1-2-70332a54037f@amd.com>
References: <20261120-nor_11_20-v1-0-70332a54037f@amd.com>
 <20261120-nor_11_20-v1-2-70332a54037f@amd.com>
Date: Fri, 20 Nov 2026 11:19:55 +0000
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
MiBwb3RlbnRpYWwKaXNzdWVzIHRvIGNvbnNpZGVyOgotIFtIaWdoXSBtdGQ6IHNwaS1ub3I6IGFk
ZHJlc3MgbW9kZSBkZXN5bmMgYWZ0ZXIgc3BpX25vcl9od19yZXNldCgpIGluCiAgc3BpX25vcl9y
ZXN1bWUoKQotIFtMb3ddIG10ZDogc3BpLW5vcjogZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoKSBj
YWxsZWQgb24gZXZlcnkgcmVzdW1lCiAgd2l0aG91dCByZXNldCBHUElPCi0tCgpjb21taXQgOGJj
NWRkOTA2YTBjYjAzNTFkMTJjZjIyOGM5YzA0ZWU2MzlhNGQ1NwpBdXRob3I6IFNhaSBLcmlzaG5h
IFBvdHRodXJpIDxzYWkua3Jpc2huYS5wb3R0aHVyaUBhbWQuY29tPgoKbXRkOiBzcGktbm9yOiBS
ZXNldCBmbGFzaCBkZXZpY2Ugb24gcmVzdW1lCgpUaGlzIGNvbW1pdCBjYWxscyBzcGlfbm9yX2h3
X3Jlc2V0KCkgaW4gc3BpX25vcl9yZXN1bWUoKSB0byByZXNldCB0aGUKZmxhc2ggZGV2aWNlIGJl
Zm9yZSByZWluaXRpYWxpemluZyBpdCB3aXRoIHNwaV9ub3JfaW5pdCgpLgoKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+IGluZGV4IDExMjI3ZjhmYThlYTkuLjI5YmNlNmI3MzQ4ZDAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
YwoKWyAuLi4gXQoKPiBAQCAtMzE5MSw2ICszMTk0LDEwIEBAIHN0YXRpYyB2b2lkIHNwaV9ub3Jf
cmVzdW1lKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gbm9y
LT5kZXY7Cj4gIAlpbnQgcmV0Owo+ICAKPiArCXJldCA9IHNwaV9ub3JfaHdfcmVzZXQobm9yKTsK
PiArCWlmIChyZXQpCj4gKwkJZGV2X2VycihkZXYsICJkZXZpY2UgcmVzZXQgZmFpbGVkIGR1cmlu
ZyByZXN1bWUoKVxuIik7Cj4gKwo+ICAJLyogcmUtaW5pdGlhbGl6ZSB0aGUgbm9yIGNoaXAgKi8K
PiAgCXJldCA9IHNwaV9ub3JfaW5pdChub3IpOwo+ICAJaWYgKHJldCkKCltTZXZlcml0eTogSGln
aF0KRG9lcyBzcGlfbm9yX2h3X3Jlc2V0KCkgZGVzeW5jaHJvbml6ZSBub3ItPnBhcmFtcy0+YWRk
cl9tb2RlX25ieXRlcyBmcm9tCnRoZSBmbGFzaCdzIGhhcmR3YXJlIGFkZHJlc3MgbW9kZSBvbiBy
ZXN1bWU/CgpXaGVuIDQtYnl0ZSBhZGRyZXNzIG1vZGUgaXMgZW5hYmxlZCBkdXJpbmcgcHJvYmUs
CnNwaV9ub3Jfc2V0XzRieXRlX2FkZHJfbW9kZSgpIHNldHMgbm9yLT5wYXJhbXMtPmFkZHJfbW9k
ZV9uYnl0ZXMgPSA0LgpQdWxzaW5nIHRoZSByZXNldCBHUElPIGluIHNwaV9ub3JfcmVzdW1lKCkg
cmVzZXRzIHRoZSBmbGFzaCBoYXJkd2FyZSBiYWNrCnRvIGl0cyBwb3dlci1vbiBkZWZhdWx0IDMt
Ynl0ZSBhZGRyZXNzIG1vZGUgd2hpbGUgbGVhdmluZwphZGRyX21vZGVfbmJ5dGVzIGF0IDQuCgpz
cGlfbm9yX2luaXQoKSB0aGVuIHJ1bnMgc3BpX25vcl9zZXRfb2N0YWxfZHRyKCkgYW5kIHNwaV9u
b3JfcXVhZF9lbmFibGUoKQpiZWZvcmUgc3BpX25vcl9zZXRfNGJ5dGVfYWRkcl9tb2RlKCk6Cgpk
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYzpzcGlfbm9yX2luaXQoKSB7CgllcnIgPSBzcGlfbm9y
X3NldF9vY3RhbF9kdHIobm9yLCB0cnVlKTsKCS4uLgoJZXJyID0gc3BpX25vcl9xdWFkX2VuYWJs
ZShub3IpOwoJLi4uCglpZiAobm9yLT5hZGRyX25ieXRlcyA9PSA0ICYmCgkgICAgbm9yLT5yZWFk
X3Byb3RvICE9IFNOT1JfUFJPVE9fOF84XzhfRFRSICYmCgkgICAgIShwYXJhbXMtPmZsYWdzICYg
U05PUl9GXzRCX09QQ09ERVMpKQoJCXJldHVybiBzcGlfbm9yX3NldF80Ynl0ZV9hZGRyX21vZGUo
bm9yLCB0cnVlKTsKfQoKQ2FsbGJhY2tzIHN1Y2ggYXMgbWljcm9uX3N0X25vcl9vY3RhbF9kdHJf
ZW4oKSwgY3lwcmVzc19ub3Jfb2N0YWxfZHRyX2VuKCkKYW5kIGN5cHJlc3Nfbm9yX3F1YWRfZW5h
YmxlX3ZvbGF0aWxlX3JlZygpIHVzZSBhZGRyX21vZGVfbmJ5dGVzIHRvIHNlbmQKUmVhZC9Xcml0
ZSBBbnkgUmVnaXN0ZXIgY29tbWFuZHMsIHNvIHRoZXkgd2lsbCBzZW5kIDQgYWRkcmVzcyBieXRl
cyB0byBhCmNoaXAgZXhwZWN0aW5nIDMgYW5kIGZhaWwgdG8gcmUtZW5hYmxlIG9jdGFsIERUUiBv
ciBxdWFkIG1vZGUuCgpJbiBhZGRpdGlvbiwgbXVsdGktZGllIE1pY3Jvbi9TVCBmbGFzaGVzIGVu
YWJsZSA0LWJ5dGUgYWRkcmVzcyBtb2RlIGluCnRoZWlyIGxhdGVfaW5pdCBob29rcyAoc3VjaCBh
cyBtaWNyb25fc3Rfbm9yX3R3b19kaWVfbGF0ZV9pbml0KCkpIGV2ZW4Kd2hlbiBTTk9SX0ZfNEJf
T1BDT0RFUyBpcyBzZXQgb3IgcmVhZF9wcm90byBpcyBTTk9SX1BST1RPXzhfOF84X0RUUiwKYmVj
YXVzZSBTUElOT1JfT1BfTVRfRElFX0VSQVNFIGhhcyBubyA0LWJ5dGUgb3Bjb2RlLiAgQmVjYXVz
ZQpzcGlfbm9yX2luaXQoKSBza2lwcyBzcGlfbm9yX3NldF80Ynl0ZV9hZGRyX21vZGUoKSBmb3Ig
dGhvc2UgZmxhc2hlcywKdGhleSByZW1haW4gc3R1Y2sgaW4gMy1ieXRlIGFkZHJlc3MgbW9kZSBh
ZnRlciByZXN1bWUsIGJyZWFraW5nIGRpZSBlcmFzZS4KCltTZXZlcml0eTogTG93XQpXaGVuIGEg
Zmxhc2ggZG9lcyBub3QgaGF2ZSBhbiBvcHRpb25hbCByZXNldCBHUElPLCBub3ItPnJlc2V0IHJl
bWFpbnMKTlVMTCBhZnRlciBwcm9iZS4gIERvZXMgY2FsbGluZyBzcGlfbm9yX2h3X3Jlc2V0KCkg
ZnJvbSBzcGlfbm9yX3Jlc3VtZSgpCmNhdXNlIGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKCkgdG8g
YmUgcmUtaW52b2tlZCBvbiBldmVyeSByZXN1bWUgY3ljbGU/Cgpkcml2ZXJzL210ZC9zcGktbm9y
L2NvcmUuYzpzcGlfbm9yX2h3X3Jlc2V0KCkgewoJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXQgPSBu
b3ItPnJlc2V0OwoKCWlmICghcmVzZXQpIHsKCQlyZXNldCA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlv
bmFsKG5vci0+ZGV2LCAicmVzZXQiLCBHUElPRF9PVVRfTE9XKTsKCQlpZiAoSVNfRVJSX09SX05V
TEwocmVzZXQpKQoJCQlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKHJlc2V0KTsKCQlub3ItPnJlc2V0
ID0gcmVzZXQ7Cgl9Ci4uLgp9CgpBY3F1aXJpbmcgdGhlIGRldm0tbWFuYWdlZCBHUElPIGR1cmlu
ZyBwcm9iZSBhbmQgb25seSB0b2dnbGluZyBub3ItPnJlc2V0CmluIHNwaV9ub3JfaHdfcmVzZXQo
KSB3aGVuIGl0IGlzIG5vbi1OVUxMIHdvdWxkIGF2b2lkIHJlcGVhdGVkIGRldm0KbG9va3VwcyBk
dXJpbmcgcmVzdW1lLgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9wYXRjaHNldC8yMDI2MTEyMC1ub3JfMTFfMjAtdjEtMC03MDMzMmE1NDAzN2ZAYW1kLmNv
bT9wYXJ0PTIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
