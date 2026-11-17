Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C9606A32A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 20:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mod+/62j;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aji6BzPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Unj2gjTD9euWqgnRQQD34nS7Zi2spGknMpdG7iF+1Rk=; b=Mod+/62jf/p7jG/z4qCmnRuxId
	2gt/An/9lNlZQcK4NKsl8mrqeinySYL+TNmftq0+7GXtqUpRXjTbZDa7FN/N+Q/NpLniwmM6Mp4Qy
	/LLXozKJLXbIWnOrighBDGCtILRZ/8r8S3f8VqQ8HqcWb/AvNp5iPgKAKxeM8bGPzITw7EfRMyY6/
	zAu5LXFGen0oDAp7LDz24aVN4wwxRJZiMl7FLJebTelYmJ2lDGtasGOm881f+xC5kGXnwlRdoNGhY
	SuQQaohKsqTeoJsLI2ZR1AyyiarC7wYfJncVPvSgiiM0D8iGnhWqALb/KP62rkMSc18Mi51oKUkUy
	lIj+3Ykg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPSX-00000006zPa-3TR6;
	Tue, 17 Nov 2026 20:07:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPSW-00000006zPP-0Ec8
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 20:07:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7113B44E82;
	Tue, 17 Nov 2026 20:07:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7CE1F000C4;
	Tue, 17 Nov 2026 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794946035;
	bh=C+auzSP8vYv/AykLo+QmG5xbC6yWj6/a5wNdehIgm4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aji6BzPwDO4e+Zn38fjtCNJhJINvJAwOQ+PvDY4s5PtB79CvX/yiHMETnHnBRrc02
	 olRuSCLTZQcuh2g9bvulyvbRdHITLR59zVbrD/+MnQ6cNfpS7VcKPJU7Roo7TTlUlH
	 FnQtN9m/Gy6P0p0KPX8EqtNhidTD8NSKcCQWBjY/qsI4ayYRpHDHnsnpE5eM/ddN9S
	 Gopocu/VbJFSfes2p8jitTKr4/e5IT+uVDkM8maRyOv/LS2Bdc1M3vZSLC3eFs13AQ
	 yPkTwrziIH5gAY8mLqRN2Efn7Q50AT4J5iITEqT6IuA86S9SOBbQFxdDZkfGsNBKeW
	 AE4LNwTL3UtGw==
Message-ID: <sashiko-outbox-219563@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] nvmem: exclude disconnected providers from
 callback admission
To: "James Hilliard" <james.hilliard1@gmail.com>, "Srinivas Kandagatla" <srini@kernel.org>, "Mathieu
 Dubois-Briand" <mathieu.dubois-briand@bootlin.com>, "Michael Walle" <mwalle@kernel.org>,
 =?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Paul
 Cercueil" <paul@crapouillou.net>, linux-mtd@lists.infradead.org
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-3-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
 <20261117-submit-nvmem-provider-lifetime-v1-v1-3-3cfbd48812b5@gmail.com>
Date: Tue, 17 Nov 2026 20:07:14 +0000
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
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gbnZtZW06IFNSQ1UgaGVs
ZCBhY3Jvc3MgbnZtZW1fY2VsbF9lbnRyeV9hZGQoKSB3aXRob3V0CiAgcmVjaGVja2luZyBvcHMK
LS0KCmNvbW1pdCBmMmYzM2IxMDA1ZGU4MTk3OGMwOThlYmVkNDFkMGZjOGE3MWM2ZjdlCkF1dGhv
cjogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cgpudm1lbTogZXhj
bHVkZSBkaXNjb25uZWN0ZWQgcHJvdmlkZXJzIGZyb20gY2FsbGJhY2sgYWRtaXNzaW9uCgpUaGlz
IGNvbW1pdCBwcm90ZWN0cyBzeXNmcyBwZXJtaXNzaW9uIGNoZWNrcywgY2VsbCBhZGRpdGlvbiwg
RFQgZml4dXBzLApsYXlvdXQgcG9wdWxhdGlvbiwgYW5kIGRldmljZSBtYXRjaGluZyB3aXRoIHRo
ZSBwcm92aWRlcidzIFNSQ1UgZG9tYWluLAphbmQgc2VyaWFsaXplcyBwcm92aWRlciBkaXNjb25u
ZWN0aW9uIGFnYWluc3QgY29uc3VtZXIgbG9va3VwIHVuZGVyCm52bWVtX211dGV4LgoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9udm1lbS9jb3JlLmMgYi9kcml2ZXJzL252bWVtL2NvcmUuYwo+IGlu
ZGV4IDczYWE1MzE0NWYwYjcuLmM0MTI2NjI0MWYzZjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9u
dm1lbS9jb3JlLmMKPiArKysgYi9kcml2ZXJzL252bWVtL2NvcmUuYwpbIC4uLiBdCj4gQEAgLTY3
Myw2ICs2ODIsMTAgQEAgaW50IG52bWVtX2FkZF9vbmVfY2VsbChzdHJ1Y3QgbnZtZW1fZGV2aWNl
ICpudm1lbSwKPiAgCXN0cnVjdCBudm1lbV9jZWxsX2VudHJ5ICpjZWxsOwo+ICAJaW50IHJ2YWw7
Cj4gIAo+ICsJZ3VhcmQoc3JjdSkoJm52bWVtLT5zcmN1KTsKPiArCWlmICghc3JjdV9kZXJlZmVy
ZW5jZShudm1lbS0+b3BzLCAmbnZtZW0tPnNyY3UpKQo+ICsJCXJldHVybiAtRU5PREVWOwo+ICsK
PiAgCWNlbGwgPSBremFsbG9jX29iaigqY2VsbCk7Cj4gIAlpZiAoIWNlbGwpCj4gIAkJcmV0dXJu
IC1FTk9NRU07CgpbU2V2ZXJpdHk6IE1lZGl1bV0KRG9lcyBob2xkaW5nIG52bWVtLT5zcmN1IGFj
cm9zcyBudm1lbV9jZWxsX2VudHJ5X2FkZCgpIGludmVydCB0aGUgbG9jawpvcmRlcmluZyB3aXRo
IG52bWVtX25vdGlmaWVyLnJ3c2VtIGFuZCBhbGxvdyBjZWxscyB0byBiZSBhZGRlZCBhZnRlcgpu
dm1lbV91bnJlZ2lzdGVyKCkgaGFzIGRpc2Nvbm5lY3RlZCB0aGUgcHJvdmlkZXI/Cgpudm1lbV9j
ZWxsX2VudHJ5X2FkZCgpIGNhbGxzIGJsb2NraW5nX25vdGlmaWVyX2NhbGxfY2hhaW4oJm52bWVt
X25vdGlmaWVyLApOVk1FTV9DRUxMX0FERCwgY2VsbCkgd2hpbGUgbnZtZW0tPnNyY3UgaXMgaGVs
ZC4gQWxsIG52bWVtLT5zcmN1IGluc3RhbmNlcwphcmUgaW5pdGlhbGl6ZWQgd2l0aCBpbml0X3Ny
Y3Vfc3RydWN0KCkgYW5kIHNoYXJlIGEgc2luZ2xlIHN0YXRpYyBsb2NrZGVwCmNsYXNzLiBOb3Rp
ZmllciBjYWxsYmFja3Mgc3VjaCBhcyBjcDUwMF9udm1lbSgpIGNhbGwgbnZtZW1fcmVnaXN0ZXIo
KSBhbmQKbnZtZW1fdW5yZWdpc3RlcigpIHVuZGVyIG52bWVtX25vdGlmaWVyLnJ3c2VtLCB3aGlj
aCBvbiBlcnJvciB1bndpbmQgb3IKcmVtb3ZhbCBjYWxscyBudm1lbV9kaXNjb25uZWN0KCkgLT4g
c3luY2hyb25pemVfc3JjdSgmbnZtZW0tPnNyY3UpOgoKQ1BVMCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIENQVTEKLS0tLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tLS0KbG9j
aygmbnZtZW0tPnNyY3UpCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkb3duX3Jl
YWQoJm52bWVtX25vdGlmaWVyLnJ3c2VtKQpkb3duX3JlYWQoJm52bWVtX25vdGlmaWVyLnJ3c2Vt
KQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3luY2hyb25pemVfc3JjdSgmbnZt
ZW0tPnNyY3UpCgogKioqIERFQURMT0NLICoqKgoKQ1BVMDogbnZtZW1fYWRkX29uZV9jZWxsKCkg
LT4gbnZtZW1fY2VsbF9lbnRyeV9hZGQoKQpDUFUxOiBibG9ja2luZ19ub3RpZmllcl9jYWxsX2No
YWluKCkgLT4gY3A1MDBfbnZtZW0oKSAtPiBudm1lbV9yZWdpc3RlcigpCiAgICAgIC0+IG52bWVt
X2Rpc2Nvbm5lY3QoKQoKSW4gYWRkaXRpb24sIG52bWVtX2FkZF9vbmVfY2VsbCgpIG9ubHkgY2hl
Y2tzIG52bWVtLT5vcHMgYXQgZW50cnkgYmVmb3JlCm52bWVtX2NlbGxfZW50cnlfYWRkKCkgYWNx
dWlyZXMgbnZtZW1fbXV0ZXg6Cgpkcml2ZXJzL252bWVtL2NvcmUuYzpudm1lbV9jZWxsX2VudHJ5
X2FkZCgpIHsKCXNjb3BlZF9ndWFyZChtdXRleCwgJm52bWVtX211dGV4KQoJCWxpc3RfYWRkX3Rh
aWwoJmNlbGwtPm5vZGUsICZjZWxsLT5udm1lbS0+Y2VsbHMpOwoJYmxvY2tpbmdfbm90aWZpZXJf
Y2FsbF9jaGFpbigmbnZtZW1fbm90aWZpZXIsIE5WTUVNX0NFTExfQURELCBjZWxsKTsKfQoKSWYg
bnZtZW1fdW5yZWdpc3RlcigpIHJ1bnMgY29uY3VycmVudGx5LCBpdCBzZW5kcyBOVk1FTV9SRU1P
VkUsIGNsZWFycwpudm1lbS0+b3BzIHVuZGVyIG52bWVtX211dGV4IGluIG52bWVtX2Rpc2Nvbm5l
Y3QoKSwgYW5kIHdhaXRzIGluCnN5bmNocm9uaXplX3NyY3UoKS4gQW4gaW4tZmxpZ2h0IG52bWVt
X2FkZF9vbmVfY2VsbCgpIHRoYXQgcGFzc2VkIHRoZQppbml0aWFsIGNoZWNrIHRoZW4gYWNxdWly
ZXMgbnZtZW1fbXV0ZXggd2l0aG91dCByZWNoZWNraW5nIG52bWVtLT5vcHMsCmFwcGVuZHMgdGhl
IGNlbGwgdG8gdGhlIGRpc2Nvbm5lY3RlZCBwcm92aWRlciwgYW5kIGVtaXRzIE5WTUVNX0NFTExf
QURECmFmdGVyIE5WTUVNX1JFTU9WRS4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczov
L3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMTctc3VibWl0LW52bWVtLXByb3ZpZGVyLWxp
ZmV0aW1lLXYxLXYxLTAtM2NmYmQ0ODgxMmI1QGdtYWlsLmNvbT9wYXJ0PTMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
