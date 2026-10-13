Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7CACC6B0F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WohWPG+ovJR0pGU/A+vrUEhG5qCXbcE763Yod+lgo9I=; b=fIVQcLLW+lDj0g
	JyDGykYIr1HtTXKWYWEq01DqF5P99cziIONOXFJNT1ETZ8Pai646tVRbNd7/AxK2oBqF7pgF+aZMW
	gqQLe03Nx+8rWB8yGjnRrm24CKSRo2mblH1usq9eMWTizvn2l9iW2BKJFH2JA65iNqB0QBcl5CoXk
	2qqO1xLBpKGEiz9xbkrsfr7TB96Uszzn0u3Mpoj1SeSaegsuSO7kKXcsg69eH1LSO4EgZlUHtvhCP
	jhXsr3DqLwyb7G8LcDVndTCDIu0zq+htRVfsxVIfyqF/obVSaVWu2hvkGBG4xWszFX4n4diwwhr/S
	QtCsS6uv3xnaS2m9KA3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdTG-0000000D5ax-39mf;
	Tue, 13 Oct 2026 14:27:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdTF-0000000D5a3-0oFM
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:27:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C0F4602C3;
	Tue, 13 Oct 2026 14:27:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5C41F000FF;
	Tue, 13 Oct 2026 14:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901632;
	bh=r1f2rRnodabvBVQFgXzbhRcKmyF1gZXI3DqCFtYNkQA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yfamr5EuWE1JEQ6tsADFNqZtgX8//zFwGKlJOdbFp/8iDmXx0b8Ggzs0K66uDaMW0
	 Q5qUofHtms2E5dXwZ5Ni3K4j01gXXflB9/Zp93xIS2Ca055K5dHBKhRv5dxT/X5QPj
	 ZM9WjkOkLHazcH9T5q0VrDX35HGUp7+N5PthR6XLX5JL3L8Z82CMN4J3zuKNHTAoAA
	 w2FikiUCXxV1NS6UMXpYvOYzadFDDrA/usstMflruouv2KVOKe4f9gHiMPlJU4OhAF
	 oF0UbgcJGcCt1KNrWKw8dm2AyahUpIgcxBZZWPixmEOY/jNe10FksHuyCIkuAdBoN/
	 tsyYbWl3EyUCg==
Message-ID: <sashiko-outbox-169903@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/7] mtd: spi-nor: Add support for panic writes
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261013141350.189996-4-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
 <20261013141350.189996-4-paul.cercueil@bootlin.com>
Date: Tue, 13 Oct 2026 14:27:10 +0000
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
MyBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0NyaXRpY2FsXSBwbTogc3BpLW1l
bTogbWlzaGFuZGxlZCBwbV9ydW50aW1lX2dldF9pZl9hY3RpdmUoKSBzaWxlbnRseSBicmVha3Mg
cGFuaWMgd3JpdGUKLSBbSGlnaF0gbW06IHNwaS1ub3I6IHBhbmljIHdyaXRlIGFsbG9jYXRpb24g
dXNlcyBzbGVlcGluZyBHRlAgbWFzawotIFtIaWdoXSBzcGk6IHNwaS1tZW06IHBhbmljIHdyaXRl
IGZhbGxiYWNrIHBhdGggc2xlZXBzIG9uIEVOT1RTVVBQCi0tCgpjb21taXQgYTFmOWYwNTM0NzBm
ZjEwZmExMGMxMzNkYzVhZWIwODI3YmMzNjdhMQpBdXRob3I6IFRhbm1heSBKYWdkYWxlIDx0YW5t
YXlAbWFydmVsbC5jb20+CgogICAgbXRkOiBzcGktbm9yOiBBZGQgc3VwcG9ydCBmb3IgcGFuaWMg
d3JpdGVzCiAgICAKICAgIElmIHRoZSBTUEkgY29udHJvbGxlciBzdXBwb3J0cyBpdCwgcHJvdmlk
ZSB0aGUgZnVuY3Rpb25hbGl0eSBvZiBkb2luZyBhCiAgICBwYW5pYyB3cml0ZS4KICAgIAogICAg
VXBkYXRlIHRoZSBzcGktbm9yIGNvcmUgY29kZSBhbmQgY29udHJvbGxlcnMgdG8gbWFrZSBzdXJl
IHRoZXkgd29uJ3QgdHJ5CiAgICB0byBncmFiIGxvY2tlZCBtdXRleGVzIG9yIHNsZWVwIHdoZW4g
ZG9pbmcgYSBwYW5pYyB3cml0ZSwgYXMgcHJlZW1wdGlvbgogICAgYW5kIElSUXMgYXJlIGRpc2Fi
bGVkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYwo+IGluZGV4IDI1MDlmYjk4M2Q0ZjIuLjI4MWFjYzU0YjMyNDUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYwoKWyAuLi4gXQoKPiBAQCAtMjE5Niw2ICsyMjM1LDcgQEAgc3Rh
dGljIGludCBzcGlfbm9yX3JlYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBz
aXplX3QgbGVuLAo+ICBzdGF0aWMgaW50IHNwaV9ub3Jfb2N0YWxfZHRyX3dyaXRlKHN0cnVjdCBz
cGlfbm9yICpub3IsIGxvZmZfdCB0bywgc2l6ZV90IGxlbiwKPiAgCQkJCSAgIGNvbnN0IHU4ICpi
dWYpCj4gIHsKPiArCWdmcF90IG1tX2ZsYWdzID0gR0ZQX0tFUk5FTDsKPiAgCXU4ICp0bXBfYnVm
Owo+ICAJc2l6ZV90IGJ5dGVzX3dyaXR0ZW47Cj4gIAlsb2ZmX3Qgc3RhcnQsIGVuZDsKPiBAQCAt
MjIwNCw3ICsyMjQ0LDEwIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9vY3RhbF9kdHJfd3JpdGUoc3Ry
dWN0IHNwaV9ub3IgKm5vciwgbG9mZl90IHRvLCBzaXplX3QgbGVuLAo+ICAJaWYgKElTX0FMSUdO
RUQodG8sIDIpICYmIElTX0FMSUdORUQobGVuLCAyKSkKPiAgCQlyZXR1cm4gc3BpX25vcl93cml0
ZV9kYXRhKG5vciwgdG8sIGxlbiwgYnVmKTsKPiAgCj4gLQl0bXBfYnVmID0ga21hbGxvYyhub3It
PnBhcmFtcy0+cGFnZV9zaXplLCBHRlBfS0VSTkVMKTsKPiArCWlmIChub3ItPm10ZC5vb3BzX3Bh
bmljX3dyaXRlKQo+ICsJCW1tX2ZsYWdzIHw9IEdGUF9BVE9NSUM7Cj4gKwo+ICsJdG1wX2J1ZiA9
IGttYWxsb2Mobm9yLT5wYXJhbXMtPnBhZ2Vfc2l6ZSwgbW1fZmxhZ3MpOwoKW1NldmVyaXR5OiBI
aWdoXQpEb2VzIHRoaXMgYml0d2lzZSBPUiBzdWNjZXNzZnVsbHkgcmVtb3ZlIHRoZSBzbGVlcGFi
bGUgX19HRlBfRElSRUNUX1JFQ0xBSU0KZmxhZz8KCkJlY2F1c2UgbW1fZmxhZ3MgaXMgaW5pdGlh
bGl6ZWQgdG8gR0ZQX0tFUk5FTCAod2hpY2ggaW5jbHVkZXMKX19HRlBfRElSRUNUX1JFQ0xBSU0p
LCBiaXR3aXNlIE9SaW5nIEdGUF9BVE9NSUMgaW50byB0aGUgbWFzayBkb2VzIG5vdApjbGVhciB0
aGUgX19HRlBfRElSRUNUX1JFQ0xBSU0gYml0LiBUaGlzIG1lYW5zIHRoZSByZXN1bHRpbmcgbWFz
ayBzdGlsbAppbnN0cnVjdHMgdGhlIHBhZ2UgYWxsb2NhdG9yIHRoYXQgaXQgaXMgYWxsb3dlZCB0
byBzbGVlcCBhbmQgZW50ZXIgZGlyZWN0CnJlY2xhaW0uCgpTaW5jZSBwYW5pYyB3cml0ZXMgZXhl
Y3V0ZSBpbiBhIHN0cmljdGx5IGF0b21pYyBjb250ZXh0IHdpdGggcHJlZW1wdGlvbiBhbmQKbG9j
YWwgaW50ZXJydXB0cyBkaXNhYmxlZCwgY291bGQgdGhpcyB0cmlnZ2VyIGEgYnVnIG9yIGRlYWRs
b2NrIGFuZCBwcmV2ZW50CnRoZSBvb3BzIGxvZyBmcm9tIGJlaW5nIHNhdmVkPwoKWyAuLi4gXQoK
PiBAQCAtMzU4OSw4ICszNjUyLDEzIEBAIHN0YXRpYyBpbnQgc3BpX25vcl9zZXRfbXRkX2luZm8o
c3RydWN0IHNwaV9ub3IgKm5vcikKPiAgCW10ZC0+c2l6ZSA9IG5vci0+cGFyYW1zLT5zaXplOwo+
ICAJbXRkLT5fcmVhZCA9IHNwaV9ub3JfcmVhZDsKPiAgCS8qIE1pZ2h0IGJlIGFscmVhZHkgc2V0
IGJ5IHNvbWUgU1NUIGZsYXNoZXMuICovCj4gLQlpZiAoIW10ZC0+X3dyaXRlKQo+ICsJaWYgKCFt
dGQtPl93cml0ZSkgewo+ICAJCW10ZC0+X3dyaXRlID0gc3BpX25vcl93cml0ZTsKPiArCQlpZiAo
bm9yLT5zcGltZW0gJiYKPiArCQkgICAgc3BpX21lbV9jb250cm9sbGVyX2lzX2NhcGFibGUobm9y
LT5zcGltZW0tPnNwaS0+Y29udHJvbGxlciwgcGFuaWNfd3JpdGUpKSB7Cj4gKwkJCW10ZC0+X3Bh
bmljX3dyaXRlID0gc3BpX25vcl9wYW5pY193cml0ZTsKPiArCQl9Cj4gKwl9CgpbU2V2ZXJpdHk6
IENyaXRpY2FsXQpCeSBob29raW5nIHVwIHBhbmljIHdyaXRlIGhlcmUsIHRoaXMgZGVsZWdhdGVz
IHRvIHNwaV9tZW1fZXhlY19vcCgpIGluCmRyaXZlcnMvc3BpL3NwaS1tZW0uYywgd2hpY2ggc2Vl
bXMgdG8gbWlzaGFuZGxlIHRoZSBydW50aW1lIHBtIHJlZmVyZW5jZQpmb3IgcGFuaWMgd3JpdGVz
LgoKSW4gc3BpX21lbV9leGVjX29wKCksIHRoZSBwYW5pYyB3cml0ZSBwYXRoIGRvZXM6CgogICAg
ZWxzZSBpZiAoY3Rsci0+YXV0b19ydW50aW1lX3BtKQogICAgICAgIHJldCA9IHBtX3J1bnRpbWVf
Z2V0X2lmX2FjdGl2ZShjdGxyLT5kZXYucGFyZW50KTsKICAgIGlmIChyZXQpCiAgICAgICAgcmV0
dXJuIHJldDsKClNpbmNlIHBtX3J1bnRpbWVfZ2V0X2lmX2FjdGl2ZSgpIHJldHVybnMgMSBpZiB0
aGUgZGV2aWNlIGlzIGFjdGl2ZSwgdGhpcwpjYXRjaGVzIHRoZSBzdWNjZXNzIGNhc2UgKDEpIGFz
IGFuIGVycm9yIGFuZCByZXR1cm5zIGltbWVkaWF0ZWx5LCBza2lwcGluZwpjdGxyLT5tZW1fb3Bz
LT5leGVjX29wKCkgYW5kIGxlYWtpbmcgdGhlIHBtIHJlZmVyZW5jZS4KCkNvbnZlcnNlbHksIGlm
IHRoZSBkZXZpY2Ugd2FzIHN1c3BlbmRlZCwgaXQgcmV0dXJucyAwLCBleGVjdXRpb24gY29udGlu
dWVzCm9uIHRoZSBzdXNwZW5kZWQgY29udHJvbGxlciwgYW5kIHRoZSBzdWJzZXF1ZW50IHBtX3J1
bnRpbWVfcHV0X25vaWRsZSgpIHdpbGwKdW5kZXJmbG93IHRoZSB1c2FnZSBjb3VudC4KCkRvZXMg
dGhpcyBzaWxlbnRseSBicmVhayB0aGUgcGFuaWMgd3JpdGUgZXhlY3V0aW9uPwoKW1NldmVyaXR5
OiBIaWdoXQpBZGRpdGlvbmFsbHksIGlmIHRoZSBjb250cm9sbGVyJ3MgZXhlY19vcCgpIG1ldGhv
ZCBkeW5hbWljYWxseSByZXR1cm5zCi1FTk9UU1VQUCBvciAtRU9QTk9UU1VQUCwgc3BpX21lbV9l
eGVjX29wKCkgZmFsbHMgYmFjayB0byBhIHBhdGggdGhhdApjYW5ub3QgZXhlY3V0ZSBpbiBhdG9t
aWMgY29udGV4dDoKCiAgICB0bXBidWYgPSBremFsbG9jKHRtcGJ1ZnNpemUsIEdGUF9LRVJORUwg
fCBHRlBfRE1BKTsKICAgIC4uLgogICAgcmV0ID0gc3BpX3N5bmMobWVtLT5zcGksICZtc2cpOwoK
Qm90aCBremFsbG9jKEdGUF9LRVJORUwpIGFuZCBzcGlfc3luYygpIGNhbiBzbGVlcC4gSWYgdGhp
cyBmYWxsYmFjayBpcwp0cmlnZ2VyZWQgZHVyaW5nIGEgcGFuaWMgd3JpdGUsIHdpbGwgaXQgdmlv
bGF0ZSBhdG9taWMgY29udGV4dCBjb25zdHJhaW50cwphbmQgZGVhZGxvY2s/CgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDEzMTQx
MzUwLjE4OTk5Ni0xLXBhdWwuY2VyY3VlaWxAYm9vdGxpbi5jb20/cGFydD0zCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
