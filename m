Return-Path: <SRS0=yOTt=WC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB06FC433FF
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 16:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9790A216B7
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Aug 2019 16:41:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A29E6qJA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9790A216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTZk9iksd2nwr6TLx3OeOII1s1M030C2FpjSftn0W4g=; b=A29E6qJAoXg1Om
	AidaPr26WESlFov4wFYbLc6R9NYU95OqavMAx9gnl/6FVD6/suXw8gQgEmNy1jUVu2OH6dE5I66P7
	HEIbE7r8Kmqy/xw6Yzz72X8UgkjlZhpQ7TQEzPbXHdlOPmcmVP2+Dsp4GYHP0uaLwJ8CYzuwvMK/d
	YixB0+0+kHKfYCUMFXaJ1FqubA/F/LXAjVBtFCjCU6LV3ah6xKPk3alkQbrC3zAWulGkMFMa3SGRk
	mY1VzWxM5FNkh9z1KueIEH3siJjMwTu/KA37qEfNuqdNz55dJZAkCg8wqLorpZaPcDGC82mD/vA5e
	zLRfQ81ytUnoUOr+pJng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv2WC-0000lf-5L; Tue, 06 Aug 2019 16:41:00 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv2W8-0000kU-Nk
 for linux-mtd@lists.infradead.org; Tue, 06 Aug 2019 16:40:58 +0000
Received: from sntmail12r.snt-is.com (unknown [10.203.32.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id CAAD367A883;
 Tue,  6 Aug 2019 18:40:49 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail12r.snt-is.com
 (10.203.32.182) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 6 Aug 2019
 18:40:49 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Tue, 6 Aug 2019 18:40:49 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: John Garry <john.garry@huawei.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
Thread-Topic: [PATCH] docs: mtd: Update spi nor reference driver
Thread-Index: AQHVTHFK/VQj/Xg/00CSD7MmPvBJMabuL3MAgAABiQA=
Date: Tue, 6 Aug 2019 16:40:49 +0000
Message-ID: <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
 <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
In-Reply-To: <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <632CB3CC467B7C46ABA2F0EDB4C1B97E@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: CAAD367A883.A1723
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: broonie@kernel.org, corbet@lwn.net,
 john.garry@huawei.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut@gmail.com, mchehab+samsung@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at,
 tudor.ambarus@microchip.com, vigneshr@ti.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_094057_100887_F99EB183 
X-CRM114-Status: GOOD (  16.51  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Q2M6ICtNVEQvU1BJLU5PUi9TUEkgbWFpbnRhaW5lcnMNCg0KSGkgSm9obiwNCg0KT24gMDYuMDgu
MTkgMTg6MzUsIEpvaG4gR2Fycnkgd3JvdGU6DQo+IE9uIDA2LzA4LzIwMTkgMTc6MDYsIEpvaG4g
R2Fycnkgd3JvdGU6DQo+PiBUaGUgcmVmZXJlbmNlIGRyaXZlciBubyBsb25nZXIgZXhpc3RzIHNp
bmNlIGNvbW1pdCA1MGYxMjQyYzY3NDIgKCJtdGQ6DQo+PiBmc2wtcXVhZHNwaTogUmVtb3ZlIHRo
ZSBkcml2ZXIgYXMgaXQgd2FzIHJlcGxhY2VkIGJ5IHNwaS1mc2wtcXNwaS5jIikuDQo+Pg0KPj4g
VXBkYXRlIHJlZmVyZW5jZSB0byBzcGktZnNsLXFzcGkuYyBkcml2ZXIuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogSm9obiBHYXJyeSA8am9obi5nYXJyeUBodWF3ZWkuY29tPg0KPj4NCj4+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0IA0KPj4gYi9E
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0DQo+PiBpbmRleCBmNTMzM2Uz
YmY0ODYuLjFmMDQzNzY3Njc2MiAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZHJpdmVy
LWFwaS9tdGQvc3BpLW5vci5yc3QNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9t
dGQvc3BpLW5vci5yc3QNCj4gDQo+IEluIGZhY3QgdGhpcyBkb2N1bWVudCBoYXMgbWFueSByZWZl
cmVuY2VzIHRvIEZyZWVzY2FsZSBRdWFkU1BJIC0gY291bGQgDQo+IHNvbWVvbmUga2luZGx5IHJl
dmlldyB0aGlzIGNvbXBsZXRlIGRvY3VtZW50IGZvciB1cC10by1kYXRlIGFjY3VyYWN5Pw0KDQpU
aGUgbmV3IGRyaXZlciBzcGktZnNsLXFzcGkuYyBpcyBub3QgYSBTUEkgTk9SIGNvbnRyb2xsZXIg
ZHJpdmVyIA0KYW55bW9yZS4gSXQgaXMgbm93IGEgU1BJIGNvbnRyb2xsZXIgZHJpdmVyIHRoYXQg
dXNlcyB0aGUgU1BJIE1FTSBBUEksIHNvIA0KcmVmZXJlbmNpbmcgaXQgaGVyZSBpcyBvYnNvbGV0
ZS4NCg0KQWN0dWFsbHkgaXQgc2VlbXMgbGlrZSB0aGUgd2hvbGUgZmlsZSBpcyBvYnNvbGV0ZSBh
bmQgbmVlZHMgdG8gYmUgDQpyZW1vdmVkIG9yIHJlcGxhY2VkIGJ5IHByb3BlciBkb2N1bWVudGF0
aW9uIG9mIHRoZSBTUEkgTUVNIEFQSS4NCg0KQE1haW50YWluZXJzOg0KTWF5YmUgdGhlIGRvY3Mg
dW5kZXIgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL210ZCBzaG91bGQgYmUgb2ZmaWNpYWxseSAN
Cm1haW50YWluZWQgYnkgdGhlIE1URCBzdWJzeXN0ZW0gKGFuZCBhZGRlZCB0byBNQUlOVEFJTkVS
UykuIEFuZCBpZiB0aGVyZSANCndpbGwgYmUgc29tZSBkcml2ZXIgQVBJIGRvY3MgZm9yIFNQSSBN
RU0gaXQgc2hvdWxkIHByb2JhYmx5IGxpdmUgaW4gDQpEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
c3BpIGluc3RlYWQgb2YgRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL210ZCwgYXMgDQpzcGktbWVt
LmMgaXRzZWxmIGlzIGluIGRyaXZlcnMvc3BpLg0KDQpSZWdhcmRzLA0KRnJpZWRlcg0KDQo+IA0K
PiBUaGFua3MsDQo+IEpvaG4NCj4gDQo+PiBAQCAtNTksNyArNTksNyBAQCBQYXJ0IElJSSAtIEhv
dyBjYW4gZHJpdmVycyB1c2UgdGhlIGZyYW1ld29yaz8NCj4+DQo+PiDCoFRoZSBtYWluIEFQSSBp
cyBzcGlfbm9yX3NjYW4oKS4gQmVmb3JlIHlvdSBjYWxsIHRoZSBob29rLCBhIGRyaXZlciANCj4+
IHNob3VsZA0KPj4gwqBpbml0aWFsaXplIHRoZSBuZWNlc3NhcnkgZmllbGRzIGZvciBzcGlfbm9y
e30uIFBsZWFzZSBzZWUNCj4+IC1kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYyBmb3IgZGV0
YWlsLiBQbGVhc2UgYWxzbyByZWZlciB0byANCj4+IGZzbC1xdWFkc3BpLmMNCj4+ICtkcml2ZXJz
L210ZC9zcGktbm9yL3NwaS1ub3IuYyBmb3IgZGV0YWlsLiBQbGVhc2UgYWxzbyByZWZlciB0byAN
Cj4+IHNwaS1mc2wtcXNwaS5jDQo+PiDCoHdoZW4geW91IHdhbnQgdG8gd3JpdGUgYSBuZXcgZHJp
dmVyIGZvciBhIFNQSSBOT1IgY29udHJvbGxlci4NCj4+IMKgQW5vdGhlciBBUEkgaXMgc3BpX25v
cl9yZXN0b3JlKCksIHRoaXMgaXMgdXNlZCB0byByZXN0b3JlIHRoZSBzdGF0dXMgDQo+PiBvZiBT
UEkNCj4+IMKgZmxhc2ggY2hpcCBzdWNoIGFzIGFkZHJlc3NpbmcgbW9kZS4gQ2FsbCBpdCB3aGVu
ZXZlciBkZXRhY2ggdGhlIA0KPj4gZHJpdmVyIGZyb20NCj4+DQo+IA0KPiANCj4gDQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
