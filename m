Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B955C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSzigCXi2xNi6nZj1ADnbavejEs+afh6iYmINyCi4Vs=; b=yBWJtZ15zmP7Ox
	Ts+FRmOieUNQsVb0MzT/cFALWXOicO4/H7o6mVyZ9wQdaF5/eP1poktGdQnPG/9kvCG7M4iZThnAU
	Vn1GeZEKG+pE80b1hr1V9UYcuonU3mxbNuNvphT93E4sS79sfXf4ji4HlA1wZNaT9Q691Um6HluY/
	Bqst5eBc2AQM1vplI81LN3WUuyNmlh6JeCN9/T6xFLrqPpxdhyEPAtOKpDieL1GXr5ajqaSl6Jg4h
	mEW3PiQXmJvTv/0+yR8zZal5c90dxTimcFK4GEzN3l7Y7umYrld3i5NPlj0A563u9vjKcek7DO0+S
	7jPOG4cSOpjwNyffcR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNVNT-003hcE-1v; Fri, 25 Feb 2022 07:50:59 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNVN6-003hWy-Qi; Fri, 25 Feb 2022 07:50:39 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21P7oArn092127;
 Fri, 25 Feb 2022 01:50:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1645775410;
 bh=EE1HknnGs341fweb74p5Qo4hBGv3hC8wo+SMvmEQFYk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=H6LMFX+QWdtSUd9VvRoMYXp26qbIWJ9Tggb5Zbkp7PLFAQKbI0xYk2cEzbkKNE651
 FLs/Vx3F5JAB5l+hTbumoFTuxAYP+T5CQ+rBxUiCsZbNcfpRkib5z9/AQK6mwJdEVG
 qz4KCVtYvxXIQDVkaL8TYT4lfSxkAFQE9h6xF8sk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21P7o9pQ032657
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Feb 2022 01:50:10 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 01:50:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 01:50:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21P7o7Ew043530;
 Fri, 25 Feb 2022 01:50:08 -0600
Date: Fri, 25 Feb 2022 13:20:07 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
CC: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Mark Brown
 <broonie@kernel.org>, Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, <linux-aspeed@lists.ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/10] spi: spi-mem: Add driver for Aspeed SMC controllers
Message-ID: <20220225075007.73xypamm3zbjnkg6@ti.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <20220214094231.3753686-4-clg@kaod.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214094231.3753686-4-clg@kaod.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_235036_979021_5107AE6A 
X-CRM114-Status: GOOD (  29.57  )
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

T24gMTQvMDIvMjIgMTA6NDJBTSwgQ8OpZHJpYyBMZSBHb2F0ZXIgd3JvdGU6Cj4gVGhpcyBTUEkg
ZHJpdmVyIGFkZHMgc3VwcG9ydCBmb3IgdGhlIEFzcGVlZCBzdGF0aWMgbWVtb3J5IGNvbnRyb2xs
ZXJzCj4gb2YgdGhlIEFTVDI2MDAsIEFTVDI1MDAgYW5kIEFTVDI0MDAgU29DcyB1c2luZyB0aGUg
c3BpLW1lbSBpbnRlcmZhY2UuCj4gCj4gICogQVNUMjYwMCBGaXJtd2FyZSBTUEkgTWVtb3J5IENv
bnRyb2xsZXIgKEZNQykKPiAgICAuIEJNQyBmaXJtd2FyZQo+ICAgIC4gMyBjaGlwIHNlbGVjdCBw
aW5zIChDRTAgfiBDRTIpCj4gICAgLiBPbmx5IHN1cHBvcnRzIFNQSSB0eXBlIGZsYXNoIG1lbW9y
eQo+ICAgIC4gZGlmZmVyZW50IHNlZ21lbnQgcmVnaXN0ZXIgaW50ZXJmYWNlCj4gICAgLiBzaW5n
bGUsIGR1YWwgYW5kIHF1YWQgbW9kZS4KPiAKPiAgKiBBU1QyNjAwIFNQSSBGbGFzaCBDb250cm9s
bGVyIChTUEkxIGFuZCBTUEkyKQo+ICAgIC4gaG9zdCBmaXJtd2FyZQo+ICAgIC4gMiBjaGlwIHNl
bGVjdCBwaW5zIChDRTAgfiBDRTEpCj4gICAgLiBkaWZmZXJlbnQgc2VnbWVudCByZWdpc3RlciBp
bnRlcmZhY2UKPiAgICAuIHNpbmdsZSwgZHVhbCBhbmQgcXVhZCBtb2RlLgo+IAo+ICAqIEFTVDI1
MDAgRmlybXdhcmUgU1BJIE1lbW9yeSBDb250cm9sbGVyIChGTUMpCj4gICAgLiBCTUMgZmlybXdh
cmUKPiAgICAuIDMgY2hpcCBzZWxlY3QgcGlucyAoQ0UwIH4gQ0UyKQo+ICAgIC4gc3VwcG9ydHMg
U1BJIHR5cGUgZmxhc2ggbWVtb3J5IChDRTAtQ0UxKQo+ICAgIC4gQ0UyIGNhbiBiZSBvZiBOT1Ig
dHlwZSBmbGFzaCBidXQgdGhpcyBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIKPiAgICAu
IHNpbmdsZSwgZHVhbCBtb2RlLgo+IAo+ICAqIEFTVDI1MDAgU1BJIEZsYXNoIENvbnRyb2xsZXIg
KFNQSTEgYW5kIFNQSTIpCj4gICAgLiBob3N0IGZpcm13YXJlCj4gICAgLiAyIGNoaXAgc2VsZWN0
IHBpbnMgKENFMCB+IENFMSkKPiAgICAuIHNpbmdsZSwgZHVhbCBtb2RlLgo+IAo+ICAqIEFTVDI0
MDAgTmV3IFN0YXRpYyBNZW1vcnkgQ29udHJvbGxlciAoYWxzbyByZWZlcnJlZCBhcyBGTUMpCj4g
ICAgLiBCTUMgZmlybXdhcmUKPiAgICAuIE5ldyByZWdpc3RlciBzZXQKPiAgICAuIDUgY2hpcCBz
ZWxlY3QgcGlucyAoQ0UwIOKIvCBDRTQpCj4gICAgLiBzdXBwb3J0cyBOT1IgZmxhc2gsIE5BTkQg
Zmxhc2ggYW5kIFNQSSBmbGFzaCBtZW1vcnkuCj4gICAgLiBzaW5nbGUsIGR1YWwgYW5kIHF1YWQg
bW9kZS4KPiAKPiBFYWNoIGNvbnRyb2xsZXIgaGFzIGEgbWVtb3J5IHJhbmdlIG9uIHdoaWNoIGZs
YXNoIGRldmljZXMgY29udGVudHMgYXJlCj4gbWFwcGVkLiBFYWNoIGRldmljZSBpcyBhc3NpZ25l
ZCBhIHdpbmRvdyB0aGF0IGNhbiBiZSBjaGFuZ2VkIGF0IGJvb3RpbWUKPiB3aXRoIHRoZSBTZWdt
ZW50IEFkZHJlc3MgUmVnaXN0ZXJzLgo+IAo+IEVhY2ggU1BJIGZsYXNoIGRldmljZSBjYW4gdGhl
biBiZSBhY2Nlc3NlZCBpbiB0d28gbW9kZXM6IENvbW1hbmQgYW5kCj4gVXNlci4gV2hlbiBpbiBV
c2VyIG1vZGUsIFNQSSB0cmFuc2ZlcnMgYXJlIGluaXRpYXRlZCB3aXRoIGFjY2Vzc2VzIHRvCj4g
dGhlIG1lbW9yeSBzZWdtZW50IG9mIGEgZGV2aWNlLiBXaGVuIGluIENvbW1hbmQgbW9kZSwgbWVt
b3J5Cj4gb3BlcmF0aW9ucyBvbiB0aGUgbWVtb3J5IHNlZ21lbnQgb2YgYSBkZXZpY2UgZ2VuZXJh
dGUgU1BJIGNvbW1hbmRzCj4gYXV0b21hdGljYWxseSB1c2luZyBhIENvbnRyb2wgUmVnaXN0ZXIg
Zm9yIHRoZSBzZXR0aW5ncy4KPiAKPiBUaGlzIGluaXRpYWwgcGF0Y2ggYWRkcyBzdXBwb3J0IGZv
ciBVc2VyIG1vZGUuIENvbW1hbmQgbW9kZSBuZWVkcyBhIGxpdHRsZQo+IG1vcmUgd29yayB0byBj
aGVjayB0aGF0IHRoZSBtZW1vcnkgd2luZG93IG9uIHRoZSBBSEIgYnVzIGZpdHMgdGhlIGRldmlj
ZQo+IHNpemUuIEl0IHdpbGwgY29tZSBsYXRlciB3aGVuIHN1cHBvcnQgZm9yIGRpcmVjdCBtYXBw
aW5nIGlzIGFkZGVkLgo+IAo+IFNpbmdsZSBhbmQgZHVhbCBtb2RlIFJYIHRyYW5zZmVycyBhcmUg
c3VwcG9ydGVkLiBPdGhlciB0eXBlcyB0aGFuIFNQSQo+IGFyZSBub3Qgc3VwcG9ydGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENoaW4tVGluZyBLdW8gPGNoaW4tdGluZ19rdW9AYXNwZWVkdGVjaC5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KPiAt
LS0KPiAgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYyAgICAgICAgICAgIHwgNzY2ICsrKysr
KysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL210ZC9zcGktbm9yL2NvbnRyb2xsZXJzL0tj
b25maWcgfCAgIDIgKy0KPiAgZHJpdmVycy9zcGkvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
IHwgIDExICsKPiAgZHJpdmVycy9zcGkvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgICAx
ICsKPiAgNCBmaWxlcyBjaGFuZ2VkLCA3NzkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zcGkvc3BpLWFzcGVlZC1zbWMuYwo+IApbLi4u
XQo+ICsKPiArLyogc3VwcG9ydCBmb3IgMS0xLTEsIDEtMS0yIG9yIDEtMS00ICovCj4gK3N0YXRp
YyBib29sIGFzcGVlZF9zcGlfc3VwcG9ydHNfb3Aoc3RydWN0IHNwaV9tZW0gKm1lbSwgY29uc3Qg
c3RydWN0IHNwaV9tZW1fb3AgKm9wKQo+ICt7Cj4gKwlpZiAob3AtPmNtZC5idXN3aWR0aCA+IDEp
Cj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiArCWlmIChvcC0+YWRkci5uYnl0ZXMgIT0gMCkgewo+
ICsJCWlmIChvcC0+YWRkci5idXN3aWR0aCA+IDEgfHwgb3AtPmFkZHIubmJ5dGVzID4gNCkKPiAr
CQkJcmV0dXJuIGZhbHNlOwo+ICsJfQo+ICsKPiArCWlmIChvcC0+ZHVtbXkubmJ5dGVzICE9IDAp
IHsKPiArCQlpZiAob3AtPmR1bW15LmJ1c3dpZHRoID4gMSB8fCBvcC0+ZHVtbXkubmJ5dGVzID4g
NykKPiArCQkJcmV0dXJuIGZhbHNlOwo+ICsJfQo+ICsKPiArCWlmIChvcC0+ZGF0YS5uYnl0ZXMg
IT0gMCAmJiBvcC0+ZGF0YS5idXN3aWR0aCA+IDQpCj4gKwkJcmV0dXJuIGZhbHNlOwo+ICsKPiAr
CWlmICghc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKG1lbSwgb3ApKQo+ICsJCXJldHVybiBm
YWxzZTsKPiArCj4gKwlyZXR1cm4gdHJ1ZTsKCk5pdHBpY2s6IFlvdSBjYW4ganVzdCBkbyByZXR1
cm4gc3BpX21lbV9kZWZhdWx0X3N1cHBvcnRzX29wKG1lbSwgb3ApOwoKPiArfQo+ICsKWy4uLl0K
PiArCj4gK3N0YXRpYyBpbnQgYXNwZWVkX3NwaV9pbml0X2RldmljZXMoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwgc3RydWN0IGFzcGVlZF9zcGkgKmFzcGkpCj4gK3sKPiArCXN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbnA7Cj4gKwl1bnNpZ25lZCBpbnQgY3M7Cj4gKwlpbnQgcmV0Owo+ICsKPiAr
CWZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlKGFzcGktPmRldi0+b2Zfbm9kZSwgbnAp
IHsKPiArCQlzdHJ1Y3QgYXNwZWVkX3NwaV9jaGlwICpjaGlwOwo+ICsKPiArCQlpZiAoIW9mX2Rl
dmljZV9pc19jb21wYXRpYmxlKG5wLCAiamVkZWMsc3BpLW5vciIpKQo+ICsJCQljb250aW51ZTsK
PiArCj4gKwkJcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobnAsICJyZWciLCAmY3MpOwo+ICsJ
CWlmIChyZXQpIHsKPiArCQkJZGV2X2Vycihhc3BpLT5kZXYsICJDb3VsZG4ndCBub3QgcmVhZCBj
aGlwIHNlbGVjdC5cbiIpOwo+ICsJCQlvZl9ub2RlX3B1dChucCk7Cj4gKwkJCXJldHVybiByZXQ7
Cj4gKwkJfQo+ICsKPiArCQlpZiAoY3MgPiBhc3BpLT5kYXRhLT5tYXhfY3MpIHsKPiArCQkJZGV2
X2Vycihhc3BpLT5kZXYsICJDaGlwIHNlbGVjdCAlZCBvdXQgb2YgcmFuZ2UuXG4iLCBjcyk7Cj4g
KwkJCW9mX25vZGVfcHV0KG5wKTsKPiArCQkJcmV0dXJuIC1FUkFOR0U7Cj4gKwkJfQo+ICsKPiAr
CQljaGlwID0gJmFzcGktPmNoaXBzW2NzXTsKPiArCQljaGlwLT5hc3BpID0gYXNwaTsKPiArCQlj
aGlwLT5jcyA9IGNzOwo+ICsKPiArCQlyZXQgPSBhc3BlZWRfc3BpX2NoaXBfaW5pdChjaGlwKTsK
PiArCQlpZiAocmV0KSB7Cj4gKwkJCW9mX25vZGVfcHV0KG5wKTsKPiArCQkJcmV0dXJuIHJldDsK
PiArCQl9Cj4gKwo+ICsJCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInNwaS1tYXgtZnJl
cXVlbmN5IiwgJmNoaXAtPmNsa19mcmVxKSkKPiArCQkJY2hpcC0+Y2xrX2ZyZXEgPSBBU1BFRURf
U1BJX0RFRkFVTFRfRlJFUTsKPiArCj4gKwkJYXNwaS0+bnVtX2NzKys7Cj4gKwl9CgpTUEkgTUVN
IGFscmVhZHkgZ2l2ZXMgeW91IGFsbCB0aGlzIGluZm9ybWF0aW9uLiBHZXQgaXQgZnJvbSB0aGVy
ZSwgZG9uJ3QgCnBhcnNlIGl0IHlvdXJzZWxmLgoKWW91IGNhbiBnZXQgQ2hpcCBTZWxlY3Qgdmlh
IHNwaV9tZW0tPnNwaS0+Y2hpcF9zZWxlY3QuCllvdSBjYW4gZ2V0IGNsb2NrIGZyZXF1ZW5jeSB2
aWEgc3BpX21lbS0+c3BpLT5tYXhfc3BlZWRfaHouCgpXaXRoIHRoZXNlIGNvbW1lbnRzIGZpeGVk
LAoKQWNrZWQtYnk6IFByYXR5dXNoIFlhZGF2IDxwLnlhZGF2QHRpLmNvbT4KCj4gKwo+ICsJcmV0
dXJuIDA7Cj4gK30KPiArClsuLi5dCgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKVGV4YXMg
SW5zdHJ1bWVudHMgSW5jLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
