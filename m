Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98871C433FE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Oct 2022 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=epy6ydSGnRE2P+9uMz/a3kQ5zj0/I0NfoRSqVH/+udE=; b=rVPSx0gD1gxdGE
	KTAC0DftLMTlGLuGRn3qrS+I85uhrMs092Bnqb3vYQuHb0DgiJxLs3tHlXrHnE4HO1ApvFoqMSY2b
	Opujd9vd6XE/PVs4pEOcj8QtuqHzsm+qxCL8jWcqTszjlpEhpek5iy6cCYAlPHjzCXUXSTmioV9h/
	AXmC7FxHP1DBUlWP5niVzc5UcadCjqIV1M4UjUbP5qgZJ5MG5Wj/BDaouk7hZQcVuoPEQq8Hcg+wv
	im2QPR87+WqbOC90bHIzbpOJ8ISTLlX478SWd0HQ1GL6YMnuRoI/vTSq7MmQNLmFLiDsezt3nHKAG
	mRpGHCru5munTURAuE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofeje-009Fzn-PG; Tue, 04 Oct 2022 10:01:10 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofejb-009FyS-Jr
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2022 10:01:09 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E476CC001A;
	Tue,  4 Oct 2022 10:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664877662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WiWAu1BS1430Fu+5esZ1phhP6sKKWe2L+ad7HMfvpk4=;
	b=j5p/5rhwGwMoQSmr2Yhyk814sHn81cwgnnHZ+i7RrfutZU2Kwje6OUKfUXx/V77NwYMBmh
	LVq8CIB9PJeZV5dL8uuO5ugwrYFpZWiotwWvrbGgovMVxLj3JA3aQ4olIldk+GywTF1Q18
	0tJYJRHwm807E4QvtBCXGUNM/U5ubyY60dqX9NkNpSlCarqzi9CgccMH0AV275zlVThOh5
	bRyJ1XJmMXP9BoOindgC+YWJKIW/TFlS56CRWtJQVzaOpS1zqOWSJ3hU+uyfTcHrSNRaSE
	RUjcAcZQjzze5U9UP5JJHus7f5R8MeMZA0Jg5rTDJLY9H6suTHfitS4CQYJayQ==
Date: Tue, 4 Oct 2022 12:00:58 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Tony O'Brien
 <Tony.OBrien@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: Use correct logic for
 nand-keep-config
Message-ID: <20221004120058.409a9552@xps-13>
In-Reply-To: <482a4114-eeb1-2303-2896-8e480abda876@alliedtelesis.co.nz>
References: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
	<482a4114-eeb1-2303-2896-8e480abda876@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_030107_929701_BE23E40F 
X-CRM114-Status: GOOD (  27.56  )
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

SGkgQ2hyaXMsCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gTW9u
LCAzIE9jdCAyMDIyIDIxOjQ2OjMxCiswMDAwOgoKPiBIaSBBbGwsCj4gCj4gT24gMjcvMDkvMjIg
MTU6NDcsIENocmlzIFBhY2toYW0gd3JvdGU6Cj4gPiBGcm9tOiBUb255IE8nQnJpZW4gPHRvbnku
b2JyaWVuQGFsbGllZHRlbGVzaXMuY28ubno+Cj4gPgo+ID4gT3JpZ2luYWxseSB0aGUgYWJzZW5j
ZSBvZiB0aGUgbWFydmVsbCxuYW5kLWtlZXAtY29uZmlnIHByb3BlcnR5IGNhdXNlZAo+ID4gdGhl
IHNldHVwX2RhdGFfaW50ZXJmYWNlIGZ1bmN0aW9uIHRvIGJlIHByb3ZpZGVkLiBIb3dldmVyIHdo
ZW4KPiA+IHNldHVwX2RhdGFfaW50ZXJmYWNlIHdhcyBtb3ZlZCBpbnRvIG5hbmRfY29udHJvbGxl
cl9vcHMgdGhlIGxvZ2ljIHdhcwo+ID4gdW5pbnRlbnRpb25hbGx5IGludmVydGVkLiBVcGRhdGUg
dGhlIGxvZ2ljIHNvIHRoYXQgb25seSBpZiB0aGUKPiA+IG1hcnZlbGwsbmFuZC1rZWVwLWNvbmZp
ZyBwcm9wZXJ0eSBpcyBwcmVzZW50IHRoZSBib290bG9hZGVyIE5BTkQgY29uZmlnCj4gPiBrZXB0
Lgo+ID4KPiA+IEZpeGVzOiA3YTA4ZGJhZWRkMzYgKCJtdGQ6IHJhd25hbmQ6IE1vdmUgLT5zZXR1
cF9kYXRhX2ludGVyZmFjZSgpIHRvIG5hbmRfY29udHJvbGxlcl9vcHMiKQo+ID4gU2lnbmVkLW9m
Zi1ieTogVG9ueSBPJ0JyaWVuIDx0b255Lm9icmllbkBhbGxpZWR0ZWxlc2lzLmNvLm56Pgo+ID4g
U2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lz
LmNvLm56PiAgCj4gCj4gSnVzdCBmb2xsb3dpbmcgdXAgb24gdGhpcy4gSSBrbm93IHRoaW5ncyBo
YXZlIHByb2JhYmx5IGJlZW4gYnVzeSB3aXRoIAo+IHRoZSA2LjAgcmVsZWFzZSBidXQgaXQncyBi
ZWVuIGEgd2VlayBzbyBJIGZpZ3VyZWQgSSdkIGdpdmUgdGhpcyBhIGJ1bXAuCgpJIHdhcyBqdXN0
IG9mZiB0aGUgcGFzdCB3ZWVrIDopCgpJIHdpbGwgcXVldWUgaXQgc29vbi4KCj4gCj4gPiAtLS0K
PiA+Cj4gPiBOb3RlczoKPiA+ICAgICAgSSB0aGluayB0aGlzIGlzIGEgYnVnIHRoYXQncyBiZWVu
IGx1cmtpbmcgZm9yIDQgeWVhcnMgb3Igc28uIEknbSBub3QKPiA+ICAgICAgc3VyZSB0aGF0J3Mg
cGFydGljdWxhcmx5IGxvbmcgaW4gdGhlIGxpZmUgb2YgYW4gZW1iZWRkZWQgZGV2aWNlIGJ1dCBp
dAo+ID4gICAgICBkb2VzIG1ha2UgbWUgd29uZGVyIGlmIHRoZXJlIGhhdmUgYmVlbiBvdGhlciBi
dWcgcmVwb3J0cyBhYm91dCBpdC4KCkkgZG9uJ3QgcmVtZW1iZXIgYW55Li4uIEluZGVlZCB0aGlz
IG11c3QgYmUgZml4ZWQuCgo+ID4gICAgICBXZSBub3RpY2VkIHRoaXMgYmVjYXVzZSB3ZSBoYWQg
YSBib290bG9hZGVyIHRoYXQgdXNlZCBtYXhlZCBvdXQgTkFORAo+ID4gICAgICB0aW1pbmdzIHdo
aWNoIG1hZGUgdGhlIHRpbWUgaXQgdG9vayB0aGUga2VybmVsIHRvIGRvIGFueXRoaW5nIG9uIHRo
ZQo+ID4gICAgICBmaWxlIHN5c3RlbSBsb25nZXIgdGhhbiB3ZSBleHBlY3RlZC4KPiA+Cj4gPiAg
IGRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIHwgMiArLQo+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMgYi9kcml2ZXJzL210ZC9uYW5k
L3Jhdy9tYXJ2ZWxsX25hbmQuYwo+ID4gaW5kZXggMjQ1NWE1ODFmZDcwLi5iMjQ4YzVmNjU3ZDUg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+ID4g
KysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMKPiA+IEBAIC0yNjcyLDcg
KzI2NzIsNyBAQCBzdGF0aWMgaW50IG1hcnZlbGxfbmFuZF9jaGlwX2luaXQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgbWFydmVsbF9uZmMgKm5mYywKPiA+ICAgCWNoaXAtPmNvbnRyb2xsZXIg
PSAmbmZjLT5jb250cm9sbGVyOwo+ID4gICAJbmFuZF9zZXRfZmxhc2hfbm9kZShjaGlwLCBucCk7
Cj4gPiAgIAo+ID4gLQlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgIm1hcnZlbGwsbmFu
ZC1rZWVwLWNvbmZpZyIpKQo+ID4gKwlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAibWFy
dmVsbCxuYW5kLWtlZXAtY29uZmlnIikpCj4gPiAgIAkJY2hpcC0+b3B0aW9ucyB8PSBOQU5EX0tF
RVBfVElNSU5HUzsKPiA+ICAgCj4gPiAgIAltdGQgPSBuYW5kX3RvX210ZChjaGlwKSAgCgoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
