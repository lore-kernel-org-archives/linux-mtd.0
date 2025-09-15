Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B1ACAC58E
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Sep 2025 09:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r0Sozhn88/V8F2V4I0+Zjr4xrsAd5Aeb/VAyQkFrotY=; b=wUHOmP132dRQYj
	+JhiJbtgvNYyp7dxzmJp9haozOtb2jDSssq7TJFHjoFPeenWnV9CGUDFUi+Wf4kF2FxybyAV4Y9eY
	n53FTn1+4Hyr5K4WhVUTxBsL5dGcJrSDoVECZxPy50/EN0uyv+281HPsMb3SGIXUeGfBd+TCVmU8I
	DPdCH1K5g/KxOiOYYzxA/ZL1efmeLIRth+gUwF8vLnTO/vxU2C6ly1SGhnZjtPnGH49AKDcJbeC7z
	/HAkwiC4duO4mbAJDkeAT1Fmho2ide8oheszuz1O8F0nhI2T6oDJPJGpqOWL6zxSl5Da+eyhUVRSQ
	ZbjFfXoYs3BAirv6yELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5XV-00000003Tpe-1kNc;
	Mon, 15 Sep 2025 09:30:25 +0000
Received: from mail.inventec.com ([61.220.76.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5XS-00000003TnU-2YGD
	for linux-mtd@lists.infradead.org;
	Mon, 15 Sep 2025 09:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=SEx04; d=inventec.com;
    h=from:to:cc:subject:date:message-id:in-reply-to:content-type:
      mime-version;
    bh=pFg6HfnrKxKVyvxmZ4Rsr97LAuAW8GCGsUDqidRIsY8=;
    b=TmkisrQ8R6pvmNYpwyttUckL9Q7xOEYxUkMMu9jXc8DuIM4JmOKjZk9lWCzuga
      ygbT9ZSbFFtSJ2fFNfTebLs0XxUREbMwFcfMu2ojhKXLh9lOaQ1qsG6iIUfm+7
      d0gAOeR5nZg9XqrtKPJt7ayMO/RenoBReNItc1kslSRS7XT6IfF4MnKMJwiez2
      qnMmtjxcbPt5J+9WkGpqhE/kJxMvvIKimrUh/1GG4Y3N1VqUUgpalFLtComoqr
      xAr3jhknPeybDT2Q0mQ/GZp2r+KTJ8uv00pIA9reoCsnfNi3u5dGDN8eWJs249
      xe1dnxYzTF2B1gQs/BK97HAdo4tzUE+g==
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 15 Sep 2025 17:30:01 +0800
Received: from IEC1-MSE-FE1.inventec.com (10.1.254.203) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Mon, 15 Sep 2025 17:30:01 +0800
Received: from IEC1-EX2016-02.iec.inventec (IEC1-EX2016-02.iec.inventec [10.1.254.221])
	by IEC1-MSE-FE1.inventec.com with ESMTP id 58F9Tt5q082736;
	Mon, 15 Sep 2025 17:29:55 +0800 (GMT-8)
	(envelope-from Kang.Kerry@inventec.com)
Received: from IEC1-EX2016-02.iec.inventec (10.1.254.221) by
 IEC1-EX2016-02.iec.inventec (10.1.254.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 15 Sep 2025 17:29:56 +0800
Received: from IEC1-EX2016-02.iec.inventec ([fe80::25ef:f59e:6733:75ba]) by
 IEC1-EX2016-02.iec.inventec ([fe80::25ef:f59e:6733:75ba%3]) with mapi id
 15.01.2507.057; Mon, 15 Sep 2025 17:29:56 +0800
From: =?utf-8?B?S2FuZy5LZXJyeSDlurflrofoia8gVEFP?= <Kang.Kerry@inventec.com>
To: Pratyush Yadav <pratyush@kernel.org>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: mtd: spi-nor: Add Winbond w25q512jvdtr
Thread-Topic: mtd: spi-nor: Add Winbond w25q512jvdtr
Thread-Index: AQHcImo2pZrtT3WrcUCVoD1JFifbDLSTvwyA
Date: Mon, 15 Sep 2025 09:29:56 +0000
Message-ID: <31265f84726047ebb49b3ea2e7836830@inventec.com>
References: <CAG2w3Fsj6q8buVE+cXSuoTZj9gEP29u+mh6Xm3ryBqAxxRsQyg@mail.gmail.com>
 <mafs0cy7yjon6.fsf@kernel.org>
In-Reply-To: <mafs0cy7yjon6.fsf@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.6.240.141]
MIME-Version: 1.0
X-MAIL: IEC1-MSE-FE1.inventec.com 58F9Tt5q082736
X-TM-SNTS-SMTP: 5FD45C740A39DD0564FC7D617827201A029C85B13DE700C9F6957A6F1FEB4CC62000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_023022_953786_AE49E255 
X-CRM114-Status: GOOD (  21.98  )
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

SGkgUHJhdHl1c2gsDQpJIGNvbmZpZ3VyZWQgdGhlIERUUyB3aXRoICdjb21wYXRpYmxlID0gImpl
ZGVjLHNwaS1ub3IiOycNCmFuZCBlbmFibGVkIHRoZSBrZXJuZWwgb3B0aW9uczoNCkNPTkZJR19N
VERfUEFSVElUSU9ORURfTUFTVEVSPXkNCkNPTkZJR19NVERfU1BJX05PUj15DQoNCkhvd2V2ZXIs
IHRoZSBkbWVzZyBvdXRwdXQgc2hvd3MgdGhhdCB0aGUga2VybmVsIGlzIGZhaWxpbmcgdG8gcmVj
b2duaXplIHRoZSBmbGFzaCdzIEpFREVDIElELiBUaGlzIHN1Z2dlc3RzIHRoYXQgdGhlIGdlbmVy
aWMgU0ZEUC1iYXNlZCBkcml2ZXIgaXNuJ3Qgd29ya2luZyBhcyBleHBlY3RlZC4NCg0KWyAgMTM1
LjI5NDYyNF0gc3BpLW5vciBzcGkxLjA6IHVucmVjb2duaXplZCBKRURFQyBpZCBieXRlczogZWYg
NzAgMjAgMDAgMDAgMDANClsgIDEzNS4zMDE2MDJdIHNwaS1ub3I6IHByb2JlIG9mIHNwaTEuMCBm
YWlsZWQgd2l0aCBlcnJvciAtMg0KDQpJIHRoaW5rIHdlIG5lZWQgdG8gYWRkIHRoaXMgdG8gdGFi
bGUgdG8gbWFrZSBzdXJlIFcyNVE1MTJKVi1EVFIgaXMgcmVjb2duaXplZC4NCg0KQlIsDQpLZXJy
eQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUHJhdHl1c2ggWWFkYXYgPHBy
YXR5dXNoQGtlcm5lbC5vcmc+IA0KU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMTAsIDIwMjUg
MTE6NDcgUE0NClRvOiBLYW5nLktlcnJ5IOW6t+Wuh+iJryBUQU8gPEthbmcuS2VycnlAaW52ZW50
ZWMuY29tPg0KQ2M6IGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnDQpTdWJqZWN0OiBSZTog
bXRkOiBzcGktbm9yOiBBZGQgV2luYm9uZCB3MjVxNTEyanZkdHINCg0KSGksDQoNCk9uIFdlZCwg
U2VwIDEwIDIwMjUsIEthbmcuS2Vycnkg5bq35a6H6ImvIFRBTyB3cm90ZToNCg0KPiBTaW1pbGFy
IHRvIHRoZSBvdGhlciBvbmVzLCBkaWZmZXJlbnQgc2l6ZS4gVGhlICJKVi1EVFIiIHN1ZmZpeCBp
cyBpbiANCj4gdGhlIGRhdGFzaGVldCwgSSBoYXZlbid0IHNlZW4gbWVudGlvbnMgb2YgYSBkaWZm
ZXJlbnQgb25lLg0KPg0KPiBUaGUgZGF0YXNoZWV0IGluZGljYXRlcyBEVUFMIGFuZCBRVUFEIGFy
ZSBzdXBwb3J0ZWQuDQo+DQo+IGh0dHBzOi8vd3d3LndpbmJvbmQuY29tL3Jlc291cmNlLWZpbGVz
L1cyNVE1MTJKViUyMERUUiUyMFJldkQlMjAwNjI5MjANCj4gMjAlMjAxMzMucGRmDQoNClRoZSBm
bGFzaCBzZWVtcyB0byBoYXZlIFNGRFAuIEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgYW4gZW50cnkg
aGVyZSBhdCBhbGwuIFRoZSBnZW5lcmljIFNGRFAtYmFzZWQgZHJpdmVyIHNob3VsZCBiZSBlbm91
Z2ggZm9yIHlvdS4gSnVzdCBhZGQgdGhlIGplZGVjLHNwaS1ub3Igbm9kZSB0byB5b3VyIGRldmlj
ZSB0cmVlLiBUcnkgdGhhdCBvdXQgYW5kIG9ubHkgYWRkIHRoZSBlbnRyeSBpZiBzb21ldGhpbmcg
aXNuJ3Qgd29ya2luZywgYW5kIHRoYXQgd2l0aCBleHBsYW5hdGlvbnMgYW5kIGZpeGVzIHRvIHRo
ZSBwcm9ibGVtcy4NCg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBLYW5nLktlcnJ5IA0KPiA8a2FuZy5r
ZXJyeUBpbnZlbnRlYy5jb3JwLXBhcnRuZXIuZ29vZ2xlLmNvbT4NCj4gLS0tDQo+DQo+IFRoaXMg
bW9kaWZpY2F0aW9uIGlzIGFkZCBCSU9TIFcyNVE1MTJKVi1EVFIgY2hpcCB0byB3aW5ib25kIGxp
c3QNCj4NCj4gLS0tDQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL3dpbmJvbmQuYyB8IDUgKysrKysN
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivd2luYm9uZC5jIA0KPiBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivd2lu
Ym9uZC5jIGluZGV4IDhkMGEwMGQ2OWUxMi4uNmNlNWY3MGJjMTFhIA0KPiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9tdGQvc3BpLW5vci93aW5ib25kLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci93aW5ib25kLmMNCj4gQEAgLTE0Niw2ICsxNDYsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmbGFzaF9pbmZvIHdpbmJvbmRfbm9yX3BhcnRzW10gPSB7DQo+ICAgLm5hbWUgPSAidzI1cTUx
Mmp2cSIsDQo+ICAgLnNpemUgPSBTWl82NE0sDQo+ICAgLm5vX3NmZHBfZmxhZ3MgPSBTRUNUXzRL
IHwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCwNCj4gKyB9LCB7DQo+ICsg
LmlkID0gU05PUl9JRCgweGVmLCAweDcwLCAweDIwKSwNCj4gKyAubmFtZSA9ICJ3MjVxNTEyanZk
dHIiLA0KPiArIC5zemllID0gU1pfNjRNLA0KPiArIC5ub19zZmRwX2ZsYWdzID0gU0VDVF80SyB8
IFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JFQUQsDQo+ICAgfSwgew0KPiAgIC5p
ZCA9IFNOT1JfSUQoMHhlZiwgMHg1MCwgMHgxMiksDQo+ICAgLm5hbWUgPSAidzI1cTIwYnciLA0K
PiAtLQ0KPiAyLjQzLjANCj4NCg0KPg0KDQotLQ0KUmVnYXJkcywNClByYXR5dXNoIFlhZGF2DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
