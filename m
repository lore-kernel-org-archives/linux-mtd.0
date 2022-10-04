Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA64C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Oct 2022 10:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbR8MFSwM0u1kg6YP8NqMm80hfTJO/uq2vHQ+JejtrY=; b=nKgTSGP7Lkfum7
	o0Bl5IzyH8Gvr2kKUXb9aLGpwTBigNV5rGP9rL4/kw/dtAQWIaI+EzvpbK1ptrgKYy54rLH5T+yIy
	FUHYxURhlnlxmf1eY4TJlpykOipdBaJlZRqpdNB78J23/wDV/KFp8DDSI1dFA/b5t1f0EKeVS+qIr
	A6YMLNDpC5FK/wx0h0luwqXIhtVPjZQ6Vq7BSonsEHhn+KwZBg5SiZlivNua4R2dYK/oaYERO2/Q4
	XlsBmTN3o3/N3UxpCNCK2AfHuNVIQcPHWGNeEq1MhiVXA887xPTuNgZaV4Kl4P+nwxs/jXkbAKNpe
	8jD+dMri63HIMKt9lKiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofelW-009GoU-Vf; Tue, 04 Oct 2022 10:03:07 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofekk-009GLF-AC
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2022 10:02:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 4A57FFF803;
	Tue,  4 Oct 2022 10:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664877734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJNufpo5Aw2kWb7Q25v6A6DJV5qMXWZuPy0UHJWv6jw=;
	b=LTTypnWeYNiIp9gESF41TtCZdoFBxhpcREQdPnrPOcWYupwP3QgWi8s+ip94BDGmktFY6f
	VpZId9aCJwheyL3FNj3UHZO/nueNe/hMvgnu+9+1SLbdOQ1W4HNAYHOmhVEIcN3mPgEuEo
	J+d2IN1CyLFH46ACAPHAzaHbilC57SjbTMRRL2CXqx9IsC/2eZN4Hj6Yj19GGKT9s8qzrX
	+tCHi3KOPyABQAYf3OeU49XLpiR80u7CBWNo2gk8E3rnHRJvTnRdvsjwTX+WDmgsz1PN74
	76Zmc+TSOoRymoJ+jNcSn9cjIIXgZUHeYpc4JJrF/SX0B9n2Oxj5jzW5W/2YuQ==
Date: Tue, 4 Oct 2022 12:02:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "richard@nod.at" <richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>, Tony O'Brien
 <Tony.OBrien@alliedtelesis.co.nz>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: Use correct logic for
 nand-keep-config
Message-ID: <20221004120212.6389b96a@xps-13>
In-Reply-To: <e234270c-4169-bddb-5c2d-9c6ac48467b6@alliedtelesis.co.nz>
References: <20220927024728.28447-1-chris.packham@alliedtelesis.co.nz>
	<e234270c-4169-bddb-5c2d-9c6ac48467b6@alliedtelesis.co.nz>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_030218_688082_61AF657F 
X-CRM114-Status: GOOD (  25.87  )
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

SGkgQ2hyaXMsCgpDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubnogd3JvdGUgb24gVHVl
LCAyNyBTZXAgMjAyMiAwMjo1NDo0MAorMDAwMDoKCj4gT24gMjcvMDkvMjIgMTU6NDcsIENocmlz
IFBhY2toYW0gd3JvdGU6Cj4gPiBGcm9tOiBUb255IE8nQnJpZW4gPHRvbnkub2JyaWVuQGFsbGll
ZHRlbGVzaXMuY28ubno+Cj4gPgo+ID4gT3JpZ2luYWxseSB0aGUgYWJzZW5jZSBvZiB0aGUgbWFy
dmVsbCxuYW5kLWtlZXAtY29uZmlnIHByb3BlcnR5IGNhdXNlZAo+ID4gdGhlIHNldHVwX2RhdGFf
aW50ZXJmYWNlIGZ1bmN0aW9uIHRvIGJlIHByb3ZpZGVkLiBIb3dldmVyIHdoZW4KPiA+IHNldHVw
X2RhdGFfaW50ZXJmYWNlIHdhcyBtb3ZlZCBpbnRvIG5hbmRfY29udHJvbGxlcl9vcHMgdGhlIGxv
Z2ljIHdhcwo+ID4gdW5pbnRlbnRpb25hbGx5IGludmVydGVkLiBVcGRhdGUgdGhlIGxvZ2ljIHNv
IHRoYXQgb25seSBpZiB0aGUKPiA+IG1hcnZlbGwsbmFuZC1rZWVwLWNvbmZpZyBwcm9wZXJ0eSBp
cyBwcmVzZW50IHRoZSBib290bG9hZGVyIE5BTkQgY29uZmlnCj4gPiBrZXB0Lgo+ID4KPiA+IEZp
eGVzOiA3YTA4ZGJhZWRkMzYgKCJtdGQ6IHJhd25hbmQ6IE1vdmUgLT5zZXR1cF9kYXRhX2ludGVy
ZmFjZSgpIHRvIG5hbmRfY29udHJvbGxlcl9vcHMiKQo+ID4gU2lnbmVkLW9mZi1ieTogVG9ueSBP
J0JyaWVuIDx0b255Lm9icmllbkBhbGxpZWR0ZWxlc2lzLmNvLm56Pgo+ID4gU2lnbmVkLW9mZi1i
eTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pgo+ID4g
LS0tCj4gPgo+ID4gTm90ZXM6Cj4gPiAgICAgIEkgdGhpbmsgdGhpcyBpcyBhIGJ1ZyB0aGF0J3Mg
YmVlbiBsdXJraW5nIGZvciA0IHllYXJzIG9yIHNvLiBJJ20gbm90Cj4gPiAgICAgIHN1cmUgdGhh
dCdzIHBhcnRpY3VsYXJseSBsb25nIGluIHRoZSBsaWZlIG9mIGFuIGVtYmVkZGVkIGRldmljZSBi
dXQgaXQKPiA+ICAgICAgZG9lcyBtYWtlIG1lIHdvbmRlciBpZiB0aGVyZSBoYXZlIGJlZW4gb3Ro
ZXIgYnVnIHJlcG9ydHMgYWJvdXQgaXQuCj4gPiAgICAgIAo+ID4gICAgICBXZSBub3RpY2VkIHRo
aXMgYmVjYXVzZSB3ZSBoYWQgYSBib290bG9hZGVyIHRoYXQgdXNlZCBtYXhlZCBvdXQgTkFORAo+
ID4gICAgICB0aW1pbmdzIHdoaWNoIG1hZGUgdGhlIHRpbWUgaXQgdG9vayB0aGUga2VybmVsIHRv
IGRvIGFueXRoaW5nIG9uIHRoZQo+ID4gICAgICBmaWxlIHN5c3RlbSBsb25nZXIgdGhhbiB3ZSBl
eHBlY3RlZC4gIAo+IAo+IEkgdGhpbmsgdGhlcmUgbWlnaHQgYmUgYSBzaW1pbGFyIGxvZ2ljIGlu
dmVyc2lvbiBidWcgaW4gCj4gZHJpdmVycy9tdGQvbmFuZC9yYXcvZGVuYWxpLmMgYnV0IEkgbGFj
ayB0aGUgYWJpbGl0eSB0byB0ZXN0IGZvciB0aGF0IAo+IHBsYXRmb3JtLgoKQWdyZWVkLCB0aGUg
ZGVuYWxpIGRyaXZlciBoYXMgdGhlIHNhbWUgaXNzdWUuIENvdWxkIHlvdSBwbGVhc2Ugc2VuZCBh
CnBhdGNoPwogCj4gCj4gPiAgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21hcnZlbGxfbmFuZC5jIHwg
MiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5kLmMg
Yi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tYXJ2ZWxsX25hbmQuYwo+ID4gaW5kZXggMjQ1NWE1ODFm
ZDcwLi5iMjQ4YzVmNjU3ZDUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9t
YXJ2ZWxsX25hbmQuYwo+ID4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWFydmVsbF9uYW5k
LmMKPiA+IEBAIC0yNjcyLDcgKzI2NzIsNyBAQCBzdGF0aWMgaW50IG1hcnZlbGxfbmFuZF9jaGlw
X2luaXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgbWFydmVsbF9uZmMgKm5mYywKPiA+ICAg
CWNoaXAtPmNvbnRyb2xsZXIgPSAmbmZjLT5jb250cm9sbGVyOwo+ID4gICAJbmFuZF9zZXRfZmxh
c2hfbm9kZShjaGlwLCBucCk7Cj4gPiAgIAo+ID4gLQlpZiAoIW9mX3Byb3BlcnR5X3JlYWRfYm9v
bChucCwgIm1hcnZlbGwsbmFuZC1rZWVwLWNvbmZpZyIpKQo+ID4gKwlpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG5wLCAibWFydmVsbCxuYW5kLWtlZXAtY29uZmlnIikpCj4gPiAgIAkJY2hpcC0+
b3B0aW9ucyB8PSBOQU5EX0tFRVBfVElNSU5HUzsKPiA+ICAgCj4gPiAgIAltdGQgPSBuYW5kX3Rv
X210ZChjaGlwKSAgCgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
