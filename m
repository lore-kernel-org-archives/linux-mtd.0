Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CC2CA5FDD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYEA/gQ0JTPS5Rg3ddUSDILye9Jkrsm/Lx9giW9NjeI=; b=QvbcW4KGcjP2tU
	jnquW9l26Tbezy5eTH1MwyEHNX+5Vshh8vW2HHYFpJdM8shZF79bgTHxYjzjMwP8zhQ4Qv60yZJhF
	ja3JbebJWE9xy9X/togEwhvokTpH0UMqVNeSeXby8a1W5Y0slA3kKMpCPl90Nig4dMp2AjfmJzBu9
	ZinV70i6TXrGF70NEjVkhQgHd9VeGTgLQsB7AGxhAejJKzH1LZzv9y+Nw6wiXNTpe/W8IUk8F/GCo
	SqV0L4b1XGtG3cQOcuGAEMOwQb8A+dUDA0mMQE2J7E/E2g4FhwN3oTZcwH4j3W8fIJu3imCjKw9ua
	R/4Cvj6Dvn9WNOYpQIiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcTC-0000000BaVW-2wtb;
	Fri, 02 Oct 2026 12:34:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcTB-0000000BaUn-1OAj
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:34:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E1E6443C0F;
	Fri,  2 Oct 2026 12:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F6E1F00893;
	Fri,  2 Oct 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790944472;
	bh=e1u+zWn9m4+gmnPgxV8/G3u58jfbnPhH4ksi4NqpCcs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Yj4AVLeaULYkZiUljW4bWcO8K7O6dJnemuPcj6nr9U3KEkg8IvMQ6ZKGl7F3RH2zv
	 /2Xmsx23fNLECqIIwZgY1XxTAll0fbdqMWypNNhG9wjpZdtrHXr/YlGa2E+Lxq6hrT
	 08X+iufbXnn1Hh5p4pMX9pbClcH3IfdpLqW7Rl3ch0qhhCMHPP49NqIv4pQSlmoJx6
	 lQDqn5/XWUh8ZE+U+CV/wqHtgJ57eJ9Js/raWkyJjTqLEg1Rc32Vp3WiEbvIzk5vMr
	 qXcj7yB5rdBWJklOYEAdQfhOZiT+/O/4wIN7ATuPEWyo+acMhRicVytvEFsuCDhZmV
	 HhrcLvZeHNV5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/15] mtd: spi-nor: Fix WRSR with ODTR chips
To: "Richard Weinberger" <richard@nod.at>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, "Steam Lin" <STLin2@winbond.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
 <20261002-winbond-master-spi-nor-w35t-v1-6-a22a2f95c26e@bootlin.com>
Date: Fri, 02 Oct 2026 12:34:31 +0000
Message-Id: <20261002123432.42F6E1F00893@smtp.kernel.org>
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
MiBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogc3BpLW5vcjog
c3RhdGUgbGVhayBpbiBzcGlfbm9yX3dyaXRlX3NyX2xsKCkgZHVlIHRvIG1pc3NpbmcgV0VMIGNs
ZWFudXAKLSBbSGlnaF0gbXRkOiBzcGktbm9yOiAxNi1iaXQgc3RhdHVzIHJlZ2lzdGVyIHdyaXRl
cyBlcnJvbmVvdXNseSByZWplY3RlZCBpbiA4LTgtOCBEVFIgbW9kZQotLQoKY29tbWl0IDRhMjM3
YTg1ODczOWFlMmNiMGQwNjU5MjVjYWMxNWQzZTkwMDlhNzIKQXV0aG9yOiBNaXF1ZWwgUmF5bmFs
IDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKbXRkOiBzcGktbm9yOiBGaXggV1JTUiB3aXRo
IE9EVFIgY2hpcHMKClRoZSBPRFRSIGludGVyZmFjZSByZXF1aXJlcyBhbiBldmVuIG51bWJlciBv
ZiBieXRlcyBpbiBlYWNoIHNlY3Rpb24gb2YKdGhlIG9wZXJhdGlvbi4gc3BpX25vcl9zcGltZW1f
c2V0dXBfb3AoKSB0YWtlcyBjYXJlIG9mIHRoZSBvcGNvZGUgcGhhc2UsCmJ1dCB3ZSBoYXZlIHRv
IGFkYXB0IHRoZSByZXN0IG9mIHRoZSBvcGVyYXRpb24gb3Vyc2VsZi4KCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMK
PiBpbmRleCBjZjIzMDk0MDIxZGFhLi4zODFiYmMxM2Y4MmZmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMK
PiBAQCAtNzkxLDYgKzc5MSwxNyBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfd3JpdGVfc3JfbGwoc3Ry
dWN0IHNwaV9ub3IgKm5vciwgdTggb3Bjb2RlLCBjb25zdCB1OCAqc3IsCj4gIAlpZiAobm9yLT5z
cGltZW0pIHsKPiAgCQlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSV9OT1JfV1JTUl9PUChvcGNv
ZGUsCj4gIAkJCQkJCSAgICAgICBub3ItPmJvdW5jZWJ1ZiwgbGVuKTsKPiArCQlpZiAobm9yLT5y
ZWdfcHJvdG8gPT0gU05PUl9QUk9UT184XzhfOF9EVFIpIHsKPiArCQkJaWYgKGxlbiAhPSAxKQo+
ICsJCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgZWFy
bHkgcmV0dXJuIGxlYWsgdGhlIFdyaXRlIEVuYWJsZSBMYXRjaCBzdGF0ZT8KCkluIHNwaV9ub3Jf
d3JpdGVfc3JfbGwoKSwgc3BpX25vcl93cml0ZV9lbmFibGUoKSBpcyBjYWxsZWQgYmVmb3JlIHRo
aXMgY29kZQppcyByZWFjaGVkLCB3aGljaCB0cmFuc21pdHMgdGhlIFdSRU4gb3Bjb2RlIHRvIHRo
ZSBmbGFzaCBjaGlwIGFuZCBzZXRzIGl0cwppbnRlcm5hbCBXcml0ZSBFbmFibGUgTGF0Y2guCgpJ
ZiBsZW4gaXMgbm90IDEsIHRoaXMgZWFybHkgcmV0dXJuIGJ5cGFzc2VzIHRoZSBleGVjdXRpb24g
b2YgdGhlIGludGVuZGVkIFdSU1IKY29tbWFuZCBhbmQgZG9lcyBub3QgY2FsbCBzcGlfbm9yX3dy
aXRlX2Rpc2FibGUoKSB0byBtYW51YWxseSBjbGVhciB0aGUgbGF0Y2gKYml0LgoKQ291bGQgdGhp
cyBsZWF2ZSB0aGUgZmxhc2ggZ2xvYmFsbHkgd3JpdGUtZW5hYmxlZCBhbmQgdnVsbmVyYWJsZSB0
byBhY2NpZGVudGFsCmRhdGEgY29ycnVwdGlvbj8KCltTZXZlcml0eTogSGlnaF0KRG9lcyB0aGlz
IGNvbmRpdGlvbiB1bmludGVudGlvbmFsbHkgcmVqZWN0IDE2LWJpdCBzdGF0dXMgcmVnaXN0ZXIg
d3JpdGVzCmluIDgtOC04IERUUiBtb2RlPwoKQ2FsbGVycyBsaWtlIHNwaV9ub3Jfd3JpdGVfc3Ix
X2FuZF9zcjIoKSBuYXRpdmVseSBpbnZva2Ugc3BpX25vcl93cml0ZV9zcl9sbCgpCndpdGggbGVu
ID0gMiB0byB3cml0ZSAxNi1iaXQgc3RhdHVzIHJlZ2lzdGVyczoKCmRyaXZlcnMvbXRkL3NwaS1u
b3IvY29yZS5jOnNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9zcjIoKSB7CiAgICAuLi4KCWlmIChwYXJh
bXMtPm9wY29kZXMud3JpdGVfc3IxX2FuZF9zcjIpCgkJcmV0dXJuIHNwaV9ub3Jfd3JpdGVfc3Jf
bGwobm9yLAoJCQkJCSAgIHBhcmFtcy0+b3Bjb2Rlcy53cml0ZV9zcjFfYW5kX3NyMiwKCQkJCQkg
ICBzciwgMik7CiAgICAuLi4KfQoKUmV0dXJuaW5nIC1FT1BOT1RTVVBQIGhlcmUgYmxvY2tzIHRo
ZXNlIHZhbGlkIG9wZXJhdGlvbnMgd2l0aG91dCBhIGZhbGxiYWNrLgoKPiArCj4gKwkJCS8qCj4g
KwkJCSAqIFdlIGRvbid0IHdhbnQgdG8gd3JpdGUgb25seSBvbmUgYnl0ZSBpbiBEVFIgbW9kZS4g
U28sCj4gKwkJCSAqIGR1cGxpY2F0ZSB0aGUgYnVmZmVyIGFuZCB3cml0ZSAyLgo+ICsJCQkgKi8K
PiArCQkJb3AuZGF0YS5uYnl0ZXMgPSAyOwo+ICsJCQlub3ItPmJvdW5jZWJ1ZlsxXSA9IG5vci0+
Ym91bmNlYnVmWzBdOwo+ICsJCX0KPiAgCj4gIAkJc3BpX25vcl9zcGltZW1fc2V0dXBfb3Aobm9y
LCAmb3AsIG5vci0+cmVnX3Byb3RvKTsKPgoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBz
Oi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwMi13aW5ib25kLW1hc3Rlci1zcGktbm9y
LXczNXQtdjEtMC1hMjJhMmY5NWMyNmVAYm9vdGxpbi5jb20/cGFydD02CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
