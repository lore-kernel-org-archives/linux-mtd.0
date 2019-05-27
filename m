Return-Path: <SRS0=9XVy=T3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8691C07542
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 06:36:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DC682075E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2019 06:36:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F3KgIzur"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DC682075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJhHv/T49BgaGiA8kBljtsuoUy1nGL1W/JYL5ze/mqA=; b=F3KgIzur8SaSKj
	OGqlTqSDD6glvMLa1NyaeFgeaF1oRinNul6HwKPfbFUqaIG4/wZEuJdvYrJj94gLdjj9dsZfNGfDI
	eZiIqoloykoV07k5JEPnSbditqw2U8yK5lsFK0cLXvqVW1xfUrimZvLpatFZmD2LmCdGlx72vWFnk
	9G8R0WfH1a0sUhVYAaAhZwvHShTuRZhxf8f845jQ+NXHHsFR0J+WX80jYQzddQ0PZmB3pWtDxjCtM
	E51Ikl/+RfvA3iyqADuJ0azfRFtFFxSuf8c1aPnc8tBV4axZre7vIAiUaZnecyTEPUZruHt8XAHAI
	5upLcfa9byP+0Q7IHUsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hV9Ex-0001jP-1P; Mon, 27 May 2019 06:36:11 +0000
Received: from skedge04.snt-world.com ([91.208.41.69])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hV9Es-0001iM-Vq
 for linux-mtd@lists.infradead.org; Mon, 27 May 2019 06:36:09 +0000
Received: from sntmail10s.snt-is.com (unknown [10.203.32.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge04.snt-world.com (Postfix) with ESMTPS id 9E8A6661163;
 Mon, 27 May 2019 08:35:59 +0200 (CEST)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail10s.snt-is.com
 (10.203.32.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 27 May
 2019 08:35:59 +0200
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1713.004; Mon, 27 May 2019 08:35:59 +0200
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Jeff Kletsky <lede@allycomm.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 3/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
Thread-Topic: [PATCH v4 3/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
Thread-Index: AQHVEOq8ofUdXvC9RUu5vDDV8HwpMaZ4IfUAgAElfICABSIVAA==
Date: Mon, 27 May 2019 06:35:59 +0000
Message-ID: <34004a59-5643-e405-13ca-3581659fc745@kontron.de>
References: <20190522220555.11626-1-lede@allycomm.com>
 <20190522220555.11626-4-lede@allycomm.com>
 <e438022f-3444-9aae-adac-2dd3dd0071b7@kontron.de>
 <e0682730-b69d-d774-d98f-53858e390d8b@allycomm.com>
In-Reply-To: <e0682730-b69d-d774-d98f-53858e390d8b@allycomm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <66800F9B288E7F4BBCB7C047851E6EE1@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 9E8A6661163.AFE1B
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: lede@allycomm.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_233607_349473_9C96398A 
X-CRM114-Status: GOOD (  16.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgSmVmZiwNCg0KT24gMjQuMDUuMTkgMDI6MTIsIEplZmYgS2xldHNreSB3cm90ZToNCj4gKHJl
ZHVjZWQgZGlyZWN0IGFkZHJlc3NlZXMsIHRob3VnaCBzdGlsbCBvbiBsaXN0cykNCj4gDQo+IE9u
IDUvMjIvMTkgMTE6NDIgUE0sIFNjaHJlbXBmIEZyaWVkZXIgd3JvdGU6DQo+IA0KPj4gT24gMjMu
MDUuMTkgMDA6MDUsIEplZmYgS2xldHNreSB3cm90ZToNCj4+PiBGcm9tOiBKZWZmIEtsZXRza3kg
PGdpdC1jb21taXRzQGFsbHljb21tLmNvbT4NCj4+Pg0KPj4+IFRoZSBHaWdhRGV2aWNlIEdENUYx
R1E0VUZ4eEcgU1BJIE5BTkQgaXMgaW4gY3VycmVudCBwcm9kdWN0aW9uIGRldmljZXMNCj4+PiBh
bmQsIHdoaWxlIGl0IGhhcyB0aGUgc2FtZSBsb2dpY2FsIGxheW91dCBhcyB0aGUgRS1zZXJpZXMg
ZGV2aWNlcywNCj4+PiBpdCBkaWZmZXJzIGluIHRoZSBTUEkgaW50ZXJmYWNpbmcgaW4gc2lnbmlm
aWNhbnQgd2F5cy4NCj4+Pg0KPj4+IFRoaXMgc3VwcG9ydCBpcyBjb250aW5nZW50IG9uIHByZXZp
b3VzIGNvbW1pdHMgdG86DQo+Pj4NCj4+PiDCoMKgwqAgKiBBZGQgc3VwcG9ydCBmb3IgdHdvLWJ5
dGUgZGV2aWNlIElEcw0KPj4+IMKgwqDCoCAqIERlZmluZSBtYWNyb3MgZm9yIHBhZ2UtcmVhZCBv
cHMgd2l0aCB0aHJlZS1ieXRlIGFkZHJlc3Nlcw0KPj4+DQo+Pj4gaHR0cDovL3d3dy5naWdhZGV2
aWNlLmNvbS9kYXRhc2hlZXQvZ2Q1ZjFncTR4Znh4Zy8NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6
IEplZmYgS2xldHNreSA8Z2l0LWNvbW1pdHNAYWxseWNvbW0uY29tPg0KPj4gUmV2aWV3ZWQtYnk6
IEZyaWVkZXIgU2NocmVtcGYgPGZyaWVkZXIuc2NocmVtcGZAa29udHJvbi5kZT4NCj4+DQo+Pj4g
UmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPj4gSSBkb250
J3QgdGhpbmsgdGhhdCB0aGlzIFJlcG9ydGVkLWJ5IHRhZyBzaG91bGQgYmUgdXNlZCBoZXJlLiBU
aGUgYm90DQo+PiByZXBvcnRlZCBidWlsZCBlcnJvcnMgY2F1c2VkIGJ5IHlvdXIgcGF0Y2ggYW5k
IHlvdSBmaXhlZCBpdCBpbiBhIG5ldw0KPj4gdmVyc2lvbi4gQXMgZmFyIGFzIEkgdW5kZXJzdGFu
ZCB0aGlzIHRhZywgaXQgcmVmZXJlbmNlcyBzb21lb25lIHdobw0KPj4gcmVwb3J0ZWQgYSBmbGF3
L2J1ZyB0aGF0IGxlZCB0byB0aGlzIGNoYW5nZSBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+PiBUaGUg
dmVyc2lvbiBoaXN0b3J5IG9mIHRoZSBjaGFuZ2VzIHdvbid0IGJlIHZpc2libGUgaW4gdGhlIGdp
dCBoaXN0b3J5DQo+PiBsYXRlciwgYnV0IHRoZSB0YWcgd2lsbCBiZSBhbmQgd291bGQgYmUgcmF0
aGVyIGNvbmZ1c2luZy4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBwYXRpZW5jZSBhbmQgZXhw
bGFuYXRpb25zLiBJJ3ZlIGJlZW4gYmVpbmcgY29uc2VydmF0aXZlDQo+IGFzIEknbSBub3QgYSAi
c2Vhc29uZWQsIExpbnV4IHByb2Zlc3Npb25hbCIgYW5kIGFtIHN0aWxsIGdldHRpbmcgbXkNCj4g
Z2l0IHNlbmQtZW1haWwgY29uZmlnIC8gY29tbWFuZCBsaW5lIGZvciBMaW51eCBwcm9wZXJseSBz
dHJhaWdodGVuZWQgb3V0Lg0KDQpCZWluZyBjb25zZXJ2YXRpdmUgaW4gc3VjaCBjYXNlcyBpcyBu
b3QgYSBmYXVsdCBhdCBhbGwuIEknbSBub3QgYW4gDQpleHBlcnQgZWl0aGVyLiBJJ20ganVzdCBy
ZWNvbW1lbmRpbmcgd2hhdCBJIHRoaW5rIG1pZ2h0IGJlIHRoZSAiY29ycmVjdCIgDQp3YXkgdG8g
ZG8gaXQuDQoNCj4gU2hvdWxkIEkgc2VuZCBhbm90aGVyIHBhdGNoIHNldCB3aXRoIHRoZSBga2J1
aWxkLi4uYCB0YWcgcmVtb3ZlZCwNCj4gb3Igd291bGQgaXQgYmUgcmVtb3ZlZCBpbiB0aGUgcHJv
Y2VzcyBvZiBhbiBhcHByb3ByaWF0ZSBtZW1iZXINCj4gb2YgdGhlIExpbnV4IE1URCB0ZWFtIGFk
ZGluZyB0aGVpciB0YWcgZm9yIGFwcHJvdmFsLCBpZiBhbmQgd2hlbg0KPiB0aGF0IGhhcHBlbnM/
DQoNCkkgZG9uJ3QgdGhpbmsgdGhhdCdzIG5lY2Vzc2FyeS4gTWlxdcOobCBpcyB0aGUgb25lIHRv
IHBpY2sgdXAgdGhlIHBhdGNoLCANCnNvIGhlIGNvdWxkIHByb2JhYmx5IGRyb3AgdGhlICJSZXBv
cnRlZC1ieToga2J1aWxkIiB3aGVuIGhlIGFwcGxpZXMgaXQuDQoNClJlZ2FyZHMsDQpGcmllZGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
