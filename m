Return-Path: <SRS0=fen1=WJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E667C32750
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 19:59:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D88208C2
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Aug 2019 19:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sUH71N8U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="hxU4MCtM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D88208C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOFX4KlAoNODii47GM4Q9TnFqU7jnQLmryDVyQWEvXw=; b=sUH71N8UgtNrF4
	0EpFpAoLADS3vMZDkMA6dxh+p9SVnA1hyxhNfHVgN0j/jjPsz2auZKYz1h4PtYVYyABe4bvrKCgbt
	0PKZW3IW18wk/3WsecVOcKCDqBLa3lsjIsCogvY1gpI694rTVMu/SiDrXJKtm6jtS16BD7jYKWpY7
	rR3wi0Gmbg+zq5qz1eWQrBzPX64W0owlRdvF6/XlgOAF2Czpt6VABYvMrxK2ZzHeucLSGH9Wamvt9
	pqq5YqPtIqiErPucPl+pSnnAEZDWX/nGFC7bVQLhT7N5XAmC8XFlWa+eVcZzlJfh6k/F0VS555zNm
	9J9YcZR3N8fmQNLlX/Vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxcxD-0003r3-3t; Tue, 13 Aug 2019 19:59:35 +0000
Received: from mail-eopbgr130054.outbound.protection.outlook.com
 ([40.107.13.54] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxcx9-0003qU-9v
 for linux-mtd@lists.infradead.org; Tue, 13 Aug 2019 19:59:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qj4AYxYqWrQo051tD0xjL2ITjC4BPgodccqyuWlwVFLF8q3LW6AA0UwA75bEt51AWcH+HAbiCJy4L1nWzc7rpHRvRINuOkf8bo87qwn6d/l5kCb36ZOiweNMg3C+vHzCDEjas4OPbIhDg/PMHF1J2c6ckr6RZy73VOz5vAh+PC0+gXP4II8qNlyM0vRLusXWuACDRNLni6V+PCVbbZ1VRifkY5hEzQ+Neek+snJyPr3K3IB6ukOpOVeYqDu/qBIl4qBJVFFHQy+VYdS2OTxj388IA2nMzwAAyrzHS2qtQkYBDYwWmrVbViH+nUMdmWMo9iglztUmi0dX5qvY5H+Wsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVIG8+PHn2wW0QWEGE0nSa92tejsEfLtggAjNpgaLBw=;
 b=NNruSqDBZfRq4dq6BedgIx7owgzPKVOtYOij0NJPR5lIvyTaZeBtREy1OlPsgt51yBW095QJ4KVxohJar+jzHAbR6u9rCepfMTX/eYeAyjktDQUmN2Bi9uJtaypNeSb/sztBFktS2NM9coOzw4wJy2fafhwtNfJRWO1LWtZDZzlv+Vyqc7yXqwrDTLlAODJYvHuTRlgM6mLW9DcXzU3RSNeQTPSuR/aQ8ERMC4S60MnA52OYPfKgdFIrK7nzN3sf9V4v2qfpX5yfCxtp80CqyOWK7ZT7hLSuy9l1kBVGAk+MR/oPyq9EOBVtI93Z2HvFMX92ozXtW63plaWg1H8Z8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pVIG8+PHn2wW0QWEGE0nSa92tejsEfLtggAjNpgaLBw=;
 b=hxU4MCtMJzHx9yZJaGmvaQ+1IWjcD6kQHuVCZbuXIJvl4SBBx6E1Pz4v2ZHT5noNVDWaxGt9teLb8Iu7RTBlBRt5Dev7SCbgXScMzvCXyPdfon+L9mcWg7gKtW8qLD/ktLVuaj2x1kut5Vm20BFFYTc87ElGinFr3MCkNcc1Cy0=
Received: from AM0PR04MB4961.eurprd04.prod.outlook.com (20.177.42.12) by
 AM0PR04MB5843.eurprd04.prod.outlook.com (20.178.118.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Tue, 13 Aug 2019 19:59:25 +0000
Received: from AM0PR04MB4961.eurprd04.prod.outlook.com
 ([fe80::8999:d883:90dc:1966]) by AM0PR04MB4961.eurprd04.prod.outlook.com
 ([fe80::8999:d883:90dc:1966%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 19:59:25 +0000
From: Han Xu <han.xu@nxp.com>
To: Richard Weinberger <richard@nod.at>, Han Xu <xhnjupt@gmail.com>
Subject: RE: [EXT] Re: 5.2.0-rc1 UBIFS bad unlock balance
Thread-Topic: [EXT] Re: 5.2.0-rc1 UBIFS bad unlock balance
Thread-Index: AdUbEX8AXcF5sQkER5GP/4OqThwnUQABtdkADYtbjIAAAIkXgAAxg2AAAACEnwAAAF6NUA==
Date: Tue, 13 Aug 2019 19:59:25 +0000
Message-ID: <AM0PR04MB496181557F0D6EDC53783AAD97D20@AM0PR04MB4961.eurprd04.prod.outlook.com>
References: <AM6PR04MB496741DA4839DC07450F3E3997150@AM6PR04MB4967.eurprd04.prod.outlook.com>
 <CAFLxGvwZ_85eR5Qkjka4CyDOAP_jw-hpk7WwttbAzjLFS4MavQ@mail.gmail.com>
 <CA+EcR23V1nP9d6iYysT6vR+n8-BRnU-vursaxvcGB1LdBy+8NQ@mail.gmail.com>
 <411166061.63863.1565639737497.JavaMail.zimbra@nod.at>
 <CA+EcR23WqQGJQ2AD1daTnw7vR5+bfhEokDwEX1UyumoJfTt74Q@mail.gmail.com>
 <1755548283.65333.1565725690268.JavaMail.zimbra@nod.at>
In-Reply-To: <1755548283.65333.1565725690268.JavaMail.zimbra@nod.at>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=han.xu@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 847762f9-54e0-43d5-6db9-08d72028be07
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR04MB5843; 
x-ms-traffictypediagnostic: AM0PR04MB5843:
x-microsoft-antispam-prvs: <AM0PR04MB5843AA9F793636B92D70D7E497D20@AM0PR04MB5843.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:569;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(189003)(199004)(13464003)(316002)(110136005)(99286004)(478600001)(476003)(44832011)(4326008)(55016002)(446003)(25786009)(9686003)(6116002)(71200400001)(8936002)(6436002)(71190400001)(14444005)(2906002)(3846002)(229853002)(11346002)(66066001)(256004)(33656002)(5660300002)(26005)(66574012)(6506007)(53546011)(53936002)(186003)(305945005)(486006)(66946007)(74316002)(86362001)(102836004)(8676002)(7736002)(81156014)(81166006)(52536014)(76116006)(14454004)(66556008)(66476007)(76176011)(7696005)(64756008)(66446008)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5843;
 H:AM0PR04MB4961.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: P+G8A9JYuj1YIsQJNP6r1D21hhvNJJRcnSXuu95AIHMtIXH7e7qNM6T9yJtavhiAsp6/Cb19qK+YksXmViHQJRt4nYj8xAaUTsXhxoVid3s9eGmDqIpAQmebPW6AvnOaABue3NGvHlzy/Mfh/Ujl9SyzMxfHblIghwpU5Nl+olfI+gHuUf66I5n0DZYkSfrmBNFNHPzszJrUp8PBI7OdmQM4LNEQZIowqUlY6gNlqkd1rxMyvIGIl8QOAs58bpvjHR0Vao4nxJzU6Tv9mugE54Z+y6+R2vkbgCa1EA2GoXc5VXGhjcsOwXkdf5DKle8X46sX+qiK4IDZXsPOI4LtXtuBHzUUfh+4RgrAH53K8OExY5SDkxtzxZ0xHLNYvkNSkfhXNqLF2sNrmb1kTCml8eFIdD8Hl30krACx+OKjtYA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847762f9-54e0-43d5-6db9-08d72028be07
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 19:59:25.4013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eK5/G+dipAI/d3GTOx2u3DRnHhVQafTb4TP+plCsE6XUGfEHQWNVf3ay9ji7YU2u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_125931_434098_AE5967C1 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBXZWluYmVy
Z2VyIDxyaWNoYXJkQG5vZC5hdD4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDEzLCAyMDE5IDI6
NDggUE0NCj4gVG86IEhhbiBYdSA8eGhuanVwdEBnbWFpbC5jb20+DQo+IENjOiBIYW4gWHUgPGhh
bi54dUBueHAuY29tPjsgbGludXgtbXRkIDxsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZz4N
Cj4gU3ViamVjdDogW0VYVF0gUmU6IDUuMi4wLXJjMSBVQklGUyBiYWQgdW5sb2NrIGJhbGFuY2UN
Cj4gDQo+IENhdXRpb246IEVYVCBFbWFpbA0KPiANCj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFp
bCAtLS0tLQ0KPiA+PiBIdWg/IFRoZSBiYWQgY29tbWl0IHdhcyBkcm9wcGVkLiBBcmUgeW91IHN0
aWxsIHNlZWluZyB0aGlzIG9uIExpbnVzJyB0cmVlPw0KPiA+PiBNYXliZSBzb21ldGhpbmcgZWxz
ZSBpcyBiYWQuDQo+ID4+DQo+ID4NCj4gPiBTaG91bGQgYmUgcmVsYXRlZCB0byB0aGlzIGNvbW1p
dC4gU2VlbXMgd29ya2luZyBmaW5lIGFmdGVyIHJldmVydGluZyB0aGUgcGF0Y2guDQo+ID4NCj4g
PiBjb21taXQgODAwOWNlOTU2YzNkMjgwMjJhZjZiMTIyZTUwMjEzYWQ4MzBmYzkwMg0KPiA+IEF1
dGhvcjogUmljaGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4NCj4gPiBEYXRlOiAgIFdl
ZCBNYXkgMTUgMjE6NTI6MzQgMjAxOSArMDIwMA0KPiA+DQo+ID4gICAgdWJpZnM6IERvbid0IGxl
YWsgb3JwaGFucyBvbiBtZW1vcnkgZHVyaW5nIGNvbW1pdA0KPiANCj4gWW91IGFyZSBwZXJmZWN0
bHkgcmlnaHQsIHRoZXJlIGlzIHN0aWxsIGEgcHJvYmxlbSENCj4gRG9lcyB0aGUgZm9sbG93aW5n
IHBhdGNoIG1ha2UgdGhlIHByb2JsZW0gZ28gYXdheT8NCj4gQWZ0ZXIgb3JwaGFuX2RlbGV0ZSgp
IGMtPm9ycGhhbl9sb2NrIGlzIGJlaW5nIHVubG9ja2VkLCBzbyBhIGRvdWJsZSB1bmxvY2sgY2Fu
DQo+IGhhcHBlbi4NCj4gDQo+IGRpZmYgLS1naXQgYS9mcy91Ymlmcy9vcnBoYW4uYyBiL2ZzL3Vi
aWZzL29ycGhhbi5jIGluZGV4DQo+IGI1MjYyNGUyOGZhMS4uM2I0YjQxMTRmMjA4IDEwMDY0NA0K
PiAtLS0gYS9mcy91Ymlmcy9vcnBoYW4uYw0KPiArKysgYi9mcy91Ymlmcy9vcnBoYW4uYw0KPiBA
QCAtMTI5LDcgKzEyOSw2IEBAIHN0YXRpYyB2b2lkIF9fb3JwaGFuX2Ryb3Aoc3RydWN0IHViaWZz
X2luZm8gKmMsIHN0cnVjdA0KPiB1Ymlmc19vcnBoYW4gKm8pICBzdGF0aWMgdm9pZCBvcnBoYW5f
ZGVsZXRlKHN0cnVjdCB1Ymlmc19pbmZvICpjLCBzdHJ1Y3QNCj4gdWJpZnNfb3JwaGFuICpvcnBo
KSAgew0KPiAgICAgICAgIGlmIChvcnBoLT5kZWwpIHsNCj4gLSAgICAgICAgICAgICAgIHNwaW5f
dW5sb2NrKCZjLT5vcnBoYW5fbG9jayk7DQo+ICAgICAgICAgICAgICAgICBkYmdfZ2VuKCJkZWxl
dGVkIHR3aWNlIGlubyAlbHUiLCBvcnBoLT5pbnVtKTsNCj4gICAgICAgICAgICAgICAgIHJldHVy
bjsNCj4gICAgICAgICB9DQo+IEBAIC0xMzgsNyArMTM3LDYgQEAgc3RhdGljIHZvaWQgb3JwaGFu
X2RlbGV0ZShzdHJ1Y3QgdWJpZnNfaW5mbyAqYywgc3RydWN0DQo+IHViaWZzX29ycGhhbiAqb3Jw
aCkNCj4gICAgICAgICAgICAgICAgIG9ycGgtPmRlbCA9IDE7DQo+ICAgICAgICAgICAgICAgICBv
cnBoLT5kbmV4dCA9IGMtPm9ycGhfZG5leHQ7DQo+ICAgICAgICAgICAgICAgICBjLT5vcnBoX2Ru
ZXh0ID0gb3JwaDsNCj4gLSAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZjLT5vcnBoYW5fbG9j
ayk7DQo+ICAgICAgICAgICAgICAgICBkYmdfZ2VuKCJkZWxldGUgbGF0ZXIgaW5vICVsdSIsIG9y
cGgtPmludW0pOw0KPiAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPiAgICAgICAgIH0NCj4gDQoN
Clllcywgd29ya3MgZmluZSBub3cuIFRoYW5rcy4NCg0KPiBUaGFua3MsDQo+IC8vcmljaGFyZA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
