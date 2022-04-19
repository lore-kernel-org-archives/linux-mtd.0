Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E24C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 13:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdoNyS76LByn4ulBWQ2BHOSi4gxbEL/qzO6duW3Djgw=; b=OkbdlbKhTyWKv9
	leYltsxjQql4O0Y1copr0hKp+ncFILTjpFlSaf40rryJb29O0OOFCRWrQxjRS3skvDOPNgfas7/fS
	U8bDyyNTT6jlzQcpl0rl/E+Ha+skbFVCyH9uWFYuIs11iLy5KIe+cr5qt3RA5ogy/XOW8zsuHZcm0
	nzTJrpT3uBGcJJjWv81gLLdzwz+uyUiacVnXk40HZoRM7rFRX+PPmW5aiKQVDbxqcdLRCAzltX6nv
	pMVmVJ3H/IeMmplI1tLlsr7yAL/UAxsxen4fz7CwTshpdULztRrMyAqZPlubkdoylrQclB4tTwqUd
	sz3jHSf/+nisGEh8hekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngo8Z-003xPm-Qr; Tue, 19 Apr 2022 13:43:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngnMe-003dWi-SM
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 12:53:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650372833; x=1681908833;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=b7Blg1Msw9kmMCu9XM8VTdPDQKlT+YXwLCO+BGzoMGk=;
 b=dVsdcYSnjBCrU6IX9UooKky1qMLSI80MHWmgLYlVgobjbVO89T474RHt
 h1nRN4qBO066atB/8X9RV6UFOsxVKhv/54KJojqznrdWilyTj1cp5naaz
 3ezwWHX6Vai92k/zdPMHrmYn47Loh4+/DNt+Z5VGiWNT1ixvoJtdkGimj
 lyC6W+MWFKpR5BlzW6uDuaDIGDTCbtu7dsAr3CcuNT6XY1G74Hh8mf2P8
 JxvE/758liDFOcv4Qt9wTxqL3b96xosDwdE9RljV8zHsx6SGiQ6FcUdCc
 DWkpsGvTUKZEMdAKCw0W9M6MLLg2KUW+JR+eoRav+z3xz5Qo15DAkcnjo Q==;
X-IronPort-AV: E=Sophos;i="5.90,272,1643698800"; d="scan'208";a="160535895"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Apr 2022 05:53:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Apr 2022 05:53:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Apr 2022 05:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSN172HVSIUWDdsZJjvdXiIPskzt9ih6fYhpyArniIka9FP8Snv4X3DK0bbgXIKAKFuvNvWKfyyE0tntY0KCwHibVgDd6+wJstS8p8SHb8vwe3f+Xjrd7ULfV+Yw0VU6FO0/DbJhcqkxg8cdxHZlJv5Zews2ZCORjpjAZwFmQY2Gnkl5XC+iYQKwnpCQ7GE3M6g+EOJH+pgNkYNGEWBnfMao1SZktCbtwop3/qs3BdtphDAO/Fy2+eaMLgMN+py/xa7s1IiCa37c44xNDwd8WL4J/Kcm69R2PsVpbAh6wqtOFy91J0xMlwg8WD4icKnZNFZ+JZ/PHfVBYshe0bVtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7Blg1Msw9kmMCu9XM8VTdPDQKlT+YXwLCO+BGzoMGk=;
 b=HZxbXdW4EcM5IK90pdu9PrQlV1cwlRnISEh5+ESN84F89ig+jrT5Wc9vaQYnQkAluE4hEPQQhHtNYxds0+zUxGYcAfVtTkKYpxluP2k0KH2tj4+iAqeCv4P7fI8JyBCUQ1cCgY0IkPfxBC1Q+pFOKD54/b8OWPe4aaAS0AHk5has1BLuRb6G6oal7DnjDn1UdX+4ItKkrTHVsyaOhhwo6OZ4cyKk8l+kRHGgaKvr9x/QxJYWF1GuknGj/FlCn1HNLt2U8tx9bBP7RrvlDataYIeyKRICH0A+Qdg3ViZ55dzFnZEW44IHzqrS9c0D5NYKxLMJx9BgAVcHBFb8ZyMItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7Blg1Msw9kmMCu9XM8VTdPDQKlT+YXwLCO+BGzoMGk=;
 b=B3OGV9f0m3ItKR5327bGC8GR0sH2f1G5OaYn5l4toZ/u4GTLKavkTEBWdFtzIO5k29s5t9iYV8M9Ef55/xDJlbx3+AfebH/9oE4K/X43c5gA2ITvw7+r04l24qe893WNNr6LWePq83CoRmst/abWMFM4iDuhSBycpc9EigiTkAs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by DM5PR1101MB2201.namprd11.prod.outlook.com (2603:10b6:4:51::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 12:53:46 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.013; Tue, 19 Apr 2022
 12:53:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v11 1/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Topic: [PATCH v11 1/3] mtd: spi-nor: spansion: Add support for volatile
 QE bit
Thread-Index: AQHYU+yBqm1NfS6g6kq83AJmAOVTJQ==
Date: Tue, 19 Apr 2022 12:53:46 +0000
Message-ID: <06f078ca-0b78-5d3b-4eac-c24751604f68@microchip.com>
References: <cover.1650259501.git.Takahiro.Kuwano@infineon.com>
 <92241a7f523474d477a17437c8b6c926b29da4ab.1650259501.git.Takahiro.Kuwano@infineon.com>
In-Reply-To: <92241a7f523474d477a17437c8b6c926b29da4ab.1650259501.git.Takahiro.Kuwano@infineon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d34d46c4-94f1-4eae-8b62-08da2203a472
x-ms-traffictypediagnostic: DM5PR1101MB2201:EE_
x-microsoft-antispam-prvs: <DM5PR1101MB22018317557FAA0D7DD72007F0F29@DM5PR1101MB2201.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DzWyaS+0UIQb/ehDsSJ1mpX2DkbgjDsuxi4+D6qorvZUW+Gh4AJCrULM8W5LZyvC8SZgnDdl6fQtgEBi3YwCjTE1NGhwgB68av32O1dTa8ifwsUypzNUBalI5UAQ3LB0lbVoNR+EGbwVVvQhR6rVm2f3lwFN0ASIg36+nQCK0N67cUxJZOyDSETvq3KiBcT7eaWbgNPZ9EiL2Xow93I/6ib6NeaUBPUhgLnKvprukhrQCm7gt0oPNvTkCXjzNYLqfehxDcyuvsUN7jpJSCUNe1w+c5Fhex/PozLDOmx9C+/HEPFID7xDu6XVugvKt2vZPOn6OPxi3wnmfrSnnNyu9hB8x4KcgXlnRCYJp6DbNG0bOYJe1rT/Xj6E5mPKtSNla0n3P0NXRCbOyc7//YFnibPuXTavqWxMk3xVLucgpZwAqKPr2oj3Ospe73ZVBhGZD1nPTW1R3ha76yhwoWQLQKWJeBIjB4uh/lXmFz0M7nWrKIGlTKLJ3lQyc21ezqv8+dehjgyoChhyqrlKuyqY63pbZQTj5gDS5mtPqRkFR2mHMYldf71gqaZQdOSL+m7Q501HexiWP2ZctY4y+LZfVwpppvVIR8kcrAxT+g87uxczTBCh0lCIz9OV2l9HagpytkMvbbub83Qx5FKwzoVDJoW+sSaXkoVtkIUqFlnIdohiT7fV9DC9Bwz1NhqNqDdI13gAlBuzkxwjZzRT8APgqL7wrE/SqGRaHS9nmYnBrDfZNm4kqlOYjvImJ8gjcDbgMYVmsrVfcEoOOS4ngnNzSGsn0iydlBMN4SE4kFugIHed1gna2cLPZOnwSX6bCqgE4Q5/jmhuYgc3CGWxQtv4YC8cax0ET6EDO8Jy27bW9BU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(31696002)(966005)(6486002)(71200400001)(53546011)(4326008)(91956017)(122000001)(110136005)(316002)(186003)(2616005)(6512007)(6506007)(2906002)(36756003)(54906003)(76116006)(83380400001)(508600001)(8676002)(26005)(31686004)(66446008)(86362001)(5660300002)(66476007)(66556008)(66946007)(38070700005)(38100700002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3hKL0duQk5yR2ZDVmxlWnlpd2FjamluSWFaTnJwK0kzc09BQlBiNWdpRlEy?=
 =?utf-8?B?OG11R0hHQ290ZXIvbGJEcUtINkZ4NU15TnJvUnN6WTlIU0owS0JIc3gweVdB?=
 =?utf-8?B?ay9xMmFCa1IyQkdTeDdLWkxkVyt3UnlFNkI3L2U3eHRyY2NvdEdjZzFZSkQ4?=
 =?utf-8?B?Y3pyRllsMjdsWHUvcU5oS1JkeVBBVGRZZFI4Rk1USm1GaHdhZHBvVFJDSkJR?=
 =?utf-8?B?bElwbW5LZmY2V1g0cmE2d05UNnpVVWM2ZUI4K0lpcFpFQkRtT2JsS3NOQ2pI?=
 =?utf-8?B?WS85YmFLeVZBTWdwVWhqZCtJa2w1dldJUzEyNXhKajFmMThIL2xkRmpscmpJ?=
 =?utf-8?B?bjhpVzN1d3VxZFV5VVIwaE5sanVrbW9Pd1JDV3EvSkk4QXNQZnFrZCtoV1JF?=
 =?utf-8?B?NUQ0RTE5T3VUNnpCYWR0Z0dkYTQxcWl5TEJZRmdQeWkwUDl1UmNrbmRySUtB?=
 =?utf-8?B?Z2czVHFLQVdiN1pPeHpjNkU2cHlvbzRCWGc4TllPdSs3MGJMbW9yK1prdmlY?=
 =?utf-8?B?TmkxQnJUOUdPbFdUdGRLbkxqT2VSKzFRZVlMem5HbE80TUFBVGtVSy9ybkJ5?=
 =?utf-8?B?bnRSV3o2NXo2dmRCdXBHalI2a09LcHRRam5IVWNiMFNHUkFyZ2pERE5DSUtI?=
 =?utf-8?B?M0ZBU0dtellic0p6b0h1RXNoZ2EwV1Q1eWVRbzRkZnN6ei8vRzd4WVRJWGV2?=
 =?utf-8?B?NjQvdk84akJCNnhoajBIMGxOdUIzYWZ6SnZDdXVnRVRwSFQ5MGZ4WjFURW41?=
 =?utf-8?B?dXk1WjVDNG9ZK1RRNVY5RWpBazJZdDM0RERoZFIyL0JObnkvN0RFaEZiMGgy?=
 =?utf-8?B?NnVyK0pkcHZIMnZpeW80MmxnK0UxS1Ruc3A5ZjdqeVkzdTFrNUQzbzVGMFJz?=
 =?utf-8?B?Q2Q5Y3B6dXROdEQyMW12SFpKWlZoU3FpeVowSzhlUFJKNVlDczUwOFBqZEF3?=
 =?utf-8?B?SnM0dnh6MGFyQ3FMRjIwMjAydWtnME5vekZ4OG1rTnFqQzBUa2VKZDhGYzlS?=
 =?utf-8?B?K3F6K1AwYlk2eGV4OFlOblo0UDFkSEUxTHJKd1U1TzZsVDQ3czlhOTczeWdj?=
 =?utf-8?B?U1NmT2E5cXlRZ1hzVmtWZWJmMENDOVpsVmxPTjA2bC8yVTRLaFhUQ0xoUzVn?=
 =?utf-8?B?R1d3SllmT0ZvREN6cG84TDljTjJXeXZBMEhCSys4MzYrK0dweG8yN1QwdDZ1?=
 =?utf-8?B?ZFc4NFBEclJMdlJmZDRrR2ZoTUo3TmlleEtpazV5NTIvMFBwb2duZ0hKbjFG?=
 =?utf-8?B?SE1EZXdjcUJENEl1aytuZDRJLytPYzdzOFBMdFc3a3JXaGxFTEQrcC9xc3JS?=
 =?utf-8?B?U1FrUGpsVHRKMlhJVCsybUVaZzYyZHpwd0pGRzlYcXZYMGE1dEdXU0dCdCtU?=
 =?utf-8?B?MEZyNEVvTnpGdVFrbW8ybXhCMjZNZ0Myc1BhcHBIeC9nSE81U1hKc0VOUDZp?=
 =?utf-8?B?NUVMbVNFYlZMdlhvNGFwQUwyUWpjWW1WQXc1a2VMNXQ1OXBOSzZxNjZFRllt?=
 =?utf-8?B?bGZaQ3ZiTlhwekROUXpIK1AzL3paMlAreTVlQTI3ek9iaUNBZ0dwVlZkQXU5?=
 =?utf-8?B?VEl2b1pYaVN1VVNyTUJENThWZllGNWw4d2oyU2w1dnNSQ2Z3aXdKdVN6Szdk?=
 =?utf-8?B?RU05T1JBSk56VUxEOEd1elZSTzd6NEorMmhkT0ROYzVaVTJFUUhYN05lMjFt?=
 =?utf-8?B?eGwzbWp6YmVhdnM1L2dzWVFpWSs1bTM4TVUrTDcyYXRCM0o0ci9IL3lUTk9y?=
 =?utf-8?B?K0FrTFJScHp0SDRNbnd6Yno3NWhkOTNhcHh2QmxKZWF4TFVYVmRZQ0E5emxC?=
 =?utf-8?B?c3AxZW56UlF3SWpDU1BNN1lRSlM4VFQ2NzZFb3diZWU4Y29sQ1VoNzF0a3A5?=
 =?utf-8?B?UGNoNWtNSGN1ZGJvMlZxU0I0NWl0T2pLeUh5dHI3WjA3ZVhJczJRQ3dSL3hG?=
 =?utf-8?B?endNb29rdTZwNEgrQ0RsOFdETDVUSXd2MjgzN0dIQmU1QzhYUjc0a3d5OTF1?=
 =?utf-8?B?RC9RdjJhV2oxMlhSQVdSTSsxQzRLa2g0cm9lM0hpWVRuTnVVMTJDdHV6SFhv?=
 =?utf-8?B?V3FBM0ZKbjIyQURMTlNYVzgvSytNYmk4OUZKMENydHNsbGtxYUlKOHBzeEF4?=
 =?utf-8?B?d0ZBc0MxQWlzZkk3VlhKY3lTTzVIQ2pTNXpNbzlnQUs0UW80UnFtWXBPQk5Q?=
 =?utf-8?B?LzlqQjdwME1OTHpsS29mVnVjZ0l4NVl5My9xY0c0elNEbGtlYmxvSlNlZHc3?=
 =?utf-8?B?WXI1UzhUY3JvNGhvUFo1cGkwZE5hL2JjVTBxd0Y1QTF3c1RTTEtCQlZTZ3hF?=
 =?utf-8?B?L0MwdVp2dTIrV3h1WFd1Y0VXNld5K2ZGTW5vdUlGSGFTOTNmSzZjdDRvR2dz?=
 =?utf-8?Q?ANowil0nRbVQojfs=3D?=
Content-ID: <962032B03878B04A82EB71F7DA8F54B1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34d46c4-94f1-4eae-8b62-08da2203a472
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2022 12:53:46.5094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7UsMczbZBez8C5dFxjKXxW2RRyobR86EuipXXVn+uIS6uyPDQ6+z1bBwcGjxXbOYI2yed0tLpPrLw3byCGxCWXYVSCG14GS7PfEzu9vWa08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_055353_035015_985CA59B 
X-CRM114-Status: GOOD (  27.27  )
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

On 4/18/22 08:41, tkuw584924@gmail.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> Some of Infineon chips support volatile version of configuration registers
> and it is recommended to update volatile registers in the field application
> due to a risk of the non-volatile registers corruption by power interrupt.
> 
> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> ---
> Changes in v11:
>   - Rebase on top of Tudor's series
>     https://patchwork.ozlabs.org/project/linux-mtd/list/?series=294490
> 
> Changes in v10:
>   - Remove dependencies on other series
> 
> Changes in v9:
>   - Rename function per mwalle's series
> 
> Changes in v8:
>   - Use spi_nor_read/write_reg() functions
>   - Use nor->bouncebuf instead of a variable on stack
> 
> Changes in v7:
>   - Add missing macro definitions in v6
> 
> Changes in v6:
>   - Remove multi die package support
> 
> Changes in v5:
>   - No change
> 
> Changes in v4:
>   - No change
> 
> Changes in v3:
>   - Add multi-die package parts support
> 
>  drivers/mtd/spi-nor/spansion.c | 60 ++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
> index 952db7af6932..6bcd25180af4 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -14,6 +14,8 @@
>  #define SPINOR_OP_CLSR         0x30    /* Clear status register 1 */
>  #define SPINOR_OP_RD_ANY_REG                   0x65    /* Read any register */
>  #define SPINOR_OP_WR_ANY_REG                   0x71    /* Write any register */
> +#define SPINOR_REG_CYPRESS_CFR1V               0x00800002
> +#define SPINOR_REG_CYPRESS_CFR1V_QUAD_EN       BIT(1)  /* Quad Enable */
>  #define SPINOR_REG_CYPRESS_CFR2V               0x00800003
>  #define SPINOR_REG_CYPRESS_CFR2V_MEMLAT_11_24  0xb
>  #define SPINOR_REG_CYPRESS_CFR3V               0x00800004
> @@ -117,6 +119,64 @@ static int cypress_nor_octal_dtr_dis(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/**
> + * cypress_nor_quad_enable_volatile() - enable Quad I/O mode in volatile
> + *                                      register.
> + * @nor:       pointer to a 'struct spi_nor'
> + *
> + * It is recommended to update volatile registers in the field application due
> + * to a risk of the non-volatile registers corruption by power interrupt. This
> + * function sets Quad Enable bit in CFR1 volatile. If users set the Quad Enable
> + * bit in the CFR1 non-volatile in advance (typically by a Flash programmer
> + * before mounting Flash on PCB), the Quad Enable bit in the CFR1 volatile is
> + * also set during Flash power-up.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int cypress_nor_quad_enable_volatile(struct spi_nor *nor)
> +{
> +       struct spi_mem_op op;
> +       u32 reg_addr = SPINOR_REG_CYPRESS_CFR1V;
> +       u8 cfr1v_written;
> +       int ret;
> +
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
> +                                         nor->bouncebuf);
> +       ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] & SPINOR_REG_CYPRESS_CFR1V_QUAD_EN)
> +               return 0;
> +
> +       /* Update the Quad Enable bit. */
> +       nor->bouncebuf[0] |= SPINOR_REG_CYPRESS_CFR1V_QUAD_EN;
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_WR_ANY_REG_OP(nor->addr_width, reg_addr, 1,
> +                                         nor->bouncebuf);
> +       ret = spi_nor_write_reg(nor, &op, SNOR_PROTO_1_1_1);
> +       if (ret)
> +               return ret;

should you call spi_nor_wait_until_ready() here?

> +
> +       cfr1v_written = nor->bouncebuf[0];
> +
> +       /* Read back and check it. */
> +       op = (struct spi_mem_op)
> +               CYPRESS_NOR_RD_ANY_REG_OP(nor->addr_width, reg_addr,
> +                                         nor->bouncebuf);
> +       ret = spi_nor_read_reg(nor, &op, SNOR_PROTO_1_1_1);
> +       if (ret)
> +               return ret;
> +
> +       if (nor->bouncebuf[0] != cfr1v_written) {
> +               dev_err(nor->dev, "CFR1: Read back test failed\n");
> +               return -EIO;
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * cypress_nor_octal_dtr_enable() - Enable octal DTR on Cypress flashes.
>   * @nor:               pointer to a 'struct spi_nor'
> --
> 2.25.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
