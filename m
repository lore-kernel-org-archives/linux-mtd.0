Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5A6D73EB7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Jan 2026 04:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hEB0WZYri131ZBsqNYox3namQmlHVYzOjTAHPwT7vZk=; b=lQO0DutTrPlUSFcRqwqNqiy+7p
	7GHbrHVAFxrTou4+ZLzTWcCCxFWMckpGCbSqYlQ/QTQJilklIfwJ9pCrykEm0xRSoZE5CIKfaBHW7
	SCNv6s001M+ZdZ9ZOdU8q2iibWDDIQKEV/M+TfdanaUNvFnhcsE8HkxCMfd44qMmyElK6K9JwvfyT
	fywoaGJPCDELzHj/Ud4vEz1rzBbyBBsyAxLMxzzeqWZtsPj1vRht8Hjm3F+rxyrgRtXDFDQ6kjbXo
	5KpNajvEZ0eiRPfri8KlkpPw7lQtfGwOvwW3Lh6asU7dFpBEilCpxlfJDYMWnqKsLskn9YIzdGxqE
	xKGQSYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlg08-000000010PU-2M4b;
	Fri, 30 Jan 2026 04:20:56 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlg05-000000010P7-1arD
	for linux-mtd@lists.infradead.org;
	Fri, 30 Jan 2026 04:20:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/d/pLQS/KFQvY7tsg2LNfVpScYBrCbWCYlRX+B6wPz50tcO9NuqqIewAoog9f8fjHnfm/ose6O4FOIuYE+cG1fqFJe+on0aNCfQvmBOnLvcqb0TTyt55hhdTw8CCN1O41PBl8VjXQxy40caUBtRQA02SD1g7ttuXcvT99pNIYZxU9nzntG/mYCBfoUG9ZwEFUAikcWK2Hk3rfuNf//TU0knpuuZf9LvQwP0+UJq/10xwde8Fu3Wsqeql6WzHdDIP9bOWBp/RsCF4eCqOugG76FTE50PXrXqNiRRDAe5wmUi3ggfq6RmE+MFraCgIFb6BtrJvDnjr06osF40OJr/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEm2gxnZtfkj+CXDb4Q/Jxz8/16ZqI4ZBdwJmsoMRtA=;
 b=sPS6IZFN6UhLLyFZ+a3J5B7z/x6suWC+Jv1OZumB0oyEOLiMidDPQaO6qfnUUHf/7RYiHi1jcisxnLmBBLAMvNOth+TQ4q36TcA+T4uR5PmN7gngeG4HL+qAFqr3bx9y30rw/36XRKTZXb2vXOMJ7PKhtocuZrwGFEllTtmKZsEutZas+ViC+Q9Vm37kmpmuUCJvbkzhKwLZRep+HYbZX/9Sii6m5usV5FeiN45o25QfznzBNnril3snkFebmrREVzh0gtHbXWI7aqPDoGutmJMZywi+tuyADMPNdMlEhjyXPsO/ZUDSq/oYxl26ayAxn5ofctM9biQN7cl8kKWf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEm2gxnZtfkj+CXDb4Q/Jxz8/16ZqI4ZBdwJmsoMRtA=;
 b=sHMYf+mbR+dEV3t6NTk/LdjPxNYW0C78dI7EcJAFm8tEBePk3QCzSRDOEOLLUN32K3xAiPFLB9hGl3FSM+BD7gGGUa8kCYX6W3SGMFATNvHUs820vOdIXQ66t6XhpPgoY2L3w1s78ChV+2hqkyXprrkXXvHGYLYlWJ6UT2VV0pb33Ujfx7e/3+FNyXkt5HsmnB4DHHE79YkUGa4cenkyq8y1z5w673pxKWE5OdI+EXBEjdGRNNxI6KUDZ7cnD0hE+FhjWZek3MipYcddWGZgssmcsvbId15xnQqMw5eF02ttFo5FHpmfo7VfnZTp9FccLcUENpnH+N10+cz6Iqhz+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by DB8PR08MB5452.eurprd08.prod.outlook.com (2603:10a6:10:111::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 04:20:47 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9520.011; Fri, 30 Jan 2026
 04:20:47 +0000
Message-ID: <64828af2-38c3-47d6-acb5-29b4143ef258@iopsys.eu>
Date: Fri, 30 Jan 2026 07:20:44 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mtd: spinand: Disable continuous read during probe
To: David LaPorte <dalaport@amazon.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Martin Kurbanov <mmkurbanov@salutedevices.com>,
 Cheng Ming Lin <chengminglin@mxic.com.tw>,
 Pratyush Yadav <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Gunnar Kudrjavets <gunnarku@amazon.com>
References: <20260130013334.72135-1-dalaport@amazon.com>
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Content-Language: en-US, ru-RU
In-Reply-To: <20260130013334.72135-1-dalaport@amazon.com>
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|DB8PR08MB5452:EE_
X-MS-Office365-Filtering-Correlation-Id: 7521f59e-c9cc-40a0-862a-08de5fb6f11c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STFqV3BWZjFwSGNDSzRhdjhsWCtPRnlVUjcvYVB0KzJRNFBIb0VkTFF6b1lC?=
 =?utf-8?B?UHBlUDhPbnVMREdWbXdieEZZSFFBOCtYZnZFTjh1b1V1THFXNUZpRjBRdXdQ?=
 =?utf-8?B?TjZ2YnVqRnMxYnp1TklwUm5odXJqa0hqdTg0V0I1WFBCNXp0TVlPOU1qNTdM?=
 =?utf-8?B?c0JaNnIrVmVaM0xpRmlmQmxMREc1aUlhb3F5SnpQdDlubFFkWEs3OXlWcjM5?=
 =?utf-8?B?NzY3ZGZJa3Q2eWJjUThNMllXWGVsN3hMM0ZsR3REdEFhTUFxVFpkWHhCcFVv?=
 =?utf-8?B?UVJSMnlTSXVxcjEzZy9wZDg4YVlHQ2hmcFo5NHdPY3hJakdIeWF0c2wvRTJk?=
 =?utf-8?B?U1ZZYkJLd0Zzb09HMFhEWWFsNElNMkRHTTV5b2g3alRLaTFsN2lNbi9IU0w5?=
 =?utf-8?B?dlVXbFJsSHFBckZLV3QwWkdaMTBYMVM3NHplaUJoTW9acXByRkNjNVZQRHlX?=
 =?utf-8?B?QXR4NE1MK2FtR3J6TFl5WVlFVFVLY1I1LytselZXcFVKV3ZnbGRQdGIxSHJs?=
 =?utf-8?B?bVk5K3VxL3JVRjNnSUtMc203dEF5WnNwL3B0aEZ3SWpYczVzQ2RSWjRwNjVt?=
 =?utf-8?B?Vk9OSXRJNk11WDRWTVZ2N0F0UXNoU20wdEE2TSszVDNtMm1hK3NkRjFKL0Jk?=
 =?utf-8?B?TDVHb1k0am9SaGlXc1VTcXlFV1FMdFF2K0tsTjdFSVhRdk5FSHJlZHdrR2tx?=
 =?utf-8?B?Z1lMaWQxNjJHdFlvdDA5YkFKU1FXKzNnVmpSZEY2UzVURzAzdFlORlpLVDhQ?=
 =?utf-8?B?N1RUK2ZlN0xxVTg3c0FoZzgxOU50NnpRZkQwSGR5Q2hVWGR4Zk05NlNkZFhv?=
 =?utf-8?B?Q2tBdFRoWWltU2pOK2VSMVhiVkphL1Y0SDlKSHFtWHNoWnhwS2o0MDFreHZN?=
 =?utf-8?B?eGt4NmZnNEtZMmljVCtCNlVPQXZXRTBrcjlPWjhINkFYUDFVc21PUy8zejFq?=
 =?utf-8?B?dEhwRXpWNG14VkJSVU50aUJGQWJMSVJHMktYbWhiSm81YXgzcXE5WWVQVSs3?=
 =?utf-8?B?NjJtOE9mVjN4aGxTcXhTcC9CN1dZR2RYNHg4QWNYYVk4QW14TlZ4ODlEaFEx?=
 =?utf-8?B?Rms3b0o0aGFLTnlMUmJBbG5iMHBLTzFmQWEyQ0dZTjlJVC82eENENHIwTlhW?=
 =?utf-8?B?NTJUdGlOVHpHeGtDUXhyeFJVL0FhM3pRQkE3NW1lUE1MM3RxeitVdVRPenov?=
 =?utf-8?B?OWViQlBxY05TR2Npazk4Q1RzK0cveUUvYjZEU3ljRXVndkVjRU56UkNvUmFs?=
 =?utf-8?B?bFZvbUV2YUZ5RFdRUUlvM3VnRmV3THRCb1EwcnlEUmJXYWpLc0tzTHUrQStS?=
 =?utf-8?B?T3RCOVBDUVRlWmp5YWliOVFYNUpSVDEzRHdyTkZ4c0xFWGw3WHl2WHBGNGov?=
 =?utf-8?B?a3pvaCtmZm83dnd3bFlvRVBOV2ZmNWpXd2pqQkkrSHk2TS81TzZGUzI1a2pS?=
 =?utf-8?B?V3B0dVFHVTdqNklLUU1EVmFkd2ovWjBPNWZQMmpUREVBdzJBWFFMd0J3MVZn?=
 =?utf-8?B?ckRDZGhhM0thNnhmSjFsdmgvaFBQR2Q5L1REYUx3QnVFdlZ5YXVkaENpaDZz?=
 =?utf-8?B?T2lZTDFyQkZQVFg5c3RCeWFwRVVhMmJwWXhqZWtMcTNyRVFWMmVGNW5UN0sw?=
 =?utf-8?B?YllXVUpqVVVrMmpHVzQvNGJQZjg1MndyYWpmT3ZUQzNkQytqZmpPOEltbmE0?=
 =?utf-8?B?UXBqa21ndyt5SjRFYkZuSnRic1U1UGljcE55ODZxV2dUY3o3Zm1EUVRNeFNW?=
 =?utf-8?B?VmMxN213cHlZamxmMkVNZEtuSTlNakl6STZsSmV0R1NUUkZlc0l2UnA3M054?=
 =?utf-8?B?emEwalJtMWh6MlFoVUh2UDB6azREU0RkbGxiQk9ONFB6WXhSQjlGZ3MvR1Nm?=
 =?utf-8?B?NFZhbG9IZkhqTkNvYUdDbGdFTmV6OWY0VUtaQkFPcDVlZ1c3ZHFyUExySENK?=
 =?utf-8?B?VE1ZYzFWd25MZU91ejRYdUtteXZrOW5COGd2SlpkcU83NTF0aGlraXlHRmpa?=
 =?utf-8?B?a0tpbDQrTHE4VkdVbFlvRzQxMVRja3BReFkrUUJNN0Z5VStLMStNVnMwVC9t?=
 =?utf-8?B?WFRkNGNNQlFGZmlQczByK1hWM0dVVy8rQStja1NpTi8wc0dmU25MRjJaMStk?=
 =?utf-8?B?T3dIOENvU2xmZEo0NC9VeW1tOGQ5cUQ2MnlESU1COEpUNHg2ZnpTdXgzQ3Zl?=
 =?utf-8?Q?Weam7y2w+LlBA/+1B3qpOZg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkdXWmQ4N1Z1OHF4a3g0NjhhenUyWitoME5Ja3dITWhwLzJCZXV5bkdKUjgz?=
 =?utf-8?B?aG1VdHQrOE90alNiQmhqMXBRaTNROFkyYVMzK2ZhWVBTSDJGN25tay9hZTFs?=
 =?utf-8?B?d1grYXA3b0h1aVBJbDZISERsRzcyeUN4VmxPR2VFV1I3ZGJhYWVDbmZ5R2Nv?=
 =?utf-8?B?S3RQbndxSWJNR3BySk16dWhGQ1dLalMzTUJXcTh5RlZVY3dLUzh0VlNobkx3?=
 =?utf-8?B?T29NWGFOZ0U4Z3duRkZ3NHdIeE0vZENzT0xXSFgxU1BUWG1JTVRNV3lYYTVT?=
 =?utf-8?B?eUpudFowL0hLUHd5Nlc5a2FOa1d6V0pBRFpTczdSUHBiTC9DWWZRU1ZFUEJV?=
 =?utf-8?B?aTZNOHFLUGs0bzNKeUpCaWxYMXV3VGRIdzc1MzBLeVhHdWN1NlB2MVVISWZi?=
 =?utf-8?B?YzRDNFE5T0tQdjRLbzJ4bUdvN3VlZlBmdjJ5cGcvY1NVUEZyeXI4SEdqVnN4?=
 =?utf-8?B?NzY2M0VTWEJnMENCTjcyUzJKbHNtOU9tYWFKWHdheExPaFlpZ1dwL3Z0NXFJ?=
 =?utf-8?B?bHFKVFV0NnZGYXcveHlSS2VmcEVuYXVoVnFBMmZNYStjODNoY1VoVkRKTjdy?=
 =?utf-8?B?TzJoK3JaQjVBNWJKSk8xVyt5ZFNZSkNsNUhyN3hnSCtJTFp0dUtFWndxYTRs?=
 =?utf-8?B?TlpZSVNpcDVleE4rd2tKaHlGaFNBMklVODBuNnNzeFFCc3c0blRMT0owalFD?=
 =?utf-8?B?RzdpbkRXZTcxZjhBZmR5NVRua1ZOVm56NkxuWXZTS2hDR2piMVhDVHpVVjdh?=
 =?utf-8?B?MVhkWTRjWnVDOVZYUlVycXhiRi9qc1d2UUJBaEpRa2NxaXROZVZzdTlSMU9t?=
 =?utf-8?B?K1Z5OWNWS1E1RWZnRXVOZVZIRStzZUJNUDExSSs2N3lnSWRQQ1lwQkxZZWlI?=
 =?utf-8?B?b0tKKytKZnNPU2gxVGx4Tms4ampzNkI3R1IzVmNiK2dvNFg3QWx2QzZFNCsz?=
 =?utf-8?B?b3BObTZPVmtiWktLS2ZyM0p4WG1ucXBtT1NDejdUWUpFb2FMVUdOVG04U0ZK?=
 =?utf-8?B?SFhFZEx6UGVjdCtRQlJwSlFqVUR6Nk1kTnlzTmErdnZ5aHowdVh1OGNPSGNi?=
 =?utf-8?B?WUo3OUxSUTlzWlY1RlhvSWxCNUJINXpPOGVSVlJlY2RxZ1FNMzI4RitFdzQ2?=
 =?utf-8?B?a1c0emtPWW9oQjZ2Nm92TWdjdkZzMm5KNEhMWTlGdHVEQ2pXMllnWDhPdnJj?=
 =?utf-8?B?dWZyYTNCb01Sb1hVWWhmOVA3b0tkL2czV0FzQW1tVm1uRFFFdjdENnQyZFBY?=
 =?utf-8?B?NzNHM2pLaTZSVGRJM0tGYlpuS0E3eVFVVjhRdHVVN21lU2JRNlZkZi9pblYz?=
 =?utf-8?B?SXloNHZZTzJudHYxb2RmUjhST1lUYnJlaWFaRGhZdGk1bnFqeStHazRvVzRx?=
 =?utf-8?B?ZDE0bHFFU1VkN3hTSzJQR2RHRkhIZnRtTC9rZXlUVVkydHdvanJkQ2dLbVdz?=
 =?utf-8?B?NlU3T1gxaGFYMDE3MUc5ZTMxQ1JubVJmY0NoZDdmQTVHY3lOZzZOVysySU0v?=
 =?utf-8?B?OUlhemdSZGpidnRiYTlJbkFtVmJwaDkyV0dqM0ZhOXRkWDgrWmNmY1MvTHpu?=
 =?utf-8?B?ZXJ4eXVKT25YYjEzVDI0TXVTaE4rQTkxdEwzdFpxUVNKWlpWWkUzSHNXSGRY?=
 =?utf-8?B?QmZCSnJrcDl4M3VMbWJqQmxjMUo2cVJieUF1VGdsaFh3RU5jVzlzSGZzcGFp?=
 =?utf-8?B?amZtSGVjL3lxWE5KZnE0bkhNSGxCMlNYZnAzaHZUZW9wWHp3aDBjUGVqSnVE?=
 =?utf-8?B?SWtvNXViNEZocVJiTEJCVFE0R0VJQTNjNlZNN3FpVnFCbzNQUkIwemxCODRQ?=
 =?utf-8?B?VlE1LzFaRy9QK01hZ0RNVFVEK1c5QVJsRzVOb0ZVMWpuOTNscDJDNkZTWUhK?=
 =?utf-8?B?UHg1QXZZMCsreDFxMko5eDNNeXY3Yk4zclZweGZNc1NxcXhiSUgzSDkwMDY3?=
 =?utf-8?B?WE1GR1htRGdTeFRYM0xIU042UmZ0cjJsVEZGK29HYVBZd0NkVmxDazRJL3RZ?=
 =?utf-8?B?MFJXV2FUaTdLQ3lCVnRseFFROGlscXA3SzZiZ0tuREVVL0VKWGJveHBkZm9Z?=
 =?utf-8?B?QitFZjYwbWxhNEUvK0RjbnJzT3htV0EwLzAxVk9DU1FIUDduR2U5UERtUmk5?=
 =?utf-8?B?WXV3RllIZmlyQXVLeUw2cldxMXp3OVZnd3B5WWU3S0ZCMUo3T2E2VTRnNzJm?=
 =?utf-8?B?eTR1bEhiZEdldmZFZUM5clMxN1ZkNHd2c1dMQXNCU3dMMk0vVCtma3g0RG9s?=
 =?utf-8?B?MUx3NXpKcGRyNUxBWTY5UktTeXdmejRRancybkxPWHpMOGVqUnk2aWtiUGMy?=
 =?utf-8?B?SWNqRXdaVXkxdGFVMENObHh3MWt0N1g3QlFublFUU1p4YkZXWUV6WG51QmdM?=
 =?utf-8?Q?ANc9V8lt+Kt/OFhg=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7521f59e-c9cc-40a0-862a-08de5fb6f11c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 04:20:46.9546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+uEGVrATBMzDFAcqmg0lR8QQ59pRZEz4oodVcmAjSHXi7KYm137CY5vLU03xyUa2atV4b9Mrnh9fiG4PFuilQ2GBrOnHzGDuiFehwlW6+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_202053_884892_6E820257 
X-CRM114-Status: GOOD (  27.15  )
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


On 1/30/26 04:33, David LaPorte wrote:
> [You don't often get email from dalaport@amazon.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> Macronix serial NAND devices with continuous read support do not
> clear the configuration register on soft reset and lack a hardware
> reset pin. When continuous read is interrupted (e.g., during reboot),
> the feature remains enabled at the device level.
>
> With continuous read enabled, the OOB area becomes inaccessible and
> all reads are instead directed to the main area. As a result, during
> partition allocation as part of MTD device registration, the first two
> bytes of the main area for the master block are read and indicate that
> the block is bad. This process repeats for every subsequent block for
> the partition.
>
> All reads and writes that reference the BBT find no good blocks and
> fail.
>
> The only paths for recovery from this state are triggering the
> continuous read feature by way of raw MTD reads or through a NAND
> device power drain.
>
> Disable continuous read explicitly during spinand probe to ensure
> quiescent feature state.
>
> Fixes: 631cfdd0520d ("mtd: spi-nand: Add continuous read support")
> Signed-off-by: David LaPorte <dalaport@amazon.com>
> Reviewed-by: Gunnar Kudrjavets <gunnarku@amazon.com>
> ---
> Changes in V2:
> - Added comments to explain why cont_read is disabled here
> - Link to v1: https://lore.kernel.org/all/20260129221606.35158-1-dalaport@amazon.com/
> ---
> Testing details:
> - Instrumented feature enablement and verified fix on internal kernel
>   v6.12.64 build with affected Macronix MX35UF4GE4AD-Z4I hardware:
>   warm reboot without patch marks all 2048 blocks bad during partition
>   allocation; with patch applied, device registers cleanly with no bad
>   blocks marked
> - Patch cherry-picks cleanly to mainline v6.19-rc6 and builds without
>   warnings
> - Boot tested mainline + patch on aarch64 host without SPI interface
> ---
>  drivers/mtd/nand/spi/core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> index d207286572d8..9540fd04156c 100644
> --- a/drivers/mtd/nand/spi/core.c
> +++ b/drivers/mtd/nand/spi/core.c
> @@ -859,6 +859,14 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
>             (engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
>              engine_type == NAND_ECC_ENGINE_TYPE_NONE)) {
>                 spinand->cont_read_possible = true;
> +
> +               /*
> +                * Ensure continuous read is disabled on probe.
> +                * Some devices retain this state across soft reset,
> +                * which leaves the OOB area inaccessible and results
> +                * in false positive returns from spinand_isbad().
> +                */
> +               spinand_cont_read_enable(spinand, false);
>         }
>  }
>
> --
> 2.43.0
>
LGTM,
Reviewed-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
