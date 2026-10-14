Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4394CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvPtPTycM76Is5t36Z1YjE9b+WTaefyE2ZCQ2ftV74I=; b=rmSp6Uvq8O8FCE
	6DwVOHGWHMBbrdFMUeyLx/CtWPInjwQxgtawvqoZo9hry/IghVJy4PEnHPsXvJe5Uzkok500HmbSV
	inlPWr99SXQCNzFwS6WytL3l8cqaGzMGK5UH9FuH8JzzWlbm66k6MkmUNuzKVpSw8MTMha4NTDpXO
	QZhCiAj1hNmOrsR1QBMq7/1yce9jgxPjeZ0iEOfyKKY1uv4BisFmJtdes2P5Ug5xC60TS8lg03mrk
	curnwC4e/nDzrpOgh/lXxPrYOjS5IgAhZbrx721xAH6TVf0ckUXO5YRNwJYS28AibHTvDPJ80DAKG
	7XacNkwJP030F4z+3XaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1MI-0000000FumQ-1n1w;
	Wed, 14 Oct 2026 15:57:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1ME-0000000Fuly-1sz7
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 15:57:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0CA141937;
	Wed, 14 Oct 2026 15:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4891F000C4;
	Wed, 14 Oct 2026 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791993453;
	bh=TLwFC1lqNjxWeHtSCDktmouXRH7eWp6UVy/HpSgL3eY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LTaQ/Dg/lwq3iC4B6KKJXM5zyS5i21zZph1cSjMniDF1sVXIo8gyqY9v2IoDb4wV/
	 Q1pDmrAP3d0MGWCZ+0cfZXLEVUTY8SXhNYj6jjKqXHPUbyce1EVXfE1dAoOFgsgG/T
	 xMkSBiUnPT/JQo9sG2jLsqZsNue4/b8DPJgXubZF9K7YhDro8Iiz6qQlz/4liZN0vI
	 UJa4N/ZXjWafAl5EIes9d4YHIuDcdY9ZUkEp0RKceQtmSVzTk3aHTcr3BD9C8wgoSO
	 18Da/O0xQeNfEM/6by4ixh6V371UbO/IgNxbSV7oln8qHwVSovTLFvuwa0W7V4dYqq
	 5u5av6xj7lMUg==
Message-ID: <sashiko-outbox-171505@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] mtd: spi-nor: Add support for panic writes
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261014154301.157755-4-paul.cercueil@bootlin.com>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
 <20261014154301.157755-4-paul.cercueil@bootlin.com>
Date: Wed, 14 Oct 2026 15:57:32 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
a21hbGxvYy9rZnJlZSBkdXJpbmcgcGFuaWMgd3JpdGUgY2F1c2VzIGRlYWRsb2NrCi0tCgpjb21t
aXQgM2JkMzViZDU5MjJhNTBhNmQwODRkNGRhM2MyMWFlYmNlZTIzNTFjZApBdXRob3I6IFRhbm1h
eSBKYWdkYWxlIDx0YW5tYXlAbWFydmVsbC5jb20+CgptdGQ6IHNwaS1ub3I6IEFkZCBzdXBwb3J0
IGZvciBwYW5pYyB3cml0ZXMKClRoaXMgY29tbWl0IGludHJvZHVjZXMgdGhlIGZ1bmN0aW9uYWxp
dHkgZm9yIFNQSSBOT1IgY29udHJvbGxlcnMgdG8gcGVyZm9ybQpwYW5pYyB3cml0ZXMuIEl0IGF0
dGVtcHRzIHRvIGJ5cGFzcyBsb2NrZWQgbXV0ZXhlcyBhbmQgc2xlZXAgb3BlcmF0aW9ucwp3aGVu
IGRvaW5nIGEgcGFuaWMgd3JpdGUsIHNpbmNlIHByZWVtcHRpb24gYW5kIElSUXMgYXJlIGRpc2Fi
bGVkLgoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYwo+IGluZGV4IDU4MjU3Y2MyMWM2ODEuLmQ1ZTU3MjI4N2JiNzMg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiArKysgYi9kcml2ZXJz
L210ZC9zcGktbm9yL2NvcmUuYwpbIC4uLiBdCj4gQEAgLTIyMDMsNyArMjI0Miw4IEBAIHN0YXRp
YyBpbnQgc3BpX25vcl9vY3RhbF9kdHJfd3JpdGUoc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90
IHRvLCBzaXplX3QgbGVuLAo+ICAJaWYgKElTX0FMSUdORUQodG8sIDIpICYmIElTX0FMSUdORUQo
bGVuLCAyKSkKPiAgCQlyZXR1cm4gc3BpX25vcl93cml0ZV9kYXRhKG5vciwgdG8sIGxlbiwgYnVm
KTsKPiAgCj4gLQl0bXBfYnVmID0ga21hbGxvYyhub3ItPnBhcmFtcy0+cGFnZV9zaXplLCBHRlBf
S0VSTkVMKTsKPiArCXRtcF9idWYgPSBrbWFsbG9jKG5vci0+cGFyYW1zLT5wYWdlX3NpemUsCj4g
KwkJCSAgbm9yLT5tdGQub29wc19wYW5pY193cml0ZSA/IEdGUF9BVE9NSUMgOiBHRlBfS0VSTkVM
KTsKCltTZXZlcml0eTogSGlnaF0KQ2FuIHRoaXMga21hbGxvYygpIGNhbGwgaW4gc3BpX25vcl9v
Y3RhbF9kdHJfd3JpdGUoKSwgYW5kIHRoZSBzdWJzZXF1ZW50CmtmcmVlKCksIGNhdXNlIGEgZGVh
ZGxvY2sgZHVyaW5nIGEgcGFuaWM/CgpXaGlsZSBHRlBfQVRPTUlDIHByZXZlbnRzIHRoZSBzY2hl
ZHVsZXIgZnJvbSBzbGVlcGluZyBvciByZWNsYWltaW5nIG1lbW9yeSwKdGhlIFNMVUIvU0xBQiBt
ZW1vcnkgYWxsb2NhdG9yIHN0aWxsIGZ1bmRhbWVudGFsbHkgcmVsaWVzIG9uIHJhdyBzcGlubG9j
a3MKKGUuZy4sIGttZW1fY2FjaGVfbm9kZS0+bGlzdF9sb2NrIG9yIHBjcC0+bG9jaykgZm9yIGl0
cyBmcmVlbGlzdHMuCgpTaW5jZSBzcGlfbm9yX3BhbmljX3dyaXRlKCkgaXMgaW52b2tlZCBpbiBh
IHBhbmljIGNvbnRleHQgd2hlcmUgbG9jYWwKaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQgYW5kIGFs
bCBvdGhlciBDUFVzIGhhdmUgYmVlbiBmb3JjaWJseSBoYWx0ZWQsIGlmCmFueSBoYWx0ZWQgQ1BV
IGhhcHBlbmVkIHRvIGJlIGhvbGRpbmcgYSBzbGFiIGxvY2sgYXQgdGhlIG1vbWVudCBvZiB0aGUK
Y3Jhc2gsIHRoZSBwYW5pY2tpbmcgQ1BVIHdpbGwgc3BpbiBpbmRlZmluaXRlbHkgd2FpdGluZyBm
b3IgaXQuCgpTaG91bGQgdGhpcyBwYW5pYyBwYXRoIHJlbHkgb24gYSBwcmUtYWxsb2NhdGVkIGJ1
ZmZlciAoc3VjaCBhcwpub3ItPmJvdW5jZWJ1ZikgaW5zdGVhZCB0byBndWFyYW50ZWUgdGhlIHBh
bmljIGR1bXAgY2FuIGJlIHdyaXR0ZW4/Cgo+ICAJaWYgKCF0bXBfYnVmKQo+ICAJCXJldHVybiAt
RU5PTUVNOwo+CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8j
L3BhdGNoc2V0LzIwMjYxMDE0MTU0MzAxLjE1Nzc1NS0xLXBhdWwuY2VyY3VlaWxAYm9vdGxpbi5j
b20/cGFydD0zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
