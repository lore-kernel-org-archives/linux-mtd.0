Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A938AC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 02:38:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21977610C9
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 02:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21977610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=unW3bPNt81srr5osLTVAsZJZe95FTxa6YpLoCm9YH5U=; b=hv+MjXDCVSviDfxLkOq7htP7k
	hapUKKGcytGeEc1DLogKk/nHSq2399WvMOCD8rILvnQnIFbFXKXJ6bzAwPAvr7qnlPUFpJkTR8AiO
	ZPyoLxl0AbnVMNRC3/XBEImZcVAs3pnx5AMN70ht77gQ87FNiTgcH+zNilIO9xECOhEcARN5RmZJG
	QlUNrFexB+0sU6Og/pY55wybVfNv4YITM/xnc0Mar3zldL/1ztxW7AQ8LI9pA4jWOtyCT2yHNmxGQ
	Pq4/YI9DUxI4s4/XUsFVTWprTEsReYevTJAHJFlK7Oc8cT89DaTPnlRTjK0E+VcP5iw94wHQg4Ac8
	oPkaPrPww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUh1z-009jcv-4q; Fri, 09 Apr 2021 02:37:59 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUh1r-009jbv-MK
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 02:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1617935871; x=1649471871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=57iBRfgYS3aEHdLSwL6CCVv4VS3tzvCaVFxpf6a1E4g=;
 b=O8nM3bfs8ZDTVsMhCpDrvBegjJzZrFHm9D6/yhW5nWs7dG53gOJJzodq
 /TUrpUImq+73poYeUc96u6YCr0aCEZUJcb8P9MZ4eCa7Txf51i0p7AKrn
 DayMCOO03m8W2OAjVfOBXfeXLgbep6a561yS2sgRFQxRS91B/rmn1ZBSR
 o+FuXuPn+acxtgpEHJIdT/UAwbs5kxluDDGchFfsSOotsr7zwYfcAGTSd
 7hujBnWSOJwUMfrB9o7NHKXH3iEjsR+PWhRmlqB3Bxu3c1v2XWdIggW/P
 t4zllNZ9CPZjwStuZm+Rd4SAkAWaJpbHPURvbZWzxTBlRMeZbBzgsV0fF Q==;
IronPort-SDR: PHCww+xGkTW3HnQhZddlX7a1v1/JTmqqdAUnBUXFt+AMhdp6+jLN8cqyRvNNGYW8NVGxOMDdGq
 ZiX1ht6jkdf2jW5aevEGxl5bth7l0dr/EjnLGcYsgVJGyAsERxZwjmphvJZ1lZYsOmwLeRe+7w
 Fa2NcjKI6a4BfuxNg7gxq5R5qWspZvKIcGfIY5nIUjdh9eLSgvJO7ggtccpXT74rvEOOq0uZRm
 qO5FfuQ0fKan7eZ2+iv6JdzyO0f5duVUpBbh2sDIW4zHkPL/j9CNOLbtK/l1kb7+7WpCdFAhGO
 HUg=
X-IronPort-AV: E=Sophos;i="5.82,208,1613458800"; d="scan'208";a="50530369"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2021 19:37:48 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 8 Apr 2021 19:37:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 8 Apr 2021 19:37:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMLPDaTF3NpKPpv+nKAATVPIVWNS85FndwYqdpF6yrJMSNPf04Vdjo06v/tDywsQZNYDQK2RLPgL20Tb6XRP2dwu/XUtnzediFM3snQR/ZZs7QENQNownIsKbbx9ACA7R/u5+DmRAhGt4fKjquqonQqhFlaVgPnCCqsFywDhyhNMsyBG/dRXfFKi24hLpiQOK1csEkf6eFrs6KFtw5YCSjeoaa2E2qagIcJLfbX82tKMez4r77sIgjcRFsqad87XMZuk9j0pAm2qjQMKi55LKf+LziSTocMO6961jx0KenN3pa2xi1um37lrSAvbTVqb5L/fZm9UMRLg6zDa93jT1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57iBRfgYS3aEHdLSwL6CCVv4VS3tzvCaVFxpf6a1E4g=;
 b=Nm2AEOfo1BdtB6P0FuswlpYmpyN6jAG5qZLO4/cbO4uCmDw+K3WH3OVX5gjeQhpZKZ2Ki8wd97JXnz34fijGDcxnXTyPqe5bsFz99hL+1YqlV/oJmZ8Y7sPgQUp5RZmP62OtHwXTMTNwkSd6/ukp96X9Hw25UZMyWcOK6wJ/BA3/d0WdExzgIllUwtzoX7sPY/xcz8+318m6+0s3nYBcp2pCbGhGIL2Ip7Hl0OkDVWtgCKjkQTewVV0o2KV1CPJIzgdghmOFd/eF1Fham4i24Zlhse/YF5gM9qYHIABkQ0CpfNDRwcFDOCpK+66O1gUQkfWYm6xcGxodiQ+dPkUlUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57iBRfgYS3aEHdLSwL6CCVv4VS3tzvCaVFxpf6a1E4g=;
 b=DXAPb8WUK9I1Fc2TQ2RUqNOkkr+xS5k2CyigA+LGtPXnIc5bSwiLnckwXTL2DPD4bmuIcnl0Bq1JkwpJ9+lnNFoRpqr/pG58aeSw4kudtqsgEmY5ddfwygLkV+fBQ8XKwsC3+TCuJ+dQaUmfXbpQnD/AXCk4nE3ApSBrRX5qwaE=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB4841.namprd11.prod.outlook.com (2603:10b6:806:113::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 9 Apr
 2021 02:37:46 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.4020.020; Fri, 9 Apr 2021
 02:37:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <tkuw584924@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <p.yadav@ti.com>, <Bacem.Daassi@infineon.com>, <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Topic: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
Thread-Index: AQHXLDTjyN1Z1D6XYU2bt1eMIEhz7g==
Date: Fri, 9 Apr 2021 02:37:45 +0000
Message-ID: <e9d997a1-6d81-bccb-9e40-8030022cb7aa@microchip.com>
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
 <aae2c29f-a6bb-18fd-627b-bd11910c2009@microchip.com>
 <bcd8e956-c00e-df74-62ea-9cb746ae24eb@gmail.com>
 <ec9d4e56-8ace-f55d-a999-54a553b903ed@microchip.com>
 <a5ecdaac-3375-a898-59a1-646da26b5afb@gmail.com>
In-Reply-To: <a5ecdaac-3375-a898-59a1-646da26b5afb@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a98f5d45-2c92-4780-dfe1-08d8fb007562
x-ms-traffictypediagnostic: SA2PR11MB4841:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB48413363C06B89D901F673C0F0739@SA2PR11MB4841.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tjWtU3dbl56rDDWlyqsfAA2pRfCgotHuUEjotwvK2zZnxtBiwLKOOcEhOrn5cSua08VRyckzDntVB911CSNEMxYmvK2j914AeqD7qWpygsrufP00231vdoxrU7WSDfQz6vceXC/1TO1aRGQ4Hm17k3XT0EkBqJIlCWkPaml9uGh7us4xe8pfNH97rWCQVK4D4jeIeOagLRI598Oy7MwdICRqCI+v9AJRDnlfOH6K72rGTcSsHOUOFkR3w3kZfpV3mpTRaiCo3ZF2dU8GSNRoD7SHyQ8bH//3YPtY0VNzgMrfXLJpuoWdH+dtd1MCKTrZ+rcFNuA5GH5lX0nKqRYj0phdAN/RZWdYj8yeGvZzgpir16pzL/GXz5yBYBb6WiFlbz3/tt8mD7E/pEkaWPESRznyepzrdvCyXUCsqlZq2ULu0psD5ksYOjui5wtEdF5u63nPVa9fgtL4sxK8JoZiSyF9o/Bn8WliPjp3a/4bLobh9u6Qok7opJo2oNIvnIWrlPe0NEWrIr9+1hWgujDlkyonW0mhunFJozA6d/owkES/KJMtWCuBmqXG26FdbMvnCeQtN1eCJO8udI3F54fYQ3O710B0hbqocS5BiiFWmHjnb3AQupWseDS5RMWMIdJzjZNJlIr/emN4Ard5Te+0WMhhdbKiu0tuwtbMSYGWBRzMk1v3M8TWc8n5Mp3PAVEhY3+A8icj0tMB6FzQPQ053gxofsr+f3gYM2CTE0gWBaA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(136003)(366004)(39850400004)(66556008)(2906002)(38100700001)(186003)(110136005)(4326008)(31686004)(26005)(8936002)(316002)(6486002)(6506007)(64756008)(91956017)(54906003)(66446008)(478600001)(8676002)(6512007)(2616005)(31696002)(66946007)(76116006)(71200400001)(5660300002)(86362001)(36756003)(53546011)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZUtLbkxqU1MrOU5hWUxBQS8xOWRpdzY1MHdBTDlkdUNOb0pxTjVHSEVMdGlD?=
 =?utf-8?B?L05jek1GeFJNVCsxSkdpa2JSTUFLcXAvYUVyeHEyQ0wvS2dicDF6RmpZNmk3?=
 =?utf-8?B?bXFrZVUwSGN0RzlpTHMrbTY0czM4ZFc0UnRNRTZhQXJwbFZkdjZDVk5GdFNU?=
 =?utf-8?B?TC9TcWZCQmR6Wk5zT1JMbVZMVmZBRDAydXVmVTFDaEVpZ1NBZGYxM1ZtMjQw?=
 =?utf-8?B?dXFPV051ZTBDcXZrb21FYzJwZ0hsenF4S2M3MGtzSlhoOVJsMzdLc3RhV09G?=
 =?utf-8?B?V01LS3hwVWhjb0Erdi8vUkc1NWlzMVdRYkxnZk5iRmhSWFd4S0IrYW93ckJi?=
 =?utf-8?B?aWVkYWlzVm5iRGtQaGlDdTdTS21oT21Rc1E1T0V5T2xoTDBacEFsSW5RK1c0?=
 =?utf-8?B?b2pmRmZIVmJaVEZhRkxVRUVmUnU1T1h1MTNEdjJ5TkRRZm9QaUxkSXpGdHh5?=
 =?utf-8?B?ZGpzVmN3WG9sM2lvS2JwL3RSSDlOMW12dG5pODd0c1l3SE0zSkF5OGp1V0lR?=
 =?utf-8?B?ODh4TGJQMTc1ZXlEamhpdGJPbDR1NUtlNjNIY09LWU5MaHpEOU8vRXRFTFhF?=
 =?utf-8?B?NnBoMmpoc3QyUVFlNGJnRWdqbkRBcGE2U05DVVovdkd4SE5XL3VaU0d6bkY0?=
 =?utf-8?B?STFtZ0M0dHA1NXcyamNaZThnZ0NYVUcrdzZ5TFMyK2FidUJhUDZaaXYvQUZp?=
 =?utf-8?B?dXhwd3F4cE1DQmJoMURHWWdDNXJzUzdWZmV5VXhWT2JyMm1objBHTFk2UzFS?=
 =?utf-8?B?MVoxcThrdkhGQ1o0VUlYU3loV290SlZBdk5mNTZsaHM0QWJrVEgwVXdpM2Ri?=
 =?utf-8?B?aU5CYmp2MVZWUWlOVlNVQlYyaVowVHdLZzR4Wm9hejN3eExVOU1QRkhQenpT?=
 =?utf-8?B?akh4Z1BidTRDVlpkOHpCVFphbHhRai9YYlhCZG1ydUo2VnJVSERXaDcrZzN3?=
 =?utf-8?B?UHhzQUFKN2hIMjg1ZDFjdXJFVkpIajdwTFd5M3ozWExCRzlKdkdONHZtYUwr?=
 =?utf-8?B?alBBZWh1VDlSOHRhQ1FPQ1Nuc1lBeXExY2dITUFtbThvUHVpM0F4OVY0WER0?=
 =?utf-8?B?dUo0RWgrWkxDdkFqTUg2M2ZUcEFrdlF4bGM5MGdXclNmL3ZLbU1xTC9GR2RI?=
 =?utf-8?B?anNZUUNjazNkaXFwY0tVWjhraUlSOE0xWmU2QXJ6Qk5sbnM0bTBxK3oyTy93?=
 =?utf-8?B?ODM2Q2pzbFNvS3JKcG5xSjA1V0ZCd1NBTEZ2L21iWHA5bENETTVmTzgxRjd2?=
 =?utf-8?B?bUZJMmlOR25iLzJuRTBzUW1ieWRLSjIyZEsvczQ0cFp2bVFMb2x1SnVTSFZ2?=
 =?utf-8?B?MlBzMlY5SUZmYWt6eTZuV1NnU2laMFU4N2dOWUlmK1BmNGZlMldnUk8reGlt?=
 =?utf-8?B?L3kvZktIdlphaUtUazNZY2RlY01aRmlxTmFzcHIycFVQT2twWWN6TmZlVUs5?=
 =?utf-8?B?US8vL3I3TFR3N1B5bzB0eGtWWURQVzFoOE1FeTQ3M3VYcUdtcWg3VTd3cXJh?=
 =?utf-8?B?dURkb0JIc3VXUnpVT2F5RDkzc2dKUENUMTR1Y04ySXcrck5ZQWZhSVlZMGR1?=
 =?utf-8?B?WU9KblQ1ejFDZHRwR1pkZ2dodE9LMXBJNU5YZ1dvaWhqMXFvUEhVZll2Vmw5?=
 =?utf-8?B?aHdDeW5Kd3RQRWU4RnF1UTQ2TVVLdFZmekhvSFZ2WE5qdmRGMUdsMW9ta0h0?=
 =?utf-8?B?S09aZndMVzlIR242NGtGMWgxT3lmb1ZHd0V4dGw4YjRLK3VqSzUxYXQ0NmRi?=
 =?utf-8?Q?2/ZO1y8OcSNEOMGeBw=3D?=
Content-ID: <D9789920FCE9D242BE79476815484E8D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98f5d45-2c92-4780-dfe1-08d8fb007562
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 02:37:45.9268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: to65sCgXaBjc50g/haXt/OQzDzSPy1ZXwtW+oCoNVYHGVs/MFqhky7rkNZBuNHqYb5UTBIZp86phnKu3b3fos912j9DUwEUOhuKW8RhmZBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_033752_304855_42A58DCD 
X-CRM114-Status: GOOD (  14.72  )
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

Hi,

On 4/9/21 5:05 AM, Takahiro Kuwano wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 4/8/2021 7:03 PM, Tudor.Ambarus@microchip.com wrote:
>> On 4/8/21 11:21 AM, Takahiro Kuwano wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Hi Tudor,
>>>
>>> On 4/8/2021 2:06 PM, Tudor.Ambarus@microchip.com wrote:
>>>> Hi,
>>>>
>>>> On 3/19/21 8:58 AM, tkuw584924@gmail.com wrote:
>>>>> +static int
>>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>>> +                        const struct sfdp_bfpt *bfpt,
>>>>> +                        struct spi_nor_flash_parameter *params)
>>>>> +{
>>>>> +       int ret;
>>>>> +       u32 addr;
>>>>> +       u8 cfr3v;
>>>>> +
>>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>>> +       if (ret)
>>>>> +               return ret;
>>>>> +       nor->addr_width = 4;
>>>>
>>>> Takahiro, you are bypassing the core functions. spansion_set_4byte_addr_mode()
>>>> will be called at set_4byte_addr_mode() time, resulting in an illegal op?
>>>>
>>> Since the spansion_post_sfdp_fixups() adds the SNOR_F_4B_OPCODES flag,
>>> spansion_set_4byte_addr_mode() is not called actually.
>>
>> right. Do we have to undo this somewhere, i.e, call
>> spi_nor_set_4byte_addr_mode(nor, false); ?
>>
> No. The Read/Write Any Register commands take 3 or 4 byte address depending
> on the Flash's current addr mode. Since the spansion_read/write_any_reg()
> use nor->addr_width which is always 4, the Flash's addr mode must always be
> in 4 byte mode.

If you reboot your board via cmdline, and the flash doesn't have a reset opcode,
the flash will remain in 4 byte mode when the driver loads again. Wouldn't that
affect the read sfdp command, since it is sent in 3 byte mode? Can you try a
"reboot" cmd and check what happens?

Cheers,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
