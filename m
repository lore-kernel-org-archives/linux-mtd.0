Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D7CA5FF0
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Oct 2026 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1aeSb+nItm8jUt6lEyJUiYOiVOjaGCGF1Muj/9MJzMk=; b=ySJE5cYTJKIBFb
	qpT4OruCWvmE47wvjCYzmxbwNOMgdvyzorGIdGSQL6+NqvFYgl0IXQ5P/1eK5ykfVZpKttS1/kBbU
	dyUZaOBE8yuaoN08ASQmM+zIzY0mmSKX9adukEBxovwF57cCOVyZ8+nuCZGp5wKp8FzjUI+SDsq1U
	IHDVNlKpNUW/yvyKJQw9PMjaBKAclfkQOFJO5AoTxzF2OHt0pFeqr0FukJbB+ZLNVePj+ctcgUVSE
	5WP6X6JobdYfXqRVs8ggPzdeXazUamOp4OeFqU3dNkBYCBMrO6ym8dJcVYxjFeOhUI6vahPKgRI5p
	QigH1aHrTazunWNMb7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdwl-0000000FruI-2Xrx;
	Mon, 05 Oct 2026 08:21:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDdwk-0000000FruC-2mRQ
	for linux-mtd@lists.infradead.org;
	Mon, 05 Oct 2026 08:21:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DD6F4394E;
	Mon,  5 Oct 2026 08:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717511F000FF;
	Mon,  5 Oct 2026 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791188478;
	bh=c/G1XSRkKImry3vyKFaUvjIQzmHGHq4zy54WQCT7DR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g7wuFhSXu0X/70AdYFbtvGM5nhuZJ70Z3jVz1/6fz7uHw8AGjKOY4zS7U1NZc/zP1
	 SABaVCdYbXsyc4GsEU4HquXXkAUCcvVbNU92nfm+9W4a4N6py9dGKT8T2Bi40KkPjt
	 Zi9/Sgd+2ITCWSiEnhpeA4V+wJNtzP/Ha86a/MRv/3qvpk4yDJJ1PhrUrKc+6TAQiK
	 QZI7nXt/oHR62chN/AVRKxMtr+Cq2Q3KdBVmky/xSFbIEDGSMvsspiBOcMYPEwG+zy
	 3DCt5o7oAPpvnPcmv0LW/DTjMOLUSlmo90GhuDJKzbnQi4DDOtItXufpDfNJXhrmcQ
	 DErNeL001FeRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] spi: cadence-xspi: Don't use infinite timeout in
 register poll
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Mark
 Brown" <broonie@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Michael Walle" <mwalle@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>
Cc: "Kees Cook" <kees@kernel.org>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, "Tanmay
 Jagdale" <tanmay@marvell.com>, linux-mtd@lists.infradead.org, "Guilherme G
 . Piccoli" <gpiccoli@igalia.com>, "Tony Luck" <tony.luck@intel.com>
In-Reply-To: <20261005081141.33688-5-paul.cercueil@bootlin.com>
References: <20261005081141.33688-1-paul.cercueil@bootlin.com>
 <20261005081141.33688-5-paul.cercueil@bootlin.com>
Date: Mon, 05 Oct 2026 08:21:17 +0000
Message-Id: <20261005082117.717511F000FF@smtp.kernel.org>
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
c3BpOiBkZWFkbG9jayBpbiBwYW5pYyB3cml0ZXMgZHVlIHRvIG5vbi1hdG9taWMgcG9sbCBtYWNy
bwotLQoKY29tbWl0IDNmNjJiMjI0NTQ2MGMzM2RjYjZmYjY2MTVkN2ZkZjAzZGU4Mjc3NzYKQXV0
aG9yOiBUYW5tYXkgSmFnZGFsZSA8dGFubWF5QG1hcnZlbGwuY29tPgoKc3BpOiBjYWRlbmNlLXhz
cGk6IERvbid0IHVzZSBpbmZpbml0ZSB0aW1lb3V0IGluIHJlZ2lzdGVyIHBvbGwKClRoZSBjb21t
aXQgbW9kaWZpZXMgdGhlIHJlZ2lzdGVyIHBvbGxpbmcgZnVuY3Rpb25zIHRvIGVuZm9yY2UgYSBu
b24temVybwp0aW1lb3V0IGV2ZW4gd2hlbiB0aGUgc2xlZXAgYXJndW1lbnQgaXMgZmFsc2UuIFRo
aXMgcHJldmVudHMgYnVzeS13YWl0cyBmcm9tCnN3aXRjaGluZyB0byBpbmZpbml0ZSB0aW1lb3V0
cy4gVGhlIGNoYW5nZSBhbnRpY2lwYXRlcyBmdXR1cmUgcGFuaWMgd3JpdGUKaGFuZGxpbmcgc3Vw
cG9ydC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXhzcGkuYyBiL2Ry
aXZlcnMvc3BpL3NwaS1jYWRlbmNlLXhzcGkuYwo+IGluZGV4IDdjZjUyYmNiMDVkZjYuLjA5ZWQy
YWZiZDRhZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jCj4g
KysrIGIvZHJpdmVycy9zcGkvc3BpLWNhZGVuY2UteHNwaS5jCj4gQEAgLTM3NCw3ICszNzQsNyBA
QCBzdGF0aWMgYm9vbCBjZG5zX3hzcGlfaXNfc3RpZ19yZWFkeShzdHJ1Y3QgY2Ruc194c3BpX2Rl
diAqY2Ruc194c3BpLCBib29sIHNsZWVwKQo+ICAJCWN0cmxfc3RhdCwKPiAgCQkoKGN0cmxfc3Rh
dCAmIEJJVCgzKSkgPT0gMCksCj4gIAkJc2xlZXAgPyBNUlZMX1hTUElfUE9MTF9ERUxBWV9VUyA6
IDAsCj4gLQkJc2xlZXAgPyBNUlZMX1hTUElfUE9MTF9USU1FT1VUX1VTIDogMCk7Cj4gKwkJTVJW
TF9YU1BJX1BPTExfVElNRU9VVF9VUyk7CgpbU2V2ZXJpdHk6IEhpZ2hdCkRvZXMgdGhpcyB1bmNv
bmRpdGlvbmFsbHkgdHJpZ2dlciB0aW1la2VlcGluZyBmdW5jdGlvbnMgaW4gcGFuaWMgY29udGV4
dHM/CgpXaGVuIHNsZWVwIGlzIGZhbHNlLCB0aGUgcGFuaWMgd3JpdGUgaGFuZGxlciBjYW4gZGVh
ZGxvY2suCgpUaGUgcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXQoKSBtYWNybyBleHBhbmRzIHRv
IHBvbGxfdGltZW91dF91cygpLCB3aGljaAp1bmNvbmRpdGlvbmFsbHkgY2FsbHMga3RpbWVfZ2V0
KCkgd2hlbiBhIG5vbi16ZXJvIHRpbWVvdXQgaXMgcHJvdmlkZWQuCgpJbiBhIHBhbmljIGNvbnRl
eHQsIHRpbWVrZWVwaW5nIGlzIHN1c3BlbmRlZC4KCklmIGEgc3lzdGVtIHBhbmljIG9jY3VycyB3
aGlsZSBhbm90aGVyIENQVSBob2xkcyB0aGUgdGltZWtlZXBpbmcgc2VxbG9jawoodGtfY29yZS5z
ZXEpIGFuZCBpcyBzdG9wcGVkLCBrdGltZV9nZXQoKSB3aWxsIHNwaW4gZW5kbGVzc2x5IGluCnJl
YWRfc2VxY291bnRfYmVnaW4oKSwgZGVhZGxvY2tpbmcgdGhlIHN5c3RlbS4KClRoaXMgcHJldmVu
dHMgb29wcy9rbXNnIGNyYXNoIGxvZ3MgZnJvbSBiZWluZyB3cml0dGVuIHRvIGZsYXNoLCB3aGlj
aCBpcyB3aHkKdGhlIDxsaW51eC9pb3BvbGwuaD4gQVBJIGNvbnRyYWN0IGV4cGxpY2l0bHkgZm9y
YmlkcyB1c2luZyBpdCBpbiBhdG9taWMKY29udGV4dHMgd2l0aCBhIG5vbi16ZXJvIHRpbWVvdXQu
CgpUbyBzYWZlbHkgcG9sbCB3aXRob3V0IHNsZWVwaW5nIGluIHBhbmljIGNvbnRleHRzLCBzaG91
bGQgdGhlIGRyaXZlcgpjb25kaXRpb25hbGx5IHVzZSByZWFkbF9yZWxheGVkX3BvbGxfdGltZW91
dF9hdG9taWMoKSwgd2hpY2ggcmVsaWVzIG9uCnVkZWxheSgpIGFuZCBjeWNsZSBjb3VudGluZyBp
bnN0ZWFkIG9mIGt0aW1lX2dldCgpPwoKPiAgfQo+ICAKPiAgc3RhdGljIGJvb2wgY2Ruc194c3Bp
X2lzX3NkbWFfcmVhZHkoc3RydWN0IGNkbnNfeHNwaV9kZXYgKmNkbnNfeHNwaSwgYm9vbCBzbGVl
cCkKPiBAQCAtMzg2LDcgKzM4Niw3IEBAIHN0YXRpYyBib29sIGNkbnNfeHNwaV9pc19zZG1hX3Jl
YWR5KHN0cnVjdCBjZG5zX3hzcGlfZGV2ICpjZG5zX3hzcGksIGJvb2wgc2xlZXApCj4gIAkJY3Ry
bF9zdGF0LAo+ICAJCShjdHJsX3N0YXQgJiBDRE5TX1hTUElfU0RNQV9UUklHR0VSKSwKPiAgCQlz
bGVlcCA/IE1SVkxfWFNQSV9QT0xMX0RFTEFZX1VTIDogMCwKPiAtCQlzbGVlcCA/IE1SVkxfWFNQ
SV9QT0xMX1RJTUVPVVRfVVMgOiAwKTsKPiArCQlNUlZMX1hTUElfUE9MTF9USU1FT1VUX1VTKTsK
CltTZXZlcml0eTogSGlnaF0KQ2FuIHRoZSBzYW1lIGRlYWRsb2NrIG9jY3VyIGluIHRoZSBTRE1B
IHBvbGxpbmcgbG9vcCBzaW5jZSB0aGlzIGFsc28gY2FsbHMKcmVhZGxfcmVsYXhlZF9wb2xsX3Rp
bWVvdXQoKSB3aXRoIGEgbm9uLXplcm8gdGltZW91dCB3aGVuIHNsZWVwIGlzIGZhbHNlPwoKPiAg
fQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNl
dC8yMDI2MTAwNTA4MTE0MS4zMzY4OC0xLXBhdWwuY2VyY3VlaWxAYm9vdGxpbi5jb20/cGFydD00
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
