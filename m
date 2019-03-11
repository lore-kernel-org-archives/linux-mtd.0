Return-Path: <SRS0=UNLD=RO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB20BC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2019 14:06:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA75620657
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Mar 2019 14:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TbV1Z1C0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Wi7v8XJj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA75620657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Yd53pAlKzeYiQbz/mdmpNc3IYo8xFwBikfSgkHvxGg=; b=TbV1Z1C08yZ8z9
	7QlmwXtxI49khbZmGv5ttTco2VUN8rZc6Atcw8HHOfN3QyVeI2sYjxwECCkaIWDN6fWEHOBZOkPZ+
	suzWw+DAK+QhrrfAJC4J+TqAEMo7wPp3u1FwzHj+CSoMsm6hO/ut7c/TfWhS9krj+r6hDiqZue6Y6
	itkcxfciJZ/+H96HwvtKktzHGQrJYgjOtGFKI6hmwIU9Azris2r4uMjOUnHYoaGGWpi+aWzaRS1Zz
	E9uLQTIQOgJBOmuo+8Y9jYPY/I1WsNCwUjJHB+3SW2oXKeczxL8y4lfOMY2qGrs6dMIS4qsTKGobb
	ejy0SGGOa/9NIVoT6T0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3LZ4-0002Aa-1R; Mon, 11 Mar 2019 14:06:02 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3LYt-00029w-FB
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2019 14:05:58 +0000
X-IronPort-AV: E=Sophos;i="5.58,468,1544511600"; d="scan'208";a="25937913"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 11 Mar 2019 07:05:48 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Mon, 11 Mar 2019 07:05:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ys+imZDdGNowT5+tkZzLv4JDqIhLkXszR4+DGOxrnYo=;
 b=Wi7v8XJjFPMRzFe6vH1xgJ/Ikg4lhy8zbl1lO0c0tMSv3vUe94Fzc98tJMcS5S1uho0abTnfsAAtP8Om9IXt9SFH60i+KUQZCSw6+56TA3ezkOg3l6F4k+NmUjpYYXGYIHPBjiy8iLC9NfVvuyEBmBiByjTvQAHKg6mqST4qpe0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1761.namprd11.prod.outlook.com (10.175.99.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.19; Mon, 11 Mar 2019 14:05:45 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1686.021; Mon, 11 Mar
 2019 14:05:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <jonas@norrbonn.se>, <James.Tomasetta@cypress.com>, <Yong.Qin@cypress.com>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Topic: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
Thread-Index: AQHUuB8ZhXd2N1Mh6EWe4SXNj0Cyz6YE33oAgAAMRYCAAcsCAA==
Date: Mon, 11 Mar 2019 14:05:45 +0000
Message-ID: <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
In-Reply-To: <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0029.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::18) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db324452-9ac4-44eb-8925-08d6a62aa776
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1761; 
x-ms-traffictypediagnostic: BN6PR11MB1761:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIxNzYxOzIzOnRudDhEdTEvbjBKMldqU2lob0YvUUxRQUF1?=
 =?utf-8?B?SHNUTTNBQm5DM0xyaFNsaThjMFhBVTVob1gyZGFucHJhRFRtLzZCNThFU1pv?=
 =?utf-8?B?UFFLVzNCMmlMODNoS2VyU1pUdGdVcXJabzFid3RKQTRCRnZudVFQSU9pK3Vr?=
 =?utf-8?B?bXM5aXJaWnZmbDlJbGRNWm1TNXF2VWQrRzlPMmNUakpJbHV3cXJ2VkFnMGwz?=
 =?utf-8?B?RzFCcEZnWCtrcU12TGh1WVRvM1RVYzlTZDlJRHRQNHV5R1AvSWVBeEMzdzVj?=
 =?utf-8?B?clpDMEpBVEx2YUVXbWMvZTlxZjlSc2krUzBsRDJjNHZDL2R2ZnY2aW5PM2t5?=
 =?utf-8?B?V2YvU1pnbHpTeFo0RWNVb05uNFdXVlMxUFo3N2J5U1JFMHYzeXh1aHpFdXMw?=
 =?utf-8?B?WndJcGhkNGV6Rm0yTXNFOGFwdkp2STVzSUtpT25lRnkxMmljYThFeGVXWmcx?=
 =?utf-8?B?T0Q1MFpvRG5ZODlvVjRYenRlQ1d0VjdQajlxc29XaG1RMnJ3TGRHUUJzelo3?=
 =?utf-8?B?dE1zT2pMSFBZRHpDVjl1L2JBVytSK3JqbnZGbHVNVHVoS1pmTTd4WnhRQlhG?=
 =?utf-8?B?NjRvRXRzQlJ4WTE0eEFubzk2M1Q1bDUzRy9UYW1BR0VzcEl6R1UvYWhuQWRC?=
 =?utf-8?B?ZTlwem51OHhuK1p2U2d6ak5jamt1VWFYWXRncy9tUDE4bC9BbnN1OGMyN3BW?=
 =?utf-8?B?WnpFQ2dNY1A4S3B1WFFnU0lKU1YxQ3Rvb0VsWEhPbXQ0UFNHRk5McS93clJ0?=
 =?utf-8?B?N2F6ZUw0NXZEY1F0SUloZG96OWIxdzBMZS8vVlI1VXNsR3Z0bjZRYlNQVVlU?=
 =?utf-8?B?WEVhVS9HcHQrd2hZc3NhWGZ4UWh2UFJrNXY5N3hNOVM4NnY0VmVHSzFCOGJx?=
 =?utf-8?B?a1dhMi9DUmR5RTVnc0NlUkxaaTZwTVNuZXlUZG9vd25NTEtLcVR6R1pNTW9M?=
 =?utf-8?B?U1hDK21NSnYweEp5R0JJRzdWRmw5QmU0ZThZR1hxRFRiRzdrSTFvV3dCV3o4?=
 =?utf-8?B?d1pVQTVLb2ZsSHQrVmJ2SU9zYjZUZ0ZpQ2MxajZPcVAxMG14SE9EMU5Tc0hl?=
 =?utf-8?B?UGtBUkFmSFFac3N1UHBmWU9QV3dOWWtNb0ZKWWR2OWpodEdNS3BtcjlBczhS?=
 =?utf-8?B?em1PdzFuR0pacjh1Wjc5WDNrRjBpWStRb041VEVVbkhjbEdxSFVhak9WY3I5?=
 =?utf-8?B?a1lJRVpRUWtNU2tZbitOMFVRaTVSZjJjcEQyUUdwRExnR1ptME8xNGNKREoy?=
 =?utf-8?B?Z0hnZkhFT3BNUU9uZHJhWkhLa2Vtd2lYd3FvRlJMOTJOanJkRkhYeTRFc1J3?=
 =?utf-8?B?RmxFcmtEMGo5VzdUeThvbXppekU1c3hvY0czVGJPS3JwYVoreW5GWGJIczZx?=
 =?utf-8?B?ZlJXczZWa2U0SEVoZ1VmaEZTQ0dmWXlUU016bCtCdDhzdFJsTzlHTUJJRmRi?=
 =?utf-8?B?N0tDdFNMRDVSYlRmOGpuakF5TzcxRFRtN1ZwVCtacU1LNGY2TE9XUmtqMktO?=
 =?utf-8?B?K3pUR3hmYStWZ0Y5WHlyQUxlYzRRUTNhZjVzRlBhTk5TNjI4VG5CbUtUM0N4?=
 =?utf-8?B?YmZBVUV6NjVmVHNJazhVVHRCQ2NuWSs3cUN2WlZ1WE8rTm9lSm1DdHAwekwz?=
 =?utf-8?B?NVBEN3QvUUJwdFBWSXd0VFdaT0ZkNCs0ejdpUXZXM3dUMjg3WVR3WHdReGNS?=
 =?utf-8?B?L0hIZ3ZtbGJNdm90KzNhVFdXbThWMFBMZVVLMVN4WUlHbEJ1UHFINEl4Ukh0?=
 =?utf-8?B?Q05aRnI0L0FBTElCSWdUVEJTZDJNRHg5dWJkd2FvQU9EM0d6QU5SRWxkMEtB?=
 =?utf-8?B?b3FPaW5TcG9FbEc1R0M2dStNaUNFV3gydDBiQ2s3b0FxbDJKZEFRNGpYbzZx?=
 =?utf-8?Q?NcoeiWfAB8ysGlY1wSFptg/baY/+8hgh?=
x-microsoft-antispam-prvs: <BN6PR11MB1761F5E1A4258E5ADFC4A10CF0480@BN6PR11MB1761.namprd11.prod.outlook.com>
x-forefront-prvs: 09730BD177
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(396003)(376002)(366004)(199004)(189003)(55674003)(72206003)(97736004)(4326008)(14454004)(478600001)(5660300002)(25786009)(71190400001)(71200400001)(8676002)(6116002)(14444005)(31696002)(81166006)(31686004)(2906002)(3846002)(81156014)(93886005)(68736007)(110136005)(2201001)(54906003)(305945005)(316002)(36756003)(256004)(86362001)(106356001)(26005)(76176011)(53936002)(486006)(66066001)(8936002)(446003)(11346002)(229853002)(99286004)(476003)(105586002)(186003)(2616005)(52116002)(2501003)(386003)(6506007)(6486002)(6246003)(53546011)(102836004)(6436002)(6512007)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1761;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ras3wTCybJDviaUIDYhLjzr3800Ek30vY4eEuCHtgLh07Okd+9/jKbOFpYQpGyFYDTLvWRLCT5dK1khfy0Uepr9PbLKu/f0veMXBSmHqfOS69IaFJ6xXuRbIHGOIDpB03dFQLwFNzmJCsfL2e6Wv3kkg9GIuJuXqksY1z9q2JI1xe+dePr45ndOcTswjVIAJIo7+Q6UDDryaYHgejy6QzlzOCvW2uImRgSQuYNOD3AizX0PgXlalsCyxg/CeTsUcHo5RWsWhofqsocV3a7+jegeX4RrEd6vaa6BMXP0D7yKreh23e3SrM2VK3mg1N40j+FyCU5OKtPHb3fptAZ+ou8RkeU7sRJZyZtu2n9xftQOvbXTREMAGzMZoXhDzZKBzW08UYK3ikKyjHuYytOkTXmtP0A1ZYxlu+hntqVBF5bY=
Content-ID: <0551C8153F0E944AA0EEC0834368E4AE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: db324452-9ac4-44eb-8925-08d6a62aa776
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2019 14:05:45.2178 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1761
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_070551_681079_B315590B 
X-CRM114-Status: GOOD (  16.04  )
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
Cc: bbrezillon@kernel.org, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIEpvbmFzLA0KDQpPbiAwMy8xMC8yMDE5IDEyOjQyIFBNLCBKb25hcyBCb25uIHdyb3RlOg0K
PiBIaSwNCj4gDQo+IE9uIDEwLzAzLzIwMTkgMTA6NTgsIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlw
LmNvbSB3cm90ZToNCj4+ICsgSmFtZXMgYW5kIFlvbmcgZnJvbSBDeXByZXNzLg0KPj4NCj4+IEhp
LCBKb25hcywgSmFtZXMsIFlvbmcsDQo+Pg0KPj4gT24gMDEvMzAvMjAxOSAxMjowNyBBTSwgSm9u
YXMgQm9ubiB3cm90ZToNCj4+PiBUaGUgc3RhdHVzIHJlZ2lzdGVyIGJpdCBTUldEIChzdGF0dXMg
cmVnaXN0ZXIgd3JpdGUgZGlzYWJsZSkgaXMNCj4+PiBkZXNjcmliZWQgaW4gbWFueSB3b3JkcyBp
biB0aGUgZGF0YXNoZWV0cyBidXQgZWZmZWN0aXZlbHkgYm9pbHMgZG93biB0bzoNCj4+Pg0KPj4+
IGkpIGlmIHNldCwgcmVzcGVjdCBXUCMgd2hlbiB0cnlpbmcgdG8gY2hhbmdlIHByb3RlY3Rpb24g
Yml0czsNCj4+PiBpaSkgaWYgdW5zZXQsIGlnbm9yZSBXUCMgd2hlbiB0cnlpbmcgdG8gY2hhbmdl
IHByb3RlY3Rpb24gYml0cw0KPj4+DQo+Pj4gSW4gc2hvcnQsIHRoZSBiaXQgZGV0ZXJtaW5lcyB3
aGV0aGVyIHRoZSBXUCMgc2lnbmFsIGlzIGhvbm9yZWQgb3Igbm90Lg0KPj4+DQo+Pj4gSXQncyBk
aWZmaWN1bHQgdG8gaW1hZ2luZSB0aGUgdXNlLWNhc2Ugd2hlcmUgdGhlIFdQIyBpcyBjb25uZWN0
ZWQgYW5kDQo+Pj4gYXNzZXJ0ZWQgYnV0IHRoZSB1c2VyIGRvZXNuJ3Qgd2FudCB0byByZXNwZWN0
IGl0cyBzZXR0aW5nLsKgIEFzIHN1Y2gsDQo+Pj4gdGhpcyBwYXRjaCBzZXRzIHRoZSBTUldEIGJp
dCB1bmNvbmRpdGlvbmFsbHkgc28gdGhhdCB0aGUgV1AjIGlzIF9hbHdheXNfDQo+Pj4gcmVzcGVj
dGVkOyBoYXJkd2FyZSB0aGF0IGRvZXNuJ3QgY2FyZSBhYm91dCBXUCMgbm9ybWFsbHkgd29uJ3Qg
ZXZlbiBoYXZlDQo+Pj4gaXQgY29ubmVjdGVkLg0KPj4+DQo+Pg0KPj4gQWx3YXlzIHNldHRpbmcg
U1JXRCB0byAxLCBkaXNtaXNzZXMgdGhlIG5lZWQgb2YgYSBTUldEIGJpdCBpbiB0aGUgZmlyc3Qg
cGxhY2UuDQo+PiBEbyB5b3Uga25vdyB3aHkgQ3lwcmVzcyBtYWRlIHRoaXMgYml0IGNvbmZpZ3Vy
YWJsZSBhbmQgZGlkbid0IGVuYWJsZSBpdCBieSBkZWZhdWx0Pw0KPiANCj4gSSBzdXNwZWN0IGl0
IGhhcyBzb21lIGhpc3RvcmljYWwgcmVsZXZhbmNlOyBhcyB0aGluZ3MgY3VycmVudGx5IHN0YW5k
LCBJIGRvbid0IHNlZSBob3cgaXQncyB1c2VmdWwgaW4gaXRzIGN1cnJlbnQgZm9ybS4NCj4gDQo+
IFdlIGluaXRpYWxseSB0aG91Z2h0IHRoYXQgdGhlIFdQIyBzaWduYWwgdHVybmVkIG9uL29mZiBi
bG9jayBwcm90ZWN0aW9uIGJ1dCB0aGF0J3Mgbm90IHRoZSBjYXNlOyB0aGUgYmxvY2sgcHJvdGVj
dGlvbiBiaXRzIEJQMC1CUDIgdHVybiBvbi9vZmYgYmxvY2sgcHJvdGVjdGlvbiBhbmQgdGhlIFdQ
IyBzaWduYWwgb25seSBwcm90ZWN0cyB0aGUgQlBbMC0yXSBiaXRzIGZyb20gYmVpbmcgbW9kaWZp
ZWQuwqAgVHVybmluZyBvZmYgdGhlIFdQIyBmdW5jdGlvbmFsaXR5IHZpYSB0aGUgU1JXRCBiaXRz
IG1lYW5zIHRoYXQgdGhlIEJQWzAtMl0gYml0cyBhcmUgYWx3YXlzIG1vZGlmaWFibGUgYW5kIHRo
ZXJlZm9yZSB0aGUgZmxhc2ggZGV2aWNlIGlzIG5ldmVyIHJlYWxseSBwcm90ZWN0ZWQgZnJvbSB3
cml0ZXMgYnkgYSBtYWxpY2lvdXMgYWN0b3IuDQo+IA0KPiBUaGUga2V5IHF1ZXN0aW9uIGhlcmUg
aXM6wqAgaWYgdGhlIFdQIyBzaWduYWwgaXMgY29ubmVjdGVkLCB3aHkgd291bGQgeW91IGV2ZXIg
d2FudCBpdHMgc3RhdGUgdG8gYmUgaWdub3JlZCBieSB0aGUgZGV2aWNlP8KgIERlLWFzc2VydGlu
ZyB0aGUgc2lnbmFsIGhhcyB0aGUgc2FtZSBlZmZlY3QgYXMgc2V0dGluZyB0aGUgU1JXRCBiaXQu
wqAgQW5kIHRoZSBkZWZhdWx0IHN0YXRlIGlzIHVuLWFzc2VydGVkIGlmIHRoZSBzaWduYWwgaXMg
bm90IGNvbm5lY3RlZCwgc28gdGhhdCBjYXNlIGlzIGNvdmVyZWQsIHRvby7CoCBJIHNlZSBubyBy
ZWFzb24gbm90IHRvIGp1c3QgYWx3YXlzIHNldCBTUldEIGFuZCB0aGVyZWJ5IG1ha2UgdGhlIFdQ
IyBzaWduYWwgZG8gd2hhdCBvbmUgZXhwZWN0cyBvZiBpdCwgYWx3YXlzLg0KPiANCg0KSSB0ZW5k
IHRvIGFncmVlIHdpdGggeW91LiBMZXQncyB3YWl0IGZvciBhIGZldyBkYXlzLCBtYXliZSBKYW1l
cyBvciBZb25nIHdpbGwNCnRlbGwgdXMgdGhlIEN5cHJlc3MncyByZWFzb25zIG9mIG1ha2luZyBT
UldEIGNvbmZpZ3VyYWJsZS4gSW4gdGhlIG1lYW50aW1lIEknbGwNCmNoZWNrIHRoZSBkYXRhc2hl
ZXRzIG9mIHRoZSBmbGFzaGVzIHRoYXQgaGF2ZSBTUElfTk9SX0hBU19MT0NLIGRlY2xhcmVkLCBz
ZWUgaWYNClNSV0QgaXMgY29uZmlndXJhYmxlIGFuZCB3aGF0IHdlcmUgdGhlIHJlYXNvbnMgb2Yg
bWFraW5nIGl0IHNvLg0KDQpDaGVlcnMsDQp0YQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
