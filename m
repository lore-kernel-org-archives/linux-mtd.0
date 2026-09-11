Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA19FC88E58
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 15:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=icPVHYh6pmYvs0iuvNBrWNRPqpp5FnwPdDRwrPMmBMU=; b=oB/UCohSR4VAOpTezHXGokdLmL
	QbRwuRt+YJ9jdT3HPm3hZVURR1tMWpGh9m2tsL0PO2eiPQ9ruCmWC1xY32omn+N3trH1IhhTiiHYt
	SYQUfvrujCI2goZYOyHzO6un+zVoG8p76Y0nauhvRmTtp1kwgspobin5M/1GssytMWhe+9E21HOy0
	yusV41D12k+3KbXpXEi9HeyipQ8M25Q9qqNQeOPjbZvXD06NTutJ40Xp3I+YdsVSOjOmpt2wZIs8G
	SDtJvqE0O6CAALidM1dj/AAkAMKhmH9K+i5FgjVcPhzsNFTQ/0tnIwsqnL8nam1/d6zsZ56B6SuBY
	K7Cbsk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53IA-0000000H4eb-1B3z;
	Fri, 11 Sep 2026 15:35:54 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53I2-0000000H4b0-1yiO
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 15:35:49 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEk0sG2378165;
	Fri, 11 Sep 2026 11:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=RAWjf
	e5dpPZdsCbTrnyaWlQpcNAVw19gkiq+HPTyOdo=; b=qBPhirZdaN4r2COdTiZhz
	ucV5wcwXuIDYh8XbtulXihtkaa7fcwiqm1KXZ0vpm3vFBehQnAr4ZgRBtVCj4+Uh
	9a8M+Hnx27EGs+yxLaYxbgcYMig0PZYJIRj4nW991f2lnzHuYLDx/Q4/081aChEE
	FEkqb/M4vG3FxMbHoEKE0sm4Pab8MMohfNvW6sij397M6j0R++WAAiVZgw70HhF+
	KIRmR5Y0tBODev6zNr5zfSfeyPcNzTJ7gbmQ9Vrl58TB8WZbiHGVLCClMsqcAbBI
	aEBSPU4yI2sXTAhH8zWhi/bVVzLn4qZgNuVAWKRGyYgKrFMnzkmp4fRjc2H8hNsp
	Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcxahryb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:35:40 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTCc8Hou3v2B4G5hrI4P5rhqbwB9ulcle7jbtQEvzDiQaH/BoF8TQgw+O6A9/71671N5FL4uiKBw9qdJb2bgrKJ2JW3AF8yie+FzbmOrUrcJHLSgCogp4TMNSbww6rIR/x6m30nUXGb3A8awHure0b9oTsF5Hfcq+QFAg0aR6Z9Tbuw8uuWDhtzerL15ZmCn3NLYr3m5+OVqgW//muVr/iEYohkZg9uFG1oGJQTRPRoiV9sJBur+8R5Gpv1ZwhosNIsHt0z4p9OYEXvepZsCtvKq1JUmxUfm2IPMuANkQeoPuzEEbFTA4P1qf7hLMRBSkhlDQdDqoT4GXP4Tqc2gVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RAWjfe5dpPZdsCbTrnyaWlQpcNAVw19gkiq+HPTyOdo=;
 b=ZnxxSPFInnRGvv6okvzxnKNEiGYKpO7k5hzU/sGifNCGyzNDsaU4SfyN7EbEO9Xx+C8/Cd2BmP57gxr9XnUj5vwsGLyRdSpt93NO0XV6z9uarRIXpoBKQWLvTIgdzBo+lmrcIbKwVNhEc4Whnd74D9k0C8GesrCV86WeRPwHwjXnICBLLUaFjCZRX6yN5kUPoMTqrUmKTngq+EtRWhXilCggY7FpQKozBNuXwgSDBjx02TG0WRQNOQW0XcN8/mv9KO00ouX8B/no4F80cT/4jv17qDA4C7uCkerhqh9eCyTZnOzxUspsM14+9UEA4I8i/oGK5grkpDixvREf/RwkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BN8PR03MB4994.namprd03.prod.outlook.com (2603:10b6:408:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Fri, 11 Sep
 2026 15:35:37 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:35:37 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 11 Sep 2026 16:36:43 +0100
Subject: [PATCH 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-Id: <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
In-Reply-To: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141002; l=2174;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=mr/9eL/0iMqFzPo51k9KdeGMD6Ohj27UBjYInuS0dek=;
 b=6mWRObRpAX4CvP3d5uklDWylLsYjOs5AGSSInIuIbdt+VySt1C1IleGnoOviOzetvEEJDICQ/
 MDK1NA2+UbhCC/dZp6dTtUWuq2GGrv9gDtGZ6LKOQphUiW0fG6TySoL
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0075.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::17) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BN8PR03MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a77a7d2-5ed9-4c96-1591-08df101a538a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|11063799006|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: Vkh7LJzbPEhRgk1ZVfpLu6C6hNFqvN1PD5LFO9zL+7m+//K825DNyOfVLax5AyC4b+1ZQ1UBym1goMko9pdFHokc1hv6g7PyY7/7dD0fFjrRMEre6EphATC+LXxmWESBKuCZSybgQsdQ8WQGgB83Hfjr+euGsoVLgsehfGvRFkhBy0LAblozGBkljP4F0rRJsB/bNoC4UVPHY+fXHAteS4CVcZFFxmecLEv6VpXVS85RQpVlOVUckE9Awf44hCjzT9QnVx6e0S1A67fFzWWd29V9lY5x0sYevrnc59wJ9LNYuwGY8dnGQS/rXNNUhEoggx5oj4K5m+33qS/EnWRp+XwpFYmQ4semvOrSHfsdTpfa+JVQkUiF/7D4uuMB8tIHc0UfF/KB3+M7JBU/F/0d/CcZw2XeFv5Q1+kXdcO9rI2LKkYKk60ZZ8PF+1ZNQ4+3kZPpPaVpQj6SG8oXPf8zkW+bWsccHRZHXlUUZTgiyELprsUtQ5OxIPQy7SDLFoKDGmo2uuGh1oKCPTiuyH42jyW2epA67hcoFytadcab5blyGak94PAYIjESJ6SBNoXTTzvwpMNKZPcMSS6sx0iM0y7uV6w9dcOIhG1HEnzUdA39ma88EVgP6pilbU++ycqxt4q9f57iELenmixgPPClBo0Mc8yz5/rVcN6EPrYqiHY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(11063799006)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlPREFpRlR1K3BPUWxpVWZybzBWdEQxZFZKTVFFWmNxenk0Z0VGSEdpa2l2?=
 =?utf-8?B?cXpJbHBRMWc1YjlkOHV2SGRFZU5USTZ2UHFkdTRBL0ttbzFBN1dIUTBUZjVk?=
 =?utf-8?B?UG1pRG9iSnVxVUsxdWhDWVJCQkJPcnlnRjN5MUlYVnpRTVFWZEtWZ29LWUhm?=
 =?utf-8?B?aTBtQVZkSENESWIyaFN2eDdWMGxDVkxpMU9KakNXS28rZzFCTnlCWDlXcnQz?=
 =?utf-8?B?OHRFeVdiZWhFUUdYaGlXQlZSTURyK2doMlFCcDZmQWlrT0tKM1Z1N2hBcXIx?=
 =?utf-8?B?WTVZNEQxUGMrV3lHVm02SUNRREhLR2hvT3hUUVBYZ3JFTDRQMkoyWXZRTnN2?=
 =?utf-8?B?a09IbmU1TytxN1pHYzRNMExQMk9DM0h3TVY0cFBtNXJrYlh3d3dZUjdDK09U?=
 =?utf-8?B?NU81NFlZbnExbmZPTk1DQ3J3Ry9xVnc0U1J6d3Rrb0NZR2xwRnNuZGNIQmtB?=
 =?utf-8?B?Qk9QVDNxNjZwdndtbFRHQXNtSmNZejlSalYwYnVab1RQeFJmUnNHSEVaNVNE?=
 =?utf-8?B?c01qZWpPUys5aGNvdVAxSmllRWxaVWc2ZmgyMlAwTWFpMXowdGRrZkF0ZVg0?=
 =?utf-8?B?ZVVmbGFMbXMzcXRySzJwakt0NnFDRWhkQ3JWSm9EVFg4VW42ZVlidWtqREJU?=
 =?utf-8?B?VEhKUXBJWG5vOHlmVkM1UnBsSzk1RWljT3FicHk4Wkw2M3hXa1hXQ3JuaytP?=
 =?utf-8?B?NE1jZllBSHEzcGh6bVJHTkpVVUZCQ3pVajFkeFFGVnptL0N2YXRpSGo3NFlQ?=
 =?utf-8?B?N1FveEJ2RFREaHlsaGRwWVdNVmZHSE9qOUxYWW1wYmpFV3pEZkk4c2hsSG5m?=
 =?utf-8?B?MVJ4VDNmZzBOc1ZmbW9jTjdScEkzOUxpaUtncDhwT2dnMFhnQUJxajd0dU4z?=
 =?utf-8?B?K2ZhSVdLbXJRLzFuTEtCNnBiaTJkSm5QYisxakFnc2ZYQURFY0pRR3lRK0p2?=
 =?utf-8?B?UWQxdXNldWx6N1FaNGg2cXV5RnFBbUtFNzZiK21XWTJGYWpsUGY4bjBMYXV4?=
 =?utf-8?B?a1RBSDNHQ1dUaEZ1YlgyaDM3WmtZalMwVVNybW9vanduQkNjS2dydjg3KzY2?=
 =?utf-8?B?MVN5clordjRJZEhpMTF6RGdjRVRTNERidUlrRVNBQmZwRHlsWWV3ODVEelNm?=
 =?utf-8?B?YXNnd1c3WThVem1jQitzU3dpRElpSk1DR2RZYk5VeWZ2M09ldDRpZE5FK1Fz?=
 =?utf-8?B?OU0zbEFLbFVuWkFmaUlEczhiWVRkbk1mWmtzaFVOL1lsc0hUeHU2NVRLb2VW?=
 =?utf-8?B?NlNSZGZxQWZ0SXpjenRGeTIxTyt3R1lqVE5ITUlYK1ppcUJLTmJITVhNNi9i?=
 =?utf-8?B?VUhvNVdURnI5R0VFUllvemFxNDNHK3U0MHY5NXhHdXFTaSsrcHlTTHd5eHkx?=
 =?utf-8?B?UDZOQkQwYXBkai9oRC9kd1l6dmoxVUlBVGoyUTF3YUJoV0dDN3FINFNsOWFW?=
 =?utf-8?B?K1kxSC9VYUEvTzViTHRvbVRBSDdJazJLQiswaHNPR0lEVk1pcmhJbmJnQnNK?=
 =?utf-8?B?L1didDdkaEdyK1hzVVFjUU9FWVkxR3d4b3JPUFdyQUN3T3JnNmhZSEhvNWUy?=
 =?utf-8?B?a0ZqcmhBSzNtZU1SM0o2VWUrNmNPTis0ZWRhUGhRSStTMEFsSlFQTTBvRkNX?=
 =?utf-8?B?YXJPY3cwRThSVHRvMEF6TUYzUk5FTzYyN24ydjI3VFlESHVEaFB1eHVVRWpP?=
 =?utf-8?B?czk3WlRCV2hjNTdOd0kvbDk5dFRIZTdndkR2emZNTGx3RG5CS09wQTM2akp1?=
 =?utf-8?B?S1lyT0VISmlDQVREWFVqU1g4OUtvT0d2d21pdHhWMURxZ04wc0UwOGtxaGlZ?=
 =?utf-8?B?cnNTVDYrNjdiSjZmVEo0U3VFYVVFZXF6TWRiendRSEQ3M0Jpei9RQ2Z5NlMz?=
 =?utf-8?B?LzhnamJkMExSZkxkVkpNYlJKWmJIWWYveVcrMVJzL1NlM3BIOG9UeWJ3azZr?=
 =?utf-8?B?VHhoM2o4NzBiaS9za3lEcU1Yb2FvVXc5d016algwblJ3YmQ0cmpkOEtFYnk2?=
 =?utf-8?B?R0pmNUQ0WExVbHdsN0NCczY3Um9yRmZTQ1p6V0NBejhVMnd3VTFSSnVuNjFR?=
 =?utf-8?B?Ujl6cE9KUUJYQmFLc0pZR1B4VUY3ZXV4b0crOG1kNXFGZXl1eVJRYk9sVjhK?=
 =?utf-8?B?MUt0V3ViR0taOFRvMHJlZ2NOUnJHaHRSTjF5V3RUS2pxY29Fc01BOU9vYWF2?=
 =?utf-8?B?ZWZuYUd3cEY5L2RuMi81UGtHRlE3dUQ5UExkVjQ4NkFyNFgvblQ0aFFOM0Fi?=
 =?utf-8?B?RTJ5cno2QXhFRmN6eVpWTmh5N3NoM080VEJER1BuWHY0NWMrNGtBbGFWRjQx?=
 =?utf-8?B?Qm05c1djUE44YW83Znp2S2Vac2hSRWZJU3VLVzRKZUV0MXVmNkErQT09?=
X-Exchange-RoutingPolicyChecked: LwfThEuVAOC0FW/gnsnKgvlslPMyt9txfM0Cw461VMPnBf9YC6Rn0MkLDgkHPyW8BVu2Ldhkoc1lpxcT54OZj8ryg5TTPXNu9IF6Vut7tJ6TG1pFor1Kmbg3MuOjjAjtbRqKG9TYmwAQ5GmEnHmbOxtYEWhf4C9wD42r73OCoes6RDYdC5ytakv3NAHv2SfzLZblccNJKWK77ih5zcIn0Ugk3wBkyrHSW9iuV0BxZ2fu9uCkhQYKqSQodz2BuSSi4qUwln9Aerk+q7ZGU61gX/Le7JcWgBD9z51+syD848j4MfBMA1iNebXfpbjCek3kidY9JavG466ixhVhUGihOA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a77a7d2-5ed9-4c96-1591-08df101a538a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:35:37.2386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mq3Gk716b8XfM/fHT7qPBKWLBIwa270JMbnnHdR8UtWvNVjnufGIRI0bSXWgH4hfMNIdZfyamKNUVkqYTB26Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4994
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNyBTYWx0ZWRfX3uNPh3o65SEx
 Wl/MH9I6NHxPnM7Jsx4CUAARycSgsGV7G/MzKdELmk+BTmyZftmgXqR8rDbPfljuWMt6g8GRUy2
 q9FdPHNe1Sx/bshqeAcrmvgHH0ygJY0kJBxIiOsHE9/klYCbt+R+
X-Authority-Analysis: v=2.4 cv=Ao17T+9P c=1 sm=1 tr=0 ts=6aa41fcc cx=c_pps
 a=ht+bKkBNmLq2ln/DE6MnYA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=gAnH3GRIAAAA:8 a=U2rnmQ6gAREaLmfcDAIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: itlix_obajf8U7mf9KXEpXx2Oqv7-e5v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNyBTYWx0ZWRfXz+Ux2+3pmnPS
 ocbpGm1xlvy6iL+m4Nk4JWw7pOCiwfUQR5bk+LTrlY7xD/1Z/YtFyfuuGv0FTE4PARcaoIYmLs5
 xmU+hBIcdm1gICwxN1RiRXUlgwS8Hm3irS+3DiInURuIp4O9eSncGjD75UsWAv5LWHfgbFA+9AZ
 24deubw+Bp3NasnkPo66Q2w/M77R+4imJOdvg1YrCG/M7Kvc556SuPoTI6KCHwwbQE8hGNhLQyZ
 SeMflYydli0W+fMlXORPx1OVUG9FpdUEog/XGOTXKP5Kr4/IrrXj+y+60alOSN8GFH7SkrUBewb
 Ft64y5syUsrNLvSs4dNUzd2H9WiYlUMBE8Ux8CWqqe0Knp1vInxxupu65c44wlqRSI/egwyzwUd
 jtPoS+e2tf6r70ve0Vsbz2ZtB67eRpIyeD47EelT7c+rasbaAAX9lbcrpJm32NLq0T/pq7RTKUU
 5+BTVwQO75+TGcoQE/Q==
X-Proofpoint-ORIG-GUID: itlix_obajf8U7mf9KXEpXx2Oqv7-e5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1011 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_083546_520117_DB6C03A9 
X-CRM114-Status: GOOD (  15.43  )
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

QWRkIHN1cHBvcnQgZm9yIHRoZSBJU1NJIElTMjVXWDAxRywgYSAxIEdiaXQgb2N0YWwgTk9SIGZs
YXNoLiBUaGUgcGFydAppcyBmdWxseSBkZXNjcmliZWQgYnkgU0ZEUCwgc28gb25seSB0aGUgZmxh
c2ggSUQgYW5kIHR3byBCRlBUIGZpeHVwcyBhcmUKbmVlZGVkLgoKVGhlIGZsYXNoIGhhcyBubyBT
dGF0dXMgUmVnaXN0ZXIgMiBhbmQgZG9lcyBub3QgaW1wbGVtZW50IHRoZSAzNWggUmVhZApDb25m
aWd1cmF0aW9uIFJlZ2lzdGVyIGNvbW1hbmQsIHNvIHRoZSBkZWZhdWx0IGFzc3VtcHRpb24gb2Yg
YSAxNi1iaXQKV3JpdGUgU3RhdHVzIGNvbW1hbmQgZG9lcyBub3QgaG9sZC4gQWRkaXRpb25hbGx5
LCBpdHMgQkZQVCBRdWFkIEVuYWJsZQpSZXF1aXJlbWVudCBmaWVsZCBjYXJyaWVzIGEgcmVzZXJ2
ZWQgdmFsdWUsIHdoaWNoIG1ha2VzCnNwaV9ub3JfcGFyc2VfYmZwdCgpIGtlZXAgdGhlIG1hbnVm
YWN0dXJlciBkZWZhdWx0IHF1YWQgZW5hYmxlIG1ldGhvZDsKY2xlYXIgaXQsIHNpbmNlIHRoaXMg
aXMgYW4gb2N0YWwtb25seSBwYXJ0IHdpdGggbm8gcXVhZCBtb2RlIGF0IGFsbC4KClNpZ25lZC1v
ZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Ci0tLQogZHJpdmVycy9tdGQvc3Bp
LW5vci9pc3NpLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9p
c3NpLmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwppbmRleCAyZjA1N2Q3MzFkZjIuLmFh
YzlkMTliOTBmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMKKysrIGIv
ZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMKQEAgLTI5LDYgKzI5LDI5IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgaXMyNWxwMjU2X2ZpeHVwcyA9IHsKIAkucG9zdF9iZnB0
ID0gaXMyNWxwMjU2X3Bvc3RfYmZwdF9maXh1cHMsCiB9OwogCitzdGF0aWMgaW50IGlzMjV3eDAx
Z19wb3N0X2JmcHRfZml4dXBzKHN0cnVjdCBzcGlfbm9yICpub3IsCisJCQkJICAgICAgY29uc3Qg
c3RydWN0IHNmZHBfcGFyYW1ldGVyX2hlYWRlciAqYmZwdF9oZWFkZXIsCisJCQkJICAgICAgY29u
c3Qgc3RydWN0IHNmZHBfYmZwdCAqYmZwdCkKK3sKKwkvKgorCSAqIFRoZXJlIGlzIG5vIFN0YXR1
cyBSZWdpc3RlciAyIGFuZCBubyAzNWggY29tbWFuZC4gQW5kIFdSSVRFIFNUQVRVUworCSAqIFJF
R0lTVEVSIHRha2VzIGEgc2luZ2xlIGRhdGEgYnl0ZS4KKwkgKi8KKwlub3ItPmZsYWdzICY9IH5T
Tk9SX0ZfSEFTXzE2QklUX1NSOworCisJLyoKKwkgKiBUaGUgQkZQVCBRdWFkIEVuYWJsZSBSZXF1
aXJlbWVudCBmaWVsZCBpcyBzZXQgdG8gYSByZXNlcnZlZCB2YWx1ZSwgc28KKwkgKiBzcGlfbm9y
X3BhcnNlX2JmcHQoKSBsZWF2ZXMgdGhlIHF1YWQgZW5hYmxlIG1ldGhvZCBhdCBpdHMgZGVmYXVs
dC4KKwkgKiBNYWtlIHN1cmUgd2UgZGlzYWJsZSBpdCBhcyB0aGVyZSBpcyBubyBxdWFkIG1vZGUg
YW55d2F5LgorCSAqLworCW5vci0+cGFyYW1zLT5xdWFkX2VuYWJsZSA9IE5VTEw7CisJcmV0dXJu
IDA7Cit9CisKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgaXMyNXd4MDFnX2Zp
eHVwcyA9IHsKKwkucG9zdF9iZnB0ID0gaXMyNXd4MDFnX3Bvc3RfYmZwdF9maXh1cHMsCit9Owor
CiBzdGF0aWMgaW50IHBtMjVsdl9ub3JfbGF0ZV9pbml0KHN0cnVjdCBzcGlfbm9yICpub3IpCiB7
CiAJc3RydWN0IHNwaV9ub3JfZXJhc2VfbWFwICptYXAgPSAmbm9yLT5wYXJhbXMtPmVyYXNlX21h
cDsKQEAgLTEyMCw2ICsxNDMsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmbGFzaF9pbmZvIGlz
c2lfbm9yX3BhcnRzW10gPSB7CiAJCS5pZCA9IFNOT1JfSUQoMHg5ZCwgMHg3MCwgMHgxOSksCiAJ
CS5uYW1lID0gImlzMjV3cDI1NiIsCiAJCS5mbGFncyA9IFNQSV9OT1JfUVVBRF9QUCwKKwl9LCB7
CisJCS5pZCA9IFNOT1JfSUQoMHg5ZCwgMHg1YiwgMHgxYiksCisJCS5uYW1lID0gImlzMjV3eDAx
ZyIsCisJCS5maXh1cHMgPSAmaXMyNXd4MDFnX2ZpeHVwcywKIAl9CiB9OwogCgotLSAKMi41NS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
