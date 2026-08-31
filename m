Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D6FC624A4
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nuMiKnzAWV+eXyDx4MhvbXJeN20QcMEuroUx0JGaCXI=; b=ikKbptHEizaviu
	heR3EAtTtAFGbypTuJd58pAAXwYZROPwKLHqIlFWEflXzTt8QrgzEv4N0TDgmS5d8Ta6eU8hAhP8l
	M+sLk93t1Oyl5aiQy/RLl0KP8aaCI7CXDXPieD7zwH8kJBXyaTGPNEzJn42i5p/AzG+r9kVSwjudC
	d95bsDt3PGFdc1u745FBYPv4QALHq29bnPxYrcVnLCPjR2cvPkfp6yo2lNe4So2N6wqjw78VbY+aH
	mgKbuEd20OuLsorv97k3u7ANejx1XGW1XbNFJpFA3Xx6OvGAYg+DjlNe2H3OWR0iOJkzRI7IVVs+s
	So9MYOMqHz5DVyVzARgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x144T-00000009t8w-47MC;
	Mon, 31 Aug 2026 15:37:17 +0000
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x144R-00000009t7V-1uJd
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 15:37:16 +0000
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VEUkZr1171148;
	Mon, 31 Aug 2026 11:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=M//jmkfvpJmV0kjxy6VWQnEJxqV
	peHSEwzB6m9SVSY8=; b=YH4WNSVAnGBT3ZwKW9Yfk2ttD2RVLPrDe/w7ZNmo4li
	kp/4ebct1PnczazI+7ge+cVNwyB7hDYgqqAFHKbE5brhq3+xX2RfDIjAF9ZX/ao8
	nUnyTpekz8gBvnvIhhFB9HrwukzDRovmyHkwMfSzX1F1f4DXXAdzHa5JVd6cTSFZ
	ClfViTKkGimUtNMYPDazR22/PnSkoq3RiAfzVtSEfsZxf4VsH3CFhTQO6auVvRMa
	gOJoJxuFKzFN/bD4kUfM4Mq6rSs/OTLjAJhM5eW9olrj8feFYhTyOvd3/Vk4B+my
	4JIRHNCp2fILTayUtnJGeGJDPfeQg3GrDvusiqS7MAQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gcg1hv04x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 11:37:12 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upFlm76YRHaJj5bLc/bZAPZeT9856E62mWdYrzOKkJdap7+hukzFC9sRo0wJN428z6pS8YxjuaOrj+X8t7StNqpW3/Z7+60FFnNbBvDsIRlbZNWmo7M/vJ5XQn4xP5o30w9631yXhzOpcRwDjgFJKXTAzTgDiVT3SZSKPSV7QkLDayMrFbJzkZD1toz3+FKA9Vpo3d8Hf0tyjLB8KZzmZ0eXYBUDIuKFZptjvEhS1Qs2XN6AR9NT9xGOlbDQhF4YcepXdDqCKSruhsVpFZ3l23AjiireDla2gRlJ6yPfhrsybqdHOwbVGg46wQxKbT3gZvIeVUZ+gv0RdIHr3z0dpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M//jmkfvpJmV0kjxy6VWQnEJxqVpeHSEwzB6m9SVSY8=;
 b=QC019/G/L0qORHOQNh/xQVfLNHAnFOtZTd0f5xsbE2YPR8e5gGX25zr9/cI6JI03tOA4d8oEiZbl9bBbg+5A1Rxw0WWuqxdvLFxeTjuLP5TrwIk6l/rn1d7QTcCNu85/MLKNWH/p+zL+rjwoik6UP9Ret4KgCUWtUYef0+CamtjTTFxa/lKFnXUmmho/qyDwezb2BCsRBW4BjHcVzTebeb125QAc0Ahjb5KHbaZVdXYuNQiPepwvYowZUh6i7OhZT6hvXXtHoH0aRg1oLtzSIcy8WDYsXeU2LYLWvAQmX7CSUf4rrchOeJL1qP4WZHDo8GtUh95FRqygF13UR6K83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by LV3PR03MB7478.namprd03.prod.outlook.com (2603:10b6:408:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:37:08 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:37:05 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Mon, 31 Aug 2026 16:38:10 +0100
Subject: [PATCH] mtd: spinand: winbond: Add support for W25N08LW
Message-Id: <20260831-mtd-nand-new-chip-support-v1-1-dca9f63ac0f9@analog.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQxKilVykuNI46QmPIxLYg3
 r2pbh58i/fvIBSZBB7FDpHeLLz6DH0rwM2dnwh5yAajTK3upcZXGtB3Pg990M0cULYQ1pjQ2l6
 rumqMLUfI/xBp5O/ZfraXZesXcukfhOP4AWXu99R9AAAA
X-Change-ID: 20260831-mtd-nand-new-chip-support-44b10657243f
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788190697; l=2911;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=pi9UtUhk8EQ2zveaQnzXFf1atnwdopjIBLA/MzzofPs=;
 b=RIqPpbwyG67Ku0x9RcXDxcgCvrl4rmsr5VouVHj2LSeFRpy2WqC42bWjN0KRLAlVbz7/dgIhz
 /J2VZsoO/TxD1+gzHOvjp5bh+S/lTEvkr9vkj5XFvCzVRIzEoslefK0
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0186.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::15) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|LV3PR03MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 7732d856-3bda-4c2d-9786-08df0775b55b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|10067099003|6133799003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: SkCBqP6g+FGT3qqAtFFAkNzo1OnmkdcgAqbXDJhF9uNarrTwnZlVbfXeTmRM7p3UInvC04R7eqFWjp64P2n/GzXs5gmKoB2me6p5q9AvcuPCEdsO8rSEIy2H3MIKn/kM9TRg7csNspYbJGSnOlTCC4ekZ5zLi8P+jwbiZ/Zj3Ho89YGXZmbeSkrkGiRBpthGGpsgxYg52FZyYhAEivf+fxidqvHTg/hefLPzVYBgOLzQp2XTab7cOb5v2fjZVm71f+d6FxR2wdxO+bYDFUNis1JE2RzlqhzgvhNgjn9rls+Iwr7RlyJDpTfl2E4IQVqn9fZiaGheiXimqf8eoo0FPKHC6uIcrHtnpVeSux+OKjBFGmgqS1G26mBc+ma0TEyi9wVMgeLvh8FkPu2q7tvVJ3r9Mb41NfkjRwWmnplBNcUZ7hIXaXG3tiER5TSEz68yifmzTCXzriyCXAW39QOM6Hsk8GMiX/qj1xAVNDzY7fyPyOnTZaJ04ZRkQ6RmOK+YQIvbDEYsXCA/dGFi/o5+k0SMCw/37LpOoiAGJtYcmAm+WEXl7f/QmWn/lCw5zxdyWHm4RkIPUCIjaDnOqoBrO58ykgN5xTPAjO2qJTtzGM38+vu+/8T/fXOPoc+TH7rQ1XxmChBOO8ENdu1F3pWUbjDS80fKNZRJoxytW3j3MXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(10067099003)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUpNdFo2S1hVTko0NWRpbHE4ZjdPbTNUOUFUSktRNUtRMHpjZnl2UlZhZDE1?=
 =?utf-8?B?dzhQVklvMzFaUGFQamo3YzVnVjdPQ2pxcXEwbUt3U2x3ME1XbVdKZ2puMFd2?=
 =?utf-8?B?UUlZWU56MXNjZDZMT1pnRHR4RGNPdkZ0cnVNL1RhUlZJYnJSRVc2NUdyc1VS?=
 =?utf-8?B?OGltZmtFOVp6S1ZRSnFOMTdmdTl6akQ4V2RLcWYyb29ENDIxbXVCR3E5ZHhY?=
 =?utf-8?B?V0ZLcEpJREk1Uis0N0VsVk9SUnZLQ0FIdDNORFpNUFduOWQrR0U2eU5vd1ll?=
 =?utf-8?B?ZVhRMVQvSXhOOHBCT2FtUHpDTU5xeWdsWXc2SjZpTS9QZS9ZTkIweHZVeSs5?=
 =?utf-8?B?RnIwd1gvbXJKbEZjcUpQWGU4cjdiTnVvbEs5a2t3WUU4NWk4VE9qTXV5TkJB?=
 =?utf-8?B?SUhvcU9IcjNqUmJ0L0llamw0dHZtU0w1SFZTaUkvZVo2Wkg0WTltSVFrNGFz?=
 =?utf-8?B?YjZwZGk5Ky9FWGNVd2c2UjBJdnpsQmUyaGJ0ME01SzAwVzEwYm14R09EeXRI?=
 =?utf-8?B?YUNoN0lCZ0ZMaFF2dVRHKzd2c0hSNG56NXhzcFVhd0hkdURRcUZ3T1l4NWdu?=
 =?utf-8?B?cFdIZi9xcmhWRHFRUnNMM2VSWEh1anRmR2JpeTJ3VXlTWHdTQzE1SmdFdHQv?=
 =?utf-8?B?Uy9iRjNWdm02b0xDSmF5c3h6elI5NTAwY1RMam5INEdTWGJJSlR6TllhRlJP?=
 =?utf-8?B?SmU0bThwR092VW1EOVFzUzkraFRheEtvbUlQQU1RMEk1ZjMvWTdwRzdQc3Yw?=
 =?utf-8?B?d1RqczBaTVBmeWpGd3Q3MG5WcmZJUnNCeGdXanI0aWpLaFE0TGNzZ0dRMXBU?=
 =?utf-8?B?bmNiSDlnMjVpRXZsVjY5aC9ZT1BoWnFHaVltVytoUW0rdjZFclNXMUJhS1ZT?=
 =?utf-8?B?YjBsRDBkdERhYkRSYnJZdFhtR1JhZzhDTHBBQ2M0SHk5OVF1TFJJM2piRWs0?=
 =?utf-8?B?a2phU05NUkh6NUlET1I2d2h0bUVKNVFaR2ZzVEZhL2tZVDlnazBPamVZNXIx?=
 =?utf-8?B?eW9pZTc0blNNUE02MTdGTnNQa205NThIcWEraDgrdE03dGx6ZWtTOWxGUUJX?=
 =?utf-8?B?Y1ovYXlmTmpWREMraEIxS2hNNi9LMlBlTTRUZG96UEtZeXhsS0VabHJDcUZG?=
 =?utf-8?B?SEZNbE5RSHdTcjYyWG9RenVnRHpLTGhMNTJOU2NrUzd6STh4Z1EyMEFzcVBF?=
 =?utf-8?B?d2NQdmhiZ0kreDdVaVU4S05IbG1sOXBKMTBkby9nVDVzenFnYTZ1dEpaSXNn?=
 =?utf-8?B?Ukd3NGVVSzl2VVFRUzk0RTFMZE95bFl4MkVyckR2REVIdHBta3k3U0R5bXBL?=
 =?utf-8?B?R2NtRkxBWFdTMlY4MHhpSTU5RGljT0JOUzR1OFdMTUY0RXZlZ09jbkZ3NDc5?=
 =?utf-8?B?b3BHUHNvZUVTc1l2WFc1VW1FQnBSK0VrZURlWnJjYjVneUQ3N1dIZWxPOVo0?=
 =?utf-8?B?YWk2cTdwenRrNFhNYzU1aXM1NkxCR0Z6a2NmZWl2Sm5vdVNzR3p6OGpwVjVm?=
 =?utf-8?B?dDF2aEtGYk13UVQ4N2NiUHJuN3NzaHV5eDFHdFZEZWp3LzI0VDl6OENOaVEr?=
 =?utf-8?B?eENUS2lvV2VzRkxCVFd6MkFFSjBJQ3JYNTlvaTFZaGY4UUZGWnE4RWQ4Y0tn?=
 =?utf-8?B?NkF4dnpaWXgzYjI0N21KRlFZT0RENG1XU0M1OGRYQVgzS1VsQXBMV1pIejZC?=
 =?utf-8?B?c1lyUUp4d3haNjJhMWk0UTczOW1FYzVhWTQ4dUNTWDNLY3JhVG5iaC8yVFNm?=
 =?utf-8?B?ZmNsNlZpZFNiSzh4bi9EWlBodktpbFhzUTJFOXZYL2JCZnJ2b0Nudm5jSzM5?=
 =?utf-8?B?c0FpZGZJczZaWGhrM1BFUjJuN3JiZCs3b3Z0c0F3bnVtUlBWcFJPdFFKVUdh?=
 =?utf-8?B?TE0xTjJvRk9FZy9wZ1ltb0FFajc4NlVjdjVaUVN3dll4SExoR1A5R2FxZnhQ?=
 =?utf-8?B?QUVmbmg4SExSSzNoRC94RHZHdkM4bFhQMmNVcHdiSGRqcVh5ZWJmU21oYVJX?=
 =?utf-8?B?MFc5LzI3N3hidEVKZUZyZU1xS2FUTk9RWXNYNm1hUmN6WEFLNlhnNDFwU2tY?=
 =?utf-8?B?YjFzSm5oSzBPeHJsdVcrNXRoa3l0T2ZjN1lOQTMvcStYMnJ5QUV1WW4rZWRp?=
 =?utf-8?B?Z1JBdW1CQk4wOVdUZDBlUW05OTBZQTJMdHUwVTQ5ZW93bjliVVZoSEx1ek5o?=
 =?utf-8?B?dE82QUlnTVZBaUdvODk3aEE3KzVMMU8vb09vcUt3TmwwVjdKT2dWN09nL1Fo?=
 =?utf-8?B?aEI2WitZM1dWQU5QZ2pGcnNzZUZKYkFOcSt1RnZjNWJZTmZVekRkRHdPVDBD?=
 =?utf-8?B?bVpNMUE2V2pQUkgwZ0R3c1JXSnluaGI4QkdmTk95a0VDUnFaZEY3Zz09?=
X-Exchange-RoutingPolicyChecked: wOCUQIBv72+mexLWKCotUnHsyfc6kKadJN2g58mHBVJ1XyEdwtBEeWcWUhBT0RZxBXRzCTwjhYPZQgftUG+7HOl79njheXbAVJd3Ox+/K0JEub0P7A9abA4imtOgJY11TRLo7aeNuGzhiMwewZLFJDMohcRJoZvnIPzECe/fa9C+uZ/LH/2pdImumncsqDKs/wD6fhx0wPQaR/VmrV1ghOq1zWHf2AQTC2EIwT4PlsIEVkJk3Kcop8JdXlllIdvmzaUYoEL17gEjArhQOiUHV29wzwzKRuh/LtBA24USnIphHUVvoK9GDczj4XnKRvv8uYZ/br6j5KQOjjd6DwjcvQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7732d856-3bda-4c2d-9786-08df0775b55b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:37:05.5559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L04bLzg2mpg01bK1EW59xAaLfycD5uHzcK8xlHfR5SoFF6quYi0PiDJprmFmYLaa+jQsfGOPTGDvm3SJ7FY/Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7478
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzNCBTYWx0ZWRfXw6dg52QniEdj
 IblkO3GM9NNnJ871aJa+n5OpzUO+A1rN04lwcPDuKC8mbcKiE4Kvgeyv176cNfeAgZlsJMxnx1c
 OMsCUrJ7KwycpI6GkyAeMPrwYEfHeBjYZRMaOVd6/pLjwx+R85Vx4YjUpoAbjXoipNDkyQnGNAy
 UY4QFi2ESNDZXQkAAphoFXPJsywN9NHzFtK5DX+ZZ3Pug08TPUbvhPug7LPwVOJtkofnMEk2Ieu
 qQH80JxHgSzfabBRjI8bjjxR90qRqxhVtoBBd3jR0NvAI1QhVV777MADsN2gZLavAQHofD9wepg
 Xijy4iJrKMAZafMQp+kUxRbnX+IlZ4xo7pVpPVin7TSyBfvkNrKORKxVQ2DjH6MAiyckAbohOx0
 JSnL8hiLqgwLl0kUqV5R6B3dxpagH9c6IU+xUS3HGH5xzYD7/sNcdJ5Zt4mY8AG65G9ZzLF8fAw
 X7/GV95bFor3uhZNnEg==
X-Proofpoint-ORIG-GUID: ttyH8liuH-qiH-28T5AgsnhFxM6PD07P
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzNCBTYWx0ZWRfXydmkVUUZfJi6
 Lxzgu8/hGRK27MAAijdKCkRsglpWT5LMJQ3xgeGfpMZ33NEkrUARMNsu2W8CGDdWnDHceugX4l3
 S/nIaW+h+vmxCXeWKiM2lUyup6Z6sR+OpyB/IuU9ujxlpMyAY90I
X-Proofpoint-GUID: ttyH8liuH-qiH-28T5AgsnhFxM6PD07P
X-Authority-Analysis: v=2.4 cv=fLkJG5ae c=1 sm=1 tr=0 ts=6a959fa8 cx=c_pps
 a=sZdM9mINdKJOQAUOT6RFRA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=gAnH3GRIAAAA:8 a=wHVnpBTryfs8O6wbBPcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_083715_617582_699DE638 
X-CRM114-Status: GOOD (  14.35  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBXMjVOMDhMVywgYSAxLjhWIDhHYml0IFNQSS1OQU5EIG1hZGUg
b2YgdHdvCjRHYml0IExVTnMsIHdpdGggNDA5Ni1ieXRlIHBhZ2VzIGFuZCAyNTYgYnl0ZXMgb2Yg
c3BhcmUgYXJlYS4KClRoZSBjaGlwIHJldXNlcyB0aGUgS1YgRUNDIHN0YXR1cyBoZWxwZXIsIGJ1
dCBuZWVkcyBpdHMgb3duIE9PQgpsYXlvdXQgYmVjYXVzZSB0aGUgZ2VvbWV0cnkgb2YgaXRzIHNw
YXJlIGFyZWEgZGlmZmVycyBmcm9tIHRoZQpleGlzdGluZyBXaW5ib25kIHBhcnRzLiBPbmx5IGhh
bGYgb2YgaXQgaXMgdmlzaWJsZSB3aGlsZSB0aGUKaW50ZXJuYWwgRUNDIGlzIGVuYWJsZWQsIHNv
IHRoZSBFQ0MgcmVnaW9uIGlzIHJlcG9ydGVkIGFzCmluYWNjZXNzaWJsZSBhbmQganVzdCB0aGUg
ZnJlZSBieXRlcyBhcmUgZXhwb3NlZC4KCkFzc2lzdGVkLWJ5OiBDbGF1ZGU6T3B1cy01ClNpZ25l
ZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Ci0tLQogZHJpdmVycy9tdGQv
bmFuZC9zcGkvd2luYm9uZC5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbXRkL25hbmQvc3BpL3dpbmJvbmQuYyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dp
bmJvbmQuYwppbmRleCA5Yjc4YzFlNmNiYzkuLmMyYzRjYzMwNmYwNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9zcGkvd2luYm9uZC5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvc3BpL3dp
bmJvbmQuYwpAQCAtMzQ1LDYgKzM0NSw0MSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10ZF9vb2Js
YXlvdXRfb3BzIHcyNW4wMmt2X29vYmxheW91dCA9IHsKIAkuZnJlZSA9IHcyNW4wMmt2X29vYmxh
eW91dF9mcmVlLAogfTsKIAorc3RhdGljIGludCB3MjVuMDhsd19vb2JsYXlvdXRfZWNjKHN0cnVj
dCBtdGRfaW5mbyAqbXRkLCBpbnQgc2VjdGlvbiwKKwkJCQkgIHN0cnVjdCBtdGRfb29iX3JlZ2lv
biAqcmVnaW9uKQoreworCS8qCisJICogV2l0aCBlY2MgZW5hYmxlZCB0aGUgcGFyaXR5IGJpdHMg
YXJlIG5vdCBhY2Nlc3NpYmxlLiBTbyB3ZSBjYW4KKwkgKiBvbmx5IHNlZSBwYWdlICsgMTI4LiBX
aXRob3V0IGVjYyB0aGUgZnVsbCBwYWdlICsgMjU2IGlzIGFjY2Vzc2libGUuCisJICogVG8gbWFr
ZSBpdCBzaW1wbGUganVzdCByZXR1cm4gdGhlIGFyZWEgYXMgbm90IGFjY2Vzc2libGUuCisJICov
CisJcmV0dXJuIC1FUkFOR0U7Cit9CisKK3N0YXRpYyBpbnQgdzI1bjA4bHdfb29ibGF5b3V0X2Zy
ZWUoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAorCQkJCSAgIHN0cnVjdCBtdGRf
b29iX3JlZ2lvbiAqcmVnaW9uKQoreworCWlmIChzZWN0aW9uID4gNykKKwkJcmV0dXJuIC1FUkFO
R0U7CisKKwlyZWdpb24tPm9mZnNldCA9ICgxNiAqIHNlY3Rpb24pOworCS8qIE5vdGUgdGhhdCB3
ZSBpbmNsdWRlIFVzZXIgRGF0YSAyIHdoaWNoIGlzIG5vdCBwcm90ZWN0ZWQgYnkgRUNDICovCisJ
cmVnaW9uLT5sZW5ndGggPSAxNjsKKworCS8qIEV4dHJhY3QgQkJNICovCisJaWYgKCFzZWN0aW9u
KSB7CisJCXJlZ2lvbi0+b2Zmc2V0ICs9IDI7CisJCXJlZ2lvbi0+bGVuZ3RoIC09IDI7CisJfQor
CisJcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRkX29vYmxheW91dF9vcHMg
dzI1bjA4bHdfb29ibGF5b3V0ID0geworCS5lY2MgPSB3MjVuMDhsd19vb2JsYXlvdXRfZWNjLAor
CS5mcmVlID0gdzI1bjA4bHdfb29ibGF5b3V0X2ZyZWUsCit9OworCiBzdGF0aWMgaW50IHcyNW4w
MWp3X29vYmxheW91dF9lY2Moc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBzZWN0aW9uLAogCQkJ
CSAgc3RydWN0IG10ZF9vb2JfcmVnaW9uICpyZWdpb24pCiB7CkBAIC03ODEsNiArODE2LDE2IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIHdpbmJvbmRfc3BpbmFuZF90YWJsZVtd
ID0gewogCQkgICAgIFNQSU5BTkRfRUNDSU5GTygmdzM1bjAxandfb29ibGF5b3V0LCB3MjV3MzVu
eHhqd19lY2NfZ2V0X3N0YXR1cyksCiAJCSAgICAgU1BJTkFORF9DT05GSUdVUkVfQ0hJUCh3MzVu
MHhqd192Y3JfY2ZnKSwKIAkJICAgICBTUElOQU5EX0NPTlRfUkVBRCh3MzVuMHhqd19zZXRfY29u
dF9yZWFkKSksCisJLyogOEctYml0IGRlbnNpdGllcyAqLworCVNQSU5BTkRfSU5GTygiVzI1TjA4
TFciLCAvKiAyeDRHLWJpdCAxLjhWICovCisJCSAgICAgU1BJTkFORF9JRChTUElOQU5EX1JFQURJ
RF9NRVRIT0RfT1BDT0RFX0RVTU1ZLCAweGIzLCAweDI0KSwKKwkJICAgICBOQU5EX01FTU9SRygx
LCA0MDk2LCAyNTYsIDY0LCAyMDQ4LCA0MCwgMSwgMiwgMSksCisJCSAgICAgTkFORF9FQ0NSRVEo
OCwgNTEyKSwKKwkJICAgICBTUElOQU5EX0lORk9fT1BfVkFSSUFOVFMoJnJlYWRfY2FjaGVfdmFy
aWFudHMsCisJCQkJCSAgICAgICZ3cml0ZV9jYWNoZV92YXJpYW50cywKKwkJCQkJICAgICAgJnVw
ZGF0ZV9jYWNoZV92YXJpYW50cyksCisJCSAgICAgMCwKKwkJICAgICBTUElOQU5EX0VDQ0lORk8o
JncyNW4wOGx3X29vYmxheW91dCwgdzI1bjAya3ZfZWNjX2dldF9zdGF0dXMpKSwKIH07CiAKIHN0
YXRpYyBpbnQgd2luYm9uZF9zcGluYW5kX2luaXQoc3RydWN0IHNwaW5hbmRfZGV2aWNlICpzcGlu
YW5kKQoKLS0tCmJhc2UtY29tbWl0OiAxNWEzY2JjZTMyOTk0MTQxMjUyYmI0ZWNmZTNmZjNhNWQy
MmQwYjRmCmNoYW5nZS1pZDogMjAyNjA4MzEtbXRkLW5hbmQtbmV3LWNoaXAtc3VwcG9ydC00NGIx
MDY1NzI0M2YKLS0KClRoYW5rcyEKLSBOdW5vIFPDoQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
