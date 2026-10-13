Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E66CC6B0E
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 14:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/yvgWI81ZyGom5INp+4GnwZ8eIwbWTAoMyQ001nnGE=; b=mlMvcT7lMfJQO4
	nDygNV5JaR28vIqcAW9ct5htg0GhCd8mCWy/lSsp98HAdZc/jJzPEXe2sk/C9Vx66iFmQ+d1AuA+p
	H46Wqf3AfG61HVobPGxLrRsx/8mv507YDdIC+A9iNknJU6meMNeEmoQ4twc6S7PKNSvPBKpPn9Zdz
	xBvtzqunublloOYfWWUyUhBt0SE2cjHt487XDKmhUwKPDz7he0QVZTJ8Hw37bUrVW/6dqyRrRZdzZ
	/kqX1ugqTe3m5HFwQOakXNSn1XeGrJgb+QJ9Uh2dtXKVvZaiGyKeflB7poy5hnfZAcLznYvnJnv2w
	Z9+llA2eg94DAkVBvJ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdWF-0000000D6TG-2COU;
	Tue, 13 Oct 2026 14:30:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGdWD-0000000D6SJ-1vvQ
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 14:30:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C983B602C3;
	Tue, 13 Oct 2026 14:30:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAAA81F000FF;
	Tue, 13 Oct 2026 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791901816;
	bh=Ek1gpWJpNIPyU5d3w50f90pNjwTB89jJUfkkaxfsvfY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j1FhlcfpOaPEhrv7evhtiHMT5tCgvNT5oJgMGAguKfVrNIoZtTdGHZOTqstJ1Y/Nx
	 XnMu7Q/NfKtW7GZf7ASW7p9vKQNe8fn95OqVxn5EvKk0wdH3QQT/rqMp0M7D61nTqS
	 gJ2HXyPMWidl2YoNdnIPrJOiwIBp+hHIrk0wgYiJ/l5d9lIH3jz3tqhye3lmVk4jXW
	 hTnYvgQIEE3MYl7pZa4W9BDi8VTZ0euOIz2QwPUkRGOP5up7czqH8zvF5Wf2jn6U5A
	 QmJDJi0wDQG0tCM/HbiACcE5PTfOa+SV4V/l2ZlMwk3JlsG4FFe8mk8coo5grl18tu
	 l+qSJdXu65YvA==
Message-ID: <sashiko-outbox-169912@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] mtd: spi-nor: Wait for NOR ready with
 poll_timeout_us()
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261013141350.189996-3-paul.cercueil@bootlin.com>
References: <20261013141350.189996-1-paul.cercueil@bootlin.com>
 <20261013141350.189996-3-paul.cercueil@bootlin.com>
Date: Tue, 13 Oct 2026 14:30:15 +0000
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
MzItYml0IGludGVnZXIgb3ZlcmZsb3cgaW4gdGltZW91dF9tcyAqIDEwMDAKLS0KCmNvbW1pdCBk
ODhmMzI5YWNhNGI1N2RiNWU0YmEwYTBmYzc0OGVlNGQ3NDQwYWJhCkF1dGhvcjogVGFubWF5IEph
Z2RhbGUgPHRhbm1heUBtYXJ2ZWxsLmNvbT4KCm10ZDogc3BpLW5vcjogV2FpdCBmb3IgTk9SIHJl
YWR5IHdpdGggcG9sbF90aW1lb3V0X3VzKCkKCkluc3RlYWQgb2YgcG9sbGluZyBmb3IgdGhlIHNw
aV9ub3JfcmVhZHkoKSB3aXRoIGEgY3VzdG9tIGxvb3AsIHVzZQpwb2xsX3RpbWVvdXRfdXMoKS4g
VGhlIHNsZWVwIHBlcmlvZCBiZXR3ZWVuIHR3byBwb2xscyBpcyBzZXQgdG8gMTAwIHVzCndoaWNo
IEkgdGhpbmsgc2hvdWxkIGJlIGZpbmUuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gaW5kZXggOGJjMTE3YjQ2
ZTAyOC4uMjUwOWZiOTgzZDRmMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2Nv
cmUuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jClsgLi4uIF0KPiBAQCAtNzEy
LDI5ICs3MTMsMjEgQEAgc3RhdGljIGludCBzcGlfbm9yX3JlYWR5KHN0cnVjdCBzcGlfbm9yICpu
b3IpCj4gICAqIFJldHVybjogMCBvbiBzdWNjZXNzLCAtZXJybm8gb3RoZXJ3aXNlLgo+ICAgKi8K
PiAgc3RhdGljIGludCBzcGlfbm9yX3dhaXRfdGlsbF9yZWFkeV93aXRoX3RpbWVvdXQoc3RydWN0
IHNwaV9ub3IgKm5vciwKPiAtCQkJCQkJdW5zaWduZWQgbG9uZyB0aW1lb3V0X2ppZmZpZXMpCj4g
KwkJCQkJCXVuc2lnbmVkIGxvbmcgdGltZW91dF9tcykKPiAgewo+IC0JdW5zaWduZWQgbG9uZyBk
ZWFkbGluZTsKPiAtCWludCB0aW1lb3V0ID0gMCwgcmV0Owo+ICsJaW50IHJldCwgc3RhdHVzOwo+
ICAKPiAtCWRlYWRsaW5lID0gamlmZmllcyArIHRpbWVvdXRfamlmZmllczsKPiAtCj4gLQl3aGls
ZSAoIXRpbWVvdXQpIHsKPiAtCQlpZiAodGltZV9hZnRlcl9lcShqaWZmaWVzLCBkZWFkbGluZSkp
Cj4gLQkJCXRpbWVvdXQgPSAxOwo+IC0KPiAtCQlyZXQgPSBzcGlfbm9yX3JlYWR5KG5vcik7Cj4g
LQkJaWYgKHJldCA8IDApCj4gLQkJCXJldHVybiByZXQ7Cj4gLQkJaWYgKHJldCkKPiAtCQkJcmV0
dXJuIDA7Cj4gLQo+IC0JCWNvbmRfcmVzY2hlZCgpOwo+ICsJcmV0ID0gcG9sbF90aW1lb3V0X3Vz
KHN0YXR1cyA9IHNwaV9ub3JfcmVhZHkobm9yKSwgc3RhdHVzLAo+ICsJCQkgICAgICAxMDAsIHRp
bWVvdXRfbXMgKiAxMDAwLCBmYWxzZSk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXl5eXl5eXl5eXl5eXl5eXl5eXgpbU2V2ZXJpdHk6IEhpZ2hdCkNhbiB0aGlzIG11bHRpcGxp
Y2F0aW9uIG92ZXJmbG93IG9uIDMyLWJpdCBzeXN0ZW1zPwoKSW4gc3BpX25vcl9lcmFzZV9kaWNl
KCksIHRoZSB0aW1lb3V0IHNjYWxlcyB3aXRoIHRoZSBmbGFzaCBzaXplLiBGb3IgYSAyNTZNQgpm
bGFzaCwgdGltZW91dF9tcyBldmFsdWF0ZXMgdG8gNDAwMDBVTCAqIDEyOCA9IDUsMTIwLDAwMC4K
CkJlY2F1c2UgYm90aCBvcGVyYW5kcyBhcmUgMzItYml0IHR5cGVzIG9uIDMyLWJpdCBwbGF0Zm9y
bXMsIHRoZSBhcml0aG1ldGljCmNvdWxkIG92ZXJmbG93IFVMT05HX01BWCAoNCwyOTQsOTY3LDI5
NSksIHdyYXBwaW5nIHRvIDgyNSwwMzIsNzA0IGJlZm9yZSBiZWluZwppbXBsaWNpdGx5IHByb21v
dGVkIHRvIHU2NCBpbnNpZGUgdGhlIHBvbGxfdGltZW91dF91cyBtYWNyby4KClRoaXMgdHJ1bmNh
dGVzIHRoZSB3YWl0IHRpbWVvdXQgZnJvbSB+ODUgbWludXRlcyB0byB+MTMuNyBtaW51dGVzLCB3
aGljaCBjb3VsZApjYXVzZSBsZWdpdGltYXRlbHkgc2xvdyBlcmFzZSBvcGVyYXRpb25zIG9uIGxh
cmdlIGZsYXNoZXMgdG8gcHJlbWF0dXJlbHkgYWJvcnQKd2l0aCAtRVRJTUVET1VULgoKPiArCWlm
IChyZXQgPCAwKSB7Cj4gLQlkZXZfZGJnKG5vci0+ZGV2LCAiZmxhc2ggb3BlcmF0aW9uIHRpbWVk
IG91dFxuIik7Cj4gKwkJZGV2X2RiZyhub3ItPmRldiwgImZsYXNoIG9wZXJhdGlvbiB0aW1lZCBv
dXRcbiIpOwo+ICsJCXJldHVybiByZXQ7Cj4gKwl9CgotLSAKU2FzaGlrbyBBSSByZXZpZXcgwrcg
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYxMDEzMTQxMzUwLjE4OTk5Ni0xLXBh
dWwuY2VyY3VlaWxAYm9vdGxpbi5jb20/cGFydD0yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
