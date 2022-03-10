Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2BBC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Mar 2022 08:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+KjaSRu9hDhF4KPLrxOhOB3hfL5qfUmJi2RG+LMM5s=; b=2EwcPigiqzuaeD
	P9cEZ50aQYoVrOLHDaXtaXtgK/CqiiS9fit5yi+HqdFEYZK++gwA7kFDvwLwSPApqcpxQmk+IqFEX
	4XRgmGFwxqROFiNPx3GFK3Jse20zuv6ExYvxbbhhRYXwPKSKgou4kbBoLh5XjXPwdhdQLcfO3KnuB
	Gp17c3r0RYLdlN0ofAi6jUGbJHSAiyhDcfg2XKpTXflQY+LZKZWdlPIAPOEBFz2FARGL97HxFLfW7
	DzXfWrkDvyYqxKm25FQBuy9266LAhovn0Wd4T9ZyJDPtHTUlAjIJR8IksrzOO8UaWmEhP2rtWeKJ0
	NQyG+cV5qesaLv4J6LyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEZS-00C1iW-TF; Thu, 10 Mar 2022 08:54:55 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEZN-00C1hE-Uo
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2022 08:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646902489; x=1678438489;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=neRTR6WmhoU2DM1Hwn25hj9amsQGl0n5MhCekeXFOzo=;
 b=RpDARHSwy9ntB2iCEiHR8bPLnJPUyNcGEFX+26Wo67ZL42O8MvlKDnZV
 D+E7qaJXN6phw5wmd4j9tOmk0iz2sdHXKZzHqI3JFpWGHPrS1LMye1cdm
 TxCbXQ9b8Wb/gwLnN36DoDRelZiCQBZ8bm8bsVGokPV/Ny1KnbQFRajGn
 wJrqRois/horvHsSS0Gm5GDPsnOVq1N9VhGUI4NEFF1VxbpqJSukpxioj
 DUzmQWZVUU5PPQKMZfff1L13Xq0L5X6CxIinL75EwLNzSZgok7ccOkjPb
 fed/r9Mh7zdKq3VhmioT+rRaRRIZN1iT50j5KELIEw745zHQttW0Zbnsy A==;
X-IronPort-AV: E=Sophos;i="5.90,169,1643698800"; d="scan'208";a="165245163"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Mar 2022 01:54:48 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 10 Mar 2022 01:54:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 10 Mar 2022 01:54:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1jG30S3VZy+dJPOc6N8xfaKSqCF6e4uCTdIOxN9Djy7ohLbaiMQL54/jk/rSPHUTiINiSeFvcnEu0phYp8Wfgqd2P4hVPNytTlp6+/MpQAZLp3wF3H+tyLxGJn+k17Y2q0PNMvYgF7EGDS5Cmxkoiw5dG81NWUp/m8ppj0F5bu2OhIWDGrnVv7E3z9wBsDt/BZv6zODE3gc/rQ+s44RzOTuxmF5RhndBKYyx6uSWUawxNHb9JWI8ocDqwxFMqx4eET9XHuL0xPa4AVpidbi/FG4RJDyyVc4ZYwcie5CXspdSI4XbKm2Zpx2T+P3PHxyNR0ewAPMEw6MbCD/Hwytdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neRTR6WmhoU2DM1Hwn25hj9amsQGl0n5MhCekeXFOzo=;
 b=jsIfOF2bcc6798vLX46aiOPfFle83wiubwGdgqiDjWEZlQ3HZT7OO4x5c8jDZionDiFnrdUgvXBeVF/LJPjQDipTqRM8rHQW35BRQVb2ZjLrw6RB0U+ORW5zkNzbZfdNEYndKlSCBk00aUAEAn7ySgmA69Wp9FBoPQkuH/7HwjlTmI/1eXdPQsw9nMLSvbfP3r5pVHx4IHfxPIDSCq6HEXaMJeRFVvLsTyGLREa6mqowK6yTkHmve9CyGe/IEL5/jKn1tIhoap4+VpjrhOaGxTh/6V6RfO0U9CF+2/D1KFnBE62fnrd/Z9HzPcSCOGj+4MC9Bog+IbIiCGKhnbIkpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neRTR6WmhoU2DM1Hwn25hj9amsQGl0n5MhCekeXFOzo=;
 b=arUjeEdHSFVlENjJv0UigSFCBNALPNWADejwoxRM3Kovi4Ki6xmV8ua3CjMoE7PYlv0WmKHR3Mmb1Q8sp/fbh8dIwzSjKSGoKiCPtHKn5Cb//PZrsF/n9Nfh1gTJ36zJMGS86iQXRRZtgHHbsjn4V6d3m6SF504O4AyulZ44f7k=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by MN2PR11MB4520.namprd11.prod.outlook.com (2603:10b6:208:265::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 10 Mar
 2022 08:54:43 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%6]) with mapi id 15.20.5038.027; Thu, 10 Mar 2022
 08:54:43 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>
CC: <michael@walle.cc>, <broonie@kernel.org>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <Nicolas.Ferre@microchip.com>, <zhengxunli@mxic.com.tw>,
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH 2/4] mtd: spi-nor: core: Allow specifying the byte order
 in DTR mode
Thread-Topic: [PATCH 2/4] mtd: spi-nor: core: Allow specifying the byte order
 in DTR mode
Thread-Index: AQHYNFx8f7+WK6w3y0ymEA9p051zmg==
Date: Thu, 10 Mar 2022 08:54:43 +0000
Message-ID: <19e9f9a3-7648-b2e3-4731-646e09ec9f0b@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <20220218145900.1440045-3-tudor.ambarus@microchip.com>
 <20220302113449.tc2iipvwtaxavfec@ti.com>
In-Reply-To: <20220302113449.tc2iipvwtaxavfec@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a993bd2-fc19-4f7a-68d2-08da02739ec9
x-ms-traffictypediagnostic: MN2PR11MB4520:EE_
x-microsoft-antispam-prvs: <MN2PR11MB4520FF35B83DDEBA86DDF347F00B9@MN2PR11MB4520.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Tje5UV4pDVmL41ehbNq7CEv165aaPmmizoY0wbKMI7OrpDJ8M1gcI120pa7d2ENJrYXRsJWSDDBGKqLc7U+vnYGhChtVC85faaP39T67SPvksTFlil3ZMm/IYcAtmCdeWajxJuL5D3hnV0Hhax3FBFbrHjJfOaQwxGqan8o9QjwkCX5trNy1wgfewBnf4EPIxk2K6wBikZkCOBeojWfyh9JVkj+LQPpxmPrwuCyT1sWfiX81aqwNQMaTBjX24kYao7n5rcuYQgpxBQtgfm4T8vmC19Pl02quY25i7tz1JpM2lLQ/l1rDWXQYtg/GnnN7/JQ+EJoeLVuvTGkfAm7p63olPNWAtjC9dWjbOOmCeGBzJNB1lA2bX1kexhwH2PYUxiQ3AqFUUmtd89X+AQOSnrt503yfsfhZZCbQHaTBntBsZ9NvQu5HVcoMFF40m700Vg1VH0TutyzNlL/FwwkfOLRaafJFIXEcGox+LdL2ODSrD4O+zc2+B7O8a+a/1ZYq8XLXGcD2rK69863od2ZG4EzNXT5xZxe96f7LpjL1lFq1UtMzP/TooZNrPfICf2+t3Hqiwr1zn2bmslKmQwlgIr49MN+/z7eF0ETEt0RhjZ1/GlE57F7h6MedHmLF8b82HAomAt1mQMgpWb70CNftR7O9v8OHKOes/5pPt1bKf7KJDi9g4/bmsv0RyyzVpIwbhjEkRnu/tdkpAcmLDeRj98N32/+FMwXDOOPzlvOK+bilvc/8Z3ZvW7RDq2mXXwXT3FXMjQWBEklrTsUOiPFMkg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(2906002)(6512007)(6486002)(7416002)(66446008)(91956017)(4326008)(8676002)(64756008)(66946007)(66556008)(122000001)(66476007)(76116006)(26005)(186003)(8936002)(31686004)(2616005)(86362001)(53546011)(6506007)(508600001)(83380400001)(6916009)(38100700002)(316002)(36756003)(54906003)(38070700005)(31696002)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEdUZkMvUlpBY3dhS1N6aGdiaENhSHQ0K0xRbjh1V3o4dkN3VFc4ZTJXZlB1?=
 =?utf-8?B?L0tLcERyZzlnbzZGdGVadHVROExyN1kyYTNXZzNScmJoaDBwSi9IZnBUc05a?=
 =?utf-8?B?VmhUQ0x5QnhweVMvVlcyTTFldDVFR3M5ajExQmE1N1ZQc05tdXNxcCtDbXEx?=
 =?utf-8?B?YXJYU0pmczJCT0VqYXRQemFUdEpaOWsrcU9ZTUltb1JMVTBDUGdPbHYwcEcv?=
 =?utf-8?B?V1pBSVpKM0p5Q1ExVnlIamJKdXFYL05wVTBUTjFjdWRRWUZ2ZkNSL0lscEZT?=
 =?utf-8?B?emdoK1Q2WGllZ2V6L1ZMUC9nM2Nwb0IrdFRhNWR4a2phU0dvV0Q0MVBnSkt6?=
 =?utf-8?B?REE2WkRpT3FKbDdOWEpXdlhLWjVhOFo2MDM5V3grMTMzUG96M3JGODdwRmxC?=
 =?utf-8?B?cGU2VFJxSUN1c2ZCOVJYNDRYYUlXdnMvMXAvc3lrWVdhMWQwb3ZFaEtHdkJ4?=
 =?utf-8?B?alhTdzhJZjhHSVBRdFRpUG05aWFTQkNFMnlCTUpvc0R5NWVKaUxhTU5lYVVC?=
 =?utf-8?B?OXdMa1k1YXFRRzVITXcxWHJzKzh2OGJ0L29uU09xVDcvUG9KMktra3JWSkt5?=
 =?utf-8?B?NFZ5ZkFOV0lkQWxuLzZMR09QaStleVIzalBLZ2VkNDR4KzdGZjl6S21ybTRF?=
 =?utf-8?B?T3BteERFUnpCSmU5dlF2cUhBMDZEOVpUb1h4YkZJVTk5L0UwZ1FxbTEvZzlT?=
 =?utf-8?B?UkNoZDZLVGs3UE1KQStQUFZwMlEwWVpvWElvK08zRWR1MU1qTkdDS0ZPYTR3?=
 =?utf-8?B?YzBla2Q4NnRMeWxwRUppTklpYVFqRXhlaDcxMkJ0M0Z1YlFncDFybE1ranZa?=
 =?utf-8?B?NHpqdkJXbEsyWmRXM2hsRDBwZjVnQUlpSklhRUV4ZFFQSnVnVXJmQTBjRHRi?=
 =?utf-8?B?cmxGVXA3ejNuM0EwZXY2SS9vRnVSeGVPRk9acUtwSXhXcnBuVjhDMHpIbUU3?=
 =?utf-8?B?NDdrcW0rdVpIWWxQM1laeTg0ZUVWcTdLWnpHaStBdHpkdjlLS2JpQ2pDM200?=
 =?utf-8?B?YnNNQkNyQWtYUDFJaC9EbFE4UHM3SGRpUzF3bCtCRnd3N3JPRjY2V0VROG9D?=
 =?utf-8?B?Q1M5TFlXOVdoOTVlMXFDUHV1bzg5VWZQN213OStrZCtudlN2NVRSVHYzQ3lH?=
 =?utf-8?B?TlVKbS82TVA3UEZpcjU4dGgyNndYdjNveWgyK0NhZ0ZOVEExcHErZDY0bitp?=
 =?utf-8?B?ZTcrREdWZG00QW9nVTFGUDVrUHJWTTBRbkpFOFI2RWt2UUxZTEZmYW5pcGhN?=
 =?utf-8?B?UjBlRjBYelNVMldoUmlIakRtdFRVeEkvbzdKcURNbis1bTF6WTZvdlpqbHBT?=
 =?utf-8?B?TU1yT0Jxbm9SaUxnemRvVnBYdGdBZzdKMVAwTFdjVTNNQktjUVhUZFlrVGND?=
 =?utf-8?B?MGhUZG9RcVhnVHZZYVFncUJHaHRtVUE2TzFHZVFGcHdXMHhqQzNEWkk4ZUR3?=
 =?utf-8?B?Zk9VNkdpVFBSR1duTFphRVpUL0lRMm00T25pU2hkVFhZVnBSVGdpcWJzNGZR?=
 =?utf-8?B?djArbGNMQjNjK2FpSjE4SWQraWV2NHV4T2NPOVd6Z0hQei9zWFF0RDM0cnBq?=
 =?utf-8?B?VEtQazQxTkExZ1RNTHhReXVwVnFvZlZtYmhod1d5RDZ2bitibldoNGl3N0xX?=
 =?utf-8?B?WFpqVVFXN1VSTk1HNlhEMVlUZ2c2cTlXb0xuVzJNZUhiNjBnQmM5S2d1azYw?=
 =?utf-8?B?ZFJNS2JndkEwOU9Wc29xdFpITFNINWFKamtrWkxDZjZpOXVJUzRmTkhqWlh1?=
 =?utf-8?B?YVcrRzJSVWVMeGs3SUpuRnhObHNnREh4a1AvaVEyV1JWM09CelJJdGpZOStY?=
 =?utf-8?B?dzBsSG1DSFFNa1ZOOEd5ejlNUHArY2FSYzBVb0RHTFQvNE43VTdCR2MyUGV3?=
 =?utf-8?B?dlo5b2kyUHRrei9YOHBwY2p3S0JjOStkT2Z5Y1RsNVgvSzVsSXQxZzllWHk2?=
 =?utf-8?B?RWJxUUMyUElYYW4xT01udnhvWlpZRVpGMWxPbnlMdFFzSjdJOGRpYnJtRWNv?=
 =?utf-8?B?SUx4eHdBVmZsdjIrZnB6VHZ4SlNxTkVoRHFvVGpmUVh1SUFEWFdSb1dSU01y?=
 =?utf-8?B?V2p5M2M4bWp6WmhveGloT3lGZ1dvUG1OdnVFVUZsTUlKL01BcHZjTHBNN09h?=
 =?utf-8?B?cUd5bi9mYmloQ2R2U2VRZWQ0VGNIeHV1bXduQzc0UE5QcDFMSEpZcWtnRlY3?=
 =?utf-8?B?N2NERTluOXRoMEN0WHlaT1F3clpKWXplbXVxMnYrZzJjbjZ0amhVS2JSUEZT?=
 =?utf-8?B?TENNekh0dVRUc2ZJdUkyZjBzQ2Z3PT0=?=
Content-ID: <6D38050A4A0F774CA9D20DC6E0F2DD9B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a993bd2-fc19-4f7a-68d2-08da02739ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2022 08:54:43.3903 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDYUnSXMBYpIsk4p86eOmyPN1urWn8Yl0QEdJinlM+SayxfZlwC5+4rbUOeVP6j1G2Bn5zHQJDtTzeiPa8A9qvcRM8jxcb4TwCGt8ovVlRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_005450_102627_7B3815DA 
X-CRM114-Status: GOOD (  23.92  )
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

On 3/2/22 13:34, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Tudor,

Hi, Pratyush,

> 
> On 18/02/22 04:58PM, Tudor Ambarus wrote:
>> Macronix swaps bytes on a 16-bit boundary when configured in Octal DTR.
>> The byte order of 16-bit words is swapped when read or write written in
>> 8D-8D-8D mode compared to STR modes. Swapping the bytes is a bad design
>> decision because this may affect the boot sequence if the entire boot
>> sequence is not handled in either 8D-8D-8D mode or 1-1-1 mode. Allow
>> operations to specify the byte order in DTR mode, so that controllers can
>> swap the bytes back at run-time to fix the endianness, if they are capable.
>>
>> The byte order in 8D-8D-8D mode can be retrieved at run-time by checking
>> BFPT[DWORD(18)] BIT(31). When set to one, the "Byte order of 16-bit words
>> is swapped when read in 8D-8D-8D mode compared to 1-1-1 mode.". It doesn't
>> specify if this applies to both register and data operations. Macronix is
>> the single user of this byte swap and it doesn't have clear rules, as it
>> contains register operations that require data swap (RDPASS, WRPASS,
>> PASSULK, RDSFDP) and register operations that don't require data swap
>> (WRFBR). All these are not common and can be handled in 1-1-1 mode, so we
>> can ignore them for now. All the other register operations are done on one
>> byte length. The read register operations are actually in 8D-8D-8S mode,
>> as they send the data value twice, on each half of the clock cycle. In case
>> of a register write of one byte, the memory supports receiving the register
>> value only on the first byte, thus it discards the value of the byte on the
>> second half of the clock cycle. Swapping the bytes for one byte register
>> writes is not required, and for one byte register reads it doesn't matter.
>> Thus swap the bytes only for read or page program operations.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/core.c  | 31 +++++++++++++++++++++++++------
>>  drivers/mtd/spi-nor/core.h  |  1 +
>>  include/linux/mtd/spi-nor.h | 17 +++++++++++++++++
>>  3 files changed, 43 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 04ea180118e3..453d8c54d062 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -106,6 +106,9 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>>               op->dummy.dtr = true;
>>               op->data.dtr = true;
>>
>> +             if (spi_nor_protocol_is_dtr_bswap16(proto))
>> +                     op->data.dtr_bswap16 = true;
>> +
>>               /* 2 bytes per clock cycle in DTR mode. */
>>               op->dummy.nbytes *= 2;
>>
>> @@ -388,7 +391,7 @@ int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>>                                  SPI_MEM_OP_NO_DUMMY,
>>                                  SPI_MEM_OP_DATA_IN(1, sr, 0));
>>
>> -             if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
>> +             if (spi_nor_protocol_is_octal_dtr(nor->reg_proto)) {
>>                       op.addr.nbytes = nor->params->rdsr_addr_nbytes;
>>                       op.dummy.nbytes = nor->params->rdsr_dummy;
>>                       /*
>> @@ -432,7 +435,7 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>>                                  SPI_MEM_OP_NO_DUMMY,
>>                                  SPI_MEM_OP_DATA_IN(1, fsr, 0));
>>
>> -             if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
>> +             if (spi_nor_protocol_is_octal_dtr(nor->reg_proto)) {
>>                       op.addr.nbytes = nor->params->rdsr_addr_nbytes;
>>                       op.dummy.nbytes = nor->params->rdsr_dummy;
>>                       /*
>> @@ -2488,7 +2491,7 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>>  {
>>       if (nor->addr_width) {
>>               /* already configured from SFDP */
>> -     } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
>> +     } else if (spi_nor_protocol_is_octal_dtr(nor->read_proto)) {
>>               /*
>>                * In 8D-8D-8D mode, one byte takes half a cycle to transfer. So
>>                * in this protocol an odd address width cannot be used because
>> @@ -2701,6 +2704,19 @@ static void spi_nor_init_fixup_flags(struct spi_nor *nor)
>>               nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
>>  }
>>
>> +static void spi_nor_set_dtr_bswap16_ops(struct spi_nor *nor)
>> +{
>> +     struct spi_nor_flash_parameter *params = nor->params;
>> +     u32 mask = SNOR_HWCAPS_READ_8_8_8_DTR | SNOR_HWCAPS_PP_8_8_8_DTR;
>> +
>> +     if ((params->hwcaps.mask & mask) == mask) {
>> +             params->reads[SNOR_CMD_READ_8_8_8_DTR].proto |=
>> +                     SNOR_PROTO_IS_DTR_BSWAP16;
>> +             params->page_programs[SNOR_CMD_PP_8_8_8_DTR].proto |=
>> +                     SNOR_PROTO_IS_DTR_BSWAP16;
>> +     }
>> +}
>> +
>>  /**
>>   * spi_nor_late_init_params() - Late initialization of default flash parameters.
>>   * @nor:     pointer to a 'struct spi_nor'
>> @@ -2721,6 +2737,9 @@ static void spi_nor_late_init_params(struct spi_nor *nor)
>>       spi_nor_init_flags(nor);
>>       spi_nor_init_fixup_flags(nor);
>>
>> +     if (nor->flags & SNOR_F_DTR_BSWAP16)
>> +             spi_nor_set_dtr_bswap16_ops(nor);
>> +
>>       /*
>>        * NOR protection support. When locking_ops are not provided, we pick
>>        * the default ones.
>> @@ -2899,8 +2918,8 @@ static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
>>       if (!nor->params->octal_dtr_enable)
>>               return 0;
>>
>> -     if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
>> -           nor->write_proto == SNOR_PROTO_8_8_8_DTR))
>> +     if (!(spi_nor_protocol_is_octal_dtr(nor->read_proto) &&
>> +           spi_nor_protocol_is_octal_dtr(nor->write_proto)))
>>               return 0;
>>
>>       if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
>> @@ -2968,7 +2987,7 @@ static int spi_nor_init(struct spi_nor *nor)
>>               spi_nor_try_unlock_all(nor);
>>
>>       if (nor->addr_width == 4 &&
>> -         nor->read_proto != SNOR_PROTO_8_8_8_DTR &&
>> +         !spi_nor_protocol_is_octal_dtr(nor->read_proto) &&
>>           !(nor->flags & SNOR_F_4B_OPCODES)) {
>>               /*
>>                * If the RESET# pin isn't hooked up properly, or the system
>> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
>> index 2afb610853a9..7c077d41c335 100644
>> --- a/drivers/mtd/spi-nor/core.h
>> +++ b/drivers/mtd/spi-nor/core.h
>> @@ -29,6 +29,7 @@ enum spi_nor_option_flags {
>>       SNOR_F_IO_MODE_EN_VOLATILE = BIT(14),
>>       SNOR_F_SOFT_RESET       = BIT(15),
>>       SNOR_F_SWP_IS_VOLATILE  = BIT(16),
>> +     SNOR_F_DTR_BSWAP16      = BIT(17),
>>  };
>>
>>  struct spi_nor_read_command {
>> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
>> index fc90fce26e33..6e9660475c5b 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -168,6 +168,11 @@
>>        SNOR_PROTO_DATA_MASK)
>>
>>  #define SNOR_PROTO_IS_DTR    BIT(24) /* Double Transfer Rate */
>> +/*
>> + * Byte order of 16-bit words is swapped when read or written in DTR mode
>> + * compared to STR mode.
>> + */
>> +#define SNOR_PROTO_IS_DTR_BSWAP16    BIT(25)
> 
> I am not so sure if the protocol is the best place to encode this. The
> protocol stays the same regardless of the data organisation. Maybe all
> we need to do is add something like
> 
> static inline bool
> spi_nor_needs_bswap16(struct spi_nor *nor, enum spi_nor_protocol proto)
> {
>         return (proto == SNOR_PROTO_8_8_8_DTR) && (nor->flags & SNOR_F_DTR_BSWAP16);
> }
> 
> And then call it from spi_nor_spimem_setup_op(). Thoughts?
> 

I find it better. There's no such thing as a 8D-8D-8D-bswap16 in
the standard terminology, so I'll drop the protocol handling.

Thanks!
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
