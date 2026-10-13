Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE6BCC6B08
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cv8km6QI/1B/mn6PIrh8VHE/1xP3+BTb+IwkFyLCLoc=; b=g5Co8aoAocIHg4
	ufwehPgFEK/gMLIOWBoeNAGh9Dlx6NT0Cv81yfYdtzGq1UZFqkdRJcB04uBNFPX7oVSq+tW+1ucQf
	vznOc3iHcNPbw5E/rA4RcqP7oBZ0fHL4sXfrMdfHNLDuD7/dGuFSanCdEnnwDy3YJb1wzvpYd82ZG
	GYWDScljDb7sK/HB2GTWhrfX63U8YXeKTculZ5obH92HZtWG+JpkRgw7Y/eMVQUcyygeGLGQpjfbq
	/8o+N3EqG39QkVZt4gZtjuyh8gwkk0q+zQ57ABa5S42yBWbHgQAhatEJyiK4bOIkLGXeoRuoGQl+V
	Js6ZHd+VYIJygIwFzvzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdVO-0000000D6Fs-4C4K;
	Tue, 13 Oct 2026 14:29:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdVN-0000000D6FD-2sct
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:29:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 33B9C435F8;
	Tue, 13 Oct 2026 14:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C681F000FF;
	Tue, 13 Oct 2026 14:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901765;
	bh=zyIj2xoh2ha8nRbZEvCdV8XDrZ+zD7p46xcVWkKAhQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IOhqQ+MMgicDTvP1eM1GxuVnkGBvADcsZaq94Eb/8NUI2NuCVnPm8p/VY/eucrnMH
	 Y2yeCxG5NONLmDrrWpt9OzpF7BwlgcO0LjHV7u6Z5RIKuTWWvPNao5cON062txuz72
	 +Ai5XcZU1MwP9R1YZQK0wJY62aHkjpg6C/ZgVxsMX+XGN9TlrZgXj1SjDcYrrO0mLF
	 xmwcV9/dZ/ghpmx6s+C2zs/zANxTE1Zo1kj9I7y+U3rvLpaA9Gwa55gRgMgltYc9Gk
	 BsKv0ef3jFVcRZ4UTzLnnFH2ygp2wrk79xpXJfXQC82cCY/Pph9P1VUmZz9lLRKI7V
	 diwP8UHyRZ2Ag==
Message-ID: <sashiko-outbox-169909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] spi: cadence-xspi: Add support for panic writes
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261013141350.189996-7-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
 <20261013141350.189996-7-paul.cercueil@bootlin.com>
Date: Tue, 13 Oct 2026 14:29:23 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIHNwaTogY2FkZW5jZS14
c3BpOiBEYXRhIGNvcnJ1cHRpb24gaW4gcGFuaWMgd3JpdGVzIGR1ZSB0byBzdGFsZSBpbnRlcnJ1
cHQgc3RhdHVzCi0tCgpjb21taXQgZjE4YTAxNWUyM2I4NzhiNTIwMjdlMTEwM2E1NWExY2Y0MzI3
Y2Y1MQpBdXRob3I6IFRhbm1heSBKYWdkYWxlIDx0YW5tYXlAbWFydmVsbC5jb20+CgpzcGk6IGNh
ZGVuY2UteHNwaTogQWRkIHN1cHBvcnQgZm9yIHBhbmljIHdyaXRlcwoKQWR2ZXJ0aXNlIHN1cHBv
cnQgZm9yIHBhbmljIHdyaXRlcy4gV2hlbiBhIG1lbW9yeSBvcCBpcyByZWNlaXZlZCB3aXRoCnRo
ZSAncGFuaWMnIGZsYWcgc2V0LCB0aGUgZHJpdmVyIHdpbGwgdGhlbiB3b3JrIHdpdGhvdXQgcmVs
eWluZyBvbgppbnRlcnJ1cHRzIGFuZCB3aXRob3V0IHNsZWVwaW5nLgoKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2Ut
eHNwaS5jCj4gaW5kZXggMTg1ZGZmZGE1NGJiZC4uNjMxMGQwYWEyZDIxMSAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmMKPiArKysgYi9kcml2ZXJzL3NwaS9zcGkt
Y2FkZW5jZS14c3BpLmMKWyAuLi4gXQo+IEBAIC0zNTMsNDAgKzM1OCwzMyBAQCBzdHJ1Y3QgY2Ru
c194c3BpX2RldiB7Cj4gIAlpbnQgY3VycmVudF94ZmVyX3F3b3JkOwo+ICB9OwpbIC4uLiBdCj4g
IHN0YXRpYyBib29sIGNkbnNfeHNwaV9pc19zZG1hX3JlYWR5KHN0cnVjdCBjZG5zX3hzcGlfZGV2
ICpjZG5zX3hzcGksIGJvb2wgc2xlZXApCj4gIHsKPiAgCXUzMiBjdHJsX3N0YXQ7Cj4gIAo+IC0J
aWYgKHJlYWRsX3JlbGF4ZWRfcG9sbF90aW1lb3V0Cj4gLQkgICAgKGNkbnNfeHNwaS0+aW9iYXNl
ICsgQ0ROU19YU1BJX0lOVFJfU1RBVFVTX1JFRywKPiAtCSAgICAgY3RybF9zdGF0LAo+IC0JICAg
ICAoY3RybF9zdGF0ICYgQ0ROU19YU1BJX1NETUFfVFJJR0dFUiksCj4gLQkgICAgIHNsZWVwID8g
TVJWTF9YU1BJX1BPTExfREVMQVlfVVMgOiAwLAo+IC0JICAgICBzbGVlcCA/IE1SVkxfWFNQSV9Q
T0xMX1RJTUVPVVRfVVMgOiAwKSkgewo+ICsJaWYgKGNkbnNfcmVhZGxfcG9sbChjZG5zX3hzcGkt
PmlvYmFzZSArIENETlNfWFNQSV9JTlRSX1NUQVRVU19SRUcsCj4gKwkJCSAgICBjdHJsX3N0YXQs
IChjdHJsX3N0YXQgJiBDRE5TX1hTUElfU0RNQV9UUklHR0VSKSwKPiArCQkJICAgIE1SVkxfWFNQ
SV9QT0xMX0RFTEFZX1VTLCBNUlZMX1hTUElfUE9MTF9USU1FT1VUX1VTLAo+ICsJCQkgICAgc2xl
ZXApKSB7Cj4gIAkJcmV0dXJuIGZhbHNlOwo+ICAJfQpbIC4uLiBdCj4gQEAgLTU1OCwxNCArNTU2
LDE0IEBAIHN0YXRpYyBpbnQgY2Ruc194c3BpX3NlbmRfc3RpZ19jb21tYW5kKHN0cnVjdCBjZG5z
X3hzcGlfZGV2ICpjZG5zX3hzcGksCj4gIAlpbnQgcmV0Owo+ICAJaW50IGR1bW15Ynl0ZXMgPSBv
cC0+ZHVtbXkubmJ5dGVzOwo+ICAKPiAtCXJldCA9IGNkbnNfeHNwaV93YWl0X2Zvcl9jb250cm9s
bGVyX2lkbGUoY2Ruc194c3BpKTsKPiArCXJldCA9IGNkbnNfeHNwaV93YWl0X2Zvcl9jb250cm9s
bGVyX2lkbGUoY2Ruc194c3BpLCAhb3AtPnBhbmljX3dyaXRlKTsKPiAgCWlmIChyZXQgPCAwKQo+
ICAJCXJldHVybiAtRUlPOwo+ICAKPiAgCXdyaXRlbChGSUVMRF9QUkVQKENETlNfWFNQSV9DVFJM
X1dPUktfTU9ERSwgQ0ROU19YU1BJX1dPUktfTU9ERV9TVElHKSwKPiAgCSAgICAgICBjZG5zX3hz
cGktPmlvYmFzZSArIENETlNfWFNQSV9DVFJMX0NPTkZJR19SRUcpOwo+ICAKPiAtCWlmIChjZG5z
X3hzcGktPmlycSA+PSAwKQo+ICsJaWYgKGNkbnNfeHNwaS0+aXJxID49IDAgJiYgIW9wLT5wYW5p
Y193cml0ZSkKPiAgCQljZG5zX3hzcGktPnNldF9pbnRlcnJ1cHRzX2hhbmRsZXIoY2Ruc194c3Bp
LCB0cnVlKTsKCltTZXZlcml0eTogSGlnaF0KRG9lcyB0aGUgZHJpdmVyIG5lZWQgdG8gY2xlYXIg
dGhlIHN0aWNreSBzdGF0dXMgYml0cyBpbgpDRE5TX1hTUElfSU5UUl9TVEFUVVNfUkVHIHdoZW4g
YnlwYXNzaW5nIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciBmb3IgcGFuaWMKd3JpdGVzPwoKSWYgYSBr
ZXJuZWwgcGFuaWMgb2NjdXJzIGltbWVkaWF0ZWx5IGFmdGVyIGEgcHJldmlvdXMgaGFyZHdhcmUg
b3BlcmF0aW9uCmZpbmlzaGVzIGJ1dCBiZWZvcmUgdGhlIGludGVycnVwdCBoYW5kbGVyIGNhbiBl
eGVjdXRlLCBiaXRzIGxpa2UKQ0ROU19YU1BJX1NETUFfVFJJR0dFUiBjb3VsZCByZW1haW4gc2V0
IGluIHRoZSBoYXJkd2FyZSBzdGF0dXMgcmVnaXN0ZXIuCgpCZWNhdXNlIHRoZSBpbnRlcnJ1cHQg
aGFuZGxlciBpcyBieXBhc3NlZCBoZXJlLCB3b3VsZCB0aGUgcG9sbGluZyBsb29wIGluCmNkbnNf
eHNwaV9pc19zZG1hX3JlYWR5KCkgaW1tZWRpYXRlbHkgcmVhZCB0aGUgc3RhbGUgQ0ROU19YU1BJ
X1NETUFfVFJJR0dFUgpiaXQgYXMgdHJ1ZSBhbmQgcHJvY2VlZCBwcmVtYXR1cmVseSBiZWZvcmUg
dGhlIGhhcmR3YXJlIGhhcyBwcmVwYXJlZCB0aGUgbmV3CnRyYW5zZmVyPwoKPiAgCWNkbnNfeHNw
aS0+c2RtYV9lcnJvciA9IGZhbHNlOwo+CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcgaHR0cHM6
Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDEzMTQxMzUwLjE4OTk5Ni0xLXBhdWwuY2Vy
Y3VlaWxAYm9vdGxpbi5jb20/cGFydD02CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
