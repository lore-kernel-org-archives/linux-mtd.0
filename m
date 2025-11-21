Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776DACFC50E
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Nov 2025 22:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b5J/bvT2WnlSjg0wk1ZcRgNARVzgYfO4eD+Xg+p0glo=; b=AraaOSqtNQybJC
	IjX5lPxPI730y+Di2Q0+leQAWQCc693g4frfJ3mwErX3ShnPilePzKlB44a3rGF6GLerGMRt93qtF
	6TBIDjc3u67m9bSfoluhhOB5EA0cVC1n7GeOVN4o/TbeiyGwwShV26BesEJ/5mQBL9z74gz1jXU7z
	TeYAspYK+aC7Gp+D3fDDymXIv1jNrWiFMN4kNP3o7BjV8pNxs6vV9jfLJS/KQ8wOvuvEEAbwNCYFl
	2Tl8zhqpH58wZ6xR3FKbzunzFacRHwLZpSTAP1DC1BxNEsYiYCmUSxrRvEI/+Efouic5qJub03Fa0
	khywkBbJPNgRXJ8wMSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZjU-000000092dt-3W60;
	Fri, 21 Nov 2025 22:36:00 +0000
Received: from mail-westcentralusazon11010018.outbound.protection.outlook.com ([40.93.198.18] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMZjR-000000092dC-2mJL
	for linux-mtd@lists.infradead.org;
	Fri, 21 Nov 2025 22:35:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynkyhWZ0iFWX8XKYDpRUWtMUqmo10HDS6g/Dp1MRM/TZ+m1Ql509krm8Pb/arJRHYJCwO4HIV8K16n9Rqx48t+y8NQLy/v0ug9sLB34wvJBr67lliC47N+vUJ7WX59w1nM0abSrVo77Dq8Q7jlIBpoERcgCtQ+nThi+hIHZ0O7YLt2i72VrfW97TS74QAoVwVi8kkMjykQiqTX9bUKQV9EjpQ5zSnaoOPfrPfw2atiO9zvVI8SJE7xt4H9WiXLyY/+ycJpnFIrlCpod1pqkm57tP4VESI8bQjZ35hq9lV0JWs0PvHNYu8R0smM/tKqmmV8zNSFjnQ6JxyTAATRg/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMdiw7lI1ps5BL+Koto8394DozLHKK1T/+B4+1w6BCQ=;
 b=n5uygXKfmS4+HOPf08HtgFiXUxg7GyjD76HH283cBxSVCMRp2I6vrOwZWrF9UHKRsY/QEjwivSr2vDt2LS5SSrU5KLgEeqr1KdZtwwcOkb6Wzw6Dy11+fK6DD+mvn9xSkP4a75gIVNsIXVhlOBjJ8f8lLcRf5Y1BTGRtEtywQ0VjOXc/yG2hXDu9TJsRDQBdYUlvSGxDP4TKd8IYSmx+mKN9aQBW9F3/nLlpXUqX7Ti4txYRJlk2ml6+qMXzg+g7MLp6wcbAxeHa4BxwT8ZglsSFVUXIPH83kLwJIcb5I3falNVlV21Z2bM5W9nC21g4pLhlEI0UU/G5zcwhR3fpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMdiw7lI1ps5BL+Koto8394DozLHKK1T/+B4+1w6BCQ=;
 b=fHGL7sj3serwxpn5oG/vlDLmwu4v7n/6vj0qgiNbal4G2r6G4bGMB6A+l/xVBi7tZXUjhhB3nDvjSVm1DF5bID1yNvwIk9m4tTJL6RCUJyb9fCk3U/EhOfKn8Nk4JzJFowOdFo5s3MCVdNpCj2Ad2YhMg5Nugf095BEyFAXN8hgAvjh+T/NpuGvOLBqsxPXq1JlyyIlU8/z2Clnw2lK89LZA6oMx0fKiBEtpDhSOd7PSfY3mUPu9F7MKhw67LSdmQRWuUhoFOICEFuhGgGNZGh6V0+2m/pmIM915KQ7M2MCc3EI++v5uw/XrPInkc9yZyMgJyT5p6r7pRy0TtB/FHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667) by MW5PR12MB5649.namprd12.prod.outlook.com
 (2603:10b6:303:19d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 22:35:50 +0000
Received: from DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621]) by DS5PPFEAC589ED8.namprd12.prod.outlook.com
 ([fe80::50eb:dafb:9932:c621%5]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 22:35:50 +0000
From: Marc Olberding <molberding@nvidia.com>
Date: Fri, 21 Nov 2025 14:35:34 -0800
Subject: [PATCH] mtd: spi-nor: Fix w25q01jv flags
Message-Id: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
X-B4-Tracking: v=1; b=H4sIADXpIGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyND3XIj00IDw6yy+LTMitICXRMzC1NjyzSjRHNzcyWgpoKiVKAE2MD
 o2NpaACEDUKxgAAAA
X-Change-ID: 20251121-w25q01jv_fixup-468539f2a777
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Olberding <molberding@nvidia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763764549; l=1939;
 i=molberding@nvidia.com; s=20250815; h=from:subject:message-id;
 bh=1YnqBzHFUNI5Yxq7FvHGxFirWC7MxGM5fZVBULSjIkM=;
 b=LsUkefWeqdbOk+Hc8hs0QTY8QFsNx/xrOKpaU/lTrQ8g27RP+JOB5XZTuHS3w5t22ugHHCVXy
 op4zJPqA7v1AWeMUSY8/zFAEI26UqV60s+60IIWo32OC537+dwE8qJJ
X-Developer-Key: i=molberding@nvidia.com; a=ed25519;
 pk=qCpZ1WFEf5YiaL88PDdYhG+A/bKk7rHp7KF2K3GmkH0=
X-ClientProxiedBy: MW4PR04CA0123.namprd04.prod.outlook.com
 (2603:10b6:303:84::8) To DS5PPFEAC589ED8.namprd12.prod.outlook.com
 (2603:10b6:f:fc00::667)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS5PPFEAC589ED8:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 3014b72a-5c41-4522-4128-08de294e52b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWp4RC9sU1V6Z001dDJlelBtc0Q5MmlXYng3cmQ4NzBBUWtCUlJHK0xqRGU1?=
 =?utf-8?B?eEphOENhaWkwSEZibTZrNHFIS1RpUFBrSXpGNkhlZjhTd0JOd2ZiUUlGV1FX?=
 =?utf-8?B?SlR2QUxiUTQreTczQjR4SWNYYkNKU3F5cmVFVjlHY3ZFS1BLOW9FSWdTUUVO?=
 =?utf-8?B?cGJDZkVKTnhsZXZlMGx2QVVuU0xWMnNTODJOcjZTNkV0djVWM1hVVXBlSzk1?=
 =?utf-8?B?bUdkbzRvdEphV3hqd0RBQ25qTnl5WE83UWVxUWhvcEdqZDl5bWJkZHpOL2dP?=
 =?utf-8?B?dHk1NVNCL2kxWmlBditIR0g0VEpueVkza1BWZjFuc20rY0FybjgyMWFBRjQ5?=
 =?utf-8?B?YnozN25JaTZEWHc0c1M0SS82SEYwOWlveDZZM2swZ1F4SDF2VWg0Wm9hOVVF?=
 =?utf-8?B?bUxuOGZYVHBYTVc0OE1jVGVIVzlnRGVNNlVtaDI1ZllFVVVIeWRGdEc1TGQr?=
 =?utf-8?B?N3hmTGJETVYyYzA1dDJwSmtCelNWUnowSjNmNEo1MVA1c0k3RWh2OHA3MUxN?=
 =?utf-8?B?MmVSUWJkQ1V3cStqUjBCaENtMDNEMGpnK3FNZlZKc3FROUxDbXhYdVRuS1Jr?=
 =?utf-8?B?VndRbUtqUk9ZUUtjSmlURFZwdHhXandRaW4zYnNVK2ZHazlNei9QQnIveTRy?=
 =?utf-8?B?ZWovRXZRdUpPakJDMXA5WkZWZmNna1lMaVNtcUdQQ1lDaFFuc2RhYm95dEZV?=
 =?utf-8?B?ejZLdk85SXNkaE1VWGMvbGVWa0tOMTY2NFo5MGtBQUp0VU9COEdVeExWWDFi?=
 =?utf-8?B?RHUzSFNxQVY3UHJRRjF1MkZPeit3YlIvRCtyK3Z6ZGRLd3Zuc0JoZ2UxM2ZE?=
 =?utf-8?B?dzlnL1JpVUlNZ1J1UktXeXBIS2c2ek52Z1JYRlRSOHJMaHZOdlJIRllHemtG?=
 =?utf-8?B?MUgyaXdWYkRUZEtPZXdFSnhWRjlJRXl1YitCNnJ5VmNDYmdQa0FRZEd3eHZn?=
 =?utf-8?B?TnEySTBrYU9PK0M5ZWpCOHhUUkZ6T0Zld0t0bWlkQnY4Z3pLbXVSYk05cTFY?=
 =?utf-8?B?eEpONEhoQ1lGTVlUcWdyVmUwY0Fmb0FwRExaQ1FFT3FlKzNWRlhaeklFQ3VQ?=
 =?utf-8?B?NnpsM2VrQXArS0ducWlZL2xtMGYrM1kvbFhsN2xGNkFXZVRjcTRoY3pNdm1m?=
 =?utf-8?B?ZHJwbXRoc1BrdGdSWDBZeDA2M1ZSaDcwWTlJaExrVG9hMitRdjMxekVjdmhT?=
 =?utf-8?B?d0tZbk1WZFVFTnlIRUlrb0lGUXZiV0NMYTdyT053Q1BpOG1CNExLUUJrYUxR?=
 =?utf-8?B?QnRCZ2w4UTRXL2FLVmYrVUJYUGx2WXljOGExZ1NaTUZGdWtZTHQ0b0EvaGtn?=
 =?utf-8?B?Wjh0RnZMV2lUM1M5OW15QUpRcncrZGFpMkxMK0tBUjdyMDlzZG1ib2RMVEti?=
 =?utf-8?B?SDBJRzVUY3Z5N2ZaRnJSbGh0REJxaDZUVExQdXB5WHUwNURZTjA2eEJPcE9x?=
 =?utf-8?B?dGROZUF4V3o2ZlA5eDJWcEhtbk1oN1ZwclAwK3V3YVp6anpuc0o0VHdWU08x?=
 =?utf-8?B?akpoRUZPeEgxYzdvWVpyWE5HZGQweWpvQnYrWVJZWGgvbmFKK0ovQ3RYbkNj?=
 =?utf-8?B?THZxS0c3TWdJQ0hjV3BGSGpxZ0k4VWp2V3VST0prTVdQVmxmS0puSjgwVTIw?=
 =?utf-8?B?eHkwcVNybjN5SEdmVmJiNHFpQVhEZzJ3S0dXdlh1aWVqbUlBSUxjVjFYNHB5?=
 =?utf-8?B?RUhZL0J3RHIvUExYeGVORmF5cHk5TURabzNwZWlhZTF0Rzd6c0VxT0lJVk9Z?=
 =?utf-8?B?LzVUcE5mVjEzMmthZTMrVnNCWlVMcVJUR0Z1WUVhSlplU2dIT0d6dlF0RlFr?=
 =?utf-8?B?b2R2Zi9WSHVzQktkc1E4TUh0ZzdCMThVZjk0VkZhZFpKa2NSTFRrVUFvMmhh?=
 =?utf-8?B?MVpWS2Fvc3JDUTBhNVZoclNzTlJCTnZESG1oVVdhZkRSeWJMMzZtYU1TU3FR?=
 =?utf-8?Q?jDrEMqGy7nK8n1UUu2PxHbK7E7tNTU3Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS5PPFEAC589ED8.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWkzRzBGV0VFMkFhMTFsZHVYZzFTUjJmNnlrQWRNRnh5RGZqVkJ4TDhGMU5E?=
 =?utf-8?B?Q0I0bnpocGppUVViQ09TTkMwdERidk4yOHV6WElLc0JPL2FIMzhwNjlnUDgx?=
 =?utf-8?B?VlVMVCtYWWg4N2pWOEt0M01BdGg5ZDJXUHB0NWhWSGVqdFkwYkExM3NOZWR0?=
 =?utf-8?B?REtpOVF2SkNvcHhuWXNtYklGYmxGd3RObm1ianJLODBlWWxrSWJPU29QdHFs?=
 =?utf-8?B?RlBBaHdGSnhBRnF4MGxjUWFxNjk1MTY0Q2hmNmYwcTc2RWEvV3NsMWJpRm5M?=
 =?utf-8?B?Rlh0eXBZSDRWbWpWZmdlMkNtMVZOalRPZUpucmhmeVNlSDFvT0xVNkZJUXRs?=
 =?utf-8?B?Q2ozQmE4UnFPS1lPdmg0d25mOWhhbnZReDVQaG5vSDJDbCtuUmlwV2hOQVBU?=
 =?utf-8?B?Mkk1dVhxdDdjb1NxdDQzcHFLbENJT2V2bjhaeDZMOU1nU09pc1pVOXd0ZzFj?=
 =?utf-8?B?OXJOa2JPUEc5NnNWUFNNQ3lGRnlTZ1NyUHNPbGl1cFg1YTdXWTBnOEhSa0Na?=
 =?utf-8?B?ZitKV1IrS21kZEZGUlp1UC9PN2pVY2FhL2hFZEpRUVViczVwUGk0U3V1d3dw?=
 =?utf-8?B?UDNDMXB2dVROeWFtd1J0NFNYOE9OVmhrZjMzZ1ZtSXFKRzZkL213eDRBdzFs?=
 =?utf-8?B?cTF2TTJ3OHgwdnNuN1RBUzhTT3NpcmZTOGlJR3JybWVzczJOM2dLSGkvS2xX?=
 =?utf-8?B?N3o0UlVmWVJjczZIazlzckFDZXVJdlZkVzBzU1U1aGxMZDFzempWK3U0QVdm?=
 =?utf-8?B?bkE1cW5XV2x0eHJVOVloYlNBclJqZjlDNTExTkhVZW5zNTB1dWJkR1E5ZVZE?=
 =?utf-8?B?RkVNYmh4NlA0d0psclY2WUR4UkhBUDhndDAzeDN3YzV2Skw5cnBzbUlmaFhq?=
 =?utf-8?B?aTNCV3ZDaGxTNkEzeWtULzUzOWZHcHdYNE92VUhHZnV2aEw1Q3pXMEJnMy8w?=
 =?utf-8?B?NWJmaU9pemFiWlhHQVlQdG9xVlpNbU0vVTVZOG9JaEVpTlczak9lakhXblJi?=
 =?utf-8?B?L1ZQMmNzMlVFOCtBclBFN3pDMW8zZ3hGUzZtNWl4czRxYkZndndadkI5a20r?=
 =?utf-8?B?enlvMjlWYWVMSzI5bVV2QWFBVlJ6TGxwd3laenQvL2tST2hSYmpucm92eVJl?=
 =?utf-8?B?LzNoNTZrSXUxUS9HZ3BoT09ldUpKQ1kvSzIxK3lXVzRBeTRIVThlczlxK0pO?=
 =?utf-8?B?SjRjRmp6K1U1dnJkZkRNNkVnQ2E2Q1d4Z1g4Ti9WRytaNXFUMjBIRnpsei9T?=
 =?utf-8?B?TkFJREJNU1ZKWm5PR1VJVVBVTVpRam5NdGdxc1dhZ0pjN25Vb2NZQ3ErazM5?=
 =?utf-8?B?YTQ3cGZwTC9FODdYRVFUMVBwbStvUHV1VkNmN041S1NpYy9lY2l4NzRuZTZC?=
 =?utf-8?B?YTRLNVgzM3lCaGhZdHlmSHExb1hDQjlvbGMvODZ3YVBsQWpWK2pXaFJzRUEw?=
 =?utf-8?B?MzBudDNDcC9FQllrRzRFcW5aNlhsZ3AxR0JCNjRFd21iYWNsSWk2VVV0c0Nz?=
 =?utf-8?B?VUhYd1hjK1Bqa1JGRUZjTzI4WnlWWkpsbWZ6NzBwV0ZzakFGWVdCVEpzOFJ4?=
 =?utf-8?B?QzBPTWRIMzhFcERqMmlUTkV5RytaZm5SWGJ1TThTWnJiLzlZcmFoeGUxMk90?=
 =?utf-8?B?cVRFbG5TYW53NUlRNXhjL3pLRythR2tOWkhtMlkyajRMV2g0aUc4OUJTeVZl?=
 =?utf-8?B?V253aFc4MXB0SWRROXFwU2FjVG1URFBMUjRLR1hsRmxsKzhZZXBzZUpNMk9n?=
 =?utf-8?B?T2dtcm83Q0lGbEJ1T2JJVlI5L0NSQXVjZFJzdUZ4dTE2SXgvVFE0WWdoR1Bx?=
 =?utf-8?B?TDEzT1pqTkpYMzJCMVRwSUdYbjk4Y1RQNmh3VHhGbTBpYnEzcDN6Q0I5SUMx?=
 =?utf-8?B?VlFHckc4SkpzdDJvSDZsUjFPb3h4QlBseWxybnQ4QTdVb0tERTJsbEtsSWgv?=
 =?utf-8?B?eU41aTNOdjBiNmozZFBiMXpQeGt5dSt0VmhBT0NNRHhlYTRPV1U0QkptT1Fs?=
 =?utf-8?B?REJERU11QzEyUHFBeHZucUx1eW9ERndRcTJwN2Vpclk2VEVUL1pRalEzNTNj?=
 =?utf-8?B?TFNxRDlSQnNZNGdTVU9xQ1IwUUFhMS9XeWdZSnVjR0lvNXNneHpiazZJQ2E3?=
 =?utf-8?Q?t1K3cRBD2wq6fHFagylS1G75S?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3014b72a-5c41-4522-4128-08de294e52b1
X-MS-Exchange-CrossTenant-AuthSource: DS5PPFEAC589ED8.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 22:35:50.6302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7gluvZPSgDGVjI0e3fkZIKCYAK9P8AXMCpfcG+2n2BKOgZRSHNgyo/KTGAuLXBk32zDPa1NGHDdCQRxZBCZDQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_143558_083766_5055035D 
X-CRM114-Status: GOOD (  13.52  )
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

The previous support for w25q01jv was causing read/write
miscompares on flashing with the aspeed ast2600. Add in
extra flags to allow the chip to identify as having 4K
sectors if the sfdp tables aren't present, as well
as reporting the name and adding the LOCK and TB flag.

After this change, no miscompares were seen.

Fixes: 9b4db032fb2b ("mtd: spi-nor: winbond: Add support for w25q01jv")
Signed-off-by: Marc Olberding <molberding@nvidia.com>
---
The initial commit[1] that came in for w25q01jv [2] support
lacks the 4K sector flags in the case that the sfdp flags don't
exist on the chip. This caused filesystem corruption upon writes.
Add in the flags as well as the chips size and name.

Testing:
After this patch, BMC's backed by the w25q01jv succeed on boot
as well as self-flash

[1] https://lore.kernel.org/all/20251014050108.665338-1-chou.cosmo@gmail.com/
[2] https://www.winbond.com/resource-files/W25Q01JV%20SPI%20RevE%2003042024%20Plus.pdf
---
 drivers/mtd/spi-nor/winbond.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 63a93c9eb9174b073e19c41eeada33b23a99b184..7d4119afc8c6b4135b5a055b52b1ade7e3ef926c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -227,8 +227,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
-		/* W25Q01JV */
 		.id = SNOR_ID(0xef, 0x40, 0x21),
+		.name = "w25q01jv",
+		.size = SZ_128M,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
+		.no_sfdp_flags = SECT_4K,
 		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),

---
base-commit: fd95357fd8c6778ac7dea6c57a19b8b182b6e91f
change-id: 20251121-w25q01jv_fixup-468539f2a777

Best regards,
-- 
Marc Olberding <molberding@nvidia.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
