Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC3B8C432C3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 09:46:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A060B20661
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 09:46:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="STF1UGI7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="o7eFKayy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A060B20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZCzi8IQEaHjGptd+W972rEIuKm+pfcazEkpJ8q0fVo=; b=STF1UGI7PhJbjG
	VbQv3PaF2WBn/9FjnT9Q2crAAqm+O+RU/r36vUhPIYs3rNNPJ6ODx6eW23/isEycDGsOBQZEfPHcN
	+0LUTXSIAm3kK/+d4bbpuxU1Edmf43dAx1gb58l5MN920obZtw24m1cPz12OxJMySHrxa6pNagPSW
	sxsOWNIGiaubPWWalbDgnF/yvlBa+qfHLvWADAqFL7PD32FuB2HaxcYsl04B5cXMz6q6bSPkepJgg
	HZcIQNjU9+lcxr/keztDn9I46Z7m+my7m7nwUTJQKGKi4DcnQhAsI0tngvFOWtEQYkvsUj/6A+Q8E
	hS05kSEeRltgern7g2vw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic4l3-0005Mg-Sf; Tue, 03 Dec 2019 09:46:13 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic4ky-0005Lg-Mn
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 09:46:11 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: H2dXJKCPY5DoMmvL+75TNEF5htW38d70IZE7/JFYW2MruQia74x4KIFDiY1iVHH29Dcmw6dTW2
 B4g0h/KSAvRMCuAdD4Z1UpEMQs3ZrRuomOIeisV9d3Jptz5o8ihn6t8t7KaQjm34CbYFw2J81T
 l1dOOHQYJXSN6YupehBluvrl1EEqND7lyT0OFIgkQFqKWfZBFx7dh8HAUD1nrOOr1AOL2QgsDb
 6UZJbjAWUP1pOPd7Dehe5ay5RdmOHz/5oS+E93gKzTtE1uh5vbwdg07anMZnxAiPneaqLRcaIp
 S5M=
X-IronPort-AV: E=Sophos;i="5.69,272,1571727600"; d="scan'208";a="58565296"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2019 02:46:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Dec 2019 02:46:01 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Dec 2019 02:46:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCsuu1hA7aADIWS8whDBozaf2UAuYUjRIy3vQwFKG64FddgbexULUxwzzN2QYxfLTgBDkUsdQF4lR9jG9+InmFJocj8/I4OouXGuY6K8xaq2D03xA6jgPgBL3sHl/80kUDq72nHt8hqrmbKBgAfIi6xRTmBl9ZHLBL/Y+yY8ZK9ZbbQ0Z7LmLuN6o+8Rth+f2XRsUck8whe1QEUfIq2TrXxTNaL7PULq+MNFfw0pn6zTdNtGt4eLdRSP8m6r9L7mgklTFsgu5egP8jMkKVDySDjoaxZsRp+ud6NsMYFMIU9pkIwJ9SGYMf72ZncyA/U6wP+yyYkQrdg79WrXb7nJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C92Lkj2ejzrS8CBoqmF/vQI7/iO1XkHSJAX5YoKNz7M=;
 b=H+JXjdhVfLSjrUPnhHFu/1h+lrJDUngbE+N+NR/rwf5bRGUXDRD+9yIatFBLun+uwmuqhAqqk8GBM1uWVA5wpSbS8N/rM4pEw5RlzyVdUpvBI1UVRzsekGo7PoY2bgI+p7qly3tNQP8AkLj0ysmYxTBUUY5bpPdLUP/rj3M6KtXGt7N+/Y/ZY3WBKfHJxXLHsr5EDJ5gWKg0SYYEsNxbIl0tD8lVDvwu64N5KI0ptaU+isc+Du3yMF7XUjWoAtcCez/v4hJqdolAo5eCnDB2KLqq3pIaCHqPGrv/spixk4CyGrUBZLjtMDUqEQYuvvhf5ynp2OEoKzMbtgBQXSbKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C92Lkj2ejzrS8CBoqmF/vQI7/iO1XkHSJAX5YoKNz7M=;
 b=o7eFKayykr4I5Tgl4IazXYg7rKcvLsEL77QOHgmCoGW/TkSbN8rbn7vLYFB5aIxjUCutzlP24AvSQTfkaM02/gES53P+dRLeGL0UIBM91/pGWgEJG45/3UwNWuNGEDkgWVMRJ8fwDi7+yYZo52TrPR5GdZ88EhwOtrya9b4LZGg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4511.namprd11.prod.outlook.com (52.135.37.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Tue, 3 Dec 2019 09:45:59 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 09:45:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: Re: flash_lock issue for n25q 128mb spi nor part
Thread-Topic: flash_lock issue for n25q 128mb spi nor part
Thread-Index: AQHVqTXrLRyxgk/NSUmXYMf/6XpoyKeoKnuA
Date: Tue, 3 Dec 2019 09:45:59 +0000
Message-ID: <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
In-Reply-To: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::39) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191203114553648
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc87f130-16c0-4e1c-51e6-08d777d59a15
x-ms-traffictypediagnostic: MN2PR11MB4511:
x-microsoft-antispam-prvs: <MN2PR11MB45116F9A90C863B30867C89AF0420@MN2PR11MB4511.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(39860400002)(136003)(366004)(199004)(189003)(316002)(5660300002)(305945005)(99286004)(446003)(8676002)(2616005)(2906002)(31686004)(54906003)(110136005)(256004)(6486002)(11346002)(36756003)(86362001)(5024004)(229853002)(14444005)(8936002)(6436002)(71190400001)(81156014)(966005)(478600001)(81166006)(71200400001)(31696002)(2501003)(66556008)(52116002)(66946007)(76176011)(6246003)(64756008)(25786009)(102836004)(4326008)(6116002)(3846002)(26005)(6306002)(14454004)(53546011)(6506007)(386003)(66446008)(6512007)(7736002)(186003)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4511;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M9x3aJ3B0hLxfcZGRvIVtGImtASgS7FFm0K6mTZK+Ifp5PnKtKM2yzeAUvRM0tK0nAHIUgNd8H0jlhtYwgOVvUYzIAxgbwCS0H6cPgKoEcOcjfhkt2bvkuSwYI6TH5Npzmf4+HCWG9/eHs/shGV/7rxOswagGvPVVtSPdP2+QhkrXInwJJIOck3mvSkv5GjnAizP2WcGRVw/SkOXN0Hjqo31nmotn1TBhKcaQguY787Y3NJ/VpTHyQymjO4VjrZT4EBMEKDg6lLJX4AVLnxmo0t46bxEj1kq5C99d/r46ns0f1ij4vELpVIZaqN8hnXXOnrQoRFz5KDwoyvyCYhiN7oftUAosi2Eioyle/ADYwD2/dmwHHTPB57T+MILNJwPxedesBDlBVv4DhdZOOeb9pkQQDuPJF9bxHxxuJU/0KKPDGjk9VFcCJt87QamKGsBIKZqoTiekU7GH9YSg6Y6lHobyuYzSzqUWT4wt4vFnrA=
x-ms-exchange-transport-forked: True
Content-ID: <91E3A6EE2DBD6648B806EC2130CFCC1A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bc87f130-16c0-4e1c-51e6-08d777d59a15
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 09:45:59.4241 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwmQ4Fl0ewtCmJxcTz61HDs5X0DlKU/zp3I+DKfhBiRmyiVuaMcN+/9hoqpNAMH72kpE4RHN/oPUXPpMX3L0oPP0j8XfoZsAZ8D441lxCH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_014608_838537_AF2B59E9 
X-CRM114-Status: GOOD (  17.87  )
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

SGksIEpvaG4sDQoNCk9uIDEyLzIvMTkgNzoyOCBQTSwgSm9obiBHYXJyeSB3cm90ZToNCj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSBndXlzLA0KPiANCj4gSSBh
bSB0ZXN0aW5nIHRoZSBmb2xsb3dpbmcgZHJpdmVyIG9uIHRvcCBvZiBMaW51cycgbWFzdGVyIGJy
YW5jaCB3aXRoIGENCj4gbjI1cTEyOGExMSBwYXJ0Og0KDQpJIHVuZGVyc3RhbmQgdGhlIHlvdSBl
bmFibGVkIGxvY2tpbmcgc3VwcG9ydCBmb3IgdGhpcyBmbGFzaCBvbiB5b3VyIHNpZGUsDQpiZWNh
dXNlIGluIG1haW5saW5lIGl0IGlzIG5vdCB5ZXQgdGhlcmUuDQoNCkJlIGF3YXJlIHRoYXQgdGhp
cyBmbGFzaCBoYXMgQlAzIHN1cHBvcnQsIGFuZCBpbiBtYWlubGluZSB3ZSBzdXBwb3J0IGZvciBu
b3cNCmp1c3QgQlAwLUJQMiwgc28ganVzdCBhIHBhcnRpYWwgbG9jayBjYW4gYmUgYWNoaWV2ZWQs
IGFuZCBpdCBkZXBlbmRzIG9uIHdoYXQgeW91DQp0cmllZCB0byBsb2NrLiBJdCB3aWxsIGJlIGhl
bHBmdWwgdG8gdGVsbCBob3cgeW91IGVuYWJsZWQgdGhlIGxvY2tpbmcgYW5kIHdoYXQNCmNvbW1h
bmRzIGRpZCB5b3UgdXNlLg0KDQo+IA0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1t
dGQvMTU3Mjg4NjI5Ny00NTQwMC0zLWdpdC1zZW5kLWVtYWlsLWpvaG4uZ2FycnlAaHVhd2VpLmNv
bS8NCj4gDQo+IEkgYW0gZmluZGluZyBmbGFzaCBsb2NrIGlzIG5vdCB3b3JraW5nLiBFdmVuIGFm
dGVyIGEg4oCcc3VjY2Vzc2Z1bOKAnSBsb2NrLA0KPiBmbGFzaF9sb2NrIGlzIHJlcG9ydGluZyBm
bGFzaCBpcyB1bmxvY2tlZC4gQW5kIEkgY2FuIHN0aWxsIHdyaXRlIHRvIHRoZQ0KPiBmbGFzaC4N
Cj4gDQo+IEkgZmluZCB0aGF0IHNpbmNlIDM5ZDFlMzM0MGM3MyAoIm10ZDogc3BpLW5vcjogRml4
IGNsZWFyaW5nIG9mIFFFIGJpdCBvbg0KPiBsb2NrKCkvdW5sb2NrKCkiKSwgd2UncmUgdXNpbmcg
YSAxNmIgU1IgZm9yIHRoaXMgcGFydCBpbiB0aGUgZHJpdmVyLCBidXQNCj4gdGhpcyBwYXJ0IG9u
bHkgaGFzIGEgOGIgU1IuDQo+IA0KPiBUaGlzIGhhY2sgZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1l
Og0KPiANCj4gQCAtNDY5MSw3ICs0NjkxLDcgQEAgc3RhdGljIHZvaWQgc3BpX25vcl9pbmZvX2lu
aXRfcGFyYW1zKHN0cnVjdCBzcGlfbm9yDQo+ICpub3IpDQo+IHBhcmFtcy0+c2V0XzRieXRlID0g
c3BhbnNpb25fc2V0XzRieXRlOw0KPiBwYXJhbXMtPnNldHVwID0gc3BpX25vcl9kZWZhdWx0X3Nl
dHVwOw0KPiAvKiBEZWZhdWx0IHRvIDE2LWJpdCBXcml0ZSBTdGF0dXMgKDAxaCkgQ29tbWFuZCAq
Lw0KPiAtIG5vci0+ZmxhZ3MgfD0gU05PUl9GX0hBU18xNkJJVF9TUjsNCj4gKy8vIG5vci0+Zmxh
Z3MgfD0gU05PUl9GX0hBU18xNkJJVF9TUjsNCg0KVGhpcyBtZWFucyB0aGF0IGJmcHQgaXMgbm90
IHBhcnNlZC4gWW91IGNhbiBjb25maXJtIHRoaXMgYnkgcnVubmluZyB3aXRoIHRoZQ0KcGF0Y2gg
ZnJvbSBiZWxvdy4NCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5j
IGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCmluZGV4IGY0YWZlMTIzZTlkYy4uNzM1
Y2Q1MjAyNTk4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9yLmMNCisr
KyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3BpLW5vci5jDQpAQCAtMzU0NSw4ICszNTQ1LDExIEBA
IHN0YXRpYyBpbnQgc3BpX25vcl9wYXJzZV9iZnB0KHN0cnVjdCBzcGlfbm9yICpub3IsDQogICAg
ICAgICAgICAgICAgcmV0dXJuIGVycjsNCg0KICAgICAgICAvKiBGaXggZW5kaWFubmVzcyBvZiB0
aGUgQkZQVCBEV09SRHMuICovDQotICAgICAgIGZvciAoaSA9IDA7IGkgPCBCRlBUX0RXT1JEX01B
WDsgaSsrKQ0KKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgQkZQVF9EV09SRF9NQVg7IGkrKykgew0K
ICAgICAgICAgICAgICAgIGJmcHQuZHdvcmRzW2ldID0gbGUzMl90b19jcHUoYmZwdC5kd29yZHNb
aV0pOw0KKyAgICAgICAgICAgICAgIGRldl9lcnIobm9yLT5kZXYsICJiZnB0LmR3b3Jkc1slZF0g
PSAlMDh4XG4iLCBpLA0KKyAgICAgICAgICAgICAgICAgICAgICAgYmZwdC5kd29yZHNbaV0pOw0K
KyAgICAgICB9DQoNCiAgICAgICAgLyogTnVtYmVyIG9mIGFkZHJlc3MgYnl0ZXMuICovDQogICAg
ICAgIHN3aXRjaCAoYmZwdC5kd29yZHNbQkZQVF9EV09SRCgxKV0gJiBCRlBUX0RXT1JEMV9BRERS
RVNTX0JZVEVTX01BU0spIHsNCkBAIC0zNjQ5LDYgKzM2NTIsOSBAQCBzdGF0aWMgaW50IHNwaV9u
b3JfcGFyc2VfYmZwdChzdHJ1Y3Qgc3BpX25vciAqbm9yLA0KICAgICAgICBwYXJhbXMtPnBhZ2Vf
c2l6ZSA+Pj0gQkZQVF9EV09SRDExX1BBR0VfU0laRV9TSElGVDsNCiAgICAgICAgcGFyYW1zLT5w
YWdlX3NpemUgPSAxVSA8PCBwYXJhbXMtPnBhZ2Vfc2l6ZTsNCg0KKyAgICAgICBkZXZfZXJyKG5v
ci0+ZGV2LCAiYmZwdC5kd29yZHNbQkZQVF9EV09SRCgxNSldICYgQkZQVF9EV09SRDE1X1FFUl9N
QVNLID0NCiUwOHhcbiIsDQorICAgICAgICAgICAgICAgYmZwdC5kd29yZHNbQkZQVF9EV09SRCgx
NSldICYgQkZQVF9EV09SRDE1X1FFUl9NQVNLKTsNCisNCiAgICAgICAgLyogUXVhZCBFbmFibGUg
UmVxdWlyZW1lbnRzLiAqLw0KICAgICAgICBzd2l0Y2ggKGJmcHQuZHdvcmRzW0JGUFRfRFdPUkQo
MTUpXSAmIEJGUFRfRFdPUkQxNV9RRVJfTUFTSykgew0KICAgICAgICBjYXNlIEJGUFRfRFdPUkQx
NV9RRVJfTk9ORToNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
