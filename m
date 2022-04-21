Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F2BC433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S85YbPQ6K3YCnNDdyrWVnNoKQITQIKBQdPVouQkRTIA=; b=QlYdV09ST9b9Hf
	xDttsUT5piC8ak76R6x/TwJMNNq96bf6Qv7GVX61aKSxhXs01C2o4sNH9bWzVQOcrzgASFZ/5Gxge
	Qybg9tYoApFKQwV1nGcHZVfKZd4k+LawO1RMI+QR5EF89rSbMw6Ge/74kIx9SW26bRFSOw/UFWxhf
	40yzEda+AzzOlW2UlE5Zhpix8VAPar+/lQtxgUC4D8DVuQPOK3YFw/SHGoGwGM30fZy4AtFEFhcWX
	1pBzR6yXd1ZlVAfx2G7CSE28TOsm/a1ZqzuKCcMRsgntdJCnflsr9YKDI9n42GFJNTVXDLs85gsSo
	ssa9RQpHffJhPMSrCdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhXIZ-00DdrT-NT; Thu, 21 Apr 2022 13:56:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhXIV-00DdnX-Db
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 13:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650549399; x=1682085399;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=7cnYAz/Zvi3PvRvYIiXV8uD9C5wlhlioYWODRTOtBr0=;
 b=kw3/dQMezzt5Tqxh5VaN+MJhuJsDOu+BD0RDOfrONKWfHSMLCDR5tXds
 9tbIMPb2D31oOfL5xG8yZ2j7SZ12gS/nMXEiCERDXN5KcSEYPK6nWT5Wy
 aptwYCFgGdCcQlXV9s8EKtS4yjhRvP/+p5H89d/us4cKS5aDnhJH5ZJNn
 BBXKkcJ2jem314AbxHnRMXaeQFQdnO1Cox4p6sZzOcrsYCHrix1EbR1y+
 Qk8aWbOie5+EEV+hu3zdKWmYb+URju8hsM+SJobLykPniMK9GaLcd0PDR
 FpxGAgtwSdGNlovYpwsSK3s2Tyg+10Jte4uKHdRv7JZm6Q8yiS6wCdAZM g==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="153369675"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 06:56:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 06:56:34 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Thu, 21 Apr 2022 06:56:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7gFyRUUtZ9h0LCiyAiM5Uf2f+8D/8fn/djS7+eDfq5KGschKqD/+idyR4DLRVDXGkrnUVKgPRhTWet5sAdveMBWGIdwmXdYMmqlG4oVKhS3Lt8uKlnaW3l3wFio4odk3jmjTU5KpjSfkaVEqEk6SRHZP9DzwKtHZwbQmIH0cwtuHv+GL1o4Dh4t+afR7LfZTMWhX3satWYKqhROdBqqLPbXRiEo6oIOytvQMxRL1HdLqNtTJIaSd1F5T4cDErSyIchcKrUQbJXDNbJmtQHXFltC0e2+hasQ8onWGopKbTabuiPizfZuIoNipg8p+B1gFbggND1q090SdldURHQPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cnYAz/Zvi3PvRvYIiXV8uD9C5wlhlioYWODRTOtBr0=;
 b=kbwRD/ueGVazlluyWwu6sisjhP9QNZHmi904k1APbY9ltQemyfl7R5e9PgXyCw+zK1Uoz73/TnoESSKmO2dvfx3U03Xwu45+zovEeVvHOvffGsbDGjrijuzgQWez1Z3t7johBKmApJWfU0WkpF/5+9POU5lNI6Isvtr0j+L7bpWfdnA/ZfGCN5GhBE1pKTV2K3Vtqw8suHNk3qckdcSJekq/4TpVSi0QvEAOaRdibLpL41URwHWppO/RDzGdUnhz7Pj403Z2NkYaRvVvOEP64+RX3E1LzA5JPLLwarL8Jvo5utWzSNEmQgG/+3uKHSw183BesTonI9OeGVyronGbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cnYAz/Zvi3PvRvYIiXV8uD9C5wlhlioYWODRTOtBr0=;
 b=M2Pv6Bg2ooQAQSC1c7mMOMKvXaw0MDlHYsDk8mdKPcHFm1AGwz3CtoRzJy3aHsaAKhGufOEcwPVCQWEjZ0uXXoFqSOTNyod/+trE0YZ+S2D6dIKPNHp99+EFpAhZd/KHP82m0pYqh87K2/M2faXqJuDzkUIfvCw11kFQCDg+lrs=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by IA1PR11MB6076.namprd11.prod.outlook.com (2603:10b6:208:3d4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 13:56:30 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::3414:43b2:d8a:bc00%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:56:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <Takahiro.Kuwano@infineon.com>
CC: <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, <miquel.raynal@bootlin.com>,
 <p.yadav@ti.com>, <richard@nod.at>, <tkuw584924@gmail.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Topic: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Thread-Index: AQHYVWvv68wo3t3IT0asmq5tmkva9A==
Date: Thu, 21 Apr 2022 13:56:30 +0000
Message-ID: <1ffd057e-c66a-7704-4434-1584bf9be701@microchip.com>
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
 <20220421112956.292089-1-michael@walle.cc>
 <6f72bda7-4447-7f8c-eaa5-fa2c21c7bfe1@microchip.com>
 <9495fb0f56e187ade9b428fd69d84aec@walle.cc>
 <af0fd418-7097-c2d4-dbbf-8cde0c62f765@microchip.com>
 <5a7ba92487dcb1f776b76dcf069fbdf5@walle.cc>
In-Reply-To: <5a7ba92487dcb1f776b76dcf069fbdf5@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffa74c9f-c59b-41c2-97fd-08da239ebccb
x-ms-traffictypediagnostic: IA1PR11MB6076:EE_
x-microsoft-antispam-prvs: <IA1PR11MB607698D5077F80C0D9EABBB2F0F49@IA1PR11MB6076.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SWCzIs33YkVNpuaNV/SdVvfc5J0c9Y5BsbRdS1QuV7BFSZbuVcBEn+QmbxUXNRZ7ODz86oE+6w2o3aE7P/NFm5SnYSFEtRxforE8wrpMyd78bQn3LWIpcQZURBUGVU1ge4KAa0sS9m4AeBO0PdHEO/flp1fAacFP8tdh9T9vkClMosD8aNzukn59eXC2pRq29G+OXAL8V4BgBqiSY8JjAv5tObUhFeckwQ39e1dOKQeXvm97JpHn6fsukoiBY4GCge3/p4JJL/YzKUwNm/2gvGOj39UrdnIni04POYRYuyzshlnZuG6RrecjRcfslZoe/fnuuoHHV2IYBJdB0e1L6UrqLix6hdx0UOStqFhe+X70xXGnPKz5ELXwJiInfZbD8coFPLXFqJcZREa+orLR71KHXAgZjBAyEQW2NUdcUMyECknKQe2qafKJs5W3jEbnH0YGWymdVsEFBVS0x32ahGXOc6HTvVj166YjArIrs2x1xBw1Ey3TsS8v0mUPQ8p6h/eaYFN2vJeaDHjbeYY8Z4WwGrR+eGgH0Eg/pho0EAgBTWSvl6dx8ap58NqhjPYLVQgAtHQuaavtvnaqA4BkP4kRIhoICMhfmJIUaCBwiVSavQxkyjkCcyMmUFBO6S5M1I3poGeeZ70eQ82nghZLcoYJKNkQusF3ZI9ugmWle+JsGTIVd93HFpshOMT2JeBcxly78IG+GYqSIaWJbNah4M0w8hpw+bg4XWF6XCSQg9vusBYowT/sfpwRmWrC3jsqV2Pu75RMTOzwUFMvRtETMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(5660300002)(8936002)(2906002)(91956017)(110136005)(316002)(6486002)(508600001)(31686004)(86362001)(71200400001)(2616005)(186003)(6506007)(6512007)(53546011)(26005)(122000001)(54906003)(36756003)(31696002)(83380400001)(38070700005)(38100700002)(8676002)(66946007)(4326008)(76116006)(66476007)(66556008)(66446008)(64756008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnlsYnVQOFA5RjVxdmV1cUY0TzBTZkNJZVdxYzAxVjVjQnBQdENSSlNHVm12?=
 =?utf-8?B?TU1CT2xjMzZJTDgwOXBoMG4vLzNRSDlTU1U1OXZQR0xBL3ZtSkRDV3ZyUk5H?=
 =?utf-8?B?dW5ZQnRLZ3dlSjVXWEVXc2tEeHZSdTM1ZWZFYkZwL0xCeGtsa1FqM3IvL2Nq?=
 =?utf-8?B?S3RHaWRXQWtrZ3VKdzByc2c4OENQUzZVeFNybjlMV2ZQS09BbWE2RkxUUVhQ?=
 =?utf-8?B?UkMwTGlTNEJMRFFUWUVOUlRYTExjcWpqeWM0dkxGcEZ6eWk1MDNkTGY5amFu?=
 =?utf-8?B?T2hQOE1RdUw0azVwOGRHZG5PMHZiMmRXdGVMOTRyVktab0FRUjJMR3MyMmdE?=
 =?utf-8?B?SjVSenhGWGZGOGpUSExyeWtsdW4rNURkRFpKMjYwYXhSTWp3UVZ0cnNGREw0?=
 =?utf-8?B?WUZzOFJEeTVXMS9zZzRkNUZEUjh5VElyOWlnU2ZxNFlpcHBvL1dwS3FJN2pB?=
 =?utf-8?B?eDZTMVVNSmNHY1VseVYvMjlBODZmTEEzUm1UQTJoSGx5ZFdTaG96L0U5d2No?=
 =?utf-8?B?NmxQeUd3bFoxMmZyemJvUzBaMFR0OUJmZC9EbUlVUmJZOUVHYnFSWXV3NGVp?=
 =?utf-8?B?eFF2OXIxb2ltallEUklTcm9lRjZnMmZkdzQ3Z0piU3QzVUY1MEJSRldHbkJw?=
 =?utf-8?B?djl3ZU9DVjVMVk1Ra2xndUpVN3oxbHp0M2R3bC85VE9hVVFmM1ZzWlhtMVNk?=
 =?utf-8?B?MGlMUGJSamRlbzR1alhBVmJGaHhEbVNWNEFKbHJsRmdncWQ0S2tEeFFQMWlF?=
 =?utf-8?B?b1JwUHlhZU96NDRZSk92dTUyVElkd0JBYnJsWUNwVkNjSHkwaUxHNGhScExm?=
 =?utf-8?B?ajNuVHVnQU4zUEdhekdWUEl2RGE4SHN3TThzalpPTm5uVVdGZTNVaTR6ZWx3?=
 =?utf-8?B?M2s5T3dLYVNWVHZxOVQ2K2g5amlETXdSK2pPTEtHZEJEMlpTWHhJZ0pjZk03?=
 =?utf-8?B?b1dzVllrVmhWeWhlSkhzaktsaFdBQXFkR1Rtb3JMemM4Y0lXUGdKVy93Y1Vw?=
 =?utf-8?B?WFNZMnZPYWxneFQrT1p2bFFLTlBBeW14SnRIQ0RUV0pqREIwWkIwSjZjaVpM?=
 =?utf-8?B?SloxbmNFVUFvU2hFeXhYSzNqcUM1TW1YTHpEUnRBWXpJOG4yUkw3dEV4RGlu?=
 =?utf-8?B?L2ZzOXFlL1ordGl3VEN4WER0cVdHOVQyTm9iUGpyMlIzL3JxN0pyTFRIc3VM?=
 =?utf-8?B?RTlENjZseEJoR0szd2hhdUlWN2pVTEFTZXByWTJGZEgxR3UwZlZ2NzQ3akVO?=
 =?utf-8?B?WGR3VGFsWlNGVVY0Qm52U2pia3FzOUxjUHNFOGNlbTZnVXFmSHVva1h3QjAy?=
 =?utf-8?B?QWNUMXQzdmhkQ2FsVUdGQ25Ydit5dEJHamMrdVExT1VPeDlDZE5abWFYNkhY?=
 =?utf-8?B?cGlCWCtoL1dtcGVFMHloNlh3dnVjR2FvQjkwZ3JobHdFRzlMSXVIbHdYTzlo?=
 =?utf-8?B?ZEd0c1VrSzM3V3NMbkRNcnJmTnM5YS9OSDhva1ppeFJMeUFKZzRxbHIwTExx?=
 =?utf-8?B?V0dzYWluWGZBK0V4NVE4cUt5aVpmSGFFdEZZcnlLcnFWOENNRVpTenlMR00x?=
 =?utf-8?B?bDl3eTUxVlZwQUw5OWhvVHdXbXNBSmEzb0QrS3pwVnBWYWtnRmxraTRvRks2?=
 =?utf-8?B?Smtrc1ExZ0ZGQjYwM0F2VWlqOVRCMlhUS1JhT3FvbWhtZ3B6RjFSQUxvNXRH?=
 =?utf-8?B?T2NUeTBBYW1UUENIaVhBUWZVNjdjWW01ejdrZE5EbDJ5akxzcUp2R1BZWFJR?=
 =?utf-8?B?aFovbFVQS1hVOFd5eEJlekhtOVFTWVk0YVNCTnM2U3N4ZEFqQzZvUGJkTHpH?=
 =?utf-8?B?dW9PMHZTejBaMTErK1hBYW5OZmRiTXpxZkxiOTZQcm4vK0pJRzA2NHJTUVNl?=
 =?utf-8?B?UlY3aUsrNStQNHFJY1QxMVg5amVoOHlkNDVBb0cybVFrUnB6VVZLbURpS2xz?=
 =?utf-8?B?YkdxSitSMWlkVTJ1S0lHK2l5bWJVZ1JqZGJZWHhwZGNCaTlpSVBROUpUOUNx?=
 =?utf-8?B?bmhwcy8zejBCckF1bmljUG1UeDNUUVpudXhseDYzMGVTSEYvT0QzUkZVU05o?=
 =?utf-8?B?amM2TmhYVnFla0Q5djJQd0ttQnZ2NDZCMmFpK1p5aXZobGN0YisyT005bkxK?=
 =?utf-8?B?SkxuNzVieHQ3TG1pN0ZvTHhFbm1DdFlXVVEvaS9KMTJvNkE1YTA3Ni9lYkhE?=
 =?utf-8?B?T1FSMTE3QVZVdFNHYkREaFQwdUQ5cG5USFBWLzRQUG5URzk5aWV6MlVVZlpS?=
 =?utf-8?B?RnNCaXF5NVFTdm5yeDd6clh0aE1OTTVtNnNHMmMzeExRZjluc29nUVc3ZUQ5?=
 =?utf-8?B?YS9PNW1EeFFJeUhwR2Z0UldkN0U4SW5zMUo3a1lVNFBINHk5aEpKNnQ4Qjg1?=
 =?utf-8?Q?Mzeo1h6q1rCKsH4I=3D?=
Content-ID: <6EBD3F6FECADA74AB4E7033110CDFDD5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffa74c9f-c59b-41c2-97fd-08da239ebccb
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 13:56:30.4985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhGBeMGi5E8h425JjeKfOUzGg/lnDlsY5x6vFjnbmV5WV9LHICRwCZ7XENRIbsAcjpZNq34rtJsWzn0So6wLfKVYKJH1QBscKsOIqzaQD5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_065639_582236_A39253F4 
X-CRM114-Status: GOOD (  30.16  )
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

T24gNC8yMS8yMiAxNjo0MiwgTWljaGFlbCBXYWxsZSB3cm90ZToNCj4gRVhURVJOQUwgRU1BSUw6
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBBbSAyMDIyLTA0LTIxIDE1OjEzLCBzY2hyaWViIFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbToNCj4gDQo+Pj4gSWYgdGhlIHBhcnNpbmcgd291bGRu
J3QgY2hhbmdlIGFueSBydW50aW1lIHBhcmFtZXRlcnMgd2Ugd291bGRuJ3QNCj4+PiBoYXZlIHRo
aXMgcHJvYmxlbSBhdCBhbGwuIG5vPw0KPj4NCj4+IEl0IGRvZXNuJ3QgY2hhbmdlLCBfYnV0XyBp
dCBzZXRzIHRoZSBjb3JyZWN0IG51bWJlciBvZiBhZGRyZXNzIG5ieXRlcy4NCj4gDQo+IEl0IGNo
YW5nZXMgbm9yLT5hZGRyX3dpZHRoIHdoaWNoIG1pZ2h0IGJlIHVzZWQgZm9yIGFsbCBjb21tYW5k
cw0KDQpubywgaXQgX3NldHNfIHRoZSBub3ItPmFkZHJfd2lkdGguIG5vci0+YWRkcl93aWR0aCBp
cyBpbml0aWFsaXplZCBvbmx5DQppbiBCRlBULCB3aGVyZSBCRlBUIGlzIHByZXNlbnQuIE5vIGNo
YW5nZSBkb25lLg0KDQo+IGV4Y2VwdCB0aGUgcmVhZF9zZmRwX2RhdGEoKS4gSXQgY2hhbmdlcyBp
dCBiZWZvcmUgd2UgYXJlIGVudGVyaW5nDQo+IHRoZSA0IGJ5dGUgbW9kZS4gQWxzbyBwYXJzZV9z
ZmRwIGNoYW5nZXMgdGhlIG9wY29kZXMuIEl0IHNlZW1zIHRoaXMNCj4gd2FzIHRoZSByZWFzb24g
Zm9yIHRoZSBTTk9SX0ZfSEFTXzRCQUlUIGZsYWcgaW4gdGhlIGZpcnN0IHBsYWNlLA0KPiBzbyB0
aGUgY29yZSBkb2Vzbid0IGNvbnZlcnQgdGhlIG9wY29kZXMgYWdhaW4uDQo+IA0KPj4+IFRoZSBw
YXJzZV9zZmRwKCkgc2hvdWxkIG9ubHkgY2hhbmdlIG1lbWJlcnMgb2Ygc3RydWN0DQo+Pj4gc3Bp
X25vcl9mbGFzaF9wYXJhbWV0ZXJzLCB0aGUgY2FsbGVyIHdpbGwgdGhlbiBkZWNpZGUgaWYgdGhl
eQ0KPj4+IHNob3VsZCBiZSB1c2VkIGFuZCBtb3JlIGltcG9yYW50bHkgKndoZW4qIHRoZXkgc2hv
dWxkIGJlIHVzZWQuDQo+Pg0KPj4gdGhpcyB3b3VsZCBtZWFuIGludHJvZHVjaW5nIGEgbm9yLT5w
YXJhbXMtPmFkZHJfbmJ5dGVzLCB3aGljaA0KPj4gaXMgcmVkdW5kYW50IHdpdGggU05PUl9GX0hB
U180QkFJVC4NCj4gDQo+IFNvPyBUaGUgU0ZEUCB0YWJsZSBoYXMgYm90aCBpbmZvcm1hdGlvbiwg
SSBkb24ndCBzZWUgYSBwcm9ibGVtDQo+IHdpdGggdGhhdC4gQW5kIEknbSBub3Qgc3VyZSB0aGV5
IGFyZSByZWR1bmFudCwgSSB0aGluayBhIGZsYXNoDQo+IGNhbiBoYXZlIDQgYnl0ZSBhZGRyZXNz
ZXMgYW5kIG5vIDRCQUlUIHRhYmxlLg0KDQpyaWdodCwgYnV0IHRoaXMgaXMgbm90IHNvbWV0aGlu
ZyB0aGF0IHdlIGFyZSBhZGRyZXNzaW5nIHJpZ2h0IG5vdy4NCj4gDQo+IEFuZCBpZiBpdCB3b3Vs
ZCBiZSByZWR1bmRhbnQgd2h5IGRvIHdlIG5lZWQgdGhhdCBlbXB0eQ0KPiBjYXNlIGJlbG93Li4N
Cj4gDQo+Pj4gVGhlbiB5b3UgY2FuIGRvIHRoZSBzYW5lIHRoaW5nIGluIHNwaV9ub3Jfc2V0X2Fk
ZHJfd2lkdGgoKToNCj4+PiBzZXR0aW5nIHRoZSBhZGRyX3dpZHRoLg0KPj4+DQo+Pj4gUmlnaHQg
bm93IGl0J3M6DQo+Pj4NCj4+PiArc3RhdGljIGludCBzcGlfbm9yX3NldF9hZGRyX3dpZHRoKHN0
cnVjdCBzcGlfbm9yICpub3IpDQo+Pj4gK3sNCj4+PiArwqDCoMKgwqDCoMKgIGlmIChub3ItPmZs
YWdzICYgU05PUl9GX0hBU180QkFJVCkNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBub3ItPmFkZHJfd2lkdGggPSA0Ow0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoMKgIGlmIChub3It
PmFkZHJfd2lkdGgpIHsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBhbHJl
YWR5IGNvbmZpZ3VyZWQgZnJvbSBTRkRQICovDQo+Pj4gK8KgwqDCoMKgwqDCoCB9DQo+Pj4gLi4N
Cj4gDQo+IGhlcmUuDQo+IA0KPj4+DQo+Pj4gU29tZXRpbWVzIGl0IHdpbGwgc2V0IGFkZHJfd2lk
dGgsIHNvbWV0aW1lcyBpdCB3aWxsIG5vdCBiZSBzZXQNCj4+PiBhbmQgZXZlcnkgb25jZSBpbiBh
IHdoaWxlIDRieXRlIG1vZGUgaXMgZGV0ZXJtaW5lZCBieSBTRkRQIGJ1dA0KPj4+IGl0IGlzIG5v
dCBjb25maWd1cmVkIChTTk9SX0ZfSEFTXzRCQUlUKS4NCj4+DQo+PiB3aGljaCBpcyBnb29kISB3
ZSBwcmVmZXIgdXNpbmcgNGIgb3Bjb2RlcyB0aGFuIGVudGVyaW5nIDRieXRlIGFkZHJlc3MNCj4+
IG1vZGUuDQo+IA0KPiBZb3UgZGlkbid0IHVuZGVyc3RhbmQgbXkgcG9pbnQuIEFsbCB0aGUgYXNz
aWdubWVudHMgb2YgYWRkcl93aWR0aA0KPiBhcmUgY2x1c3RlcmVkIGFyb3VuZCBpbiB0aGUgY29k
ZS4gV2h5IGNhbid0IHdlIGhhdmUgdGhlbSBpbiBhIGNvbW1vbg0KDQpzZXQgaW4gYmZwdCBhbmQg
dGhlbiBhdCB1cGRhdGVkIGF0IGZsYXNoIGluaXQuIEl0J3Mgbm90IHNwcmVhZA0KdGhyb3VnaG91
dCB0aGUgY29kZS4NCg0KPiBwbGFjZS4gV2UgZXZlbiBoYXZlIHRoaXMgcGxhY2UgYWxyZWFkeTog
c3BpX25vcl9zZXRfYWRkcl93aWR0aCgpLg0KPiBBbHNvIHlvdSBjb3VsZCBwcm9iYWJseSBnZXQg
cmlkIG9mIHRoYXQgImRvbid0IGNoYW5nZSBvcGNvZGVzDQo+IGlmIFNOT1JfRl9IQVNfNEJBSVQg
aXMgc2V0IiB0aGluZ3kgaWYgdGhlIHBhcnNpbmcgY29kZSB3b3VsZG4ndA0KPiBjaGFuZ2UgdGhl
IG9wY29kZXMgYnV0IHJldHVybnMgdGhlIHBhcnNlZCBvbmVzIGZvciB0aGUgY29yZQ0KPiB0byBk
ZWNpZGUgd2hhdCB0byB1c2UuIFdpdGggdGhlIGJlbmVmaXQgb2YgYmV0dGVyIHJlYWRhYmlsaXR5
DQo+IGFuZCBsZXNzZXIgYnVncy4NCj4gDQoNCkkgdGhpbmsgSSB1bmRlcnN0b29kIHlvdSBmcm9t
IHRoZSBiZWdpbm5pbmcuIEJvdGggYXBwcm9hY2hlcyBhcmUgZmluZQ0KSU1PLCBidXQgc2VlbXMg
dGhhdCB5b3UgY2FyZSBhYm91dCB5b3Vycywgc28gbGV0J3MgaW1wbGVtZW50IHlvdXINCnN1Z2dl
c3Rpb24uIFRha2FoaXJvLCB3aWxsIHlvdSBoYW5kbGUgaXQsIG9yIGRvIHlvdSB3YW50IG1lIHRv
IGRvIGl0Pw0KDQpUaGFua3MsDQp0YQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
