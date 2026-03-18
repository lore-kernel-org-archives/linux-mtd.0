Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E1FCD0C3
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Mar 2026 07:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG39eFjiPmE/08+KJkA6Ci83BzB6nEPHyo6NvfBPhf8=; b=z0F/W+XV+ehn+m
	kU6PfzyzMEcd1Hlx8yRoSv3mu5xZxWBlg9vWDCRlPYZhAn5Ns7LIlAFcbdFOo8eekPUHW6ns6KG1j
	fCm9v5bPJQd4AQ2vGHTTDhoYwSIxZaSDmQY4eL9/4HbOkUTxaomL24xSw2Mdipdds/MHS9erPrQec
	A1OSuBRc3puGiTQU+f1YeL+cLHB8ITnUN4mII4tB61oUDLkcRxAmM4mc6KEYwUjttlWZp+JUANXLc
	AkFngC60yR1l7yMQ9j5bytdfOJRA3dOuld/4Nz0nUZKYQHJDkB8UtdMjMHXUE2Wp0+dJa1/Q8C4hm
	z8Kn3lievl5jrlBj2YWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2l8J-00000007uYb-3rnU;
	Wed, 18 Mar 2026 07:15:59 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2l8F-00000007uWX-1HqG;
	Wed, 18 Mar 2026 07:15:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 211FA1A2E95;
	Wed, 18 Mar 2026 07:15:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9D3E6004F;
	Wed, 18 Mar 2026 07:15:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CBCEF104506E6;
	Wed, 18 Mar 2026 08:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773818134; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=f/wnit4uOPVq9r5YYUpYnHPITSDBvtEYXdALfE4LR18=;
	b=MVz6+6FroWlHDW6mHXGBgHiCJxCjhwZKsOAGUkwiONmck9b4YySN1cTUmfcih1U2tnoXMu
	OfOKaONHfmMdsmNqeYxN9hXpuZ4ZWGFdSNTzBZfORX8abPOwIoNCN8P3Klxz93J8LDBtpY
	aZ8WeKwHGUL/pzZh2UVvDjsJ1pAfbPgSXTnAQHMsQ3faY/PKQdBJrJWHiQ5X/OQU5oI9Ek
	omix2N/SK9A5WrXMoaK/cZXLXrwoqFxTLLHH8mRQ+K0l5lCfolJCTtbqQnSSHeTh3TM6GT
	hZI0PbR/WSGzlfmH8mXtT5SwuiAuZuxRYhWhV6HOLWiXYTKSnINke3xRo475MQ==
Message-ID: <9c9d7aea-0227-491b-92d4-5cc4d142e1de@bootlin.com>
Date: Wed, 18 Mar 2026 08:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free
 code clarification
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
 <20260317142437.580204-2-richard.genoud@bootlin.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260317142437.580204-2-richard.genoud@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_001555_830977_78270D5D 
X-CRM114-Status: GOOD (  17.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

TGUgMTcvMDMvMjAyNiDDoCAxNToyNCwgUmljaGFyZCBHZW5vdWQgYSDDqWNyaXTCoDoKPiBUaGUg
YXZhaWxhYmxlIGxlbmd0aCBpcyByZWFsbHkgVVNFUl9EQVRBX0xFTiAtIDIgaW5zdGVhZCBvZiBq
dXN0IDIgKHRoZQo+IHVzZXIgZGF0YSBsZW5ndGggbWludXMgdGhlIEJCTSBsZW5ndGgpCj4gVVNF
Ul9EQVRBX0xFTiBiZWluZyA0LCB0aGF0IGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5nIG5vdywgYnV0
IGlmCj4gVVNFUl9EQVRBX0xFTiBjaGFuZ2VzLCBpdCB3aWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFJpY2hhcmQgR2Vub3VkIDxyaWNoYXJkLmdlbm91ZEBib290bGluLmNvbT4KClNvcnJ5LCBJIGZv
cmdvdCB0byBwaWNrLXVwIHRoZSByZXZpZXcgZnJvbSBDaGVuLVl1IGluIHYyOgoKUmV2aWV3ZWQt
Ynk6IENoZW4tWXUgVHNhaSA8d2Vuc0BrZXJuZWwub3JnPgoKPiAtLS0KPiAgIGRyaXZlcnMvbXRk
L25hbmQvcmF3L3N1bnhpX25hbmQuYyB8IDQgKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
bmFuZC9yYXcvc3VueGlfbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5j
Cj4gaW5kZXggZTY2YWRmY2NhN2NkLi45MTVmMTI0MDU0NmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9yYXcvc3VueGlfbmFuZC5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcv
c3VueGlfbmFuZC5jCj4gQEAgLTE3NTUsMTIgKzE3NTUsMTIgQEAgc3RhdGljIGludCBzdW54aV9u
YW5kX29vYmxheW91dF9mcmVlKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKPiAg
IAo+ICAgCS8qCj4gICAJICogVGhlIGZpcnN0IDIgYnl0ZXMgYXJlIHVzZWQgZm9yIEJCIG1hcmtl
cnMsIGhlbmNlIHdlCj4gLQkgKiBvbmx5IGhhdmUgMiBieXRlcyBhdmFpbGFibGUgaW4gdGhlIGZp
cnN0IHVzZXIgZGF0YQo+ICsJICogb25seSBoYXZlIFVTRVJfREFUQV9TWiAtIDIgYnl0ZXMgYXZh
aWxhYmxlIGluIHRoZSBmaXJzdCB1c2VyIGRhdGEKPiAgIAkgKiBzZWN0aW9uLgo+ICAgCSAqLwo+
ICAgCWlmICghc2VjdGlvbiAmJiBlY2MtPmVuZ2luZV90eXBlID09IE5BTkRfRUNDX0VOR0lORV9U
WVBFX09OX0hPU1QpIHsKPiAgIAkJb29icmVnaW9uLT5vZmZzZXQgPSAyOwo+IC0JCW9vYnJlZ2lv
bi0+bGVuZ3RoID0gMjsKPiArCQlvb2JyZWdpb24tPmxlbmd0aCA9IFVTRVJfREFUQV9TWiAtIDI7
Cj4gICAKPiAgIAkJcmV0dXJuIDA7Cj4gICAJfQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxp
bmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW10ZC8K
