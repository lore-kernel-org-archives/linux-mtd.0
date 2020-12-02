Return-Path: <SRS0=vKR5=FG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C58CC64E7C
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 07:49:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C4C22206
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Dec 2020 07:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C4C22206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date:Subject:To:
	From:Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wBWYP5lR40VeJM10TwVDGlqcRb9x4gIojS4cxlJXWnA=; b=iQqJqeJ7i8vxF4wuJabb89VtAk
	QdzlW/DuMMEQel3gongvROGOwpM9xsYe2rHFApsZAhuDRJkIZbYkDKJGmhFfAJWqRGrhKqaIwGX4r
	VoYo30q4xmFWY81OEV/JyH+Ef5fkEgUGqwIYpz6sHkBXDhx7nhI8Mai/dYsWiZ/mlnaNtoNcPVBp7
	d1p26ajLoaXyo5KLEIgaD6DkG9AYdJnZgiJk9nFkalChoVSZ24cfLmTeFBp7iy7W6GaJMjpVWNHQC
	kZDfWplJ1xSb6Buf4Gb7l4rkZZxJS10ZXdDsOSwCX1WNeOxk1mKkYN4hoTkZmCikT3QBi0EnN68ML
	mwt+uE5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkMrt-0000ss-07; Wed, 02 Dec 2020 07:48:05 +0000
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkMrh-0000rw-Vo
 for linux-mtd@lists.infradead.org; Wed, 02 Dec 2020 07:47:57 +0000
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1ADBE806A8;
 Wed,  2 Dec 2020 20:47:37 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1606895257;
 bh=AuXGsOMtCh7j+a36U+iI+JeKbjX9dvb0tKRkNVEYSPA=;
 h=From:To:CC:Subject:Date;
 b=UwUfgcdOZQjBOEyD/ENgxd6u5Fb82x8lMzT8Ha7tYZnAHFUe+yZe5eL1gvLXmSonk
 1UxK80ZXT1XEbQc8uQQ6moO/L3hc+fs4hoYbRu/4RotmFMJ9kCtwav+YtzXenlmXUm
 tca7zy6pMJtACYIDGKdyeDszqCi73peoJP8irvFbNZLBTiQBtYWAxj2LduuUcle4Ih
 sFUAXhkq5LLm+toBsWm0tQERifFwwudszq4ok57l1itthCiYvRlCWAMtFx9CUaE0/6
 TCwLeVejF3o8AiCR0Wv6kCfag8OGgWP89Ixvu+ZfZv40I1Z0u0ESgMH+kOHEpbO+j6
 ihmAgm84G9QaA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5fc746950000>; Wed, 02 Dec 2020 20:47:38 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 2 Dec 2020 20:47:32 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.008; Wed, 2 Dec 2020 20:47:32 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Miquel Raynal <miquel.raynal@bootlin.com>, "richard@nod.at"
 <richard@nod.at>, Vignesh R <vigneshr@ti.com>,
 "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>
Subject: orion-nand: uncorrectable ECC error on v5.10-rc6
Thread-Topic: orion-nand: uncorrectable ECC error on v5.10-rc6
Thread-Index: AQHWyH9kSvWxPQlVykS9VucKPTkBSw==
Date: Wed, 2 Dec 2020 07:47:32 +0000
Message-ID: <d88ccac1-801c-f30a-097a-331d49956a9c@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-ID: <64D775DB3CF2C04D850568D8EFEA254C@atlnz.lc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_024754_712779_5FEA176E 
X-CRM114-Status: GOOD (  25.51  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksDQoNCkkndmUganVzdCBib290ZWQgdjUuMTAtcmM2IG9uIGEga2lya3dvb2QgYmFzZWQgYm9h
cmQgKHdoaWNoIHVzZXMgdGhlIA0Kb3Jpb24tbmFuZCBkcml2ZXIpIGFuZCBJIGdldCB0aGUgZm9s
bG93aW5nIGVycm9ycyByZXBvcnRlZC4gSSBoYXZlbid0IA0Kc3RhcnRlZCBiaXNlY3RpbmcgeWV0
IGJ1dCB2NS43LjE5IG1vdW50cyB0aGUgbmFuZCBmbGFzaCB3aXRob3V0IGFueSBpc3N1ZS4NCg0K
dWJpMDogYXR0YWNoaW5nIG10ZDANCl9fbmFuZF9jb3JyZWN0X2RhdGE6IHVuY29ycmVjdGFibGUg
RUNDIGVycm9yDQp1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAtNzQgKEVDQyBlcnJv
cikgd2hpbGUgcmVhZGluZyA2NCBieXRlcyANCmZyb20gUEVCIDA6MCwgcmVhZCBvbmx5IDY0IGJ5
dGVzLCByZXRyeQ0KX19uYW5kX2NvcnJlY3RfZGF0YTogdW5jb3JyZWN0YWJsZSBFQ0MgZXJyb3IN
CnViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC03NCAoRUNDIGVycm9yKSB3aGlsZSBy
ZWFkaW5nIDY0IGJ5dGVzIA0KZnJvbSBQRUIgMDowLCByZWFkIG9ubHkgNjQgYnl0ZXMsIHJldHJ5
DQpfX25hbmRfY29ycmVjdF9kYXRhOiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcg0KdWJpMCB3YXJu
aW5nOiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjQg
Ynl0ZXMgDQpmcm9tIFBFQiAwOjAsIHJlYWQgb25seSA2NCBieXRlcywgcmV0cnkNCl9fbmFuZF9j
b3JyZWN0X2RhdGE6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yDQp1YmkwIGVycm9yOiB1YmlfaW9f
cmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgNjQgYnl0ZXMgDQpmcm9t
IFBFQiAwOjAsIHJlYWQgNjQgYnl0ZXMNCkNQVTogMCBQSUQ6IDEwMSBDb21tOiB1YmlhdHRhY2gg
Tm90IHRhaW50ZWQgNS4xMC4wLXJjNisgIzENCkhhcmR3YXJlIG5hbWU6IE1hcnZlbGwgS2lya3dv
b2QgKEZsYXR0ZW5lZCBEZXZpY2UgVHJlZSkNCls8ODAxMGNhNjQ+XSAodW53aW5kX2JhY2t0cmFj
ZSkgZnJvbSBbPDgwMTA5YmQwPl0gKHNob3dfc3RhY2srMHgxMC8weDE0KQ0KWzw4MDEwOWJkMD5d
IChzaG93X3N0YWNrKSBmcm9tIFs8ODA0NWYxMGM+XSAodWJpX2lvX3JlYWQrMHgxODQvMHgzMDQp
DQpbPDgwNDVmMTBjPl0gKHViaV9pb19yZWFkKSBmcm9tIFs8ODA0NWY0YWM+XSAodWJpX2lvX3Jl
YWRfZWNfaGRyKzB4NDQvMHgyNDApDQpbPDgwNDVmNGFjPl0gKHViaV9pb19yZWFkX2VjX2hkcikg
ZnJvbSBbPDgwNDY0ZGIwPl0gDQoodWJpX2F0dGFjaCsweDE3OC8weDE1ZmMpDQpbPDgwNDY0ZGIw
Pl0gKHViaV9hdHRhY2gpIGZyb20gWzw4MDQ1OGQ4Yz5dICh1YmlfYXR0YWNoX210ZF9kZXYrMHg1
MzgvMHhiNDgpDQpbPDgwNDU4ZDhjPl0gKHViaV9hdHRhY2hfbXRkX2RldikgZnJvbSBbPDgwNDVh
MTE0Pl0gDQooY3RybF9jZGV2X2lvY3RsKzB4MTcwLzB4MWUwKQ0KWzw4MDQ1YTExND5dIChjdHJs
X2NkZXZfaW9jdGwpIGZyb20gWzw4MDIwMzA5ND5dIChzeXNfaW9jdGwrMHgxZjgvMHg5OTApDQpb
PDgwMjAzMDk0Pl0gKHN5c19pb2N0bCkgZnJvbSBbPDgwMTAwMDYwPl0gKHJldF9mYXN0X3N5c2Nh
bGwrMHgwLzB4NTApDQpFeGNlcHRpb24gc3RhY2soMHg4NzYzM2ZhOCB0byAweDg3NjMzZmYwKQ0K
M2ZhMDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDAwMDAwMDMgN2U5YjBj
MzAgMDAwMDAwMDMgNDAxODZmNDAgN2U5YjBjMzAgDQowMDAwMDAwMA0KM2ZjMDogMDAwMDAwMDMg
N2U5YjBjMzAgMDAwMTQ4ZjggMDAwMDAwMzYgMDAwMTQ3NzAgMDAwMTNmOTAgNzZmM2RmYTQgDQow
MDAwMDAwMA0KM2ZlMDogNzZlOTM2ZjAgN2U5YjBjMWMgMDAwMTFmNjggNzZlOTM2ZmMNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBN
VEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
