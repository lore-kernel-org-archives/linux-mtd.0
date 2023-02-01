Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44855C636D3
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 11:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOkfnvyoDOTXG5HJklv0A7/PfKOIIlj7n5vAGwF6gaM=; b=o7MDFfU6XSV4vh
	2Kq/qakPtG/HxXN2QJgMQxRV4YuJYBzAvee6CappUYmsONGgJBLTaiAnnWFCqdpBoufaCtPZUOWO3
	G3izP7mJ2LfQaEGQsELLVZPdaiYJFOrFdRWzolzlwdwsAzlUHmHbAhbC2j9/VGOmROknXDCVam+Fo
	0dK4lv5ehInUD8ikvrByGjcSd1/WO5cTkXiKFazsPEWFehlu/7VC5OcETjZmuert9Lax4ZuYXyjqd
	GVqk8/6WWuNCIzOJYnMPr5dvWP4fDkxe8rg6sxcGSBVGsv8kuvmjd+IOnPtSpUpd5/V1qxzsyAuyq
	teNJGzQO1dIOQdKeixZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBQs-00BVuj-PZ; Wed, 01 Feb 2023 11:37:42 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNBPR-00BVFT-0q
	for linux-mtd@lists.infradead.org; Wed, 01 Feb 2023 11:36:16 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 836A06000E;
	Wed,  1 Feb 2023 11:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675251368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYNW0ks8/FeTCuvgB8dNQc7/uPcDokWSTs5SX/JpPE0=;
	b=Z6AoHFrHXNevzhFybM1IVMENcaQoF6YGbcjvMS50TZMDqyGvZLcjCKkZSMPu1ttsbLGGya
	an88vRdRq3iH4vEUdJNpJWjfSD7oTaXhpS+VLBIQBBva+GJocMJ10gzK3D0eua8bu9eB5u
	Y7LiNWcbJ2sk0Y8g5+Uoo2o4QWUaBB4zVtcauKRWYb6gWKDAv9m1s+OMU78uadP3PhXWSy
	yRdkNQ2ASemA+oS2/m8kbqbBCcK8COEYBh79R9COIrOiwe+3aK2uSOVsPeZBypWeJ7Epkc
	3xuZ7GC5PME6Zc1H6XwHYA+okda4t1brvUxgnjCMSrQU3W2NZwnFMN5C/xAApg==
Date: Wed, 1 Feb 2023 12:36:05 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Julien Su <juliensu@mxic.com.tw>, Jaime Liao
 <jaimeliao@mxic.com.tw>, Alvin Zhou <alvinzhou@mxic.com.tw>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 4/9] mtd: spi-nor: Reorder the preparation vs locking
 steps
Message-ID: <20230201123605.23152b81@xps-13>
In-Reply-To: <b1841011-ba05-e290-d9b1-336a2346b1e3@linaro.org>
References: <20221215081241.407098-1-miquel.raynal@bootlin.com>
	<20221215081241.407098-5-miquel.raynal@bootlin.com>
	<b1841011-ba05-e290-d9b1-336a2346b1e3@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_033613_406529_E61716BB 
X-CRM114-Status: GOOD (  24.48  )
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

SGkgVHVkb3IsCgp0dWRvci5hbWJhcnVzQGxpbmFyby5vcmcgd3JvdGUgb24gVHVlLCAzMSBKYW4g
MjAyMyAwNToxMTozMyArMDAwMDoKCj4gSGksIE1pcXVlbCwKPiAKPiBPbiAxMi8xNS8yMiAwODox
MiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IFRoZSAtPnByZXBhcmUoKS8tPnVucHJlcGFyZSgp
IGhvb2tzIGFyZSBub3cgbGVnYWN5LCBhbmQgdGhlcmUgYXJlIG9ubHkKPiA+IHR3byBjb250cm9s
bGVycyBsZWZ0IHN1cHBvcnRpbmcgdGhlbS4gSW4gYm90aCBjYXNlcywgdGhlIGltcGxlbWVudGF0
aW9uICAKPiAKPiBub3cgdGhlcmUncyBvbmx5IG9uZSwgaGlzaS1zZmMuYy4KCkluZGVlZC4KCj4g
Cj4gPiBhY3F1aXJlcyBhIG11dGV4LCB3aGljaCBpcyBzb21laG93IHJlZHVuZGFudCB3aXRoIHRo
ZSBzcGktbm9yIG1haW4gbG9jayAgCj4gCj4gSSBzZWUgYSBISUZNQ19NQVhfQ0hJUF9OVU0gd2l0
aCB2YWx1ZSAyLCB0aGUgY29udHJvbGxlciBzZWVtcyB0byBiZSBhYmxlCj4gdG8gb3BlcmF0ZSAy
IGZsYXNoZXMgaW4gcGFyYWxsZWwgYW5kIHRoYXQncyB3aHkgdGhlIGludGVybmFsIG11dGV4Lgo+
IAo+ID4gdGhhdCB3ZSBhY3F1aXJlIGFzIHdlbGwgaW4gdGhlIHNwaV9ub3JfW3VuXWxvY2tfYW5k
X1t1bl1wcmVwKCkgaGVscGVycy4KPiA+IAo+ID4gV2hpbGUgdGhlIG11dGV4IHRha2VuIGluIHRo
ZSBjb3JlIGlzIG5lY2Vzc2FyeSwgdGhlIGhlbHBlciBjYW4gYmUKPiA+IHJlb3JnYW5pemVkIHRv
IGZpcnN0IGRvIHRoZSBwcmVwYXJhdGlvbiwgdGhlbiBhY3F1aXJlIHRoZSBjb3JlCj4gPiBsb2Nr
LiBUaGlzIGlzIG5lY2Vzc2FyeSBpbiBvcmRlciB0byBiZSBhYmxlIHRvIGltcHJvdmUgdGhlIGxv
Y2tpbmcKPiA+IG1lY2hhbmlzbSBpbiB0aGUgY29yZSBhbmQgc2hvdWxkIGhhdmUgbm8gc2lkZSBl
ZmZlY3QuCj4gPiAgIAo+IAo+IHRoZSBjaGFuZ2Ugc2VlbXMgZmluZSBmb3IgaGlzaSwgYW5kIHNp
bmNlIHdlJ3JlIG5vIGxvbmdlciBhZGRpbmcgZHJpdmVycwo+IHVuZGVyIHNwaS1ub3IvY29udHJv
bGxlcnMgd2Ugc2hvdWxkIGJlIGdvb2QuCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5
bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvbXRk
L3NwaS1ub3IvY29yZS5jIHwgMTUgKysrKysrLS0tLS0tLS0tCj4gPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4g
PiBpbmRleCAzOGE1N2FhYzY3NTQuLmRlNzdjYTU1Zjc0ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvbXRkL3NwaS1ub3IvY29yZS5jCj4gPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUu
Ywo+ID4gQEAgLTEwNzQsMjMgKzEwNzQsMjAgQEAgaW50IHNwaV9ub3JfbG9ja19hbmRfcHJlcChz
dHJ1Y3Qgc3BpX25vciAqbm9yKSAgCj4gCj4geW91J2xsIGhhdmUgdG8gcmVuYW1lIGl0IHRvIHNw
aV9ub3JfcHJlcF9hbmRfbG9jayB0byByZWZsZWN0IHRoZSBvcmRlcgo+IG9mIG9wcy4KClN1cmUu
Cgo+IAo+ID4gICB7Cj4gPiAgIAlpbnQgcmV0ID0gMDsgIAo+ID4gICA+IC0JbXV0ZXhfbG9jaygm
bm9yLT5sb2NrKTsgIAo+ID4gLQo+ID4gLQlpZiAobm9yLT5jb250cm9sbGVyX29wcyAmJiAgbm9y
LT5jb250cm9sbGVyX29wcy0+cHJlcGFyZSkgewo+ID4gKwlpZiAobm9yLT5jb250cm9sbGVyX29w
cyAmJiBub3ItPmNvbnRyb2xsZXJfb3BzLT5wcmVwYXJlKQo+ID4gICAJCXJldCA9IG5vci0+Y29u
dHJvbGxlcl9vcHMtPnByZXBhcmUobm9yKTsKPiA+IC0JCWlmIChyZXQpIHsKPiA+IC0JCQltdXRl
eF91bmxvY2soJm5vci0+bG9jayk7Cj4gPiAtCQkJcmV0dXJuIHJldDsKPiA+IC0JCX0KPiA+IC0J
fQo+ID4gKwo+ID4gKwltdXRleF9sb2NrKCZub3ItPmxvY2spOwo+ID4gKwo+ID4gICAJcmV0dXJu
IHJldDsKPiA+ICAgfQo+ID4gICAKPiAKPiBDaGVlcnMsCj4gdGEKCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
