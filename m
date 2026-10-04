Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D323DCA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pukrx5F2YZqJbbzL9MrWDiO2wf+Ac30vg+QPSd/ZHM=; b=XQz/Kp2Q1kjI7I
	67PV6c2sgKyoQWJEdsoGYX98CRsXEYm9Pavi96p2UfHO074Pouqq025K7vpnwMPXhwtH6SZvgq1Jf
	X2Hm3h3GzKbNvCitVKnv4eYUNuASWMsX87dgOhPeqfxzyXnLe8w2Rqt6WXrc4d3qnUZ738pJ3Ulm2
	qZm5pW9mPHQgU+o7AyF6cwdokP4Tt1TPLvgFmzPd48I9+IYO7HnL68kiySDFBGJrxgpLdUJ6v81Be
	QOZLe8+7vc5wR0Nceo9JVSaFAfQ+e+zDC3OmcmO+Vqn/UelSIrK0mlWn3g5wFt5mmjLkO2gdB1BPp
	MEWxEt5BiwYOc1qRVFRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTzU-0000000FNuR-0Hwn;
	Sun, 04 Oct 2026 21:43:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTzR-0000000FNuL-0e3B
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:43:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85190402C8;
	Sun,  4 Oct 2026 21:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D71CB1F000FF;
	Sun,  4 Oct 2026 21:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791150204;
	bh=gQlzCEAK3U7bGfWnrsR2Mb47o8Np3LZvTSaHLXOZ7gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JEF5oJqgQtmsqzCAnsZ8CCcS1rZZF++4sgYWu0JgxLPsDyP5tbD9fuzCLXAMO/vT2
	 49F2h7c/HeYlRX+fJTOZpAt06qf1Jj+pwRhd83du6xRG+XT8T0JZcVYN6j9MEbDeb1
	 LlZTewjHWOprXz925iJHLMcVkipaChTAGVlpvV5F9B4RQ4Q8LJFP/+zmw/Etfh8dJY
	 okxsKOVNzqTiBoGtApIrISM6pt9boVmgYEflvOE9MjkrH6iDgrAKFBR2hsT8qIXmC9
	 o+2JYnZhRVsFQ1QdA7RfnJB5xzJCGCqUMjtLCyM6+vmyjkAq/a/+ajF1Y5Fz6yPiT1
	 MPV8wj2Gs2CEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/17] mtd: spi-nor: Fix WRSR with ODTR chips
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Michael Walle" <mwalle@kernel.org>
Cc: "Steam Lin" <STLin2@winbond.com>, linux-kernel@vger.kernel.org, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-7-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
 <20261004-winbond-master-spi-nor-w35t-v2-7-592f3300a70f@bootlin.com>
Date: Sun, 04 Oct 2026 21:43:23 +0000
Message-Id: <20261004214323.D71CB1F000FF@smtp.kernel.org>
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
cmVqZWN0aW5nIGxlbiAhPSAxIGluIE9jdGFsIERUUiBtb2RlIGJyZWFrcyAyLWJ5dGUgU1Igd3Jp
dGVzCi0gW0hpZ2hdIG10ZDogc3BpLW5vcjogaGFyZHdhcmUgV0VMIHN0YXRlIGxlYWsgb24gZWFy
bHkgcmV0dXJuIGluIHNwaV9ub3Jfd3JpdGVfc3JfbGwoKQotLQoKY29tbWl0IDEwMWNlNzY3YmRh
ZDE1NTc0MWY4N2U3ZDdjZjU2Zjc3NzlkYjY0MDIKQXV0aG9yOiBNaXF1ZWwgUmF5bmFsIDxtaXF1
ZWwucmF5bmFsQGJvb3RsaW4uY29tPgoKbXRkOiBzcGktbm9yOiBGaXggV1JTUiB3aXRoIE9EVFIg
Y2hpcHMKClRoZSBPRFRSIGludGVyZmFjZSByZXF1aXJlcyBhbiBldmVuIG51bWJlciBvZiBieXRl
cyBpbiBlYWNoIHNlY3Rpb24gb2YKdGhlIG9wZXJhdGlvbi4gc3BpX25vcl9zcGltZW1fc2V0dXBf
b3AoKSB0YWtlcyBjYXJlIG9mIHRoZSBvcGNvZGUgcGhhc2UsCmJ1dCB3ZSBoYXZlIHRvIGFkYXB0
IHRoZSByZXN0IG9mIHRoZSBvcGVyYXRpb24gb3Vyc2VsZi4KCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBpbmRl
eCBjZjIzMDk0MDIxZGFhLi4zODFiYmMxM2Y4MmZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMKPiBAQCAt
NzkxLDYgKzc5MSwxNyBAQCBzdGF0aWMgaW50IHNwaV9ub3Jfd3JpdGVfc3JfbGwoc3RydWN0IHNw
aV9ub3IgKm5vciwgdTggb3Bjb2RlLCBjb25zdCB1OCAqc3IsCj4gIAlpZiAobm9yLT5zcGltZW0p
IHsKPiAgCQlzdHJ1Y3Qgc3BpX21lbV9vcCBvcCA9IFNQSV9OT1JfV1JTUl9PUChvcGNvZGUsCj4g
IAkJCQkJCSAgICAgICBub3ItPmJvdW5jZWJ1ZiwgbGVuKTsKPiArCQlpZiAobm9yLT5yZWdfcHJv
dG8gPT0gU05PUl9QUk9UT184XzhfOF9EVFIpIHsKPiArCQkJaWYgKGxlbiAhPSAxKQo+ICsJCQkJ
cmV0dXJuIC1FT1BOT1RTVVBQOwoKW1NldmVyaXR5OiBIaWdoXQpEb2VzIHRoaXMgZXJyb25lb3Vz
bHkgcmVqZWN0IGxlZ2l0aW1hdGUgMi1ieXRlIHJlZ2lzdGVyIHdyaXRlcyByZXF1aXJlZCBmb3IK
RFRSLWVuYWJsZWQgY2hpcHM/CgpMb29raW5nIGF0IHNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9zcjIo
KSwgaXQgcGFzc2VzIGxlbiA9IDIgdG8Kc3BpX25vcl93cml0ZV9zcl9sbCgpLCB3aGljaCBpcyBu
b3cgYnJva2VuIGJ5IHRoaXMgY2hlY2suCgpUaGlzIHByb3BhZ2F0ZXMgLUVPUE5PVFNVUFAgb3V0
IHRvIHVzZXJzcGFjZSB2aWEgc3BpX25vcl9zcl91bmxvY2soKSwgcmVzdWx0aW5nCmluIGEgdmlz
aWJsZSByZWdyZXNzaW9uIHdoZXJlIFNvZnR3YXJlIFdyaXRlIFByb3RlY3Rpb24gdW5sb2NraW5n
IGFuZCBmbGFzaApjb25maWd1cmF0aW9uIGZhaWxzIGZvciA4LTgtOCBEVFIgY2hpcHMuCgpbU2V2
ZXJpdHk6IEhpZ2hdCkRvZXMgcmV0dXJuaW5nIGVhcmx5IGhlcmUgbGVhdmUgdGhlIFdyaXRlIEVu
YWJsZSBMYXRjaCAoV0VMKSBwZXJzaXN0ZW50bHkgYWN0aXZlCm9uIHRoZSBmbGFzaCBkZXZpY2U/
CgpTaW5jZSBzcGlfbm9yX3dyaXRlX3NyX2xsKCkgY2FsbHMgc3BpX25vcl93cml0ZV9lbmFibGUo
bm9yKSBlYXJsaWVyIGluIHRoZQpmdW5jdGlvbiwgdGhpcyBlYXJseSByZXR1cm4gaGFwcGVucyB3
aXRob3V0IGV4ZWN1dGluZyB0aGUgU1BJIGNvbW1hbmQgdGhhdCB3b3VsZApuYXR1cmFsbHkgY2xl
YXIgaXQuIExlYXZpbmcgdGhlIGhhcmR3YXJlIHdyaXRlLWVuYWJsZWQgcmlza3MgYWNjaWRlbnRh
bCBkYXRhCmNvcnJ1cHRpb24gZnJvbSBzdHJheSB3cml0ZXMuCgo+ICsKPiArCQkJLyoKPiArCQkJ
ICogV2UgZG9uJ3Qgd2FudCB0byB3cml0ZSBvbmx5IG9uZSBieXRlIGluIERUUiBtb2RlLiBTbywK
PiArCQkJICogZHVwbGljYXRlIHRoZSBidWZmZXIgYW5kIHdyaXRlIDIuCj4gKwkJCSAqLwo+ICsJ
CQlvcC5kYXRhLm5ieXRlcyA9IDI7Cj4gKwkJCW5vci0+Ym91bmNlYnVmWzFdID0gbm9yLT5ib3Vu
Y2VidWZbMF07Cj4gKwkJfQo+ICAKPiAgCQlzcGlfbm9yX3NwaW1lbV9zZXR1cF9vcChub3IsICZv
cCwgbm9yLT5yZWdfcHJvdG8pOwoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2Fz
aGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MTAwNC13aW5ib25kLW1hc3Rlci1zcGktbm9yLXczNXQt
djItMC01OTJmMzMwMGE3MGZAYm9vdGxpbi5jb20/cGFydD03CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
