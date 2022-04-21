Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87C6C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=33hf1VOZbaud12BPfJw2FxY0ETNQX4jUNFACbdoo/Dg=; b=sev0DbGQXZKwNn
	Bhjr+JcLZI4a1MF2nrcCqMy6A1w5mSwhI1DsOgORjhj9CkN2F5LIu7lmVfY26br86M3RV6T/4+tmN
	J9rfyMIfJhMefTz+nhM01s0CvIgmicgNye6DBXplyajObJo8ZsSNo6s7qDfz7s8iQfjbWDOuYW2v5
	E8jeNEtDZRlmikSu6+lqkZbLJO4SzVM91kLf49Ort8Q4aHbUDc7Rg5UqumC2K7qScck1tQcYNMicA
	PXTujOQZK1twnFb9TNQVX61W4yTH+gAHQrm7LoVjt3eugblgKB5hHng063q/MCy35AFsujITDd5cP
	iq4MRDl641xibwOvd1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhVaX-00DKb9-D5; Thu, 21 Apr 2022 12:07:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhVaT-00DKZO-Sg
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 12:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650542826; x=1682078826;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6jInl3gmOF4CKxWmN/PwDoAHFaX0yRkwPlJR8r3AlKA=;
 b=ZjH5mbLYbjMZ4vC7oAmYqs63Dinur2o1y2mfkdpHbCDIfMGdyqele4R6
 f6BLfAex//gw5/hlW5cOxznxd23RHy1FVv0fjoS5XQ7kqTSswhByUUdw9
 vexuNvrjx18OkemY1WBh9u5w+i2mzpQaxHkjFuHWhNEdOAwCG0/6hnPvS
 sYTvlGnVP9sObS4C30rYXFPnyV+GiH/aOlp77KMBLsMue1Eh4ql3wDRnd
 3FcILKqmzbDZLv5v9kkcDk9OG7FvTg2Zoy3jQwxTlgAix03HW8mZXPceb
 TWtYUVbpMfdZadja4g9PlQK9l2/crzuBLVYewMQ4nTWYbjEEq9XqGLDJ4 w==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="160836592"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 05:06:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 05:06:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 05:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQJYD1PT0TIc8eRFc+m2M67wfFWVK+bJcwWW5/tNX96L91aziFcoSjqBq4KievZI2q6cePJwiSNyiKTKzZY3BkJUdaT3D1jKIg4YUaTc5i+igldk6sFFrVgUfPANzg4yG61bGXV6ZqGmrtgAYKwvh8WVTylys5N3yNKonkHOshmqO8AyN1RqHuDXz85qTGlkFDZE+ZXsUYaL4hBaiQwAZtahHW9do6aqBlleFDubec/etghh8KgiIZnpKqFW80JLxDHWLlGno0QwKFVBo2hLIywEIRLEvHePluxesna5uNJkkZvd9q9sVEBvzqhAp/XMf9MbDC9zEMf+Ato/fohE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jInl3gmOF4CKxWmN/PwDoAHFaX0yRkwPlJR8r3AlKA=;
 b=ZScNV8NkcgnkGnZeOM3WbPmejb2GstrhwApIv482/sLgNWFHr013bsVFgPTXKypxYpy7rScAgb7TvFUtT6hZ4pRUNc092EExb/TgWFlHpjxd05H0rD9zscH+aWqy/zJWPsHlVpKZNJLlKQLL/5O3vUyF+5L1ikorQKykLSS67LsBuZ7pVI2tJTLnFZL5axKfY3KJrJ1/K0O/a/ExZugun5CdzMmU930SN89whbx9kUc5rV1on1zvWaYywHKqyE17my8532QNjrWEaggvKtoifb3urlWzHN2hYURlpYFceZQiM0nfitROqgYkGmR6Q38425MBAe4ywLUwR99Hwr/d1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jInl3gmOF4CKxWmN/PwDoAHFaX0yRkwPlJR8r3AlKA=;
 b=kYAdUOFOqKup7sZNvUxwBMCyjEea8AyrgVWA5bg2AfMjaoh1qSo3Gfs/zdgPZSikM2PP2LYWXJ5X04WaGNeXUADSfw5SFmm88vy/JqBZtPuTViV35FyvGoQ2oErKv/+8wXaTKKfQFq+1lEA6Io/hYYO5+kSdLv9+PtpO0juO88E=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB3519.namprd11.prod.outlook.com (2603:10b6:805:d0::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 12:06:29 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 12:06:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
CC: <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <p.yadav@ti.com>, <richard@nod.at>, <tkuw584924@gmail.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYVWvv68wo3t3IT0asmq5tmkva9A==
Date: Thu, 21 Apr 2022 12:06:10 +0000
Message-ID: <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
 <20220421112956.292089-1-michael@walle.cc>
In-Reply-To: <20220421112956.292089-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15ae2141-645d-4ea7-cc2d-08da238f54aa
x-ms-traffictypediagnostic: SN6PR11MB3519:EE_
x-microsoft-antispam-prvs: <SN6PR11MB351981C695DF564EE30F84B5F0F49@SN6PR11MB3519.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ghQaloZzagZE8JLoIsLtfIplqHLPwyyOOuhm3TOmUk2PX7/tvE6msNSolXHUos+yF9b3jNwzfi9fPA4jYhSuNWl7ylVN0kxavHt2eeIUqES7MqDFUBa1aJpeaFjxAdrEno3IDndM/9IzqmpnukuNnFIvzzKnUkHygM/Bgp/UBeXwa6+edchs8cms0Mgdaf3VvR/D20nCRmsSBmIxnoimB90UODIxk5CafCWe/hni0LbWNoYRg6M3AXSqz503HM0V25GqZHKBKGA8Y1MbmTy5N2pdLE9XblG/4+yRnJ3V0i6UL+3YFUyM6NORz4ZTsMpTIWYhFKZDVYUZdbYCsxU0cgZytCcbY+tPtGooQPAfWfVIh7aYSEAkhLUxPrjMOjelVIKT0LMtBUUaQAn+8aKyFGvy7afPpTkMk7iozp+h5YzEQknxl5H9bYsGaXORccChfYAjDeYy521D8UYeHqsyDEOz+Tzo+rxqf3j8VPYUCsaVt57ObiI2w8EZLX+qccwAFvY9Gow96M34L6lEFij6NY2/5r86nII0kioMJZhIwbPjS/T4BwXZIa+CoS+FBx6qrYD6jfyPV/n7ytj9/ApLWvrwNWhjQgrfqL8EXNmBZAeGpQTiJnjO2/Yb0Vx1Q0/dkOC+b/IFNh25xFeBmPYhVu48SR+4EvBe3NuH+YNaw4g6EcAnc1B9CtVg0fHZZrgOZzex6wk8cpslgPSngWJAYKIfNETundtSI1aHyrEvoMfwcGje9cc5SywEXi9uZxt/o6eGu9HTY3eZuJ6zA2zQzA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(54906003)(6916009)(31686004)(36756003)(8936002)(66946007)(66556008)(66476007)(66446008)(64756008)(83380400001)(76116006)(8676002)(4326008)(91956017)(316002)(31696002)(86362001)(71200400001)(2906002)(122000001)(186003)(2616005)(6506007)(53546011)(6486002)(38070700005)(38100700002)(508600001)(26005)(5660300002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3lPWVAweHAzRUpkVjJvT1hHY2dJNVJlR3dUaW91NDA2eGk1cldLQXJVVEJo?=
 =?utf-8?B?MlFQUjBqOXFZM3VLL2F0Y3ZsR0Z5UHZDU21qMkJoUTdra1ZNMUF5a3NKY24v?=
 =?utf-8?B?bzZKWlJiZkNSR2JYblpZS1RGSmNLVXlWUnQ1YTBsZVpSdWhUOFFiS3E4UlBW?=
 =?utf-8?B?ZjZXcElWcXZrck8vNTVRTFptaEdRQXEzbjRwTXluTWNydFRjeEgxUld2UUFG?=
 =?utf-8?B?ZENQYzRVQ1MycDVGcUVaM0dQcFBDM3JMZFR4SS9XWFkyUnZzTlVWeTM1bXFy?=
 =?utf-8?B?UUU2VXFGVi8yT3p0U1Y3Nll0elFmbHRLMFpTaUF1cVdJcjlTc25uKzFyTW1n?=
 =?utf-8?B?anRxKzhGbWlOOUJ5blAyTUp1QndkMGVXaEo0U1NtaUxSaEsybEorK1NtaFRD?=
 =?utf-8?B?OGFVc0J1dlNLRW1WaUVWdE9EVTk2L2pidHRWWFRyVlVQVHNkRyswMWFRWVBV?=
 =?utf-8?B?NkdQYXJ1Y3owa2xDbHRJaFJPdktVakZIbkc0QXhPbmNMbVMyeUN0L2pDMzhv?=
 =?utf-8?B?YlE0SGZIeHVVY3diVVIySzV0a1d6aW4wVVVOSFJQSzcxaDZBekxsbGU3a291?=
 =?utf-8?B?YXduOW1LVjV5TVliVnoyZnAyajdqVDF5Znd1UHcwTnh5Zm9JZnZDZGRoSHB6?=
 =?utf-8?B?ZnpaNEQxTC9TaklaWmVZazEzcUJHRkhkNjFFNHd3VUNXenV0NGpyTDF2TWNx?=
 =?utf-8?B?Vmg1Y0RKSk5ab0dack5tQXhkT0VBbWI5WFJZVW1Kc0haeU1VcXhOWnAzVGZz?=
 =?utf-8?B?RS8yd2lDRm1WQkVHWVEvaFJwUW02bXJMY0NOY1I4S3dKRjIwRjhodWJZTUpt?=
 =?utf-8?B?Y2RnNlFjNWpVVkIxUHRmS1krY2o2UFBqSWZ1R2VOZkVES2pHZDVHaXhaV2wz?=
 =?utf-8?B?UEJBU0tlTWpDeDUzeGFvTTc1eS9ONGkveStDODNqc2NnNnFxZHUzWGJicVBm?=
 =?utf-8?B?SE9CclFWZXY1bDJ1V3B1UFZxSWNRWTNobnNDMW4rSXFRazV0ZTk3dk1yb1Nj?=
 =?utf-8?B?aEEycktoTUF5L1pqeXh4M3lMUzZNdEpmNmVxUVNsdWhWaXdFWkRYM3Ryc3Ru?=
 =?utf-8?B?V21jd1pZN0ZHN0xVZjVmV25YOXVWNXJiSzJDYVQ4SWxjZWplbUMzVU5FZjY2?=
 =?utf-8?B?aUU5anBEVDdpV01VMkJnRHlaY2hVbngxQUxrMXB0Wjc5Q0ZvbFppbHFseE1W?=
 =?utf-8?B?UE1ZbXg5eTlNKzlYY01RTVJ0T1pibUtvWmlHQVgrVEpYcjN1a3pQNDdxeFo4?=
 =?utf-8?B?cEZJRW90TmZkNXF2T25JbWlWNXBRQWRiYXB5Nk9NNjEvYWQ0MFJJSTJ3V1cr?=
 =?utf-8?B?TnBYcGlNUFhUNkZBZzI1S3EzaDRpUmlWd0crV0VHbEZ5cWZQZGZwTm8vMEw4?=
 =?utf-8?B?VnJPelpnaGRiZEtMNHFMeU8rODI5eWNNUFkxdS9PbDdyUlRKbTI3VFBrZWhy?=
 =?utf-8?B?MFdCVHVqb0FkVVRGbE43QkZacngwR21wMWVjNUl1RUNhTDhESEdBTmJKQURi?=
 =?utf-8?B?U1VKZkE4SmdISGV6NTJ5cnd3OHJkWjAvcll6S3FoRVFEN2d0alozQjVUaXhv?=
 =?utf-8?B?em5nNmtkWGM2TElvR3p5ekEyZ3pYTDRrcmVmVFkwN24yb3VVV3Rlb3NQcjFx?=
 =?utf-8?B?dTVlMmk1OVVJSlEyaXBWYUpndGJoMmdNekEvSkhQQ280YmIzUy94UFlUYkM2?=
 =?utf-8?B?QkUwR1U2ZVFuZnRWRkRJK0VEMWdhZHFlWStLdWFFbEZtMlU5ZnF2TEpNT01T?=
 =?utf-8?B?blFnWE9HVmRDMWZsZmhEd2dUSkhOdC9QN0tmVHNoamZiNTNPeWwzby9nSEho?=
 =?utf-8?B?MDB4N2MrWkUyVGdnSVVuY3ZiNzBpejJyS0ZqS2xYWk1tRGRWRSthZmdGUEVr?=
 =?utf-8?B?L0RwTUhhcUU0ZFFBQ0pwY0g3WTg5Rlp1MDZsMlkvSGNFMko4NTFXcjJtMG50?=
 =?utf-8?B?M3d4S3RJM1VQWTNMYlQxcDAwN0pTWTZkamdZNXEzRXdTV1JIQlBzVmFJanNo?=
 =?utf-8?B?U1FyY2V3eG9EVm93dmtVWS9QRjZMRDNuZndXOW5KVm9FelRkVUVuSHNOL2dM?=
 =?utf-8?B?VkpDblNWTi9jbVVoemN6ZEZZSFRyU0xQemswTUJLaE9nOHQrbWVNSFhoUGN6?=
 =?utf-8?B?Y00yM0N2YkRyR3NKRzZLYmFodkp3N2wrQks2NXA4d2hXMVhPN1Zhb2M4QkQ3?=
 =?utf-8?B?RXRKTnFOM0lNWFJoc0ZhVHhLb1laTm5wU0c0aE9Zclp5TGJoRVdCLzMzSmZG?=
 =?utf-8?B?QkU0WTl1WDFkb0JaOThNb1ZFZ2Y1Z3ZxWHQ1emIzM01lR3NsNkxYWVlVeHM3?=
 =?utf-8?B?U01FRXI3aW5QUDh6dzVxQm82Z2FwaDgyVDNLNEY2ZmdidlIyVVBsbmF0Zlp4?=
 =?utf-8?Q?lO3/cMTvO9bQ9YWM=3D?=
Content-ID: <F543B8DA57A6CE48B57D5A26973EEFFC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ae2141-645d-4ea7-cc2d-08da238f54aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 12:06:10.8406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWvpT8id29SbPP2wb7XmY0wjYLXFZjyhI88bj8UviTL0mrmyklH5KX95XvYVne44/gx89HGjqVG3Kd0NQRWsXJgSQqw6g9OIFbIhfLgM07s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_050705_998729_B9424980 
X-CRM114-Status: GOOD (  22.63  )
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

On 4/21/22 14:29, Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
>> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>>
>>> In 4BAIT parse, keep nor->addr_width because it may be used as
>>> current address mode in SMPT parse later on.
>>>
>>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>> ---
>>>  drivers/mtd/spi-nor/core.c | 7 ++++++-
>>>  drivers/mtd/spi-nor/sfdp.c | 1 -
>>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>>> index 40ba45328975..87603a99938f 100644
>>> --- a/drivers/mtd/spi-nor/core.c
>>> +++ b/drivers/mtd/spi-nor/core.c
>>> @@ -2210,7 +2210,12 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>>  static int spi_nor_set_addr_width(struct spi_nor *nor)
>>>  {
>>>         if (nor->addr_width) {
>>> -               /* already configured from SFDP */
>>> +               /*
>>> +                * Already configured from SFDP. Use an address width of 4 in
>>> +                * case the device has 4byte opcodes.
>>> +                */
>>> +               if (nor->addr_width == 3 && nor->flags & SNOR_F_HAS_4BAIT)
>>> +                       nor->addr_width = 4;
>>>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
>>
>> Can we have this instead?
>>
>> commit 61d73dea7e63db4c7a3ffaa7f2b5068fb71c2d8b
>> Author: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> Date:   Thu Apr 21 18:40:21 2022 +0900
>>
>>     mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
>>
>>     In 4BAIT parse, keep nor->addr_width because it may be used as
>>     current address mode in SMPT parse later on.
> 
> Mh, I don't know it that is any better, there are places where
> addr_width is set in parse_bfpt. Why can't we fix the real problem

which I find it correct. The only thing that worth attention is at
BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, which we're already taken care of. We
don't change the addr mode at parse time and use SNOR_F_HAS_4BAIT to change
the number of bytes in the aforementioned case. You may check the other patch
that I've submitted as a reply to this patch set, it should show the bigger
picture.


> here and collect any changes made by the SFDP parsing (and possible
> fixups) and apply them at a common place?
> 
> -michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
