Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0CA4C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B4DA2054F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 10:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBXKTOib";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="q1N1Qbmj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B4DA2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h80cVX26dq8HZIYQi8sG8tMv5edc4eVmoaB/25eV4Pk=; b=DBXKTOib7sYm8v
	rn89NspKJGVk4VsRXCYGC1PaVM4l6JRMDXxy5Dk6Ph86zRu5dhNJd5QSqvY9yXvF3yGBMPaKFaG0M
	9efB6aSjusZfJJ1+dDFMEJ6qcreN/epmyWtJAMjN7fKRKvVxi6hDDjAp7uwB2eial1XTv7Icx0zlV
	ypKe+kmReJVI68DIENzkbsM7FANc4Qfm7nliEAcyo7QztgvWc4PBDJKjW2VGjdsZQHKbZwjf2Eoj6
	hS0yUuX3G/3+bSE0OoCrIyjpsMe8ZGphFrSQcct1dJNrsrBPzC9QQnO2fQNcIHDIA1b4PiHTGdiea
	NWf5PVgGhWkVONLGNl5g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNxYT-0000kA-Pr; Tue, 07 May 2019 10:42:37 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNxYR-0000jg-3u
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 10:42:36 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,441,1549954800"; d="scan'208";a="32132858"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 03:42:25 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.105) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 7 May 2019 03:42:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAovMtqug495whCLIiUup9DR4zQLUNhOMk4OnpqW83o=;
 b=q1N1QbmjpXWMkfvlndETxPoCszfdbIuRJ4o10fUeecd7vk9LbZP10Z50tf2MM8a5ajA7DcnAK3c5qNecqw0RDZebrrD8ezHLqGUyddLmvdhJGYQ1JsKCoqJFCruQ4A94/m4hTNRS2uSrbQC4A9sgYdMPSK71hWBOZcJ7di5imIY=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB4113.namprd11.prod.outlook.com (10.255.128.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 10:42:21 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 10:42:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>, <jonas@norrbonn.se>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoA=
Date: Tue, 7 May 2019 10:42:20 +0000
Message-ID: <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
In-Reply-To: <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0071.eurprd09.prod.outlook.com
 (2603:10a6:802:29::15) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58e5e5f1-ebf3-4da3-9550-08d6d2d8aeae
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB4113; 
x-ms-traffictypediagnostic: BN6PR11MB4113:
x-microsoft-antispam-prvs: <BN6PR11MB4113D3924EA04613B4BA66EAF0310@BN6PR11MB4113.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(136003)(376002)(39860400002)(396003)(189003)(199004)(66066001)(36756003)(52116002)(476003)(31696002)(446003)(229853002)(256004)(102836004)(14444005)(5660300002)(81166006)(81156014)(8676002)(2616005)(316002)(486006)(8936002)(478600001)(11346002)(71190400001)(71200400001)(186003)(99286004)(31686004)(26005)(110136005)(76176011)(14454004)(86362001)(68736007)(54906003)(6486002)(7736002)(53936002)(72206003)(305945005)(53546011)(73956011)(2906002)(4326008)(6512007)(6506007)(66476007)(66946007)(66556008)(64756008)(66446008)(6436002)(6116002)(25786009)(6246003)(3846002)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB4113;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BGJJoB0lnz+lo7W4dYctUhJIN8RQAwZsVSgnLaAdm2vdCDrwSxq+bP7Na4dBOTjsRoH4grGtIRSow+eSNuMOfU1UpwxLO0TJLS/e1YQIAox4vPzTuAHQ42HFNTisDL9x3CNJVD+u/zSiBgKmSh7j0KTBIVcxeQ662J0kuXd2vDUBU/1XzX+A9sk3kJAzYuNxo0BbYtIdnNNAmC6ABKyQMZaolur9i5Vjb/shdSmEv0LEKggi9khpJo0Jmg/BxfP8ViSncrfSt5Ii9vF2U6YbuEihVbk/yVmTqJKe8L3uT/RGz5ZAF2oJak/0163MDzE76olAl5IGr8GoY0CBUn0k4zLAttGQlygAJF1cGeRWTprHhfEI1gS1um0t8lRf3UGaEJhPArtBEnwwggQaJnGa1QumecGA1Xtq5AoPSCwaizs=
Content-ID: <0F897BF250919643B680928A5BEFD8BC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e5e5f1-ebf3-4da3-9550-08d6d2d8aeae
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 10:42:20.9173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4113
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_034235_248541_3A85B4AE 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIEdlZXJ0LA0KDQpPbiAwNS8wNy8yMDE5IDEyOjUzIFBNLCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+IEV4dGVybmFsIEUtTWFpbA0KPiANCj4gDQo+IEhpIEpvbmFzLA0KPiANCj4gT24g
V2VkLCBNYXIgMjAsIDIwMTkgYXQgODoxNiBBTSBKb25hcyBCb25uIDxqb25hc0Bub3JyYm9ubi5z
ZT4gd3JvdGU6DQo+PiBCb3RoIHRoZSBCUFswLTJdIGJpdHMgYW5kIHRoZSBUQlBST1QgYml0IGFy
ZSBzdXBwb3J0ZWQgb24gdGhpcyBjaGlwLg0KPj4gVGVzdGVkIGFuZCB2ZXJpZmllZCBvbiBhIEN5
cHJlc3MgczI1Zmw1MTJzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFzIEJvbm4gPGpvbmFz
QG5vcnJib25uLnNlPg0KPiANCj4gVGhpcyBpcyBub3cgY29tbWl0IGRjYjRiMjJlZWFmNDRmOTEg
KCJzcGktbm9yOiBzMjVmbDUxMnMgc3VwcG9ydHMgcmVnaW9uDQo+IGxvY2tpbmciKSBpbiBtdGQv
bmV4dC4NCj4gDQo+PiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPj4gKysr
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCj4+IEBAIC0xODk4LDcgKzE4OTgsOSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGZsYXNoX2luZm8gc3BpX25vcl9pZHNbXSA9IHsNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgIFNQSV9OT1JfRFVBTF9SRUFEIHwgU1BJX05PUl9RVUFEX1JF
QUQgfCBVU0VfQ0xTUikgfSwNCj4+ICAgICAgICAgeyAiczI1ZmwyNTZzMCIsIElORk8oMHgwMTAy
MTksIDB4NGQwMCwgMjU2ICogMTAyNCwgMTI4LCBVU0VfQ0xTUikgfSwNCj4+ICAgICAgICAgeyAi
czI1ZmwyNTZzMSIsIElORk8oMHgwMTAyMTksIDB4NGQwMSwgIDY0ICogMTAyNCwgNTEyLCBTUElf
Tk9SX0RVQUxfUkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwgVVNFX0NMU1IpIH0sDQo+PiAtICAg
ICAgIHsgInMyNWZsNTEycyIsICBJTkZPNigweDAxMDIyMCwgMHg0ZDAwODAsIDI1NiAqIDEwMjQs
IDI1NiwgU1BJX05PUl9EVUFMX1JFQUQgfCBTUElfTk9SX1FVQURfUkVBRCB8IFVTRV9DTFNSKSB9
LA0KPj4gKyAgICAgICB7ICJzMjVmbDUxMnMiLCAgSU5GTzYoMHgwMTAyMjAsIDB4NGQwMDgwLCAy
NTYgKiAxMDI0LCAyNTYsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICBTUElfTk9SX0RVQUxf
UkVBRCB8IFNQSV9OT1JfUVVBRF9SRUFEIHwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIFNQ
SV9OT1JfSEFTX0xPQ0sgfCBTUElfTk9SX0hBU19UQiB8IFVTRV9DTFNSKSB9LA0KPiANCj4gU2V0
dGluZyBTUElfTk9SX0hBU19MT0NLIGNhdXNlcyB0aGUgUVNQSSBGTEFTSCBvbiByOGE3NzkxL2tv
ZWxzY2ggdG8gZmFpbA0KPiBwcm9iaW5nLg0KPiANCj4gQmVmb3JlL2FmdGVyOg0KPiANCj4gICAg
IC1tMjVwODAgc3BpMC4wOiBzMjVmbDUxMnMgKDY1NTM2IEtieXRlcykNCj4gICAgIC0zIGZpeGVk
LXBhcnRpdGlvbnMgcGFydGl0aW9ucyBmb3VuZCBvbiBNVEQgZGV2aWNlIHNwaTAuMA0KPiAgICAg
LUNyZWF0aW5nIDMgTVREIHBhcnRpdGlvbnMgb24gInNwaTAuMCI6DQo+ICAgICAtMHgwMDAwMDAw
MDAwMDAtMHgwMDAwMDAwODAwMDAgOiAibG9hZGVyIg0KPiAgICAgLTB4MDAwMDAwMDgwMDAwLTB4
MDAwMDAwNjAwMDAwIDogInVzZXIiDQo+ICAgICAtMHgwMDAwMDA2MDAwMDAtMHgwMDAwMDQwMDAw
MDAgOiAiZmxhc2giDQo+ICAgICArbTI1cDgwIHNwaTAuMDogRXJhc2UgRXJyb3Igb2NjdXJyZWQN
Cj4gICAgICttMjVwODAgc3BpMC4wOiBFcmFzZSBFcnJvciBvY2N1cnJlZA0KPiAgICAgK20yNXA4
MCBzcGkwLjA6IHRpbWVvdXQgd2hpbGUgd3JpdGluZyBjb25maWd1cmF0aW9uIHJlZ2lzdGVyDQo+
ICAgICArbTI1cDgwIHNwaTAuMDogcXVhZCBtb2RlIG5vdCBzdXBwb3J0ZWQNCj4gICAgICttMjVw
ODA6IHByb2JlIG9mIHNwaTAuMCBmYWlsZWQgd2l0aCBlcnJvciAtNQ0KPiANCj4gRkxBU0ggY2hp
cCBpcyBTUEFOU0lPTiBGTDUxMlNBSUZHMSAzMTFRUTA2MyBBIMKpMTEgU1BBTlNJT04NCj4gSkVE
RUMgaWQgYnl0ZXM6IDAxIDAyIDIwIDRkIDAwIDgwDQoNClRoYXQncyBjdXJpb3VzLiBEaWQgeW91
IHJldmVydCB0aGlzIHBhdGNoIGFuZCBwcm9iZSB3YXMgb2s/IEFyZSB5b3Ugc3VyZSBpdCBpcw0K
bm90IHJlbGF0ZWQgdG8gdGhlIHJlY2VudCBjaGFuZ2VzIG9uIHNwaS1yc3BpLmM/DQoNCkNoZWVy
cywNCnRhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
