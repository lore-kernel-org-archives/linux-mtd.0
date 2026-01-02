Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F642FA3755
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jan 2026 22:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5h2REs6xLKwNVdiMXh7WbFuSSTTBwMqYvr2EJD/ICTw=; b=TJAXpr1MPqhuGq
	ZzDSmME8qaz4F2iQ/317JtEfIRfUf9ov2jWxxIk63JN5+QNDCGOIoxJYKkEpYRU88cot41Bu+ld6N
	GocPczU2ncFkLwMl8t5tdv1IXNPlTmcyelTIWt12IoOzag/HnonhcQFQ/pG9rg2kgYOlpY8/zmEqT
	8twCkRQ6ImrYQ/npTJJCtzFLuEzvB3U7HOAn+3RFnW66XL6CS6QofPUrkFMFrGlbp8NcNkOOtJQxe
	UVJp2GG1a6bAfoEOiGXPInqrsjQkHPAZmGkUkI2rR/9SZKJWwlGY4mLf+LgoSnS4akoLYiCDbU9EU
	f24SmbbR0ulmz5dUj8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnYM-00000008krX-3qug;
	Fri, 02 Jan 2026 22:23:26 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbnYI-00000008kqt-3Su0
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jan 2026 22:23:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1767392595;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=61H6RqsGuCa4a5uaIvZ0gNRDCPUVUQgGp5iWxLp0eXQ=;
	b=gPi+yOgIHaXxLndZNYkjdzjFO/QcOh/jMHayuu23Slzgml8v5JJMwuqOPjlcwB2noz0hn+
	ufbyGL8LfP4mlYZyYQWhThU0cBtTESAvYHK2/TUIL/P8P9tQG5fJ6/10eWfHi134RLMUPE
	TWgRuO4+cEfKFN9diizuZMUOvfPqzlg=
Message-ID: <5f4f0697622ee26db9c3e09b1a8b64157666eb0b.camel@crapouillou.net>
Subject: Re: [PATCH 3/7] mtd: rawnand: ingenic: Simplify with scoped for
 each OF child loop
From: Paul Cercueil <paul@crapouillou.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Brian Norris
	 <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list	
 <bcm-kernel-feedback-list@broadcom.com>, Miquel Raynal	
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 Manivannan Sadhasivam	 <mani@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Tudor Ambarus	 <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, Michael Walle	 <mwalle@kernel.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers	
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, 	linux-mips@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Date: Fri, 02 Jan 2026 23:22:12 +0100
In-Reply-To: <20260102124927.64703-10-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
	 <20260102124927.64703-10-krzysztof.kozlowski@oss.qualcomm.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_142323_373702_4009F413 
X-CRM114-Status: GOOD (  12.36  )
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

SGkgS3J6eXN6dG9mLAoKTGUgdmVuZHJlZGkgMDIgamFudmllciAyMDI2IMOgIDEzOjQ5ICswMTAw
LCBLcnp5c3p0b2YgS296bG93c2tpIGEKw6ljcml0wqA6Cj4gVXNlIHNjb3BlZCBmb3ItZWFjaCBs
b29wIHdoZW4gaXRlcmF0aW5nIG92ZXIgZGV2aWNlIG5vZGVzIHRvIG1ha2UKPiBjb2RlIGEKPiBi
aXQgc2ltcGxlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpCj4gPGty
enlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIENl
cmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4KCkNoZWVycywKLVBhdWwKCj4gLS0tCj4gwqBk
cml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYyB8IDQgKy0tLQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYu
Ywo+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvaW5nZW5pYy9pbmdlbmljX25hbmRfZHJ2LmMKPiBp
bmRleCA0N2RjM2VmY2VlOTIuLmYxZTJjODI5MzZiMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210
ZC9uYW5kL3Jhdy9pbmdlbmljL2luZ2VuaWNfbmFuZF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvbXRk
L25hbmQvcmF3L2luZ2VuaWMvaW5nZW5pY19uYW5kX2Rydi5jCj4gQEAgLTQzOCw3ICs0MzgsNiBA
QCBzdGF0aWMgaW50IGluZ2VuaWNfbmFuZF9pbml0X2NoaXBzKHN0cnVjdAo+IGluZ2VuaWNfbmZj
ICpuZmMsCj4gwqAJCQkJwqDCoCBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IMKgewo+
IMKgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gLQlzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wOwo+IMKgCWludCBpID0gMDsKPiDCoAlpbnQgcmV0Owo+IMKgCWludCBudW1fY2hpcHMg
PSBvZl9nZXRfY2hpbGRfY291bnQoZGV2LT5vZl9ub2RlKTsKPiBAQCAtNDQ5LDExICs0NDgsMTAg
QEAgc3RhdGljIGludCBpbmdlbmljX25hbmRfaW5pdF9jaGlwcyhzdHJ1Y3QKPiBpbmdlbmljX25m
YyAqbmZjLAo+IMKgCQlyZXR1cm4gLUVJTlZBTDsKPiDCoAl9Cj4gwqAKPiAtCWZvcl9lYWNoX2No
aWxkX29mX25vZGUoZGV2LT5vZl9ub2RlLCBucCkgewo+ICsJZm9yX2VhY2hfY2hpbGRfb2Zfbm9k
ZV9zY29wZWQoZGV2LT5vZl9ub2RlLCBucCkgewo+IMKgCQlyZXQgPSBpbmdlbmljX25hbmRfaW5p
dF9jaGlwKHBkZXYsIG5mYywgbnAsIGkpOwo+IMKgCQlpZiAocmV0KSB7Cj4gwqAJCQlpbmdlbmlj
X25hbmRfY2xlYW51cF9jaGlwcyhuZmMpOwo+IC0JCQlvZl9ub2RlX3B1dChucCk7Cj4gwqAJCQly
ZXR1cm4gcmV0Owo+IMKgCQl9Cj4gwqAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
