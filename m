Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B120ECE588
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 08:50:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E23B20872
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 08:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OPMJd4d6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E23B20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o4o/ETFyVs0c0qb5pRJrYiENNWuGFF/EwImrspUTTTw=; b=OPMJd4d6SMBre6IUx0temWgEZ
	Cha/HkZ1lmzkmyBQvgV+GZ9rOdeJay8cDmvBlJRrZr4T/lITGpygElW4j+47xfYQOkuzKvgQZ8J1n
	Qip/MZoZOqNEkbzLeWnkPHep5xDHKG7Wnb1kp16HR51Gi1Gq/DqjqsQFfNm4kr1w0U4z/0XV4jxfX
	8u2dZgAfKDRCdPD0s5TdfWRgtPM+hMHfmcLFP/H2zK/CqYPyNQVQC2LPx5/HvlTJR7jXBugGddS5P
	IyBcrnYl3nkosz13uqj6rJa0qpLNRbf6/XRZ42ccxf57ZTwWUu7s+Vr8sVoqSAx89SSyfqMDYrrgK
	fenMZwF2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKf0i-0004JH-Mh; Wed, 16 Oct 2019 08:50:24 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKf0f-0002Za-Lg
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 08:50:23 +0000
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Oct 2019 01:48:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,303,1566889200"; d="scan'208";a="208368132"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP; 16 Oct 2019 01:48:20 -0700
Received: from [10.226.38.27] (unknown [10.226.38.27])
 by linux.intel.com (Postfix) with ESMTP id 791205803C5;
 Wed, 16 Oct 2019 01:48:16 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: cadence-quadspi: Disable the DAC for
 Intel LGM SoC
To: Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
References: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20190909104733.14273-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <85355c80-1344-db22-ae31-0f20f30b9754@ti.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <9b91e39e-a1ab-d99d-50b1-483d6acf5357@linux.intel.com>
Date: Wed, 16 Oct 2019 16:48:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <85355c80-1344-db22-ae31-0f20f30b9754@ti.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_015021_726138_9DE9DBA9 
X-CRM114-Status: GOOD (  19.40  )
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

SGkgVmlnbmVzaCwKCiDCoMKgwqDCoMKgIFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldyBjb21tZW50
cy4KCk9uIDE2LzEwLzIwMTkgNDozMiBQTSwgVmlnbmVzaCBSYWdoYXZlbmRyYSB3cm90ZToKPgo+
IE9uIDA5LzA5LzE5IDQ6MTcgUE0sIFJhbXV0aGV2YXIsVmFkaXZlbCBNdXJ1Z2FuWCB3cm90ZToK
Pj4gRnJvbTogUmFtdXRoZXZhciBWYWRpdmVsIE11cnVnYW4gPHZhZGl2ZWwubXVydWdhbngucmFt
dXRoZXZhckBsaW51eC5pbnRlbC5jb20+Cj4+Cj4+IG9uIEludGVsJ3MgTGlnaHRuaW5nIE1vdW50
YWluKExHTSkgU29DcyBRU1BJIGNvbnRyb2xsZXIgZG8gbm90IHVzZQo+IHMvb24vT24KQWdyZWVk
LCB3aWxsIHVwZGF0ZS4KPj4gRGlyZWN0IEFjY2VzcyBDb250cm9sbGVyKERBQykuCj4+Cj4+IFRo
aXMgcGF0Y2ggaW50cm9kdWNlcyB0byBwcm9wZXJseSBkaXNhYmxlIHRoZSBEaXJlY3QgQWNjZXNz
IENvbnRyb2xsZXIKPiAiVGhpcyBwYXRjaCBhZGRzIGEgcXVpcmsgdG8gZGlzYWJsZS4uLiIgb3Ig
c29tZXRoaW5nIHNvbWV0aGluZyBzaW1pbGFyCm9rYXksIHdpbGwgdXBkYXRlLgo+PiBmb3IgZGF0
YSB0cmFuc2ZlciBpbnN0ZWFkIGl0IHVzZXMgaW5kaXJlY3QgZGF0YSB0cmFuc2Zlci4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogUmFtdXRoZXZhciBWYWRpdmVsIE11cnVnYW4gPHZhZGl2ZWwubXVydWdh
bngucmFtdXRoZXZhckBsaW51eC5pbnRlbC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvbXRkL3Nw
aS1ub3IvS2NvbmZpZyAgICAgICAgICAgfCAgMiArLQo+PiAgIGRyaXZlcnMvbXRkL3NwaS1ub3Iv
Y2FkZW5jZS1xdWFkc3BpLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysKPj4gICAyIGZpbGVz
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvS2NvbmZpZyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvS2Nv
bmZpZwo+PiBpbmRleCA2ZGU4MzI3N2NlOGIuLmJhMmUzNzJhZTUxNCAxMDA2NDQKPj4gLS0tIGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9LY29uZmlnCj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Iv
S2NvbmZpZwo+PiBAQCAtMzQsNyArMzQsNyBAQCBjb25maWcgU1BJX0FTUEVFRF9TTUMKPj4gICAK
Pj4gICBjb25maWcgU1BJX0NBREVOQ0VfUVVBRFNQSQo+PiAgIAl0cmlzdGF0ZSAiQ2FkZW5jZSBR
dWFkIFNQSSBjb250cm9sbGVyIgo+PiAtCWRlcGVuZHMgb24gT0YgJiYgKEFSTSB8fCBBUk02NCB8
fCBDT01QSUxFX1RFU1QpCj4+ICsJZGVwZW5kcyBvbiBPRiAmJiAoQVJNIHx8IEFSTTY0IHx8IENP
TVBJTEVfVEVTVCB8fCBYODYpCj4+ICAgCWhlbHAKPj4gICAJICBFbmFibGUgc3VwcG9ydCBmb3Ig
dGhlIENhZGVuY2UgUXVhZCBTUEkgRmxhc2ggY29udHJvbGxlci4KPj4gICAKPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMgYi9kcml2ZXJzL210ZC9z
cGktbm9yL2NhZGVuY2UtcXVhZHNwaS5jCj4+IGluZGV4IDY3ZjE1YTFmMTZmZC4uNzNiOWZiZDE1
MDhhIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL2NhZGVuY2UtcXVhZHNwaS5j
Cj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY2FkZW5jZS1xdWFkc3BpLmMKPj4gQEAgLTMz
LDYgKzMzLDcgQEAKPj4gICAKPj4gICAvKiBRdWlya3MgKi8KPj4gICAjZGVmaW5lIENRU1BJX05F
RURTX1dSX0RFTEFZCQlCSVQoMCkKPj4gKyNkZWZpbmUgQ1FTUElfRElTQUJMRV9EQUNfTU9ERQkJ
QklUKDEpCj4+ICAgCj4+ICAgLyogQ2FwYWJpbGl0aWVzIG1hc2sgKi8KPj4gICAjZGVmaW5lIENR
U1BJX0JBU0VfSFdDQVBTX01BU0sJCQkJCVwKPj4gQEAgLTYwOSw2ICs2MTAsMTMgQEAgc3RhdGlj
IGludCBjcXNwaV93cml0ZV9zZXR1cChzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+PiAgIAlzdHJ1Y3Qg
Y3FzcGlfc3QgKmNxc3BpID0gZl9wZGF0YS0+Y3FzcGk7Cj4+ICAgCXZvaWQgX19pb21lbSAqcmVn
X2Jhc2UgPSBjcXNwaS0+aW9iYXNlOwo+PiAgIAo+PiArCS8qIERpc2FibGUgZGlyZWN0IGFjY2Vz
cyBjb250cm9sbGVyICovCj4+ICsJaWYgKCFmX3BkYXRhLT51c2VfZGlyZWN0X21vZGUpIHsKPj4g
KwkJcmVnID0gcmVhZGwocmVnX2Jhc2UgKyBDUVNQSV9SRUdfQ09ORklHKTsKPj4gKwkJcmVnICY9
IH5DUVNQSV9SRUdfQ09ORklHX0VOQl9ESVJfQUNDX0NUUkw7Cj4+ICsJCXdyaXRlbChyZWcsIHJl
Z19iYXNlICsgQ1FTUElfUkVHX0NPTkZJRyk7Cj4+ICsJfQo+PiArCj4+ICAgCS8qIFNldCBvcGNv
ZGUuICovCj4+ICAgCXJlZyA9IG5vci0+cHJvZ3JhbV9vcGNvZGUgPDwgQ1FTUElfUkVHX1dSX0lO
U1RSX09QQ09ERV9MU0I7Cj4+ICAgCXdyaXRlbChyZWcsIHJlZ19iYXNlICsgQ1FTUElfUkVHX1dS
X0lOU1RSKTsKPj4gQEAgLTEzMjgsNiArMTMzNiw3IEBAIHN0YXRpYyBpbnQgY3FzcGlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gICAJc3RydWN0IHJlc291cmNlICpyZXNf
YWhiOwo+PiAgIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YywgKnJzdGNfb2NwOwo+PiAgIAlj
b25zdCBzdHJ1Y3QgY3FzcGlfZHJpdmVyX3BsYXRkYXRhICpkZGF0YTsKPj4gKwlzdHJ1Y3QgY3Fz
cGlfZmxhc2hfcGRhdGEgKmZfcGRhdGE7Cj4+ICAgCWludCByZXQ7Cj4+ICAgCWludCBpcnE7Cj4+
ICAgCj4+IEBAIC0xNDM2LDYgKzE0NDUsOSBAQCBzdGF0aWMgaW50IGNxc3BpX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+ICAgCQlnb3RvIHByb2JlX3NldHVwX2ZhaWxlZDsK
Pj4gICAJfQo+PiAgIAo+PiArCWlmIChkZGF0YSAmJiAoZGRhdGEtPnF1aXJrcyAmIENRU1BJX0RJ
U0FCTEVfREFDX01PREUpKQo+PiArCQlmX3BkYXRhLT51c2VfZGlyZWN0X21vZGUgPSBmYWxzZTsK
Pj4gKwo+IElmIHlvdSBkbyB0aGlzIGhlcmUsIHlvdSB3aWxsIHN0aWxsIGVuZCB1cCBhY3F1aXJp
bmcgYSBETUEgY2hhbm5lbCBpbgo+IGNxc3BpX3JlcXVlc3RfbW1hcF9kbWEoKSAoY2FsbGVkIGZy
b20gY3FzcGlfc2V0dXBfZmxhc2goKSkuIFNvLCBwbGVhc2UKPiBtb3ZlIHRoZSBjaGVjayB0byBj
cXNwaV9zZXR1cF9mbGFzaCgpLgoKd2lsbCBmaXggaXQuCgotLS0KUmVnYXJkcwpWYWRpdmVsCj4+
ICAgCXJldHVybiByZXQ7Cj4+ICAgcHJvYmVfc2V0dXBfZmFpbGVkOgo+PiAgIAljcXNwaV9jb250
cm9sbGVyX2VuYWJsZShjcXNwaSwgMCk7Cj4+IEBAIC0xNTEwLDYgKzE1MjIsMTEgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBjcXNwaV9kcml2ZXJfcGxhdGRhdGEgYW02NTRfb3NwaSA9IHsKPj4gICAJ
LnF1aXJrcyA9IENRU1BJX05FRURTX1dSX0RFTEFZLAo+PiAgIH07Cj4+ICAgCj4+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IGNxc3BpX2RyaXZlcl9wbGF0ZGF0YSBpbnRlbF9sZ21fcXNwaSA9IHsKPj4g
KwkuaHdjYXBzX21hc2sgPSBDUVNQSV9CQVNFX0hXQ0FQU19NQVNLLAo+PiArCS5xdWlya3MgPSBD
UVNQSV9ESVNBQkxFX0RBQ19NT0RFLAo+PiArfTsKPj4gKwo+PiAgIHN0YXRpYyBjb25zdCBzdHJ1
Y3Qgb2ZfZGV2aWNlX2lkIGNxc3BpX2R0X2lkc1tdID0gewo+PiAgIAl7Cj4+ICAgCQkuY29tcGF0
aWJsZSA9ICJjZG5zLHFzcGktbm9yIiwKPj4gQEAgLTE1MjMsNiArMTU0MCwxMCBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBjcXNwaV9kdF9pZHNbXSA9IHsKPj4gICAJCS5jb21w
YXRpYmxlID0gInRpLGFtNjU0LW9zcGkiLAo+PiAgIAkJLmRhdGEgPSAmYW02NTRfb3NwaSwKPj4g
ICAJfSwKPj4gKwl7Cj4+ICsJCS5jb21wYXRpYmxlID0gImludGVsLGxnbS1xc3BpIiwKPj4gKwkJ
LmRhdGEgPSAmaW50ZWxfbGdtX3FzcGksCj4+ICsJfSwKPj4gICAJeyAvKiBlbmQgb2YgdGFibGUg
Ki8gfQo+PiAgIH07Cj4+ICAgCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
