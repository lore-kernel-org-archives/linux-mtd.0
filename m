Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657A4C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Apr 2022 11:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LcIq1JnWymk83IDVKA8Gs1byn/YJxuiPk2dYI/Sjqn8=; b=u5qKDg5cQBUwgQ
	OFNqDRTxtVayNEs6WZBKxHVKnS203WxMCiVLeZgaiuEu1HkF0bdQP/NCyhJIyup5NWzVdwlUy+LD3
	BCZcbZ1rDTGqthpZ6JsW3VPYJs5gJaeUG/M9Ukw0rtuL6RZpvSYopKr0+SsXPBSbkIWDfdimRmp/i
	xkyr0BhLJzHWafHeBoXJHdAbqsCQbKOgVbpvB6hmCODv2MxsoEg1fhOj8YEJRFWZJvN+8MyLEZzzW
	1FcATKV9/jdRnZDOW2HRAH9R6Bwu2jrgh6fUH1hmmRUBnWw2pNLTVYyogAPvNitcgZ5C5gk9xJGF8
	FPguzBaTUrERYFtAPiVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc3YW-005gIl-F5; Wed, 06 Apr 2022 11:10:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc3YQ-005gFf-7S
 for linux-mtd@lists.infradead.org; Wed, 06 Apr 2022 11:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649243426; x=1680779426;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=W1vIWoBC1ufEn+LBNJmKmrE4cIIWL1G6XyelPFcmJYw=;
 b=ct0mjHA949S1qUDlOBmEP73I1k7Zh1qZJzuGaA757oIxZGFWY9a3cDEb
 KouuE37sUjzFWwvUiswIldLXI9siH9KO8UrYr6xSoZhR2QZbyT67Kb8mC
 GUtOqEWATcymCDgVJT+WnLg5XPaH/AYE6QG4C/T/sJN9rOYQ/KpW2Biwm
 QjHO9csMgrE3VlsI7FPZalqzD30hIGtNAoibrMfGY18JULQ7eJ9uV8OlR
 eZ4UCk4wL6i9i6Tu/yLK5fHwetim0g1xiVfdudni/v1nC5Q4cJ3uzC7/h
 YCYGE3yrVKvtUpUz8xGXtoST8WIBVjVn+Hi+2cPXS/f67K+4VOxqTmUOF A==;
X-IronPort-AV: E=Sophos;i="5.90,239,1643698800"; d="scan'208";a="154603374"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Apr 2022 04:10:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Apr 2022 04:10:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Apr 2022 04:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWihWtmShQsUSBDMBOt912vWWSEEmhmrlL47RqcN2LUMFu1Z+NexIm6RXw4R7BJMGk9aXWiwmvd4c2CehZiIquNeWcFA4MhXSynq8SdwUTTxugQJJuKfdvBfYhrcGTSflCMbgDLsJKFhg+pGTvuKWKlDSwDYLSSqmnxMVgSEme8H7Txp0J7YCSTD/csXnCsqCCZnZi0cz3+AUdnA8eihpLXMc24qWYw3xdwnSIp+k/2J/tQPwsAGO6nWMxzqTvP+F64/3f2/YTv6zEKalg77A3uwnv3xI16pwd/yIrmVXapg4Cg4DGFl/AfUSS9EL7+ir0N998SI8cITypBkm1D2Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1vIWoBC1ufEn+LBNJmKmrE4cIIWL1G6XyelPFcmJYw=;
 b=PMnDIZ5OXm2CiAP6zp2Q9X1rue1QB0gv/5HclN/xARpckhr1Pco2Oj1tXUe/YGZaTeMaq06qZfl1RcpQGn9QIFV/1FkE0AqiPFZQtEsKGxxCHi6IuKJifX0RQCGPgxjCB1E1jYoGUJ3Hc8YT0W2aMD3fHHCJygQL6BsO+rGxNGTxwesqExqrUnuZTuwtqyEaHEslnEbUTKqdzXVlb2k/zhM/vkI6iMKTXGdP8HtZaDj5POWoKNqBpRPSOGxL0GYyfQLC8oOqlEuSiHSppsz0iEY65A8iqEnGsULs9Fq6vdWz8BbW9ATN8eyH0/ZVYbcZ60ZfRCLbqYfImqabb9sm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1vIWoBC1ufEn+LBNJmKmrE4cIIWL1G6XyelPFcmJYw=;
 b=nnSv4O2wpdbKsLjrSV3OUMf52s/InVpZ5Ik6JbOh2fHnrKg7uJMWKynVyePhpJgqizeuCqr5q5WPkYWRxUZHHx+MgBPNMmbStzXdsRSXEuuGx7y+fuOziXomc9gogDpe+cj4gE1CZn+c2DZL1RFd15T/iVm9gJuPt+UBpX2bPfo=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN8PR11MB3682.namprd11.prod.outlook.com (2603:10b6:408:88::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 11:10:09 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7cb5:d2dd:7e5:c812]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7cb5:d2dd:7e5:c812%9]) with mapi id 15.20.5123.031; Wed, 6 Apr 2022
 11:10:09 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <p.yadav@ti.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
Thread-Topic: [PATCH v2 4/4] mtd: spi-nor: sfdp: Keep SFDP definitions private
Thread-Index: AQHYR+vsffORZWT/aUyo+hhCPMlSjA==
Date: Wed, 6 Apr 2022 11:10:09 +0000
Message-ID: <16af88ad-52ea-4ed7-782b-eba28325bf0c@microchip.com>
References: <20220309144215.179449-1-tudor.ambarus@microchip.com>
 <20220309144215.179449-5-tudor.ambarus@microchip.com>
 <20220401200133.gyyvoe7xdbsww7cv@ti.com>
 <ed093fa5-b514-b0a6-166f-ecf117582b0b@microchip.com>
 <20220405193111.pnekaivbsj7hronp@ti.com>
 <1fa079c4a0341ffe6ad7bdebd3cb8958@walle.cc>
In-Reply-To: <1fa079c4a0341ffe6ad7bdebd3cb8958@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5ff21ff-b73f-4b9c-bf73-08da17be0389
x-ms-traffictypediagnostic: BN8PR11MB3682:EE_
x-microsoft-antispam-prvs: <BN8PR11MB3682DD7551E58B6A40F7DFC6F0E79@BN8PR11MB3682.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iE5jfsD6ou9k+9feyPBb/FF1PiqclfxYH0ZiaznrDBWknDihOHV4w3bXuW6zrMRQi5nVIwe9NasIqK5E0kjPqZnSeP9DlMaXWNZFXPsywvBrDHeIRTEKCToufpQnvMkwuJLKIGbj+6UrBfUxLPRpNLZnrejXTDKs6M/l4RV5NwhtbNYxrfWA5SngqzUJ9OCnEgxeHLlVCp3u2cE3FAwIFwVoWtwMmxYTXDkl0aHyFzjkqRm/+woLZB/HBvamVq9MwbokQYKYT+BVWCCFu8Pr2WoVaS3ooHIJIAXLi/lsdAwA1b9B7H45UpaZdAkmqBgKEo9pwnLhIaGAvgjohyHZAUh/MBl/nmusORG7le+HUM8aWjJIGXw/oi4ez7qybX5Kpm33/6jtT8wBkiT586sberI6zRKNr0G927v6YzC0qpY/z4bSKnrjO6cgedMOMwZKxesHf5FHTMKk7r6w/+J+3XU0O0sZyOqNNhdsbnpi6//CtCBv02szPY83AsgpWOhNrE4l7DCdG49d7MeUkkSViNOJrRZ0rxbTZdbtcd2gbvGCXz3cM3dPKtl7YTuEB8Yxcg8u7U0avX/OeeGVtCwtAVsBfWVhGOXfSnCDdkuzMEwR+zCTez8XsB7yZsQUnpseLqzkdUfTx5L08seJTfFM36SajOGdqL2MD4zMSbmrSeTnz27c7NkPMalGeUcUBNS7QxRjuA0ND+KT1ek0XUW1WvR3gdOmQygePEfuVugV4ged4eTxsseD8zxpyQLethY8EC75yLOJ3qqbvS8PZnaqLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(2616005)(4744005)(36756003)(107886003)(186003)(31686004)(110136005)(31696002)(86362001)(6486002)(316002)(54906003)(26005)(38070700005)(71200400001)(76116006)(8676002)(66476007)(8936002)(4326008)(5660300002)(91956017)(2906002)(66946007)(66556008)(508600001)(122000001)(38100700002)(6506007)(66446008)(6512007)(64756008)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHlZTjZPejVUUjBSTTdaSjh3VzNWZWRxVGRSalZ3MW5JSStjcHFFYVRScUNx?=
 =?utf-8?B?N055Z2lSYjN0aGhMdmEwb21FbEFqdHlKS1JadkIzd2M3QmtMdng5UVBsU0R5?=
 =?utf-8?B?aUJpcjNhSitQeVdZUkJESVVCenBGNzcwZVpmUHNaaUFrREVmeTBwTDI2d3JN?=
 =?utf-8?B?aFRyRlc3RjB1bkwwd0NWSnNJOHJIeGl3ZzFFaFljL0NEaXZEQmpVQzFUUS9N?=
 =?utf-8?B?R2VLZVZkVExRZmttYUtDUkdKTnVOTjFFQ01PSUp2UEkrUEFpMzBJMm1FUmdH?=
 =?utf-8?B?anFlak9mdEhBdnpvUnZGZmJ1QVlYd1FVcGtyQ0laSUlxb3VTTk9FeXNVSEVE?=
 =?utf-8?B?U040Q29uNUcvNmRKaTZRMERCbkdqdGdHZjBrRHNwbXVJQkR3T0J4U2JxdWVL?=
 =?utf-8?B?U0xXRVlrUXlBb3QwV0p6NGpXcFZ2Y2RST2RoTWNwT2FZUThzSkZQRW8zZ0JS?=
 =?utf-8?B?WGxFRWFqU2tOTWhsV2xsV21ZcWFEWW9BWlNhRjVvUmdNb2ptUUxzQ3E3VzlL?=
 =?utf-8?B?T21aQlQ5d0RDdXorUHk3YlBocXIvL3Q1aExxc2pKVDhhTVYzTkl4S1FNM2Y3?=
 =?utf-8?B?SE55SndHV2srRmdBaDlkVEZQZ0FvekV0S093SDRNeWJ5WkpydnBjZGo1SDlT?=
 =?utf-8?B?N2VuWjIvQ1hSY3pXVVJWSnMyUGlTOWhLa2R1SFFQUStvL3hnR2NYZkdnUDFu?=
 =?utf-8?B?OFd0YmYvRFpob1dJT2dvZ3lYSUtnS3FhRlRvemduMXAxcWZrVi80Ynlic0E0?=
 =?utf-8?B?ZE4yeE1WaDkyWGt1MFUvTmhyclpGRE01eHVjRWgycjFUZnpVV01zeU8zTWZ2?=
 =?utf-8?B?YmMyYWY5dElFdHJoS0dVRHBmVy92TVJRbmROOE9xT2ZPeUw4dEQvRFRmTExM?=
 =?utf-8?B?aU1RbFZsdFBIdXNpZDdBZE0zYkVMNjA0QWltMFdNdkZhM29aYlRPeW43Tm8r?=
 =?utf-8?B?NkhGaVplNVR6ejJhd0ZTeDc1eWkrRmNJNXU2MWpKR01wdGVrMllRbHEyMDJQ?=
 =?utf-8?B?RkVUd0JaeFRJR2lzQWtqOFIyMlZaNHZVQ3RkTUMvUzBNM0p6WDhPYW0ySmNN?=
 =?utf-8?B?TGwwRXhFZC9Nd1dyQU1qVXhkbzBrRWFVVmt6MUJjbmhJQ0QxTXhFbFp4MkQ1?=
 =?utf-8?B?NVdSdTMvRkdqeEw1TXMveTNUdEVlbG5xbG9ybjVLU0xzQWUrV1B4djU2Yzdv?=
 =?utf-8?B?aHpTUU9aT1lYajArYmFCQ0hzK2hEaFRLcVZJVnVJQjBGY1lEUHUxb1k3ZzhD?=
 =?utf-8?B?OEZacmdzL0VLL1BUYzZJL3p0dTFXNUgzTC95MnROb0hUa0tBWFpoVm9OZkMw?=
 =?utf-8?B?SnpUV3hRVUJmYXJ4UGpaQmpxUnh3MVpvUUpFSDByYWVTYlIwR1BRSUN1aCsv?=
 =?utf-8?B?aExadzc5S2hmYlVuKzBxMHp4N0I2WGJRYXN1bEVXNzZQVlZ1Zmxxd2dCMGQz?=
 =?utf-8?B?OVMxZmJhZG1mTFNIZkdhZUp6NlpTaXNzdCtLOXdZZlNBQjNMamh2dERpYTZi?=
 =?utf-8?B?UXpMUXdGMjFmTzNuTzdwZ2hwYy85MzJVWE94NmNFYTlEdUF3T205R2hweHA3?=
 =?utf-8?B?ZnZScm9UUEE5Nm01bWVXOWpPSS91Wm5jYUhlRnovT1dpMlU5eGlVMjFuc0pM?=
 =?utf-8?B?LzZ1emp0ckZCRnF1Wms4NUphdG1rbmE3RnY3Z0UxbWg0NUlJRk5SWmt5YkNE?=
 =?utf-8?B?SmRCRm5xVDRSNWVNSE85b2ZYUmE0S2kzNTlIcVBsSjNjSGZvY0x2VUdxWWlX?=
 =?utf-8?B?YUoxYmdRMzNqL2J1ZDdpc1hGT3d2ZXJVMStlOTRUS1JCTlBtN2FzYzZjcTFm?=
 =?utf-8?B?M21MT2JXdVEzUHozOWVWQ2F6dUNsRkg3WTA2azZXNmtDQXJ3V2J2ZGhMSFRW?=
 =?utf-8?B?UGl6N3gyR0ptMFVsSG9SMDJYc2lOZm0wSXpTNncvN3lLVnB3UnE5U1kzQVN0?=
 =?utf-8?B?TjFhUUpPV01yd3NRWmw2bGlRQ0hIbmR6L3FSUm1ZaUNnVllJc0NYQnV2QlJS?=
 =?utf-8?B?TU10Sk9YUmplYWtsTGg2REdma09FMnVHenUvT1MzSXZLTXBTQTBnd1loYTNB?=
 =?utf-8?B?OGE1R3I3RmhCWEFLbWVST1orK0VxRldyZmxCUmcrd2MyNHBiTXREL1M5SHBs?=
 =?utf-8?B?UEVId2tTTXFJZCtreW4rZ1RNYTJKQ1RYVVRHemZUdzlLdUNNa1VnVjN4R0Iy?=
 =?utf-8?B?VFdhMnh5QjZyOE9ER3ZWL1NtWEdTVU9hNlFDYnVYQ1Z5R0tpWXRGYUdqNUxu?=
 =?utf-8?B?cldQSmU5andtZGdIMHNyR000ZFdKQnUxc0NUdE9ZVEQ1dFhnMklwVmR3QU1B?=
 =?utf-8?B?VDdjRGd5R2pxT2h0SEd1OUREK21naHZIcTY3aWdycnBjbndJbFZMeHRKK2ZV?=
 =?utf-8?Q?B3LOXxRwuSp+MBug=3D?=
Content-ID: <7A82F7B3E156A146BE25BEFA19898D96@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ff21ff-b73f-4b9c-bf73-08da17be0389
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2022 11:10:09.5836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPsZRfZd8hEDHxpv9C8OXus1C/cPg58kLQ8BH8PIPjCcMWfM91d+elAN1GxEJPkQ0n9GRF42N0g03p2QyAHTZB6mHRmLCkTjpmRZ9f2hCUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR11MB3682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_041026_687763_C1452BC4 
X-CRM114-Status: GOOD (  11.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 4/6/22 13:31, Michael Walle wrote:
> 
>>> That's correct, but I think exposing just the public defines in sfdp.h
>>> is
>>> the path to follow. We should keep private all the definitions that we
>>> can
>>> private in sfdp.c and expose publicly in sfdp.h just the ones that are
>>> shared.
>>> Flash collisions, and implicitly the need of public SFDP definitions,
>>> should be
>>> an exception, so I expect sfdp.h to be short in size.
>>
>> I disagree. I think we should keep everything in the same place. And
>> since we need to expose this to manufacturer drivers, that place is
>> sfdp.h. Who is going to cast the tiebreaking vote here? ;-)
> 
> I'm leaning towards Pratyush opinion unless there is a clear advantage
> to move the defines.

Okay. Then we should move all the table definitions to sfdp.h, right?
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
