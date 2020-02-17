Return-Path: <SRS0=B4Yk=4F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB4FC761A3
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8701207FD
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Feb 2020 11:30:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yx9zOcPy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8701207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcTkFnBc698r0C4S7DiVUVBhlUpHNgYawoxeMcxastA=; b=Yx9zOcPy4dvT9L
	r/HQjydYOrSEZLJ6SsoQF0/SZpTAXdRtHkdSVqj8PfGckQMg+8Yxt7eTE+n6sP2y8iFvMdHov79xz
	1n3jdSHE+YsGRh3BWgZLdkq8i674Iqsv2Q2F//RJGmbgU98bzfly8TnG+P3B9xVZUi6vPE4DFsLj5
	8scQGrxj5Z6PK+bEN+/wP+XzguzH1qiSxE5/rNFnRCrJXbXshgDGjW2Kq50HN5dBzWfBKrrcTCL5l
	3/FCq41dAKqmNdKqYdQMaI6+9USwWvo5StEYih2jBS9C0fuBu2Wc/KVPTU4wT4OLOq5Lg4h2lXfVL
	IB7eFP2hZ0yhH1xhy2bQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3eb7-0005iA-MG; Mon, 17 Feb 2020 11:29:57 +0000
Received: from skedge03.snt-world.com ([91.208.41.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3eb4-0005X1-8a
 for linux-mtd@lists.infradead.org; Mon, 17 Feb 2020 11:29:56 +0000
Received: from sntmail14r.snt-is.com (unknown [10.203.32.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by skedge03.snt-world.com (Postfix) with ESMTPS id 4836B67A903;
 Mon, 17 Feb 2020 12:29:51 +0100 (CET)
Received: from sntmail12r.snt-is.com (10.203.32.182) by sntmail14r.snt-is.com
 (10.203.32.184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Mon, 17 Feb
 2020 12:29:50 +0100
Received: from sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305]) by
 sntmail12r.snt-is.com ([fe80::e551:8750:7bba:3305%3]) with mapi id
 15.01.1913.005; Mon, 17 Feb 2020 12:29:50 +0100
From: Schrempf Frieder <frieder.schrempf@kontron.de>
To: Boris Brezillon <boris.brezillon@collabora.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish before
 writing a bad block marker
Thread-Topic: [PATCH 3/3] mtd: spinand: Wait for the erase op to finish before
 writing a bad block marker
Thread-Index: AQHV4PlTblnHiLQcV0asTsn4OWAZ0KgfKk6AgAAJswCAAARqAA==
Date: Mon, 17 Feb 2020 11:29:50 +0000
Message-ID: <a07e8ef7-3d04-482f-f50c-f5f2660a9891@kontron.de>
References: <20200211163452.25442-1-frieder.schrempf@kontron.de>
 <20200211163452.25442-4-frieder.schrempf@kontron.de>
 <20200217113919.0508acc4@xps13> <20200217121402.44e00350@collabora.com>
In-Reply-To: <20200217121402.44e00350@collabora.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.9.193]
x-c2processedorg: 51b406b7-48a2-4d03-b652-521f56ac89f3
Content-ID: <E7A33985B34AB94C89F808FA7FF78595@snt-world.com>
MIME-Version: 1.0
X-SnT-MailScanner-Information: Please contact the ISP for more information
X-SnT-MailScanner-ID: 4836B67A903.A0769
X-SnT-MailScanner: Not scanned: please contact your Internet E-Mail Service
 Provider for details
X-SnT-MailScanner-SpamCheck: 
X-SnT-MailScanner-From: frieder.schrempf@kontron.de
X-SnT-MailScanner-To: bbrezillon@kernel.org, boris.brezillon@collabora.com,
 git-commits@allycomm.com, liaoweixiong@allwinnertech.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_032954_624035_4FA18E0B 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, Richard
 Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jeff Kletsky <git-commits@allycomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgQm9yaXMsDQoNCk9uIDE3LjAyLjIwIDEyOjE0LCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6DQo+
IE9uIE1vbiwgMTcgRmViIDIwMjAgMTE6Mzk6MTkgKzAxMDANCj4gTWlxdWVsIFJheW5hbCA8bWlx
dWVsLnJheW5hbEBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPj4gSGkgRnJpZWRlciwNCj4+DQo+
PiBTY2hyZW1wZiBGcmllZGVyIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+IHdyb3RlIG9u
IFR1ZSwgMTEgRmViDQo+PiAyMDIwIDE2OjM1OjUzICswMDAwOg0KPj4NCj4+PiBGcm9tOiBGcmll
ZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtvbnRyb24uZGU+DQo+Pj4NCj4+PiBDdXJy
ZW50bHkgd2hlbiBtYXJraW5nIGEgYmxvY2ssIHdlIHVzZSBzcGluYW5kX2VyYXNlX29wKCkgdG8g
ZXJhc2UNCj4+PiB0aGUgYmxvY2sgYmVmb3JlIHdyaXRpbmcgdGhlIG1hcmtlciB0byB0aGUgT09C
IGFyZWEgd2l0aG91dCB3YWl0aW5nDQo+Pj4gZm9yIHRoZSBvcGVyYXRpb24gdG8gc3VjY2VlZC4g
VGhpcyBjYW4gbGVhZCB0byB0aGUgbWFya2luZyBmYWlsaW5nDQo+Pj4gc2lsZW50bHkgYW5kIG5v
IGJhZCBibG9jayBtYXJrZXIgYmVpbmcgd3JpdHRlbiB0byB0aGUgZmxhc2guDQo+Pj4NCj4+PiBU
byBmaXggdGhpcyB3ZSByZXVzZSB0aGUgc3BpbmFuZF9lcmFzZSgpIGZ1bmN0aW9uLCB0aGF0IGFs
cmVhZHkgZG9lcw0KPj4+IGV2ZXJ5dGhpbmcgd2UgbmVlZCB0byBkbyBiZWZvcmUgYWN0dWFsbHkg
d3JpdGluZyB0aGUgbWFya2VyLg0KPj4+ICAgIA0KPj4NCj4+IFRoYW5rcyBhIGxvdCBmb3IgdGhp
cyBzZXJpZXMhDQo+Pg0KPj4gWWV0IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIHBvaW50
IG9mIHdhaXRpbmcgZm9yIHRoZSBlcmFzdXJlIGlmDQo+PiBpdCBmYWlsZWQ6IHdlIGRvbid0IHJl
YWxseSBjYXJlIGFzIHByb2dyYW1taW5nICgxIC0+IDApIGNlbGxzIGlzIGFsd2F5cw0KPj4gcG9z
c2libGUuIEFyZSB5b3Ugc3VyZSB0aGlzIGxlYWQgdG8gYW4gZXJyb3I/DQo+IA0KPiBBY3R1YWxs
eSwgSSB0aGluayBJIGFscmVhZHkgcG9pbnRlZCBvdXQgdGhhdCB3ZSBzaG91bGQgcHJvYmFibHkg
d3JpdGUNCj4gdGhlIEJCTSB3aXRob3V0IGVyYXNpbmcgdGhlIGJsb2NrLiBJSVJDLCB0aGlzIGxv
Z2ljIGhhcyBiZWVuIGNvcGllZA0KPiBmcm9tIHJhd25hbmQgd2hlcmUgc29tZSBjb250cm9sbGVy
cyBkb24ndCBkaXNhYmxlIHRoZSBFQ0MgZW5naW5lIHdoZW4NCj4gZG9pbmcgcmF3IGFjY2Vzc2Vz
LCBsZWFkaW5nIHRvIEVDQyBlcnJvcnMgaWYgdGhlIGJsb2NrIGlzIG5vdCBlcmFzZWQNCj4gYmVm
b3JlIEJCTXMgYXJlIHByb2dyYW1tZWQuIEFzc3VtaW5nIHdlIGRvbid0IGxldCBzdWNoIGRyaXZl
cnMgYmVpbmcNCj4gbWVyZ2VkIGluIHNwaW5hbmQsIHRoaXMgZXJhc2Ugb3BlcmF0aW9uIGNhbiBi
ZSBkcm9wcGVkLg0KDQpZb3UncmUgcHJvYmFibHkgcmlnaHQsIHdlIGNvdWxkIGFsc28ganVzdCB3
cml0ZSB0aGUgQkJNIHdpdGhvdXQgZXJhc2luZyANCnRoZSBibG9jay4gSSB3aWxsIHRyeSBpZiB0
aGlzIHdvcmtzIGluIG15IHNldHVwIGFuZCB1cGRhdGUgdGhlIHBhdGNoLg0KDQo+IA0KPj4NCj4+
IEFsc28sIHdoeSBqdXN0IG5vdCBjYWxsaW5nIHNwaW5hbmRfZXJhc2UoKSBpbnN0ZWFkIG9mDQo+
PiBzcGluYW5kX2VyYXNlX29wKCkgZnJvbSBzcGluYW5kX21hcmtiYWQoKT8NCj4+DQo+Pj4gRml4
ZXM6IDc1MjlkZjQ2NTI0OCAoIm10ZDogbmFuZDogQWRkIGNvcmUgaW5mcmFzdHJ1Y3R1cmUgdG8g
c3VwcG9ydCBTUEkgTkFORHMiKQ0KPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+Pj4g
U2lnbmVkLW9mZi1ieTogRnJpZWRlciBTY2hyZW1wZiA8ZnJpZWRlci5zY2hyZW1wZkBrb250cm9u
LmRlPg0KPj4+IC0tLQ0KPj4+ICAgZHJpdmVycy9tdGQvbmFuZC9zcGkvY29yZS5jIHwgNTYgKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUu
Yw0KPj4+IGluZGV4IDkyNWRiNjI2OTg2MS4uOGE2OWQxMzYzOWUyIDEwMDY0NA0KPj4+IC0tLSBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL2NvcmUuYw0KPj4+ICsrKyBiL2RyaXZlcnMvbXRkL25hbmQv
c3BpL2NvcmUuYw0KPj4+IEBAIC02MDAsNiArNjAwLDMyIEBAIHN0YXRpYyBpbnQgc3BpbmFuZF9t
dGRfYmxvY2tfaXNiYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZmZzKQ0KPj4+ICAg
CXJldHVybiByZXQ7DQo+Pj4gICB9DQo+Pj4gICANCj4+PiArc3RhdGljIGludCBfX3NwaW5hbmRf
ZXJhc2Uoc3RydWN0IG5hbmRfZGV2aWNlICpuYW5kLCBjb25zdCBzdHJ1Y3QgbmFuZF9wb3MgKnBv
cywNCj4+PiArCQkJICAgYm9vbCBoYXJkX2ZhaWwpDQo+IA0KPiBJIGhhdGUgdGhvc2UgX18gcHJl
Zml4LiBQbGVhc2UgZmluZCBhIG1vcmUgZGVzY3JpcHRpdmUgbmFtZQ0KPiAoc3BpbmFuZF9lcmFz
ZV9ibG9jaygpIG9yIHNwaW5hbmRfZXJhc2VfYW5kX3dhaXQoKT8pDQoNCkFjdHVhbGx5IEkgd2Fz
IGV4cGVjdGluZyB0aGlzIGNvbW1lbnQgOykNCkFuZCBJIHRvdGFsbHkgYWdyZWUuIEkgd2FzIGp1
c3QgbGF6eSB0byBjb21lIHVwIHdpdGggYSBuYW1lLg0KSWYgd2UgZm9sbG93IHRoZSBhcHByb2Fj
aCB3aXRob3V0IGVyYXNlLCBJIGNhbiBnZXQgcmlkIG9mIHRoaXMgYW55d2F5Lg0KDQpUaGFua3Ms
DQpGcmllZGVyDQoNCj4gDQo+Pj4gK3sNCj4+PiArCXN0cnVjdCBzcGluYW5kX2RldmljZSAqc3Bp
bmFuZCA9IG5hbmRfdG9fc3BpbmFuZChuYW5kKTsNCj4+PiArCXU4IHN0YXR1czsNCj4+PiArCWlu
dCByZXQ7DQo+Pj4gKw0KPj4+ICsJcmV0ID0gc3BpbmFuZF9zZWxlY3RfdGFyZ2V0KHNwaW5hbmQs
IHBvcy0+dGFyZ2V0KTsNCj4+PiArCWlmIChyZXQpDQo+Pj4gKwkJcmV0dXJuIHJldDsNCj4+PiAr
DQo+Pj4gKwlyZXQgPSBzcGluYW5kX3dyaXRlX2VuYWJsZV9vcChzcGluYW5kKTsNCj4+PiArCWlm
IChyZXQpDQo+Pj4gKwkJcmV0dXJuIHJldDsNCj4+PiArDQo+Pj4gKwlyZXQgPSBzcGluYW5kX2Vy
YXNlX29wKHNwaW5hbmQsIHBvcyk7DQo+Pj4gKwlpZiAocmV0ICYmIGhhcmRfZmFpbCkNCj4+PiAr
CQlyZXR1cm4gcmV0Ow0KPj4+ICsNCj4+PiArCXJldCA9IHNwaW5hbmRfd2FpdChzcGluYW5kLCAm
c3RhdHVzKTsNCj4+PiArCWlmICghcmV0ICYmIChzdGF0dXMgJiBTVEFUVVNfRVJBU0VfRkFJTEVE
KSkNCj4+PiArCQlyZXQgPSAtRUlPOw0KPj4+ICsNCj4+PiArCXJldHVybiByZXQ7DQo+Pj4gK30N
Cj4+PiArDQo+Pj4gICBzdGF0aWMgaW50IHNwaW5hbmRfbWFya2JhZChzdHJ1Y3QgbmFuZF9kZXZp
Y2UgKm5hbmQsIGNvbnN0IHN0cnVjdCBuYW5kX3BvcyAqcG9zKQ0KPj4+ICAgew0KPj4+ICAgCXN0
cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCA9IG5hbmRfdG9fc3BpbmFuZChuYW5kKTsNCj4+
PiBAQCAtNjE0LDE2ICs2NDAsMTAgQEAgc3RhdGljIGludCBzcGluYW5kX21hcmtiYWQoc3RydWN0
IG5hbmRfZGV2aWNlICpuYW5kLCBjb25zdCBzdHJ1Y3QgbmFuZF9wb3MgKnBvcykNCj4+PiAgIAlp
bnQgcmV0Ow0KPj4+ICAgDQo+Pj4gICAJLyogRXJhc2UgYmxvY2sgYmVmb3JlIG1hcmtpbmcgaXQg
YmFkLiAqLw0KPj4+IC0JcmV0ID0gc3BpbmFuZF9zZWxlY3RfdGFyZ2V0KHNwaW5hbmQsIHBvcy0+
dGFyZ2V0KTsNCj4+PiAtCWlmIChyZXQpDQo+Pj4gLQkJcmV0dXJuIHJldDsNCj4+PiAtDQo+Pj4g
LQlyZXQgPSBzcGluYW5kX3dyaXRlX2VuYWJsZV9vcChzcGluYW5kKTsNCj4+PiArCXJldCA9IF9f
c3BpbmFuZF9lcmFzZShuYW5kLCBwb3MsIGZhbHNlKTsNCj4+PiAgIAlpZiAocmV0KQ0KPj4+ICAg
CQlyZXR1cm4gcmV0Ow0KPj4+ICAgDQo+Pj4gLQlzcGluYW5kX2VyYXNlX29wKHNwaW5hbmQsIHBv
cyk7DQo+Pj4gLQ0KPj4+ICAgCXJldHVybiBzcGluYW5kX3dyaXRlX3BhZ2Uoc3BpbmFuZCwgJnJl
cSk7DQo+Pj4gICB9DQo+Pj4gICANCj4+PiBAQCAtNjQ0LDI3ICs2NjQsNyBAQCBzdGF0aWMgaW50
IHNwaW5hbmRfbXRkX2Jsb2NrX21hcmtiYWQoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBv
ZmZzKQ0KPj4+ICAgDQo+Pj4gICBzdGF0aWMgaW50IHNwaW5hbmRfZXJhc2Uoc3RydWN0IG5hbmRf
ZGV2aWNlICpuYW5kLCBjb25zdCBzdHJ1Y3QgbmFuZF9wb3MgKnBvcykNCj4+PiAgIHsNCj4+PiAt
CXN0cnVjdCBzcGluYW5kX2RldmljZSAqc3BpbmFuZCA9IG5hbmRfdG9fc3BpbmFuZChuYW5kKTsN
Cj4+PiAtCXU4IHN0YXR1czsNCj4+PiAtCWludCByZXQ7DQo+Pj4gLQ0KPj4+IC0JcmV0ID0gc3Bp
bmFuZF9zZWxlY3RfdGFyZ2V0KHNwaW5hbmQsIHBvcy0+dGFyZ2V0KTsNCj4+PiAtCWlmIChyZXQp
DQo+Pj4gLQkJcmV0dXJuIHJldDsNCj4+PiAtDQo+Pj4gLQlyZXQgPSBzcGluYW5kX3dyaXRlX2Vu
YWJsZV9vcChzcGluYW5kKTsNCj4+PiAtCWlmIChyZXQpDQo+Pj4gLQkJcmV0dXJuIHJldDsNCj4+
PiAtDQo+Pj4gLQlyZXQgPSBzcGluYW5kX2VyYXNlX29wKHNwaW5hbmQsIHBvcyk7DQo+Pj4gLQlp
ZiAocmV0KQ0KPj4+IC0JCXJldHVybiByZXQ7DQo+Pj4gLQ0KPj4+IC0JcmV0ID0gc3BpbmFuZF93
YWl0KHNwaW5hbmQsICZzdGF0dXMpOw0KPj4+IC0JaWYgKCFyZXQgJiYgKHN0YXR1cyAmIFNUQVRV
U19FUkFTRV9GQUlMRUQpKQ0KPj4+IC0JCXJldCA9IC1FSU87DQo+Pj4gLQ0KPj4+IC0JcmV0dXJu
IHJldDsNCj4+PiArCXJldHVybiBfX3NwaW5hbmRfZXJhc2UobmFuZCwgcG9zLCB0cnVlKTsNCj4+
PiAgIH0NCj4+PiAgIA0KPj4+ICAgc3RhdGljIGludCBzcGluYW5kX210ZF9lcmFzZShzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwNCj4+DQo+PiBUaGFua3MsDQo+PiBNaXF1w6hsDQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
