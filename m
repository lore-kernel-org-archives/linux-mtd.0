Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221C5CA0EFC
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Aug 2025 15:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bbsfiQWyMWcGuJxyIaX/MsWN2x4fXKRc0yfdv0YOAQ=; b=MZ8vlsgwNKU4lC
	qD8nHcP9QqY3oKxxS/U2vOg5q6cd9H1aXo4MFsptxUKM8lJ/ffFzKPvRa9ExsNigI58nmUejfDCPL
	oHzrVidfaQIb5CrIKZtbUiIdCgVOX3o5gUciMWWq55V962iQNJ7Uqbqc26njk9tTNmPas2rX24JfD
	YEJ4z1bcBL0iUGUZ9n9M2VJ0UtxaO6m9BE1vEmy3bmtkn/EcIc9rA29T7mcMk80rIPUiKscnAYyEP
	iXD/o6K27WS00mWTJFr3RyVI8NNDK2jLhQgKUadcZ7FTLmTjldD+z1xi7hGQZo7m6fTbWkT3HqXVv
	KUZ7rLhP8wTs9EPzxzjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCph-00000006J2a-1wJu;
	Sun, 24 Aug 2025 15:40:37 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqCpe-00000006J2B-3P0p
	for linux-mtd@lists.infradead.org;
	Sun, 24 Aug 2025 15:40:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3A51DC653ED;
	Sun, 24 Aug 2025 15:40:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1D32E605F1;
	Sun, 24 Aug 2025 15:40:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ADFCB1C2282BF;
	Sun, 24 Aug 2025 17:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756050031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MotUNYtWFgc8OORlfbN4GS88Cb0UZDtllVzLDmU3zCs=;
	b=WeEmgYIqPuzO2yFtzWo79qo6u1aKpCZcQqdmC+eR1l5vXDo0+xGHRsipk77Gd9/41kY2ij
	eqh8sKV8o+fwY3eqeGstLQHjqhxyggIRr4oZdhsK8BpX6LS8tj8eYKx9zpp+iUGWdV2sCl
	+kROdgZ3j6NjY/y4KrBi7cDAVdVHOQd4xeN4qvuhIyoD8DwvgzCf3QtK/Pd/JYNHNbYvtn
	k4PolOE1pSxmJ0tiKmm8/g+Uw00O05eriwioFivwCe3cFVoCCFCD94YQD2HI597g1ZJ2Ck
	pEQZT/LC99A3PXsqtIbt+byL8acVH6FPo2MIrWHNezxau0S6OgvwM6ooBuAV7A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,  Huacai Chen
 <chenhuacai@loongson.cn>,  Rob Herring <robh+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Keguang Zhang <keguang.zhang@gmail.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Huacai Chen
 <chenhuacai@kernel.org>,  Xuerui Wang <kernel@xen0n.name>,
  loongarch@lists.linux.dev,  devicetree@vger.kernel.org,
  linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 7/7] mtd: rawnand: loongson: Add Loongson-2K1000 NAND
 controller support
In-Reply-To: <f01986dcb9f16450bd7f38c8fd663df686e6d145.1755757841.git.zhoubinbin@loongson.cn>
	(Binbin Zhou's message of "Thu, 21 Aug 2025 14:39:21 +0800")
References: <cover.1755757841.git.zhoubinbin@loongson.cn>
	<f01986dcb9f16450bd7f38c8fd663df686e6d145.1755757841.git.zhoubinbin@loongson.cn>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Sun, 24 Aug 2025 17:40:02 +0200
Message-ID: <875xeclodp.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_084035_025963_91A467E2 
X-CRM114-Status: GOOD (  13.58  )
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

T24gMjEvMDgvMjAyNSBhdCAxNDozOToyMSArMDgsIEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxv
b25nc29uLmNuPiB3cm90ZToKCj4gVGhlIExvb25nc29uLTJLMTAwMCBOQU5EIGNvbnRyb2xsZXIg
aXMgYWxzbyBzaW1pbGFyIHRvIHRoZSBMb29uZ3Nvbi0xQy4KPgo+IEl0IHN1cHBvcnRzIGEgbWF4
aW11bSBjYXBhY2l0eSBvZiAxNkdCIEZMQVNIIHBlciBjaGlwIHdpdGggYSBtYXhpbXVtCj4gcGFn
ZSBzaXplIG9mIDhLQiwgYW5kIGl0IHN1cHBvcnRzIHVwIHRvIDQgY2hpcCBzZWxlY3RzIGFuZCA0
IFJEWQo+IHNpZ25hbHMuCj4KPiBUaGUga2V5IGRpZmZlcmVuY2UgZnJvbSB0aGUgTG9vbmdzb24t
MkswNTAwIGlzIHRoYXQgaXQgcmVxdWlyZXMgZXhwbGljaXQKPiBjb25maWd1cmF0aW9uIG9mIHRo
ZSBETUEgY29udHJvbCByb3V0ZS4gVHlwaWNhbGx5LCBpdCBpcyBjb25maWd1cmVkIGFzCj4gQVBC
RE1BMC4KPgo+IFNpZ25lZC1vZmYtYnk6IEJpbmJpbiBaaG91IDx6aG91YmluYmluQGxvb25nc29u
LmNuPgo+IC0tLQo+ICAuLi4vbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQtY29udHJvbGxlci5j
ICAgfCA0OCArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFu
ZC1jb250cm9sbGVyLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9sb29uZ3Nvbi1uYW5kLWNvbnRy
b2xsZXIuYwo+IGluZGV4IDdiMzMxZDBjYTJmMC4uNjYxMGMyMzlmNzIxIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2xvb25nc29uLW5hbmQtY29udHJvbGxlci5jCj4gKysrIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvbG9vbmdzb24tbmFuZC1jb250cm9sbGVyLmMKPiBAQCAtNzMs
OSArNzMsMTggQEAKPiAgI2RlZmluZSBMT09OR1NPTl9OQU5EX1JFQURfSURfVElNRU9VVF9VUwk1
MDAwCj4gIAo+ICAjZGVmaW5lIExPT05HU09OX05BTkRfNjRCSVRfRE1BCQlCSVQoMCkKPiArI2Rl
ZmluZSBMT09OR1NPTl9OQU5EX0RNQV9DT05GSUcJQklUKDEpCgpZb3UncmUgcmV1c2luZyB0aGlz
IGZsYWdzIG1lbWJlciwgc28gaXQncyBmaW5lLCBwbGVhc2UgaWdub3JlIHRoZQpwcmV2aW91cyBj
b21tZW50IChleGNlcHQgdGhlIHN0eWxlIGlzc3VlKS4KCi4uLgoKPiArCXJlZ3MgPSBkZXZtX3Bs
YXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMik7CgpXb3VsZCBpdCBiZSBjbGVhcmVyIHRv
IGdldCB0aGUgcmVzb3VyY2UgYnkgbmFtZT8gKG5vdCBhIHN0cm9uZyByZXF1ZXN0KQoKVGhhbmtz
Ck1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
