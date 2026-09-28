Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468CBCA5FA5
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Sep 2026 15:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PHcLvm1InVZP6P7J3H0CYKKH7J7BQVT5huzr9xMnlQ=; b=WrYQJaLTahx8qx
	oZJURZcHpuIlR9e0wMa6w/G6CbVH++22sES4TldncHVLqQAgAhsUBPBcUm37OqQIcbOe38SFnNnZu
	r8JHsBoes5i+ECjy7rDeCv305V2utpLz1GfAYoV3wAGBh5VIpQhA8GALlWJpw6qPQT6xGKcO+jqvI
	cpMOfBz6xfuZW7JMa26J9Qc/w5eTN14d8sJGy6tCR1ptMKgegsUpPndlCXObk9b39AsvFqUfZyesB
	1a00XAIe0cjxy9NI4a91r9LVx5DlpJ3NzX+nOXaZBiNVeyFVhvfILDitbWnMgWoGLJCn5L0ilECy2
	WLw3SD16nXdIWkbSW+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCrp-00000000qbq-3VIn;
	Mon, 28 Sep 2026 15:02:09 +0000
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCrm-00000000qZy-2SpX
	for linux-mtd@lists.infradead.org;
	Mon, 28 Sep 2026 15:02:08 +0000
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEgwpH655743;
	Mon, 28 Sep 2026 11:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=AP2B4
	acdb3G8x2rYxrPYgEjWpboF2NtZgtNpCfdUK90=; b=vRYgBCP9quvxek++45qpS
	Rd6+pmHF9g7oE5WtAZeFjfLtwfaQgGy1pW9w8zOirJCbMSdCnFOSw7opnJOxN1zk
	p7NS3Q/H1+fYkjG5MpOYUn/bX8GCTBU8dQqsOcDWECAGacerdJNDfGKcltWwoqgJ
	WnNS+ofstMn4C8jV+2vYH3EH6gc1Iohu87JsBV/zPlfv2lNzCmpbkeTLpN2VxexU
	fzR8w/xGX3myFsZXD15v2KRA9uZF65Sf+WX1CoaqAR8ht27f9Vv83FGs42w7lgPp
	vsPbYC8loL5HDqWmdRegJzHBo317GhcAMHFOHSJRtwyxW7dLq46b1hxuoxEqsspm
	g==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gysqr08fu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 11:01:21 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TLxB6z/IJwGsdy9Q3FXXr1unN1mN3W+GlglZ98WBRrPboeOdK2jQ7WjbUbeI/QRwXr79asQniZn16SKGD5WVbQWBYOws2q3avLgFQih33oaTvzbNX23H/NgnpsNCTGoeEri3Y/BMMpmkBdCXfigsguI34jG7OIGAZxiNMhnQQPiR/vTfj5nRCqsIqQ4fym1dMMnfeD3xjltw9/Qg9s7+3liWhACLd7AxvvnPHm4tUG53zSNngV87c+AOI2ZZ9KcDkJFKy5fKQMI9UpsKjicZsTTwsi2Qh1KnmgMMO0iJ1fvg6VsMtUO06meLJCsG5XXRYHgxllNZIUI1ymRc+VkCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AP2B4acdb3G8x2rYxrPYgEjWpboF2NtZgtNpCfdUK90=;
 b=L7OKBr2GMm9DhRSAA0Ouqcq6id5NdylxDD0AciqQq4795zOXUbCJf8EKxeooBpMAlv8O7f6c6h+zolE/EepdY678oIlnW9EfAzrEeMCPOZzPbJMDLHfqTuG25nSz2EkeT/ew11/gGaFtfCN1IKCiBZlQ64IXrk9QxIX6BcxoZDTnxdvAyMPiHWn/h/Xs9Ctp2nVgc/5VQ9kjTMXEJLShBdWUDUzcab5syM7WvHJuGLHtGuU++5vGEwuSvkzBYVEP8/B09X3Y+z72L3AUsy0ysAgP2S0dEmO5F+InfGWtCsQ3v8h5+omA3LBXwJGDZazDtEC5DBix/HHF5+kSVsi13A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BL1PR03MB6151.namprd03.prod.outlook.com (2603:10b6:208:315::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 15:01:17 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:01:17 +0000
Date: Mon, 28 Sep 2026 16:02:27 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Fei Xie <fei.xie@horizon.auto>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Mark Brown <broonie@kernel.org>,
        linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 0/4] spi: cadence-xspi: add ACMD PIO support for NAND
 and NOR
Message-ID: <arp-E1MDFLfV1ASq@nsa>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
 <arOwdePAmoghlakj@nsa>
 <20260928055005.3987624-1-fei.xie@horizon.auto>
Content-Disposition: inline
In-Reply-To: <20260928055005.3987624-1-fei.xie@horizon.auto>
X-ClientProxiedBy: MR1P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::8) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BL1PR03MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: a6cbd55c-d9dd-4d38-7aa9-08df1d7158ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ec89lRLGN9zrYG7wLYkvGkJcLLzWt68xOAaLgb0uZ/E6+qchwKDhTXV8ToDBgTKVTs0GMWs04BR+Qiwh6T4NS6DDT4Tmthps4s8vV9U6t6p2uJHqzgKZQST034ijumzZcOQDk1aPOkYByCE7W+fW77TaDqm1Dxhc8XnWRW3+ennAg7JtJEq0hM823ApfiZc5BaF2D41/qGxlAB6Nh3NCp5GUR4orCv3gX2/XP3ek1O4HcpIwEw7C7Nx8vGTf2Kimnvf8JFDMFOfm5qulQ0JBvW1YSLHj00F9CKaINvSsMINq8DKTg76sPrnSwwe5cKId0G7zxSPRwbqbzLh+Nl2V13e6qF9+zuYlM6p6ATCTiDAGOz2xfvrjemXmwBJDP9+2b3o0vikJOB2/RjgnM54INPNinx3ZimLb1kca621JtSS34QPMdD7L3gVNgojwDFlK3U1RK2aBXeDHlEOsJ9ULQWRYQDLytZIlpoqDp905l+s80TpbGY26Z0reHvr4MG1gytEnD7aqz3cksij4R6eTDeIXu+802BqLUq7eGUdFvus6Hpxy5tiWOpzzRekkAMRbXI6H0sTa63mkrlP+jImiU7wytzOxnKerfFEVkoJZ71YTXZiwE6ZwTVTlB8RXC0iW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWdSTE5MQlRsOG5pRGJmR3FnRTN3akZreElUSDl2b1Y1dkI3cTllVitoSHlv?=
 =?utf-8?B?OXVpK0RQekI4K0pOaTFsaHByaTVNK2FjV2RvTXFJM2tMRGFjdEZKTzBuazFB?=
 =?utf-8?B?MlVxb1FZVTZleWVrTjd6dStqRC9QU1grUnVlY1Q5V2QrMFErTmpydi9FYktr?=
 =?utf-8?B?dUYxL2lieDRSNHF5N3Y0RG1leDQyb0g5ZVRCWFpmQ2gxcGZPLzRZa1pkcFNU?=
 =?utf-8?B?MXhoVk1QbzNJV2IxOEc5VzhzU0Q3NjFpSHNsbXNaSXdieEUrblZremVuelBx?=
 =?utf-8?B?QVFha0NGc3lVbDBqbTJuV0J3QU5ZN2NGWFdnRUNwRUhjQy9yUnAwUHdTYWNz?=
 =?utf-8?B?VUhqZHhORWxaekcxejZrUVlaM0FGRlBpN29CbjhSVkgxMnFWQlpBYXVuZk5r?=
 =?utf-8?B?ZlNVdzB3aitmSEozNlJCZGRxR0J1Q0FhWGtTaG90dXlUZUlVSWttU3Vrdkcw?=
 =?utf-8?B?UXJxN0FlbXpHZ1pWY3YxS3d0Qzk0VmJ6WGRCbTFaTUVUU2htRFowRktyYy9W?=
 =?utf-8?B?MWNDdUFHNFdFY3I2b1lKRXhmZGhjVDVlbXU5bTh4VUxWcTQrb2plc05KT0Rr?=
 =?utf-8?B?eFdDTmJQLzZiSlpSTVVuYlVaV0JpNVFMWGQyTHpJLytxWmJZSjRRZ1l0TnM4?=
 =?utf-8?B?L0RDQlZ4VDVydGZDOEpVcDJ1WmRoMVRHYnV1cVI2dzNuLzNXTWU2NG9WYXpX?=
 =?utf-8?B?bk82WDRCS2dKUEZFYW1YWmdKVEpLWFJUNUp0a00wSFUrQW9RZG5mdzlRWCtY?=
 =?utf-8?B?V2FGRmYxRWl6azgveWhSVEw4TkV0bDhVendUamVKSG4rWG5wVkV2UFZnZ1Ez?=
 =?utf-8?B?YTQzZjRjUWtEYVJnNTBNWlpvZlFYSFNPWEZzVTVWcFpjaGY3NFhxWTZTRUpX?=
 =?utf-8?B?MG1URlBPaTBzV2NsYlYyMndCMkt6aUxFVWJIZkMyWmlreURWUEQ3dnlwNTBM?=
 =?utf-8?B?ZWw1UjNRSitWOFRCUFB5Mzk4OWE1ZEVnRUlMRzF4MGVteTBPc2xRVmxVZU9J?=
 =?utf-8?B?UzMrYTNHVWR4eDN4Ym4wUTlrSVlVWGNPSkYvNS9pUEJkTUZ6amRteVpFdUMx?=
 =?utf-8?B?VWhtMzRWYThuNFpKTnZsOGFtUmtTQTdKSlBJS3NmdTRvRjRoSWhtejVUb3Zl?=
 =?utf-8?B?dEtIWGJVcDhNbVVUS0NlRG1RdXZqdTFVYlNZVnN0eEZ6dFdDUkI1OFR2bUNm?=
 =?utf-8?B?MURDdThqOVREWEU4ZUJycXRPSTFZcUsvTzlVY0NZNGFpM1NqTWZ1ajlRUml3?=
 =?utf-8?B?RUphQVlOMnc4Z1NHOUs4c3Fhc1ZYVFlLUWlxME5ReGNtWG9BTXRHYk9jenFr?=
 =?utf-8?B?MHUrTlRBb084MEhPZ3d5VjEwemM2TjBXTy8vNlhGYTB5MTF5elFVY3RwVDZL?=
 =?utf-8?B?U1RmWVEvcEtVazJkdU1iWU15b1c4QTdvSW5XMTVsdm5BeldjNlJnNmlpY3NY?=
 =?utf-8?B?b1VlamJKRFlKUFhKNmdoUElRV2RzZXdKV3ZKOUFDaE02dG1SRzRyUDZHQU51?=
 =?utf-8?B?S0NSK2Z1V3FvUmtWdzQzVUwrWUVMNkFGOFFxUWdLRTJ0QXZxa1lKNnZSMHM1?=
 =?utf-8?B?a0JIRlJBTkt4VnAyMTZQMjJhOVdsYnkyZWRta253ZVpIWWdYdWpLWEhFaDFM?=
 =?utf-8?B?UkczWHdyemJteVdQNm1vSVVDc29DczQ5ME5XVjgwSm16bHFCcDFNT3BqM0FT?=
 =?utf-8?B?M0JiamZKaVpzUEljbFFSemhtNjUzTzRoRGxtdEdSZDdwUkFHOEw4dTJaZTV2?=
 =?utf-8?B?MjZVbE90cnc3cTg4cXFRemlVRFp3WDE5S1VCRnFGalRScERsQ3lMS2JNVjl5?=
 =?utf-8?B?cXVlU1V4YzloL2R1RlVZS3NmTm1ZOEFEZU1ta3lrcWIvM2pmRy82TTR2d2ov?=
 =?utf-8?B?cnZHY3ExOUNBdzlQdEtsMFQybGhENk1PTDhvTVF5Q2RIVlNMMEFDakhEVmhE?=
 =?utf-8?B?WHZ1VDcxbnEyYTRQbmFxN3dSUzJCZDI3Zk52cXgyY1hJZDJHR3I1NlNMM2Ez?=
 =?utf-8?B?dTY1TGwyR1REL3pEa2tnTEorZzVHQkZZaUlMUDZBaWNKbWl5T0RIeHE2bnJa?=
 =?utf-8?B?R0ZYS0kwZ1NiV3VobmZpOStXSFUvWEtNNkprK2VJK3N0UEZxUmNHTVVNRVhh?=
 =?utf-8?B?QXdDSUdrckZhWFMxb2c0NUtqbjJBSWtxWWltUFJ0M2g2ek1BNmdkMWhra3Fl?=
 =?utf-8?B?K2FMb05kTmZkc3dvWkdWbjU3R0h0SnJWYVF0cDk4S1pxSkVNTFFLY3l3QXFQ?=
 =?utf-8?B?bWlwQ3ZXUm1yWFRFU1NTZkMxNUNxVXhjeU9Fa2lTVnVPK0loTUREOVJIWUFN?=
 =?utf-8?B?YVpKQVBrTi93Qk9TeENqQTRrc3N3blJFZktzZjY3enArSFpZWnRCdz09?=
X-Exchange-RoutingPolicyChecked: reNU7lU/UoK+bDWfZjP9hEuzR4d0aGUo5rmVqoVj07nXILDQDekzwaO771B74JpgAeHZ2mHFzqt0bcl9JSCqD1LO8+lcwjaSkS0zYWs6NXfk9ElzIoJyNY/qjQoNFriIkX4wFkki+50bwIIZu2SyWjiJc/cZa90lu7naervObedFctiByjvnL9G0FpGvvGTKn38VoETLKCmqaIMa0o8YGm+59xtAudgU40grVB6W/HoKhkNGbmeLvO9Wih8a9wLlKq7vGjeJnQE1BmPOJRk0g9AcXSRMfmb0hF+DH9SeHiCc6lGt6VFiKHkfVxK0hM3wfcOB1ifcujX1DJvRS3fJqA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6cbd55c-d9dd-4d38-7aa9-08df1d7158ed
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 15:01:17.2255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+JN/4NrmhO0Fvl8Vg7FNl6E+kacnBkPpQ1r1KprVbUzmlaPxwtFfKFPTw0lpdBTknIZQVpdC+YQPFgimx0GTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6151
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX+eIcNKtVGXDj
 x/QFnlnJeQHdGExEMCUjy6SpkNSlHWOxLRz9SLlVX2epMAiFqpZp464AkWtfwy0fsYWz95/1afJ
 rWLlPZ0I5nORevVmk6UzJYKpjK0vp88MnSFV8PosAKQxkEYUCRlQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OSBTYWx0ZWRfX/C4zFd4yAoKg
 ILr730dhvdjPIWrTT6Zdx2b5wn3ml+LLLDSJcKxjrH4Enx7ubeoZGAuRpY6CJ4b66FHMERJK21f
 meRt+iFFHoeUipUpQAaGvBhfHt15AO3t5hNgqswKrH+KBkvEotEZGe3pY6FkvnbvI32e4dbT2x9
 oN43WKvurkaLE3AQaSBS/3Gpgf4xkm/T5gf4fjAIPatkYBIaf0ti6w5BxtHti+USHfClh75r87J
 MMVw5uPvd/0YjGTl6L5R1qFrSEFbFjjmlgoWFQNsUnMHW0A25pr2VdkBTyVVAUfAgYJmXqNeLrX
 ofZEcYMKKWhnWw0PERUuGQEnwafjUluU6EN7ASajBB1YTrFOtGBEpVN+0WeYHCj7TG/Sxm4fm8E
 jXTP7udD1grF/5jDyMqLhvEzpmEkvNAi3IRMYBEaUVn3+DZiuoFTucoz3/XjqSag3Khq/XldO25
 eJgdkQ28ScYWnz+ekMQ==
X-Proofpoint-GUID: pJsYcrsyGf9A3IWdpVyia9eGv1z_XmHt
X-Authority-Analysis: v=2.4 cv=PdBqFShd c=1 sm=1 tr=0 ts=6aba8141 cx=c_pps
 a=H8CAifLk0DAaaH9V+JapoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=iZSIUCweCk2Oy3QsdGPA:22
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=T8JQXa9jkDW_iO3E5KsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: pJsYcrsyGf9A3IWdpVyia9eGv1z_XmHt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_080206_746930_E4AA9AE6 
X-CRM114-Status: GOOD (  30.85  )
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

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgMDE6NTA6MDVQTSArMDgwMCwgRmVpIFhpZSB3cm90ZToK
CkhpIEZlaSwKCj4gSGkgTnVubywgTWlxdWVsLAo+IAo+IFRoYW5rcyBmb3IgYXNraW5nIGZvciBi
ZW5jaG1hcmtzLiBJIGJhY2twb3J0ZWQgdGhlIDMyLzY0LWJpdCBTVElHIFNETUEKPiB0cmFuc2Zl
ciBjaGFuZ2VzIGZyb20gdGhlIHBhdGNoIE51bm8gcG9pbnRlZCB0byBbMV0gdG8gb3VyIHZlbmRv
ciA2LjEKPiBrZXJuZWwsIGFuZCBjb21wYXJlZCB0aGF0IFNUSUcgcGF0aCBhZ2FpbnN0IHRoZSBB
Q01EIFNQSSBOQU5EIHBhdGggZnJvbQo+IHRoaXMgUkZDLiBJIGhhdmUgbm90IGFwcGxpZWQgTnVu
bydzIHNlcGFyYXRlIEFDTUQgcmVhZCBpbXBsZW1lbnRhdGlvbjsKPiB0aGUgZmlndXJlcyBiZWxv
dyBhcmUgZm9yIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiB0aGlzIFJGQy4KPiAKPiBUaGUgZGV2aWNl
IGlzIGEgR0Q1RjRHTThSRSBTUEkgTkFORCAoMiBLaUIgcGFnZXMsIDEyOCBLaUIgZXJhc2VibG9j
a3MpCj4gb24gYSBIb3Jpem9uIEo2QiBib2FyZCwgcnVubmluZyBhdCA4MCBNSHogaW4gcXVhZCBT
RFIgbW9kZS4gQm90aCBwYXRocwo+IHVzZWQgdGhlIHNhbWUgYm9hcmQgUEhZIGNvbmZpZ3VyYXRp
b24uIFNUSUcgbmVlZGVkIG9uZSBhZGRpdGlvbmFsIGR1bW15Cj4gY2xvY2sgZm9yIHRoZSBFQmgg
cmVhZC1jYWNoZSBjb21tYW5kIG9uIHRoaXMgYm9hcmQgdG8gcmV0dXJuIGNvcnJlY3QKPiBkYXRh
IGF0IDgwIE1Iei4gVGhpcyBpcyBhIGxvY2FsIHRlc3QgYWRqdXN0bWVudCwgbm90IHBhcnQgb2Yg
dGhlIHBvc3RlZAo+IFJGQyBvciBbMV07IEkgZXhjbHVkZWQgdGhlIGluY29ycmVjdCBTVElHIHJl
YWRzIGZyb20gdGhlIGNvbXBhcmlzb24uCj4gCj4gSSByYW4gZmxhc2hfc3BlZWQgLWMgNSAtZCAv
ZGV2L210ZDE4IHRocmVlIHRpbWVzIHdpdGggZWFjaCBtb2RlLiBUaGUKPiBudW1iZXJzIGJlbG93
IGFyZSB0aGUgYXJpdGhtZXRpYyBtZWFucywgaW4gS2lCL3M6Cj4gCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFNUSUcgICAgICBBQ01EIFBJTwo+ICAgZXJhc2VibG9jayB3cml0ZSBz
cGVlZCAgICAgIDM2ODUgICAgICAgICAgMzU1NQo+ICAgZXJhc2VibG9jayByZWFkIHNwZWVkICAg
ICAgMTI0NjggICAgICAgICAxNDIyMgo+ICAgcGFnZSB3cml0ZSBzcGVlZCAgICAgICAgICAgIDM2
NzEgICAgICAgICAgMzUxMAo+ICAgcGFnZSByZWFkIHNwZWVkICAgICAgICAgICAgMTE5MzEgICAg
ICAgICAxMzcxNgo+ICAgZXJhc2Ugc3BlZWQgICAgICAgICAgICAgICAgNDAwMDAgICAgICAgICAz
NzY0NwoKU28gdGhpcyBnb2VzIGFsb25nIHdpdGggbXkgZXhwZWN0YXRpb25zLiBJIHRoaW5rIHdl
IGNhbiBhbGwgYWdyZWUgdGhhdApQUk9HUkFNICsgRVJBU0UgaXMgbm90IHdvcnRoIHRoZSB0cm91
YmxlPyBXZSBldmVuIGxvb3NlIHBlcmZvcm1hbmNlLi4uCgo+IAo+IEZvciBhIHNlcGFyYXRlIHNl
cXVlbnRpYWwtcmVhZCB0ZXN0LCBJIGVyYXNlZCBhbmQgcHJvZ3JhbW1lZCB0aGUgZmlyc3QKPiA2
NCBNaUIgd2l0aCBrbm93biByYW5kb20gZGF0YSwgdGhlbiBjaGVja2VkIHRoYXQgZWFjaCBtb2Rl
IHJlYWQgYmFjawo+IHRoZSBjb21wbGV0ZSBhcmVhIGJ5dGUtZm9yLWJ5dGUuIEJvdGggU0hBLTI1
NiBoYXNoZXMgbWF0Y2hlZCB0aGUgc291cmNlOwo+IHRoZSByZXBvcnRlZCBFQ0MgZmFpbHVyZSBj
b3VudHMgd2VyZSB6ZXJvLiBJIHRoZW4gcmFuOgoKV2hhdCBkbyB5b3UgbWVhbiBieSBzZXF1ZW50
aWFsIHJlYWQ/IERvZXMgeW91ciBmbGFzaCBzdXBwb3J0cyBjb250aW51b3VzCnJhZHMgKG9yIGJ1
ZmZlcmVkIG1vZGUgSSB0aGluaykuIElmIHNvLCBJIHdvdWxkIGV4cGVjdCBtdWNoIGJldHRlcgpu
dW1iZXIgZm9yIHRoZSBBQ01EIGNhc2UuIEJ1dCB0aGF0IGNhbiBiZSB0aGUgaXNzdWUgb2YgaGF2
aW5nIGJvdGggdGhlCmNvbnRyb2xsZXIgYW5kIHRoZSBjaGlwIHRyeWluZyB0byB3YWxrIHBhZ2Vz
LgoKPiAKPiAgIC92YXIvYnVzeWJveC90aW1lIC1mICdyZWFsPSVlIHVzZXI9JVUgc3lzPSVTIGNw
dT0lUCcgXAo+ICAgICBkZCBpZj0vZGV2L210ZDE4IG9mPS9kZXYvbnVsbCBicz0xTSBjb3VudD02
NAo+IAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgU1RJRyAgICAgICAgICAgICAgQUNNRCBQ
SU8KPiAgIGVsYXBzZWQgKHRocmVlIHJ1bnMpICAgIDUuMzAvNS4yOC81LjI2IHMgIDQuNjYvNC42
NS80LjY1IHMKPiAgIG1lYW4gdGhyb3VnaHB1dCAgICAgICAgIDEyLjEyIE1pQi9zICAgICAgIDEz
Ljc1IE1pQi9zCj4gICBtZWFuIHN5c3RlbSB0aW1lICAgICAgICAzLjU1IHMgICAgICAgICAgICAx
LjA2IHMKPiAgIHByb2Nlc3MgQ1BVIHVzYWdlICAgICAgIDY3JSAgICAgICAgICAgICAgIDIyJQo+
IAo+IE9uIHRoaXMgTkFORCwgQUNNRCBpbXByb3ZlcyB0aGUgNjQgTWlCIHJlYWQgdGhyb3VnaHB1
dCBieSBhYm91dCAxMy41JQo+IGFuZCByZWR1Y2VzIHRoZSByZWFkaW5nIHByb2Nlc3MncyBDUFUg
dXNhZ2UgYnkgNDUgcGVyY2VudGFnZSBwb2ludHMuCj4gVGhlIGZsYXNoX3NwZWVkIHJlc3VsdHMg
c2hvdyBhIHNpbWlsYXIgZ2FpbiBmb3IgcmVhZHMsIGluY2x1ZGluZwo+IHNpbmdsZS1wYWdlIHJl
YWRzLiBJIGRvIG5vdCBzZWUgYSBwcm9ncmFtIG9yIGVyYXNlIHRocm91Z2hwdXQgYmVuZWZpdDoK
PiBBQ01EIGlzIHNsaWdodGx5IHNsb3dlciBmb3IgYm90aCBpbiB0aGlzIHNldHVwLiBUaGVzZSBh
cmUgU1BJIE5BTkQKPiByZXN1bHRzIG9ubHk7IEkgaGF2ZSBub3QgYmVuY2htYXJrZWQgdGhlIE5P
UiBwYXRoIG9uIHRoaXMgYm9hcmQuCgpTbyBDUFUgcmVzdWx0cyBhcmUgdGhlIGJpbmcgdGhpbmcg
aGVyZS4gSSBndWVzcyB3ZSBuZWVkIHRvIGRlY2lkZSBpZgppdCdzIHdvcnRoIHRoZSBhbW91bnQg
b2YgY29tcGxleGl0eSBpdCByZXF1aXJlcyBmb3IgdGhlIHdob2xlIHRoaW5nIHRvCndvcmsuIEFz
IEkgbWVudGlvbmVkLCBpZiB0aGUgY2hpcCBoYXMgY29udGludW91cyBtb2RlIGFuZCB3ZSB0cnkg
dG8KcmVhZCBhbnl0aGluZyBiaWdnZXIgdGhhbiBwYWdlIHNpemUgd2Ugc2hvdWxkIGxldCB0aGUg
bmFuZCBjaGlwIHRvCndhbGsgdGhlIHBhZ2VzIGFuZCB0aGF0IG1lYW5zIHRoZSBiZWhhdmlvciB3
ZSBoYXZlIHRvZGF5IChJTUhPIG9mCmNvdXJzZSk6CgoweDEzIChTVElHKSArIHdhaXQgKyByZWFk
IGZyb20gY2FjaGUgKEFDTUQpCgpJZiB3ZSdyZSBvbmx5IHJlYWRpbmcgYSBzaW5nbGUgcGFnZSB0
aGVuIHRoZSBsb2dpYyBpbiB0aGlzIHNlcmllcyB3b3VsZApwYXlvZmYgKHNsaWdodCBwZXJmb3Jt
YW5jZSBnYWluICsgc2lnbmlmaWNhbnQgZHJvcCBpbiBjcHUgbG9hZCkuIE9uZSBzaW1wbGUKd2F5
IGZvciBkb2luZyB0aGlzIGFzIGEgc3RhcnRpbmcgcG9pbnQgd291bGQgYmU6CgoqIE5hbmQgaGFz
IGNvbnQgbW9kZSAtPiB4c3BpIGNvbnRyb2xsZXIgZG9lcyBub3RoaW5nIHNwZWNpYWwKKiBOYW5k
IGhhcyBubyBjb250IG1vZGUgLT4gQWdncmVnYXRlIHRoZSB4ZmVycyB0b2dldGhlci4KCkRvaW5n
IHNvbWV0aGluZyBkeW5hbWljIHdvdWxkIGJlIG11Y2ggbW9yZSBjb21wbGV4IEkgZ3Vlc3MuIFdp
dGggdGhlCmFib3ZlIHJlYXNvbmluZywgaGF2aW5nIHNvbWUgbWVtX2luZm8oKSBraW5kIG9mIHNw
aV9tZW0gY2FsbGJhY2sgdG8gdGVsbAp1cyB0aGluZ3MgbGlrZSBnZW9tZXRyeSwgY29udGludW91
cyBtb2RlIHN1cHBvcnQsIGV0YyB3b3VsZCBiZSBlbm91Z2ggdG8KaGFuZGxlIHRoZSBhYm92ZSBJ
IHRoaW5rLiBUaGUgcmVhc29uaW5nIGlzIHRoYXQgcmVhZGluZyBhIG5hbmQgcGFnZSBpcwphbHdh
eXMgbGlrZSBzcGluYW5kX2xvYWRfcGFnZV9vcCgpIChvcGNvZGUgMHgxMykgKyBzcGluYW5kX3dh
aXQoKSArCnNwaW5hbmRfcmVhZF9mcm9tX2NhY2hlX29wKCkgc28gd2UgY291bGQgcHJvYmFibHkg
YWdncmVnYXRlIGV2ZXJ5dGhpbmcKaW4gdGhlIGxhc3QgY2FsbCBvbiB0aGUgY29udHJvbGxlciBz
aWRlIHdpdGhvdXQgY29tcGxpY2F0aW5nIHRoZSBuYW5kIGNvcmUKbG9naWMuCgpCdXQgTWlxdWVs
IGtub3dzIGJldHRlciBpZiB0aGUgYWJvdmUgY291bGQgYmUgYSB2aWFibGUgdGhpbmcgdG8gZG8u
CgotIE51bm8gU8OhCgo+IAo+IFRoaXMgaXMgaGFyZHdhcmUgdmFsaWRhdGlvbiBvZiBhIDYuMSBi
YWNrcG9ydCwgbm90IGEgY2xhaW0gdGhhdCB0aGUgUkZDCj4gd2FzIHRlc3RlZCBvbiBhIGN1cnJl
bnQgdXBzdHJlYW0ga2VybmVsLiBJIGFncmVlIHRoZSByZWFkIGFuZCBDUFUgZ2FpbnMKPiBuZWVk
IHRvIGJlIHdlaWdoZWQgYWdhaW5zdCB0aGUgY29udHJvbGxlci9NVEQgbGF5ZXJpbmcgY29uY2Vy
bnMgcmFpc2VkCj4gaW4gcmV2aWV3Lgo+IAo+IFRoYW5rcywKPiBGZWkKPiAKPiBbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc3BpLzE3ODA1Njg4Njg3NC41MzcyNC40ODUwMjg2Mzkx
NzQ1OTM5NzA3LmI0LXR5QGI0Lwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
