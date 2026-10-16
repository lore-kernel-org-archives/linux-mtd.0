Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D2DCCA464
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 10:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M5TQLOVSjMhfWHTYC8NTt8LNLYbrq/nS4rmHMeFp5C4=; b=KCL/N0+w5cB7ui
	870jGJiAAAAhh2+U4NxsmQD7PeydGEh/dEirwfuQnqZU0pnRO1OpbCfPx1kq4JvOKmaZj/9fFE2u1
	BMoeRCD1/RJQ1g/LyCchUrdL6ZqM9fjjxyxUo2QqiOL8vUape/uhl48o4ipqOl+Aok+gRtI+BxtNR
	trq6U9fF6YT2jvagbowd+Nju4N2wJ4TB3xKnde8+6oxd1ssgtQhlQ+nrpatHhtqPMZIJYOY3LOiIQ
	pAsFXQuK+iuWHrCfoLvmWadjth6Exmjn+fy/hILFBhJrS4/3nOheXe/q8kDSH8taSmfXkzJsLVwSE
	KQ6yUFEA98xQQiDJ+/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfOh-00000002h61-3060;
	Fri, 16 Oct 2026 10:42:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHfOf-00000002h5c-1Ti0
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 10:42:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F9A74161B;
	Fri, 16 Oct 2026 10:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6497B1F000C4;
	Fri, 16 Oct 2026 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792147365;
	bh=69eGyTm3FG58qQ/7YpG5tJA3lSbqdd/95miouabiAKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M38n9rHSDX512LUt4EKwmMkgKIR2Ce81kM2sy8/pFmbfZPCel33M6GzvjmVXi+dpB
	 edDAzSFk+6BlQtkQJmf6l6RX8eIJK2r6IxQyYDR4pNwVcluehDK7lO56xwLDobUR5e
	 WY9Hv1YYsmvOjnHdlbgeEBz6JEgVNJWu8lpwEnbrwX0CvlBNdULjSknZ3nIYU4BSEm
	 yX8YzK8bkH21Z1w5rGeDUnwL/DRbyJ4ar/s26rKHgeih/iLgP1qFOXLOYFCywZw7iK
	 JKcCsEdrA8QR6M6CLhJEZMVFD5hYR+M6u4S9kqTpSVW5b3ewjXLgDzhMLKA+26aJnM
	 VT/VvMtud2SQA==
Message-ID: <sashiko-outbox-174197@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] spi: cadence-xspi: Clear "SDMA ready" IRQ flag
 after polling
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261016102917.171095-5-paul.cercueil@bootlin.com>
References: <20261016102917.171095-1-paul.cercueil@bootlin.com>
 <20261016102917.171095-5-paul.cercueil@bootlin.com>
Date: Fri, 16 Oct 2026 10:42:44 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogc2hhcmVkIElS
USBoYW5kbGVyIHN0ZWFscyBXMUMgcG9sbGluZyBiaXRzIGNhdXNpbmcgc3B1cmlvdXMgdGltZW91
dHMKLS0KCmNvbW1pdCBiMjgwZmQzYTEyNzk4NzMwMTZkOGZkYzlkN2JjNDE3NmM0M2Q3NmRlCkF1
dGhvcjogVGFubWF5IEphZ2RhbGUgPHRhbm1heUBtYXJ2ZWxsLmNvbT4KCnNwaTogY2FkZW5jZS14
c3BpOiBDbGVhciAiU0RNQSByZWFkeSIgSVJRIGZsYWcgYWZ0ZXIgcG9sbGluZwoKV2hlbiBwb2xs
aW5nIGZvciB0aGUgIlNETUEgcmVhZHkiIGV2ZW50LCBvbmNlIHRoZSBjb3JyZXNwb25kaW5nIGJp
dCBpcwpzZXQgaW4gdGhlIENETlNfWFNQSV9TRE1BX1RSSUdHRVIgd2Ugc2hvdWxkIHJlc2V0IGl0
IHRvIHplcm8uIE90aGVyd2lzZSwKYW55IHN1YnNlcXVlbnQgY2FsbCB0byBjZG5zX3hzcGlfaXNf
c2RtYV9yZWFkeSgpIHdpbGwganVzdCByZXR1cm4gZWFybHkuCgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3Bp
LmMKPiBpbmRleCAzOWM4NjhhNWIxNzFjLi4wOTViZjY0MGIzNzlhIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc3BpL3NwaS1jYWRlbmNlLXhzcGkuYwo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1jYWRl
bmNlLXhzcGkuYwo+IEBAIC0xMDY4LDEyICsxMDY4LDIwIEBAIHN0YXRpYyBib29sIGNkbnNfeHNw
aV9pc19zZG1hX3JlYWR5KHN0cnVjdCBjZG5zX3hzcGlfZGV2ICpjZG5zX3hzcGksIGJvb2wgc2xl
ZXApCj4gIHsKPiAgCXUzMiBjdHJsX3N0YXQ7Cj4gIAo+IC0JcmV0dXJuICFyZWFkbF9yZWxheGVk
X3BvbGxfdGltZW91dAo+IC0JCShjZG5zX3hzcGktPmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NU
QVRVU19SRUcsCj4gLQkJY3RybF9zdGF0LAo+IC0JCShjdHJsX3N0YXQgJiBDRE5TX1hTUElfU0RN
QV9UUklHR0VSKSwKPiAtCQlzbGVlcCA/IE1SVkxfWFNQSV9QT0xMX0RFTEFZX1VTIDogMCwKPiAt
CQlzbGVlcCA/IE1SVkxfWFNQSV9QT0xMX1RJTUVPVVRfVVMgOiAwKTsKPiArCWlmIChyZWFkbF9y
ZWxheGVkX3BvbGxfdGltZW91dAo+ICsJICAgIChjZG5zX3hzcGktPmlvYmFzZSArIENETlNfWFNQ
SV9JTlRSX1NUQVRVU19SRUcsCj4gKwkgICAgIGN0cmxfc3RhdCwKPiArCSAgICAgKGN0cmxfc3Rh
dCAmIENETlNfWFNQSV9TRE1BX1RSSUdHRVIpLAo+ICsJICAgICBzbGVlcCA/IE1SVkxfWFNQSV9Q
T0xMX0RFTEFZX1VTIDogMCwKPiArCSAgICAgc2xlZXAgPyBNUlZMX1hTUElfUE9MTF9USU1FT1VU
X1VTIDogMCkpIHsKCltTZXZlcml0eTogSGlnaF0KQ2FuIHRoZSBzaGFyZWQgSVJRIGhhbmRsZXIg
c3RlYWwgdGhlIFcxQyBiaXRzIGJlaW5nIHBvbGxlZCBoZXJlLCBjYXVzaW5nIGEKc3B1cmlvdXMg
dGltZW91dD8KCkJlY2F1c2UgY2Ruc194c3BpX3Byb2JlKCkgcmVnaXN0ZXJzIGNkbnNfeHNwaV9p
cnFfaGFuZGxlcigpIHdpdGggdGhlCklSUUZfU0hBUkVEIGZsYWcsIGFuIGludGVycnVwdCBmcm9t
IGFub3RoZXIgZGV2aWNlIG9uIHRoZSBzYW1lIGxpbmUgY291bGQKdHJpZ2dlciBjZG5zX3hzcGlf
aXJxX2hhbmRsZXIoKSBkdXJpbmcgdGhpcyBwb2xsaW5nIGxvb3AuCgpJZiB0aGF0IG9jY3Vycywg
dGhlIGhhbmRsZXIgZXhlY3V0ZXMgdGhlIGZvbGxvd2luZzoKCmRyaXZlcnMvc3BpL3NwaS1jYWRl
bmNlLXhzcGkuYzpjZG5zX3hzcGlfaXJxX2hhbmRsZXIoKSB7CiAgICAuLi4KICAgIGlycV9zdGF0
dXMgPSByZWFkbChjZG5zX3hzcGktPmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NUQVRVU19SRUcp
OwogICAgd3JpdGVsKGlycV9zdGF0dXMsIGNkbnNfeHNwaS0+aW9iYXNlICsgQ0ROU19YU1BJX0lO
VFJfU1RBVFVTX1JFRyk7CiAgICAuLi4KfQoKVGhpcyByZWFkcyBDRE5TX1hTUElfSU5UUl9TVEFU
VVNfUkVHIGFuZCB3cml0ZXMgdGhlIGV4YWN0IHZhbHVlIGJhY2ssIGNsZWFyaW5nCmFueSBhY3Rp
dmUgV3JpdGUtMS10by1DbGVhciAoVzFDKSBiaXRzLiBJZiBDRE5TX1hTUElfU0RNQV9UUklHR0VS
IGlzIHNldCwgdGhlCklSUSBoYW5kbGVyIHdvdWxkIGNsZWFyIGl0IGJlZm9yZSB0aGlzIHBvbGxp
bmcgbG9vcCBvYnNlcnZlcyBpdCwgbGVhZGluZyB0byBhCnRpbWVvdXQgYW5kIGZhaWxpbmcgdGhl
IFNQSSB0cmFuc2Zlci4KCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsJfQo+ICsKPiArCS8qIENsZWFy
IHRoZSBmbGFnICovCj4gKwl3cml0ZWwoQ0ROU19YU1BJX1NETUFfVFJJR0dFUiwKPiArCSAgICAg
ICBjZG5zX3hzcGktPmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NUQVRVU19SRUcpOwo+ICsKPiAr
CXJldHVybiB0cnVlOwo+ICB9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNo
aWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDE2MTAyOTE3LjE3MTA5NS0xLXBhdWwuY2VyY3VlaWxA
Ym9vdGxpbi5jb20/cGFydD00CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
