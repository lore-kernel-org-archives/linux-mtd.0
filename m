Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA23C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Feb 2022 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTPNIQgBXddE5dAhMk13Gg2QbG4qPBtnDCG5uWbgSWE=; b=A5XtqO2OkYoDeu
	QXW9btRNO3XLRb2P3bF7LPjHA2ohg9adMK/W3cuKt/dBmKCTIoJ1oCodVu9ME2jX2CXmCItBnq1B8
	EO1GWLtsUNieAg5qjAGdTNG9aLvqHVvOeQcniymnldG7ZAH95D82lbZiGqEWc6tNaa1PXQ2cihO4l
	IB+/n+Uj4aGE13r6/3irmGodg8BEGlyKjzihScYH5i1wsMwlh+glJa+FoVlEsx2rxyBWEAgDamG3F
	ogAdUA1L6KUqmCD1prUdnFJIQ4gJ9C0gTZPNF9d0zNoE0DHKBqTKuu15tzIwBykh1maGpULrk+rKl
	cpL7nrevwcA0x719Lhtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNce8-005dKL-CF; Fri, 25 Feb 2022 15:36:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNcdu-005dHh-Kh
 for linux-mtd@lists.infradead.org; Fri, 25 Feb 2022 15:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645803386; x=1677339386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=TLxQo4McvH5BMjh3KMIegrxINyZsgAJYIzBi/9rnORA=;
 b=lPBlCH9uHCzTeO+z5hcJ1+mGfjbBz0BQtL1PpuS2tp0HHMJ3TAMRkwQs
 ttcM7iWGvlvqOkantkqWbvIjHNgaN6fCTqmHhM54DiFyVHv4FuouSSXKV
 LMoiz69aeO54V6/9UdZiYi2ZWFMMgxBd/kkNk6h42tiDdrhuA7UV08X8N
 FOzaToTJpzFEAbUdEaCNzDbT6R5LKNtepIV2v5hhUHC+PpWaK55arjRiV
 dlh2J2WyfZ7pUwp4EuUZpT+eOPAdR0tRgD0PuNyG2QK6pvC3v+184rv0v
 oM9NSCy5U7A+4s7PioTdrmtq900gwTMgQ7Cv0atLMiOgf/AYPH+uAobNP g==;
X-IronPort-AV: E=Sophos;i="5.90,136,1643698800"; d="scan'208";a="87033823"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 25 Feb 2022 08:36:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 25 Feb 2022 08:36:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 25 Feb 2022 08:36:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNwHDlDZcF3iScAVFHp5QsuXU+Ngo33UrJQSNGUSLVC8W7BKeaSj42MVLvfoMNKIwa5zsASc1v2PJ848WA1PmxfpcQk61rCZFejJkmNZAyHMm24vxx9Bxh7Zt//j3B3Eewz8LI/T89wPH2SzvaZKEOeP7FOVmhTD79yry37an3MC12mP8GQAi/uNPFjDZ1FTIsQbqIrPuAPJLUu2HAh/1hFKDMmN/rtKNScrc3NPDwRpRp+OEXKKIcIjde326uU9c4WREGQLRUdWKEP2QdynfYFvixqaI5EBMV9wWE3FEjIcD/MjteoRx/k6OJV3YU5stYYEIO+NxB437js49aHn6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLxQo4McvH5BMjh3KMIegrxINyZsgAJYIzBi/9rnORA=;
 b=a/lekttZ5vEtuDojEMlqMjQ8M6ZQj4Sl3nRNz8wfqXfmyjWJHT//LqodeObv2469Jbb3s3H0vKcIUTK/N9upX+ya8I9F6ChEuAEy10w0KIj+lp/7RkE8iKBhJV8jDotYjvLc9AXv68EL2zj+PhsMh1tMIfSHElcb+JgLl9fvldP72MVEsTLjrzirM0u889YYXLHHrz9+7FFlZkcyrbK0nvjJVhYeqVGdseKAn66s4jhieP3cINnt89fqzX/UjeEpOxTO239i80ZPXus9n9eweOUsrDsdfq5a0ttM86W/E61KxyAjJi1LN2REh6hvR4bnxMuLl7yqjpIs1qajkAIxrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLxQo4McvH5BMjh3KMIegrxINyZsgAJYIzBi/9rnORA=;
 b=aumYQyQdP/fa8iHaG2sBHFBOF71y+0kHZA75c+yobmeIf+DjGIpI4+KiIi0EtI1XOD5lo2KnXrdHpyrQlxheiQaLqROBAj3syJ9dmHLWcQeevrrqA3JRTUiys9rzMFcSpsyZnp8LYQqdTvF3Ypmt9pnYkgdoMfzVXfLd4PKFQQU=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by CH2PR11MB4486.namprd11.prod.outlook.com (2603:10b6:610:48::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 15:36:19 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::dc94:3c7c:8ef8:21b9%5]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 15:36:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <yaliang.wang@windriver.com>
Subject: Re: [PATCH v5 11/32] mtd: spi-nor: micron-st: unify function names
Thread-Topic: [PATCH v5 11/32] mtd: spi-nor: micron-st: unify function names
Thread-Index: AQHYKl1urOWxu2o8UkShyaiFUyzsrQ==
Date: Fri, 25 Feb 2022 15:36:18 +0000
Message-ID: <f9443402-5a90-dc7f-c58b-7ff31f444710@microchip.com>
References: <20220223134358.1914798-1-michael@walle.cc>
 <20220223134358.1914798-12-michael@walle.cc>
In-Reply-To: <20220223134358.1914798-12-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df7f52ca-26e5-4602-ac02-08d9f8749162
x-ms-traffictypediagnostic: CH2PR11MB4486:EE_
x-microsoft-antispam-prvs: <CH2PR11MB448640B8352872DAF0F2B563F03E9@CH2PR11MB4486.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xy+qaiPabaS/k0bAsWJaCZ6z8Q9VwQcA8VBrC5vZlJp47V2aOA2tku4PGqfuZvCvqrCNZYgJcrbD60aCeyxXKUxTZWKuFtdd9q6w6ESRhSeaHtPUHAam62wss8LxrOVKVwheK4dh7wONKrO6S8qm0k9XVvkJG+kXiGaQRWJA8kGmFbWHlu/W4ABHlvgvdMqL0MhUV9evpR1dWwz/LnD0+szCPm3PwBhe2iykU5PGBlDSEGs6P0G+W5EnrLhDEeeUBaEz1vkHratG+SVgvFcCV8DrSJI4UliE2hf/52gCPyyxzwcTjjxJ6M9kyq/KewWAScRDCq+VxI8gKhwMQF+7NVnX0ogR8868dhEcOpOuYbrAdjGYVZqjuTmgq8nOwXpUuC22hTk7jMwIHDzX6MKkOuezwwPBUvuzi2n1SJsLZJOzTPIFuahc6Iz4iXc1qoXn5+sDZmtfueINzuwtJ/vAhOVyqnLLN/Az5Y7Pq2I2XYxA6LmvtiW0vbVMTPwslqMtPcjgL9x+wMAUZ6WxBDN52qY41i3rPVvke4EbGNr5zpqXbfb6QUqVdqBuPeWGxbml/JoeFRFtJWmXrQys9AfFN7P0OeNqY5/nHPW9eu5RgqmW5gg3ZYD/ekORvL+6aXC/VU1ZdAwr/+yTpRHkhFDlp74kUw2I/aXBM15kNAFrOmq+2Bd4k4pwHal5zbmmHtQgocS0xEbs+m/ltlC2XRRTF6Fo9JUN0ovKvEeeEE8+/NV/96FqmN+sMDuKOAKSL/iRg2qZx6rJygIzo7pIFNv7iw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(558084003)(53546011)(122000001)(6506007)(2906002)(508600001)(66946007)(76116006)(66476007)(8676002)(66446008)(64756008)(91956017)(6486002)(66556008)(4326008)(71200400001)(316002)(5660300002)(31696002)(38070700005)(110136005)(2616005)(186003)(26005)(54906003)(6512007)(36756003)(8936002)(38100700002)(31686004)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFQzL3RneDg2VnZpQXpKeEE2ejhYS3FnZUZkdi9yV3VUWUZIUTk1M0J2Y282?=
 =?utf-8?B?MW9hMDFnaS9pR3lhaXpuNFMwTXB5ZHVuaEU4Uyt4SCtTVWhUQW90eGxjSGNh?=
 =?utf-8?B?SGZXRUJVcmI2cS8zTVBtejhLTjV4SDNQOGFjVGFmRzhwUzg5SHRNektBanVZ?=
 =?utf-8?B?dFErWmczRHA1M0JTcWw5MmVEcVJYcThGa0hhaW9VeG5xSmhlYnJ3Q3BPa3hO?=
 =?utf-8?B?cHRGNmQ4Z2ZGOTBGODd6bUhxMzNJYnJ2bTJJN2VNeG94aHA5R2FQTXdyL1Ux?=
 =?utf-8?B?QkNwb0xEOXRRSzVWSFNqZG96Vnd5YXk1NWZQOWNNcVl2YXFzc3lVTHExSEkz?=
 =?utf-8?B?QVBhanZQakV4MWZZUWNuVFpPbXZpQm43YzdETkpURlhSS0c3YTIwRlFHL3Iy?=
 =?utf-8?B?dXdZbUpEelQxZVR2TnoxZnVIeTcxZXRLM24xdnh4elBoMSt4WVZhMC9nOXRO?=
 =?utf-8?B?TVd1K1lKU3VmUjc1czMxNEVXdStIY1BmTVA5OUIybW5BZjRsTExUNzRod3pm?=
 =?utf-8?B?Zzh1eFdvbzBWdWYwbUNYZ1VCTXk0eGVDaDI1dXpLekRVWWJLcytJV1publds?=
 =?utf-8?B?a0Z0V3lhbGVYczAyTnQyQ1g3TW5UWHEreEdyWlFrOGVWY1g0QlM3Z3RqZElm?=
 =?utf-8?B?aytqZXFhMHkrUGpWRkJ0Y1NTZEl2aXpvajFZUGxSb3hTaUc3QjJWS1NOTDRj?=
 =?utf-8?B?ZEdkdFUvM0orWDRFeHVtcmpDYUZIVGpDRHBzd2ZzMTRrQlV3SFJROEwzSExh?=
 =?utf-8?B?dklwSlNhRUQ1RjVZYmtYcUI5djBGakhIZk1TWDlwdXJ1K2dabTFrbWYyVGE0?=
 =?utf-8?B?S2U0bUd6UEVjZzFUL2JMZkZtZkRZLy91WVdwVWFUcGdnQXVuVXpvK0tFSm9C?=
 =?utf-8?B?b2dkcTVNTGliOE9iYTBENEgrT2J4QnJld2k0N1I3L2dha2JVcjk4dVc3MHY5?=
 =?utf-8?B?eXhac3VJcG40QkZPcnpCRkg3cUViTnF1em54TkZUOHFGOHVpbXhDMzBOSVBD?=
 =?utf-8?B?TGxNWnRiY1NsVndoUDl2QlQ0VGpOT3Q3UHVidWdRY2FkQ2xISlJZZGN5cGtU?=
 =?utf-8?B?bWMyeExmYTI0ZUlDNDduWUNPVVNEWGQ2ekxTVGt4SGcrTm9OUVF1SHdncnZo?=
 =?utf-8?B?Q0E3Mi9KbDlmRlQ3VHUyN2MzQW1kSkJYMG52SWVCRThZT3BqbHl2TzdkNkor?=
 =?utf-8?B?MEZhME9EN1YrT3Y4QUErMEk4QWtXdzlVZTFsS1VwNFpndmhobjFITXBwZW9S?=
 =?utf-8?B?VVFEQXBsbWRjeC91OUc5NHgvOTZ5V2Yrbk15Nm8xcmtQdC8zZENmcmxUdXg3?=
 =?utf-8?B?VWZkYWh5MnErc0lSc3RMQlVObTB5RUFLZzZpUFdrWHBkb0dBYUVTZnRIait3?=
 =?utf-8?B?c0h0QUJWT2w4SWwyejJFNENEdWZJOEo1QlVVV1JhMkx5SC9JT2JYQ1VGZDJX?=
 =?utf-8?B?V1dQV0FBbjZJWkVrb09PM3BDTitITksxRmRrK2VUZmsvWGtXMUlqby9OUmRw?=
 =?utf-8?B?SjFFdlVuOXhnTnJtVGxDRUhRTkhZN3gzZFhwV0NiWFN2VDhsR29LeC9uSkha?=
 =?utf-8?B?RFJuS1E0SXVQd2ZPQUNTZXFBanBDdFJ2YTlUQ0toUGIrQ1NBK1JETFlrc1dk?=
 =?utf-8?B?VzhjL2FqWHVEQ2RPdWNhQkx6V0o0ZWkzcXZEL0NCa1MyTnVhdjdLSGJBaE9i?=
 =?utf-8?B?QVBNVWMrd0pVdmcvUUZJL0Faem1xYlhKRmZSZ28yUkxWdDlkNlczeDQvaXRM?=
 =?utf-8?B?ZEpyZzJMQklHRWFRZ0pXN0Vla1lIanBHV3ZwdXhHVGNYK3pZR0YwTHI2UEdI?=
 =?utf-8?B?SmNqdkNPMFQxMnhEYVBVa3QzYlFETFA2bjNyb1cvbjMzaFB3ZjBBdW1lYkhP?=
 =?utf-8?B?WFFaZlFNS25yZ2ZDTmQzbExCMGh4R0s0YnE4MUVaSERuZUxpMG5qeWhibHFN?=
 =?utf-8?B?SWRnM094VWJXcHhNNVdMQTlzSlhwWDRGL0hHSTJTWHhtQ0hVTHZXcDU3NS82?=
 =?utf-8?B?STJ3c1pKL3ExZE4vWGhMSjFlM1hQT2ExY2N4Um5XMXJOOU5PaS9PTkVwYTZk?=
 =?utf-8?B?bjE0R0xPU1NUVmhESWsrWklKckNOSEFkTkhoaVk4N2YyQTUvU3g5Umluc2Jl?=
 =?utf-8?B?anBTZmd1UmtoODN3TGZUczdGZWhndWVSdmwvM2x3OXZ2QllkR0VlbWlORVZm?=
 =?utf-8?B?VnNueDZzY3RlZXRpWXE2dWxZTlFLUjUwY280VFg4T2pvRjFHaFZVdGFkU2ln?=
 =?utf-8?B?eXVqSVh3dlVLb0hJRVIwZFk1aTBRPT0=?=
Content-ID: <6FFDFC257F97894493BDF1E4752E8D6D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7f52ca-26e5-4602-ac02-08d9f8749162
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2022 15:36:18.8068 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tze8bZRgAVBucnoCFvgvXzKKRnSeGP2EAduUC4IrRd25Ls8wGt/QVf2V3X1h3bALABamLFlBy2eSQ4YP/FSgG5ZNA99dW4/JBeGHzTMvT+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB4486
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_073626_830462_F4D9D70B 
X-CRM114-Status: UNSURE (   6.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/23/22 15:43, Michael Walle wrote:
> -static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +static int micron_st_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)

we should keep spi_nor_micron_octal_dtr_enable, because there are no ST flashes
that support octal DTR.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
