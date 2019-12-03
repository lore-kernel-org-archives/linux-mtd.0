Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635FCC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 14:45:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33CFB20661
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 14:45:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V6D0Jf0k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="N/poeeLy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33CFB20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Ha7BG4p6v+MYAlypmuzt0uhEhBzwb+P0FslPNv2qTw=; b=V6D0Jf0k01FuKx
	hE6AmecBUgCaPs6wDuZgr09i+TuZR74efJqkligPTAWqdJ7Zpt2+hojy6aMAMV0X3m02rI9q/0tTr
	z3rMHrrtxZtnjwO37oVREDMoDZtABY21j9KxsJJMtpsAff+tHO3AnEkJ1dqKkoqar9nF5dO5uOSQn
	UqMxR9aIHswKvoMGu8K8usyHXrTc2ItLyI2UvFbnyIwtjrgsgiziR3DaUwwQCPuENUG0RymXK91fB
	TLtJKALT4WZMS1TpMES+qt29guwies/hIj7Lr8R/NWbr9a+64PaCCDUcU4IaaHjU18GoeoAgdMdDm
	BIr2K6MYbWI1g+IBQ7gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic9QK-0008U1-Ir; Tue, 03 Dec 2019 14:45:08 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic9QH-0007ul-14
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 14:45:06 +0000
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
IronPort-SDR: +kw99fpefD+f1RpX2QYDdLM1qB7jnHAzHpeSAxekXfUv85Sm0/avvzr7oLDhS56SZPHAGl/I5R
 rA2+uO0d/XMAKzz2LTrkZYmyWXYx3ARmkWGESqWXyqvAxnPWL5Vguzyoge+pRsRt6DPYr0IK2e
 +/oie9MTHfQvunqzl5OOXwxGjNbxCmBU6+y8C+CRXc075kWyLy2L6W4E29Zj3cEftaZezzSK/a
 Ydr7h6s3XAvUOC2ZHrcVssBukDXTDan/uSrjN3zPu61OC+eZNXiZ8nmVVZAGoqmmgCddEwwEop
 k2o=
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="59128597"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 03 Dec 2019 07:45:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Dec 2019 07:45:02 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 3 Dec 2019 07:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDRK2yEssHHnB1eGP/RICSnH6wDz3f1nWb8M5+Jb2Z3WNYi0hO37+j0ghJRmeKI3kwF4dZWaT8SSlNSAM0aItD+3pvgJILDZ/2T2rfi0zqJJvQBL6TwZjkZU6mzfOux+pWQXqqfgOQB/aAO+mwgYkGUurDHgtQ6Ek8WlCXUtqyOkgT5TNLx9l121E9oshTdmbvI8AneLWezrIH/wwp4MSVGe+Q5Z0oNTFNHvjlQNu800Os62c83OQAtd8yZ/82TKZYfah3zLlDDC0xJEe0t33UfkPe7ExYpzSQDKzv107XF+Ia3auq7b+xYXmn+G+G3Q5uwLHQe3gj7Esx2RzqDZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bLvanGPEY8wM5x6M3Rq6LCpEUzBg6F6AArYkhOcS0k=;
 b=oEIKki4WXPhiAiJ99ZohuCA6B8GZwRVLA61CqYgzWmnRSH44nLuT7Q0Rc5KCbUe24+gVBHXrloqyPAKlNquB6/1wUd8+GzjGwA9Xm3rn17vDGouffjJjaxUE/daUUU48ItvbxzdU0095mTzkyzXJ7v/9EH0urdnVMc66DU9g/PorNfWQ1VWT7MZHAzX2gLgdhJtvMJzFsS5VHAAmYFSSmvMlnSVjQVdhHLsFyq3KVyu7wmr8nlk3gaD6TjYmKk4G5slHh8g3ZW9ov8xOFcgUfGbXH9RPoXqvRFK/WMmRd/jx1Ldt34lMVo2ikg+79F6pV+lIFLKXUqFU9cGn4y1rBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0bLvanGPEY8wM5x6M3Rq6LCpEUzBg6F6AArYkhOcS0k=;
 b=N/poeeLyZXeeHu2J26bSnphEJJjS7wO+XzlmJBymTiBNkHney8mkq2lfUa+NVLSCSjLMEalb4Nj+TvQLIr42995kSCQL2YZwhTRmvgxCiNI912Nk+/d70MzcBWbYo32AXVZ7f1JgvYsB6Av4Jna7hONDenkI2tXJummF7qBaNLs=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4256.namprd11.prod.outlook.com (52.135.36.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Tue, 3 Dec 2019 14:45:00 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 14:45:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <linux-mtd@lists.infradead.org>
Subject: Re: flash_lock issue for n25q 128mb spi nor part
Thread-Topic: flash_lock issue for n25q 128mb spi nor part
Thread-Index: AQHVqTXrLRyxgk/NSUmXYMf/6XpoyKeoKnuAgAAMpoCAAAo/gIAACjsAgAAFwICAAAY6AIAAAjIAgAAXB4CAAA05AA==
Date: Tue, 3 Dec 2019 14:44:59 +0000
Message-ID: <9d41bfca-f4e3-beb2-ff7f-78be49e8d80e@microchip.com>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
 <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
 <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
 <b73c8a25-a58d-a1f1-f68c-0ba35a5c7c51@huawei.com>
In-Reply-To: <b73c8a25-a58d-a1f1-f68c-0ba35a5c7c51@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::29) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191203164454848
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ed77311-a554-4bf1-16b3-08d777ff5f6a
x-ms-traffictypediagnostic: MN2PR11MB4256:
x-microsoft-antispam-prvs: <MN2PR11MB4256D2CA8F23D7E2B9A6BE22F0420@MN2PR11MB4256.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(199004)(189003)(66946007)(186003)(14454004)(3846002)(2906002)(66476007)(102836004)(6506007)(386003)(5660300002)(14444005)(8676002)(26005)(81166006)(81156014)(66556008)(64756008)(66446008)(99286004)(54906003)(498600001)(86362001)(229853002)(4326008)(110136005)(6116002)(71200400001)(6512007)(6436002)(71190400001)(31696002)(2616005)(6246003)(31686004)(2501003)(8936002)(52116002)(6486002)(11346002)(76176011)(25786009)(256004)(305945005)(7736002)(36756003)(446003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4256;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bLkvKQAgkL5wUJCcwdKot9tlpc8T30YTwOHS/gahIDkT5mj72SYW1wPHJHmfpKkDLxWXG1t8bVu6hsfYKyNvnVh/s+IDxbeCDzZ1ASBXsoNmrOOLjHCaV7UwrT/m77r8ilaUlrAGI4BhtOEMvYUmhlgyEn0XEDJIFYkSu96tHbSnMKeYJ5evBkc2210BXD6uBnQg39b4YUq4h7Wg2gzlKc1ZEJtM7kgkab/RJd0FU6Ui8ZBKJ4552N7ns7QdSAPuNHZt1aIWN8HCfPOHRxuUIbkj9lLNxfzLKWEFSOiftwdfGArwYbutNyJzf+ym8OaWgHulYouad7n7z6PhHp6ZM0u3qUt15r9K0Ah+XXjHmr8XheHsMMgx2SH9luF+t1l3/ynnugWiOFDQ07XYBgKZkR1ONTpNwD3kcV4GHbVVKGO6JtF9EhHOKE4d7xa0flYt
x-ms-exchange-transport-forked: True
Content-ID: <AEF567B5C79B5E4EA0BF6405F3F758C0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ed77311-a554-4bf1-16b3-08d777ff5f6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 14:45:00.0196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2sYKDhtHmtB9BMo8q0q8z/swkNt39+AAr0XTrt6S7YWQmh9bG79yRUh8fx1XCLR5v0Yrr70pCQH4VUj4bGVez9K76EI8zijpsMF1MDnb19c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_064505_100912_0F1CC84C 
X-CRM114-Status: GOOD (  13.48  )
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

DQo+IEhpIFR1ZG9yLA0KDQpIaSwgSm9obiwNCg0KPiANCj4gU29tZXRoaW5nIGVsc2Ugd2hpY2gg
SSB3YW50ZWQgdG8gYXNrIGlzIHdoeSB3ZSBkb24ndCBjaGVjayB0aGUgRlNSIGFmdGVyDQo+IGEg
d3JpdGUgY29tbWFuZCBmb3IgdGhhdCBwYXJ0Pw0KDQpubyBwYXJ0aWN1bGFyIHJlYXNvbiwgbm8g
b25lIGFza2VkIGZvciBpdCA6KS4NCg0KPiANCj4gV2l0aG91dCBpdCwgaWYgdGhlIGZsYXNoIGlz
IGxvY2tlZCwgYSBmbGFzaCB3cml0ZSByZXBvcnRzIG5vIGVycm9yLA0KPiB3aGljaCBjb3VsZCBi
ZSBtYXliZSBtaXNsZWFkaW5nLg0KDQp0cnVlDQoNCj4gDQo+IEEgbW9yZSByZWFsIHByb2JsZW0g
aXMgdGhhdCBJIGZpbmQgdGhhdCBTUi5XRUwgaXMgbm90IGNsZWFyZWQgd2hlbiB3ZQ0KPiBhdHRl
bXB0IHRvIHdyaXRlIHdoZW4gdGhlIGZsYXNoIGlzIGxvY2tlZCwgYW5kIHRoaXMgY2F1c2VzIGlz
c3VlcyB3aGVuDQo+IHdlIGF0dGVtcHQgdG8gcmVzZXQgdGhlIFNSLg0KPiANCj4gSGVyZSdzIGFu
IGV4YW1wbGUgZmxvdyAod2l0aCBteSBoYWNrIHRvIHN0b3AgdXNpbmcgMTZiIFNSIG1ldGhvZCk6
DQo+IA0KPiByb290QHVidW50dTovaG9tZS9qb2huIyBmbGFzaF9sb2NrIC1sIC9kZXYvbXRkMA0K
PiByb290QHVidW50dTovaG9tZS9qb2huIyBtdGRfZGVidWcgZXJhc2UgL2Rldi9tdGQwIDB4ZTAw
MDAwIDQwOTYNCj4gW8KgwqAgNjkuNjUwNjQyXSBzcGktbm9yIHNwaS1QUlAwMDAxOjAwOiBhdCAw
eGUwMDAwMCwgbGVuIDQwOTYNCj4gRXJhc2VkIDQwOTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDBl
MDAwMDAgaW4gZmxhc2gNCj4gcm9vdEB1YnVudHU6L2hvbWUvam9obiMgbXRkX2RlYnVnIHdyaXRl
IC9kZXYvbXRkMCAweGUwMDAwMCA0MDk2IGR1bXA0MDk2DQo+IFvCoMKgIDc3LjA5Mzc1NV0gc3Bp
LW5vciBzcGktUFJQMDAwMTowMDogdG8gMHgwMGUwMDAwMCwgbGVuIDQwOTYNCj4gQ29waWVkIDQw
OTYgYnl0ZXMgZnJvbSBkdW1wNDA5NiB0byBhZGRyZXNzIDB4MDBlMDAwMDAgaW4gZmxhc2gNCj4g
cm9vdEB1YnVudHU6L2hvbWUvam9obiMgbXRkX2RlYnVnIHJlYWQgL2Rldi9tdGQwIDB4ZTAwMDAw
IDQwOTYgdGVtcA0KPiBbwqDCoCA4Mi4xNjI0NDVdIHNwaS1ub3Igc3BpLVBSUDAwMDE6MDA6IGZy
b20gMHgwMGUwMDAwMCwgbGVuIDQwOTYNCj4gQ29waWVkIDQwOTYgYnl0ZXMgZnJvbSBhZGRyZXNz
IDB4MDBlMDAwMDAgaW4gZmxhc2ggdG8gdGVtcA0KPiByb290QHVidW50dTovaG9tZS9qb2huIyBm
bGFzaF9sb2NrIC11IC9kZXYvbXRkMA0KPiBbwqDCoCA4Ny41NTg0MzVdIHNwaS1ub3Igc3BpLVBS
UDAwMDE6MDA6IFNSMTogcmVhZCBiYWNrIHRlc3QgZmFpbGVkDQo+IGZsYXNoX2xvY2s6IGVycm9y
ITogY291bGQgbm90IHVubG9jayBkZXZpY2U6IC9kZXYvbXRkMA0KPiANCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlcnJvciA1IChJbnB1dC9vdXRwdXQgZXJyb3IpDQo+IHJvb3RAdWJ1bnR1Oi9o
b21lL2pvaG4jDQo+IA0KPiBVbmxvY2sgcmVwb3J0cyBhbiBlcnJvciBhcyB0aGUgdGhlIHJlYWQg
YmFjayB0ZXN0IGluDQo+IHNwaV9ub3Jfd3JpdGVfc3IxX2FuZF9jaGVjaygpIGZhaWxzIGFzIHRo
ZSBTUi5XRUwgaGFzIG5ldmVyIGJlZW4gY2xlYXJlZC4NCj4gDQoNCkludGVyZXN0aW5nLg0KDQoN
CkRvZXMgdGhlIGZvbGxvd2luZyBkbyB0aGUgdHJpY2s/DQoNCi0gICAgICAgeyAibjI1cTEyOGEx
MSIsICBJTkZPKDB4MjBiYjE4LCAwLCA2NCAqIDEwMjQsICAyNTYsIFNFQ1RfNEsgfA0KU1BJX05P
Ul9RVUFEX1JFQUQpIH0sDQorICAgICAgIHsgIm4yNXExMjhhMTEiLCAgSU5GTygweDIwYmIxOCwg
MCwgNjQgKiAxMDI0LCAgMjU2LCBTRUNUXzRLIHwgVVNFX0ZTUiB8DQorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBTUElfTk9SX1FVQURfUkVBRCkgfSwNCg0KVGhpcyBjYW4gb2YgY291cnNl
IGJlIGV4dGVuZGVkIHRvIGFsbCBtaWNyb24gZmxhc2hlcywgaWYgYWxsIHN1cHBvcnQgRlNSLCBi
dXQNCnNvbWUgZG9jdW1lbnRhdGlvbiB3b3JrIGhhcyB0byBiZSBtYWRlLg0KDQo+IEknbSBqdXN0
IHNheWluZyB0aGlzIHdoaWxlIGl0J3MgZnJlc2ggaW4gbXkgaGVhZCAtIEkgZG9uJ3Qgd2FudCB0
byBzZWVtDQo+IHB1c2h5IDopDQoNCk5vIHdvcnJpZXMsIHRoaXMgaXMgYSBnb29kIGluaXRpYXRp
dmUsIHRoYW5rcy4NCg0KQ2hlZXJzLA0KdGENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxp
c3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQv
Cg==
