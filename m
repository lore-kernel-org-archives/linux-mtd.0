Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039CC61DA4
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Feb 2023 10:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Content-ID:MIME-Version:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ica3Mn6yahPriP1NYHOPnvV/hqTgVvUEF4RvY99cMNY=; b=c401GpWVcl1L0M
	3eFyOBYBycBrKMIBlzJAFiW7/18e3A1W0A6yBZe/m3g5+HHoOyYycSjeJY29el6oUDO6/m/Ezx19q
	28rGR4/BpV5ow2bxuP+2uBWyyG+4cjbjk5LEFgT2YR+52AgMnesYNBxZACnQ3ZcUjZQv71ntYmQbD
	O2d55ebaR1+laUQ2bW8c0ArBwlf7hRLjA/GDVwbyWQnPcusfD4CHlPBlMejdj6t5BTP173iULXiGQ
	NiLH8PSimylIO8ZZUNaKAxxM71bbrMIM+ZRvGr8RdC9ueSagb+vg3UKLQeL5V8j/lXfqhB0r+M8z0
	osmp4vQNq/NLbr0I/8lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtKJ-001OLQ-8N; Fri, 03 Feb 2023 10:29:51 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtKF-001OHo-Pi
	for linux-mtd@lists.infradead.org; Fri, 03 Feb 2023 10:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675420187; x=1706956187;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version:content-id:
   content-transfer-encoding;
  bh=uG7mFBp8AN4ZXnQ+vh2PoeO3OMcmFfjJzOtsOXzYJ5M=;
  b=iJuxmMkeYDW4UdWUhacNx22kb7IBefL0DGW1jBguZmeOorafSudu4Jeq
   EMR4AWEA3gp8alFwFCtHGj/gOSphT+evr7Kj7ZZQjQEf8YauxmISFkesh
   xXx7GtQKkYLCNC1R4zh23pvl+c2Kheh9xi7sfL/hJRHqqxU0Lpmx/dlxN
   I12m6Iy+qh9xTmrwWMmO8U4EZf8e4Ip39CVb+BQv+iHCGWiRN2i5mSO7T
   hXWrXR/ZUnHHP9pWDW8+I8EbdVU9+XGlJYapWOQaqJwhdq+/sDgMYru8s
   yefbtnjdsaV7MeBZujHGpNjStziv6THfc7TvsKiAV19LAJsbQ1LM1+XKe
   g==;
X-IronPort-AV: E=Sophos;i="5.97,270,1669071600"; 
   d="scan'208";a="28852043"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 11:29:41 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 11:29:41 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 11:29:41 +0100
X-IronPort-AV: E=Sophos;i="5.97,270,1669071600"; 
   d="scan'208";a="28852042"
Received: from vmail02.tq-net.de ([10.150.72.12])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 11:29:41 +0100
Received: from vmail01.tq-net.de (10.150.72.11) by vmail02.tq-net.de
 (10.150.72.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Fri, 3 Feb
 2023 11:29:41 +0100
Received: from vmail01.tq-net.de ([10.150.72.11]) by vmail01.tq-net.de
 ([10.150.72.11]) with mapi id 15.01.2507.017; Fri, 3 Feb 2023 11:29:41 +0100
From: "Stein, Alexander" <Alexander.Stein@tq-group.com>
To: "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>,
	"pratyush@kernel.org" <pratyush@kernel.org>, "michael@walle.cc"
	<michael@walle.cc>, "lrannou@baylibre.com" <lrannou@baylibre.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3] mtd: spi-nor: Fix shift-out-of-bounds in
 spi_nor_set_erase_type
Thread-Topic: [PATCH v3] mtd: spi-nor: Fix shift-out-of-bounds in
 spi_nor_set_erase_type
Thread-Index: AQHZN7psQ7a7VvJFl067ZPmyIcgN1w==
Date: Fri, 3 Feb 2023 10:29:41 +0000
Message-ID: <4df4c0bb5d51aadf1dcd465fc594ad1d356523f7.camel@tq-group.com>
References: <20230203070754.50677-1-tudor.ambarus@linaro.org>
In-Reply-To: <20230203070754.50677-1-tudor.ambarus@linaro.org>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.72.21]
MIME-Version: 1.0
Content-Language: en-US
Content-ID: <2E4522578CB1E646B8C3BA94E78A1BD1@tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_022948_174353_FD15DB69 
X-CRM114-Status: GOOD (  27.24  )
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

SGkgVHVkb3IsDQoNCkFtIEZyZWl0YWcsIGRlbSAwMy4wMi4yMDIzIHVtIDA5OjA3ICswMjAwIHNj
aHJpZWIgVHVkb3IgQW1iYXJ1czoNCj4gRnJvbTogTG91aXMgUmFubm91IDxscmFubm91QGJheWxp
YnJlLmNvbT4NCj4gDQo+IHNwaV9ub3Jfc2V0X2VyYXNlX3R5cGUoKSB3YXMgdXNlZCBlaXRoZXIg
dG8gc2V0IG9yIHRvIG1hc2sgb3V0IGFuDQo+IGVyYXNlDQo+IHR5cGUuIFdoZW4gd2UgdXNlZCBp
dCB0byBtYXNrIG91dCBhbiBlcmFzZSB0eXBlIGEgc2hpZnQtb3V0LW9mLWJvdW5kcw0KPiB3YXMg
aGl0Og0KPiBVQlNBTjogc2hpZnQtb3V0LW9mLWJvdW5kcyBpbiBkcml2ZXJzL210ZC9zcGktbm9y
L2NvcmUuYzoyMjM3OjI0DQo+IHNoaWZ0IGV4cG9uZW50IDQyOTQ5NjcyOTUgaXMgdG9vIGxhcmdl
IGZvciAzMi1iaXQgdHlwZSAnaW50Jw0KPiANCj4gVGhlIHNldHRpbmcgb2YgdGhlIHNpemVfe3No
aWZ0LCBtYXNrfSBhbmQgb2YgdGhlIG9wY29kZSBhcmUNCj4gdW5uZWNlc3NhcnkNCj4gd2hlbiB0
aGUgZXJhc2Ugc2l6ZSBpcyB6ZXJvLCBhcyB0aHJvdWdob3V0IHRoZSBjb2RlIGp1c3QgdGhlIGVy
YXNlDQo+IHNpemUNCj4gaXMgY29uc2lkZXJlZCB0byBkZXRlcm1pbmUgd2hldGhlciBhbiBlcmFz
ZSB0eXBlIGlzIHN1cHBvcnRlZCBvciBub3QuDQo+IFNldHRpbmcgdGhlIG9wY29kZSB0byAweEZG
IHdhcyB3cm9uZyB0b28gYXMgbm9ib2R5IGd1YXJhbnRlZXMgdGhhdA0KPiAweEZGDQo+IGlzIGFu
IHVudXNlZCBvcGNvZGUuIFRodXMgd2hlbiBtYXNraW5nIG91dCBhbiBlcmFzZSB0eXBlLCBqdXN0
IHNldA0KPiB0aGUNCj4gZXJhc2Ugc2l6ZSB0byB6ZXJvLiBUaGlzIHdpbGwgZml4IHRoZSBzaGlm
dC1vdXQtb2YtYm91bmRzLg0KPiANCj4gRml4ZXM6IDUzOTBhOGRmNzY5ZSAoIm10ZDogc3BpLW5v
cjogYWRkIHN1cHBvcnQgdG8gbm9uLXVuaWZvcm0gU0ZEUA0KPiBTUEkgTk9SIGZsYXNoIG1lbW9y
aWVzIikNCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gUmVwb3J0ZWQtYnk6IEFsZXhh
bmRlciBTdGVpbiA8QWxleGFuZGVyLlN0ZWluQHRxLWdyb3VwLmNvbT4NCj4gU2lnbmVkLW9mZi1i
eTogTG91aXMgUmFubm91IDxscmFubm91QGJheWxpYnJlLmNvbT4NCj4gW3RhOiByZWZpbmUgY2hh
bmdlcywgbmV3IGNvbW1pdCBtZXNzYWdlLCBmaXggY29tcGlsYXRpb24gZXJyb3JdDQo+IFNpZ25l
ZC1vZmYtYnk6IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4NCg0KVGhh
bmtzLg0KVGVzdGVkLWJ5OiBBbGV4YW5kZXIgU3RlaW4gPEFsZXhhbmRlci5TdGVpbkB0cS1ncm91
cC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMgfCA5ICsrKysr
KysrKw0KPiDCoGRyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5oIHwgMSArDQo+IMKgZHJpdmVycy9t
dGQvc3BpLW5vci9zZmRwLmMgfCA0ICsrLS0NCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYw0KPiBpbmRleCAyNDdk
MTAxNDg3OWEuLjIyY2IxOGI2Yzk0MSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9jb3JlLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4gQEAgLTIwMjUs
NiArMjAyNSwxNSBAQCB2b2lkIHNwaV9ub3Jfc2V0X2VyYXNlX3R5cGUoc3RydWN0DQo+IHNwaV9u
b3JfZXJhc2VfdHlwZSAqZXJhc2UsIHUzMiBzaXplLA0KPiDCoMKgwqDCoMKgwqDCoMKgZXJhc2Ut
PnNpemVfbWFzayA9ICgxIDw8IGVyYXNlLT5zaXplX3NoaWZ0KSAtIDE7DQo+IMKgfQ0KPiDCoA0K
PiArLyoqDQo+ICsgKiBzcGlfbm9yX21hc2tfZXJhc2VfdHlwZSgpIC0gbWFzayBvdXQgYW4gU1BJ
IE5PUiBlcmFzZSB0eXBlDQo+ICsgKiBAZXJhc2U6wqDCoMKgwqDCoHBvaW50ZXIgdG8gYSBzdHJ1
Y3R1cmUgdGhhdCBkZXNjcmliZXMgYW4gU1BJIE5PUg0KPiBlcmFzZSB0eXBlDQo+ICsgKi8NCj4g
K3ZvaWQgc3BpX25vcl9tYXNrX2VyYXNlX3R5cGUoc3RydWN0IHNwaV9ub3JfZXJhc2VfdHlwZSAq
ZXJhc2UpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoGVyYXNlLT5zaXplID0gMDsNCj4gK30NCj4g
Kw0KPiDCoC8qKg0KPiDCoCAqIHNwaV9ub3JfaW5pdF91bmlmb3JtX2VyYXNlX21hcCgpIC0gSW5p
dGlhbGl6ZSB1bmlmb3JtIGVyYXNlIG1hcA0KPiDCoCAqIEBtYXA6wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgdGhlIGVyYXNlIG1hcCBvZiB0aGUgU1BJIE5PUg0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmggYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuaA0K
PiBpbmRleCBmNmQwMTJlMWY2ODEuLjI1NDIzMjI1YzI5ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmgN
Cj4gQEAgLTY4MSw2ICs2ODEsNyBAQCB2b2lkIHNwaV9ub3Jfc2V0X3BwX3NldHRpbmdzKHN0cnVj
dA0KPiBzcGlfbm9yX3BwX2NvbW1hbmQgKnBwLCB1OCBvcGNvZGUsDQo+IMKgDQo+IMKgdm9pZCBz
cGlfbm9yX3NldF9lcmFzZV90eXBlKHN0cnVjdCBzcGlfbm9yX2VyYXNlX3R5cGUgKmVyYXNlLCB1
MzINCj4gc2l6ZSwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHU4IG9wY29kZSk7DQo+ICt2b2lkIHNwaV9ub3JfbWFza19lcmFzZV90eXBl
KHN0cnVjdCBzcGlfbm9yX2VyYXNlX3R5cGUgKmVyYXNlKTsNCj4gwqBzdHJ1Y3Qgc3BpX25vcl9l
cmFzZV9yZWdpb24gKg0KPiDCoHNwaV9ub3JfcmVnaW9uX25leHQoc3RydWN0IHNwaV9ub3JfZXJh
c2VfcmVnaW9uICpyZWdpb24pOw0KPiDCoHZvaWQgc3BpX25vcl9pbml0X3VuaWZvcm1fZXJhc2Vf
bWFwKHN0cnVjdCBzcGlfbm9yX2VyYXNlX21hcCAqbWFwLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zZmRwLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NmZHAuYw0KPiBpbmRl
eCBmZDRkYWY4ZmE1ZGYuLjI5OGFiNWU1M2E4YyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tdGQv
c3BpLW5vci9zZmRwLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMNCj4gQEAg
LTg3NSw3ICs4NzUsNyBAQCBzdGF0aWMgaW50DQo+IHNwaV9ub3JfaW5pdF9ub25fdW5pZm9ybV9l
cmFzZV9tYXAoc3RydWN0IHNwaV9ub3IgKm5vciwNCj4gwqDCoMKgwqDCoMKgwqDCoCAqLw0KPiDC
oMKgwqDCoMKgwqDCoMKgZm9yIChpID0gMDsgaSA8IFNOT1JfRVJBU0VfVFlQRV9NQVg7IGkrKykN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIShyZWdpb25zX2VyYXNlX3R5
cGUgJiBCSVQoZXJhc2VbaV0uaWR4KSkpDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgc3BpX25vcl9zZXRfZXJhc2VfdHlwZSgmZXJhc2VbaV0sIDAsIDB4
RkYpOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNw
aV9ub3JfbWFza19lcmFzZV90eXBlKCZlcmFzZVtpXSk7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gMDsNCj4gwqB9DQo+IEBAIC0xMDg5LDcgKzEwODksNyBAQCBzdGF0aWMgaW50IHNw
aV9ub3JfcGFyc2VfNGJhaXQoc3RydWN0IHNwaV9ub3INCj4gKm5vciwNCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXJhc2VfdHlwZVtpXS5vcGNvZGUg
PSAoZHdvcmRzW1NGRFBfRFdPUkQoMildDQo+ID4+DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGVyYXNlX3R5cGVbaV0uaWR4ICoNCj4gOCkgJiAweEZGOw0KPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGVsc2UNCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzcGlfbm9yX3NldF9lcmFzZV90eXBlKCZlcmFzZV90
eXBlW2ldLCAwdSwNCj4gMHhGRik7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgc3BpX25vcl9tYXNrX2VyYXNlX3R5cGUoJmVyYXNlX3R5cGVbaV0pOw0K
PiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgLyoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
