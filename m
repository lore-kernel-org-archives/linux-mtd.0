Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7A7C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9JBC6D4PLq6gph3B3Yga1DyPcvoRI2dlQaKOmEMJ5g=; b=YxpF/uqR26VaIH
	Zre4jDWcRBGw5lGZups8QfKchxwUyw2erhUWHBIl2wuVrDcgzRRU3FILMK46jBAt/BTFJxqcz5Wdf
	NbLOSRd1b4vOQ805PagvPQAOO9li8CL94cNdAVIkZPehwPlMDIbb4CeCzIbSGRPE+fIl4keMGt9+h
	ph2Ujm9sZX7s3id1eEHozK/ybXo5OZDZRDlyUUYl3G3u4l93L8H+oY7G+YgVJfXf9P5qO3/OYuSAg
	/My3SOvM1p+QFxXgWtr5HKWbbbeno7QqYCkHwiwNs1lvNSqFCm9nt3WczBl8zaabOSwu3TME2bhnZ
	Cu0ckITEmJOLfha6TlVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muITL-005FNr-PR; Mon, 06 Dec 2021 18:12:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muITH-005FLx-0x; Mon, 06 Dec 2021 18:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1638814334; x=1670350334;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sG+c70PbjpoCgLEBo+9qZDvy4C4tUTxAeVFHJJqU3q0=;
 b=dNif2oaOhKyYJpIxG3+t4eyP+ecLRYa4rXJGRLCFgA9Bs2Qe8xuGPDi6
 LDh2ooeXq2TYKKgwPFr2d21F2WSBlIsozeRdbUgWAKaRgDkzgNH5hpBUW
 1GtbFGCKIh9oT8JqE2TwWwg28I4pvGM8atXcSY6fnnBYuZ0qbEPOoz7le
 TWMPGPCoQK7PWSVu1nHWT9QuNMppwdF1Zg6ug0DhmawEOq+wyTTVjHu6Y
 21XLNR3XzuiUuTgvrJQycuHYaDBLAHjOBGVagUqAq+JNP/bqnsYalsSKe
 ygdcBOzPeDkRdZMgbEqDV3edE5n31zlQ0pbYYULgPWWwyKlf79N6Hq8RE A==;
IronPort-SDR: ikxy7f4RlojruLbmVxCjk2V7rOu8t4oVUyOJ6qjr9SvLNVB+dfrdoswMn016HlV/VISNJdXONL
 IA0XaCtJvbSv12ikB81CjkW56V9CmcLAbUd1NmByKF0xed6yPTpRLp/hJa2TphyuvL+ZWH1rK3
 EEe9gcjqLYkyMxCd5ud/ECppbnbp4vq7FtZd9/o5K9bCPkJvqJn46/RCxLtAG3C5AvIanBX0In
 YqoIXLyblJz6IbUKMRNswdu+sQ7+VCYTdyif8HmObQIrmm2CkBa5njWs66EcnxbncM4u24EDwf
 tzfQHB8Wd0hTvbZadP0unsNw
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="78664500"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Dec 2021 11:12:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 6 Dec 2021 11:12:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Mon, 6 Dec 2021 11:12:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gl+uL7KjS2DyA69kNsdJVvAq3WGpmyImaIAzzzMVJIV7NYpmOPoO03c2z6bRmDOz/mzDB8vYRx2xhcBPmEw5k9y+iP6gF20cn1ggDl1dDJ3ypWXfjZEGbujIKSWE7AsO9VUEfISASg0uB0UKNrd4TiepUE61jCHsvmpgZvKJI1GyU9DeFTwufZET8EoR7NcNILR8E9ONPvb7NwBapuVGvR4jsUbUSgbKU+iGsPaxABchiSGk79YKFczB8r7BjQ3FvLI4aEVgD0ReZ36HIrWUSM1Pql/5Ona/Hyp3mb90JnY6LcZ0yr5k+WT43YYwVlBD0uoD7pejHyoudnNxnjdWZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sG+c70PbjpoCgLEBo+9qZDvy4C4tUTxAeVFHJJqU3q0=;
 b=Z9TohT+NVQ5THT6ab+TH2S00ff09IW2HR/7DytwW5Kf83Qm9e4HnQhs4vLVk5Nr9jD4gUrDrc4h24RyGT0leTJvzdBogA+fNzxXo1PiRRYtiGEikFtHguTOY5wIGaL4252MmBuapCjrV3keV0sdjnEpQy/ID7rwS+6DzfnBYb+TwllMAhYq4BacOM5dGHWl3X1vEMCTPBRlWNFgCfC20aeMj0CJo6Psk37cxAI7vOS5sekHt5rz6sXQKkF/krjxmLWdybXGGCBS759h0FP8QIQzF2q219UIS6lTkwClTdRyZ05mzNvWVWTflTMxPAGMg592iVe+Zy9pxb/+sha58Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sG+c70PbjpoCgLEBo+9qZDvy4C4tUTxAeVFHJJqU3q0=;
 b=XWenxlFp/81OfbtiaJsJGOx7TjOwr/wBjGxmT3gZBtGYjbEVQjHOT0UIUZH6ovFfdqEkj9dnrIIhPngMPi+hFX4AUGo6Gl1Cq8qyGfsTsLmwMMgmN1GmbRRllZBZ8oiWJwARz0cA3Nt86mKx7JUWbD24FvFLmnrjiS0eOuMFnik=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3021.namprd11.prod.outlook.com (2603:10b6:805:d1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.22; Mon, 6 Dec
 2021 18:12:07 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::5c96:23c3:4407:d3b1%6]) with mapi id 15.20.4755.021; Mon, 6 Dec 2021
 18:12:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
Subject: Re: [PATCH v5 09/14] mtd: spi-nor: core: Init all flash parameters
 based on SFDP where possible
Thread-Topic: [PATCH v5 09/14] mtd: spi-nor: core: Init all flash parameters
 based on SFDP where possible
Thread-Index: AQHX6qh7PsBA/Xc6AE2iIsXKFl9vfA==
Date: Mon, 6 Dec 2021 18:12:07 +0000
Message-ID: <a6b508e3-7150-3d1a-0174-d21d07a58cde@microchip.com>
References: <20211203142256.47370-1-tudor.ambarus@microchip.com>
 <20211203142256.47370-10-tudor.ambarus@microchip.com>
 <20211206122244.in6pzwjnxxo7yd32@ti.com>
 <57890ba8-c0f8-b50a-7126-d74b92537f2e@microchip.com>
 <20211206150411.wj2fl36dngwwawcc@ti.com>
In-Reply-To: <20211206150411.wj2fl36dngwwawcc@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 553a2df1-2d56-4705-20fa-08d9b8e3ea13
x-ms-traffictypediagnostic: SN6PR11MB3021:EE_
x-microsoft-antispam-prvs: <SN6PR11MB30216D2A40FFF181CEE64B68F06D9@SN6PR11MB3021.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SgFltTj9PB5jnCfG/O9HdxkPuxmtuW16WLP26xwDlgBY56g0P5DqELqs4W0J4tXEQ0IlP7z3NbCgvJJSeAogF3grskjNk/nMoH5yBAwDYrDygymqgjHCwl9SkPLLTqM42HwcHec9+Y/9KP58MKk0omRHl63rs3tYcVxsfX2QMScQMU6rVW71GPjUaCFk194FunOCt1Az7lAV5WXxtFviNysZQf3wyWiXOGCE83/Gmtgr5hOPgx7J5uPLnrzlAp1juat7YE0IIP2RUWT2svMxYTnEJJ1u0bySDmDVMS/UwzSbsCNhi89z6RJmfv6APHKSaM2j/TDBkPDJs4haqmk1MVM+CEF8Lbi+XcHcS/rLTosPDrX9TYmPmt3wS3n33RUqLR30Z9Q7i10u4rqN5p3ypRy/gyFYCTKJ7IvmyU+cREdet/lB3iotOaF1JgvDndYEzd2V3UJLCwQ1+VzlEqgsu/dZWONuUtXjBfNg7ONBcteI28XS+eVoiSzomGk8s95uP/NjqXjdM9Y+8BReFLM6AIkFm480+TZcPq0FkLJsWvdh15TNqDu4peFrmtIS1AIUO4tUGOvEnXTRt7DzhL363ZWHr7XX2WIJ+51v85TGQ3fTXeouB6CDzIMEK62glrC2U02hHN7CtmhxhzYAD33Ia2mSLy7E7FTruUHfGX10jI3pyILTLiQhZv7F8gjT6saUeIWRejjZUNe2kiaIbihl99ou1P6cl4diXIEOd5A+avXj+Y9v/AHFRd15oFvlQG1//kbPjvmAJDkxgJTWy+LxYA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(4326008)(91956017)(6916009)(36756003)(6486002)(66946007)(76116006)(66476007)(66556008)(64756008)(66446008)(6512007)(71200400001)(6506007)(53546011)(122000001)(186003)(2616005)(38100700002)(26005)(86362001)(38070700005)(2906002)(316002)(508600001)(54906003)(107886003)(8936002)(8676002)(31686004)(7416002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZUFOQkV4dStTdExCcWlGMnhic3cyQXE5Z3M1Zlo5WE9vckVCaktqdkR0dlN5?=
 =?utf-8?B?bHJuVE1ZYUhwSlFzWmM2OU9kUG5WU2tYSzY4NzBMMzJmZCs2eVJjZzJVWXVz?=
 =?utf-8?B?NU5SbEZsMmtVV3dZTGJNV1RzeHdaRFF4Qzd1S0loYlBZVDlzVnlsaW1FTzJM?=
 =?utf-8?B?OUlEd3EyaXNNd0RvZHhHRGppK2dBNk54R1RuR20wVG90VTVYeTQ3WUZPeEFK?=
 =?utf-8?B?dmhiaVFadTJ3cVh5UlFpeEdxT2JCWEx0ejcxaDd0Z1BSdTBRUmcrVE9PMzN6?=
 =?utf-8?B?T0hZWll5dm5YQlkwNTZ2dHBGcHRvelFKcEFXamwrZmFnaE15UkZsNlJUMGla?=
 =?utf-8?B?bzJRejhFL2kwUTNtbmQ2VXhZeHFsUDRMK0NaZDQycDJCK1FOVkEvQUJKRlBQ?=
 =?utf-8?B?YSs0YStYTThjb0s4KzJ6b2J6cnpIUVZNRWNqK3pCbnRVaWRoZEZyUXFXcVlE?=
 =?utf-8?B?WTZBV2NNVkVMZ0JlSUpVQWFKR1BhMTdHemY3Y0h5bTVPeHRjK3piKzVWY3F6?=
 =?utf-8?B?cmNmeE1BOWhoYUVmOWJqRVlYYkoyRUJ3MUlCdnl1S2ZvNk1yOXV0TkMyQWJ3?=
 =?utf-8?B?SUE4ZzIwcHplWm1HYi8wZEZiNGhnNFdycTBySEtjMHFsbVZqMUE3ZDJoNFdp?=
 =?utf-8?B?K0Q2OCtHZ0dhdFRTM3RQRTMrU3JYc3l0TGg4dExqaStlWlFWdm93UDNuUVF0?=
 =?utf-8?B?dlB0R0ZvcVFPR28xbDBhMnA2RHFnc0lqeW5DblBGQ1h2K25rVkVJdDFZMFFO?=
 =?utf-8?B?aXlkY0Izc2I2emlsMC9uY1JtYWRudE1ZU283TnZzUThQU0FxSmFhVEU2RWlQ?=
 =?utf-8?B?eHNIcnFkNE5yQmNzZ1FtbXpjVHF0bUxPSWJ0VHdGb2NVTWphU1dXRnVxWjNn?=
 =?utf-8?B?QTNWcGtiR1RESStTZUtFRkd6U0RjZGUxTEN6NHZnd3pSVGcvZmtTUEcrcUtS?=
 =?utf-8?B?dGRuNG1QN1FSZzdOaGg0b3dGWXF1QzJBTXdkK0ttRTNtRlk4NDQxOWlBTG9m?=
 =?utf-8?B?WTZNMHBGeUgwOUdSSGJuNGluM1VnL0ZJNzRVQVRrMlJOd010UU11cVc1OFZL?=
 =?utf-8?B?dUxTSjZLWFEwaHo1TDdEbTBrOWIzQk40My9zaHJPTWc4bkhYeUJ6cERRRzdu?=
 =?utf-8?B?RkFZWVFnaEhuVFRpZFVlRGcrWXFxTFV1YTlRK0g1cVBBMjZyK3U5dUhFMi9s?=
 =?utf-8?B?OU9OVUdaejZ3bkwrWXoxclArQ0NwR1U1cjBEM1I4emlaTzZHTzA2Z0M3RTUr?=
 =?utf-8?B?VjlQRU1mRG9sT3hrMjRlYXNCRWNVNWdIUnlNWHFQRTdsWCt5U1dQWnFVZml6?=
 =?utf-8?B?a0ZyVlk2QS9ldGhWamJxNHZQeFM1Mis5czJrNDhTQXlhTDVodlpGUGlTWXk4?=
 =?utf-8?B?OTk1WWM2bW1CU0FHeUNBemozRDloTEl1OW8wdGdYT2pBZ0VGV2FxUWtLc0tR?=
 =?utf-8?B?KytUZVpTalgydE5aZzhqcURwRkZOcCtlY1Z5bThyQmpZdWFZSFFEQ3N4TXJx?=
 =?utf-8?B?MWxyVlR3TWljM29yVzZpTTV2TjhiQWtJTDc2OU5OWTZhcUNyZU50ZG8yQTcx?=
 =?utf-8?B?akMwRC94ZXA4S09Lb3h1bHZyb3NVWWozUHM5U1ZsbjlhbjBlRHhmeEdTSnN1?=
 =?utf-8?B?TEEycGFjNmFxV2dwRG5WVVhEbVVtaGNNYnVmSysxMVhCUDBWTzI4VHg0TUpa?=
 =?utf-8?B?L05CTGZlNmpTL0RRTEh3cGJmRHB3dDVsYkgvbUJneW9vUEJkalhKNzUzcWVB?=
 =?utf-8?B?Y0V3REN1K0IySXkzVC9iZmtUTWNPUEd1V2tUQy9Rb1h4dkg4RVcyVlFkdjNu?=
 =?utf-8?B?eW9rSkwxRlMvNlVENnBqREwyNWgrWmRNbDF6NDI5RU5zV3JiNGYrWGw5VUUv?=
 =?utf-8?B?cVVPR3AzUUIvT1M1T3FjVVlmN1poa1N2S0w4V0ZjZFlESllhbUsvM2NqZjFJ?=
 =?utf-8?B?Ykh4K3o2L3pSallZOWVPNUM4NUNkUFJ3N2N3eFNScEUrWTI5UlM5WE5YSFZH?=
 =?utf-8?B?OVAyUlczbUNCNEpXYitzaGRhOFF4RUhId1NlVldzVFJUMVJJSTJreHNkV2x5?=
 =?utf-8?B?ZDJCeHpyd1ZPMXFIdktCZUhjaTlDUS9XREV5Y2RDY1lnQnJieW9qQnJZU0tv?=
 =?utf-8?B?TnFjbUMvWXgyNURmdlFLR2J3VUp5SjA0MXpWaG5MTk0raU82U2pmdzlVWjY4?=
 =?utf-8?B?eitYQ05xb2dEa2pUamNRZW0vQUVDOE1oT1IreGxtWnBlTGxZbDRjQmFIRC9r?=
 =?utf-8?B?UTJWNWhNa1pNS01uTE9BTlExK2h3PT0=?=
Content-ID: <6D88B6CC3A43274C8F83DAA8181F7915@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553a2df1-2d56-4705-20fa-08d9b8e3ea13
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2021 18:12:07.2590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KPUExDsGB7puoo/Ma7IxZHlzT2UR+6aQecIJYa5OUJV1nFvNhcLhhy6ACIzLA1hjw8wlPHNhL1kiawi/d1AmFo3J3EQXL1PrV2O0fD8k0CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_101215_271536_E66CF9C6 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com, michael@walle.cc,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/6/21 5:04 PM, Pratyush Yadav wrote:
>>>> @@ -2773,24 +2807,28 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>>>   * parameters that are not declared in the JESD216 SFDP standard, or where SFDP
>>>>   * tables are not defined at all.
>>>>   *           spi_nor_late_init_params()
>>>> + *
>>>> + * Return: 0 on success, -errno otherwise.
>>>>   */
>>>>  static int spi_nor_init_params(struct spi_nor *nor)
>>>>  {
>>>> +     int ret;
>>>> +
>>>>       nor->params = devm_kzalloc(nor->dev, sizeof(*nor->params), GFP_KERNEL);
>>>>       if (!nor->params)
>>>>               return -ENOMEM;
>>>>
>>>> -     spi_nor_info_init_params(nor);
>>>> -
>>>> -     spi_nor_manufacturer_init_params(nor);
>>>> +     spi_nor_init_default_params(nor);
>>>>
>>>> -     if ((nor->info->parse_sfdp ||
>>>> -          (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
>>>> -                                       SPI_NOR_QUAD_READ |
>>>> -                                       SPI_NOR_OCTAL_READ |
>>>> -                                       SPI_NOR_OCTAL_DTR_READ))) &&
>>>> -         !(nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP))
>>>> -             spi_nor_sfdp_init_params(nor);
>>>> +     if (nor->info->parse_sfdp) {
>>>> +             ret = spi_nor_parse_sfdp(nor);
>>>> +             if (ret) {
>>>> +                     dev_err(nor->dev, "BFPT parsing failed. Please consider using SPI_NOR_SKIP_SFDP when declaring the flash\n");
>>>> +                     return ret;
>>>> +             }
>>>> +     } else {
>>>> +             spi_nor_init_params_deprecated(nor);
>>> Hmm, a flash without SFDP would always go via the "deprecated" path even
>>> if it is a new entry. It makes no difference in practice, but is just
>>> slightly confusing logically. Can we make this a bit clearer? How about
>>> this:
>>>
>>>   if (nor->info->parse_sfdp) {
>>>         ...
>>>   } else if (nor->info->no_sfdp_flags & SPI_NOR_SKIP_SFDP) {
>>>         spi_nor_no_sfdp_init_params();
>>>         spi_nor_manufacturer_init_params();

We'll get rid of the default_init() hook anyway, so I will
remove the call to spi_nor_manufacturer_init_params().

Cheers,
ta

>>>   } else {
>>>         spi_nor_init_params_deprecated();
>>>   }
>>>
>>>> +     }
>> Ok, will do. Can I add your R-b tag on a local v6 with this change that you
>> proposed? It will spare me of sending v6.
> Sure, go ahead.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
