Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 368E9C433FE
	for <linux-mtd@archiver.kernel.org>; Sun,  9 Oct 2022 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWfZhMI7zCvlzD3J1gQ5JeuFmiqLdXaKfztCxauU4bQ=; b=QJnKMhXTPRl3Q0
	o0nzbzmF1sQVXYBIcX+Pj6jTs5LoCOS6bJVAQCIrNhNtRg1jPwp90GafIpkAeuVmS7PJGt3zA9Vzc
	B+qMCNF5A+ea1dLV0hgRl6ostyWFd+CLYy8NXXEk1Dg3NpdzcC64rtaUJ3DP+cDfzFOCUG32lWEDn
	HfHECSZ45pTQxk6Acm1JaUVmDAwjr5SvICylYfg18u/mbtxySC0UrBkEFzZfWX4SZomFlmvhNGxTu
	Cx+PCFFp7epQcGkPM0fn3VvFvfXq4/UbmEgXIkzrfv0qiVQdF2WZQc1IorKwVSHi3h5BYzmduIb9f
	NYECPAtVr9OLMDtAbaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTN8-00FHev-Sb; Sun, 09 Oct 2022 10:17:26 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohTN4-00FHZN-5W
	for linux-mtd@lists.infradead.org; Sun, 09 Oct 2022 10:17:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4ED1760003;
	Sun,  9 Oct 2022 10:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665310634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EJbLySeJ2z0oLQnlb4jRyOMMn4QDACjqzur2LSX6plA=;
	b=e8GYXYi6DqNrSikRmR9wFPZudo6rG+g63ExcWLTFxUPbEwFEfSXvLNiTmYMnNL56jyZhos
	e03vGjIvuZaHvQHKIari555v279PtvGdbTiA3daaan0cIQhl6Ef/afLLjNOsEkCrbSD7aX
	kZAL7cvqlj0qD7hhTWWLtW70ISoR6X6eqCTkdw1n4hudswYE/1SDKLV7ac94el2XjTxaVT
	rm+f/N/4f8HLsm1BZyLXgnvTgi6hvxB5D4MH8OUVPhUvVEt9wqRzBb1xVfCfop0a5mq2qr
	WqLKwy5DG/f37uRkNO5nI7057tzmgAodgA6RzXd1DHSA5mdz3MZNdVCHSY59jg==
Date: Sun, 9 Oct 2022 12:17:10 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Joe Perches <joe@perches.com>
Cc: Ray Zhang <sgzhang@google.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mtd: mtdoops: change printk() to counterpart pr_
 functions
Message-ID: <20221009121710.2ebf951c@xps-13>
In-Reply-To: <0d4febb49ddbae9cd99606a89573a7c832ed0965.camel@perches.com>
References: <20221007215027.918507-1-sgzhang@google.com>
	<20221007215027.918507-2-sgzhang@google.com>
	<0d4febb49ddbae9cd99606a89573a7c832ed0965.camel@perches.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221009_031722_535889_BB610DAF 
X-CRM114-Status: GOOD (  15.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSm9lLAoKam9lQHBlcmNoZXMuY29tIHdyb3RlIG9uIFNhdCwgMDggT2N0IDIwMjIgMDA6MjU6
MDcgLTA3MDA6Cgo+IE9uIEZyaSwgMjAyMi0xMC0wNyBhdCAyMTo1MCArMDAwMCwgUmF5IFpoYW5n
IHdyb3RlOgo+ID4gVG8gY29tcGx5IHdpdGggbGF0ZXN0IGtlcm5lbCBjb2RlIHJlcXVpcmVtZW50
LCBjaGFuZ2UgcHJpbnRrKCkgdG8KPiA+IGNvdW50ZXJwYXJ0IHByXyBmdW5jdGlvbnMgaW4gbXRk
b29wcyBkcml2ZXI6Cj4gPiAtIGNoYW5nZSBwcmludGsoSU5GTykgdG8gcHJfaW5mbygpCj4gPiAt
IGNoYW5nZSBwcmludGsoREVCVUcpIHRvIHByX2RlYnVnKCkKPiA+IC0gY2hhbmdlIHByaW50ayhX
QVJOSU5HKSB0byBwcl93YXJuKCkKPiA+IC0gY2hhbmdlIHByaW50ayhFUlIpIHRvIHByX2Vycigp
Cj4gPiAKPiA+IE5vdGUgdGhhdCBvbmx5IGlmIGR5bmFtaWMgZGVidWdnaW5nIGlzIGVuYWJsZWQg
b3IgREVCVUcgaXMgZGVmaW5lZCwKPiA+IHByaW50ayhLRVJOX0RFQlVHKSBhbmQgcHJfZGVidWco
KSBhcmUgZXF1aXZhbGVudDsgT3RoZXJ3aXNlIHByX2RlYnVnKCkKPiA+IGlzIG5vLW9wLCBjYXVz
aW5nIGRpZmZlcmVudCBiZWhhdmlvci4gIAo+IAo+IEFub3RoZXIgdGhpbmcgcG9zc2libGUgaXMg
dG8gYWRkCj4gCj4gI2RlZmluZSBwcl9mbXQoZm10KSBLQlVJTERfTU9ETkFNRSAiOiAiIGZtdAo+
IAo+IGJlZm9yZSBhbnkgI2luY2x1ZGUKCkdvb2QgcG9pbnQuCgo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL210ZG9vcHMuYyBiL2RyaXZlcnMvbXRkL210ZG9vcHMuYyAgCj4gW10KPiA+IEBA
IC05Myw5ICs5Myw5IEBAIHN0YXRpYyBpbnQgbXRkb29wc19lcmFzZV9ibG9jayhzdHJ1Y3QgbXRk
b29wc19jb250ZXh0ICpjeHQsIGludCBvZmZzZXQpCj4gPiAgCj4gPiAgCXJldCA9IG10ZF9lcmFz
ZShtdGQsICZlcmFzZSk7Cj4gPiAgCWlmIChyZXQpIHsKPiA+IC0JCXByaW50ayhLRVJOX1dBUk5J
TkcgIm10ZG9vcHM6IGVyYXNlIG9mIHJlZ2lvbiBbMHglbGx4LCAweCVsbHhdIG9uIFwiJXNcIiBm
YWlsZWRcbiIsCj4gPiAtCQkgICAgICAgKHVuc2lnbmVkIGxvbmcgbG9uZyllcmFzZS5hZGRyLAo+
ID4gLQkJICAgICAgICh1bnNpZ25lZCBsb25nIGxvbmcpZXJhc2UubGVuLCBtdGRkZXYpOwo+ID4g
KwkJcHJfd2FybigibXRkb29wczogZXJhc2Ugb2YgcmVnaW9uIFsweCVsbHgsIDB4JWxseF0gb24g
XCIlc1wiIGZhaWxlZFxuIiwKPiA+ICsJCQkodW5zaWduZWQgbG9uZyBsb25nKWVyYXNlLmFkZHIs
Cj4gPiArCQkJKHVuc2lnbmVkIGxvbmcgbG9uZyllcmFzZS5sZW4sIG10ZGRldik7ICAKPiAKPiBB
bmQgcmVtb3ZlIHRoZSAibXRkb29wczogIiBwcmVmaXhlcyBmcm9tIGFsbCB0aGUgb3V0cHV0IGZv
cm1hdHMKPiAKPiAJCXByX3dhcm4oImVyYXNlIG9mIHJlZ2lvbiBbMHglbGx4LCAweCVsbHhdIG9u
IFwiJXNcIiBmYWlsZWRcbiIsCj4gCQkJKHVuc2lnbmVkIGxvbmcgbG9uZyllcmFzZS5hZGRyLAo+
IAkJCSh1bnNpZ25lZCBsb25nIGxvbmcpZXJhc2UubGVuLCBtdGRkZXYpOwo+IAo+ID4gQEAgLTEy
MCw4ICsxMjAsOCBAQCBzdGF0aWMgdm9pZCBtdGRvb3BzX2luY19jb3VudGVyKHN0cnVjdCBtdGRv
b3BzX2NvbnRleHQgKmN4dCkKPiA+ICAJCXJldHVybjsKPiA+ICAJfQo+ID4gIAo+ID4gLQlwcmlu
dGsoS0VSTl9ERUJVRyAibXRkb29wczogcmVhZHkgJWQsICVkIChubyBlcmFzZSlcbiIsCj4gPiAt
CSAgICAgICBjeHQtPm5leHRwYWdlLCBjeHQtPm5leHRjb3VudCk7Cj4gPiArCXByX2RlYnVnKCJt
dGRvb3BzOiByZWFkeSAlZCwgJWQgKG5vIGVyYXNlKVxuIiwKPiA+ICsJCSBjeHQtPm5leHRwYWdl
LCBjeHQtPm5leHRjb3VudCk7ICAKPiAKPiAJcHJfZGVidWcoInJlYWR5ICVkLCAlZCAobm8gZXJh
c2UpXG4iLCBjeHQtPm5leHRwYWdlLCBjeHQtPm5leHRjb3VudCk7Cj4gCj4gZXRjLi4uCj4gCgoK
VGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
