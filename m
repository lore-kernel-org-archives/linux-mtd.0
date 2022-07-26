Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE39C43334
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Jul 2022 10:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBPUtmMJEEfrhucCd6aDFdW1f+M4KPPCZR6YNrMzyCY=; b=a4tIAssbCgA2Zx
	44S5Jm6YS5KCBZ8wrBTZBh5v4GbeeGnKXaC7zaIyqRiR2Mb2jCeQkfzDO1/cDelq7tVYbhGG7y1eO
	zf2ItwuA+EC4pJA2bRoA6flwQ3CDmpGaf5I3S6xyWGyfhMEtIUi+4v/6YT5b8VXbsz3JcLh4LHdZp
	VRQZPFhboqguIBY97vh8gGA+84H6i4XEk9dtazLD4M8Pm/dyLEzPLncq1h4oRc/ILKJ2ziWakWwy/
	iEFrhgPD6z2DLN+aC0hGLtXYgKV7JRzvNNV0L44py6HqlbQTVWyKKKOCvxyIbrNEOeU0+kuRv+LpQ
	c1PM79DBH/2cgFUANqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHLk-00C32S-7F; Tue, 26 Jul 2022 09:59:36 +0000
Received: from mail-bn1nam07olkn2052.outbound.protection.outlook.com ([40.92.15.52] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGHLP-00C2WT-9K
	for linux-mtd@lists.infradead.org; Tue, 26 Jul 2022 09:59:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLjUuSX77Zc6/ZJPvaRMrRchVLkMDa01eYj0BqeXUK9LIe8Nit679FUfCXYOo6jYG0SvRkv3XJJ/Kk0JXoL4ZyIugpq7IklQTqa8G6LSQmuWyjOXRa7fsZbYinx9aMk3Rpo6Cu63j21rujBL2DC8TMryozqSZ+owS6agR6/j1z6ErpLIpY8m7+II/q31rJeAXvGyLeA074XiPd8HBsFxVxFaCKGDAqo6B/xMLZc2faevElGybL5UDYiiUBbNazSgxfkz7DWgNfWtfHy+n0FqRVwEngmcqfkabd/VgLS/SDkNZXgXRrViUZOVVmV1ByuyKZtLJi5FaWVQ0AfAc8npAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+6AwCg0pJTu6OI26sTyabjhTXTFwk1koDBNC2nBLXQ=;
 b=iRKg3+lKW53qfr225DmbiOoK2e8vuCILliXqgPmbrcjeyIehDkcLBukHNiGGJI2MptKlxIz1UACCEaj01NGOBT2w8G9WFhRw/oomKM1E6F+YHj+CD7iD0e6X2Ld8G+2OcMPerQ9yBGKCvpvf877t9CNfzfKxjsT6cRYx0QcXdhVDRkLYzrNZbzSstHVThYLXWC6IolBafxC8lf4KgqNCEEkTYCds8fMIKEEad43KTYkDa1MRqnwl6QAYVDNigshH9tfygktZmSU1prBQAHY0g99bGHnmRASxB3RDbsAmHoeEd0ftHZLNuYDMP9gbTKu+pdmtOM3QgavTFNzaXG4DDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+6AwCg0pJTu6OI26sTyabjhTXTFwk1koDBNC2nBLXQ=;
 b=SwYxc7mITxpQIE4VUGjkxyJGjBkH0rNJXG1uAckuPOP3FKR89rKrdo7CL93KZbLXwxW3p/vH1x5ws9fh7mCFBuTb7fZn0mogELEVzFmKocc62mcUx4T5Y9dGYVzF9sd1oAPRf8d7DOc2JKK8vI4j8a6w5vmrZZIXxoB1uhNUZiYDTf0OFx5M7P2PrfLqdR6JCSi+oy/ce2t68Bnk8nEPijhEc2cBGFdaR26o4tXySEwOPZqPXjpbczJkefV9S0EffeKlfYq6CM4JenGZOAj2I1hQZ/KZ2fllwQ9eVTIDZ1jgfZ3zAA/VuFII7imfoCBiF9N0Jhi/fa42X2dLfHYRTg==
Received: from MN2PR17MB3375.namprd17.prod.outlook.com (2603:10b6:208:13c::25)
 by BY3PR17MB5681.namprd17.prod.outlook.com (2603:10b6:a03:3cc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 09:59:09 +0000
Received: from MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba]) by MN2PR17MB3375.namprd17.prod.outlook.com
 ([fe80::3409:88f8:6069:ccba%3]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 09:59:09 +0000
From: Vanessa Page <Vebpe@outlook.com>
To: Takahiro Kuwano <tkuw584924@gmail.com>
CC: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>, "michael@walle.cc" <michael@walle.cc>,
	"Takahiro.Kuwano@infineon.com" <Takahiro.Kuwano@infineon.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, "richard@nod.at"
	<richard@nod.at>, "vigneshr@ti.com" <vigneshr@ti.com>,
	"Bacem.Daassi@infineon.com" <Bacem.Daassi@infineon.com>
Subject: Re: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
Thread-Topic: [PATCH v17 5/7] mtd: spi-nor: core: Track flash's internal
 address mode
Thread-Index: AQHYoAjemmp9SEw8oEif6ZXbznvVxK2QTKWAgAAInwCAABdc4g==
Date: Tue, 26 Jul 2022 09:59:09 +0000
Message-ID:  <MN2PR17MB337551BCC5A9F0233A295858B8949@MN2PR17MB3375.namprd17.prod.outlook.com>
References: <20220725092505.446315-1-tudor.ambarus@microchip.com>
 <20220725092505.446315-6-tudor.ambarus@microchip.com>
 <8e8cff77-bb06-fdea-fb0e-60e1a2639026@microchip.com>
 <49520da3-69b0-c50c-0ca2-ba017d2012a7@gmail.com>
In-Reply-To: <49520da3-69b0-c50c-0ca2-ba017d2012a7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn:  [msHbwRYAkpWxjYKYcVeGES2bm2f0EvRUZAr4z5hSb5BRiK2vUaP6ThLVyrhxAuwSqIA3rnbtabc=]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d566d361-f393-4b46-4db4-08da6eed7c1b
x-ms-traffictypediagnostic: BY3PR17MB5681:EE_
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  5I5GLh4o6sELLQpIQpGASxXNVVwa4UgR9u4sIP9aCYpYHT8G+iY/RmfDqYgFr5JXNU/10F2RX4slyGKyzwEkvVHTeU7j8Yqmvp5850Kcqdfa8JLi03YpAdamdoU9chIuIY63sv/3mTlDYy6kKbluK7TiPjbVBIFLfPInKgaLDMKkKS2roSSiOUFTam62jsoGIGQgV8Ok60T/HWRT8NiguNTQfhXi8NTYJPFOH7+OYdI2/QIIRTcHT5uXBNO0GTssZGKy49psEX2N0mMcW2UnHER5JVkBraB4eRf9A/Qp95AWJkgkm0BuFAg221T0jxtbDr+9T+c4/mnUVChOrqiP7TQu2t8gM0sug83/hUpdcq8I0ohD7CrmAWX8YAw7o6j20WM+/ZezrNkJEwE4orbS2gyoEkim4yDZQDcn789Q6t3lgl2N0eX/aCSWME5EWfQwH+Df8uVar6RAbgMl7Yg/K7/ajZ4iJ5cLv2+Z+vw5qFa04W+qN+e+XiSneJxCuDv+Df9pj7yWHvRz+C7RIh7fIi+4pPsU/skDHoDuEhXEGPRVDw2Y35xMdsEnBIRlo1Qpm4DemX0DnVOm6PGayTONTAGsGbrB0NVpDuykQyyZuO0T09jfH8xsPvUGunSNn97EawRySauVbYvRCQe8b/irYO+47bVDfcvNgcXjJNzHD/Q5H5EU/EPwYTQ80+mHIr5W
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WGswK21NQytKRjhxdVZEY0o0dmdHK3VVTVlpVENsazV1bFJwUVkzeC9QbTBJ?=
 =?utf-8?B?a3YzNzNpbkpXQ0hGWjRTVTR6M2w2QmYzUEppOHkwUlErTFM5NHVhSnQ0R3RV?=
 =?utf-8?B?U1N3b2JxRG1rcHU5c1YzMHlkVk1rOGN3Q2hxa05Ec0FrU3lvK0RSb2RqRGhS?=
 =?utf-8?B?ZG5EZjdzMlVra1RHVFVXOUhzVEhJSmtZLytEWGZLaW9odmttNDVRSXRTRzBw?=
 =?utf-8?B?ZGJpbS8wK3BKbGE1TUlzUzNNOG9uM3pwTmliOGQzK0ZhM2szK1lnYkpsNVVD?=
 =?utf-8?B?VU1ma003eld6L2wwdzVQZkZDR2EwNE10Uyt6czM2bXNjZk5MZ0JTczV6YnQ1?=
 =?utf-8?B?dE1RZzEyUkVkM3phaEVJZitLMzkybEVGQnhYN2ZpVGtFQXNxd3N1OXp5Wlgy?=
 =?utf-8?B?SkRSWVpnai8rVUhERjZHcC9EeDFjV01aY0pKVGc3aGxMWFIyRVhvUzR5RWp5?=
 =?utf-8?B?YkxwRlJqcW1tdis5SWFDR09KYXhxdUlaekhDaDFld2FjbTNOWHRNU2JWQXA0?=
 =?utf-8?B?V3B4L2U2QXNWdGFseFJxYnJKZnUvbXN0TUFqRy9rSlBrcWlTK253Yjh5TXNL?=
 =?utf-8?B?c2VLWVhLOUtRMFMvYUpSbndXUlJNQXZMSS9mSnhVbU9ia0FGekpnMytMeFdB?=
 =?utf-8?B?dzNwK2syeVFWK3QyeThlZEVWWnBreEVWeG1DakpSSnlRT3YwMlgzRzZsMGZW?=
 =?utf-8?B?aXJKUHpHZi8xZHNmL2tSSjJLUzV6eTFONW9CTlArTU1SSmU4eGh4WXZ1S1Vp?=
 =?utf-8?B?dWFUT3BoUGNzTjZnZnRZbFVweUNZVWt4REVXeERLbjd1VTFkQWdxMHNlNHdp?=
 =?utf-8?B?bGRTSS9uUDVBODlNSXdvcWc2YWdBcWJiZ2ppR2R1VTRtaUhRcG1DV0NtZWFq?=
 =?utf-8?B?M3ZKTHNObXBnL3NucWZKNVdNVVZyRHVrYVlkaTR6UjRSN2p4OTk2L3lWQk9o?=
 =?utf-8?B?MTlpYXRwbTJtVTVLQ0xJaU00ZnJoTUFYZnk4OFVNY1Fpemg2dWpjRkE1STJD?=
 =?utf-8?B?Mk5ZRjV6QkpjcGN5VlZGcS9ENmk5SERhVjV1eVhaUXBybVFMMGFUOHRSYUhT?=
 =?utf-8?B?V3VFdjdyVEVBSDkxaERhdWJZUk1uVHBrME9GbzFDZSt5cnF6bTZRSFUwZmIv?=
 =?utf-8?B?dENBYi9JdlRBbkd2Y0xyYVdEaWlFc2NBNEtqSWlTNEgvcWoxekRHUTFicHNu?=
 =?utf-8?B?SE1lZnN3cDJMclYzY3BKeWZxMlhZWTE0R2NNZnY4bENnUUpuQklMSTZCZU5x?=
 =?utf-8?B?ZjVET3doNlY0Y2EyZ2lxNWNKTjA4cmYzVks1RmxYWU5GNVVLTncxOUptVHVj?=
 =?utf-8?B?S200ZWRjcDlZN1ZpKytBTDNMZ2plb29aeGtoeVZwc3pZdTdUQXcxcFUyLzhl?=
 =?utf-8?B?Sk9nRmZrSGFxb21WV2VCNXg3ZWdVbDhXVXAzeWg5dE5PWFNNU0t4cmsrWlVu?=
 =?utf-8?B?bVk3ZHFkY2t2VVRIemlncnJ5RHhJZ0RXUWYrc1Y4aE1qOHNXWUxaVk1aT3RX?=
 =?utf-8?B?OWcrNUtaYS96dG5zaHNIeTlmdTJyZlpIbEREVUdlK0NYd0sza050d2ZubVRJ?=
 =?utf-8?B?UmRaazcwZ2JMMG8rZXY4djRxVmttSzRmY1BQeWp6V1g3ejhsa3ZjRWliWkZI?=
 =?utf-8?B?Z1VXWmVPSUJuNzVuZlVYMnZEUFQraVptRExvQ3dKNTRTTDVDWDJQSS9xSTJy?=
 =?utf-8?B?K0pSckFtdDdXUnd2QTRaajF6eXlqKy9ZYVZUc1EvdFJSRW1aRHROYWVtUEVJ?=
 =?utf-8?Q?lZ1faHV2MoyOJAsUjkYTCgDxCpHNxtGVlKlRAtV?=
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR17MB3375.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d566d361-f393-4b46-4db4-08da6eed7c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 09:59:09.4190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR17MB5681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_025915_369010_1D73B987 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

VGhpcyBpcyB0aGUgZHVtYmVzdCBzaGl0IEnigJl2ZSBuZXZlciBzZWVuDQoNClNlbnQgZnJvbSBt
eSBpUGhvbmUNCg0KPiBPbiBKdWwgMjYsIDIwMjIsIGF0IDQ6MzcgQU0sIFRha2FoaXJvIEt1d2Fu
byA8dGt1dzU4NDkyNEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4g77u/T24gNy8yNi8yMDIyIDU6
MDQgUE0sIFR1ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IEhpLCBUYWthaGly
bywNCj4+IA0KPj4gQ2FuIEkgaGF2ZSB5b3VyIFItYiB0YWcgb24gdGhpcyBwYXRjaCwgcGxlYXNl
Pw0KPj4gDQo+IEkgY29uZmlybWVkIHRoaXMgd29ya3Mgb24gU0VNUEVSIFMyNSBkZXZpY2VzLg0K
PiANCj4gUmV2aWV3ZWQtYnk6IFRha2FoaXJvIEt1d2FubyA8VGFrYWhpcm8uS3V3YW5vQGluZmlu
ZW9uLmNvbT4NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gVGFrYWhpcm8NCj4gDQo+IA0KPiANCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+
IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdA0KPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBt
YWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1tdGQvCg==
