Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2149C3F2CF
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 04:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C22BF2469B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 04:11:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4bbieTI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C22BF2469B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MyizptuLlA4UOrjYiQDqrRXFiyniIeSbgkk0cDdY3vA=; b=e4bbieTIyPTWbWaEaKgHcbf65
	b3a8l+yo6P0/k1N8m3jyDxRJ2x4z/69AQCCtspGOPTmVTTZ2YMgRnNExPnnu3MfUchaEjw67PaZx5
	8ap8gAh7hrpdcUVEkSIyQ/46f0qNMRx+GJYO674LLnoBQ/R4SXnMwwK13gYHOYzZqmD89q08Bz+Dy
	XgSwGm/tohBhJf5Lj2DbPmR16oneKgMQS6HjKPwPy29h9CrbE31/Y+/zibPm6iDohka1097Oy/pvc
	NMmLTvVGm6jcUooq+jsjx/1LS7gMg8sGlACELW4ZAeZAII6O8p7Gt7I2i+jnywnaxNOeNNDxXK7yr
	6x+MGwYpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Wzl-0006yx-Nd; Fri, 28 Feb 2020 04:11:25 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Wzj-0006yR-TB
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 04:11:25 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2020 20:11:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,493,1574150400"; d="scan'208";a="272497840"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2020 20:11:20 -0800
Received: from [10.226.38.23] (unknown [10.226.38.23])
 by linux.intel.com (Postfix) with ESMTP id 77C5558052E;
 Thu, 27 Feb 2020 20:11:11 -0800 (PST)
Subject: Re: [PATCH v11 2/2] spi: cadence-quadspi: Add support for the Cadence
 QSPI controller
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200227062708.21544-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227062708.21544-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200227183032.77ef0795@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <f82e4964-f030-9aac-5895-a715921ed6db@linux.intel.com>
Date: Fri, 28 Feb 2020 12:11:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200227183032.77ef0795@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_201123_953989_5E60FE6F 
X-CRM114-Status: GOOD (  19.35  )
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
Cc: mark.rutland@arm.com, tudor.ambarus@gmail.com, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 cyrille.pitchen@atmel.com, marex@denx.de, boris.brezillon@free-electrons.com,
 tien.fong.chee@intel.com, richard@nod.at, simon.k.r.goldschmidt@gmail.com,
 devicetree@vger.kernel.org, cheol.yong.kim@intel.com, robh+dt@kernel.org,
 qi-ming.wu@intel.com, david.oberhollenzer@sigma-star.at,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, dinguyen@kernel.org,
 broonie@kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsCgogwqDCoMKgwqAgVGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSByZXZpZXcgY29t
bWVudHMuLi4KCk9uIDI4LzIvMjAyMCAxOjMwIEFNLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4g
T24gVGh1LCAyNyBGZWIgMjAyMCAxNDoyNzowOCArMDgwMAo+ICJSYW11dGhldmFyLCBWYWRpdmVs
IE11cnVnYW5YIgo+IDx2YWRpdmVsLm11cnVnYW54LnJhbXV0aGV2YXJAbGludXguaW50ZWwuY29t
PiB3cm90ZToKPgo+PiBGcm9tOiBSYW11dGhldmFyIFZhZGl2ZWwgTXVydWdhbiA8dmFkaXZlbC5t
dXJ1Z2FueC5yYW11dGhldmFyQGxpbnV4LmludGVsLmNvbT4KPj4KPj4gQWRkIHN1cHBvcnQgZm9y
IHRoZSBDYWRlbmNlIFFTUEkgY29udHJvbGxlci4gVGhpcyBjb250cm9sbGVyIGlzCj4+IHByZXNl
bnQgaW4gdGhlIEludGVsIExpZ2h0bmluZyBNb3VudGFpbihMR00pIFNvQ3MsIEFsdGVyYSBhbmQg
VEkgU29Dcy4KPj4gVGhpcyBkcml2ZXIgaGFzIGJlZW4gdGVzdGVkIG9uIHRoZSBJbnRlbCBMR00g
U29Dcy4KPj4KPj4gVGhpcyBkcml2ZXIgZG9lcyBub3Qgc3VwcG9ydCBnZW5lcmljIFNQSSBhbmQg
YWxzbyB0aGUgaW1wbGVtZW50YXRpb24KPj4gb25seSBzdXBwb3J0cyBzcGktbWVtIGludGVyZmFj
ZSB0byByZXBsYWNlIHRoZSBleGlzdGluZyBkcml2ZXIgaW4KPj4gbXRkL3NwaS1ub3IvY2FkZW5j
ZS1xdWFkc3BpLmMsIHRoZSBleGlzdGluZyBkcml2ZXIgb25seSBzdXBwb3J0IFNQSS1OT1IKPj4g
Zmxhc2ggbWVtb3J5Cj4gSXMgaXQgcmVhbGx5IHN1cHBvcnRpbmcgU1BJIE5PUnMgb25seSwgb3Ig
aXMgaXQganVzdCB0aGF0IHlvdSBvbmx5Cj4gdGVzdGVkIGl0IHdpdGggYSBzcGktbm9yPwoKVGhl
IGV4aXN0aW5nIGRyaXZlcnMvbXRkL3NwaS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMgc3VwcG9ydHMg
U1BJLU5PUnMgCm9ubHksIGJlY2F1c2UgdGhlIGRyaXZlciBpcyBkZXZlbG9wZWQKCnN1Y2ggYSB3
YXkgdGhhdCBpdCBkb2VzIG5vdCBzdXBwb3J0IG90aGVyIFNQSSBiYXNlZCBmbGFzaCBtZW1vcmll
cywgYWxzbyAKbmV2ZXIgdXNlcyBTUEkvU1BJLU1FTSBiYXNlZCBmcmFtZXdvcmsuCgpTbyB3ZSBW
aWduZXNoIHN1Z2dlc3RlZCBtZSB0b8KgIGRldmVsb3AgdGhlIG5ldyBkcml2ZXIgd2hpY2ggc3Vw
cG9ydHMgCmJvdGggU1BJLU5PUiBhbmQgU1BJLU5BTkQgYmFzZWQgb24gdGhlIFNQSS1NRU0gZnJh
bWV3b3JrLgoKPj4gU2lnbmVkLW9mZi1ieTogUmFtdXRoZXZhciBWYWRpdmVsIE11cnVnYW4gPHZh
ZGl2ZWwubXVydWdhbngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFZpZ25lc2ggUmFnaGF2ZW5kcmEgPHZpZ25lc2hyQHRpLmNvbT4KPj4gUmVwb3J0ZWQtYnk6
IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+PiBSZXBvcnRlZC1ieTogRGFuIENh
cnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgo+IFJlcG9ydGVkLWJ5PyBXaGF0IGhh
cyBiZWVuIHJlcG9ydGVkPwpTdXJlLCB3aWxsIHJlbW92ZSBpdC4KPgo+PiAtLS0KPj4gICBkcml2
ZXJzL210ZC9zcGktbm9yL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSAtCj4+
ICAgZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDEgLQo+PiAgIGRyaXZlcnMvc3BpL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEwICsKPj4gICBkcml2ZXJzL3NwaS9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMSArCj4+ICAgLi4uL3NwaS1jYWRlbmNlLXF1YWRzcGkuY30gICAgICAg
ICAgICAgICAgICAgICAgICAgfCA2NDEgKysrKysrKysrKy0tLS0tLS0tLS0tCj4gTG9va3MgbGlr
ZSB0aGlzIGNvdWxkIGJlIHNwbGl0IGluIHNldmVyYWwgcGF0Y2hlcyB0byBlYXNlIHRoZSByZXZp
ZXc6Cj4KPiAxLyBjb252ZXJ0IHRvIHNwaS1tZW0KPiAyLyBtb3ZlIHRoZSBkcml2ZXIgdG8gZHJp
dmVycy9zcGkKPiAzLyBhZGQgc3VwcG9ydCBmb3IgaW50ZWwsbGdtLXFzcGkKPgo+IG90aGVyIHRo
YW4gdGhhdCwgdGhhdCdzIGdvb2QgdG8gc2VlIG9uZSBtb3JlIHNwaS1ub3IgY29udHJvbGxlciBk
cml2ZXIKPiBjb252ZXJ0ZWQgdG8gc3BpLW1lbS4KCkFncmVlZCEsIHdpbGwgc3BsaXQgYXMgcGVy
IHlvdXIgc3VnZ2VzdGlvbnMuCgpSZWdhcmRzClZhZGl2ZWwKPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
