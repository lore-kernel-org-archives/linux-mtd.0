Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D709C2D0C3
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 18:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59952072D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 18:10:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R+mlVayL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="qNGmP2aj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59952072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YCJ+dF5stdVZ+OXd16p8ScxNmb5yl8QJGxHVQEx3lE0=; b=R+mlVayLN3B9Wg
	PPfZR708wRycITCGXnFTbuuAz3IaIH/uRjiN9OdGVBNPvwL2PisZcNk1sOZxrI9fbCFf/f2/QqZ7G
	SckEuzd0BVZYzyQeCJ4Df2AZemT94ba5mYZg5bZ7sswGaH1A7RzQgZxIGqMO9b2z/nzOV0aIR/WRy
	BPvgehnLPnCygNPzFh5qWzomNPAwhYw0vJfCpranO5aGnUv3rLom8nupjmhO5T9UZRQCj1nNX3AQr
	x4r5HzfDT2VAbu8g0CF34HU8k+Kxq8JP1u5KADVgPcQj5paDMnhkKMnE9UTSpm56hzM8ymOjMvaX7
	+WMbbZkhRWr//OveHSBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iguoY-0007dk-SN; Mon, 16 Dec 2019 18:09:50 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iguoT-0007ax-Dx
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 18:09:49 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ZTQJNuqR7PowBnWWwPySOixHEjUOCWw9nuUOOLpYCB5FeJNPqVf1rtbEpontUJ+4adf6ZXHpcn
 7Exa2f5/KYpO+kS5RB47ukgMdpAWuBQohl+IAbxek/yvAnsHgSi9OBbZkI3gxMZ1cRLA6ZdyT1
 ERLQFzBKC38jKOq0zgR+8BMD877Os3c798sBbnKZMwwQhaKZ/dXGNR6FnJnc7Xaf0PP67Y4NeU
 e8JfYimVLI9VIghwto6g6tCKDAKQfxsA8RaiI/6COG1imWwMoHl6Emzt7iQ8JqhzQ1VR283u35
 SvQ=
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="57936083"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Dec 2019 11:09:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 16 Dec 2019 11:09:33 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 16 Dec 2019 11:09:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yh3/9QDUSUN5RalJdsEWdOEa3QWmleuvY398mERMMBvuotrHeLQNf3VCZCjt2qB6ZPCwKGIn+guhJGfIGb+dJ5cRd3mOqXpHq0fUy2vu1dZ60cxpCN5U6dw6G7ZdYa+wrcZs9C4QXSjW5Olym0g9rJ4OVd58Us5BOkvdt8rjpPdGqL14haMkgbr2VIeX7aBIYNlaMF5jvmqdIL/6PUmd0BSMnd6bCMvIwzaoX3UbJDqNPJwJee8M8N7LJt3mzSSm1R3xhUJbPHRecVDK+u8Z0KMWeX7RYSkP7nu5MStIBs9+M8/FhBU0YCd7V6CoEjRRJut9wD7BJg+8WYThyrP+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZOLSIf8/48lDqUiliJTWzRmTdFtNproRZa31DYC/AQ=;
 b=IYckgVS2VXJcyiPEV9QwZUiSA3ylZwNaOR7FekWa9FO2nR2F5D3OvTwHXidQk/QqYk5dt8+Fvp/xcOCwvdHIb2Vov82kvByDWNURp8pmIESkvBLqNCElkw3d3pfrQzH4LO7D95L/r+xW9QmHhbmuy/ypQPxKFFFAurHwuj/g9n6ydhSRCeUxWVquWeEDXaC3mvP97/O9Za+UfQeovDGK/rPMSoCVNvzWavhZVGoYKYXDJPY0y6nxXNSS0rfDmuXMkVBDi/Bk+YMnK9/sUKKrteI3TuwCBR5UODlpRWGuCrHrdduXoOyQVJ18iTQa/iWML26AHuTMBopU/0Lyf480IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZOLSIf8/48lDqUiliJTWzRmTdFtNproRZa31DYC/AQ=;
 b=qNGmP2ajakbYHfLVfzc2XSDFS4RX+dEhdOt4CDDzje/OzwslD1SDHfxVJy85PapwkNp1JZKvVpRmdyYSoFz4tgHwwWlNxGLWI6ujwiNx7s/kIaEgW2PjpB/HRgLPoRzKNAn/HmQ1f8WEtrkyyjtYqRlYbzlJihF0J4BsQCR944g=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4046.namprd11.prod.outlook.com (20.179.151.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.18; Mon, 16 Dec 2019 18:09:32 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 18:09:31 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: Re: flash_lock issue for n25q 128mb spi nor part
Thread-Topic: flash_lock issue for n25q 128mb spi nor part
Thread-Index: AQHVqTXrLRyxgk/NSUmXYMf/6XpoyKeoKnuAgAAMpoCAAAo/gIAACjsAgAAFwICAAAY6AIAAAjIAgAAXB4CAAA05AIAADFwAgAFKAICAE1EegA==
Date: Mon, 16 Dec 2019 18:09:31 +0000
Message-ID: <c1a92c89-020d-0847-b7bf-41dbfd9b972e@microchip.com>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
 <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
 <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
 <b73c8a25-a58d-a1f1-f68c-0ba35a5c7c51@huawei.com>
 <9d41bfca-f4e3-beb2-ff7f-78be49e8d80e@microchip.com>
 <32a6af31-341b-67cf-a98d-d77a495c7ecc@huawei.com>
 <ee532299-eaa7-28b5-d34c-46816640a1f0@huawei.com>
In-Reply-To: <ee532299-eaa7-28b5-d34c-46816640a1f0@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56447283-d47d-476d-44d2-08d782531985
x-ms-traffictypediagnostic: MN2PR11MB4046:
x-microsoft-antispam-prvs: <MN2PR11MB404632B4E2831C23DC7520F9F0510@MN2PR11MB4046.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(366004)(396003)(136003)(376002)(199004)(189003)(6486002)(81166006)(66446008)(64756008)(66556008)(66476007)(5660300002)(81156014)(91956017)(8676002)(36756003)(478600001)(66946007)(71200400001)(76116006)(4326008)(31686004)(86362001)(31696002)(316002)(8936002)(53546011)(6506007)(26005)(2906002)(6512007)(54906003)(110136005)(186003)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4046;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sNF9TXIm3zAMFZ0aOoPCU/CRQ80JEbulZ79/Q70syOVUInQAkE/vUPTOtzWz/SADtDVC3TP+ZDYdiRDqxk/TLp9zaCL1C6iOcvY/XEFLeTxP07Wv6tTpyjabP4r4mqEOjfVyQypbyCHgmkGe4O7ogGmYnvIaAkQtyr2nel5eOaLGO2gAnusZQ7415w58/S+fn69UMfRgpMac2005k0rphbwdnWRwVg4W6Yz+2o5CT5gwsKKndAzPlbH7MLuHxunnnnUwInrehwEYWDZgDT30HGRVxJZL275i5V4+r3bBmqycfdq2k+eiC3/eH+hjfpsXW5WzR1zxmq9pTUA7H6quJPdiPaWiDxHa3euuCv6zMit6coXWutu2/K6B7rEoFdX71VgqHD3XJQsjV61OvWPR4rvZrhOo1c8JeCaDGPErcFq9HpFAQeA3i9+Ks/mCZ5Hl
x-ms-exchange-transport-forked: True
Content-ID: <9A33AA0CDC64FE44BFD6CF11A95451C6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 56447283-d47d-476d-44d2-08d782531985
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 18:09:31.7445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHCmrk161ca+izlK3txOD3jLdNvM7UOE/8aHc37jpcXblrGP2WOmpV94FD8faw6rLIMhvF4ZuRrPSfF9LyXKCwQiiDEec741HZJy8Hmv9+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_100945_578014_5626897F 
X-CRM114-Status: GOOD (  17.18  )
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
Cc: broonie@kernel.org, fengsheng5@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIEpvaG4sDQoNCk9uIDEyLzQvMTkgMToxMCBQTSwgSm9obiBHYXJyeSB3cm90ZToNCj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAwMy8xMi8yMDE5IDE1OjI5
LCBKb2huIEdhcnJ5IHdyb3RlOg0KPj4+Pg0KPj4+PiBIZXJlJ3MgYW4gZXhhbXBsZSBmbG93ICh3
aXRoIG15IGhhY2sgdG8gc3RvcCB1c2luZyAxNmIgU1IgbWV0aG9kKToNCj4+Pj4NCj4+Pj4gcm9v
dEB1YnVudHU6L2hvbWUvam9obiMgZmxhc2hfbG9jayAtbCAvZGV2L210ZDANCj4+Pj4gcm9vdEB1
YnVudHU6L2hvbWUvam9obiMgbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkMCAweGUwMDAwMCA0MDk2
DQo+Pj4+IFvCoMKgIDY5LjY1MDY0Ml0gc3BpLW5vciBzcGktUFJQMDAwMTowMDogYXQgMHhlMDAw
MDAsIGxlbiA0MDk2DQo+Pj4+IEVyYXNlZCA0MDk2IGJ5dGVzIGZyb20gYWRkcmVzcyAweDAwZTAw
MDAwIGluIGZsYXNoDQo+Pj4+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyB3cml0
ZSAvZGV2L210ZDAgMHhlMDAwMDAgNDA5NiBkdW1wNDA5Ng0KPj4+PiBbwqDCoCA3Ny4wOTM3NTVd
IHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IHRvIDB4MDBlMDAwMDAsIGxlbiA0MDk2DQo+Pj4+IENv
cGllZCA0MDk2IGJ5dGVzIGZyb20gZHVtcDQwOTYgdG8gYWRkcmVzcyAweDAwZTAwMDAwIGluIGZs
YXNoDQo+Pj4+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIG10ZF9kZWJ1ZyByZWFkIC9kZXYvbXRk
MCAweGUwMDAwMCA0MDk2IHRlbXANCj4+Pj4gW8KgwqAgODIuMTYyNDQ1XSBzcGktbm9yIHNwaS1Q
UlAwMDAxOjAwOiBmcm9tIDB4MDBlMDAwMDAsIGxlbiA0MDk2DQo+Pj4+IENvcGllZCA0MDk2IGJ5
dGVzIGZyb20gYWRkcmVzcyAweDAwZTAwMDAwIGluIGZsYXNoIHRvIHRlbXANCj4+Pj4gcm9vdEB1
YnVudHU6L2hvbWUvam9obiMgZmxhc2hfbG9jayAtdSAvZGV2L210ZDANCj4+Pj4gW8KgwqAgODcu
NTU4NDM1XSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBTUjE6IHJlYWQgYmFjayB0ZXN0IGZhaWxl
ZA0KPj4+PiBmbGFzaF9sb2NrOiBlcnJvciE6IGNvdWxkIG5vdCB1bmxvY2sgZGV2aWNlOiAvZGV2
L210ZDANCj4+Pj4NCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVycm9yIDUgKElucHV0
L291dHB1dCBlcnJvcikNCj4+Pj4gcm9vdEB1YnVudHU6L2hvbWUvam9obiMNCj4+Pj4NCj4+Pj4g
VW5sb2NrIHJlcG9ydHMgYW4gZXJyb3IgYXMgdGhlIHRoZSByZWFkIGJhY2sgdGVzdCBpbg0KPj4+
PiBzcGlfbm9yX3dyaXRlX3NyMV9hbmRfY2hlY2soKSBmYWlscyBhcyB0aGUgU1IuV0VMIGhhcyBu
ZXZlciBiZWVuDQo+Pj4+IGNsZWFyZWQuDQo+Pj4+DQo+Pj4NCj4+PiBJbnRlcmVzdGluZy4NCj4+
DQo+PiBJIG5vdGUgdGhhdCBzcGlfbm9yX2VyYXNlKCkgZXhpdHMgd2l0aCBhIGNhbGwgdG8NCj4+
IHNwaV9ub3Jfd3JpdGVfZGlzYWJsZSgpLCB5ZXQgc3BpX25vcl93cml0ZSgpIGRvZXNuJ3QgLSBt
YXliZSB3ZSBzaG91bGQNCj4+IGFkZCBhIHNpbWlsYXIgY2FsbCB0aGVyZS4NCj4gDQo+IFNvIHRo
aXMgcmVtZWRpZXMgdGhhdCBpc3N1ZSBmb3IgbWU6DQo+IA0KPiBjb21taXQgYzkwZGU1ODNkODFm
N2M1YzZjYjFjOGMwMjExMDhhMGU3ZTI0NGI5MSAoSEVBRCkNCj4gQXV0aG9yOiBKb2huIEdhcnJ5
IDxqb2huLmdhcnJ5QGh1YXdlaS5jb20+DQo+IERhdGU6wqDCoCBXZWQgRGVjIDQgMTA6MjY6NDkg
MjAxOSArMDAwMA0KPiANCj4gwqDCoMKgIEVuc3VyZSB3ZSBjbGVhciBTUi5XRUwgZm9yIGFueSB3
cml0ZSBmYWlsdXJlIGR1ZSB0byBsb2NraW5nDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NwaS1ub3IuYw0KPiBp
bmRleCBhZWIzYWQyZGJmYjguLjNmMTIzMzVlYjIwYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9t
dGQvc3BpLW5vci9zcGktbm9yLmMNCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9zcGktbm9y
LmMNCj4gQEAgLTI4NzUsNiArMjg3NSw4IEBAIHN0YXRpYyBpbnQgc3BpX25vcl93cml0ZShzdHJ1
Y3QgbXRkX2luZm8gKm10ZCwNCj4gbG9mZl90IHRvLCBzaXplX3QgbGVuLA0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgaSArPSB3cml0dGVuOw0KPiDCoMKgwqDCoMKgwqDCoCB9DQo+
IA0KPiArwqDCoMKgwqDCoMKgIHJldCA9IHNwaV9ub3Jfd3JpdGVfZGlzYWJsZShub3IpOw0KPiAr
DQo+IMKgd3JpdGVfZXJyOg0KPiDCoMKgwqDCoMKgwqDCoCBzcGlfbm9yX3VubG9ja19hbmRfdW5w
cmVwKG5vciwgU1BJX05PUl9PUFNfV1JJVEUpOw0KPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0
Ow0KPiANCj4gDQo+Pg0KPj4+DQo+Pj4NCj4+PiBEb2VzIHRoZSBmb2xsb3dpbmcgZG8gdGhlIHRy
aWNrPw0KPj4+DQo+Pj4gLcKgwqDCoMKgwqDCoCB7ICJuMjVxMTI4YTExIizCoCBJTkZPKDB4MjBi
YjE4LCAwLCA2NCAqIDEwMjQswqAgMjU2LCBTRUNUXzRLIHwNCj4+PiBTUElfTk9SX1FVQURfUkVB
RCkgfSwNCj4+PiArwqDCoMKgwqDCoMKgIHsgIm4yNXExMjhhMTEiLMKgIElORk8oMHgyMGJiMTgs
IDAsIDY0ICogMTAyNCzCoCAyNTYsIFNFQ1RfNEsgfA0KPj4+IFVTRV9GU1IgfA0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTUElf
Tk9SX1FVQURfUkVBRCkgfSwNCj4+Pg0KPiANCj4gWWVzLCB0aGF0IHdvcmtzIGFuZCBpdCdzIG5p
Y2UgdG8gbm90IGhhdmUgdGhlIHNpbGVudCBmYWlsdXJlczoNCj4gDQo+IHJvb3RAdWJ1bnR1Oi9o
b21lL2pvaG4jIGZsYXNoX2xvY2sgLWkgL2Rldi9tdGQwDQo+IERldmljZTogL2Rldi9tdGQwDQo+
IFN0YXJ0OiAwDQo+IExlbjogMHgxMDAwMDAwDQo+IExvY2sgc3RhdHVzOiBsb2NrZWQNCj4gUmV0
dXJuIGNvZGU6IDENCj4gcm9vdEB1YnVudHU6L2hvbWUvam9obiMNCj4gcm9vdEB1YnVudHU6L2hv
bWUvam9obiMgbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRkMCAweGUwMDAwMCA0MDk2DQo+IFvCoMKg
IDQ1LjAyMzM1M10gc3BpLW5vciBzcGkwLjA6IEVyYXNlIG9wZXJhdGlvbiBmYWlsZWQuDQo+IFvC
oMKgIDQ1LjAyODI1N10gc3BpLW5vciBzcGkwLjA6IEF0dGVtcHRlZCB0byBtb2RpZnkgYSBwcm90
ZWN0ZWQgc2VjdG9yLg0KPiBNRU1FUkFTRTogSW5wdXQvb3V0cHV0IGVycm9yDQo+IG10ZF9kZWJ1
ZyB3cml0ZSAvZGV2L210ZDAgMHhlMDAwMDAgNDA5NiBkdW1wNDA5Ng0KPiBbwqDCoCA1MC4yMTIw
MTNdIHNwaS1ub3Igc3BpMC4wOiBQcm9ncmFtIG9wZXJhdGlvbiBmYWlsZWQuDQo+IFvCoMKgIDUw
LjIxNzA4NF0gc3BpLW5vciBzcGkwLjA6IEF0dGVtcHRlZCB0byBtb2RpZnkgYSBwcm90ZWN0ZWQg
c2VjdG9yLg0KPiBmaWxlX3RvX2ZsYXNoOiB3cml0ZSwgc2l6ZSAweDEwMDAsIG4gMHgxMDAwDQo+
IHdyaXRlKCk6IElucHV0L291dHB1dCBlcnJvcg0KPiByb290QHVidW50dTovaG9tZS9qb2huIyBt
dGRfZGVidWcgcmVhZCAvZGV2L210ZDAgMHhlMDAwMDAgNDA5NiB0ZW1wDQo+IENvcGllZCA0MDk2
IGJ5dGVzIGZyb20gYWRkcmVzcyAweDAwZTAwMDAwIGluIGZsYXNoIHRvIHRlbXANCj4gcm9vdEB1
YnVudHU6L2hvbWUvam9obiMgZmxhc2hfbG9jayAtdSAvZGV2L210ZDANCj4gZmxhc2hfbG9jazog
ZXJyb3IhOiBjb3VsZCBub3QgdW5sb2NrIGRldmljZTogL2Rldi9tdGQwDQo+IA0KPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVycm9yIDUgKElucHV0L291dHB1dCBlcnJvcikNCj4gcm9vdEB1YnVu
dHU6L2hvbWUvam9obiMgZmxhc2hfbG9jayAtaSAvZGV2L210ZDANCj4gRGV2aWNlOiAvZGV2L210
ZDANCj4gU3RhcnQ6IDANCj4gTGVuOiAweDEwMDAwMDANCj4gTG9jayBzdGF0dXM6IHVubG9ja2Vk
DQo+IFJldHVybiBjb2RlOiAwDQo+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jIGZsYXNoX2xvY2sg
LXUgL2Rldi9tdGQwDQo+IHJvb3RAdWJ1bnR1Oi9ob21lL2pvaG4jDQo+IA0KPiBCdXQsIGFzIHlv
dSBtYXkgc2VlLCBpdCBzZWVtcyB0aGF0IG15IGNoYW5nZSB0byBzcGlfbm9yX3dyaXRlKCkgaXMg
c3RpbGwNCj4gcmVxdWlyZWQgdG8gc3RvcCB0aGUgZmlyc3QgdW5sb2NrIGZhaWx1cmUgbWVzc2Fn
ZSwgYnV0IGl0IG5lZWRzIHRvIGJlDQo+IHJlbG9jYXRlZCB0byBhZnRlciB3cml0ZV9lcnIgbGFi
ZWwsIGFzIHdlIG5vdyBqdW1wIHRoZXJlIGZvcg0KPiBzcGlfbm9yX3dhaXRfdGlsbF9yZWFkeSgp
IGZhaWx1cmUuIEkgZ3Vlc3MgdGhlIGVxdWl2YWxlbnQgcmVsb2NhdGlvbiBpcw0KPiBhbHNvIHJl
cXVpcmVkIGZvciBzcGlfbm9yX2VyYXNlKCkuDQo+IA0KPiBPciBtYXliZSBzcGlfbm9yX3dhaXRf
dGlsbF9yZWFkeSgpIHNob3VsZCBjbGVhciB0aGlzIGZsYWcgYWx3YXlzLg0KDQpJIHJlcHJvZHVj
ZWQgdGhpcyBvbiBhIG4yNXEyNTZhLCB3aXRoIGJvdGggZXJhc2UgYW5kIHdyaXRlLiBEaWQgYSBs
b2NrLA0KYW4gZXJhc2Ugb3Igd3JpdGUsIGFuZCB0aGVuIHRoZSB1bmxvY2sgcmFpc2VzIGFuIGVy
cm9yIG9uIHRoZSByZWFkIGJhY2sgdGVzdDoNCml0IHJlY2VpdmVzIDB4MDIgdG8gd3JpdGUgKHRo
ZSBwcmV2IG9wZXJhdGlvbiBsZXQgdGhlIFNSLldFIHNldCB0byAxKSwNCmFuZCBhZnRlciB3cml0
ZSwgaXQgcmVhZHMgYmFjayAweDAwICh3aGljaCBpcyBjb3JyZWN0LCBXRSBpcyBkZS1hc3NlcnRl
ZCkuDQoNCldoYXQgaXMgcHJldHR5IHN0cmFuZ2UgaXMgdGhhdCBNaWNyb24gc2F5cyBhYm91dCBl
cmFzZSBvciBwcm9ncmFtIG9wZXJhdGlvbnMNCnRoYXQ6ICJXaGVuIHRoZSBvcGVyYXRpb24gaXMg
aW4gcHJvZ3Jlc3MsIHRoZSB3cml0ZSBpbiBwcm9ncmVzcyBiaXQgaXMgc2V0DQp0byAxLiBUaGUg
d3JpdGUgZW5hYmxlIGxhdGNoIGJpdCBpcyBjbGVhcmVkIHRvIDAsIHdoZXRoZXIgdGhlIG9wZXJh
dGlvbiBpcw0Kc3VjY2Vzc2Z1bCBvciBub3QiLg0KDQpTbyB3aGF0IEkgZ3Vlc3MgaXQgaGFwcGVu
cywgaXMgdGhhdCB3aGVuIGFuIGVyYXNlL3dyaXRlIGNvbW1hbmQgdHJpZXMgdG8NCm1vZGlmeSBh
IHNvZnR3YXJlIHByb3RlY3RlZCBhcmVhLCB0aGUgZmxhc2ggY29tcGxldGVseSBpZ25vcmVzIHRo
ZSBjb21tYW5kLA0Kc28gbm8gV3JpdGUgSW4gUHJvZ3Jlc3MsIGFuZCBubyBjbGVhcmluZyBvZiB0
aGUgV0UuDQoNCkFuIGlkZWEgd291bGQgYmUgdG8gY2xlYXIgdGhlIFdFIGluIHNwaV9ub3Jfc3Iv
ZnNyX3JlYWR5KCkgd2hlbiBlcnJvcnMuDQpJJ2xsIGNvbnRpbnVlIHRvIGRlYnVnL3N0dWR5IHRo
aXMuDQoNCkNoZWVycywNCnRhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
