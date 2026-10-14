Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4B0CC6B1A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnBTaBALRd+qFSYbN6zrKSHyJfxPcsskBH89k63jBDk=; b=jAUhhSEMqRUL4n
	NsVBMhhPhLh6UrJ2DYoTXjnRl0/xWrEqiCEEv/Zascp0+m6q6Da20wgc6GkLEsEJewELfrjxOQ6Y1
	qhpGMVM3FNPMUJEMkXMIaKgxT1rh/q9SNjQAdCL8/VB0oTVgqxW9kJnu44jorkQmE1VKnv+Zo04U2
	b69vgG9F0on2HNYqwYEZuKxrP96yKVxhUazALAyQK3sRexnQAiEDnjPrHTfisLRP65Dxv2boQfN6Z
	OOngE+XJ2BhrB3N4khNRKq01YYwYHcr+gn6zq2fbCfCDYiZLBJ/e7NQlxqgLX3WfSGx8jHkyXq2BE
	rb5uuVhlTwdHEOY419Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1Rj-0000000FviN-1Qah;
	Wed, 14 Oct 2026 16:03:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH1Ri-0000000Fvhy-0GKO
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 16:03:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8558640886;
	Wed, 14 Oct 2026 16:03:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97DD81F000C4;
	Wed, 14 Oct 2026 16:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791993793;
	bh=+9wuJiF/8AtPHnbV+TTWzJaaNLXo96tj7FaD21iumwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fKAOzk2WHESOChqBuF5GdgaC+q1P1mfxs4zc3hobXnzttioIh99CyCJ92667cvE4z
	 39lVXaow20yYSgdriolu1Wx2ZQN92IvYB85iPx4Y4tUjwWeQs4GIZa11qWKIAwnscT
	 6UzI4oi9O24Eio6QY/E63WJhjzeED+YuSaUC1IHQrzfh7he8rc4hH8YaDhM/7qNYJ3
	 N0GTr017Y5yyZuPO6ELraIN9FzhbLRRLHFR6ATnOMnAW3HyJXynNWu6xv8PBk5LeOS
	 lbQw52+/xMBBG3o8R/5tbPw3YD16BsWC16s72jBwvesqPSeOud74p9qY1+4JQbtTdi
	 BIVvTTai1ky7A==
Message-ID: <sashiko-outbox-171512@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 6/7] spi: cadence-xspi: Add support for panic writes
To: "Paul Cercueil" <paul.cercueil@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Mark Brown" <broonie@kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>
Cc: "Kees Cook" <kees@kernel.org>, "Tony Luck" <tony.luck@intel.com>, "Guilherme
 G . Piccoli" <gpiccoli@igalia.com>, linux-mtd@lists.infradead.org, "Bharat
 Bhushan" <bbhushan2@marvell.com>, "Sunil Kovvuri Goutham" <sgoutham@marvell.com>, "Tanmay
 Jagdale" <tanmay@marvell.com>
In-Reply-To: <20261014154301.157755-7-paul.cercueil@bootlin.com>
References: <20261014154301.157755-1-paul.cercueil@bootlin.com>
 <20261014154301.157755-7-paul.cercueil@bootlin.com>
Date: Wed, 14 Oct 2026 16:03:12 +0000
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
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW01lZGl1bV0gc3BpOiBjYWRlbmNl
LXhzcGk6IFVuYm91bmRlZCB3YWl0IGZvciBoYXJkd2FyZSBjb21wbGV0aW9uIGluIFNUSUcgY29t
bWFuZHMKLS0KCmNvbW1pdCA4NGJjYTAxYWFkZGYwY2I5ZGM1NTE2YTVmYWYzOTUzMGM1NjgyZmFl
CkF1dGhvcjogVGFubWF5IEphZ2RhbGUgPHRhbm1heUBtYXJ2ZWxsLmNvbT4KCnNwaTogY2FkZW5j
ZS14c3BpOiBBZGQgc3VwcG9ydCBmb3IgcGFuaWMgd3JpdGVzCgpUaGlzIGNvbW1pdCBhZHZlcnRp
c2VzIHN1cHBvcnQgZm9yIHBhbmljIHdyaXRlcyBpbiB0aGUgQ2FkZW5jZSBYU1BJIGRyaXZlci4K
V2hlbiBhIG1lbW9yeSBvcGVyYXRpb24gaXMgcmVjZWl2ZWQgd2l0aCB0aGUgcGFuaWMgZmxhZyBz
ZXQsIHRoZSBkcml2ZXIKb3BlcmF0ZXMgd2l0aG91dCByZWx5aW5nIG9uIGludGVycnVwdHMgYW5k
IHdpdGhvdXQgc2xlZXBpbmcuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktY2FkZW5j
ZS14c3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14c3BpLmMKPiAtLS0gYS9kcml2ZXJz
L3NwaS9zcGktY2FkZW5jZS14c3BpLmMKPiArKysgYi9kcml2ZXJzL3NwaS9zcGktY2FkZW5jZS14
c3BpLmMKClsgLi4uIF0KCj4gQEAgLTU5NSwyMyArNTkyLDIzIEBAIHN0YXRpYyBpbnQgY2Ruc194
c3BpX3NlbmRfc3RpZ19jb21tYW5kKHN0cnVjdCBjZG5zX3hzcGlfZGV2ICpjZG5zX3hzcGksCj4g
IAo+ICAJCWNkbnNfeHNwaV90cmlnZ2VyX2NvbW1hbmQoY2Ruc194c3BpLCBjbWRfcmVncyk7Cj4g
IAo+IC0JCWlmIChjZG5zX3hzcGktPmlycSA+PSAwKSB7Cj4gKwkJaWYgKGNkbnNfeHNwaS0+aXJx
ID49IDAgJiYgIW9wLT5wYW5pY193cml0ZSkgewo+ICAJCQl3YWl0X2Zvcl9jb21wbGV0aW9uKCZj
ZG5zX3hzcGktPnNkbWFfY29tcGxldGUpOwoKW1NldmVyaXR5OiBNZWRpdW1dCkNvdWxkIHRoaXMg
dW5ib3VuZGVkIHdhaXQgbGVhZCB0byBhIGhhbmcgaWYgdGhlIGhhcmR3YXJlIERNQSBjb21wbGV0
aW9uCmludGVycnVwdCBpcyBsb3N0IGR1cmluZyBhIG5vbi1wYW5pYyBTUEkgbWVtb3J5IG9wZXJh
dGlvbj8KClRoZSBmYWxsYmFjayBwb2xsaW5nIHBhdGggaW4gY2Ruc194c3BpX2lzX3NkbWFfcmVh
ZHkoKSBjb3JyZWN0bHkgZW5mb3JjZXMKYSB0aW1lb3V0LCBidXQgdGhpcyBpbnRlcnJ1cHQgcGF0
aCBpbiBjZG5zX3hzcGlfc2VuZF9zdGlnX2NvbW1hbmQoKQpibG9ja3MgaW5kZWZpbml0ZWx5IGlu
IGFuIHVuaW50ZXJydXB0aWJsZSBzdGF0ZS4KCkRvZXMgaXQgbWFrZSBzZW5zZSB0byB1c2Ugd2Fp
dF9mb3JfY29tcGxldGlvbl90aW1lb3V0KCkgaGVyZSB0byBwcmV2ZW50CnBvdGVudGlhbCBrZXJu
ZWwgbG9ja3VwcyBmcm9tIHVucmVzcG9uc2l2ZSBoYXJkd2FyZT8KCj4gIAkJCWlmIChjZG5zX3hz
cGktPnNkbWFfZXJyb3IpIHsKPiAgCQkJCWNkbnNfeHNwaS0+c2V0X2ludGVycnVwdHNfaGFuZGxl
cihjZG5zX3hzcGksIGZhbHNlKTsKPiAgCQkJCXJldHVybiAtRUlPOwo+ICAJCQl9Cj4gLQkJfSBl
bHNlIGlmICghY2Ruc194c3BpX2lzX3NkbWFfcmVhZHkoY2Ruc194c3BpLCB0cnVlKSkgewo+ICsJ
CX0gZWxzZSBpZiAoIWNkbnNfeHNwaV9pc19zZG1hX3JlYWR5KGNkbnNfeHNwaSwgIW9wLT5wYW5p
Y193cml0ZSkpIHsKPiAgCQkJcmV0dXJuIC1FSU87Cj4gIAkJfQo+ICAKPiAgCQljZG5zX3hzcGkt
PnNkbWFfaGFuZGxlcihjZG5zX3hzcGkpOwo+ICAJfQo+ICAKPiAtCWlmIChjZG5zX3hzcGktPmly
cSA+PSAwKSB7Cj4gKwlpZiAoY2Ruc194c3BpLT5pcnEgPj0gMCAmJiAhb3AtPnBhbmljX3dyaXRl
KSB7Cj4gIAkJd2FpdF9mb3JfY29tcGxldGlvbigmY2Ruc194c3BpLT5jbWRfY29tcGxldGUpOwoK
W1NldmVyaXR5OiBNZWRpdW1dClNpbWlsYXJseSwgY291bGQgdGhpcyB3YWl0IGZvciB0aGUgU1RJ
RyBjb21tYW5kIGNvbXBsZXRpb24gZXhwb3NlIHRoZQpzeXN0ZW0gdG8gYSBoYXJkd2FyZS1pbmR1
Y2VkIGhhbmcgaWYgdGhlIGludGVycnVwdCBpcyBkcm9wcGVkPwoKPiAgCQljZG5zX3hzcGktPnNl
dF9pbnRlcnJ1cHRzX2hhbmRsZXIoY2Ruc194c3BpLCBmYWxzZSk7Cj4gLQl9IGVsc2UgaWYgKCFj
ZG5zX3hzcGlfaXNfc3RpZ19yZWFkeShjZG5zX3hzcGksIHRydWUpKSB7Cj4gKwl9IGVsc2UgaWYg
KCFjZG5zX3hzcGlfaXNfc3RpZ19yZWFkeShjZG5zX3hzcGksICFvcC0+cGFuaWNfd3JpdGUpKSB7
Cj4gIAkJcmV0dXJuIC1FSU87Cj4gIAl9Cj4KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRw
czovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjEwMTQxNTQzMDEuMTU3NzU1LTEtcGF1bC5j
ZXJjdWVpbEBib290bGluLmNvbT9wYXJ0PTYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
