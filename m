Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907FCC64E8A
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 09:32:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2CDE20C56
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2CDE20C56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6PRnaV+6aSZG+wmwfFxY3TXCtJdg0i+VWEDXbybqApg=; b=EfBb1yHt+++TtH5XYfj8aFvAI
	JPpSqhU+6YdcsWIGSxHk1IUZkPbCbdgcBX1UdTnfkw1FKJd6MHuXoK86JVjku8YmBoH8EcwxIXosZ
	b3jQWWVjvV7kOKoZFnWB6UAHYGuM4lu87b99i8kXQnlPM8eUatzONFM6oi3zqcua44lduXjjyeshO
	lFq+cw46gUTgKd+pBK62FdL8TuXcF4bEpNeRnB3ZkP/m4aa3TnXeC7qyizKgKX2Xv/C4G4rlgAb+3
	0E3x8KpQfSkuIUwCa4cftB7MXDNQ3EUdwmr7n0/YEntUMKAXRK4feUIpvFyLIi8Z/XZlPBkTxA0An
	BuEI96D/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkOTu-0003kp-Nk; Wed, 02 Dec 2020 09:31:26 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkNQ4-0007Fi-T6
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 08:23:36 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BB447806A8;
 Wed,  2 Dec 2020 21:23:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1606897399;
 bh=beeQ02J/91Q8SvPWNaYFI5YtdQjeNTNUITrlsPlbV9g=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=D0Ky2oWqR0PQtCq11rHRKj2GBAjnlAbIPwZtx/Ivs7OgxGlPMgPHWPgsOsVheTx03
 fpx8nvPaNhMt+UUj7pJMrmZNu2nUy17D3jKR4Z7d1HGGJlmRj4cbP0XpFnzJ+6kN5a
 6LBMEvWt5jgjNGOPtI0BJIZD70zj1ui5hLFlWHT7kgfFZhJQJiGWB8YTGKZTgh4Vk0
 /MsIc1MeePuRsxIxeLDzZv7g7QFgBK3slz57oFQ4QQk3KkVMC6Z9sNzXvFllZnOGcM
 wP4ZLatZkFkl1RdrXAsgIbsox+HF+s8DgxX47IuZbAvo0I1JzWz/Pi7+Fy9ZXbKcia
 fQBYse734mJMQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5fc74ef20000>; Wed, 02 Dec 2020 21:23:19 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 2 Dec 2020 21:23:14 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.008; Wed, 2 Dec 2020 21:23:14 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: orion-nand: uncorrectable ECC error on v5.10-rc6
Thread-Topic: orion-nand: uncorrectable ECC error on v5.10-rc6
Thread-Index: AQHWyH9kSvWxPQlVykS9VucKPTkBS6nil0gAgAAGi4A=
Date: Wed, 2 Dec 2020 08:23:13 +0000
Message-ID: <79a69fe8-551b-6cfb-0505-37178ee5a0ec@alliedtelesis.co.nz>
References: <d88ccac1-801c-f30a-097a-331d49956a9c@alliedtelesis.co.nz>
 <20201202085948.038efb3e@xps13>
In-Reply-To: <20201202085948.038efb3e@xps13>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-ID: <164A6945469AC742879146C14A57726E@atlnz.lc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_032325_694324_F74E96A6 
X-CRM114-Status: GOOD (  32.75  )
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

SGkgTWlxdWVsLA0KDQpPbiAyLzEyLzIwIDg6NTkgcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6DQo+
IEhpIENocmlzLA0KPg0KPiBDaHJpcyBQYWNraGFtIDxDaHJpcy5QYWNraGFtQGFsbGllZHRlbGVz
aXMuY28ubno+IHdyb3RlIG9uIFdlZCwgMiBEZWMNCj4gMjAyMCAwNzo0NzozMiArMDAwMDoNCj4N
Cj4+IEhpLA0KPj4NCj4+IEkndmUganVzdCBib290ZWQgdjUuMTAtcmM2IG9uIGEga2lya3dvb2Qg
YmFzZWQgYm9hcmQgKHdoaWNoIHVzZXMgdGhlDQo+PiBvcmlvbi1uYW5kIGRyaXZlcikgYW5kIEkg
Z2V0IHRoZSBmb2xsb3dpbmcgZXJyb3JzIHJlcG9ydGVkLiBJIGhhdmVuJ3QNCj4+IHN0YXJ0ZWQg
YmlzZWN0aW5nIHlldCBidXQgdjUuNy4xOSBtb3VudHMgdGhlIG5hbmQgZmxhc2ggd2l0aG91dCBh
bnkgaXNzdWUuDQo+Pg0KPj4gdWJpMDogYXR0YWNoaW5nIG10ZDANCj4+IF9fbmFuZF9jb3JyZWN0
X2RhdGE6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yDQo+PiB1YmkwIHdhcm5pbmc6IHViaV9pb19y
ZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2NCBieXRlcw0KPj4gZnJv
bSBQRUIgMDowLCByZWFkIG9ubHkgNjQgYnl0ZXMsIHJldHJ5DQo+PiBfX25hbmRfY29ycmVjdF9k
YXRhOiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcg0KPj4gdWJpMCB3YXJuaW5nOiB1YmlfaW9fcmVh
ZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjQgYnl0ZXMNCj4+IGZyb20g
UEVCIDA6MCwgcmVhZCBvbmx5IDY0IGJ5dGVzLCByZXRyeQ0KPj4gX19uYW5kX2NvcnJlY3RfZGF0
YTogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3INCj4+IHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6
IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDY0IGJ5dGVzDQo+PiBmcm9tIFBF
QiAwOjAsIHJlYWQgb25seSA2NCBieXRlcywgcmV0cnkNCj4+IF9fbmFuZF9jb3JyZWN0X2RhdGE6
IHVuY29ycmVjdGFibGUgRUNDIGVycm9yDQo+PiB1YmkwIGVycm9yOiB1YmlfaW9fcmVhZDogZXJy
b3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjQgYnl0ZXMNCj4+IGZyb20gUEVCIDA6
MCwgcmVhZCA2NCBieXRlcw0KPj4gQ1BVOiAwIFBJRDogMTAxIENvbW06IHViaWF0dGFjaCBOb3Qg
dGFpbnRlZCA1LjEwLjAtcmM2KyAjMQ0KPj4gSGFyZHdhcmUgbmFtZTogTWFydmVsbCBLaXJrd29v
ZCAoRmxhdHRlbmVkIERldmljZSBUcmVlKQ0KPj4gWzw4MDEwY2E2ND5dICh1bndpbmRfYmFja3Ry
YWNlKSBmcm9tIFs8ODAxMDliZDA+XSAoc2hvd19zdGFjaysweDEwLzB4MTQpDQo+PiBbPDgwMTA5
YmQwPl0gKHNob3dfc3RhY2spIGZyb20gWzw4MDQ1ZjEwYz5dICh1YmlfaW9fcmVhZCsweDE4NC8w
eDMwNCkNCj4+IFs8ODA0NWYxMGM+XSAodWJpX2lvX3JlYWQpIGZyb20gWzw4MDQ1ZjRhYz5dICh1
YmlfaW9fcmVhZF9lY19oZHIrMHg0NC8weDI0MCkNCj4+IFs8ODA0NWY0YWM+XSAodWJpX2lvX3Jl
YWRfZWNfaGRyKSBmcm9tIFs8ODA0NjRkYjA+XQ0KPj4gKHViaV9hdHRhY2grMHgxNzgvMHgxNWZj
KQ0KPj4gWzw4MDQ2NGRiMD5dICh1YmlfYXR0YWNoKSBmcm9tIFs8ODA0NThkOGM+XSAodWJpX2F0
dGFjaF9tdGRfZGV2KzB4NTM4LzB4YjQ4KQ0KPj4gWzw4MDQ1OGQ4Yz5dICh1YmlfYXR0YWNoX210
ZF9kZXYpIGZyb20gWzw4MDQ1YTExND5dDQo+PiAoY3RybF9jZGV2X2lvY3RsKzB4MTcwLzB4MWUw
KQ0KPj4gWzw4MDQ1YTExND5dIChjdHJsX2NkZXZfaW9jdGwpIGZyb20gWzw4MDIwMzA5ND5dIChz
eXNfaW9jdGwrMHgxZjgvMHg5OTApDQo+PiBbPDgwMjAzMDk0Pl0gKHN5c19pb2N0bCkgZnJvbSBb
PDgwMTAwMDYwPl0gKHJldF9mYXN0X3N5c2NhbGwrMHgwLzB4NTApDQo+PiBFeGNlcHRpb24gc3Rh
Y2soMHg4NzYzM2ZhOCB0byAweDg3NjMzZmYwKQ0KPj4gM2ZhMDrCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgMDAwMDAwMDMgN2U5YjBjMzAgMDAwMDAwMDMgNDAxODZmNDAgN2U5
YjBjMzANCj4+IDAwMDAwMDAwDQo+PiAzZmMwOiAwMDAwMDAwMyA3ZTliMGMzMCAwMDAxNDhmOCAw
MDAwMDAzNiAwMDAxNDc3MCAwMDAxM2Y5MCA3NmYzZGZhNA0KPj4gMDAwMDAwMDANCj4+IDNmZTA6
IDc2ZTkzNmYwIDdlOWIwYzFjIDAwMDExZjY4IDc2ZTkzNmZjDQo+IEkgcmVjZW50bHkgY29udHJp
YnV0ZWQgYSBwaWxlIG9mIGZpeGVzIHRvIGVuc3VyZSBEVCBwYXJzaW5nIHdhcyBub3QNCj4gYnJv
a2VuIGFuZCB0aGlzIGFwcGxpZXMgdG8gT3Jpb24uIENhbiB5b3UgcGxlYXNlIGNoZWNrDQo+DQo+
IG10ZDogcmF3bmFuZDogb3Jpb246IE1vdmUgdGhlIEVDQyBpbml0aWFsaXphdGlvbiB0byAtPmF0
dGFjaF9jaGlwKCkNClRoYXQgbG9va3MgdG8gYmUgaXQuIEluIExpbnVzJ3MgdHJlZSBjb21taXQg
NzZkYzJiZmMyZTFiICgiTWVyZ2UgdGFnIA0KJ210ZC9maXhlcy1mb3ItNS4xMC1yYzYnIG9mIA0K
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eCIp
IHNlZW1zIHRvIGJlIA0KdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB3b3JraW5nIGFuZCBub3Qgd29y
a2luZy4NCj4gQW5kIHRlbGwgbWUgaWYgeW91IHNlZSBzb21ldGhpbmcgd3JvbmcgdGhlcmU/IEkg
YXNzdW1lZCB0aGlzIGRyaXZlciB3YXMNCj4gbm90IHN1cHBvcnRpbmcgb24gaG9zdCBFQ0MgZW5n
aW5lcyBhbmQgb25seSBzb2Z0IEhhbW1pbmcgd2FzIHVzZWQsIGlzDQo+IHRoaXMgYXNzdW1wdGlv
biB3cm9uZz8NCg0KT3VyIGR0cyBoYXMNCg0KIMKgwqDCoMKgwqDCoMKgIG5hbmQtZWNjLW1vZGUg
PSAic29mdCI7DQogwqDCoMKgwqDCoMKgwqAgbmFuZC1lY2MtYWxnbyA9ICJiY2giOw0KIMKgwqDC
oMKgwqDCoMKgIG5hbmQtb24tZmxhc2gtYmJ0Ow0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
