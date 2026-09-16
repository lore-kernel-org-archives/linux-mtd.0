Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3EBC88E5C
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Sep 2026 08:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8sO7bCK/uMorQnvxHGQN8BVTVdRqzJXrvMKOJ+u5yA=; b=UoPzVRH07iWth7
	YUxZirUD8DAiLA0zRD6zoTkCIUebGepZCQVfEqa635cmowLg3oZPABP/WODVrAzgrcB/qicfcTNvu
	vTrgfh1M6ZXqH+gBEqd1UzajxnV4ffsZlgUTt4euulJYfKE2tBUiP+fF/dvukuQkmqxyauFFZSck+
	r5P+qS0kNBwLtzxMBMHsfTIlAiykwL/ntsOWnGjWwoa3rsZyXNcGCvGsXmDIawW62aXCifx6JCbxE
	/n9nVYKCXt7tVXCsfS8bS02msitHr0ZUclwx/No3fwuwZQtzwICl/KKcR4wv+5jhCGlU7q0w+9Wm7
	/nX18CtHz1Q7eRV2iHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lFQ-00000008kI5-2cNm;
	Wed, 16 Sep 2026 08:44:08 +0000
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lFN-00000008kH1-3XH8
	for linux-mtd@lists.infradead.org;
	Wed, 16 Sep 2026 08:44:07 +0000
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G41wdJ3576164;
	Wed, 16 Sep 2026 04:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=QGmNU
	AzIxuMW6IOvNwiBwWcGjnW7V9PnE1EWCZAXf30=; b=z7p11UeEihuJbWAvpJFf7
	pPR1R++xuOs2QZi06LXVDZPZjTPVyJeRO6EEdwUOCYKDK/f+P53CpTc6qC53YCB7
	ojVr015h840WBKFKgf6JaRpB9EPk+vIaGNRkK+birPFp0KqgIssMfgvYPqEIy7WN
	YnRExje9efurHJ3qD3/m+mOPrCr9erEMvOsitOSNVGOnv2LlXfffkfglkPnp0ezy
	Pm1ILB6MUXh4SvSDqcxG5God5xp8oPERR4i4aqZwN9E0DrjcobAvSvQQeWBUqI0T
	FOxSWsFgjiVsIBxEhE9AvzJLiNHgpiUPIN7Er0QeZ8nbibIlL69vHaDC/MWjHwMl
	w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gq5trc8cg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 04:43:52 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyvAL67BhA7oPONw4+ANL6ajUPk6+59DhHNkbJ2tTkclxrDsXZ2XGM/VPrDThjlWmqC07cmu5372ErCQ6y6UpvKsJNsp6AuXpZgbIwLM5utXyu1MjIlCvTpophGivHMptAEZ20M3yLBoKCluaLnaSX0ByI1Xcaom/JNC03p5yB/GvPe32XycasO3kAn6UdNJirQHJhMhWAwd6NjzndGZIdEWJOkpEZ4BfNa8rVDCVxXAymaqJSVLLmjci97oB4qgMBVOBuD76SSD8m5Bc6ARrlzJ9QEsEHf5rH9y3m/KRcu6vo6AFvmTWfUDpHCYA6qE+s0iHq9dIEnvagbuTdi8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGmNUAzIxuMW6IOvNwiBwWcGjnW7V9PnE1EWCZAXf30=;
 b=LfQIHAkGBWx6KMWlNkinkllrMxPdMgmsi4kcAK5jeJo2vU/qS1HXBRh8zHRSwxFrpJLEuAk5GYDiaVUdhuvaMBvlY6ZFyC1Ic9sGnkKykyz7zAnqF5TXqD6E0L1eIoHaA+rLsJFWi5MdPr7QJX6Y7X0ENNlPvD7omUwCCMfoz5c3ohKAxYwfyeVL1kda7maZ25BBQroJLkQeDKLEPCgoI2W5s1GMUsOExd8c0b/x1avacXmTTDGzQYe/uRgfycTSPshqWkHgYjSChcwI55Ne1bdofq7ycaDK+VlyFMUJ6rBQd8prwf5mAIhjIhDzrX9lGNf65KG/tAWy+TSxQF/07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MN2PR03MB5023.namprd03.prod.outlook.com (2603:10b6:208:1a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 08:43:50 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 08:43:50 +0000
Date: Wed, 16 Sep 2026 09:44:59 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <aqpTO-5LTLtRXaY4@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
Content-Disposition: inline
In-Reply-To: <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
X-ClientProxiedBy: MA3P292CA0062.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::18) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MN2PR03MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 77754a1c-21c6-4970-65ca-08df13cea19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|56012099006|5023799004|11063799006|4143699003|3023799007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: sLt51HubCt97fAg0msz+Fv2Qc5epiKhfah47aKiMgmUx9dwl6g9zPkW6sHl+DqBYSruNFSh7ByFQ/c+q33sgRbxhLZZfi4TInrPOvR3Tr6pW8aG8kkHLz928+XhfXwDa41v/g+SmenYRJESfsc1lPe3c1VK0tISKeKgjZEsFUD5PmGDknu7Gf1oQJFJiHDT3L18gGyLJrKRYHnvzgs6H9ayfbzZvq1382F2z7Gyfj/ucnt2/mxHMH/owB3JwXNlr709crG5jM5uxOVkDdbL833dRoA+SCMDWoix9Ni9nRWyv6MNzd+Ucqkwq665WIsUVBHi8alHQjrZNm9L/vZhCYZcni5CkN6DsNAhm4ZqTwIv4OHaofuGTKSIoNk+qtMH8HcOid3qOvDQUajruqV+rQWRvQ8qxMp6+0G30Itv7FrThrqlOS7yrIp982nvJWMs28GarbXfyzi7Sm7W/J2ZzxZ9BAfGpykAKz66PwTTWOYa9vY9S4J5PFg3egHTlR0+3P+FY3YysBDrHSdYle0/Zg5lqwZ5kz1bFv8jEdUWsmoeu3ZbjpFko4Q108eR96kZiiUoavXz8usXoacJGMeboYtrSPcueAPjZ1VF5or49IzQ9b+FKmr+Q+akfBbPhzRB6tgQ5PjvJl5DIldHfo1dCWwIBeH+WhrLQNeLiRZ4ZjFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnFTR2RjaXRQbTIyMWxYMmhLSTk4cEVzSTdNMGFPNDlXMEVER0FlMnRTMEp0?=
 =?utf-8?B?bTF5R3QzamZvdUhPeFNGamZKN0xBZHNsdUhlUjV1aWdpQWg4TGM3dXFYcFBn?=
 =?utf-8?B?SjJvcy80RklmMkRlSVRPdnlZR2ZmUlM5cWFvRlF6MndIWEYzQzIweE5OcHcv?=
 =?utf-8?B?WUZadk9wRjVOU3FQV3U2YUxFZDRpUFBFbElmMi91QmpTeTR2WVJQNkVTRVYr?=
 =?utf-8?B?N2FZUUxsMnNEcHJJajlVUGE1ZXhMcDcvaGZmM3RCZnhTNVlmUHc2VVRUZzRm?=
 =?utf-8?B?eTB3UEJ3L1h5VG1LRDlyRlMwVHRjalVkRVJ3UHBPa2FHbVZENDlWRGpFU0w0?=
 =?utf-8?B?VFhnYkVBclppQ1pOYlNCTGNoa3UyYkxYOTBySkxNRUdmWVJJdG5wSzlnTlN5?=
 =?utf-8?B?NDFkQm12MThCVWs0MGFkYVEwOG11azZSK2czaU1qUHlyQ3Y3T3Z6TUNTNzlK?=
 =?utf-8?B?aTFYNVpUbyt6ZVJWT00vQnlpZHB1RGZhZjhDc0hBbFNPTFg3MmZoY1ZaQkdX?=
 =?utf-8?B?Y2lUWWdweEo4dTlaZ1NJMnFEOVA3SjErK0RtbVRsSUwxODMwcTUrUVpoNkw1?=
 =?utf-8?B?L2Yxa3ozMkZTYVdmTERQM215ZWplbTJENlI1UlFWMHV2UVpaTXYvczlMbzQz?=
 =?utf-8?B?WE1EM1g0Z2JlZ1JJdDZnUUdQcytsZldHcDVVRGk2eEdXeStPcVBCcVBKUzJG?=
 =?utf-8?B?MHNtNlFhMU5PdkdNelpIbTM5VEVZb25VTEYyY3R4RXF3YXM4ellERERUNWth?=
 =?utf-8?B?VEtTenBwdmc0SkhOalZ1YVZDL0VQLzlqaUYycXBjY1dpRHBVcXFOSlBjN3Q5?=
 =?utf-8?B?MWNvZm1RM2Jrb2NOcC9hcXk4WUovd1draC82emJoMEpheU9oMlFHb0UyWEVS?=
 =?utf-8?B?Wnp0S1RFdVY1eHIxM3l3bUw5UjlCSWxMQmxraE5sT040Zzg4WTFaSDhUZmht?=
 =?utf-8?B?QTBSa04wa3hobVk1bi9OTGY2VmNkVVJzTmQ1aThTQVhlZncvYXl4U0xoRnBw?=
 =?utf-8?B?TlpPQ1FDVVhTOGhic0tia3hpdDBpN1JDRXFUNFBmRXJMY25rdXVvV0NVQjg1?=
 =?utf-8?B?MzB6ZW5UbzJpdFVjSjNpVEJBc1o2aGhXRENpYmpDTW15QUszRk1NNUMxVzAz?=
 =?utf-8?B?cGtQUysxZE1VbGIvbWRXZVNmU3dtU3hITTYxelNHMW9kN1pFWFBKMU0wTEs4?=
 =?utf-8?B?dU1DK3czNmZEdGxZWVlNdnd4UHdVM1R5QzRoRkFOVWNqYUhtNDRKcG82K241?=
 =?utf-8?B?WlVDbmhvL1RQTlU1L3kzNFpIRHg2N2FkRUZRV21ieDJhVUJkQnQxdTZ0WHBl?=
 =?utf-8?B?TE10eEtOTmpVdFVIeHJmKzNkUUd3ODA3VlpyVXV1V2x0YVM2cWVtck40UTQ1?=
 =?utf-8?B?dTN1VjFnTFFEVDZtWEx5bEx5ekJhZE5LWE5iNlliRDI2MVdVa1JscytZTDV3?=
 =?utf-8?B?RE5Ydml3anBXeXhFRWhtZk1GUE1JeHlwcVF2dUJXSG00S05FY3RiZGVnWDNC?=
 =?utf-8?B?NXNQS2UzR2FxdWtkWHFZUWJtaHBUSEFPOXFYVFM0dVhvblVmTlNLSjFTUjh3?=
 =?utf-8?B?OVFuUWJ0VGpVYVROL1pzbUZsU1owRTJBNm1XbDc3Rjd2RU05Uzh6RFBDMEll?=
 =?utf-8?B?c1RHTy9pYlo1K1Y3MWZEN1FrdVRwNUsyTlJDVHo1V1A1V2xpUjdjY3ZqVkwz?=
 =?utf-8?B?d3BHQ09VajBWTnhrek80QVNjVkdPajd4V3hDVGY4S0tSSFFsVXhxKzVia1cy?=
 =?utf-8?B?ZkN1SDB2SlZaWjNIdHhuZFN0d2hkeGpzbm5ZQnV3dFk5WWg5TGRzVzVITmhE?=
 =?utf-8?B?dkQxSjdYaS8vSXBRd1NZRkNzRkVTODRhOVl3YVVRb1BYQW03c0FFUC9RaTFW?=
 =?utf-8?B?Qmk2ZWlacW5HUFA4akVDekpTdkM4akJmLzJ4cDNlWmEwUUJYdlFDWGp6SjBR?=
 =?utf-8?B?RkcrUk5ka1JVanF1MFNsOGRlbHMrYVhubCtVMlFVa1c3eE5lZmRrUmV1b2xm?=
 =?utf-8?B?RkFuYUNnVUhlcGd0UGNhN2t1WEtoT3lwVyt0L1pKR0RNdzRSeDArenIvL0tE?=
 =?utf-8?B?RDFXdFJOVzV3U3krOHJNQjJZVWlVd3RmREQzWWVYalB5cW4rNGxwQ1hvTy9N?=
 =?utf-8?B?K2dzdHRmZ2phZ01PWFFEQXZrVkVrOHVtK2VaKy9HblZrNWVhNThSaFFmN3RL?=
 =?utf-8?B?Q0djYkZTcTFRWVF3QVY3R2g0VElxZXBNclcwWVVMOW9hMStOT2ovWWkyUE5U?=
 =?utf-8?B?RkFSbjBIbkkzaXVoWXdqY05vZkF5NHlxaTJxc0dadStzSUJVZmV1VENjek5Y?=
 =?utf-8?B?QTFjVGxzTElnTVBPNWVhQlFlL08wWTRGSXRrNzQ4TFdBREw5cHpmUT09?=
X-Exchange-RoutingPolicyChecked: 4HXZO7FvG+EEJ8BnodaBzBpBA86LhTlongFVTXw22DduB7omU9Pb3SaC4Yso5Zs153h58vMaMFZ2FBmzudNrQYwTeBkP+ajN9rIfU2FiSTJPDMfI0i0VTtAcZRA84Htvw48LlPXZ4iM9E7/RDBAAFQGcf86kizV/1nsTsBOmIx0gy98RcP1HoeD0boc4McCa0x8PYFep74TDoCcItKIty9ZoRuH9Wsf9r7TTAYmC7xwW2y1LNYhVGqHH/gI+wOztvTqtjzOuGg/O8go345Nx8Qtu9pXyOj15Irz1yL6kv4nIr1v2to8b51jKiB4daV2V8YjgNuvV5X1S3yx6LVxDsg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77754a1c-21c6-4970-65ca-08df13cea19c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 08:43:50.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpvfPCrSYMJGBgFpgfxrxxAV+OnxeJJA70vGx7ns4XKPq4rYCRD1NZly4ag7K4c1ZwuvMPmiBn7Bd+h8KmXi2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5023
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfXxv7kRhQUvw1J
 aReiq5N2PoUZsB12S//FAaLHRtFBD9BjVqjB9Mqf234Pm6er8mP/QM877MH0olMkP7fz7FDDmD9
 Ise5LK09JGc9ZMoDkpeZnZWKbPrGtalbwbHkVyckGl3tX8iMprYk
X-Proofpoint-GUID: Sf6ikGTwPJxXsoTWQa-2hAKud1SQAHMj
X-Proofpoint-ORIG-GUID: Sf6ikGTwPJxXsoTWQa-2hAKud1SQAHMj
X-Authority-Analysis: v=2.4 cv=aYX0Dhot c=1 sm=1 tr=0 ts=6aaa56c8 cx=c_pps
 a=W+em2WlbpAENNNrDSTAr1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=paFjG48bRarWj7HP55cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfX34muGGuO1QkL
 mKPZH4VcBilhNJ20eChL0PAK5XX0qt9ji9XSJO8NImqeEnbAjSsmzyGVB4W5+2Tqpgjxw3ccGN0
 x+j9E1GcPKgrwXW1ZQuQz7axk/RhD/76e61vqcyBdQEQFoa9asxJjldwm5dZNz7LM+B+Vph9py7
 sj0XrbVfwwMA1magBJbgZcZGmCqxcfnAzUQR9INTb4OPDTaerRz530/vwwaY/b3ms3FyM7enGKu
 j4/YJ9++sx8tQi9u1/n8IlTgeiHcSJBQEMXs2dVT/96otcEuSpul68HnVolmSLNffm5N7QEUEdj
 31eUSddnhi32VJjo39ySs51W8PqcCfGLo0PTcfZ75GZQgu36kySYy4uBZF9lx/0tsNLjFlgIqb0
 ZxRVLOW5dtdQb19mYw4yKVNU9Vyw0EaWITcgHqnP/KdjLHzaWynDHPrynRhc0KmgqVbsaSWPkox
 ox6GhdnzlPn8hANq+yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_014406_002434_3D46860F 
X-CRM114-Status: GOOD (  48.66  )
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

T24gV2VkLCBTZXAgMTYsIDIwMjYgYXQgMDk6MTQ6NTJBTSArMDIwMCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDU6MzEgUE0gQ0VTVCwgTnVu
byBTw6Egd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAxNCwgMjAyNiBhdCAwNDowNDo0MFBNICswMjAw
LCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+ID4+IE9uIE1vbiBTZXAgMTQsIDIwMjYgYXQgMzo0MiBQ
TSBDRVNULCBOdW5vIFPDoSB3cm90ZToKPiA+PiA+ICgqKTogSSBzaG91bGQgbm90ZSB0aGF0IHRo
ZSBjb21tYW5kIGFjdHVhbGx5IGZhaWxlZCB3aXRoIC1FSU8gYnV0IGl0Cj4gPj4gPiBhY3R1YWxs
eSB1bmxvY2tlZCB0aGUgY2hpcCEgQW5kIHRoZSByZWFzb24gaXMgYmVjYXVzZSB0aGUgZmxhc2gg
YXMgdGhlIHNhbWUKPiA+PiA+IEZTUiByZWdpc3RlciB0aGFuIHRoZSBtaWNyb24tc3QgZmxhc2gu
IFNvIFdFTCBpcyBzZXQgdG8gMSBidXQgY2FuIG9ubHkKPiA+PiA+IGJlIGNsZWFyZWQgd2hlbiBj
bGVhcmluZyB0aGUgRlNSIHJlZ2lzdGVyLgo+ID4+IAo+ID4+IFdoeSBkb2Vzbid0IHRoaXMgYWZm
ZWN0IG9ubHkgdGhlIGxvY2tpbmcgb3BlcmF0aW9uPyBXRUwgcG9sbGluZyBpcwo+ID4+IHVzZWQg
YWxzbyBkdXJpbmcgd3JpdGUgYW5kIGVyYXNlLgo+IAo+IFNvcnJ5IEkgbWVhbnQgV0lQLgo+IAo+
ID4gTm90IHN1cmUgaWYgSSBmdWxseSB1bmRlcnN0YW5kLiBCdXQgQUZBSUNULCB0aGUgcmVhc29u
IHdoeSBlcmFzZSBhbmQKPiA+IHdyaXRlIGlzIHNpbGVudCBpcyBiZWNhdXNlIHRoZSBkZWZhdWx0
IHNwaV9ub3Jfc3JfcmVhZHkoKSBvbmx5IGxvb2tzIGF0Cj4gPiBTUl9XSVAgWzFdOgo+IAo+IFNv
IHVzdWFsbHksIHRoZSBXRUwgaXMgY2xlYXJlZCBhdXRvbWF0aWNhbGx5IGJ5IHdoYXRldmVyIG5l
ZWRzIHRoZQo+IFdFTCBpbiB0aGUgZmlyc3QgcGxhY2UsIGkuZS4gcHJvZ3JhbSBvciBlcmFzZSwg
d3JpdGUgKHN0YXR1cykKPiByZWdpc3Rlci4gVGhhdCBzaG91bGQgYWxzbyBiZSB0aGUgY2FzZSBm
b3IgdGhpcyBmbGFzaC4KPiAKPiBOb3cgZm9yIHRoaXMgZmxhc2ggKGFzIHdlbGwgYXMgdGhlIHN0
L21pY3JvbiBvbmVzKSwgdGhlcmUgaXMgb25lCj4gcGVjdWxpYXJpdHkuIFdoZW5ldmVyIHRoZXJl
IGlzIGFuIGVycm9yIGJpdCBzZXQgaW4gdGhlIEZTUiwgdGhlIFdFTAo+IGNhbm5vdCBiZSBjbGVh
cmVkIGJ5IGEgd3JpdGUgZGlzYWJsZSBjb21tYW5kLiBXaGljaCB3ZSBzaG91bGRuJ3QKPiBuZWVk
IGFueXdheSBiZWNhdXNlIGl0IHNob3VsZCBiZSBjbGVhcmVkIGF1dG9tYXRpY2FsbHkgaWYgbm90
aGluZwo+IGdvZXMgd3JvbmcuCj4gCj4gQWxzbyB0aGUgd3JpdGUgc3RhdHVzIHJlZ2lzdGVyIHdv
bid0IHNldCB0aGUgZXJyb3IgYml0cyBpZiBpIHJlYWQKPiB0aGUgZGF0YXNoZWV0IGNvcnJlY3Rs
eSBhbmQgaXQgd2lsbCBhbHdheXMgZGlzYWJsZSB0aGUgV0VMLCBzZWUKPiBUYWJsZSAyOSAoIldS
SVRFIFJFR0lTVEVSIE9wZXJhdGlvbnMiKSBpbiB0aGUgTVQzNVhVNTEyQUJBIGRhdGFzaGVldAo+
IGFuZCBUYWJsZSA4LDggKCJXUklURSBSRUdJU1RFUiBPcGVyc3RhaW9ucyIpIGluIHRoZSBJUzI1
V1gwMUcKPiBkYXRhc2hlZXQuCj4gCj4gPiBPVE9ILCBvbiB0aGUgdW5sb2NrIHBhdGggd2UgZG8g
c3BpX25vcl93cml0ZV9zcjFfYW5kX3NyMl9hbmRfY2hlY2soKSBhbmQKPiA+IGdpdmUgbm8gc3Bl
Y2lhbCBoYW5kbGluZyB0byBXRUwgc28gSSBpbWFnaW5lIHRoYXQgd2UgdHJ5IHRvIHNldCBpdCBh
cyAwCj4gPiBidXQgcmVhZCBpdCBhcyAxIChnaXZlbiB0aGF0IGl0IGNsZWFycyBvbmx5IHdpdGgg
RlNSKSBhbmQgaGVuY2UgSSBnb3QKPiA+IHRoZSAtRUlPIGluIFsyXS4KPiAKPiBXZSBkbyBhIFJN
Vywgc28gbXkgZ3Vlc3MgaXMgdGhhdCBpdCdzIHRoZSBvdGhlciB3YXkgYXJvdW5kLiBXZSByZWFk
Cj4gaXQgYXMgMSwgYnV0IHRoZW4gYWZ0ZXIgd3JpdGluZyB0aGUgU1IsIGl0J3MgMCAoc2VlIGFi
b3ZlKS4gVGhhdAo+IGFjdHVhbGx5IGFzc3VtZXMsIHRoYXQgaWYgdGhlIFdFTCBhbmQgYW55IGVy
cm9yIGJpdCBpbiB0aGUgRlNSIGlzCj4gc2V0LCBhIHdyaXRlIHN0YXR1cyByZWdpc3RlciB3aWxs
IGNsZWFyIHRoZSBXRUwgYW55d2F5cy4gQ291bGQgeW91Cj4gZGVidWcgdGhhdCBzbyB3ZSBhcmUg
c3VyZSwgdGhpcyBpcyB3aGF0IGFjdHVhbGx5IGhhcHBlbnM/CgpTdXJlIEknbGwgZG8gc29tZSBk
ZWJ1Z2dpbmcgb24gdGhlIHVubG9jayBwYXRoLiBUaGUgRFMgc2VlbXMgYSBiaXQKdW5jbGVhci4g
SXQgYWxzbyBzdGF0ZXMgKGZvciB0aGUgV1JJVEUgRElTQUJMRSkKCiIuLi5JbiBjYXNlIG9mIGEg
cHJvdGVjdGlvbiBlcnJvciwgV1JJVEUgRElTQUJMRSB3aWxsIG5vdApjbGVhciB0aGUgYml0LiBJ
bnN0ZWFkLCBhIENMRUFSIEZMQUcgU1RBVFVTIFJFR0lTVEVSIGNvbW1hbmQgbXVzdCBiZSBpc3N1
ZWQgdG8KY2xlYXIgYm90aCBmbGFncy4KIgoKQnV0IHRoZSB0cnV0aCBpcyB0aGF0IHRoZSBzZWNv
bmQgdW5sb2NrIEkgZGlkIGNhbWUgd2l0aG91dCBhbiBlcnJvci4KCj4gCj4gQnV0IHRoZSBxdWVz
dGlvbiBpcyB3aG8gaXMgc2V0dGluZyB0aGUgZXJyb3IgYml0IGluIHRoZSBmaXJzdCBwbGFjZS4K
PiBBbmQgSSBndWVzcyBpdCdzIHRoZSB0ZXN0aW5nIHNlcXVlbmNlIGZvciB0aGUgbG9ja2luZyB3
aGVuIHlvdSB0cnkKPiB0byB3cml0ZSB0byBhIGxvY2tlZCByYW5nZS4gU28geW91IGNvdWxkIGFs
c28gYWN0dWFsbHkgdGVzdCB0aGUKPiBsb2NraW5nL3VubG9ja2luZyB3aXRob3V0IHdyaXRpbmcg
YW55IGRhdGEgdG8gdGhlIGZsYXNoIGp1c3QgdG8gc2VlCj4gaWYgdGhhdCBpcyB0aGUgY2FzZS4K
ClByZXR0eSBzdXJlIHRoZSBhYm92ZSBpcyB0aGUgY2FzZSEgSWYgeW91IGxvb2sgYXQgb3RoZXIg
dGVzdHMgYWZ0ZXIKCiJPbmNlIHdlIHRydXN0IHRoZSBkZWJ1Z2ZzIG91dHB1dCB3ZSBjYW4gdXNl
IGl0IHRvIHRlc3QgdmFyaW91cwpzaXR1YXRpb25zLiBDaGVjayB0b3AgbG9ja2luZy91bmxvY2tp
bmcgKGVuZCBvZiB0aGUgZGV2aWNlKToiCgpFdmVyeXRoaW5nIHdvcmtlZCBuaWNlbHkgZ2l2ZW4g
d2Ugd2VyZSBqdXN0IGRvaW5nIGxvY2svdW5sb2NrLiBUaGUgRFMgaXMKYWxzbyBjbGVhciBhYm91
dCB0aGlzICh0YWJsZSA4LjExKToKCiIuLi5XaGVuIGEgY29tbWFuZCBpcyBhcHBsaWVkIHRvIGEg
cHJvdGVjdGVkIHNlY3RvciwgdGhlIGNvbW1hbmQgaXMgbm90IGV4ZWN1dGVkLAp0aGUgd3JpdGUg
ZW5hYmxlIGxhdGNoIGJpdCByZW1haW5zIHNldCB0byAxLCBhbmQgZmxhZyBzdGF0dXMgcmVnaXN0
ZXIgYml0cyAxIGFuZCA0IGFyZSBzZXQuIApJZiB0aGUgb3BlcmF0aW9uCiIKCkkgYWxzbyBkaWQg
dGVzdGVkIHdpdGggYmFzaWNhbGx5IHRoZSBzYW1lIGNvZGUgYXMgaW4gbWljcm9uLXN0IGFuZCB0
aGVuCkVSQVNFIGFuZCBQUk9HUkFNIGNvbW1hbmRzIGp1c3QgcmV0dXJuIC1FSU8uCgo+IAo+ID4+
ID4gQUZBSUNULCB3ZSBzaG91bGQgZG8gc29tZXRoaW5nIHNpbWlsYXIgYXMgbWljcm9uIHNvIHRo
ZSB3cml0aW5nIHRvIGFuCj4gPj4gPiBhY3R1YWwgcHJvdGVjdGVkIHJlZ2lvbiBmYWlscyByYXRo
ZXIgdGhhbiBiZWluZyBzaWxlbnRseSBkaXNjYXJkZWQgd2l0aAo+ID4+ID4gdGhhdCBzdGF0dXMg
Yml0IHNldC4gVGhlIHF1ZXN0aW9uIHdvdWxkIGJlIGhvdyB0byBkbyBpdD8gVGhlIGNvZGUgaXMK
PiA+PiA+IHByZXR0eSBtdWNoIGlkZW50aWNhbCB0byBbMV0uIFRoZSBtYXNrcywgdGhlIG9wY29k
ZWQuLi4gU28gc2hvdWxkIHdlCj4gPj4gPiBzb21laG93IGhhbmRsZSB0aGlzIGluIHRoZSBjb3Jl
IChieSBoYXZpbmcgc29tZSBjb21tb24gaGVscGVyKSB0aGF0Cj4gPj4gPiBjb3VsZCBiZSBzZXQg
aW4gLmxhdGVfaW5pdCgpIHVuZGVyIGEgY29tbW9uIE1GUl9GU1IgZmxhZz8gT3IganVzdCBrZWVw
Cj4gPj4gPiBib3RoIGltcGxlbWVudGF0aW9ucyBzZXBhcmF0ZSBmb3Igbm93Pwo+ID4+IAo+ID4+
IEknZCBsaWtlIHRvIGtlZXAgdGhhdCBvdXQgb2YgdGhlIGNvcmUuYywgYnV0IGFsc28gbGlrZSB0
byBhdm9pZCBhbnkKPiA+PiBjb2RlIGR1cGxpY2F0aW9uIGVzcC4gYmVjYXVzZSB0aGVyZSBpcyBh
bHJlYWR5IGhhbmRsaW5nIGZvciB0aGUKPiA+PiBpbnRlbCBzcGkgY29udHJvbGxlciBpbiB0aGVy
ZS4gU28gbWF5YmUgbW92ZSBpdCBpdCBpbnRvIGEgbmV3Cj4gPj4gY29tbW9uLmMuCj4gPgo+ID4g
QWxzbyBkb24ndCBsaWtlIHRoZSBkdXAgdGJoLiBDb3VsZCB0aGF0IGJlIGEgZm9sbG93IHVwIG9y
IHNob3VsZCBpdCBiZQo+ID4gdjMuIEZyb20gdGhlIHRvcCBvZiBteSBoZWFkIEkgY291bGQgdGhp
bmsgb24gYSBtZnJfY29tbW9uLmMga2luZCBvZiB0aGluZy4KPiA+IERvbid0IHRoaW5nIHRoaXMg
RlNSIHJlZ2lzdGVyIGlzIHN0YW5kYXJkPwo+IAo+IE5vdCByZWFsbHkuCj4gCj4gQnV0IChhdCBs
ZWFzdCkgcGFydHMgb2YgdGhlIGRhdGFzaGVldHMgYXJlIGFjdHVhbGx5IGNvcGllZCB2ZXJiYXRp
bQo+IGJldHdlZW4gbWljcm9uIGFuZCBpc3NpLCBJIHdvbmRlciBpZiB3ZSBzaG91bGRuJ3QganVz
dCBwdXQgdGhlIElTU0kKPiBwYXJ0IGluIG1pY3Jvbi1zdC5jLiAoWWVzIHZlbmRvciB3aWxsIGJl
IHdyb25nLCBidXQgSSBwbGFuIG9uCj4gZGVwcmVjYXRpbmcgdGhhdCBzeXNmcyBwcm9wZXJ0eSBh
bnl3YXkpLgoKQWxzbyB3b3JrcyBmb3IgbWUuIFNheSB0aGUgd29yZCBhbmQgSSBjYW4gc2VuZCB2
MyB3aXRoIHRoaXMgaW4KbWljcm9uLXN0LmMuCgotIE51bm8gU8OhCgo+IAo+IC1taWNoYWVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
