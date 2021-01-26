Return-Path: <SRS0=ENrU=G5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C8BC433E6
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 08:53:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A5B62220B
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jan 2021 08:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A5B62220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IOnsR5OUx/HMDULscpbkdtBSN2X0K87FIjRqmcNbZX8=; b=1xFUFWOeJ6AeWJW4xqzJ1kGXK
	/IrMVehS+5yAzpT5vnh+fTuvVZ+ycnSr1JtGxDDUrRTMejgsaEfapChJKzdyiNXBWIwMN/t8wdBiV
	Pbxb6Ml6gYE7nomzdUDnWuRMSm5xSUdmJXx7MqzWc2f+c0U83FuWIzeDDFNiOWe/LuiV+dpzpe19Q
	GhpxMOLlr6D+8KLYXCnWrCHboq85oWLrD6fz8i11KOBmNa2B4Sjau8pJ2HucYV2gv1Y+/Y75wiCU+
	Q1oEMz1SZ3v7Z8WSKuWkq7uHGNbaA5HHuLvwlEfxqFcxgMB0eEkQQ4/FNC6f4n9qiUjj8yZvn5/Z2
	wENrK/KNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4K4m-0006jo-Ob; Tue, 26 Jan 2021 08:51:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4K4h-0006ik-6y
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2021 08:51:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1611651107; x=1643187107;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/abHvnQtn7SzB2khguuwHNxBXDkCpe/sYCSPRZ9n/3g=;
 b=Bq6kUGyMDLc0sprhwrEi03ojgvkNW2Dnrd/0jd2Von1JW7UWWQcPArNH
 Ejy1VL4t/GdbPnOMFevJ/qZTsypTKycRrY8sT6hsb67OZcSl8Mh8m8dbv
 k1UaXMn9E9tUrwQVz3i4I6dpbk4Y5XwQelTK47f2VUU25lpjulfuGohit
 uhb3BJwhu/Qtv6gcTBr2yfv/1+WUxQhCDpVYMTXnrGoblaxx4MXKgpgYA
 OECNNr9TTnB8y6WulIbY0MlliFGLvCq05p4bvFNUgNaxUZmu2q1bon/0l
 IEpjtTRLdRJDc390bDXaXyuU/2OpIglOI3hxrlNN9TbybJJ8A3znxbD7C w==;
IronPort-SDR: uNnHlbRaijF7jdmiOEc0Sp7bo7UtzE7zqZGVHTLNnOyonfBmAcc9uqxN3zKaKtN/21BtKKTtrw
 chyIzCgzIbFB6ULALB8zlMB1PSXEH3oc2VvlKuub9KDnk26KE4xffAmqm4ZBgIhg/k5KqkOe8D
 WIaBmLP+WfH1x2Yihl8pZcaIPjuH5n0ffGHM2x0mfFCGtsn+NW23bRm67HjX7VxogBXp0pXdWc
 RHqwZ2+Iuyk1aqRL2w29GgwJmfTNEpyXMT8NKCaDjRpEDObqOjSts524G7GGi9Ywdv5bdxNyxL
 cvI=
X-IronPort-AV: E=Sophos;i="5.79,375,1602572400"; d="scan'208";a="112499801"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Jan 2021 01:51:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 26 Jan 2021 01:51:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 26 Jan 2021 01:51:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6JA5Kks2eIHnV89oll2Sz522e+UU/83Injs3m4IDnDqF/z9LgjyW9Mf6Xr97thhGWmIxcV3sLwB1TSgxzDabovZfaI1+83CfG2GMbbBqsd+nuFjRGKQk7B9BeGeFsAKOCkSYv9aFE+/CIo2GxHsRzLnZx2QtiZ2z+yE68iVBy2pSYU6oTbAvMz+0t7f+bQDSWlJSGZB5vCyWJJX7vuPyaBl6X4DmMlXH1ieGrEJ4oEpDHmwPfuONmZM3O1wrp8S0rUqSzO+i9mGau9gvCBlT7CGsBYF8li+iEC1CZ9RFu/WsLigYAt/GCKa77UMp4sepCKgp6Objhr4ugLXeYbRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/abHvnQtn7SzB2khguuwHNxBXDkCpe/sYCSPRZ9n/3g=;
 b=MUdVN0ajFLUv7Aa+Smp3OT+RrleUUgnWNfzZoARYIbjLAdIH3LpZTbwrV9KGzYfH6qQhe/aKXae0iufkmZ2dEKv4mRsJCIkOLhRHdomS+vpNmV+WjsibtazMuI0mGyjgFG8/mNsKB0NrGG3SVfRJ7oQFKbO4AS+pSsWYnscPsGEoIuSIRugH+g+emANxXpVBvjXUIMBq4AlXYdnup32e33QZ5x9IxxEgW49+Xccv2BAIp464pVoP5dXjQGF7JPnEAsLy/LoD3phadvi4j+H21EKEBC5Lbbow1pNP1KrXnYLoqHJoGSJsn1in6ZDb268qtwhldYvAXvjrkswDArR5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/abHvnQtn7SzB2khguuwHNxBXDkCpe/sYCSPRZ9n/3g=;
 b=cohsimrWYdGAHP87kWbl6fo5TQCkQLeQo/e19vC+J7g+Ahwrwxsv5eHyUdA5AgdEBJ7i2UU7HQTMdrXfqnxfT63p8GD+hKhDTolE57LF/BvcGleIsjJ2UZJ0Xk/x+1vai7CflFqKEwvVPgbk3+B0286WkSNH6n6KSCDX5Rc4j44=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5180.namprd11.prod.outlook.com (2603:10b6:806:fb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 26 Jan
 2021 08:51:40 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::f4e3:108c:4222:7dab%3]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 08:51:40 +0000
From: <Tudor.Ambarus@microchip.com>
To: <yaliang.wang@windriver.com>, <vigneshr@ti.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Topic: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
Thread-Index: AQHW8a94mMSXtQqoOE2NM8lFQHXK9Q==
Date: Tue, 26 Jan 2021 08:51:40 +0000
Message-ID: <6f868908-ee07-690b-98ea-47d81acf009d@microchip.com>
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
 <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
 <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
In-Reply-To: <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [82.77.80.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 029fc341-8e4b-414d-07ca-08d8c1d7990c
x-ms-traffictypediagnostic: SA2PR11MB5180:
x-microsoft-antispam-prvs: <SA2PR11MB51803CF553C19CF009D48782F0BC9@SA2PR11MB5180.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WfhKmE/6Ripqg1ZQyLM2DKegX1TgndbE6UumzGs3/T8wVaQRZYzm3j9rnQGzcfMnu04SB1Nrv7flWPpuHHNiBKvQJm0QwW82le7w8WJ8qAAA9q4Y8NvzK3bWafYh9VRIt8D8j1OpeOGQ2PBDNWF2g+AxkDDEv3cw7gN2OHsIaoWBVCP5i811KiXCmLwLZnves+zsnoZiK4Wo3ObLZ4zz51OhXjzRo1565Mb+B06ANQkBOo/7+M0XdwZkPWYgmTRcV3ZmkTnUmJ59+u8MGxoTBLlJTmPjNXTzS4wjO+yyL5kCwDgRs+copkK/yqzJJ91MZ6h1DQb54yQi+Cb2C8oVsRJ2f7YUygQ/gRUmzOucmHdHp9MtzfBmCULj0dIA2xB1d0IsxEHriRShFndVLQDcUj3fdCtBx8rx9sQLNRYrnIPfmetf+7STCvxi2UmYINR04rOErazz4RKJ2pN9QNTsRmmgNiJine7sZ6z0xqzTZfrWrDVQMrNhc0GBu67N0hR4ixNYfyDEn65tTVDY1PhK8AwtdiWSHxZN+Zy7ZMLivSyVVYf1yW5+w0Bw7g9zyhgn6GB8nRpQ6quDAyZ11w8AqqtoFgmVoHwG7I65pRUu3206Yd+xCnQn939FpGKOUlqknPWVEDDNvqwy1boJ1fdfcE8L3vdKOJAbalyYoVm3C2aL7cxZEJTJp+QcjBobethS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(346002)(396003)(39860400002)(136003)(76116006)(966005)(91956017)(83380400001)(26005)(8676002)(6506007)(86362001)(8936002)(66446008)(64756008)(2906002)(71200400001)(66946007)(66556008)(6486002)(6512007)(31686004)(53546011)(4326008)(478600001)(2616005)(31696002)(186003)(5660300002)(110136005)(36756003)(316002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?SmlMbVBoRDArYzZNMnNjbUxIVCtkaDlEL1owTU5kN3M0Nml5ZG5LaUJ3Y2NS?=
 =?utf-8?B?Y1ZlWlJuZno4aVVub1RIT1lFeEhONkFuMkhZS0hkUHYzajB1RGY0cVhEeHNw?=
 =?utf-8?B?ZGVoV2Ntc2N0QkMyeHp2T1FyYnZtTU9LK3VlbzZDMWI2TVhicHQzZ0laVTdW?=
 =?utf-8?B?aWN4Q3dVbm5NdGdqRmdLU21QVzJRMHJjTHJNQy9kRzlzSUF6K05uUFdLT3lS?=
 =?utf-8?B?UlkveEFkM1VsVjZ3NHFYRGZmRWdTazI1TGtKbDEwRzU0KzFjNWg3SlRGckV0?=
 =?utf-8?B?OVF4MkdjM3Q0RFY0TXFZODBaa2VOWEl0U2VVWjFOcWhGRzl1ZlZoSGk5ZUo3?=
 =?utf-8?B?c0cycGtKV0JwckJpdjNQclVqVkVVR2lEdWg2OFEzR1FHZE1HRThMT0tKbCs1?=
 =?utf-8?B?bHhXUTR4Z2FadEJXTCtZNWx1N2ttVXFHeHJuOFNkMWNZS0MzRkhGd2FkS3pQ?=
 =?utf-8?B?RlhuNGp0UlQ2bXBsdS84dVJHM0xERFptYVJjaHlERnhFL3kvTFVGSUpMQ042?=
 =?utf-8?B?MFhzSExhYjRZaW5Ca3NGYmxCNHlVMlVOb05HcERYREN1OFkrT0lEbFpsYkU0?=
 =?utf-8?B?ZFl5VGpoS00xQ2k0elBYdE9aMHNSQUV0NlVjRm1kemtOdlZWZFV4MzljUXZT?=
 =?utf-8?B?eE1CK2RvVzR3aUZYSVJYdHRIUjdpZWxuUHozb09STVZIbGpvQ0xOODdhQmhw?=
 =?utf-8?B?MEdlL21GTHpHalBMTE1idEMrcjBVQnZud3Z1dU5CUnYrTmVyVXZHTkVDcTNa?=
 =?utf-8?B?anUrclBnc3ovVjZRUXFKUFNEdkorQkMvZVVZTFAwMGphSzZpT3VBWTRaZXYr?=
 =?utf-8?B?a3UvM2tFY1VTbUpRUUVmaTFXWEsrSm9ZcTJRbzhoQWhhNVpSYXZHUjNOUmsz?=
 =?utf-8?B?NDdlcm1WcEpVdGxQekttcXVJU2w4YWg5Sk85QjdXTW4wNWVYZVAwUnUxRGFE?=
 =?utf-8?B?MFVoOVNmR1ZORWNka0lrNnZpRjNQSXZQSmhBT1ozT3JCZC9QeXV2Vm9BZlZs?=
 =?utf-8?B?RStaUGw4UU1QK1Q0dVhndlNFQzR5ZjhHTng5YXgxS2xCc0s2T1hWbXFOWVI5?=
 =?utf-8?B?bkR0MnkramF5d3FCNUpFYUFPRldRM0NCTHhBVnFidEFlbWY3MEpmZjdUQjNw?=
 =?utf-8?B?TFdTN1NxVTZVcFRGelM0RFdScDJhOVFTU3pRZkxRdHVnMEVncEF3ZTl3L1VI?=
 =?utf-8?B?bmhVNGZXSXpYeG9idHV5K3lzcmNtQ3A5T1o1VFZRM2s4bU80WmI4RmFLWUVB?=
 =?utf-8?B?WENyUlRQQjVzbnkydGNPQ25uak5lcFQ4ZjlzWnNCSk4rRndGa0orVlFoZ3J4?=
 =?utf-8?B?eHZrRjNmRUJ1R0Y0aExIYmNPOHVFRjNSeGJVR2twMi9yald2ZEJwa3JxaUZa?=
 =?utf-8?Q?G3MXgy4CKS/eC/czxd/8ziLp31Pili1Y=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <B32E0FD5F797F04DA32CE1B57690BA5A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029fc341-8e4b-414d-07ca-08d8c1d7990c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 08:51:40.1193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ibrS6HFJQcYjOCPNsWLc7lXPc1gjLvY2gqGZI4NyTc9hpLji/332go5txvxwG9vXQDqRm7IFSyYsEj+EFQIu7aUm7vuupH1ZTCiSYu8g/go=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_035147_624514_3B583934 
X-CRM114-Status: GOOD (  24.45  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIFlhbGlhbmcsDQoNCk9uIDEvMjYvMjEgNDowNiBBTSwgV2FuZywgWWFsaWFuZyB3cm90ZToN
Cj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRz
IHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSwgVmlnbmVzaCBh
bmQgVHVkb3INCj4gDQo+IEl0J3MgcmVhbGx5IGluc3BpcmluZyByZWNlaXZpbmcgZnJvbSB5b3Us
IGFuZA0KPiANCj4gT24gMS8yNC8yMDIxIDI6MTIgUE0sIFZpZ25lc2ggUmFnaGF2ZW5kcmEgd3Jv
dGU6DQo+PiDCoCBIaSwgWWFsaWFuZw0KPj4NCj4+IE9uIDEvMjMvMjEgMTE6MTUgUE0sIFR1ZG9y
LkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+PiBIaSwgWWFsaWFuZywNCj4+Pg0KPj4g
Wy4uLl0NCj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zMjVmbF9sX3NyX3JlYWR5KHN0cnVjdCBz
cGlfbm9yICpub3IpDQo+Pj4+ICt7DQo+Pj4+ICvCoMKgIHU4ICpzciA9IG5vci0+Ym91bmNlYnVm
Ow0KPj4+PiArwqDCoCBpbnQgcmV0Ow0KPj4+PiArDQo+Pj4+ICvCoMKgIHJldCA9IHNwaV9ub3Jf
cmVhZF9zcihub3IsIHNyKTsNCj4+Pj4gK8KgwqAgaWYgKHJldCkNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4+ICsNCj4+Pj4gK8KgwqAgLyoqDQo+Pj4+ICvCoMKg
wqAgKiBQX0VSUiBhbmQgRV9FUlIgYml0cyBhcmUgbG9jYXRlZCBpbiB0aGUgU3RhdHVzIFJlZ2lz
dGVyIDINCj4+Pj4gK8KgwqDCoCAqIG9mIEN5cHJlc3MgRkwtTCBzZXJpZXMgY2hpcHMuDQo+Pj4+
ICvCoMKgwqAgKi8NCj4+Pj4gK8KgwqAgcmV0ID0gc3BpX25vcl9zMjVmbF9sX3JlYWRfc3IyKG5v
ciwgJnNyWzFdKTsNCj4+Pj4gK8KgwqAgaWYgKHJldCkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiByZXQ7DQo+Pj4+ICsNCj4+Pj4gK8KgwqAgaWYgKG5vci0+ZmxhZ3MgJiBTTk9S
X0ZfVVNFX0NMU1IgJiYgc3JbMV0gJiAoU1JfRV9FUlIgfCBTUl9QX0VSUikpIHsNCj4+PiBJZiBj
aGVja2luZyBvdGhlciBtYW51ZmFjdHVyZXIgZGF0YXNoZWV0cywgd291bGQgeW91IHBsZWFzZSBj
aGVjayBpZg0KPj4+IENMU1IgaXMgdXNlZCBieSBhbnkgb3RoZXIgbWFudWZhY3R1cmVyPw0KPj4+
DQo+Pg0KPj4gVGhpcyBpcyBsaW1pdGVkIHRvIGNlcnRhaW4gc3Vic2V0cyBvZiBDeXByZXNzL1Nw
YW5zaW9uIGZsYXNoZXMuDQo+Pg0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNyWzFd
ICYgU1JfRV9FUlIpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGV2X2Vycihub3ItPmRldiwgIkVyYXNlIEVycm9yIG9jY3VycmVkXG4iKTsNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgIGVsc2UNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkZXZfZXJyKG5vci0+ZGV2LCAiUHJvZ3JhbW1pbmcgRXJyb3Igb2NjdXJyZWRcbiIp
Ow0KPj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBzcGlfbm9yX2NsZWFyX3NyKG5v
cik7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICogV0VMIGJpdCByZW1haW5zIHNldCB0byBvbmUgd2hlbiBhbiBlcmFz
ZSBvciBwYWdlIHByb2dyYW0NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBlcnJvciBv
Y2N1cnMuIElzc3VlIGEgV3JpdGUgRGlzYWJsZSBjb21tYW5kIHRvIHByb3RlY3QNCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBhZ2FpbnN0IGluYWR2ZXJ0ZW50IHdyaXRlcyB0aGF0IGNh
biBwb3NzaWJseSBjb3JydXB0IHRoZQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGNv
bnRlbnRzIG9mIHRoZSBtZW1vcnkuDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovDQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBzcGlfbm9yX3dyaXRlX2Rpc2FibGUobm9y
KTsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsNCj4+Pj4gKw0KPj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU87DQo+Pj4+ICvCoMKgIH0NCj4+Pj4gKw0KPj4+
PiArwqDCoCByZXR1cm4gIShzclswXSAmIFNSX1dJUCk7DQo+Pj4+ICt9DQo+Pj4+ICsNCj4+Pj4g
wqAgLyoqDQo+Pj4+IMKgwqAgKiBzcGlfbm9yX3NyX3JlYWR5KCkgLSBRdWVyeSB0aGUgU3RhdHVz
IFJlZ2lzdGVyIHRvIHNlZSBpZiB0aGUgZmxhc2ggaXMgcmVhZHkNCj4+Pj4gwqDCoCAqIGZvciBu
ZXcgY29tbWFuZHMuDQo+Pj4+IEBAIC01NDYsNyArNjI4LDE5IEBAIHN0YXRpYyB2b2lkIHNwaV9u
b3JfY2xlYXJfc3Ioc3RydWN0IHNwaV9ub3IgKm5vcikNCj4+Pj4gwqDCoCAqLw0KPj4+PiDCoCBz
dGF0aWMgaW50IHNwaV9ub3Jfc3JfcmVhZHkoc3RydWN0IHNwaV9ub3IgKm5vcikNCj4+Pj4gwqAg
ew0KPj4+PiAtwqDCoCBpbnQgcmV0ID0gc3BpX25vcl9yZWFkX3NyKG5vciwgbm9yLT5ib3VuY2Vi
dWYpOw0KPj4+PiArwqDCoCBpbnQgcmV0Ow0KPj4+PiArwqDCoCBjb25zdCBzdHJ1Y3QgZmxhc2hf
aW5mbyAqdG1waW5mbyA9IG5vci0+aW5mbyA/IG5vci0+aW5mbyA6IHNwaV9ub3JfcmVhZF9pZChu
b3IpOw0KPj4+PiArDQo+Pj4+ICvCoMKgIGlmIChJU19FUlJfT1JfTlVMTCh0bXBpbmZvKSkNCj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PRU5UOw0KPj4+PiArDQo+Pj4+ICvC
oMKgIGlmICghc3RyY21wKHRtcGluZm8tPm5hbWUsICJzMjVmbDA2NGwiKQ0KPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHx8ICFzdHJjbXAodG1waW5mby0+bmFtZSwg
InMyNWZsMTI4bCIpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fHwgIXN0cmNtcCh0bXBpbmZvLT5uYW1lLCAiczI1ZmwyNTZsIikpIHsNCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBzcGlfbm9yX3MyNWZsX2xfc3JfcmVhZHkobm9yKTsNCj4+Pj4g
K8KgwqAgfQ0KPj4+DQo+Pj4gTm8sIHdlIGNhbid0IGFjY2VwdCBmbGFzaCBuYW1lIGNvbXBhcmlz
b25zIGluIHRoZSBTUEkgTk9SIGNvcmUuDQo+Pj4gSWYgQ0xTUiBhbmQgUkRTUjIgYXJlIGp1c3Qg
c3BhbnNpb24gc3BlY2lmaWMsIHdlIGNhbiBwcm92aWRlIGEgc3JfcmVhZHkNCj4+PiBmdW5jdGlv
biBwb2ludGVyIHRoYXQgY2FuIGJlIGZpbGxlZCBieSBzcGFuc2lvbiBmbGFzaGVzLiBPciBzb21l
IG90aGVyDQo+Pj4gbWV0aG9kIGRlcGVuZGluZyBvbiB0aGUgQ0xTUiBhbmQgUkRTUjIgZXhwb3N1
cmUgdGhyb3VnaCBvdGhlcg0KPj4+IG1hbnVmYWN0dXJlcnMuDQo+Pj4NCj4+PiBJZGVhbGx5IG9u
ZSB3b3VsZCBza2ltIHRocm91Z2ggYXQgbGVhc3QgMiAtIDMgZGF0YXNoZWV0cyBmcm9tIGVhY2gN
Cj4+PiBtYW51ZmFjdHVyZXIgYXZhaWxhYmxlIGluIFNQSSBOT1IuIFByZWZlcmFibGUgZWFjaCBk
YXRhc2hlZXQgZnJvbQ0KPj4+IGEgZGlmZmVyZW50IG1hbnVmYWN0dXJlciBmYW1pbHkuIFVuZm9y
dHVuYXRlbHkgSSdtIG5vdCBhd2FyZSBvZiBhbnkNCj4+PiBzdGFuZGFyZCB0aGF0IGRlc2NyaWJl
cyBhbGwgdGhlIHN1cHBvcnRlZCBTUEkgTk9SIGNvbW1hbmRzLg0KPj4+IElmIHlvdSBmaW5kIHRo
aXMgb3ZlcndoZWxtaW5nLCBJIGNhbiBzaGFyZSB0aGUgd29ya2xvYWQgd2l0aCB5b3UsDQo+Pj4g
YnV0IGF0IGJlc3QgZWZmb3J0LiBJZiB5b3UgZ28gdGhyb3VnaCB0aGlzIGJ5IHlvdXJzZWxmLCBw
bGVhc2UNCj4+PiBzYXZlIHRoZSBuYW1lIG9mIHRoZSBkYXRhc2hlZXQgZmxhc2hlcyB0aGF0IHlv
dSBnbyB0aHJvdWdoLg0KPj4+DQo+Pg0KPj4gQWdyZWUgd2l0aCBUdWRvci4gVGhlcmUgaXMgcXVp
dGUgYSBiaXQgb2YgdmFyaWF0aW9uIGV2ZW4gd2l0aGluDQo+PiBDeXByZXNzL1NwYW5zaW9uIGRl
dmljZXMuIFMyOCBzZXJpZXMgb2YgZmxhc2hlcyBoYXZlIHRoZXNlIGVycm9yIGJpdHMNCj4+IHdp
dGhpbiBTUjEgcmVnaXN0ZXIuIFNlZTogaHR0cHM6Ly93d3cuY3lwcmVzcy5jb20vZmlsZS81MTM5
OTYvZG93bmxvYWQNCj4+DQo+PiBTbywgdGhpcyBjYW5ub3QgYmUgaW4gU1BJIE5PUiBjb3JlLg0K
Pj4NCj4+IHNwaV9ub3JfeHJlYWRfc3IoKSwgc3BpX25vcl9mc3JfcmVhZHkoKSBhbmQgc3BpX25v
cl9jbGVhcl9zcigpIGFyZSBhbGwNCj4+IHZlbmRvci9mYW1pbHkgc3BlY2lmaWMgYW5kIHNob3Vs
ZCBiZSBtb3ZlZCB0byBhcHByb3ByaWF0ZSB2ZW5kb3INCj4+IHNwZWNpZmljIGRyaXZlcnMuDQo+
IA0KPiBIYXZlIHRvIGFkbWl0IHRoZSBjb21wYXJpc29ucyBhbmQgdGhlIGZ1bmN0aW9uIGhlcmUg
YXJlIGluYXBwcm9wcmlhdGUsDQo+IHRob3VnaCBpdCdzIHRoZSBmYXN0ZXN0IHdheSB0byBmaXgg
dGhpcyBwcm9ibGVtLg0KPiANCj4gSSdkIGxpa2UgdG8gbW92ZSBzcGFuc2lvbiBzcGVjaWZpYyBv
cGVyYXRpb25zIG91dCBvZiB0aGUgY29yZS5jIGZpcnN0LA0KPiBiYXNpbmcgb24gc3JfcmVhZHkg
ZnVuY3Rpb24gcG9pbnRlciBvciBvdGhlciBtZWNoYW5pc21zIG1lbnRpb25lZCBieQ0KPiBUdWRv
ciwgYW5kIGFmdGVyIHRoYXQgSSdsbCBzZWUgaWYgSSdtIGNhcGFibGUgdG8gY29wZSB3aXRoIHRo
ZSBvdGhlcg0KPiBzZXZlcmFsIHZlbmRvci9mYW1pbHkgc3BlY2lmaWMgZnVuY3Rpb25zLg0KPiAN
Cg0KVGhlIGRpZmZpY3VsdHkgaXMgbm90IGluIG1vdmluZyB0aGUgY29kZSBpbiBzcGFuc2lvbi5j
LCBidXQgcmF0aGVyDQp0aGUgZG9jdW1lbnRhdGlvbiBlZmZvcnQsIHRvIHNraW0gdGhyb3VnaCBh
bGwgdGhlIGRhdGFzaGVldHMuIFNvIGlmDQp5b3UncmUgZ29pbmcgdGhyb3VnaCBhbGwgdGhlIGRh
dGFzaGVldHMgdG8gY2hlY2sgd2hldGhlciBSRFNSMiBpcyB1c2VkDQpieSBvdGhlciB2ZW5kb3Ig
b3Igbm90LCBwbGVhc2UgYWxzbyBjaGVjayB0aGUgb3RoZXIgb3BzIHRoYXQgbWUgYW5kDQpWaWdu
ZXNoIGluZGljYXRlZCwgc28gdGhhdCB3ZSBkb24ndCBkdXBsaWNhdGUgdGhlIGVmZm9ydC4NCg0K
Q2hlZXJzLA0KdGENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
