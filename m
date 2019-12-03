Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_BTC_ID,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A22FC432C3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 11:08:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBCF1206EC
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 11:08:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YX32XlGB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="I3RoIL72"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBCF1206EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SJAj/PQrV5yVhXi4Q/AL3g8YjHArfj862ZPTVxrCwMk=; b=YX32XlGBH2vupy
	yXxx5Mz4qvHt4Fi+CREdxLOoMFwUPAAI6xui/Mej6msHRuNjbmzxjGW5J+eSuyO89xxluNQHqOB0A
	So81TQ5VxoqsKCvSdarAd+NwVVIl3UgNGpFzybskSYldLccN1f+cyo8A02LMk3B8gh+6A6NbZRm42
	QMaY1epPrNYfDLyUa6XVHF6WynjSeolLUXQgIxyxFFgYYCCyQRe8Ov+ui9iSYCGN0NlXb9WTLRTuZ
	LZMxlsvCdpxLi1RKeK/6RjqWuR+HPqk9LEV+gR+U//SQ/6tipjPFDb4I9ImSmmbWzVKYeD6S1Z+gf
	zmZAAB/hygBhyPRGlx/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic62G-0002rO-Ps; Tue, 03 Dec 2019 11:08:04 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic62C-0002qv-Nn
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 11:08:02 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 54KFR0D6YsX+cBxxfHyPLqW1UAg4XfORaDCjWuGdyVoPtfiVwLKKR2it4vvf+D0VAfKXU53fJm
 DFUeZWo7JC0o9VYWcyKnYz5Lq5XIhoYoNA3K6kiWFFHDu4c6m07KadYlfPAqJt0+5sT4pbf/w7
 GN/JpzKNTfCS1S10Lx/iYjsAtTK570Vy/9GMYucNgS+ouvatSG3+IZ2/zU3A8rl1coixRJEFjf
 yglHspAuSsttcqm32qx67YDNrBl/K1vTqDNXgx1xJ8O+I9p/8QErLGN2b6KSJ1Ad4qU94nyQv9
 TuI=
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; d="scan'208";a="59111726"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2019 04:07:57 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Dec 2019 04:07:58 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 04:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VA43BhwR5rBnBetHd0wOdMb8BIgyQVoRA6+S6xjPvCNwQ9R2wzSayV6hyYcwVAJkpU9pvTNxs3YRrWIvdcRhH/DIQJB+ZBe6ZB5lgqN2A+TcNsbMjIoDusEUvfu8yWM7AAsGYsxVaq2LgUT3z0QJkUo4saMjhCEjR/jsO/tBt+t23W6a0k0liCW4NZxMC9H12Sie3oaNMNo68Nkxtfc/ONjogflthyWce3rXgsKPxoH79aw7SuQ1UyUQjnna9/kw8PeYUaTFdLM/2iWQHZM0HNQ+uE0KTtLSrzs3x3TXTpCfe5idUBFtOpF3khH0Erg9qshLXhiNijReRVKRnMcg5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/HrfWaOr7sn9uUA39u9CUd1DFTA6RZuXE4hKpUqfPc=;
 b=buHLKVdFs/Srea0lr8xufBh8MlrkHz1PeHLPnYylegBAPh865XT0co4UPVq8xO9KKddWiqK2x+1BveU7gU74oRbECT9nAJ/EFk+ZOKvEhWldrWXDhSyB8l31CCAC0cy/92oJBtTziOfv0o79tozquqoHUiqOLkUMtGgSDHNUFrV9tz+Tg2c25S2K2azdvgPtnQFHAFNRenJu738RtYFuLU1PKR908E8RoUWLK6qJLwql6pk0i17HDJNCsc1BmneHVm5ZsFGYkohK0xHGrlVbHzA72evVK0a3aovR2oinicaC22CDccr19E7G+55t82/lkrOmvCET4xFaXEcdN9hE5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/HrfWaOr7sn9uUA39u9CUd1DFTA6RZuXE4hKpUqfPc=;
 b=I3RoIL72xmGRIBQ8ac8/j1SlIAaxOHOukjCnKyiy0qRtiSB3visxKrcJSkYKezHVkLJYLR+hDJx6AJAfH56QECOtf4NOwuRemqhlUH3FGwdFalVLyJKMAYmj1yrH1c92B5jjqvLWm4zzHq7ayTQERXyL0VD2wG+wUrRbZyFplVY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3581.namprd11.prod.outlook.com (20.178.252.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 11:07:56 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 11:07:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: Re: flash_lock issue for n25q 128mb spi nor part
Thread-Topic: flash_lock issue for n25q 128mb spi nor part
Thread-Index: AQHVqTXrLRyxgk/NSUmXYMf/6XpoyKeoKnuAgAAMpoCAAAo/gA==
Date: Tue, 3 Dec 2019 11:07:56 +0000
Message-ID: <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
In-Reply-To: <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FR2P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191203130749923
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2dd8732d-b449-43a3-06c5-08d777e10cb5
x-ms-traffictypediagnostic: MN2PR11MB3581:
x-microsoft-antispam-prvs: <MN2PR11MB3581CCB14374BD6ABD6D0B61F0420@MN2PR11MB3581.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(136003)(376002)(39860400002)(346002)(55674003)(199004)(189003)(446003)(2616005)(31696002)(14454004)(6116002)(3846002)(478600001)(229853002)(110136005)(6246003)(5660300002)(6486002)(2501003)(36756003)(2906002)(54906003)(316002)(71200400001)(86362001)(6436002)(66556008)(71190400001)(31686004)(99286004)(25786009)(76176011)(66446008)(8676002)(64756008)(8936002)(66946007)(7736002)(66476007)(305945005)(256004)(186003)(14444005)(5024004)(4326008)(6512007)(6306002)(386003)(6506007)(52116002)(81156014)(53546011)(81166006)(102836004)(11346002)(26005)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3581;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: auNFlH+nAI7KW2aeSvitMNcBXh2oC/h2gd2utuBfciKd7rbCx1IrImQOEXeVZla5MpJCFUmmppBVmnZjW9i38WrRoRp3uP4gqO9Ujkn5cMXTYfbcord56Rn9KHvAkIEgJMUumoRFC/5A2JoiBrpHGCsDawj9Jmsy3A8Ny7wHD3Hgi/GdfQjGKBXOY0ubnGY2vCaedHfgg2DHiFjAw22YfXu8i0gr3K3NfBKeOuMoUvGOqP2+YZaUXKxD8FWev6ElXdUzyVV1CRVqxY88aBJ7Rl+0PuC2fXOhI3RCyUu41frHpWvBOuRTt22ps2AshZHBsY8aIRe4bUroE3F1iWx4nJWLYUkdVhqMAHMlwdr1wTwIkAObM7DkOqd1NJ83OJf3DO/DEEc8btOrKhmbOxhTqFKdgoArKBh31YL8PrzItAIzIoFC1WEK3Mz0u0WD/r2O4lNnosTQQtKk4kvGxWkuF9uoZk7hWYNT/eheNWC2/cg=
x-ms-exchange-transport-forked: True
Content-ID: <86DFDA45B841244DA8B7AB75B5E6258F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd8732d-b449-43a3-06c5-08d777e10cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 11:07:56.3060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GaCN5VTBDb/G+SumbAKi/+2+Y7255dL4GQpiHUzS4oPcln8l7LIdFNc7nxdDjk5dbFEXG973cpfn+8I4oOj4EvcZBSDGBVM097WUB5/ja6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_030800_930001_74D165D6 
X-CRM114-Status: GOOD (  20.29  )
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
Cc: broonie@kernel.org, chenxiang66@hisilicon.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DQoNCk9uIDEyLzMvMTkgMTI6MzEgUE0sIEpvaG4gR2Fycnkgd3JvdGU6DQo+IEVYVEVSTkFMIEVN
QUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtu
b3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gMDMvMTIvMjAxOSAwOTo0NSwgVHVkb3Iu
QW1iYXJ1c0BtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gSGksIEpvaG4sDQo+IA0KPiBIaSBUdWRv
ciwNCj4gDQo+IFRoYW5rcyBmb3IgZ2V0dGluZyBiYWNrIHRvIG1lLg0KPiANCj4+DQo+PiBPbiAx
Mi8yLzE5IDc6MjggUE0sIEpvaG4gR2Fycnkgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERv
IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUg
Y29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBIaSBndXlzLA0KPj4+DQo+Pj4gSSBhbSB0ZXN0aW5n
IHRoZSBmb2xsb3dpbmcgZHJpdmVyIG9uIHRvcCBvZiBMaW51cycgbWFzdGVyIGJyYW5jaCB3aXRo
IGENCj4+PiBuMjVxMTI4YTExIHBhcnQ6DQo+Pg0KPj4gSSB1bmRlcnN0YW5kIHRoZSB5b3UgZW5h
YmxlZCBsb2NraW5nIHN1cHBvcnQgZm9yIHRoaXMgZmxhc2ggb24geW91ciBzaWRlLA0KPj4gYmVj
YXVzZSBpbiBtYWlubGluZSBpdCBpcyBub3QgeWV0IHRoZXJlLg0KPj4NCj4+IEJlIGF3YXJlIHRo
YXQgdGhpcyBmbGFzaCBoYXMgQlAzIHN1cHBvcnQsIGFuZCBpbiBtYWlubGluZSB3ZSBzdXBwb3J0
IGZvciBub3cNCj4+IGp1c3QgQlAwLUJQMiwgc28ganVzdCBhIHBhcnRpYWwgbG9jayBjYW4gYmUg
YWNoaWV2ZWQsIGFuZCBpdCBkZXBlbmRzIG9uIHdoYXQgeW91DQo+PiB0cmllZCB0byBsb2NrLiBJ
dCB3aWxsIGJlIGhlbHBmdWwgdG8gdGVsbCBob3cgeW91IGVuYWJsZWQgdGhlIGxvY2tpbmcgYW5k
IHdoYXQNCj4+IGNvbW1hbmRzIGRpZCB5b3UgdXNlLg0KPiANCj4gU28gSSBhbSBzaW1wbHkgdXNp
bmcgZmxhc2hfbG9jayAtbCAvZGV2L210ZDAsIHdoaWNoIHdpbGwgdHJ5IHRvIGxvY2sgdGhlDQo+
IHdob2xlIGRldmljZS4gTm93IEkgc2VlIHdoYXQgeW91J3JlIHNheWluZyBhYm91dCBCUDMgYW5k
IGhvdyBjb21wbGV0ZQ0KPiBsb2NraW5nIGlzIG5vdCBhdmFpbGFibGUuDQo+IA0KPj4NCj4+Pg0K
Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8xNTcyODg2Mjk3LTQ1NDAwLTMt
Z2l0LXNlbmQtZW1haWwtam9obi5nYXJyeUBodWF3ZWkuY29tLw0KPj4+DQo+Pj4gSSBhbSBmaW5k
aW5nIGZsYXNoIGxvY2sgaXMgbm90IHdvcmtpbmcuIEV2ZW4gYWZ0ZXIgYSDigJxzdWNjZXNzZnVs
4oCdIGxvY2ssDQo+Pj4gZmxhc2hfbG9jayBpcyByZXBvcnRpbmcgZmxhc2ggaXMgdW5sb2NrZWQu
IEFuZCBJIGNhbiBzdGlsbCB3cml0ZSB0byB0aGUNCj4+PiBmbGFzaC4NCj4+Pg0KPj4+IEkgZmlu
ZCB0aGF0IHNpbmNlIDM5ZDFlMzM0MGM3MyAoIm10ZDogc3BpLW5vcjogRml4IGNsZWFyaW5nIG9m
IFFFIGJpdCBvbg0KPj4+IGxvY2soKS91bmxvY2soKSIpLCB3ZSdyZSB1c2luZyBhIDE2YiBTUiBm
b3IgdGhpcyBwYXJ0IGluIHRoZSBkcml2ZXIsIGJ1dA0KPj4+IHRoaXMgcGFydCBvbmx5IGhhcyBh
IDhiIFNSLg0KPj4+DQo+Pj4gVGhpcyBoYWNrIGZpeGVzIHRoZSBwcm9ibGVtIGZvciBtZToNCj4+
Pg0KPj4+IEAgLTQ2OTEsNyArNDY5MSw3IEBAIHN0YXRpYyB2b2lkIHNwaV9ub3JfaW5mb19pbml0
X3BhcmFtcyhzdHJ1Y3Qgc3BpX25vcg0KPj4+ICpub3IpDQo+Pj4gcGFyYW1zLT5zZXRfNGJ5dGUg
PSBzcGFuc2lvbl9zZXRfNGJ5dGU7DQo+Pj4gcGFyYW1zLT5zZXR1cCA9IHNwaV9ub3JfZGVmYXVs
dF9zZXR1cDsNCj4+PiAvKiBEZWZhdWx0IHRvIDE2LWJpdCBXcml0ZSBTdGF0dXMgKDAxaCkgQ29t
bWFuZCAqLw0KPj4+IC0gbm9yLT5mbGFncyB8PSBTTk9SX0ZfSEFTXzE2QklUX1NSOw0KPj4+ICsv
LyBub3ItPmZsYWdzIHw9IFNOT1JfRl9IQVNfMTZCSVRfU1I7DQo+Pg0KPj4gVGhpcyBtZWFucyB0
aGF0IGJmcHQgaXMgbm90IHBhcnNlZC4gWW91IGNhbiBjb25maXJtIHRoaXMgYnkgcnVubmluZyB3
aXRoIHRoZQ0KPj4gcGF0Y2ggZnJvbSBiZWxvdy4NCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tdGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0K
Pj4gaW5kZXggZjRhZmUxMjNlOWRjLi43MzVjZDUyMDI1OTggMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9z
cGktbm9yLmMNCj4+IEBAIC0zNTQ1LDggKzM1NDUsMTEgQEAgc3RhdGljIGludCBzcGlfbm9yX3Bh
cnNlX2JmcHQoc3RydWN0IHNwaV9ub3IgKm5vciwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBlcnI7DQo+Pg0KPj4gwqDCoMKgwqDCoMKgwqDCoCAvKiBGaXggZW5k
aWFubmVzcyBvZiB0aGUgQkZQVCBEV09SRHMuICovDQo+PiAtwqDCoMKgwqDCoMKgIGZvciAoaSA9
IDA7IGkgPCBCRlBUX0RXT1JEX01BWDsgaSsrKQ0KPj4gK8KgwqDCoMKgwqDCoCBmb3IgKGkgPSAw
OyBpIDwgQkZQVF9EV09SRF9NQVg7IGkrKykgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgYmZwdC5kd29yZHNbaV0gPSBsZTMyX3RvX2NwdShiZnB0LmR3b3Jkc1tpXSk7DQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKG5vci0+ZGV2LCAiYmZwdC5k
d29yZHNbJWRdID0gJTA4eFxuIiwgaSwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBiZnB0LmR3b3Jkc1tpXSk7DQo+PiArwqDCoMKgwqDCoMKgIH0NCj4+
DQo+PiDCoMKgwqDCoMKgwqDCoMKgIC8qIE51bWJlciBvZiBhZGRyZXNzIGJ5dGVzLiAqLw0KPj4g
wqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGJmcHQuZHdvcmRzW0JGUFRfRFdPUkQoMSldICYgQkZQ
VF9EV09SRDFfQUREUkVTU19CWVRFU19NQVNLKSB7DQo+PiBAQCAtMzY0OSw2ICszNjUyLDkgQEAg
c3RhdGljIGludCBzcGlfbm9yX3BhcnNlX2JmcHQoc3RydWN0IHNwaV9ub3IgKm5vciwNCj4+IMKg
wqDCoMKgwqDCoMKgwqAgcGFyYW1zLT5wYWdlX3NpemUgPj49IEJGUFRfRFdPUkQxMV9QQUdFX1NJ
WkVfU0hJRlQ7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIHBhcmFtcy0+cGFnZV9zaXplID0gMVUgPDwg
cGFyYW1zLT5wYWdlX3NpemU7DQo+Pg0KPj4gK8KgwqDCoMKgwqDCoCBkZXZfZXJyKG5vci0+ZGV2
LCAiYmZwdC5kd29yZHNbQkZQVF9EV09SRCgxNSldICYgQkZQVF9EV09SRDE1X1FFUl9NQVNLID0N
Cj4+ICUwOHhcbiIsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiZnB0LmR3b3Jk
c1tCRlBUX0RXT1JEKDE1KV0gJiBCRlBUX0RXT1JEMTVfUUVSX01BU0spOw0KPj4gKw0KPj4gwqDC
oMKgwqDCoMKgwqDCoCAvKiBRdWFkIEVuYWJsZSBSZXF1aXJlbWVudHMuICovDQo+PiDCoMKgwqDC
oMKgwqDCoMKgIHN3aXRjaCAoYmZwdC5kd29yZHNbQkZQVF9EV09SRCgxNSldICYgQkZQVF9EV09S
RDE1X1FFUl9NQVNLKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgQkZQVF9EV09SRDE1X1FF
Ul9OT05FOg0KPj4NCj4gDQo+IGpvaG5AdWJ1bnR1On4kIGRtZXNnIHwgZ3JlcCBzcGkNCj4gW8Kg
wqAgMTQuOTM1NzQwXSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1swXSA9IGZm
ZjkyMGU1DQo+IFvCoMKgIDE0Ljk0MTQ4MF0gc3BpLW5vciBzcGktUFJQMDAwMTowMDogYmZwdC5k
d29yZHNbMV0gPSAwN2ZmZmZmZg0KPiBbwqDCoCAxNC45NDcyMTVdIHNwaS1ub3Igc3BpLVBSUDAw
MDE6MDA6IGJmcHQuZHdvcmRzWzJdID0gNmIyN2ViMjkNCj4gW8KgwqAgMTQuOTUyOTQ5XSBzcGkt
bm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1szXSA9IGJiMjczYjI3DQo+IFvCoMKgIDE0
Ljk1ODY4M10gc3BpLW5vciBzcGktUFJQMDAwMTowMDogYmZwdC5kd29yZHNbNF0gPSBmZmZmZmZm
Zg0KPiBbwqDCoCAxNC45NjQ0MTddIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGJmcHQuZHdvcmRz
WzVdID0gYmIyN2ZmZmYNCj4gW8KgwqAgMTQuOTcwMTUwXSBzcGktbm9yIHNwaS1QUlAwMDAxOjAw
OiBiZnB0LmR3b3Jkc1s2XSA9IGViMjlmZmZmDQo+IFvCoMKgIDE0Ljk3NTg4NF0gc3BpLW5vciBz
cGktUFJQMDAwMTowMDogYmZwdC5kd29yZHNbN10gPSBkODEwMjAwYw0KPiBbwqDCoCAxNC45ODE2
MThdIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGJmcHQuZHdvcmRzWzhdID0gMDAwMDUyMGYNCj4g
W8KgwqAgMTQuOTg3MzUxXSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1s5XSA9
IDAwOTk0YTI0DQo+IFvCoMKgIDE0Ljk5MzA4NV0gc3BpLW5vciBzcGktUFJQMDAwMTowMDogYmZw
dC5kd29yZHNbMTBdID0gYzkwMzhlOGINCj4gW8KgwqAgMTQuOTk4OTA2XSBzcGktbm9yIHNwaS1Q
UlAwMDAxOjAwOiBiZnB0LmR3b3Jkc1sxMV0gPSAzODI3MDFhYw0KPiBbwqDCoCAxNS4wMDQ3MjZd
IHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGJmcHQuZHdvcmRzWzEyXSA9IDc1N2E3NTdhDQo+IFvC
oMKgIDE1LjAxMDU0N10gc3BpLW5vciBzcGktUFJQMDAwMTowMDogYmZwdC5kd29yZHNbMTNdID0g
NWNkNWJkZmINCj4gW8KgwqAgMTUuMDE2MzY3XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBiZnB0
LmR3b3Jkc1sxNF0gPSBmZjgyMGY0YQ0KPiBbwqDCoCAxNS4wMjIxODddIHNwaS1ub3Igc3BpLVBS
UDAwMDE6MDA6IGJmcHQuZHdvcmRzWzE1XSA9IDAwMDAzZDgxDQo+IA0KDQpUaGlzIGZhbGxzIGlu
dG8gdGhlIEJGUFRfRFdPUkQxNV9RRVJfTk9ORSBjYXNlLiBJZiB0aGVyZSdzIGEgY29ycmVzcG9u
ZGVuY2UNCmJldHdlZW4gdGhlIEJGUFRfRFdPUkQxNV9RRVJfTk9ORSBhbmQgbm8gMTYtYml0IFdy
aXRlIFNSIHN1cHBvcnQsIHdlIGNhbiBjbGVhcg0KdGhlIGZsYWcgdGhlcmUsIGJ1dCBKRVNEMjE2
RCBkb2VzIG5vdCBzcGVjaWZ5IHRoaXMgOiguDQoNClBsZWFzZSBlbmFibGUgQ09ORklHX0RFQlVH
IG9uIHRvcCBvZiB0aGUgZmlsZSB0byBzZWUgZGV2X2RiZyBtZXNzYWdlcy4gSSdsbCB0cnkNCnRv
IGZpbmQgYSBtaWNyb24gZmxhc2ggaW4gdGhlIG1lYW50aW1lLg0KDQpDaGVlcnMsDQp0YQ0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
