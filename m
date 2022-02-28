Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49525C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Feb 2022 08:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H882JulVENjmUyuxyguZE4nogU6iAechF7SQlq6j6/I=; b=HyNbjeVOS6qZif
	uGMHAnUhNzRhMo2WphpIGAVjADefR00DqpLGOvV+3acvlMEq00RENpkUBl9lB70pXbsud689HqM6y
	dHvsg9HOgsbLBEcc22NOS5MEAjv99qkDFsnlJp9G99Dsoz1IQUKrfZuaGQzoYwx89kLqMNB00zzTi
	NVYms00PB9cbq+wv/cMJ0NEiXtzcH3uwmwagv57w+IElorKbn0OUviCOlGZdYTKuomo2MpyOIrRpk
	MXzqeiEVI2IkFasavZdf1sIU5fEAmqsjcNPWDoMUEpeMRIN2M0+FqRjamRI4N7hBxQppCQ0670o5U
	qHcuGrELTyigsuUNcn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nObML-00B7YS-9w; Mon, 28 Feb 2022 08:26:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nObMD-00B7XI-Hv
 for linux-mtd@lists.infradead.org; Mon, 28 Feb 2022 08:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646036774; x=1677572774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jFuc+YQRAraV3yOCTEP1HOMcsxmPmD7mjkovk0RQPiA=;
 b=icSHuZU2pmb8RwLdjBLuGQfMQu1IlYnmvPrarQ/8j7xoAw9Az4qQe1sy
 RLdBY6x0zojJbEjRiErc7UV4mLcrCtQNIXIeYyTEN7VQHC++FaoacYMKQ
 VDU7VacatYjpSRLMjEslKmfRbqMMvuCisH02YmcsIXGnpq4BZi5ZwRfGf
 ml7jfOKQmPE2muRAHnbhnRh9M0ybnPy4JBZMYkWNkeNzyTZyfIdRtiQAk
 e+gaHuEVQTGNw7tzGqzq5lZWxlRtlLftJ+WgVXhotorR+mJ/ANEs9d1KJ
 FMIatNieZvXHexFOAfCSwynHUsSc6OIZ7j5Pfcuv4LcvD4TGkzpfJ96Gx g==;
X-IronPort-AV: E=Sophos;i="5.90,142,1643698800"; d="scan'208";a="154599987"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Feb 2022 01:26:13 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 28 Feb 2022 01:26:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 28 Feb 2022 01:26:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xhp7eSAm1iSn/q8oXotD4Ffudcy8/wNgrKEH6/Ggvfto28d+Spdw6ssvgU9+HUDyw9JFrK1dVAWmi46Yy0y/O678WcC5sXo0hjq91jIG/t5Z/W1EjWYisYuVJqDtLuvd2ENQfBK3ksR4qwEocMHmIHAqzvl+Bn6c7/90QD6DB/z70rm8GgaPBVVpyTqtOQ7zVwRk4NhVyb+Alui68b+Y+wnbIRnWbo7sOqms0Qd3Fmys42ivx4uX7kRWURZlDACJHxXXzque5Zy3YZeLRnMP1NYUpGEv59pWrztMLdF0kLFrtDMLRtXHBvqg1u34dZvlM/xgIrkAfFVQEocCwhwDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFuc+YQRAraV3yOCTEP1HOMcsxmPmD7mjkovk0RQPiA=;
 b=PHJyJ8kaIy3VlEoawMSMxaFtEjTm2TLeNTsPJ8bhfxBPKP4WkfXBLZ5po80+7XHg0qiMggMQgApvSaSkr0Eq4O1vWIJqf9ho6tRCT/jb3pLvqAqxkR5/6Qn8J+QN76Sp50kVj2d6YDpHwMJAq8bprU9xAPpgNd7xdytMFQMV+4Kqe0xtQByKW2Gmr10umz3lusMPvaf8n2kRyF4HyBcDGF8OtKc8SzMzK6Tc90+3w8lTPUJ3aBz/K5Z2Ag0VrAXInNL7hChuFcCY2pWNxgoxkACvd09bpAjDsjzkf3Ek0UPCwbhIwLr5wy6kZDC3Y02YYJoMJ0vIk2b+fsTxLBfLbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFuc+YQRAraV3yOCTEP1HOMcsxmPmD7mjkovk0RQPiA=;
 b=hhVPE/Kk5MoUkiMvMIP3j68TMvXpfhlw3DQrO2TIGwWlSOYoQ4BQiNye5vgOiwLflI3dCWiyc0OC9RSJoS9QtJOExj9p6FtomEG8eYjdAmR4ByWA5ufeZHswKt2JGdmYARjq6iURNTg28fte9IyE96kPrlwp788h8a6YFy8w3dg=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by BN6PR1101MB2306.namprd11.prod.outlook.com (2603:10b6:405:4e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Mon, 28 Feb
 2022 08:26:06 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 08:26:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: spi-nor: winbond: fix the name of W25Q16JV-IM/-JM
Thread-Topic: [PATCH] mtd: spi-nor: winbond: fix the name of W25Q16JV-IM/-JM
Thread-Index: AQHYDhjFLhBRXvDs9UeqfMfsSjcwBayo3XaA
Date: Mon, 28 Feb 2022 08:26:06 +0000
Message-ID: <2d7ef659-b592-3241-ac7e-36736bd446c4@microchip.com>
References: <20220120145717.3027624-1-michael@walle.cc>
 <39603d75-f4a5-4bad-d2a5-99050b6b3407@microchip.com>
In-Reply-To: <39603d75-f4a5-4bad-d2a5-99050b6b3407@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 462abd4f-e3ab-4f97-47ba-08d9fa93f727
x-ms-traffictypediagnostic: BN6PR1101MB2306:EE_
x-microsoft-antispam-prvs: <BN6PR1101MB2306E6C3BBAD4BA74FE00715F0019@BN6PR1101MB2306.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BTD3Aj02qPSfhIZkkw2bEwoQOi+mDKGEI8Tpig1PZ90belK7aeqGv0jlplmj7xrY7gAvD9yTuO8Wdl2Sl2YlL80UIdq2goOeF2V0eQZDeP9XVLioq5XxAG0TAbiMuY1uArQlI87lCHi+DigkwfjARNztIHbdgiZI3bnqHKyUHn2eNmy0vAptOyzKYIMRg7rsxcENSZ7AFADdFhdR1QwuGktQlqMUyW7SQ5NN9VYAk2SrEvW8+Ow+sEVUuojVYsApXLfiz/esNWAoetGlVxcuR1UzwBFShcbbutIdtA/wd//nvHCriEROtgOiazOkP/CGpo9DUjzEOgZCaTT0twysrYhEj3afJaNEuR5r3pyjrILRJSQkBNncXP8VqwOmHr1XFdekpcWnnZvxrIZF3Ps3LhBX+L5efSZZePJzbNsJuw/pQqyJYVyHN8xSGD6F3Aj44jxyfp0bKsuKOWNQpGWUfw1TYBiWsVMLaA47socKhpj6In4kyfvjI1NePbpOZg6M2Ar3+1dzW6xITpG/mv9sIFqLnY3SokPk7lqVy002w8xfM7EOGHBlxzYEh48dabRtP688zSm2sCVUhuXNdz067XyNVCcVxlW0JSlveDmMoS9ksUtmGjjDIUSvWhPhpCdyLBThkh31kZMrp/k2u5fI8VdjmjgvFwXP8d4TFkk6P6jIMEtBR8Xe7ssCkEFoMqyBzs4huldld1JH7qubVM9ClBy2SU2ilrz3tidOCu8qGvO8t9mP3OZvX2thULdBUInOK0qPrrzaWrzU0cXtFknetg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(8936002)(122000001)(2906002)(91956017)(4326008)(66476007)(8676002)(64756008)(66946007)(66556008)(66446008)(76116006)(31696002)(86362001)(38070700005)(36756003)(38100700002)(31686004)(316002)(2616005)(83380400001)(186003)(26005)(6486002)(508600001)(54906003)(110136005)(53546011)(6506007)(6512007)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDM0ODI4NitMdzh3Z1RJNnAwTHFoWk5GRklGOGx5aFUwWHJmSm9wWFVKWnV1?=
 =?utf-8?B?UUFYb0lobCtDQWx0SXMxOVhDeVdKSFlpSzZTb2lYQ2xqMkpJbENueEszVFU1?=
 =?utf-8?B?byt0NXUzN2VDTEVqWjNod3FTUG94ZU0ydmM2eEVrZWVlQVhnNUJYQ1FoSVJl?=
 =?utf-8?B?OWdpSVFOUmE0OTR4SDZhQzNMK1hqa3h1QXZTbzMzWU1qWFBwOWIyMkJ6ZUFK?=
 =?utf-8?B?MHIxaHUvNk9UUFAweHN6b3hSdHJXcUZoMzNpbkZsdTRvUEN6L1R4cFlvSnAv?=
 =?utf-8?B?bDVMYzlYT2VwUWhzcW1vSS9VbXd5UmR2MHVrUTNqdENyVXh6ekp6elpiU3pX?=
 =?utf-8?B?NHRXd2JpM09XOEJvZmpTbVMvRG9ITXY3dGs2Q3MvdHFxcFdudk11cEw1Yktj?=
 =?utf-8?B?bWcxNy9PZ3h0VG4wSmNLWEtMTTFuT1RKQWxGdGFSMmFzUTcraXlIaEsvZ2hx?=
 =?utf-8?B?UHVMZDdHcjJ0RG5YT0pydFVRbzArNGhJMXRyQ05oN3BSNEdFY1cweExkY3pn?=
 =?utf-8?B?Qmhybjc5NFJKRE9sc1NUdWFyNTVXdWhhd0liRWZKeHBoL0UxRGJ6MVBJUXg2?=
 =?utf-8?B?cUV0UnUzRmtBZDBqem1ZdDkyTkcvMDQxamZQYXk0NWMxV2JuVjdHRFQvdndH?=
 =?utf-8?B?d0svUWFkWW5TVDcrSnNBaTFpS2prYWxxamhPWEtxMk9RWFJXRkFybGVrUi9l?=
 =?utf-8?B?V0lMSzRycDFRN2YwNVA0YVRUdFpBZjAxUXFvTzF0YllDNUZWSFdDUHljNjJY?=
 =?utf-8?B?U2Q3WFNRdHljMGduRENJd0RYOWZ0VUpKRUwxU0xWckZGOFZmbEpPRy9HN05X?=
 =?utf-8?B?Z1dZL0tMVTgxL1IvSStnUE1DdFZNUitUbFEybStSbjRiQ2RQQlhnNTBJRHh0?=
 =?utf-8?B?YngwNVN6VEJxWWNzQncrd1F6cjFSZGtRU0NlRkJCUHN6MlRBbUVoNUJybEVU?=
 =?utf-8?B?dktIVCtFaThRVm50NlAwMXFhVk1JeWRuaXhlc2RKWW9UWDE5QnJXK3RhWmFa?=
 =?utf-8?B?K1o3aDV1U2xFNTJFSXhRZzlRcUlFU01VbnV5TDV2OWx0MS9mYVg4M2t4c0Vh?=
 =?utf-8?B?Ti9KZ2NBU2lHMXBsaGxpaVhKMWdIQUxKQlYvZ01OdGY1bFRuRXI5Y2U4VGJN?=
 =?utf-8?B?d3VVbGk5QWhGQ0FoQmFKZklGUE5pN3VnWTllY0pnUW1VV0N6YzhpdXlIMU1l?=
 =?utf-8?B?OFhhWVhvdC80RXRWQW95OVZPQUFCcEF3RGQ0ejloY2tWTzdpQW91LzRGdEFJ?=
 =?utf-8?B?MnJUYktEbGVRR3dBQ09qVDFCZ3ROeU9tbUF3RE1IcWIrZkRUZG81RnFSK3dx?=
 =?utf-8?B?R0d3b1hBZXFRWjJyK1RNMGF6bW5kWGFnSXBCcCs1WjBaMXhPMTZTQ0VxalFD?=
 =?utf-8?B?MllJYXBNSEdocWU4WmlKSWMyN2VaSFNYRkpXQ3ZDSVJVSkRhZ2lLSmR1NzFx?=
 =?utf-8?B?dXVmdkhFRXJmYTNETjU3S1pyRERtMU16aThnbldJTzluMGRLMGc2ZDBqeDQz?=
 =?utf-8?B?STBTZzQxcHFNYlQwRU5KQWdlSU8rVGVRRVNXT3ROdGNGbjUyYUVBNHZhOCs2?=
 =?utf-8?B?VFlManQva2xlYVJ1MU1WSjBLeGRXYlUyaWtlOFNMZmYvT20vTnMvQXJySTF4?=
 =?utf-8?B?MWhOSmhwRmNQcytpdnRNeDRjcTE5U1g3Zng5MTJEWlh6VlpXd0V5QkwxeGEr?=
 =?utf-8?B?b2pML3lBbjUvbUNtcEl1WDV6Q3ZLOFpDQ1FiR1NnbXE3d2I3OU1jL2xnZjRV?=
 =?utf-8?B?OTZPVVZmeFpYRjd2WC90bnBsSjUwVGV2YzJma1JSQ1BuKzFDdThXNm1EM09p?=
 =?utf-8?B?TlBPZmx4OTBlM1R4UnJVV0RFZ0JUVnl5dTdMUHlkWG9mKzgzR29LZkVzTGxC?=
 =?utf-8?B?U1RJZXRYSm4vQUNkTDVLaTVLaGs0N2M1ZHV3N0owODI2VnB5UlBSV1hJSzdH?=
 =?utf-8?B?cGpUQjBTa2ZuczBVUDh4eHlDTDZ4UStac2NUVW9ZSWlRdzBVM3RYbUZieTNj?=
 =?utf-8?B?V0lVQjJpTjZXWElRbStIMnllVmFJeXh4R1pGUmVuOFRlRlBUeEZFUkMwWFFi?=
 =?utf-8?B?SllRNHJEWGZIMGxuTms3STBKK2dmVkZNeklDaFVacktoanBCdXFNSTBYOG1H?=
 =?utf-8?B?SFplSmlPVTMvTWVYbGEvVGNSWms1UTJLdS9mK0MrSFJLL3hFdndvcTEvdGxR?=
 =?utf-8?B?QlFDcDM1ZmszTmVZL29LWkpQYWZzb0lCakhyZzZhSGJxY3YxcUVCbTUyV0oy?=
 =?utf-8?B?SExGa2JIRHVDTllUY1krK3A0MUZRPT0=?=
Content-ID: <838F2DB35274584BAB665A6B08B7BB97@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 462abd4f-e3ab-4f97-47ba-08d9fa93f727
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 08:26:06.2694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W6ygVJwFt5zBcJeof/RxrvmA3FVssfOhaifv8RNgJ0RrQmKHJ/dAlqMpSWQo8mCZVxw8RWC2GjzcCrzXy3ANrCd889kQK9Sd4otIin0lkhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_002613_627151_671E5AE1 
X-CRM114-Status: GOOD (  17.70  )
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

On 1/20/22 18:14, Tudor Ambarus wrote:
> On 1/20/22 4:57 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> We don't include the package encoding in the name. Thus, just use
> 
> s/package encoding/ temp

>> w25q15jvm as the name for this flash.

If I remember correctly I think that we agreed on u-boot ml that we should rename
all -jvm flashes to -dtr. Let me know if you want to reiterate this or not, I
can add it to a todo list if you don't feel like doing it right now.

Cheers,
ta

>>
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/winbond.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
>> index 93b537f4f0cb..3d91888882e4 100644
>> --- a/drivers/mtd/spi-nor/winbond.c
>> +++ b/drivers/mtd/spi-nor/winbond.c
>> @@ -52,7 +52,7 @@ static const struct flash_info winbond_parts[] = {
>>                               SPI_NOR_QUAD_READ) },
>>         { "w25x32", INFO(0xef3016, 0, 64 * 1024,  64)
>>                 NO_SFDP_FLAGS(SECT_4K) },
>> -       { "w25q16jv-im/jm", INFO(0xef7015, 0, 64 * 1024,  32)
>> +       { "w25q16jvm", INFO(0xef7015, 0, 64 * 1024,  32)
>>                 FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>>                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>>                               SPI_NOR_QUAD_READ) },
>> --
>> 2.30.2
>>
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
