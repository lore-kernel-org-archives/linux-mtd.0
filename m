Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22EBCCD1AB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/AK7fKs34XweYeoruXyp2YVLyEtEC53p8NhjR8T/C8=; b=MXRJ5DzMF1PgZyfwrvVIOHuwgu
	btM6pUbYF+4MSPw81/CXg0MQRq9x7hgw3fbKl+molEZHCEcjZn1wBQRQx2A6odxOMdOw/2dY0XqxT
	faxjZ053FGLE93aj72GtL6028u4M6xTz7JhqQepJgjP7S7IDpHC0axRg7SZJEkFq/+zCAEpfd6f6P
	9/R0abghRFO3lXoA39lBpbIcMwhslptFd4UBYkiygL96UhzH8evp7XLJ/Ox/d88MU+SlMGAnWgRff
	mQ8xh/FgE9zePLgcaDdB29ujmtdugYTlvUmVLUojFbArbdjlZF8kDbpWea2pQottxSo2LXmqgZLFq
	jNPR6qDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEON-00000008v6H-2QdX;
	Fri, 24 Oct 2025 09:47:27 +0000
Received: from mail-westus3azon11012055.outbound.protection.outlook.com ([40.107.209.55] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEOK-00000008v2o-2l9v
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 09:47:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQeLJ8q36CEkqIH2pGSBmZlQgBsanBnkuBtKOrmE7u3vmG3iqXRoB5S5JQVp7B1wBe3EPqDd+M6B64Wa9bxIm+mECiDhwQdMIgldqemSZi7P1lC2OKYrS2T46drrpdMx6Pl3CxIi80HliZ2hb6UjPjZOYQXY5KFmivjuqrG+p4LU0BW3Guv0S1Dklg3G+WwV555kLcGrBGluNXOvAIb4dPC3Zyu+zc4eZScFMI4EjS9pq+/ShBbCUfOJCwllZnotffYNpyTrcoeV3ZTL0NLzLd07rbFcniY/f9JJzG/k5jGBIge6GwqboD14kDzTvukOcFToJcwV8QUiAdrBr1lDrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RBSYfsut+4CHVOcJ9DnetNjBHO64Z+AhqhuIxnjx8s=;
 b=yOkv9bQrBqd5N4GIGrK56H7DmRvht1Axe1ox+GAtaeT6dCrNQLq7vOzc+aWzZtQ5SLmF0YKr0Gasy/1AMYrj72JCDue1LT2SBrz0lGQtQTJaLA2t+RtgHp52hokKzZFrwsbuK5tEE+9YEVITFG+aH/kvP7m3fDDANmNfZkok0vCiZMfZriXIVXY8/Ucag7m/XBc0LEl/rhryVURfmL2cgtnB4SIK7AbYtiubeJMkREwhSSGsFfDhsd2xtSC0RlTv4Ec7lZJXXNU4LaPlJTGBLZhXyV8Tw6UAzlz3wj94VHlK7Lf49VYN0RLNVU3nMDsM7T78A4Yk2EWs7HWd/4akBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RBSYfsut+4CHVOcJ9DnetNjBHO64Z+AhqhuIxnjx8s=;
 b=YE/LxfN/29iZGsJKRdcFhs3eGUSz8z0p+8pcvw4kHkAikrmD+u6e2pb1xkwU3+m+q/hGmb5FlqZHChlSvSkE1wO0q9ntcc5lB6aAFj3jLZsHw0k60IBpBYuFjnlvP8XtG+Usq1uhQ4MVIw8JnInvGUg7xuqaZnPyFi8yzROvpMCZgKMsigpJGWOXrGMJ28ahzNgZ0FKY3raK5jRpgnOf80NE7R24u2yzTqH/XVnTI8OLLIcCozvTT9MtvxDJAiSVmMqUJcU4CuUMg1CsssMjHFpakYGbuejGHm9HTbmI/BWvkuEyacIx/mKFMk4rbWZmjou5vgxTSDYo46RT1PNKUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BL1PR03MB6037.namprd03.prod.outlook.com (2603:10b6:208:309::10)
 by BY5PR03MB5078.namprd03.prod.outlook.com (2603:10b6:a03:1e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:47:18 +0000
Received: from BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1]) by BL1PR03MB6037.namprd03.prod.outlook.com
 ([fe80::9413:f1a2:1d92:93f1%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:47:18 +0000
Message-ID: <4a6577ff-7417-4d34-a683-2402736fd9d7@altera.com>
Date: Fri, 24 Oct 2025 17:47:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: cadence: Add support for NV-DDR interface
 mode
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251024071306.242227-1-niravkumarlaxmidas.rabara@altera.com>
 <87bjlwrbqd.fsf@bootlin.com>
Content-Language: en-US
From: Niravkumar L Rabara <niravkumarlaxmidas.rabara@altera.com>
In-Reply-To: <87bjlwrbqd.fsf@bootlin.com>
X-ClientProxiedBy: KU0P306CA0059.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:23::12) To BL1PR03MB6037.namprd03.prod.outlook.com
 (2603:10b6:208:309::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR03MB6037:EE_|BY5PR03MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: d954fa3a-5ab2-4924-e55b-08de12e25202
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clNJdGlseHUyUnJJNXdWVm9wNmxhbGwzdXZRTnFrNTB2MXNEUFFJWE1LbzBa?=
 =?utf-8?B?VWxMSkVTZ3RxSVhLTlVtMlJ3YldvaU95SWlIS0E4dXFJQVZ5V1NVT1lkNUsx?=
 =?utf-8?B?WGVGSWlVRGwzNlVQSTd6TStRRlY3L0Q2VHFKbW9YQjBqTkkxcnQ3ZzNlUUp0?=
 =?utf-8?B?dGM5MUllYXN6TkJHWWF4elhJTFlJZ1JpdEd2YXF2VzNtdmJIaVgyODNTTDJY?=
 =?utf-8?B?RFViaWVpRjdHcitsSFBLeTJtU2ROQ1kxeVFMSEd0TmVnSFBTNGZxeGk1emJ0?=
 =?utf-8?B?QllTNS96T2FvREhDOXBCRE9vbDJ1cEMrNVlBem5EQldOS2t5ZEdFY1NTNXk3?=
 =?utf-8?B?RHdQVTN3a0JySTlmRTBWZ0JxRmVLazd5YXBJa3hockMzbWVmeXRlZnFlNEl5?=
 =?utf-8?B?UmZXWnl1cC9HOGtGYk9mY3p6QklsMjRESnl1NGJnY1BsZEdwektrWGNmci9z?=
 =?utf-8?B?ZmZMblRoV0NJbGJHcG94UTlUdDRqZE96bnBveGgrUG8vSUJ0V0pLdHVLckda?=
 =?utf-8?B?MW53VVRtVS92L2cvODZteTdLa3pFQlFEMWk5eEtRWVpTSG9sTkswZitpd3Bo?=
 =?utf-8?B?R29jNnd3eXphUjc4WXBvMzJqSU05SGJRQjZVR2NCcS85YkVBdnBWL3FkT3M2?=
 =?utf-8?B?Q05FSWM3cWxKMlc1eHJHWFpYbU1YNXN6aXhFWU1xV2FUVXdFL0tQUjQvdjlV?=
 =?utf-8?B?UHk5ZlZER2RnSVA3K3FidVkvR2Z6Z3pyYUsrWEpIOEkzZll2YzduMGRkU0NP?=
 =?utf-8?B?dHIyeXk2eWpzdm5wUGhINndoeGZYMVkrd0ZudmJ2QWF6VmNRYjdCZGhYeDhU?=
 =?utf-8?B?Vk9ma0kxQm00cVl6eE50T0E4Q1pqZ1A5Yzg4TzdBYXI3dUQ5YXdXU2hibFZ3?=
 =?utf-8?B?VDErQ0JHQjd5bWdncjBlMXBYelZnY3QwOVJ5L1dXRWZUZ1ZGamlSTGgvdzlo?=
 =?utf-8?B?UGJMNVFlYnJVQVdoUEdmQnlRZVA4SytETTNKK3NtVWUxN09ZVThwZG5zdzVh?=
 =?utf-8?B?emhCdmxKSHFUNHJ1T1VUZC9OVlZtTis4dE5SMkgyOVhXbk41RkxzNXNCbThv?=
 =?utf-8?B?VFNmclIrcTF3a1REanlLMWtkcDI0aSt0YXBwTVBPV0ZKVXhMQXNEUXgyeDhp?=
 =?utf-8?B?cFVpazd0N0NOWjRSU0M0N3RybzhYNS9qQndPaFVDMUJtbE94NjB6dHdzZS9j?=
 =?utf-8?B?cFUwMEQycDFvOFBlUy93R0UwbVRoNy9KSE1HY1Eva20rZGtaNlpvQTVXdmUx?=
 =?utf-8?B?SUNLS1A2VzlxbFhrWCs4TFBxbUlEYlZob2I2WUgwd1dJYWJ0dFQ3WTVCWmcx?=
 =?utf-8?B?aHZhWW0yWTJETUZhb1g0QVlKb3h3aFgvOUo3K2t1SndPbmFjUnZnV3dUcU9D?=
 =?utf-8?B?RmVONFlmeWY2NTh3b3gxRnlDbUtvYUlTM2xPZTVDSlVQSnRuZ3JjQWd2Rysv?=
 =?utf-8?B?WWlEbUljY2s4NVFTVWErYk5oQ1k4bTVVQ3B1VkpEK1cwajhaU2tRUkh0eXpk?=
 =?utf-8?B?OFZDNTJEZHI3V1pSdjZjblFsWlNyRXg2SXdvandoYTUvMkF0MXhIbS9ickd3?=
 =?utf-8?B?d0F0VGcvQWt3clRiZk8rb3dOWlZEaEk1OXNMU3VkS0dhcjVIWG4vVkM3a09D?=
 =?utf-8?B?Z1dReDZJTWxlUUtneVhqYmNLWXE2R0VFdEJrbXlENythUFU1Q0t0NCtqcUNR?=
 =?utf-8?B?aU5rdzh0OHd0WUh2K0lZSFp0RWZFNER1ckJwb2pISGNjYnA4Smd6SXlDaXNr?=
 =?utf-8?B?bFZQb1ZaOWNGTTBiSHY0b1BHSDZtSjVKYUhFaUdSbS8xQVV6TDdOWU45QVdT?=
 =?utf-8?B?RXlQRFhQTDZTKzdaeW9pZE12cXp2amFDaENsTjJOaSt6UWFFL3ZKc2NzSzAx?=
 =?utf-8?B?QUQ5KzVBSno3ZEUxRWd4N0JyQm1KaEZkMk50WDBWckk1YzFNejNJUmdNU2Yr?=
 =?utf-8?Q?nkSninzg8JkrYzcnDC8iH2MbM71u6OC/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR03MB6037.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJOK3RnckZvUXRDQUNSL3BnVXU4cUFld3RmcU12M3U5SFUyc1dSTUdmNlJv?=
 =?utf-8?B?L0x1UDZyN2VTOVErV0tCc3hmWVpKVDROQzVGV2xWc2dWTmZkQkpLQ2p1aEN3?=
 =?utf-8?B?VFZ4aDlaejQ4Y1ZZcExGZUdTdDN0NHdLOGZxU0Jhb3BMMXFwUEgzZEtsdFZT?=
 =?utf-8?B?WHNIZ2hQdW9VbTNJb21FSnorZEZxKzV5UUVEZHlyWCt5UHpUbzlmWmdUcnV1?=
 =?utf-8?B?UHBZTWMzYUVORFJ0REFvMUEyTXNPeWRoT1BNQktzaGxtNVlJOXhucFNydGZD?=
 =?utf-8?B?K3NZdjNOOUltcXBSV045K3lpZjJSUVpjWmpkbVpFblVYL3ZRdlJjSElkNUF5?=
 =?utf-8?B?QWdOM2x4anpYenBMREZHT1RPK3c4ZE9hSjNGRFdlUHlsQUR1NXpKUERQa3hZ?=
 =?utf-8?B?RUsyNE8xd29SSzBaRzVtaGdPQU8raHQvL2Rwa3c4WUF5NU5OL2xTZnllc0ts?=
 =?utf-8?B?TzRDWEtzdzBQUThsc3FxaTEwRkpxSHBRWkF0Rm9zWnJMSWkrcEFTOE1jS1h0?=
 =?utf-8?B?OWRydE02bVNIVHhQb0k1VkVGM3NtS0tGMy92TllNaU9SQmFUN2d2R1VYOEg4?=
 =?utf-8?B?cHpNcC9SbGd4YW5MRzdFUW02dVRRMVQxY3NXM2VyRVNkUkFpa05VbkNHN243?=
 =?utf-8?B?TTQ5RktNNEI5OFlOQ3htMlgyQUt6QjFoazRkd0xyZm5FMGVMemZxaWxlUFFN?=
 =?utf-8?B?UXJiczVuS1VFc3krODladlNJQVZNWlNHSmc3Vm92SnZpTXdVdm10L0dyMUsv?=
 =?utf-8?B?K01ubTZMVW1RaEVJMi80Rzl5QVNzQ01ybHFZSTF1U2FkMzRqTjZ1WTdURURh?=
 =?utf-8?B?djBUMjREMm1nbGhmeWZmWk14K2N6VWQyamF3WkpBeFJhSSthbGV6RW5kRFNE?=
 =?utf-8?B?SVFQSHY5NjZsRGJOaktVd3cvS0xNeklDVU9TclVqRzJGODM0V3UyajZvSUs3?=
 =?utf-8?B?YlJob2dOaFluaXQ4bU1OMWhWb3R2K1RuQ0IwZFd1RVRFdklDUVFZMStGc1ht?=
 =?utf-8?B?S2wvR2s1U0c0MVJaaW00bElGanNJaGw0aXpvZFpxOHF4djl4RFdKd2hFSyt5?=
 =?utf-8?B?Zkl3MXh6QXhIS1VLUDFyRFJ3SzBGUncyNlEzM2JxYW5xMkdlNFBRd3RQYTUz?=
 =?utf-8?B?SXlhTXg1eURncEQyaU1ha1ZmLzNVMDVDZ3M5Y1MrajM0YWZkZDlvM3ZQRFZ0?=
 =?utf-8?B?ekpZcTMwSit1ODEvQmFXT1FYbkh3SzViVE9tQkorQnJOTWJkT1hKdXlhK0gr?=
 =?utf-8?B?WXdNYmFsTTJNekkvK2QwNEt6MjRaaFRER1NYV1lnUkV6WjV5VWptQitOcGhr?=
 =?utf-8?B?WnRoWmp4WlNYVDdmeC9zR296YjNWN1hLY2dEdHlyTHUrM2xwQm5KS2VTNTR6?=
 =?utf-8?B?dDdIVVdoN0JLWXlrcElZYk0zdGxBeXRJQTFJb3MxejBIL2tUTWYwRmRJa09Y?=
 =?utf-8?B?QWE0cjJsMGsvclNNcHhESU5TalZPTHAxUHN3a3dVNGJEeDJud2k5allTQXRD?=
 =?utf-8?B?eGQrYWx3SUVId2VVYzlENlBMZCtFeXJYaGdudW9ubnNadjlJZEN3NmZMMTJO?=
 =?utf-8?B?OE01QTJKcXhWWFlGSWpRdmpGdWt6UTd3THg1ZzRKYUJTVkswRnV3NFQyemxI?=
 =?utf-8?B?bVZvMnQxdG8zSkVQMW1VY3BUSkZYY2VQWnI2R0I4Mk9meWsxZzZXNTFHQVBo?=
 =?utf-8?B?RExLdllUM3k2R0t1V3BGcGJVZXMyajBuOVNxV3VmcTd1OThDS0NyUmM5U2xC?=
 =?utf-8?B?ZU5pNFpWa0RndWxUaWVndllORjZVeHR3dGZlbHJoSzFSNWIwR3JRaFdiVk92?=
 =?utf-8?B?eWttUUxEL2NwUkxTOUU1cFpocGtISEFxMVMrMnpZU0JCY0NrZ0l1UDhRZDBQ?=
 =?utf-8?B?bmcyZzdpM2t2M3dyVjlqeFB2U0paVjJuYXAxcmZuaVFZaGNGc2FpYUZpMTR3?=
 =?utf-8?B?aGl6b2srQVhieW1WT2FvbCtlc01neVRWd2k2VWdPMnZkSzAxUW5WS0dvamd2?=
 =?utf-8?B?STdDMmN3N2dsUEpjYThIUkF6andHaW16ZGNqemFxUVYvcDVWUGhHVWZ3dVhu?=
 =?utf-8?B?MVNWeVF3MnVGZHFyREpmOTd5d0pwTndYc1ZGRTQrWHFoaGt6MkdXZzhXOFM5?=
 =?utf-8?B?d0xSZ2JhWTNOaVhSNmRpTVZKanNUYk1aYmRpYkszc2ZtS2pMTWtvYyszQnB6?=
 =?utf-8?B?eXlIVU1zaVFldXNrQlpONU5CekxGUiswQUNocFZqUWUvTURZb3JtZTlCSFFP?=
 =?utf-8?Q?3LQb3CNiFGa26Ly59/2E6qctwCdns+Rno/170SB5Ik=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d954fa3a-5ab2-4924-e55b-08de12e25202
X-MS-Exchange-CrossTenant-AuthSource: BL1PR03MB6037.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:47:18.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q5ClwCZEzb+TmNn8Xs9QJ4TRIxUq+wMaZFeFLsuextRVdsEccgcO6hQicZzhNdHrXhhAVClmnBBTHFJfX9gRfoOoEKwyuCAP/uNhQCJyfWCDkV2RDGOmTkBkGdMM0SqH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_024724_876707_5CFD1150 
X-CRM114-Status: GOOD (  20.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

CgpPbiAyNC8xMC8yMDI1IDM6MzggcG0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgTmlyYXZr
dW1hciwKPiAKPiBPbiAyNC8xMC8yMDI1IGF0IDE1OjEzOjA2ICswOCwgbmlyYXZrdW1hcmxheG1p
ZGFzLnJhYmFyYUBhbHRlcmEuY29tIHdyb3RlOgo+IAo+PiBGcm9tOiBOaXJhdmt1bWFyIEwgUmFi
YXJhIDxuaXJhdmt1bWFybGF4bWlkYXMucmFiYXJhQGFsdGVyYS5jb20+Cj4+Cj4+IEFkZCBzdXBw
b3J0IGZvciBOVi1ERFIgbW9kZSBpbiB0aGUgQ2FkZW5jZSBOQU5EIGNvbnRyb2xsZXIgZHJpdmVy
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBOaXJhdmt1bWFyIEwgUmFiYXJhIDxuaXJhdmt1bWFybGF4
bWlkYXMucmFiYXJhQGFsdGVyYS5jb20+Cj4+IC0tLQo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNo
LCB2ZXJ5IGhhcHB5IHRvIHNlZSBwZW9wbGUgaW1wbGVtZW50aW5nIHRoaXMKPiBpbnRlcmZhY2Uh
CgpUaGFua3MgZm9yIHRoZSByZXZpZXcgY29tbWVudHMuCgo+IAo+IFsuLi5dCj4gCj4+ICsJaWYg
KGRsbF9waHlfZ2F0ZV9vcGVuX2RlbGF5ID4gTlZERFJfR0FURV9DRkdfTUlOKQo+PiArCQlpZV9z
dGFydCA9IE5WRERSX0dBVEVfQ0ZHX01JTjsKPiAKPiBDYW4geW91IGRvdWJsZSBjaGVjayBoZXJl
PyBJIHdvdWxkIGV4cGVjdCA8IGluc3RlYWQgb2YgPiBnaXZlbiB0aGF0IHlvdQo+IGNvbXBhcmUg
d2l0aCBzb21ldGhpbmcgeW91IG5hbWVkICJtaW5pbXVtIi4gTWF5YmUgaXQgaXMgbGVnaXRpbWF0
ZSwganVzdAo+IHdhcm5pbmcuCgpJIGhhdmUgZG91YmxlIGNoZWNrZWQsIHRoZSBsb2dpYyBpcyBj
b3JyZWN0LiBNYXkgYmUgSSBzaG91bGRuJ3QgdXNlIF9NSU4gCnRvIGF2b2lkIGNvbmZ1c2lvbi4K
SW4gdjIgSSB3aWxsIGNoYW5nZSBOVkREUl9HQVRFX0NGR19NSU4gdG8gTlZERFJfR0FURV9DRkdf
U1RELgoKPiAKPj4gKwllbHNlCj4+ICsJCWllX3N0YXJ0ID0gZGxsX3BoeV9nYXRlX29wZW5fZGVs
YXk7Cj4+ICsKPj4gKwlkbGxfcGh5X3JkX2RlbGF5ID0gKChudmRkci0+dERRU0NLX21heCArIGJv
YXJkX2RlbGF5KSArCj4+ICsJCQkJKGNsa19wZXJpb2QgLyAyKSkgLyBjbGtfcGVyaW9kOwo+PiAr
CWlmIChkbGxfcGh5X3JkX2RlbGF5IDw9IE5WRERSX1BIWV9SRF9ERUxBWSkKPj4gKwkJcmRfZGVs
X3NlbCA9IGRsbF9waHlfcmRfZGVsYXkgKyAyOwo+PiArCWVsc2UKPj4gKwkJcmRfZGVsX3NlbCA9
IE5WRERSX1BIWV9SRF9ERUxBWV9NQVg7Cj4+ICsKPiAKPiBbLi4uXQo+IAo+PiArc3RhdGljIGlu
dAo+PiArY2FkZW5jZV9uYW5kX3NldHVwX2ludGVyZmFjZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlw
LCBpbnQgY2hpcG5yLAo+PiArCQkJICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9pbnRlcmZhY2VfY29u
ZmlnICpjb25mKQo+PiArewo+PiArCWludCByZXQgPSAwOwo+PiArCj4+ICsJaWYgKG5hbmRfaW50
ZXJmYWNlX2lzX3Nkcihjb25mKSkgewo+PiArCQljb25zdCBzdHJ1Y3QgbmFuZF9zZHJfdGltaW5n
cyAqc2RyID0gbmFuZF9nZXRfc2RyX3RpbWluZ3MoY29uZik7Cj4+ICsKPj4gKwkJaWYgKElTX0VS
UihzZHIpKQo+PiArCQkJcmV0dXJuIFBUUl9FUlIoc2RyKTsKPj4gKwo+PiArCQlyZXQgPSBjYWRl
bmNlX25hbmRfc2V0dXBfc2RyX2ludGVyZmFjZShjaGlwLCBzZHIpOwo+PiArCX0gZWxzZSBpZiAo
Y2hpcG5yID49IDApIHsKPiAKPiBUaGlzIGlzbid0IHZlcnkgY2xlYXIuIFBsZWFzZSBtYWtlIGl0
IGEgc2VwYXJhdGUgY29uZGl0aW9uIGlmIHlvdSB0aGluawo+IHlvdSBtdXN0IGhhbmRsZSB0aGlz
IGNhc2UuIE90aGVyd2lzZSB5b3UncmUgbWl4aW5nIGl0IHdpdGggdGhlIFNEUgo+IHZzLiBOVkRE
UiBjaG9pY2UsIGFuZCB0aGF0J3MgbWlzbGVhZGluZy4KTm90ZWQuCkkgd2lsbCBtYWtlIGEgc2Vw
YXJhdGUgY29uZGl0aW9uIGNoZWNrIGFzIGJlbG93IGluIHYyLgoKLSAgICAgICB9IGVsc2UgaWYg
KGNoaXBuciA+PSAwKSB7Ci0gICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9udmRkcl90
aW1pbmdzICpudmRkciA9IApuYW5kX2dldF9udmRkcl90aW1pbmdzKGNvbmYpOworICAgICAgIH0g
ZWxzZSB7CisgICAgICAgICAgICAgICBpZiAoY2hpcG5yIDwgMCkKKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsKCisgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9udmRk
cl90aW1pbmdzICpudmRkciA9IApuYW5kX2dldF9udmRkcl90aW1pbmdzKGNvbmYpOwo+IAo+PiAr
CQljb25zdCBzdHJ1Y3QgbmFuZF9udmRkcl90aW1pbmdzICpudmRkciA9IG5hbmRfZ2V0X252ZGRy
X3RpbWluZ3MoY29uZik7Cj4+ICsKPj4gKwkJaWYgKElTX0VSUihudmRkcikpCj4+ICsJCQlyZXR1
cm4gUFRSX0VSUihudmRkcik7Cj4+ICsKPj4gKwkJcmV0ID0gY2FkZW5jZV9uYW5kX3NldHVwX252
ZGRyX2ludGVyZmFjZShjaGlwLCBudmRkcik7Cj4+ICsJfQo+PiArCXJldHVybiByZXQ7Cj4+ICt9
Cj4+ICsKPj4gICBzdGF0aWMgaW50IGNhZGVuY2VfbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgbmFu
ZF9jaGlwICpjaGlwKQo+PiAgIHsKPj4gICAJc3RydWN0IGNkbnNfbmFuZF9jdHJsICpjZG5zX2N0
cmwgPSB0b19jZG5zX25hbmRfY3RybChjaGlwLT5jb250cm9sbGVyKTsKPiAKPiBPdGhlcndpc2Ug
bG9va3MgZ29vZCB0byBtZSEKPiBNaXF1w6hsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
