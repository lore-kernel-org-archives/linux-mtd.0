Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AA7FD063E
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Mar 2026 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHkocoE280rbGSiFSZvqjmBtv8RAD0cKWZIQKroWe0E=; b=gliKXQFqzwuNMw
	OhEyHEkdJPimnnoi9w4J8rjs7+dB1Yoo849F6FbN1Im8ataO2qxt4irCAD3x/a0fFh3SgcSZllKVc
	eGDQM1Kj4DohsIjBE28QE+XTNoLGxrgMQLsQ9ozHZC1vpqgZcFSBpLXk7HjlSvRHrXOciZrIXibb8
	+cEMSSNz5a4wYdIFzx1XOQ5WIYDOydCxKPUEwIbED2Kcd9UEfbgctEQx6XECLk6JUG56DfoKrE/p6
	rfEe9F4PueBargNloXHeQH0R4PU26sOFl6fFHDT5Fm3hjPG+B/+D7ODEJMMFwqgBW3YxD6psSK/pc
	oRKDcFaYKCcikxhbW6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DdL-0000000AyYj-3qh9;
	Wed, 11 Mar 2026 07:05:31 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DdI-0000000Ay3B-1iZK
	for linux-mtd@lists.infradead.org;
	Wed, 11 Mar 2026 07:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1773212728; x=1804748728;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zRAn6KLIqw8tgbK7qWhx8xsA7+Xzt+dhBHQjMfV4Fds=;
  b=Lxs35izStp7tZEv/mU0d3IG8JruMN1Cn+AgV0V7IhYMjDWoX/Qw/LRDY
   KB0gaj84kKjPpkK9L36vWpvbJegSN8OwR3HZIGICbpy9c2O83p3a+cGxb
   h3lnt6+PgAf+DxLaZE5AcqfSCTaCuh/eiVTWWKpHzSjMaYrTHfn7YFdJp
   Y=;
X-CSE-ConnectionGUID: 5h+i64ifToCNMiryu+G6mw==
X-CSE-MsgGUID: DCNepB9FTX+4wCz6LzJivw==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85049380"
X-IronPort-AV: E=Sophos;i="6.23,113,1770591600"; 
   d="scan'208";a="85049380"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 08:02:19 +0100
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 11 Mar
 2026 08:02:18 +0100
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 11 Mar
 2026 08:02:18 +0100
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.037; Wed, 11 Mar 2026 08:02:18 +0100
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>
CC: <vigneshr@ti.com>, <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
	<michael@walle.cc>, <linux-mtd@lists.infradead.org>, <czapiga@google.com>,
	<thomas.petazzoni@bootlin.com>
Subject: RE: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Fix RDCR controller capability core
 check
Thread-Index: AQHcr9THTPC/3j8FOUqZJ1eE1qdIjbWo6RHQ
Date: Wed, 11 Mar 2026 07:02:18 +0000
Message-ID: <fb44fedeb839412eb2c03975eb3ad653@infineon.com>
References: <20260108121430.1096844-1-miquel.raynal@bootlin.com>
 <873429oxwf.fsf@bootlin.com>
In-Reply-To: <873429oxwf.fsf@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_000528_774958_DCF275FE 
X-CRM114-Status: GOOD (  31.73  )
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

PiBIZWxsbyBTUEkgTk9SIGZvbGtzIDotKQ0KPiANCj4gKyBUYWthaGlybw0KPiANCkhlbGxvIQ0K
DQo+IE9uIDA4LzAxLzIwMjYgYXQgMTM6MTQ6MjkgKzAxLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPiB3cm90ZToNCj4gDQo+ID4gQ29tbWl0IDUwMDhjM2VjM2Y4OSAo
Im10ZDogc3BpLW5vcjogY29yZTogQ2hlY2sgcmVhZCBDUiBzdXBwb3J0IikgYWRkcyBhDQo+ID4g
Y29udHJvbGxlciBjaGVjayB0byBtYWtlIHN1cmUgdGhlIGNvcmUgd2lsbCBub3QgdXNlIENSIHJl
YWRzIG9uDQo+ID4gY29udHJvbGxlcnMgbm90IHN1cHBvcnRpbmcgdGhlbS4gVGhlIGFwcHJvYWNo
IGlzIHZhbGlkIGJ1dCB0aGUgZml4IGlzDQo+ID4gaW5jb3JyZWN0LiBVbmZvcnR1bmF0ZWx5LCB0
aGUgYXV0aG9yIGNvdWxkIG5vdCBjYXRjaCBpdCwgYmVjYXVzZSB0aGUNCj4gPiBleHBlY3RlZCBi
ZWhhdmlvciB3YXMgbWV0LiBUaGUgcGF0Y2ggaW5kZWVkIGRyb3BzIHRoZSBSRENSIGNhcGFiaWxp
dHksDQo+ID4gYnV0IGl0IGRvZXMgaXQgZm9yIGFsbCBjb250cm9sbGVycyENCj4gPg0KPiA+IFRo
ZSBpc3N1ZSBjb21lcyBmcm9tIHRoZSB1c2Ugb2Ygc3BpX25vcl9zcGltZW1fY2hlY2tfb3AoKSB3
aGljaCBpcyBhbg0KPiA+IGludGVybmFsIGhlbHBlciBkZWRpY2F0ZWQgdG8gY2hlY2sgcGFnZSBv
cGVyYXRpb25zLCBpZS4gaXQgaXMgb25seSB1c2VkDQo+ID4gZm9yIHBhZ2UgcmVhZHMgYW5kIHBh
Z2UgcHJvZ3JhbXMgKGRlc3BpdGUgaXRzIGdlbmVyaWMgbmFtZSkuDQo+ID4NCj4gPiBUaGlzIGhl
bHBlciBsb29rcyBmb3IgdGhlIGJpZ2dlc3QgbnVtYmVyIG9mIGFkZHJlc3MgYnl0ZXMgdGhhdCBj
YW4gYmUNCj4gPiB1c2VkIGZvciBhIHBhZ2Ugb3BlcmF0aW9uIGFuZCB0cmllcyA0IHRoZW4gMy4g
SXQgdGhlbiBjYWxscyB0aGUgdXN1YWwNCj4gPiBzcGktbWVtIGhlbHBlcnMgdG8gZG8gdGhlIGNo
ZWNrcy4gVGhlc2Ugd2lsbCBhbHdheXMgZmFpbCBiZWNhdXNlIHRoZXJlDQo+ID4gaXMgbm93IGFu
IGluY29uc2lzdGVuY3k6IHRoZSBhZGRyZXNzIGN5Y2xlcyBhcmUgZm9yY2VkIHRvIDQgKHRoZW4g
MykNCj4gPiBieXRlcywgYnV0IHRoZSBidXMgd2lkdGggZHVyaW5nIHRoZSBhZGRyZXNzIGN5Y2xl
cyByaWdodGZ1bGx5IHJlbWFpbnMgMDoNCj4gPiBpbXBvc3NpYmxlLCB0aGUgb3BlcmF0aW9uIGlz
IGludmFsaWQuDQo+ID4NCj4gPiBUaGUgY29ycmVjdCBjaGVjayBpbiB0aGlzIGNhc2UgaXMgdG8g
ZGlyZWN0bHkgY2FsbCBzcGlfbWVtX3N1cHBvcnRzX29wKCkNCj4gPiB3aGljaCBkb2Vzbid0IG1l
c3NlcyB1cCB3aXRoIHRoZSBvcGVyYXRpb24gY29udGVudC4NCj4gPg0KPiA+IEZpeGVzOiA1MDA4
YzNlYzNmODkgKCJtdGQ6IHNwaS1ub3I6IGNvcmU6IENoZWNrIHJlYWQgQ1Igc3VwcG9ydCIpDQo+
ID4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4NCj4gDQo+IFRoZXNlIHR3byBwYXRjaGVzIGFyZSBmaXhlcyB3aGljaCBuZWVkIHRvIGdldCBp
biwgSSdkIGxpa2UgdG8gcGljayB0aGVtDQo+IGZvciB0aGUgbmV4dCBmaXhlcyBNVEQgUFIgdGhh
dCBJIGFtIHByZXBhcmluZywgYnV0IEkgd2FzIGV4cGVjdGluZyBzb21lDQo+IGtpbmQgb2YgYWNr
bm93bGVkZ2VtZW50IG9uIGl0Lg0KPiANCj4gQ2hlbmcgTWluZyBhbHJlYWR5IGZhY2VkIHRoZSBz
YW1lIGlzc3VlIG9uIGhpcyBzaWRlIGFuIGlkZW50aWNhbCBwYXRjaA0KPiBhbHJlYWR5Lg0KPiAN
Cj4gVGhhbmtzLA0KPiBNaXF1w6hsDQo+IA0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL210ZC9zcGkt
bm9yL2NvcmUuYyB8IDIgKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9j
b3JlLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYw0KPiA+IGluZGV4IGQzZjhhNzhlZmQz
Yi4uMWYyZTMxMmZlZWM3IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29y
ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9jb3JlLmMNCj4gPiBAQCAtMjQ2Niw3
ICsyNDY2LDcgQEAgc3BpX25vcl9zcGltZW1fYWRqdXN0X2h3Y2FwcyhzdHJ1Y3Qgc3BpX25vciAq
bm9yLCB1MzIgKmh3Y2FwcykNCj4gPg0KPiA+ICAgICAgICAgICAgICAgc3BpX25vcl9zcGltZW1f
c2V0dXBfb3Aobm9yLCAmb3AsIG5vci0+cmVnX3Byb3RvKTsNCj4gPg0KPiA+IC0gICAgICAgICAg
ICAgaWYgKHNwaV9ub3Jfc3BpbWVtX2NoZWNrX29wKG5vciwgJm9wKSkNCj4gPiArICAgICAgICAg
ICAgIGlmICghc3BpX21lbV9zdXBwb3J0c19vcChub3ItPnNwaW1lbSwgJm9wKSkNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgbm9yLT5mbGFncyB8PSBTTk9SX0ZfTk9fUkVBRF9DUjsNCj4gPiAg
ICAgICB9DQo+ID4gIH0NCg0KQWNrZWQtYnk6IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3
YW5vQGluZmluZW9uLmNvbT4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
