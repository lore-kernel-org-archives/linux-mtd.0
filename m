Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB70CD4F5B
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Nov 2025 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Cc:From:
	References:To:Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dGzz3rXVq7ypbmN3IiFwQmsKUfjaM3QtPaSlEcAXB7A=; b=uSYcvs/jB0zbBs
	4UPONOLike9EezXCPlphD2hq0G9wVWAkerB+FvFqn8vY40+RYRjL3XJSn/kLUwd5bvCprVfF4n9bk
	8/cFxsGFvl+Ndq5uHuhC0KsReJAn59f9J+Z1dj3V9d0FBVh5OajIFN9FgC5RKmx29r/EyBKHoly88
	6SyrAQOjS/Hwcfe9OjFkpG8qinE+8GZHhdzr8/cfzZgMQEztzrCO76djSrdW4h8aUY1IPx5ccH1hU
	W57kabCCEFFbFp1uJ6EOvShdE/JvpHRjlm79cpbJ3VTLpTQsl9ststZ68OVDlR6z+F3nMnB31FXAT
	jCtO1CZFG04hA2RS7ZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSl4-0000000A6iV-1yPo;
	Thu, 13 Nov 2025 08:32:46 +0000
Received: from mail-japaneastazlp170110002.outbound.protection.outlook.com ([2a01:111:f403:c405::2] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSl1-0000000A6i7-3GJF
	for linux-mtd@lists.infradead.org;
	Thu, 13 Nov 2025 08:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhm4rIOgJNG4e8xzhEztZq2P0S/pXxoB6uEUe/bpcbL5TNpa5A84mIfOGSUC1sHIT7m7/2RO4cD+l7DNHsne6yZ9DZQtFAXxRkrzjzlDqUN6Re+DETvqSV+bRoSBG2UumRhpLqIEniRUDho93Mp6ENYsJvMqOYToKnkgXLTxyG90k7P6Y2qmEuQm0zjD2QKCA3YpqBrmHQLkJP4GCmirFllwEONO6xUVeD4Wi045dWVLRNvVVhzXQfl6xEcCKoNon/XogKqZgaoWD7Kbvm2lOj5A2SXUYsDfAgEhb5+ObCHuzJ/QTAGskHFYd5QnvcSDhAMc6iAz2t0/rXC3qRyJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhChsRLMqrP6Ygx2aBvFz3u/hOcH+EJz89Dum7StH0Q=;
 b=ez3vJlb/vhnuHoR1iVsSB7rF3mkOOiPXS0QUEacV7601oBKPxuYtHLEGZF5jEZeTa1fPRFaxtKzNOT3rfQQFHSvZV+yxAHSX94zXqNHThjVnQKgeXBOYo5iH9jAUwlfn/xdnmHjodDCBoAHIOqwppO1NU+i8UvZhKFohGKq3gMXN/+vY5NAGh7qBQmsuU7W3wtKERosjleRij7FS5a4Deg92oCcL36RKqndzn+KjuLhad/N4KgGnICateMXLyRLQszWDTADS6NBCnEH3bOlphZznYefvC2cPSK/09+/WSkUP6maDo0IaZn6L25L2Qjir90tp1EGIeHdla4Y+xuuwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lineo.co.jp; dmarc=pass action=none header.from=lineo.co.jp;
 dkim=pass header.d=lineo.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lineo.co.jp;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhChsRLMqrP6Ygx2aBvFz3u/hOcH+EJz89Dum7StH0Q=;
 b=NEqqnHGKe9cEx8pskTTGoD2NZukQIC1U2YFiHa/GP17aETe40f4rYkBXy2HN+mBQf8HA/O5lOw/NfPbpPMcmv5yvCti5HwyDtJU5zpQZDUKaNVAYQ0cbAz9DAuAfTbjnY1wWgTRtHDUFGHHlRau7X7XrBL2fyyzxYq3J90WVTe1w0sNRqzX6JIqEEh4tLnnYD1P2I24HcAz9I/kUtPr9HxP33ho3QwjYX1WlSOU60ClE+n0zwx9djHiOVaOqe1Jqo5LeeMXR1CqH4NX5Tl/dd/q2EZBgIEnnj6jNa7x7J8jbhTlslCpsDnlzdUqoJxe1DRNPWH0gxVFVHf0ZfFszTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lineo.co.jp;
Received: from TYRPR01MB15417.jpnprd01.prod.outlook.com
 (2603:1096:405:286::14) by TYRPR01MB12488.jpnprd01.prod.outlook.com
 (2603:1096:405:1a7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:32:36 +0000
Received: from TYRPR01MB15417.jpnprd01.prod.outlook.com
 ([fe80::1186:b5a0:9df9:a9ee]) by TYRPR01MB15417.jpnprd01.prod.outlook.com
 ([fe80::1186:b5a0:9df9:a9ee%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:32:36 +0000
Message-ID: <285fc676-0f51-41fb-83c9-b95671af4ada@lineo.co.jp>
Date: Thu, 13 Nov 2025 17:32:35 +0900
User-Agent: Mozilla Thunderbird
Subject: [PATCH mtd-utils 2/2] fsck.ubifs: use the appropriate format
 specifiers for ino_t and loff_t
To: linux-mtd@lists.infradead.org
References: <9276ac09-7c7d-41df-9ee2-094f1c8edf93@lineo.co.jp>
From: Yuta Hayama <hayama@lineo.co.jp>
Content-Language: en-US
Cc: Yuta Hayama <hayama@lineo.co.jp>
In-Reply-To: <9276ac09-7c7d-41df-9ee2-094f1c8edf93@lineo.co.jp>
X-ClientProxiedBy: TYWP286CA0031.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::19) To TYRPR01MB15417.jpnprd01.prod.outlook.com
 (2603:1096:405:286::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB15417:EE_|TYRPR01MB12488:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3acd90-1bbd-4263-e146-08de228f3322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEFYUXFJWk9iMkxMQ2dkK0h4SzZoWEJGZlBlR0tDS1RLM21CSHBUVWtJVmRI?=
 =?utf-8?B?NnhZTzIwUjZlV0FkYlR3WU5rQldXVHhaRVhLYi9NQ2ZuWWZidGlOQjd4Rkxa?=
 =?utf-8?B?c1NOVUducWtmUUhYaSs3Y1grZHh0c3o2cERtd0tIR2orL3lIK2g4NTl0dHhB?=
 =?utf-8?B?YkdQbCtiQzhCcWhleDNxY2dzSEtYakRNTHNXbDR3TWl5WTZLQkZka0JiRWZC?=
 =?utf-8?B?MmVWUDhJZzVPU1dZczh2U3gySVhLL2FIVTVwR1QwR3NvTnU1amFBMHNmZGk4?=
 =?utf-8?B?b1FUVWR2a1puMllNeTFtTVlTbGJxQW9UdksrOEdzRGdvR0dKVU4zNTNuVHVx?=
 =?utf-8?B?ZWRaRDNUQkc2aUhFRzlGLzExM3ZvSVRMcGlMTjRTYTh4NENveHdIVUt3ZldL?=
 =?utf-8?B?ZUdtMG1lSkxvZVpaMVcvY3ZrQVNDOXg1dXVpUHFoN1RuYytsSGxYTXZhcHJV?=
 =?utf-8?B?Zm9hUlNSOGFmenIzNDlIVnBZeGh2ei96d1o2KzhsdkVlWkRqOHFIKzRCTFhJ?=
 =?utf-8?B?a0grdG9qQVp2SXJjSTVyTHFlWTYwYi9QcTRhc1EyS1BQU2t0Um9PRVZqTGtE?=
 =?utf-8?B?TGRFQnJpOXVzUGh1eWlERFlnVXdlbklwejdXeCtJbG1Qc2dtei9xOTlqZW9i?=
 =?utf-8?B?N3p4dU03MFBXTDlnUXdTbm95Z25EWUF3am05Sy9pcVhIRDFsU052ZDk3dDMy?=
 =?utf-8?B?RzRyV2FGa3FVTnVOaE1RM0ZiZ0h2NXhYL2tWelg0bXJIYUxhWm01eXN1SkdS?=
 =?utf-8?B?T3dqTjJOOTZXMG5ZTGtwZGtmMm16K29DMUhLUHNjNnF6TXNUdzZyUzZhNVFT?=
 =?utf-8?B?RUFXbzhsTjU1Ri9tMU0vSXZsd0FPdGhZRlhhaFBFS0tXQU5NYThoSlk3NWpj?=
 =?utf-8?B?ZmJ0TlhCL0krMndBcEZSaWxOQ2JIejVzQnpSUE1IcWFkNGxNWjM3OG5pQWs2?=
 =?utf-8?B?N004YW9FT2RxMmVFbnk3bERWRG5ma1U0SHc2M2lPNXZrcFVFYXQ1K3NmUkxv?=
 =?utf-8?B?L3gwYWw2RWlxS2JzMDFwektFWTBzT01VYjUySkoxM05uWmxxdXp5N0VnRkZY?=
 =?utf-8?B?bk1vQmFXdXpSL1ZoVGl2Y3Zub1c3Rm12RkRzUjI4V05kMDZDWG14Rlg5S3JE?=
 =?utf-8?B?aUJ2VlFXSDV1M00wZE5aK1JNdGJFeUowdmx0VUN1bVl5Q3lvRzBVenFTRktS?=
 =?utf-8?B?blVRYlVrL2F1S2F2SnZ1NlpXbG93dlhBU3l5Z3NGT1NDTEZSVkxwK1BqWUhV?=
 =?utf-8?B?cTNSM3RxYzRYK0JYSUtENUtPM0VWYXJLaHhYL1NmVVZEOTFRL1VoUVVvaUMr?=
 =?utf-8?B?WDBhcWYyWmd3U3A2ZE1LQkpVRFdFZ3RhUjhlSytJTllvTk9sNW1xR1pRcFll?=
 =?utf-8?B?NDZ2T1p4aG5LbzNTNjlkenFubnpEamIvTXZLd1lTVm55NS9Ga1BKMWRtWlZn?=
 =?utf-8?B?LzVjTy9tZlRQVGVTUUl1WllRUHAyanFwZ1Y1V1YwNkxRUGRlekVUN2dYMVJ5?=
 =?utf-8?B?RkR3QjdxaitKdmIzTmtkbzFzS2taSjMvV2dMMzV4WmdPdnJielBrN2s4ZjU1?=
 =?utf-8?B?WnhwVU9BVytuWlBRR2Y1dXdNQXJRc3NoY2JJdE9vM3ZSazhybkZac0FjWXQx?=
 =?utf-8?B?U1lHU1hUOGQxQ2dYNmdrMUlIMXVpekJDcjZsQkVONitaK3FMRWdkSmtPS3Rv?=
 =?utf-8?B?OHh5MTlwTHhDaEQxcEpxa3U5cTVnNzhRL09pOHhIL1p4MXBCMlhoVjArbmpD?=
 =?utf-8?B?WGhHeDlyVGlaTDBPSGJOV1NLOFBpb21KcEQvbkh6enVYeUtOQzZiUkVqQno4?=
 =?utf-8?B?S2FXZEFQVE90MXJiOVlXbForU25QMDhUM1ZOZW1jTTZ4anVEMEdOejJDSkNE?=
 =?utf-8?B?ck5mbnkzVnR0K3VNVENuLzlnUHdpeVFEZ1FqbFJvcU96d1ZuVGZSSm5Edmts?=
 =?utf-8?Q?EFaC6e2/G7HKWpydAb4w97sehgHZJ1K5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15417.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkZxdU5PQmg0VWFiWWZ3eHZodnNrblAxUjZoczZtdXNKSnJiK2lxYWhOb1VJ?=
 =?utf-8?B?K2w3amVOZDQrczRrSU02bjUyRDZKYU1QSitiQVZBVHVxVXpwU051TE9Kd3JZ?=
 =?utf-8?B?aXZaU1ZFNEIwdVVHOHQ5UXdnTUhzbzE2R1ZDNFI1dXh3RVpPSGhiNkNseUtY?=
 =?utf-8?B?Uy9tR1NlZUF5VHpaaStnWTJyZjc2R0FFZkYzcmpNb1dEb1dEc05TVlZGT1E2?=
 =?utf-8?B?ZzdDWTZFZmtDZi96MWExdjZVTmwvbUV4UUVoczQwa00zRG8yakVxWFRtcXhy?=
 =?utf-8?B?K3JWeVV3V1pzUnBNTVFUYUxFRWdFK1liYnBxMkVSd3NaeWFNbXUrRHNrREVv?=
 =?utf-8?B?bWdPTmlsZmFXaDRJLzFFM2phTEtKZHNUZlFEN1VkSzZnK0RaQUZ4eWc2VER5?=
 =?utf-8?B?NHBPeTNrcFNIZHFjbE5hT1FuOTc2elAxQWNVODNzN01lU1p0MUlrei84WGF1?=
 =?utf-8?B?a0tFMWNkM0JYZzZHVEpncDI1TzdDL2pvUEhUN2JEYU55cVFmQXE1YnYwTEtV?=
 =?utf-8?B?Yk5oYms3Nk1tMW5YWmdaWGFndGpZRzhnZDE5U3FqRUNqRlhibjA5QXdrTXBX?=
 =?utf-8?B?TXJQY2V5QXY0cS84M1VtUjdXOHBSWjhpa3EyZEh0YlFETnFLT1JvVktVMFJU?=
 =?utf-8?B?WnF1TlBQV1FzaFJrSjJzREZkQWo3eFZ0ZEVJN21pd0d1dFMrVmQzMWZ0Lzd5?=
 =?utf-8?B?dFBLSGYyakFJVGNqT1RQL2xUTyszbEVscDUwd243cDZNZ1lSRlUxNk1GcDUy?=
 =?utf-8?B?V2NrL2tGSUZidktCZHViU0tJbzZBNjJyUXdvNlJIamZCOW90TG9wYSs1Q3NF?=
 =?utf-8?B?MDNLUDhjRTJBNHh1cjlFdEl6T3ByTnJTWVJ0SUxNUHl1UmtTM1Z1THUyK0Fo?=
 =?utf-8?B?a0M4b3NZVDljRnlzVkRtTDhuQ1dsZDdUZjBvOWhnOWVyVGV2NEhySU43TFQ1?=
 =?utf-8?B?eHNYZVNSaTcrZUNjdmhqRHVSK1R5WGdZZjNSWWpmQ1RuMTZxU0l1QTBPMWlv?=
 =?utf-8?B?SWx1TEt3UWNSa3pabnN0KzNha1dwY0IwT1RmK0VESUNITDU1WnEydUtqRkZr?=
 =?utf-8?B?OWJqNGZmWkRKTW5QdkNlRUMraHVNc1NOVlErY2ZYb0dKdmE3WnZMZW5rT0Rr?=
 =?utf-8?B?S05tU0xzRVZadVo2bThSaUV1ZEVkbFFCaWwvOGZuanlUUHRsSEtiNUlxU3B6?=
 =?utf-8?B?NlVmVjkwZ3R2bTByNnRKYmRUWDZWVHNkTzV0REhLY2lvV0lEOW5iOCswTGtj?=
 =?utf-8?B?ZEFjOUtyMFZLMG4vZi9tb1ExZ2xVN01RQUE0bTB4ZEVUeGlFdkRYNDFTM2h4?=
 =?utf-8?B?SUFVaDdKQTNjUGE3WFFRek13dHJRT1V2bXZRdHp3U29zaTltenJjWmdRYUZp?=
 =?utf-8?B?dDF0OXhub2NxeG5aeHdnTEFpblQ4ZmRsZDVXaHlQZ1FCaU1NTmgzQzFnOUxt?=
 =?utf-8?B?bVF5UTFFVW9GWHFXc3FoTkxON2pPVFVjZEFXRUcyZzREdHVmbFg1Z3dzUU5W?=
 =?utf-8?B?S3V5VXFQVmVnNFJGdWplYkZzMitEc2RjZm1ZNnZ3amwxYy90RGFwdU96RUhn?=
 =?utf-8?B?Vk1UR0Z6YUwvcDNtTW9uTVdrWWxwL3ZhWElua3g0L2J0UUJleVpvSkFXQWJZ?=
 =?utf-8?B?YUIxbGdrYm5yUkFIdWNKWWQ1TDIzckE3dXhSR0Z0UGFPNXFNZ0VmZGgxS2d4?=
 =?utf-8?B?ZkZuWnc5RkZHcVIxRDB3Zit5RGJSb3lFTU5IbzJiY0RRSFFKK3NnWG9hZHFj?=
 =?utf-8?B?QXBpZ3B1eDY3bThZVVNabEVnTmZXakIvbUUyVzVYZHQzZVhEbnNsQ1VVb0Rj?=
 =?utf-8?B?L1I0a1pjRjRSazFNTmxVWDNZQ3QxZmRJTkhoVTIzeDRDYUlNSWVyK3B6dmhT?=
 =?utf-8?B?d0FIdmIxZytqU21XQ2pMaFFqUGE5dkxyaWhlOEE3YnE1a1FVUWUrd05rNWVa?=
 =?utf-8?B?UVhaQWdjM29seUxBa1RzR1VjaGpiQmo0Z2RtR2Z0L0NRa1JLSEhXbU1Kam82?=
 =?utf-8?B?eC9BSGZFMzFxRUpMbisvWnJ2ZmxpWndNVXNYM2VvTWE5M0dQNmNEazN4QXNp?=
 =?utf-8?B?UnJMZEU1dVlEY3FPZGdMcVdZSFdGNUYzbldtZlUvSmF2RDZKN2RvWUNiNjhK?=
 =?utf-8?Q?RBCVZ1yg4loGpj/duHKHTySZa?=
X-OriginatorOrg: lineo.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3acd90-1bbd-4263-e146-08de228f3322
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15417.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:32:36.7691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 850e1ad4-d43d-42a8-82ab-c68675f36887
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X4rndYug2vcyIWgSG3mARsQ+vFxLIk4BHnlOCtXREXzWJoks0ThaVkIy9mGPxnDcid8oPVy1zSlBZyk9UCG7pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12488
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_003243_943352_D0A1AF84 
X-CRM114-Status: GOOD (  12.08  )
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

On architectures such as armv7-a, ino_t is unsigned long long rather than
unsigned long. In such cases, the printf format specifier "%lu" is not
appropriate and causes an incorrect address offset.

  mtd-utils/ubifs-utils/fsck.ubifs/problem.c:224
  		log_out(c, "problem: %s, ino %lu, unreachable dentry %s, type %s%s",
  			problem->desc, ifp->file->inum,
  			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name,
  			ubifs_get_type_name(dent_node->type),
  			key_type(c, &dent_node->key) == UBIFS_XENT_KEY ? "(xattr)" : "");

  fsck.ubifs[484] (/dev/ubi0_0,danger mode): problem: Dentry is unreachable, ino 917, unreachable dentry (null), type checksum_typefile

Furthermore, running fsck.ubifs with the --debug=4 option will almost
certainly cause a SEGV at the following point.

  mtd-utils/ubifs-utils/fsck.ubifs/check_files.c:103
  	dbg_fsck("construct file(%lu) for %s node, TNC location %d:%d, in %s",
  		 inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
  		 c->dev_name);

To ensure functionality regardless of environment, cast ino_t to unsigned
long long and output using "%lld". Apply the same fix for loff_t.

Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
---
 ubifs-utils/fsck.ubifs/check_files.c         |  11 +-
 ubifs-utils/fsck.ubifs/extract_files.c       | 179 ++++++++++---------
 ubifs-utils/fsck.ubifs/handle_disconnected.c |  10 +-
 ubifs-utils/fsck.ubifs/problem.c             |  36 ++--
 ubifs-utils/fsck.ubifs/rebuild_fs.c          |   8 +-
 ubifs-utils/libubifs/dir.c                   |   8 +-
 6 files changed, 127 insertions(+), 125 deletions(-)

diff --git a/ubifs-utils/fsck.ubifs/check_files.c b/ubifs-utils/fsck.ubifs/check_files.c
index 54300a3..53f3860 100644
--- a/ubifs-utils/fsck.ubifs/check_files.c
+++ b/ubifs-utils/fsck.ubifs/check_files.c
@@ -97,9 +97,9 @@ static int construct_file(struct ubifs_info *c, union ubifs_key *key,
 		ubifs_assert(c, 0);
 	}
 
-	dbg_fsck("construct file(%lu) for %s node, TNC location %d:%d, in %s",
-		 inum, ubifs_get_key_name(key_type(c, key)), sn->lnum, sn->offs,
-		 c->dev_name);
+	dbg_fsck("construct file(%llu) for %s node, TNC location %d:%d, in %s",
+		 (unsigned long long)inum, ubifs_get_key_name(key_type(c, key)),
+		 sn->lnum, sn->offs, c->dev_name);
 	return insert_or_update_file(c, tree, sn, key_type(c, key), inum);
 }
 
@@ -340,8 +340,9 @@ void update_files_size(struct ubifs_info *c)
 			file = lookup_file(&FSCK(c)->scanned_files, e->inum);
 			if (file && file->ino.header.exist &&
 			    file->ino.size < e->d_size) {
-				dbg_fsck("update file(%lu) size %llu->%llu, in %s",
-					 e->inum, file->ino.size,
+				dbg_fsck("update file(%llu) size %llu->%llu, in %s",
+					 (unsigned long long)e->inum,
+					 file->ino.size,
 					 (unsigned long long)e->d_size,
 					 c->dev_name);
 				file->ino.size = e->d_size;
diff --git a/ubifs-utils/fsck.ubifs/extract_files.c b/ubifs-utils/fsck.ubifs/extract_files.c
index 000ef5d..2bbcc86 100644
--- a/ubifs-utils/fsck.ubifs/extract_files.c
+++ b/ubifs-utils/fsck.ubifs/extract_files.c
@@ -77,22 +77,22 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 
 	if (!inum || inum > INUM_WATERMARK) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node(bad inum %lu) at %d:%d, in %s",
-				 inum, lnum, offs, c->dev_name);
+			dbg_fsck("bad inode node(bad inum %llu) at %d:%d, in %s",
+				 (unsigned long long)inum, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node(bad inum %lu) at %d:%d",
-				inum, lnum, offs);
+			log_out(c, "bad inode node(bad inum %llu) at %d:%d",
+				(unsigned long long)inum, lnum, offs);
 		goto out;
 	}
 
 	if (ch->node_type != key_type(c, key)) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
-				 inum, ch->node_type, key_type(c, key),
+			dbg_fsck("bad inode node %llu(inconsistent node type %d vs key_type %d) at %d:%d, in %s",
+				 (unsigned long long)inum, ch->node_type, key_type(c, key),
 				 lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(inconsistent node type %d vs key_type %d) at %d:%d",
-				inum, ch->node_type, key_type(c, key),
+			log_out(c, "bad inode node %llu(inconsistent node type %d vs key_type %d) at %d:%d",
+				(unsigned long long)inum, ch->node_type, key_type(c, key),
 				lnum, offs);
 		goto out;
 	}
@@ -113,99 +113,99 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 
 	if (inum == UBIFS_ROOT_INO && !S_ISDIR(ino_node->mode)) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d, in %s",
-				 inum, ino_node->mode & S_IFMT, lnum, offs,
+			dbg_fsck("bad inode node %llu(root inode is not dir, tyoe %u) at %d:%d, in %s",
+				 (unsigned long long)inum, ino_node->mode & S_IFMT, lnum, offs,
 				 c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(root inode is not dir, tyoe %u) at %d:%d",
-				inum, ino_node->mode & S_IFMT, lnum, offs);
+			log_out(c, "bad inode node %llu(root inode is not dir, tyoe %u) at %d:%d",
+				(unsigned long long)inum, ino_node->mode & S_IFMT, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->size > c->max_inode_sz) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(size %llu is too large) at %d:%d, in %s",
-				 inum, ino_node->size, lnum, offs, c->dev_name);
+			dbg_fsck("bad inode node %llu(size %llu is too large) at %d:%d, in %s",
+				 (unsigned long long)inum, ino_node->size, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(size %llu is too large) at %d:%d",
-				inum, ino_node->size, lnum, offs);
+			log_out(c, "bad inode node %llu(size %llu is too large) at %d:%d",
+				(unsigned long long)inum, ino_node->size, lnum, offs);
 		goto out;
 	}
 
 	if (le16_to_cpu(ino->compr_type) >= UBIFS_COMPR_TYPES_CNT) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(unknown compression type %d) at %d:%d, in %s",
-				 inum, le16_to_cpu(ino->compr_type), lnum, offs,
+			dbg_fsck("bad inode node %llu(unknown compression type %d) at %d:%d, in %s",
+				 (unsigned long long)inum, le16_to_cpu(ino->compr_type), lnum, offs,
 				 c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(unknown compression type %d) at %d:%d",
-				inum, le16_to_cpu(ino->compr_type), lnum, offs);
+			log_out(c, "bad inode node %llu(unknown compression type %d) at %d:%d",
+				(unsigned long long)inum, le16_to_cpu(ino->compr_type), lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->xnms + ino_node->xcnt > XATTR_LIST_MAX) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(too big xnames %u xcount %u) at %d:%d, in %s",
-				 inum, ino_node->xnms, ino_node->xcnt,
+			dbg_fsck("bad inode node %llu(too big xnames %u xcount %u) at %d:%d, in %s",
+				 (unsigned long long)inum, ino_node->xnms, ino_node->xcnt,
 				 lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(too big xnames %u xcount %u) at %d:%d",
-				inum, ino_node->xnms, ino_node->xcnt,
+			log_out(c, "bad inode node %llu(too big xnames %u xcount %u) at %d:%d",
+				(unsigned long long)inum, ino_node->xnms, ino_node->xcnt,
 				lnum, offs);
 		goto out;
 	}
 
 	if (data_len < 0 || data_len > UBIFS_MAX_INO_DATA) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(invalid data len %d) at %d:%d, in %s",
-				 inum, data_len, lnum, offs, c->dev_name);
+			dbg_fsck("bad inode node %llu(invalid data len %d) at %d:%d, in %s",
+				 (unsigned long long)inum, data_len, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(invalid data len %d) at %d:%d",
-				inum, data_len, lnum, offs);
+			log_out(c, "bad inode node %llu(invalid data len %d) at %d:%d",
+				(unsigned long long)inum, data_len, lnum, offs);
 		goto out;
 	}
 
 	if (UBIFS_INO_NODE_SZ + data_len != node_len) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d, in %s",
-				 inum, data_len, node_len, lnum, offs, c->dev_name);
+			dbg_fsck("bad inode node %llu(inconsistent data len %d vs node len %d) at %d:%d, in %s",
+				 (unsigned long long)inum, data_len, node_len, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(inconsistent data len %d vs node len %d) at %d:%d",
-				inum, data_len, node_len, lnum, offs);
+			log_out(c, "bad inode node %llu(inconsistent data len %d vs node len %d) at %d:%d",
+				(unsigned long long)inum, data_len, node_len, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->is_xattr) {
 		if (!S_ISREG(ino_node->mode)) {
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad inode node %lu(bad type %u for xattr) at %d:%d, in %s",
-					 inum, ino_node->mode & S_IFMT,
+				dbg_fsck("bad inode node %llu(bad type %u for xattr) at %d:%d, in %s",
+					 (unsigned long long)inum, ino_node->mode & S_IFMT,
 					 lnum, offs, c->dev_name);
 			else
-				log_out(c, "bad inode node %lu(bad type %u for xattr) at %d:%d",
-					inum, ino_node->mode & S_IFMT,
+				log_out(c, "bad inode node %llu(bad type %u for xattr) at %d:%d",
+					(unsigned long long)inum, ino_node->mode & S_IFMT,
 					lnum, offs);
 			goto out;
 		}
 		if (data_len != ino_node->size) {
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d, in %s",
-					 inum, data_len, ino_node->size,
+				dbg_fsck("bad inode node %llu(inconsistent data_len %d vs size %llu for xattr) at %d:%d, in %s",
+					 (unsigned long long)inum, data_len, ino_node->size,
 					 lnum, offs, c->dev_name);
 			else
-				log_out(c, "bad inode node %lu(inconsistent data_len %d vs size %llu for xattr) at %d:%d",
-					inum, data_len, ino_node->size,
+				log_out(c, "bad inode node %llu(inconsistent data_len %d vs size %llu for xattr) at %d:%d",
+					(unsigned long long)inum, data_len, ino_node->size,
 					lnum, offs);
 			goto out;
 		}
 		if (ino_node->xcnt || ino_node->xsz || ino_node->xnms) {
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d, in %s",
-					 inum, ino_node->xcnt, ino_node->xsz,
+				dbg_fsck("bad inode node %llu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d, in %s",
+					 (unsigned long long)inum, ino_node->xcnt, ino_node->xsz,
 					 ino_node->xnms, lnum, offs, c->dev_name);
 			else
-				log_out(c, "bad inode node %lu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d",
-					inum, ino_node->xcnt, ino_node->xsz,
+				log_out(c, "bad inode node %llu(non zero xattr count %u xattr size %u xattr names %u for xattr) at %d:%d",
+					(unsigned long long)inum, ino_node->xcnt, ino_node->xsz,
 					ino_node->xnms, lnum, offs);
 			goto out;
 		}
@@ -215,22 +215,22 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	case S_IFREG:
 		if (!ino_node->is_xattr && data_len != 0) {
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad inode node %lu(bad data len %d for reg file) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+				dbg_fsck("bad inode node %llu(bad data len %d for reg file) at %d:%d, in %s",
+					 (unsigned long long)inum, data_len, lnum, offs, c->dev_name);
 			else
-				log_out(c, "bad inode node %lu(bad data len %d for reg file) at %d:%d",
-					inum, data_len, lnum, offs);
+				log_out(c, "bad inode node %llu(bad data len %d for reg file) at %d:%d",
+					(unsigned long long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
 	case S_IFDIR:
 		if (data_len != 0) {
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad inode node %lu(bad data len %d for dir file) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+				dbg_fsck("bad inode node %llu(bad data len %d for dir file) at %d:%d, in %s",
+					 (unsigned long long)inum, data_len, lnum, offs, c->dev_name);
 			else
-				log_out(c, "bad inode node %lu(bad data len %d for dir file) at %d:%d",
-					inum, data_len, lnum, offs);
+				log_out(c, "bad inode node %llu(bad data len %d for dir file) at %d:%d",
+					(unsigned long long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -248,11 +248,11 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 			 * exceptions are found.
 			 */
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad symlink inode node %lu(bad data len %d) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+				dbg_fsck("bad symlink inode node %llu(bad data len %d) at %d:%d, in %s",
+					 (unsigned long long)inum, data_len, lnum, offs, c->dev_name);
 			else
-				log_out(c, "bad symlink inode node %lu(bad data len %d) at %d:%d",
-					inum, data_len, lnum, offs);
+				log_out(c, "bad symlink inode node %llu(bad data len %d) at %d:%d",
+					(unsigned long long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
@@ -265,12 +265,12 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 
 		if (data_len != sz_new && data_len != sz_huge) {
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d, in %s",
-					 inum, data_len, sz_new, sz_huge, lnum,
+				dbg_fsck("bad inode node %llu(bad data len %d for char/block file, expect %d or %d) at %d:%d, in %s",
+					 (unsigned long long)inum, data_len, sz_new, sz_huge, lnum,
 					 offs, c->dev_name);
 			else
-				log_out(c, "bad inode node %lu(bad data len %d for char/block file, expect %d or %d) at %d:%d",
-					inum, data_len, sz_new, sz_huge, lnum,
+				log_out(c, "bad inode node %llu(bad data len %d for char/block file, expect %d or %d) at %d:%d",
+					(unsigned long long)inum, data_len, sz_new, sz_huge, lnum,
 					offs);
 			goto out;
 		}
@@ -281,33 +281,33 @@ bool parse_ino_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	case S_IFIFO:
 		if (data_len != 0) {
 			if (FSCK(c)->mode == REBUILD_MODE)
-				dbg_fsck("bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d, in %s",
-					 inum, data_len, lnum, offs, c->dev_name);
+				dbg_fsck("bad inode node %llu(bad data len %d for fifo/sock file) at %d:%d, in %s",
+					 (unsigned long long)inum, data_len, lnum, offs, c->dev_name);
 			else
-				log_out(c, "bad inode node %lu(bad data len %d for fifo/sock file) at %d:%d",
-					inum, data_len, lnum, offs);
+				log_out(c, "bad inode node %llu(bad data len %d for fifo/sock file) at %d:%d",
+					(unsigned long long)inum, data_len, lnum, offs);
 			goto out;
 		}
 		break;
 	default:
 		/* invalid file type. */
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(unknown type %u) at %d:%d, in %s",
-				 inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
+			dbg_fsck("bad inode node %llu(unknown type %u) at %d:%d, in %s",
+				 (unsigned long long)inum, ino_node->mode & S_IFMT, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(unknown type %u) at %d:%d",
-				inum, ino_node->mode & S_IFMT, lnum, offs);
+			log_out(c, "bad inode node %llu(unknown type %u) at %d:%d",
+				(unsigned long long)inum, ino_node->mode & S_IFMT, lnum, offs);
 		goto out;
 	}
 
 	if (ino_node->is_encrypted && !inode_can_be_encrypted(c, ino_node)) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d, in %s",
-				 inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
+			dbg_fsck("bad inode node %llu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d, in %s",
+				 (unsigned long long)inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
 				 c->encrypted, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad inode node %lu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d",
-				inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
+			log_out(c, "bad inode node %llu(encrypted but cannot be encrypted, type %u, is_xattr %d, fs_encrypted %d) at %d:%d",
+				(unsigned long long)inum, ino_node->mode & S_IFMT, ino_node->is_xattr,
 				c->encrypted, lnum, offs);
 		goto out;
 	}
@@ -355,14 +355,14 @@ bool parse_dent_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	     strnlen((const char *)dent->name, nlen) != nlen) ||
 	    inum > INUM_WATERMARK || key_type != ch->node_type) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d, in %s",
+			dbg_fsck("bad %s node(len %d nlen %d type %d inum %llu key_type %d node_type %d) at %d:%d, in %s",
 				 ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
-				 node_len, nlen, dent->type, inum, key_type,
+				 node_len, nlen, dent->type, (unsigned long long)inum, key_type,
 				 ch->node_type, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad %s node(len %d nlen %d type %d inum %lu key_type %d node_type %d) at %d:%d",
+			log_out(c, "bad %s node(len %d nlen %d type %d inum %llu key_type %d node_type %d) at %d:%d",
 				ch->node_type == UBIFS_XENT_NODE ? "xattr entry" : "directory entry",
-				node_len, nlen, dent->type, inum, key_type,
+				node_len, nlen, dent->type, (unsigned long long)inum, key_type,
 				ch->node_type, lnum, offs);
 		goto out;
 	}
@@ -418,11 +418,11 @@ bool parse_data_node(struct ubifs_info *c, int lnum, int offs, void *node,
 
 	if (!inum || inum > INUM_WATERMARK) {
 		if (FSCK(c)->mode == REBUILD_MODE)
-			dbg_fsck("bad data node(bad inum %lu) at %d:%d, in %s",
-				 inum, lnum, offs, c->dev_name);
+			dbg_fsck("bad data node(bad inum %llu) at %d:%d, in %s",
+				 (unsigned long long)inum, lnum, offs, c->dev_name);
 		else
-			log_out(c, "bad data node(bad inum %lu) at %d:%d",
-				inum, lnum, offs);
+			log_out(c, "bad data node(bad inum %llu) at %d:%d",
+				(unsigned long long)inum, lnum, offs);
 		goto out;
 	}
 
@@ -484,8 +484,8 @@ bool parse_trun_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	ino_t inum = le32_to_cpu(trun->inum);
 
 	if (!inum || inum > INUM_WATERMARK) {
-		dbg_fsck("bad truncation node(bad inum %lu) at %d:%d, in %s",
-			 inum, lnum, offs, c->dev_name);
+		dbg_fsck("bad truncation node(bad inum %llu) at %d:%d, in %s",
+			 (unsigned long long)inum, lnum, offs, c->dev_name);
 		goto out;
 	}
 
@@ -496,8 +496,9 @@ bool parse_trun_node(struct ubifs_info *c, int lnum, int offs, void *node,
 	if (old_size < 0 || old_size > c->max_inode_sz ||
 	    new_size < 0 || new_size > c->max_inode_sz ||
 	    old_size <= new_size) {
-		dbg_fsck("bad truncation node(new size %ld old size %ld inum %lu) at %d:%d, in %s",
-			 new_size, old_size, inum, lnum, offs, c->dev_name);
+		dbg_fsck("bad truncation node(new size %lld old size %lld inum %llu) at %d:%d, in %s",
+			 (long long)new_size, (long long)old_size,
+			 (unsigned long long)inum, lnum, offs, c->dev_name);
 		goto out;
 	}
 
@@ -1007,7 +1008,7 @@ int file_is_valid(struct ubifs_info *c, struct scanned_file *file,
 	struct scanned_data_node *data_node;
 	LIST_HEAD(drop_list);
 
-	dbg_fsck("check validation of file %lu, in %s", file->inum, c->dev_name);
+	dbg_fsck("check validation of file %llu, in %s", (unsigned long long)file->inum, c->dev_name);
 
 	if (!file->ino.header.exist) {
 		handle_invalid_file(c, FILE_HAS_NO_INODE, file, NULL);
@@ -1275,12 +1276,12 @@ retry:
 			handle_invalid_file(c, FILE_IS_DISCONNECTED, file, NULL);
 		else
 			handle_invalid_file(c, FILE_HAS_NO_DENT, file, NULL);
-		dbg_fsck("file %lu is unreachable, in %s", file->inum, c->dev_name);
+		dbg_fsck("file %llu is unreachable, in %s", (unsigned long long)file->inum, c->dev_name);
 		return false;
 	}
 
 reachable:
-	dbg_fsck("file %lu is reachable, in %s", file->inum, c->dev_name);
+	dbg_fsck("file %llu is reachable, in %s", (unsigned long long)file->inum, c->dev_name);
 	return true;
 }
 
@@ -1497,8 +1498,8 @@ static int correct_file_info(struct ubifs_info *c, struct scanned_file *file)
 
 	handle_invalid_file(c, FILE_IS_INCONSISTENT, file, NULL);
 	lnum = file->ino.header.lnum;
-	dbg_fsck("correct file(inum:%lu type:%s), nlink %u->%u, xattr cnt %u->%u, xattr size %u->%u, xattr names %u->%u, size %llu->%llu, at %d:%d, in %s",
-		 file->inum, file->ino.is_xattr ? "xattr" :
+	dbg_fsck("correct file(inum:%llu type:%s), nlink %u->%u, xattr cnt %u->%u, xattr size %u->%u, xattr names %u->%u, size %llu->%llu, at %d:%d, in %s",
+		 (unsigned long long)file->inum, file->ino.is_xattr ? "xattr" :
 		 ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 		 file->ino.nlink, file->calc_nlink,
 		 file->ino.xcnt, file->calc_xcnt,
diff --git a/ubifs-utils/fsck.ubifs/handle_disconnected.c b/ubifs-utils/fsck.ubifs/handle_disconnected.c
index be62522..15fd14e 100644
--- a/ubifs-utils/fsck.ubifs/handle_disconnected.c
+++ b/ubifs-utils/fsck.ubifs/handle_disconnected.c
@@ -117,7 +117,7 @@ static int handle_disonnected_file(struct ubifs_info *c,
 			struct ubifs_inode *target_ui;
 
 			err = snprintf(file_name, sizeof(file_name),
-				       "INO_%lu_%u", file->inum, index);
+				       "INO_%llu_%u", (unsigned long long)file->inum, index);
 			if (err < 0)
 				goto free_ui;
 			fname_name(&nm) = file_name;
@@ -137,8 +137,8 @@ static int handle_disonnected_file(struct ubifs_info *c,
 			err = 0;
 			kfree(ui);
 			kfree(lost_found_ui);
-			log_out(c, "Too many duplicated names(%u) in lost+found for inum %lu",
-				index, file->inum);
+			log_out(c, "Too many duplicated names(%u) in lost+found for inum %llu",
+				index, (unsigned long long)file->inum);
 			goto delete_file;
 		}
 
@@ -149,8 +149,8 @@ static int handle_disonnected_file(struct ubifs_info *c,
 			log_out(c, "No free space to recover disconnected file");
 			goto delete_file;
 		}
-		dbg_fsck("recover disconnected file %lu, in %s",
-			 file->inum, c->dev_name);
+		dbg_fsck("recover disconnected file %llu, in %s",
+			 (unsigned long long)file->inum, c->dev_name);
 
 free_ui:
 		kfree(ui);
diff --git a/ubifs-utils/fsck.ubifs/problem.c b/ubifs-utils/fsck.ubifs/problem.c
index 916c976..bb2fa72 100644
--- a/ubifs-utils/fsck.ubifs/problem.c
+++ b/ubifs-utils/fsck.ubifs/problem.c
@@ -147,7 +147,7 @@ static void print_problem(const struct ubifs_info *c,
 	{
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 
-		log_out(c, "problem: %s, ino %lu", problem->desc, ifp->file->inum);
+		log_out(c, "problem: %s, ino %llu", problem->desc, (unsigned long long)ifp->file->inum);
 		break;
 	}
 	case FILE_HAS_INCONSIST_TYPE:
@@ -155,8 +155,8 @@ static void print_problem(const struct ubifs_info *c,
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 		const struct scanned_dent_node *dent_node = (const struct scanned_dent_node *)ifp->priv;
 
-		log_out(c, "problem: %s, ino %lu, inode type %s%s, dentry %s has type %s%s",
-			problem->desc, ifp->file->inum,
+		log_out(c, "problem: %s, ino %llu, inode type %s%s, dentry %s has type %s%s",
+			problem->desc, (unsigned long long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "",
 			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name,
@@ -170,8 +170,8 @@ static void print_problem(const struct ubifs_info *c,
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 		const struct scanned_dent_node *dent_node = (const struct scanned_dent_node *)ifp->priv;
 
-		log_out(c, "problem: %s, ino %lu, type %s%s, dentry %s",
-			problem->desc, ifp->file->inum,
+		log_out(c, "problem: %s, ino %llu, type %s%s, dentry %s",
+			problem->desc, (unsigned long long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "",
 			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name);
@@ -182,8 +182,8 @@ static void print_problem(const struct ubifs_info *c,
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 		const struct scanned_data_node *data_node = (const struct scanned_data_node *)ifp->priv;
 
-		log_out(c, "problem: %s, ino %lu, type %s%s, data block %u",
-			problem->desc, ifp->file->inum,
+		log_out(c, "problem: %s, ino %llu, type %s%s, data block %u",
+			problem->desc, (unsigned long long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "",
 			key_block(c, &data_node->key));
@@ -197,8 +197,8 @@ static void print_problem(const struct ubifs_info *c,
 	{
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 
-		log_out(c, "problem: %s, ino %lu type %s%s", problem->desc,
-			ifp->file->inum,
+		log_out(c, "problem: %s, ino %llu type %s%s", problem->desc,
+			(unsigned long long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
 			ifp->file->ino.is_xattr ? "(xattr)" : "");
 		break;
@@ -208,10 +208,10 @@ static void print_problem(const struct ubifs_info *c,
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 		const struct scanned_file *host = (const struct scanned_file *)ifp->priv;
 
-		log_out(c, "problem: %s, ino %lu type %s%s, host ino %lu type %s%s",
-			problem->desc, ifp->file->inum,
+		log_out(c, "problem: %s, ino %llu type %s%s, host ino %llu type %s%s",
+			problem->desc, (unsigned long long)ifp->file->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(ifp->file->ino.mode)),
-			ifp->file->ino.is_xattr ? "(xattr)" : "", host->inum,
+			ifp->file->ino.is_xattr ? "(xattr)" : "", (unsigned long long)host->inum,
 			ubifs_get_type_name(ubifs_get_dent_type(host->ino.mode)),
 			host->ino.is_xattr ? "(xattr)" : "");
 		break;
@@ -221,8 +221,8 @@ static void print_problem(const struct ubifs_info *c,
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 		const struct scanned_dent_node *dent_node = (const struct scanned_dent_node *)ifp->priv;
 
-		log_out(c, "problem: %s, ino %lu, unreachable dentry %s, type %s%s",
-			problem->desc, ifp->file->inum,
+		log_out(c, "problem: %s, ino %llu, unreachable dentry %s, type %s%s",
+			problem->desc, (unsigned long long)ifp->file->inum,
 			c->encrypted && !ifp->file->ino.is_xattr ? "<encrypted>" : dent_node->name,
 			ubifs_get_type_name(dent_node->type),
 			key_type(c, &dent_node->key) == UBIFS_XENT_KEY ? "(xattr)" : "");
@@ -233,9 +233,9 @@ static void print_problem(const struct ubifs_info *c,
 		const struct invalid_file_problem *ifp = (const struct invalid_file_problem *)priv;
 		const struct scanned_file *file = ifp->file;
 
-		log_out(c, "problem: %s, ino %lu type %s, nlink %u xcnt %u xsz %u xnms %u size %llu, "
+		log_out(c, "problem: %s, ino %llu type %s, nlink %u xcnt %u xsz %u xnms %u size %llu, "
 			"should be nlink %u xcnt %u xsz %u xnms %u size %llu",
-			problem->desc, file->inum,
+			problem->desc, (unsigned long long)file->inum,
 			file->ino.is_xattr ? "xattr" : ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 			file->ino.nlink, file->ino.xcnt, file->ino.xsz,
 			file->ino.xnms, file->ino.size,
@@ -298,8 +298,8 @@ static void print_problem(const struct ubifs_info *c,
 	{
 		const struct scanned_file *file = (const struct scanned_file *)priv;
 
-		log_out(c, "problem: %s, ino %lu, size %llu", problem->desc,
-			file->inum, file->ino.size);
+		log_out(c, "problem: %s, ino %llu, size %llu", problem->desc,
+			(unsigned long long)file->inum, file->ino.size);
 		break;
 	}
 	default:
diff --git a/ubifs-utils/fsck.ubifs/rebuild_fs.c b/ubifs-utils/fsck.ubifs/rebuild_fs.c
index b82d728..076cbe5 100644
--- a/ubifs-utils/fsck.ubifs/rebuild_fs.c
+++ b/ubifs-utils/fsck.ubifs/rebuild_fs.c
@@ -696,8 +696,8 @@ static void extract_dentry_tree(struct ubifs_info *c)
 	while (!list_empty(&unreachable)) {
 		file = list_entry(unreachable.next, struct scanned_file, list);
 
-		dbg_fsck("remove unreachable file %lu, in %s",
-			 file->inum, c->dev_name);
+		dbg_fsck("remove unreachable file %llu, in %s",
+			 (unsigned long long)file->inum, c->dev_name);
 		list_del(&file->list);
 		destroy_file_content(c, file);
 		rb_erase(&file->rb, tree);
@@ -1096,8 +1096,8 @@ static int record_file_used_lebs(struct ubifs_info *c,
 	struct scanned_dent_node *dent_node;
 	struct scanned_data_node *data_node;
 
-	dbg_fsck("recovered file(inum:%lu name:%s type:%s), in %s",
-		 file->inum, get_file_name(c, file),
+	dbg_fsck("recovered file(inum:%llu name:%s type:%s), in %s",
+		 (unsigned long long)file->inum, get_file_name(c, file),
 		 file->ino.is_xattr ? "xattr" :
 		 ubifs_get_type_name(ubifs_get_dent_type(file->ino.mode)),
 		 c->dev_name);
diff --git a/ubifs-utils/libubifs/dir.c b/ubifs-utils/libubifs/dir.c
index 89f77eb..50cb818 100644
--- a/ubifs-utils/libubifs/dir.c
+++ b/ubifs-utils/libubifs/dir.c
@@ -248,8 +248,8 @@ int ubifs_mkdir(struct ubifs_info *c, struct ubifs_inode *dir_ui,
 	 * Budget request settings: new inode, new direntry and changing parent
 	 * directory inode.
 	 */
-	dbg_gen("dent '%s', mode %#hx in dir ino %lu",
-		fname_name(nm), mode, dir->inum);
+	dbg_gen("dent '%s', mode %#hx in dir ino %llu",
+		fname_name(nm), mode, (unsigned long long)dir->inum);
 
 	/* New dir is not allowed to be created under an encrypted directory. */
 	ubifs_assert(c, !(dir_ui->flags & UBIFS_CRYPT_FL));
@@ -314,8 +314,8 @@ int ubifs_link_recovery(struct ubifs_info *c, struct ubifs_inode *dir_ui,
 	 * Budget request settings: new direntry, changing the target inode,
 	 * changing the parent inode.
 	 */
-	dbg_gen("dent '%s' to ino %lu (nlink %d) in dir ino %lu",
-		fname_name(nm), inode->inum, inode->nlink, dir->inum);
+	dbg_gen("dent '%s' to ino %llu (nlink %d) in dir ino %llu",
+		fname_name(nm), (unsigned long long)inode->inum, inode->nlink, (unsigned long long)dir->inum);
 
 	/* New dir is not allowed to be created under an encrypted directory. */
 	ubifs_assert(c, !(dir_ui->flags & UBIFS_CRYPT_FL));
-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
