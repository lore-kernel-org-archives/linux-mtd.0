Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB97C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Apr 2022 12:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2vwvn7V0brhBsUdgkGpwxBimUEGrHa1GZSh0PZSJCq8=; b=XQXofvUgBGgg96
	lHWWHdUvQN2OqUl2Dg3VA1iRa7e51EL882riDy5fZccUUFmylVJT8/OLA60KHNJviu5wqXoeNPui8
	papHM2qLVBPry/8TbD4+jm5qHOr8HmHOjhUyXYEpyQgNAy5GCWd/WXmEv925knLK7hv9Az5CaEeF5
	T6GqKglFqKRiV2/lREGQOgiU6sBb2ZYlOY8AGd7ngtMRLUK8NvBmpg/GLmzTB4fo7HA75k167V0X7
	QBdnDVz8UgzA0++BvwBgU7dzrLA366P9lZ4NYkAYhCAKuWNRtBj0Y/p2KClw9FKEgtLV9aiCO719P
	1RMhQHrIJHAksjUtSWGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1necaL-0017Ke-Ql; Wed, 13 Apr 2022 12:59:01 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1necaD-0017Gl-Sg
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2022 12:58:56 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 79759200012;
 Wed, 13 Apr 2022 12:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649854726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/lt5mlGJZcuBVHxRss/04dHWoVmPgHYi8/JWSHvb6Dk=;
 b=Px+SIUNwXGbqpReLs2RRDVD+hDL8TDHEUwFW5MVebHhxM4E5YWiVny3r5i81UC3drFpHmX
 E07RVeqIKlSfYAABvYULm/UftBS1eaVN6Slwg8G8HDnarnpiBp2y8f3I8yJM1ByfVo2Dw5
 eo4HIQB1iIeH7Qds3q0jVTCPjXy9TPoxOHxf5y5dd4MMvtDIjZ/FrTal95izOwP4lnMJ2u
 jXPBv0yDW+KReaDFOSUlFmoRnnJOSsW92/WxheuyGc8nFDRJwPZqTjDtFmCIlDNnzYBjro
 Df10JWWGIWKqLNhUFdVS9U0oaRWZAhBBB8bReMNjZLUSF/XuNsG4Nt2VM1vH8A==
Date: Wed, 13 Apr 2022 14:58:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, Daniel
 Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2] mtd: spinand: add support for ESMT F50x1G41LB
Message-ID: <20220413145843.46a3d9b5@xps13>
In-Reply-To: <20220413083824.247136-1-gch981213@gmail.com>
References: <20220413083824.247136-1-gch981213@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_055854_231749_DED34F34 
X-CRM114-Status: GOOD (  21.94  )
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

SGksCgpnY2g5ODEyMTNAZ21haWwuY29tIHdyb3RlIG9uIFdlZCwgMTMgQXByIDIwMjIgMTY6Mzg6
MTkgKzA4MDA6Cgo+IFRoaXMgcGF0Y2ggYWRkcyBzdXBwb3J0IGZvciBFU01UIEY1MEwxRzQxTEIg
YW5kIEY1MEQxRzQxTEIuCj4gSXQgc2VlbXMgdGhhdCBFU01UIGxpa2VzIHRvIHVzZSByYW5kb20g
SkVERUMgSUQgZnJvbSBvdGhlciB2ZW5kb3JzLgo+IFRoZWlyIDFHIGNoaXBzIHVzZXMgMHhjOCBm
cm9tIEdpZ2FEZXZpY2UgYW5kIDJHLzRHIGNoaXBzIHVzZXMgMHgyYyBmcm9tCj4gTWljcm9uLiBG
b3IgdGhpcyByZWFzb24sIHRoZSBFU01UIGVudHJ5IGlzIG5hbWVkIGVzbXRfYzggd2l0aCBleHBs
aWNpdAo+IEpFREVDIElEIGluIHZhcmlhYmxlIG5hbWUuCj4gCj4gRGF0YXNoZWV0czoKPiBodHRw
czovL3d3dy5lc210LmNvbS50dy91cGxvYWQvcGRmL0VTTVQvZGF0YXNoZWV0cy9GNTBMMUc0MUxC
KDJNKS5wZGYKPiBodHRwczovL3d3dy5lc210LmNvbS50dy91cGxvYWQvcGRmL0VTTVQvZGF0YXNo
ZWV0cy9GNTBEMUc0MUxCKDJNKS5wZGYKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHVhbmhvbmcgR3Vv
IDxnY2g5ODEyMTNAZ21haWwuY29tPgo+IC0tLQo+IFRoaXMgcGF0Y2ggaXMgbWFkZSBwdXJlbHkg
YmFzZWQgb24gZGF0YXNoZWV0IGluZm8gd2l0aG91dCB0ZXN0aW5nCj4gb24gYW55IGFjdHVhbCBj
aGlwcy4KCkRvIHlvdSBwbGFuIHRvIGdldCBvbmUgb2YgdGhlc2UgYW55IHRpbWUgc29vbj8KCkkg
YW0gbm90IHJlYWxseSBjb25maWRlbnQgbWVyZ2luZyBhIDEwMCUgbm9uLXRlc3RlZCBkcml2ZXIg
OikKCj4gQ2hhbmdlIHNpbmNlIHYxOiBkcm9wIDB4N2YgcGFkZGluZyBmcm9tIFNQSU5BTkRfSUQu
Cj4gCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxlIHwgIDIgKy0KPiAgZHJpdmVycy9t
dGQvbmFuZC9zcGkvY29yZS5jICAgfCAgMSArCj4gIGRyaXZlcnMvbXRkL25hbmQvc3BpL2VzbXQu
YyAgIHwgOTQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgaW5jbHVkZS9s
aW51eC9tdGQvc3BpbmFuZC5oICAgfCAgMSArCj4gIDQgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tdGQv
bmFuZC9zcGkvZXNtdC5jCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvc3BpL01h
a2VmaWxlIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvTWFrZWZpbGUKPiBpbmRleCA5NjYyYjljMWQ1
YTkuLjdlM2FiOGE5YWVjNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3NwaS9NYWtl
ZmlsZQo+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL01ha2VmaWxlCj4gQEAgLTEsMyArMSwz
IEBACj4gICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiAtc3BpbmFuZC1vYmpz
IDo9IGNvcmUubyBnaWdhZGV2aWNlLm8gbWFjcm9uaXgubyBtaWNyb24ubyBwYXJhZ29uLm8gdG9z
aGliYS5vIHdpbmJvbmQubwo+ICtzcGluYW5kLW9ianMgOj0gY29yZS5vIGVzbXQubyBnaWdhZGV2
aWNlLm8gbWFjcm9uaXgubyBtaWNyb24ubyBwYXJhZ29uLm8gdG9zaGliYS5vIHdpbmJvbmQubwo+
ICBvYmotJChDT05GSUdfTVREX1NQSV9OQU5EKSArPSBzcGluYW5kLm8KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
Cj4gaW5kZXggZmY4MzM2ODcwYmMwLi42YzVkNzllYzM1MDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9zcGkvY29yZS5jCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5j
Cj4gQEAgLTkyNyw2ICs5MjcsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG5hbmRfb3BzIHNwaW5h
bmRfb3BzID0gewo+ICB9Owo+ICAKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBzcGluYW5kX21hbnVm
YWN0dXJlciAqc3BpbmFuZF9tYW51ZmFjdHVyZXJzW10gPSB7Cj4gKwkmZXNtdF9jOF9zcGluYW5k
X21hbnVmYWN0dXJlciwKPiAgCSZnaWdhZGV2aWNlX3NwaW5hbmRfbWFudWZhY3R1cmVyLAo+ICAJ
Jm1hY3Jvbml4X3NwaW5hbmRfbWFudWZhY3R1cmVyLAo+ICAJJm1pY3Jvbl9zcGluYW5kX21hbnVm
YWN0dXJlciwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9zcGkvZXNtdC5jIGIvZHJp
dmVycy9tdGQvbmFuZC9zcGkvZXNtdC5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwMDAuLmY4NjcxNjMzMjg5Mwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9kcml2ZXJz
L210ZC9uYW5kL3NwaS9lc210LmMKPiBAQCAtMCwwICsxLDk0IEBACj4gKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIEF1dGhvcjoKPiArICoJQ2h1YW5ob25n
IEd1byA8Z2NoOTgxMjEzQGdtYWlsLmNvbT4KPiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgv
ZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L210ZC9zcGluYW5kLmg+Cj4gKwo+ICsvKiBFU01UIHVzZXMgR2lnYURldmljZSAweGM4IEpFQ0RF
QyBJRCBvbiBzb21lIFNQSSBOQU5EcyAqLwo+ICsjZGVmaW5lIFNQSU5BTkRfTUZSX0VTTVRfQzgJ
CQkweGM4CgpXaGF0IGhhcHBlbnMgaWYgdGhlIGdpZ2FkZXZpY2UgZHJpdmVyIHByb2JlcyBmaXJz
dD8KCj4gKwo+ICsjZGVmaW5lIEY1MEwyRzQxWEFfRUNDX1NUQVRVU19NQVNLCQlHRU5NQVNLKDYs
IDQpCj4gKyNkZWZpbmUgRjUwTDJHNDFYQV9TVEFUVVNfRUNDXzFfM19CSVRGTElQUwkoMSA8PCA0
KQo+ICsjZGVmaW5lIEY1MEwyRzQxWEFfU1RBVFVTX0VDQ180XzZfQklURkxJUFMJKDMgPDwgNCkK
PiArI2RlZmluZSBGNTBMMkc0MVhBX1NUQVRVU19FQ0NfN184X0JJVEZMSVBTCSg1IDw8IDQpCj4g
KwoKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
