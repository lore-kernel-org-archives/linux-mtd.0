Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71155C71155
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 19:58:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35272224A
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 19:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35272224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v6ne3b45xayYgIqcu3YkdGlR0LfIXUNTRTFCNFwWk50=; b=wZqoeo+Ll7lyA6JgBd21nmUx+
	1FQswtr6LbtCB8slIYu+Lx4Lnwbpm86wuOA16kkLnyVsGcyVx3Y3vBWds8/jkT1Xy9xIPenPhki0H
	6t/MWo5Mhtn7wZ3OSWmT7Z3K5ivN7ilo8kXpxH8C80dKZ6VraRQ7ncG7IjwK4BZ7JvBylNjFxudvQ
	LqugdYYjBYV4vLGX4yqNPS33MlhbBXPryc7WPs9kUOoQym42q1WpS+8fLUjJ+6uem6bvfRoobcawb
	A95zZqCeKVwo4wRn6DN/SujVXDLvVdnNVvDCD2Z408LBI0MiYn6usHD9ozOw30OvAOmChPPlS2XMO
	T7xdPgMZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkYFk-0005BJ-Vu; Wed, 02 Dec 2020 19:57:29 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkYFh-00059m-8j
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 19:57:27 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3E835806A8;
 Thu,  3 Dec 2020 08:57:16 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1606939036;
 bh=g+EKgvS/Qw5GEwDeO5lUSUvEfVSBOwngd51CsQQDpuU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=L0wtOQH0xLOFRI3//kzZ4iykKbb3MV9k14ObDCpvgpZ37wXe4wFB4X7fF8/p7BXMP
 Ssw9sFKTot2DE/ibOOY/exrHLZJfYH7RPHT8MlsI/LZ5UCknOmrV9kohaQcqMetQLj
 1dFztxp5Sc6NJZgyL81DZL7LNM/8qpS6gTUdy5aJx2xmwuXMdiN6MdbqcBztHZLlro
 uNm5cwYdKoAdyVjwofjlfkm4wteonDKAMdeRA9Ib6Ry0xXw3vjSdFTgVxzBf9RtWa1
 4ITziBVER9EwEAJdkg4xcp3F5ge5XTxo64djceM0p1t2VUGQ6YIZxRrfGvygZkWOOl
 tzkEXH7teXUzw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5fc7f19c0000>; Thu, 03 Dec 2020 08:57:16 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 3 Dec 2020 08:57:15 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.008; Thu, 3 Dec 2020 08:57:15 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: orion-nand: uncorrectable ECC error on v5.10-rc6
Thread-Topic: orion-nand: uncorrectable ECC error on v5.10-rc6
Thread-Index: AQHWyH9kSvWxPQlVykS9VucKPTkBS6nil0gAgAAGi4CAAAJxgIAAv3iA
Date: Wed, 2 Dec 2020 19:57:15 +0000
Message-ID: <b896be17-10ab-cc9e-5682-1c3b17b1100b@alliedtelesis.co.nz>
References: <d88ccac1-801c-f30a-097a-331d49956a9c@alliedtelesis.co.nz>
 <20201202085948.038efb3e@xps13>
 <79a69fe8-551b-6cfb-0505-37178ee5a0ec@alliedtelesis.co.nz>
 <20201202093157.4fa6998f@xps13>
In-Reply-To: <20201202093157.4fa6998f@xps13>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-ID: <5C17F3526D952A4D94AF55F236871782@atlnz.lc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_145726_305068_17F8FF7A 
X-CRM114-Status: GOOD (  39.41  )
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
Cc: "richard@nod.at" <richard@nod.at>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vignesh R <vigneshr@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLA0KDQpPbiAyLzEyLzIwIDk6MzEgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6DQo+
IEhpIENocmlzLA0KPg0KPiBDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVz
aXMuY28ubno+IHdyb3RlIG9uIFdlZCwgMiBEZWMNCj4gMjAyMCAwODoyMzoxMyArMDAwMDoNCj4N
Cj4+IEhpIE1pcXVlbCwNCj4+DQo+PiBPbiAyLzEyLzIwIDg6NTkgcG0sIE1pcXVlbCBSYXluYWwg
d3JvdGU6DQo+Pj4gSGkgQ2hyaXMsDQo+Pj4NCj4+PiBDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNr
aGFtQGFsbGllZHRlbGVzaXMuY28ubno+IHdyb3RlIG9uIFdlZCwgMiBEZWMNCj4+PiAyMDIwIDA3
OjQ3OjMyICswMDAwOg0KPj4+ICAgDQo+Pj4+IEhpLA0KPj4+Pg0KPj4+PiBJJ3ZlIGp1c3QgYm9v
dGVkIHY1LjEwLXJjNiBvbiBhIGtpcmt3b29kIGJhc2VkIGJvYXJkICh3aGljaCB1c2VzIHRoZQ0K
Pj4+PiBvcmlvbi1uYW5kIGRyaXZlcikgYW5kIEkgZ2V0IHRoZSBmb2xsb3dpbmcgZXJyb3JzIHJl
cG9ydGVkLiBJIGhhdmVuJ3QNCj4+Pj4gc3RhcnRlZCBiaXNlY3RpbmcgeWV0IGJ1dCB2NS43LjE5
IG1vdW50cyB0aGUgbmFuZCBmbGFzaCB3aXRob3V0IGFueSBpc3N1ZS4NCj4+Pj4NCj4+Pj4gdWJp
MDogYXR0YWNoaW5nIG10ZDANCj4+Pj4gX19uYW5kX2NvcnJlY3RfZGF0YTogdW5jb3JyZWN0YWJs
ZSBFQ0MgZXJyb3INCj4+Pj4gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChF
Q0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjQgYnl0ZXMNCj4+Pj4gZnJvbSBQRUIgMDowLCByZWFk
IG9ubHkgNjQgYnl0ZXMsIHJldHJ5DQo+Pj4+IF9fbmFuZF9jb3JyZWN0X2RhdGE6IHVuY29ycmVj
dGFibGUgRUNDIGVycm9yDQo+Pj4+IHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC03
NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDY0IGJ5dGVzDQo+Pj4+IGZyb20gUEVCIDA6MCwg
cmVhZCBvbmx5IDY0IGJ5dGVzLCByZXRyeQ0KPj4+PiBfX25hbmRfY29ycmVjdF9kYXRhOiB1bmNv
cnJlY3RhYmxlIEVDQyBlcnJvcg0KPj4+PiB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJv
ciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2NCBieXRlcw0KPj4+PiBmcm9tIFBFQiAw
OjAsIHJlYWQgb25seSA2NCBieXRlcywgcmV0cnkNCj4+Pj4gX19uYW5kX2NvcnJlY3RfZGF0YTog
dW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3INCj4+Pj4gdWJpMCBlcnJvcjogdWJpX2lvX3JlYWQ6IGVy
cm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDY0IGJ5dGVzDQo+Pj4+IGZyb20gUEVC
IDA6MCwgcmVhZCA2NCBieXRlcw0KPj4+PiBDUFU6IDAgUElEOiAxMDEgQ29tbTogdWJpYXR0YWNo
IE5vdCB0YWludGVkIDUuMTAuMC1yYzYrICMxDQo+Pj4+IEhhcmR3YXJlIG5hbWU6IE1hcnZlbGwg
S2lya3dvb2QgKEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSkNCj4+Pj4gWzw4MDEwY2E2ND5dICh1bndp
bmRfYmFja3RyYWNlKSBmcm9tIFs8ODAxMDliZDA+XSAoc2hvd19zdGFjaysweDEwLzB4MTQpDQo+
Pj4+IFs8ODAxMDliZDA+XSAoc2hvd19zdGFjaykgZnJvbSBbPDgwNDVmMTBjPl0gKHViaV9pb19y
ZWFkKzB4MTg0LzB4MzA0KQ0KPj4+PiBbPDgwNDVmMTBjPl0gKHViaV9pb19yZWFkKSBmcm9tIFs8
ODA0NWY0YWM+XSAodWJpX2lvX3JlYWRfZWNfaGRyKzB4NDQvMHgyNDApDQo+Pj4+IFs8ODA0NWY0
YWM+XSAodWJpX2lvX3JlYWRfZWNfaGRyKSBmcm9tIFs8ODA0NjRkYjA+XQ0KPj4+PiAodWJpX2F0
dGFjaCsweDE3OC8weDE1ZmMpDQo+Pj4+IFs8ODA0NjRkYjA+XSAodWJpX2F0dGFjaCkgZnJvbSBb
PDgwNDU4ZDhjPl0gKHViaV9hdHRhY2hfbXRkX2RldisweDUzOC8weGI0OCkNCj4+Pj4gWzw4MDQ1
OGQ4Yz5dICh1YmlfYXR0YWNoX210ZF9kZXYpIGZyb20gWzw4MDQ1YTExND5dDQo+Pj4+IChjdHJs
X2NkZXZfaW9jdGwrMHgxNzAvMHgxZTApDQo+Pj4+IFs8ODA0NWExMTQ+XSAoY3RybF9jZGV2X2lv
Y3RsKSBmcm9tIFs8ODAyMDMwOTQ+XSAoc3lzX2lvY3RsKzB4MWY4LzB4OTkwKQ0KPj4+PiBbPDgw
MjAzMDk0Pl0gKHN5c19pb2N0bCkgZnJvbSBbPDgwMTAwMDYwPl0gKHJldF9mYXN0X3N5c2NhbGwr
MHgwLzB4NTApDQo+Pj4+IEV4Y2VwdGlvbiBzdGFjaygweDg3NjMzZmE4IHRvIDB4ODc2MzNmZjAp
DQo+Pj4+IDNmYTA6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAwMDAwMDAz
IDdlOWIwYzMwIDAwMDAwMDAzIDQwMTg2ZjQwIDdlOWIwYzMwDQo+Pj4+IDAwMDAwMDAwDQo+Pj4+
IDNmYzA6IDAwMDAwMDAzIDdlOWIwYzMwIDAwMDE0OGY4IDAwMDAwMDM2IDAwMDE0NzcwIDAwMDEz
ZjkwIDc2ZjNkZmE0DQo+Pj4+IDAwMDAwMDAwDQo+Pj4+IDNmZTA6IDc2ZTkzNmYwIDdlOWIwYzFj
IDAwMDExZjY4IDc2ZTkzNmZjDQo+Pj4gSSByZWNlbnRseSBjb250cmlidXRlZCBhIHBpbGUgb2Yg
Zml4ZXMgdG8gZW5zdXJlIERUIHBhcnNpbmcgd2FzIG5vdA0KPj4+IGJyb2tlbiBhbmQgdGhpcyBh
cHBsaWVzIHRvIE9yaW9uLiBDYW4geW91IHBsZWFzZSBjaGVjaw0KPj4+DQo+Pj4gbXRkOiByYXdu
YW5kOiBvcmlvbjogTW92ZSB0aGUgRUNDIGluaXRpYWxpemF0aW9uIHRvIC0+YXR0YWNoX2NoaXAo
KQ0KPj4gVGhhdCBsb29rcyB0byBiZSBpdC4gSW4gTGludXMncyB0cmVlIGNvbW1pdCA3NmRjMmJm
YzJlMWIgKCJNZXJnZSB0YWcNCj4+ICdtdGQvZml4ZXMtZm9yLTUuMTAtcmM2JyBvZg0KPj4gZ2l0
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eCIpIHNl
ZW1zIHRvIGJlDQo+PiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHdvcmtpbmcgYW5kIG5vdCB3b3Jr
aW5nLg0KPj4+IEFuZCB0ZWxsIG1lIGlmIHlvdSBzZWUgc29tZXRoaW5nIHdyb25nIHRoZXJlPyBJ
IGFzc3VtZWQgdGhpcyBkcml2ZXIgd2FzDQo+Pj4gbm90IHN1cHBvcnRpbmcgb24gaG9zdCBFQ0Mg
ZW5naW5lcyBhbmQgb25seSBzb2Z0IEhhbW1pbmcgd2FzIHVzZWQsIGlzDQo+Pj4gdGhpcyBhc3N1
bXB0aW9uIHdyb25nPw0KPj4gT3VyIGR0cyBoYXMNCj4+DQo+PiAgIMKgwqDCoMKgwqDCoMKgIG5h
bmQtZWNjLW1vZGUgPSAic29mdCI7DQo+PiAgIMKgwqDCoMKgwqDCoMKgIG5hbmQtZWNjLWFsZ28g
PSAiYmNoIjsNCj4+ICAgwqDCoMKgwqDCoMKgwqAgbmFuZC1vbi1mbGFzaC1iYnQ7DQo+Pg0KPiBJ
IGFzc3VtZWQgSGFtbWluZyB3YXMgdGhlIG9ubHkgcG9zc2libGUgYWxnb3JpdGhtLCB0aGlzIGlz
IHRoZSBlcnJvci4NCj4NCj4gSSBoYXZlIHNldmVyYWwgZHJpdmVycyBpbiB0aGlzIGNhc2UgdGhl
bi4NCj4NCj4gV2UgbmVlZCB0byBkZWZhdWx0IHRvIEhhbW1pbmcgYnV0IGxldCB0aGUgdXNlciBk
ZWNpZGUgdGhlbi4gQ2FuIHlvdSB0cnkNCj4gc29tZXRoaW5nIGxpa2UgdGhlIGJlbG93IGNoYW5n
ZSBwbGVhc2U/DQo+DQo+DQo+IFRoYW5rcywNCj4gTWlxdcOobA0KPg0KPg0KPiAtLS04PC0tLQ0K
Pg0KPiBBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQo+
IERhdGU6ICAgV2VkIERlYyAyIDA5OjMxOjE0IDIwMjAgKzAxMDANCj4NCj4gICAgICBtdGQ6IHJh
d25hbmQ6IG9yaW9uOiBGaXggc29mdCBFQ0MgYWxnbyBzZWxlY3Rpb24NCj4gICAgICANCj4gICAg
ICBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
Pg0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jIGIv
ZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jDQo+IGluZGV4IGUzYmI2NWZkM2FiMi4u
NjYyMTFjOTMxMWQyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9vcmlvbl9u
YW5kLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvb3Jpb25fbmFuZC5jDQo+IEBAIC04
Niw3ICs4Niw5IEBAIHN0YXRpYyB2b2lkIG9yaW9uX25hbmRfcmVhZF9idWYoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCwgdWludDhfdCAqYnVmLCBpbnQgbGVuKQ0KPiAgIHN0YXRpYyBpbnQgb3Jpb25f
bmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwKQ0KPiAgIHsNCj4gICAgICAg
ICAgY2hpcC0+ZWNjLmVuZ2luZV90eXBlID0gTkFORF9FQ0NfRU5HSU5FX1RZUEVfU09GVDsNCj4g
LSAgICAgICBjaGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsNCj4gKw0KPiAr
ICAgICAgIGlmIChjaGlwLT5lY2MuYWxnbyA9PSBOQU5EX0VDQ19BTEdPX1VOS05PV04pDQo+ICsg
ICAgICAgICAgICAgICBjaGlwLT5lY2MuYWxnbyA9IE5BTkRfRUNDX0FMR09fSEFNTUlORzsNCj4g
ICANCj4gICAgICAgICAgcmV0dXJuIDA7DQo+ICAgfQ0KPg0KVGhhbmtzLCB0aGF0IHNlZW1zIHRv
IGhhdmUgZml4ZWQgaXQuDQoNClRlc3RlZC1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hh
bUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
