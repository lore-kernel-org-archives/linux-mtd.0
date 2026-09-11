Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D67C88E50
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hRF+7lJnQ6mLV/kB/fcSxMTesypbKLtnX3aDNG/1Lb4=; b=f0mh1zWZYjnu+HwHnYDDimiydO
	AWz2p1VDsWUA9aeFJN9ALxnp4JblCDNNg3yfeOBleMDfEnTitSIDTUAsyd4sSqPlRmdD8TnpkLzT8
	dmmpoVy22uFiFHne0QzLx4CqWPD9vCeomBUz4hhjBkKtcASN7SrkxJed+2zA/0lSibBKrL0hm+FTT
	9d0huISr63ECE3zztHkjYPIhxMFeenTXObaX7LTmJQhUCEVJmLgZpHui2RMbA/CIDRu+Wa22iSm5C
	QtaCq3TSEMvPxhFzObNr1sBY7f+VUG+fhPZpe26M9xmPo++TqWYUahSdB1xqHL15x2iiGunYhy2rs
	gi0aMlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53I8-0000000H4cZ-0IY9;
	Fri, 11 Sep 2026 15:35:52 +0000
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53I1-0000000H4aI-1z7k
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 15:35:49 +0000
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEifvb685309;
	Fri, 11 Sep 2026 11:35:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GfiJH
	+emoJVO4blUtjRwWoav610loCCD1foFPiZ0npU=; b=huNdmSY3YlE/SX+r4ufTy
	6EDeFqf0GU82d4pv2UoMtTlbSRHQ5xwkGxymgaOjtv4m9tbTKjT9PWh2HxXKPVnF
	QzIa20AR4tUpbU2uZVBosIBT7sdHnSistRYiXBn+1qJ9DCy6tGtzj2LOgyKOt0O5
	UM9zAUQg4kZGhnzLLL8o2FSd1su1Mzeg2prlf8eLoyn3joOqPWratFJRIKmppdth
	N5b6dWXIMVZsoZGTPXqLp2qcAnrMho0Jh1gEqJ4Zl7xaxmm1/CcD9ONiwVEJLiWY
	IejnY9j79iMaMkSeoRq7iY1SkLshjOIlbtqjgo3wzKt1nTMUlx6n9CTRFdT5u/vn
	Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013029.outbound.protection.outlook.com [40.107.201.29])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gkcx8r5d2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 11:35:34 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJCBKCieBwc+z1DnHYLsjXl1bY16VUZltdt2bWodZ4UQPq4+kSVOQC+cuM5jp1sgEeLDy1NobiooxLoP2/2gu5cy5GkL1EZTyjXDqIEH46r1ZYKb9bAoJYwPavLzB7sSNBkNhIbO+LG8xTQc8T5Lp4eK0pcPXjX0Jy2xb9oGUKNsKWzs2wn4twoaNEoCT3gdZ4cuaZP4yIaj14ncm/pVNvA364xVXL/rQD8iMjGDEht5eu11ZINZropamj6Cfo9QlbOG1R9fhwmNGFQrRNjHF6Nc/HZeDsMEOQwcmhi7XS6MGPw0e+SK/q8SV/wg43VzjBdYRvHwfXj7eMRGC5STDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GfiJH+emoJVO4blUtjRwWoav610loCCD1foFPiZ0npU=;
 b=Bp+qNniRqxvTblsgnQ3Z0brqu2Y61+QUspAIbF2iV+DLDQo7nqwOy5Tri04fFnTwRYlEkwPGt2VLoO2B4NZuew0xUwWmZcalA25KGawji3gPhv4XAmvD0MfwsuDiJP71Lx0xyUIgwAHUVZkmTxdFgcq2BaKSVPWIzH6ayWvNQAopDOx4mKyXGD4Nd8tHDHmiftM2zxUl0sKPPDzJd3O1RkhLq8pLViSdtpqsYJWwJFYjSzy++qd6wrQ1byqxqc2/JaYedVjPo++wc1ayvwG+4wei+v/MOK+1AXdx7xYsoIcpdmjEzv5ZHaUskW3Qs8YG1A9xhRHiQAZBhj509ViHPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by BN8PR03MB4994.namprd03.prod.outlook.com (2603:10b6:408:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Fri, 11 Sep
 2026 15:35:32 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 15:35:32 +0000
From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Date: Fri, 11 Sep 2026 16:36:42 +0100
Subject: [PATCH 1/2] mtd: spi-nor: sfdp: get the 1-1-8 and 1-8-8 page
 programs from 4BAIT
Message-Id: <20260911-mtd-spi-nor-new-issi-chip-v1-1-c54615f8c30f@analog.com>
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
In-Reply-To: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141002; l=1917;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=ttkDsrNOmQanp5kyAtwNWxF7lRaC7AO2J5ms/oyhmAc=;
 b=Yq5NJDHRc8PwQB4oOCAsyJf2KrhW89SoEQAmlm9XGGokfGMrEJ4DQfafe3DnES793VSV4yr9i
 BA/ejLRRc6vCm8G5lgpC0GvSEm0SaYsyaqMZ7wSs7oMto3atQsGMQyb
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ClientProxiedBy: MR1P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::29) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|BN8PR03MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f998e1-b7de-4cb9-f112-08df101a5073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|3023799007|11063799006|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: Kh2G+iIXWwUXZlcCqrsFolaFcJHUiY4ah73jUU2wIY1VcH+8xr+qwEGK399sM8meW2ghfIV8wKHs4QQSFs6DRG3Ia2jbu9Y+vB+yq054iIElPgMxVa+rJqHCtZJjRKv8tnP3gEpMAuocn6xth1VTN1/OxxJlL6rrgID0AP4AcoHdvducTelxjGvPjyxySiwL2FS5VFIo/8Ii1svrqpdzEzng6fNac5I7gS3aj5koKmu0nNvDLXsFZHnpSdvRl5hPyvRi1EH8kJygWIy5SF8s+t8KqsGypv4UbsIhkLEq8uB4O41/Xy3us93gerWC6HP1gezb/QQiD2blC8cBs5KcjLP8gojwdnwilaMsNMRkclu8Pswm/+EFqPHBy2d912fuFGkcHndI3SM/ucHs4ebfkbKGSn8Lh6nQZTlix3eks4t93B5hLPf8SajIW2r/24QSpRYeM0DfSP39J23rJ1ejtpi8pmOJqCceHK5EgrtkbKT8Mt6dDJQ0jBpLK2nAoQuKjgE3L0FEqbF9SbP5SYLL8h9j5kgI9+nDISss4buPqJX7aRoNxJkFJu37YUWsJwxrol8a5WII4L7SJfqOOmzGaMBQb/G4VkB4b90dooEvzxkjRdmjQ3tVS6m/Az4onz/KtIQb7oMJSyFkehDxoNIQIyhU/LfPVEcxtqxnHPtwq5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(3023799007)(11063799006)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0RyNTZDWG9mTkd3UTR5N0ZPUWhmenhwQVJUOHRkTG5QQmRDcE8yTWVuSkhM?=
 =?utf-8?B?akdYenZHQ3BPbDI2ejVqenVYT3M3TWdHclFvRG5BR3o3SjR6aTMvVVlheVhT?=
 =?utf-8?B?cGkxdnZhUloxWWNLZkVSSU5OWjhsUnM4T25nazBJQklFRjd0cHhjMmNqdUFB?=
 =?utf-8?B?TEJOSW5lRmtzU2ZVSFFGQ2JrUGo1dE5lTDYxWDFWU3FoVVFBSi9kWWNZVmQ3?=
 =?utf-8?B?L0Joci82V0k5SEp6UGVzQmMwSTNRYjdLQmVwdzd6eHllSEg5dWU4N09LQXNJ?=
 =?utf-8?B?R21KbFlaNTB5OEJmSDVldVViOHI1RWlZTWFvQW10NDkvcmZMK010V3dXY0ZH?=
 =?utf-8?B?bGg1Vy90cm13aDh1anRaQlRLS3hKYWRqSUFxdkI4Z201UEFtTUcyRzlQd1FI?=
 =?utf-8?B?a1VLdk5ET3JPbmFTTW05YmJCR2pxd3FLQk9LbHFHeGtkeFFFck9aaksxci9T?=
 =?utf-8?B?eG1WcmtkRlRXWlhZRFFFejBFWGlrczkzMDNQN2N2WUNtZmhlaEpkbXQrS1Vv?=
 =?utf-8?B?encyNFFsT0U0WnpoUkhZa0x4UHFETVlSempiODBSRzU3bGxsdm82Mkd5cGsx?=
 =?utf-8?B?RGkyNVR0MzAxRUZsTy93UGZaWlhVdEpIK0o0NnNlTkRESWlJZmgrRFlLY3Q2?=
 =?utf-8?B?K1hnY0huV1JJYVZrT3RqTnZjNkJMU3lod3RDbmoxOTAwZEJIb3pNZ0R3MExY?=
 =?utf-8?B?OW4wT1AwWENBNk44eG9aUEVsL3ZDZytvUW1ZOUEvejBnVGxhbnZYZ3AvaExD?=
 =?utf-8?B?QmdWa0tIS2NBOEgxdC9DYlZQMTNFMFN0aDY3UnovUDZxbTJVSnM5aEVpdFM1?=
 =?utf-8?B?eEV4NW1PWTJNNmtjeWhUL0NmVlNVM2h2Ri81RS9EcUhTK3ErejQwSzMxV0ZS?=
 =?utf-8?B?dUtvNmxqdkZrN2hKT1gzUHdaWEJ5Tk5jNDg3QXVnNHFZSDl6cmlNc0hINDdL?=
 =?utf-8?B?T3d1K1Z3cFRzc29rcWJiWUZCTnZpSWVGY3Q3ekFQa1g2QjVuaVQ3eHFicXN4?=
 =?utf-8?B?c0tvdlhablVxL0ZTZGl1bXE5NE1kQ3Azd2x6QzBGZnJya1dBQjBsRUNWZFpl?=
 =?utf-8?B?d3lRdHNTeGtPTkdsdGNrT1B2Y00wbVBsaHUzbGVVSityaU5pS3dpRklESWJy?=
 =?utf-8?B?MFVvTi91cWFPMy9nYlpRRjdUYm1raDhURFlFN0g3WHB6YkZ1TmhORno1UTlQ?=
 =?utf-8?B?ZHloZ0htOVZTMVVnbXN1dVVtQzFtQzdxUm50eVlTcHVCNUIySnRXZmFObFdJ?=
 =?utf-8?B?OEhrSVRUTmtYMWcrNS9iUmRNY2VheXR2Z01lM3lMTkVpeE4vb2R2U0Z3NVYw?=
 =?utf-8?B?SER3MHo5MW5va01nS01jMENXc0R5Z1FxRDdpVDlvQ3I2Z0ZwYkwwQ092bEZT?=
 =?utf-8?B?VGQrZXU2WENuc2ljNjJDNmczd0xHeWxjcWM1Q0JGSmwyZFFnaVZScUZGaGRn?=
 =?utf-8?B?STNhbnY3Q2kxMHgvMXZvKys0YzFzOENiTkpDZ21sRTVuai9yZFR1dzUxY081?=
 =?utf-8?B?c1M0VytQM0I4NytKNG9NUFBOSnZaQUwzS0FqWUZaNEJDalpaWFZPR0hGTSsw?=
 =?utf-8?B?WjNDalBCVS9hNmlINDBTZnVOTGlIVXFOdVp6aVlhU1lmbmRuVFUrWWdJOGE3?=
 =?utf-8?B?Z2FybS9CVmhKYllMaFFubitJN3JUbzZMT0tHVUQvd1l1cXdENisvbzZHZWFM?=
 =?utf-8?B?Sk0vaFh4aFlhTXFMbkhtV0VnUE1UdWdZc01UaHJneVZjM0F5R2J6S1F0OGt2?=
 =?utf-8?B?OGFoc3lWYVA0a1d6Tk5lcHpwVUNLK20yZGphWURVLzRLU0hiVHB1bFhmSGxD?=
 =?utf-8?B?eXBGc1R1L1FKRnFsbHJFNStmWlNXc1NxMkh6RzNSNzV4cDd2VCtPRmhGSW5L?=
 =?utf-8?B?VXJ3L1BaaEJrR2lwS0RDdk9XRFdXUWloaUlpWUdGNTgzN3hMb21VeHdObUpK?=
 =?utf-8?B?bGhSZERJbzlWZlMwSHQxMXU0Q0hZSElBeUVwcTZHa2FPMTNOVXBacFp1c2VR?=
 =?utf-8?B?WHNqbUdQc2VMaEEwSmsxZmRkRE9wVzIzUUsxZkx5dHNDTlJpN2NOcHBMZzhu?=
 =?utf-8?B?NUh6SVBIMGo4NllBekJxMHM4bUcyME5ZZTZBMms0UkJuSmI1T3I2NzVTNmRv?=
 =?utf-8?B?WmU3Q2hzVElwT3F6clNRVE1lbVRoTjA1VHZmYVBkeTBxazBGSzdDK1RjVlpo?=
 =?utf-8?B?MnFSdGpJSW16Zjd2TU40ZlhSc1h3Z3pGcUxwaVdKa3VYZ2xlSzRiT3U2dSs3?=
 =?utf-8?B?V01XaFVFcnVYU2FxSnFqWUM0bUVoWnpoVEZyZkxmaUxHVkN0ZHNjV2NCUG5V?=
 =?utf-8?B?cldTRXh0bjE4MlZBRENyY1A1SEZISmZLYkQrdWQzblN1OXhpcFVWdz09?=
X-Exchange-RoutingPolicyChecked: HK33J+aThittxWaKZVzir+Aw8jsg3/l+aD8vAFVE8RXDo2RzcPQzKfZ+9jhEK/lYOcxySE1IIJp4ClWf4LKJLF2zThjbQ8xSnruHZZR94Kz0w2AS7U6BrlTYaFDJHMqimSbu2T+Ozek7P0zAMn50OFRH1HomQI/I4UNg1UrgV92gBIc/Ply2IY2WZxMswQdhid8Et13vd5zgauNjozXTaYT2rfJjbJLppojznUWXhkiWUobcrWPUZsWUTiARxDdGchTjpyL4TQoEMGHf29BOvJ68l18QFPexKLstKiJ9EQQ+lWvDSI5/WLP3kk4vQpGXdRIuBnmyf+lEzNBwxpZ/Rg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f998e1-b7de-4cb9-f112-08df101a5073
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 15:35:32.3506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: StSvI42FAK27GbF9zLYHaoMqAALBj2Ans33c+nUkdE+UCCcut3XBTNCY5+Ro1g3786aYRq1HD3Dp0jPthU7wpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4994
X-Proofpoint-GUID: VkSb47WqYxNvGpHltLLdGqyZApP7ysbs
X-Authority-Analysis: v=2.4 cv=JaApPkKV c=1 sm=1 tr=0 ts=6aa41fc6 cx=c_pps
 a=D3JKZc7amZFyEdfjSn7DlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=_jAD5XSDOtq9-5Nde2OG:22
 a=gAnH3GRIAAAA:8 a=CnAg5zHkUThGRFuh-Q8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: VkSb47WqYxNvGpHltLLdGqyZApP7ysbs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxNyBTYWx0ZWRfX3r7BaxR8UR/N
 9NhoQjFNzm0aUdMln5SSF4vc5HafLYF0cjCFMDTwELjq5GM0NZOtZdDb+kAu1CaBwydKBKCPDyQ
 hSCvbTTTNT1fH/5DYgeBnmDTO9AVtl9zHTJK2keEDZH9+a4ugKK8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxNyBTYWx0ZWRfX6Y3vRjn84OZg
 Mwt+UOXU0Hpd4Cwwr4MG/hQdRqutK3iYIQ6RVXmqUiJLFXeR1swcxNYJkVj8dOetWV8R1D4dMZM
 tR98/DrIaKcHUTnO48qWqcMEKGBnJlHmn+bDVD+5HETEtBn5SfbLzVZKy1j7LozubW23bSjrww/
 UERhGgwKPr4Pyn4Bm9GQu3vx2dcgl8Y6jDR5BlvwM4kC6o9bv9JuQKjMOFG5e0OyXJarBsRQ2ml
 /PmzuC0SXgZA+p0ro+KQ+mVCJq7/IHsPx/urRSasolttbHNjJKlWwPrQt1jycomc43lIc3mWsou
 PbgR/0Q1m95mu+xjgzjq7dY7NC7mCac/Op8heGxYbMKU8qIX5gSn/xDNxlkqCfLTyVeeSFjWvyJ
 RjLRqCZVl5a/7GboNbMhVt76V6Pyj83ghuhy0aojB82ju/1KAt//OtjpceOAhiuRNBwaN6C/mwx
 AaylkhPAjhxIcblUcHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_083545_640743_46715F06 
X-CRM114-Status: GOOD (  14.05  )
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

Q29tbWl0IGFmMjc5MmFiZDQ1NSAoIm10ZDogc3BpLW5vcjogc2ZkcDogZ2V0IHRoZSAxLTEtOCBh
bmQgMS04LTgKcHJvdG9jb2wgZnJvbSBTRkRQIikgdGF1Z2h0IHRoZSBjb3JlIHRvIGRpc2NvdmVy
IG9jdGFsIHJlYWQgc3VwcG9ydApmcm9tIEJGUFQsIGJ1dCB0aGUgNC1CeXRlIEFkZHJlc3MgSW5z
dHJ1Y3Rpb24gVGFibGUgcGFyc2VyIHdhcyBuZXZlcgpleHRlbmRlZCBhY2NvcmRpbmdseS4KClBh
cnNlIHRoZSAxLTEtOCBhbmQgMS04LTggcGFnZSBwcm9ncmFtIGJpdHMgb2YgNEJBSVQgRFdPUkQx
IGFuZCBzZXQgdGhlCmNvcnJlc3BvbmRpbmcgNC1ieXRlIG9wY29kZXMsIHNvIHRoYXQgb2N0YWwg
d3JpdGVzIHN0YXkgYXZhaWxhYmxlIG9uY2UKdGhlIGZsYXNoIHN3aXRjaGVzIHRvIHRoZSA0LWJ5
dGUgYWRkcmVzcyBpbnN0cnVjdGlvbiBzZXQuCgpUaGlzIGlzIGluIHByZXBhcmF0aW9uIG9mIGFk
ZGluZyBzdXBwb3J0IGZvciB0aGUgSVNTSSBJUzI1V1gwMUcsIGEKMSBHYml0IG9jdGFsIGZsYXNo
IHdoaWNoIGlzIGJleW9uZCB0aGUgMy1ieXRlIGFkZHJlc3MgcmFuZ2UgYW5kCmFkdmVydGlzZXMg
NC1ieXRlIDEtMS04IGFuZCAxLTgtOCBwYWdlIHByb2dyYW0gaW5zdHJ1Y3Rpb25zLgoKU2lnbmVk
LW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9z
cGktbm9yL3NmZHAuYyB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMgYi9kcml2ZXJz
L210ZC9zcGktbm9yL3NmZHAuYwppbmRleCBjMjFhNjk1M2RiOTYuLjhlMzk4OTE4NDQzNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvc3BpLW5vci9zZmRwLmMKKysrIGIvZHJpdmVycy9tdGQvc3Bp
LW5vci9zZmRwLmMKQEAgLTEwODEsNiArMTA4MSw4IEBAIHN0YXRpYyBpbnQgc3BpX25vcl9wYXJz
ZV80YmFpdChzdHJ1Y3Qgc3BpX25vciAqbm9yLAogCQl7IFNOT1JfSFdDQVBTX1BQLAkJQklUKDYp
IH0sCiAJCXsgU05PUl9IV0NBUFNfUFBfMV8xXzQsCQlCSVQoNykgfSwKIAkJeyBTTk9SX0hXQ0FQ
U19QUF8xXzRfNCwJCUJJVCg4KSB9LAorCQl7IFNOT1JfSFdDQVBTX1BQXzFfMV84LAkJQklUKDIz
KSB9LAorCQl7IFNOT1JfSFdDQVBTX1BQXzFfOF84LAkJQklUKDI0KSB9LAogCX07CiAJc3RhdGlj
IGNvbnN0IHN0cnVjdCBzZmRwXzRiYWl0IGVyYXNlc1tTTk9SX0VSQVNFX1RZUEVfTUFYXSA9IHsK
IAkJeyAwdSAvKiBub3QgdXNlZCAqLywJCUJJVCg5KSB9LApAQCAtMTIwNyw2ICsxMjA5LDE0IEBA
IHN0YXRpYyBpbnQgc3BpX25vcl9wYXJzZV80YmFpdChzdHJ1Y3Qgc3BpX25vciAqbm9yLAogCQlz
cGlfbm9yX3NldF9wcF9zZXR0aW5ncygmcGFyYW1zX3BwW1NOT1JfQ01EX1BQXzFfNF80XSwKIAkJ
CQkJU1BJTk9SX09QX1BQXzFfNF80XzRCLAogCQkJCQlTTk9SX1BST1RPXzFfNF80KTsKKwlpZiAo
cHBfaHdjYXBzICYgU05PUl9IV0NBUFNfUFBfMV8xXzgpCisJCXNwaV9ub3Jfc2V0X3BwX3NldHRp
bmdzKCZwYXJhbXNfcHBbU05PUl9DTURfUFBfMV8xXzhdLAorCQkJCQlTUElOT1JfT1BfUFBfMV8x
XzhfNEIsCisJCQkJCVNOT1JfUFJPVE9fMV8xXzgpOworCWlmIChwcF9od2NhcHMgJiBTTk9SX0hX
Q0FQU19QUF8xXzhfOCkKKwkJc3BpX25vcl9zZXRfcHBfc2V0dGluZ3MoJnBhcmFtc19wcFtTTk9S
X0NNRF9QUF8xXzhfOF0sCisJCQkJCVNQSU5PUl9PUF9QUF8xXzhfOF80QiwKKwkJCQkJU05PUl9Q
Uk9UT18xXzhfOCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgU05PUl9FUkFTRV9UWVBFX01BWDsgaSsr
KSB7CiAJCWlmIChlcmFzZV9tYXNrICYgQklUKGkpKQoKLS0gCjIuNTUuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlz
Y3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tdGQvCg==
