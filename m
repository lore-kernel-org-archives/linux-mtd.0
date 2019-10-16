Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A946FC4360C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 08:53:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA1620872
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 08:53:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MiuaIW+E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA1620872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3LON8TpA3Rt+y+CooFZHQkW121ln75MdEAanxtm0s2g=; b=MiuaIW+E8ovKNC73mTR5ktdJI
	0Hgxlbwdtk2zcWFHxEX5RSxCgvpMiFPb/fTVV9bBzbs6jA8GpUewgXAL3mY8nN6ibhogq3y1nh1Wd
	Qt/Gw+UoY4RAohf72L8yJ+z12oc7ZZHvGNe+cCLnmF3RglfZQ8wDrBcz4/FojQq0+1gXy6RunBrZj
	VSbql06nBF1jrxtiBRavkUmQeV/Bj6cj41VO952vgz14x/FtQzrskKyvMd8yG8cQ4YsJpOz3BQVIm
	pVlrm9kvxcfM2w2U4L4ZQDXL3nOc2AnIMymwW3RVDDfrpMcxE/ynsXsdhgrMjQAXNyXTfOcsUhZ7D
	fRwlBd3bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKf3f-0004r2-N0; Wed, 16 Oct 2019 08:53:27 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKf3c-0004q1-Lk
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 08:53:26 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 01:53:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; d="scan'208";a="202015647"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Oct 2019 01:53:22 -0700
Received: from [10.226.38.27] (unknown [10.226.38.27])
 by linux.intel.com (Postfix) with ESMTP id 8C3135803C5;
 Wed, 16 Oct 2019 01:53:18 -0700 (PDT)
Subject: Re: [PATCH v3 3/3] mtd: spi-nor: cadence-quadspi: disable the
 auto-poll for Intel LGM
To: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
References: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190909104733.14273-4-vadivel.muruganx.ramuthevar@linux.intel.com>
 <a4d45efe-907f-6c87-c650-5ad19942f0e4@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <888a5cfa-7ded-938a-cdd6-cc11068117e4@linux.intel.com>
Date: Wed, 16 Oct 2019 16:53:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a4d45efe-907f-6c87-c650-5ad19942f0e4@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_015324_750081_C3AD2046 
X-CRM114-Status: GOOD (  18.20  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 tudor.ambarus@gmail.com, andriy.shevchenko@intel.com,
 boris.brezillon@free-electrons.com, richard@nod.at, qi-ming.wu@intel.com,
 linux-kernel@vger.kernel.org, david.oberhollenzer@sigma-star.at,
 miquel.raynal@bootlin.com, jwboyer@gmail.com, computersforpeace@gmail.com,
 dwmw2@infradead.org, cyrille.pitchen@atmel.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmlnbmVzaCwKCiDCoMKgwqDCoCBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcgY29tbWVudHMu
CgpPbiAxNi8xMC8yMDE5IDQ6NDAgUE0sIFZpZ25lc2ggUmFnaGF2ZW5kcmEgd3JvdGU6Cj4KPiBP
biAwOS8wOS8xOSA0OjE3IFBNLCBSYW11dGhldmFyLFZhZGl2ZWwgTXVydWdhblggd3JvdGU6Cj4+
IEZyb206IFJhbXV0aGV2YXIgVmFkaXZlbCBNdXJ1Z2FuIDx2YWRpdmVsLm11cnVnYW54LnJhbXV0
aGV2YXJAbGludXguaW50ZWwuY29tPgo+Pgo+PiBPbiBJbnRlbCdzIExpZ2h0bmluZyBNb3VudGFp
bihMR00pIFNvQyBRU1BJIGNvbnRyb2xsZXIgZG8gbm90IGF1dG8tcG9sbC4KPj4gVGhpcyBwYXRj
aCBpbnRyb2R1Y2VzIHRvIHByb3Blcmx5IGRpc2FibGUgdGhlIGF1dG8tcG9sbGluZyBmZWF0dXJl
IHRvCj4gVGhpcyBwYXRjaCBkaXNhYmxlcyBhdXRvIHBvbGxpbmcgd2hlbiBkaXJlY3QgYWNjZXNz
IG1vZGUgaXMgZGlzYWJsZWQKPiB3aGljaCBzaG91bGQgYmUgbm90ZWQgaW4gdGhlIGNvbW1pdCBt
ZXNzYWdlLgp3aWxsIGFkZCBpdC4KPj4gaW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgY2FkZW5j
ZS1xdWFkc3BpLgo+IEhvdyBkb2VzIHRoaXMgaW1wcm92ZSBwZXJmb3JtYW5jZSBvZiBjYWRlbmNl
LXF1YWRzcGk/IEkgd291bGQgZXhwZWN0IEhXCj4gYXV0by1wb2xsaW5nIHRvIGJlIGZhc3RlciB0
aGFuIFNXIHBvbGxpbmcuCkR1cmluZyB0aGUgYnJpbmctdXAgdGltZSBvYnNlcnZlZCB0aGlzLCBv
bmNlIGFnYWluIHZlcmlmeSBpdCBvbiBteSBzZXR1cC4KQWdyZWVkLCB5b3UgYXJlIGNvcnJlY3Qg
SFcgYXV0by1wb2xsaW5nIGlzIGZhc3RlciB0aGFuIFNXIHBvbGxpbmcuCj4+IFNpZ25lZC1vZmYt
Ynk6IFJhbXV0aGV2YXIgVmFkaXZlbCBNdXJ1Z2FuIDx2YWRpdmVsLm11cnVnYW54LnJhbXV0aGV2
YXJAbGludXguaW50ZWwuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL210ZC9zcGktbm9yL2NhZGVu
Y2UtcXVhZHNwaS5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3Nw
aS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2UtcXVh
ZHNwaS5jCj4+IGluZGV4IDczYjlmYmQxNTA4YS4uNjA5OThlYWFkMWNjIDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2UtcXVhZHNwaS5jCj4+ICsrKyBiL2RyaXZlcnMv
bXRkL3NwaS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMKPj4gQEAgLTEzNSw2ICsxMzUsOCBAQCBzdHJ1
Y3QgY3FzcGlfZHJpdmVyX3BsYXRkYXRhIHsKPj4gICAjZGVmaW5lIENRU1BJX1JFR19SRF9JTlNU
Ul9UWVBFX0RBVEFfTUFTSwkweDMKPj4gICAjZGVmaW5lIENRU1BJX1JFR19SRF9JTlNUUl9EVU1N
WV9NQVNLCQkweDFGCj4+ICAgCj4+ICsjZGVmaW5lIENRU1BJX1JFR19XUl9DT01QTEVUSU9OX0NU
UkwJCTB4MzgKPj4gKyNkZWZpbmUgQ1FTUElfUkVHX1dSX0NPTVBMRVRJT05fRElTQUJMRV9BVVRP
X1BPTEwJQklUKDE0KQo+PiAgICNkZWZpbmUgQ1FTUElfUkVHX1dSX0lOU1RSCQkJMHgwOAo+PiAg
ICNkZWZpbmUgQ1FTUElfUkVHX1dSX0lOU1RSX09QQ09ERV9MU0IJCTAKPj4gICAjZGVmaW5lIENR
U1BJX1JFR19XUl9JTlNUUl9UWVBFX0FERFJfTFNCCTEyCj4+IEBAIC00NzEsNiArNDczLDE4IEBA
IHN0YXRpYyBpbnQgY3FzcGlfY29tbWFuZF93cml0ZV9hZGRyKHN0cnVjdCBzcGlfbm9yICpub3Is
Cj4+ICAgCXJldHVybiBjcXNwaV9leGVjX2ZsYXNoX2NtZChjcXNwaSwgcmVnKTsKPj4gICB9Cj4+
ICAgCj4+ICtzdGF0aWMgaW50IGNxc3BpX2Rpc2FibGVfYXV0b19wb2xsKHN0cnVjdCBjcXNwaV9z
dCAqY3FzcGkpCj4+ICt7Cj4+ICsJdm9pZCBfX2lvbWVtICpyZWdfYmFzZSA9IGNxc3BpLT5pb2Jh
c2U7Cj4+ICsJdW5zaWduZWQgaW50IHJlZzsKPj4gKwo+PiArCXJlZyA9IHJlYWRsKHJlZ19iYXNl
ICsgQ1FTUElfUkVHX1dSX0NPTVBMRVRJT05fQ1RSTCk7Cj4+ICsJcmVnIHw9IENRU1BJX1JFR19X
Ul9DT01QTEVUSU9OX0RJU0FCTEVfQVVUT19QT0xMOwo+PiArCXdyaXRlbChyZWcsIHJlZ19iYXNl
ICsgQ1FTUElfUkVHX1dSX0NPTVBMRVRJT05fQ1RSTCk7Cj4+ICsKPj4gKwlyZXR1cm4gMDsKPj4g
K30KPj4gKwo+PiAgIHN0YXRpYyBpbnQgY3FzcGlfcmVhZF9zZXR1cChzdHJ1Y3Qgc3BpX25vciAq
bm9yKQo+PiAgIHsKPj4gICAJc3RydWN0IGNxc3BpX2ZsYXNoX3BkYXRhICpmX3BkYXRhID0gbm9y
LT5wcml2Owo+PiBAQCAtNTA4LDYgKzUyMiwxMSBAQCBzdGF0aWMgaW50IGNxc3BpX3JlYWRfc2V0
dXAoc3RydWN0IHNwaV9ub3IgKm5vcikKPj4gICAJcmVnICY9IH5DUVNQSV9SRUdfU0laRV9BRERS
RVNTX01BU0s7Cj4+ICAgCXJlZyB8PSAobm9yLT5hZGRyX3dpZHRoIC0gMSk7Cj4+ICAgCXdyaXRl
bChyZWcsIHJlZ19iYXNlICsgQ1FTUElfUkVHX1NJWkUpOwo+PiArCj4+ICsJLyogRGlzYWJsZSBh
dXRvLXBvbGxpbmcgKi8KPj4gKwlpZiAoIWZfcGRhdGEtPnVzZV9kaXJlY3RfbW9kZSkKPj4gKwkJ
Y3FzcGlfZGlzYWJsZV9hdXRvX3BvbGwoY3FzcGkpOwo+PiArCj4+ICAgCXJldHVybiAwOwo+PiAg
IH0KPj4gICAKPiBIbW1tLi4gVGhlcmUgaXMgbm8gbmVlZCB0byBkaXNhYmxlIHBvbGxpbmcgZm9y
IGV2ZXJ5IHJlYWQvd3JpdGUKPiBvcGVyYXRpb24uIEl0IHNob3VsZCBiZSBlbm91Z2ggdG8gZG8g
aXQgb25jZSBpbiBjcXNwaV9jb250cm9sbGVyX2luaXQoKQpzdXJlLCBtb3ZlIHRvIGNxc3BpX2Nv
bnRyb2xsZXJfaW5pdCgpIC4KLS0tClJlZ2FyZHMKVmFkaXZlbAo+Cj4KPj4gQEAgLTYyNyw2ICs2
NDYsMTEgQEAgc3RhdGljIGludCBjcXNwaV93cml0ZV9zZXR1cChzdHJ1Y3Qgc3BpX25vciAqbm9y
KQo+PiAgIAlyZWcgJj0gfkNRU1BJX1JFR19TSVpFX0FERFJFU1NfTUFTSzsKPj4gICAJcmVnIHw9
IChub3ItPmFkZHJfd2lkdGggLSAxKTsKPj4gICAJd3JpdGVsKHJlZywgcmVnX2Jhc2UgKyBDUVNQ
SV9SRUdfU0laRSk7Cj4+ICsKPj4gKwkvKiBEaXNhYmxlIGF1dG8tcG9sbGluZyAqLwo+PiArCWlm
ICghZl9wZGF0YS0+dXNlX2RpcmVjdF9tb2RlKQo+PiArCQljcXNwaV9kaXNhYmxlX2F1dG9fcG9s
bChjcXNwaSk7Cj4+ICsKPj4gICAJcmV0dXJuIDA7Cj4+ICAgfQo+PiAgIAo+PgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
