Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7BBC88E50
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0QqsF3sp4QTTrrz1O62dTq7YhWGROHXhUppqWaxqz3Y=; b=G9BXEYncAd2MCA
	VEN0MxL11eQOlJasvSrtc6qhMsaYiuf+TfkXO04WoZXyc6I//PbWHH1B2/rlBM9xweaec7nC6mfUX
	3K/jnRuDKtCYAGKu+nKPyFr7sJjGKt1uZSEqJAlkrOKqIPk1XDiElhibFvS5pSlqUoYOTObRuzoiy
	l3YwifnGMFnxAtgDSrWpNVVfZaVxeutshuKiYSqzlDfPnVJpHJyzBUSlojGvylbwKBuudIgFE6qaX
	Q7EHBBgkpFR/nKZRi0KZ3nBnP3+YQimu1HzQrg8CxznnR7EuE0PNQxMWZ/Z7eTOXrxp/Mv+ytGDvd
	/m7+LGVRCDjzsyMun6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61vD-00000002hqZ-3aDN;
	Mon, 14 Sep 2026 08:20:15 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77] helo=mx0b-00128a01.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61vA-00000002hq0-2uCe
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 08:20:14 +0000
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5gTFa490114;
	Mon, 14 Sep 2026 04:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=9zmJt
	XGDXviIsog1njE7/9e4dqU/ESSG8d94aZUxNwI=; b=0CA44B/vGbT1wAfUq877S
	MX8LT/wWO/1uEn8VPTK6xQlRLLNPUD4/6RXw3d292HRaVz3uNDgMR07ghWonMlvR
	1YiHR+OB98B9kZ0JhYozJ71IuqUy6dfHekBCfzF0zFC3imj/EXVA+DLDk9BdGmTV
	onz1Tzwg73SBu83uSErUjEHmHncblgVqAz9xLkxJrC7BO6YfbyM+I/RENgMNkuJu
	YjlpJ3F1m2mYDS3t1nLlZXB5Mv6Z2W7hVS8maGqPq+h6TQRPV1HWXviJS09XNXuM
	NRxP73foGS1iWTgrSnQubNMZdxUXovaHdVoM71q2UDRNVE2oyHK48PgWtqMltIfS
	Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gnn2ccrab-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 04:19:53 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbsR/SwR+mIh4LpPqFjTb50OVTH345eQ2oGo+8/jC61/norynaYfA5FN3dPHGRnu5/eb44f0yUivX4M8wLe7CUUzzR8oCgzzP37hnyT+sKTXC7suNtOSlJhHV7ZwSECbZYrtCrTykQyoECtskjDtd/LgN2Db+wNHeaIC2FLmfBV7qd5RR465z+yBD5a2QirgC5yxMi3YSnUDDXDrsRFCCBOS8uvl2D134poJs28ToWSiBsh8EPmI0W0ldouq6EiNxW7xrd3IouACwZMxvbtFyjpjwl2Z+oiNfp7d0Dm+XTXbvxQq/qiqYwYSoLV2rKAZw+QeouYrN69st8XD6ib35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zmJtXGDXviIsog1njE7/9e4dqU/ESSG8d94aZUxNwI=;
 b=dMj4zIdw1WONRN4dflPBbt4p6F5kyYurePIyneTyg7UWq/5C6YeuKGbRtZKNulINptZ8SMQYK2LJVc7TsUAzBggfB9SQ1CS+YROxOJvKJE9LC6p4QysVMwmNS1LHGNnk0greDosTXyP1nzU4PxqQ9sj/wu1cMHmfKUyV683W+0iPmwpeSjgsH2+QVWIKXYaK2YZSip66b1uVHpRykBVZsbA2FdPKs5MRuHbe/ofZKxL/uG/WK0CxxPIqGepPL42ISIZNponiaQVg+n5DOAC2DqjAQVxpgsehB8w4snO8SUCHCIx9oWO1/u5veRNbV+rRXvKHAT+9hbg21L9mLzjz5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by SN4PR03MB989382.namprd03.prod.outlook.com (2603:10b6:806:212::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 08:19:50 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 08:19:50 +0000
Date: Mon, 14 Sep 2026 09:20:56 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <aqetgODkt3MhNndd@nsa>
References: <20260911-mtd-spi-nor-new-issi-chip-v1-0-c54615f8c30f@analog.com>
 <20260911-mtd-spi-nor-new-issi-chip-v1-2-c54615f8c30f@analog.com>
 <DLETRRVRUWEP.1VU1EHARD3MSH@kernel.org>
Content-Disposition: inline
In-Reply-To: <DLETRRVRUWEP.1VU1EHARD3MSH@kernel.org>
X-ClientProxiedBy: ZR1PEPF000077F7.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:918::444) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|SN4PR03MB989382:EE_
X-MS-Office365-Filtering-Correlation-Id: cdc37aa0-2129-451e-0157-08df1238f21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: Mb7QTPeZB8PQ9ONnP5mlJZNU+nJxor00qCJ1OwEZmVT6r0I5lA86Fg4XRiR0YkYVO1M5U4G8piainpLUvLkX8oeJ6ef2pcPAFZlinK56Vy2ZNaA0flLUXTA9M/KywINw8lVpr3BkVUAXyK0nQ2jwFR7AGktUZNftL+pax+Ssdexw5YyaSaHuUe6ji/ZvIL9EH0Q5yro3SQGb4E04TRrX+O8T6pPYn4uoEI5cJEzfX3uO3/nkfNV7KUgTG/HrOMwtctPnl2nSrmxSZjccMmhPNxh4ckQyah29SyVAg010IuGwP4NnYlaPZN0qQVWWg9XFqvgkhXaUE0OpZhAQyuBB9q1VUBi4lneI1pf0xZiDv2OHsMdQWX5a79rvdoukmOJnPpZWeBfeKwOxKupRgzBGfH5dP0SHgJEZmL+S12iOMXmOC+KOvnP11Xta/8Un0aVX6/bPIAGRSGXx76bnRYYsaOtsvckG6Xr3cblZqgoyavfo3nDzczfM8pPIBzigJ/gzFASlVTDIR3mdUdov8pscUxoe/GBXEdr0hdhMo8+A3+JXSAIRZHXYc35HrTqPQoVruDfOrSpubFq04i6TwXCV/ssHT7dmBcdE/Yx3Qe3ylObBxKbmkgEzyyGnSWmtvSyX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXJLTmtvVzV0cUxhc29CTEFRTFhLcXluTUxrcmcwdTErMnZ0NmtsNnJsTVFF?=
 =?utf-8?B?RjA4RnlBRGs4bFdjaFdqUlpVSFBuZHp6OVFpNkRzR1pJMEZiWC8raUZtVGxp?=
 =?utf-8?B?c3NORjY5SUFEcUJxa2M3RUY4cVg3QjJ6N2FFQ1dRZUpWM3A2Y3lheWtNSldV?=
 =?utf-8?B?bUdEOEVqR2V4ZW9keVZMOFhVWnZGOXdPTGdZSm9NOXRtV2o1OXVaV1QwSVFU?=
 =?utf-8?B?RkNpaEF3WXFtRVBLU0xOZVgxQ2R0RlI0aWdNQUp2N29jK01RNDFUUkhpNnFQ?=
 =?utf-8?B?dkVRRlpkY2FtMkZpVWVFVUlPS1BCQXRDYWdzRDZTdnhwTzlvaE5mSm54SGpq?=
 =?utf-8?B?OXErQkpNTG0wZmRBTnRIendBUmFPZGI2SXhZYThzZldUUE02YlFJNHBpd2c5?=
 =?utf-8?B?SEJLWXdMQWtLVjdteW5IUy9WWkhIT2w3a2FLZDcvakZCSXBrZGlTOGhxak9D?=
 =?utf-8?B?eVZ3eS9qZEtMVnIzZHlQbk9pUVZidTJIa2ZTZDRUZzUyVHZtOW50MGxTRFZG?=
 =?utf-8?B?RGZ0djZqUGVMcE1xMVJVNnEySGViUGVjZGpsSkQ0TTRMckY5RFJPK3Z4VjVV?=
 =?utf-8?B?VTlqVHo4L29HUmtGdVljc3B3cUZ3SVJIeTNoYVVaUDVwNXJ5Wm5ncXZLNWkw?=
 =?utf-8?B?WkUxZGpMemVpWnQxbUZNSXU4ckFhTGtwa1ozZXRDV0RSeUtaM0IvdEpDRTB1?=
 =?utf-8?B?Rk5aZm5ET3Vkd0VVazRSUEJwWVhpNG9sK1BpL0tFSFZJRHBwT1k0TEVjaWFI?=
 =?utf-8?B?K1NMbGpTR25EanhJejJEUi8wS1R3OHp3UEdyQjFEaE02dS9mVnllU1hQdFR0?=
 =?utf-8?B?M0tRcVdhSGpheGp6NFU5U1c3K29RZjRLelI1RFAzQ0hVWHJTMHRIQ2p5TE9m?=
 =?utf-8?B?NnkzYXVKaUFaaytLV3JQVGFGbWhmcjRtNGZiNzZZWm91L0c3K0xRQlhFQ0FU?=
 =?utf-8?B?Zmd2ZzQ3Snk3TkhQeHNQaWowcE0vRTYrL3JOYlo2VFp0NllwSjRIRFcrMDBE?=
 =?utf-8?B?MW1UQ3FueFhZa2xIZVJOOCtrci9ydi85aHJqdjl2VVB5b0xrdDNmV1lMek16?=
 =?utf-8?B?OHRpdUQ0NkdtVUgweWpWRGIzNXo1ZElRUHdMVDU1NytvWWExMy9sckVHZGRJ?=
 =?utf-8?B?SUN1cjdaZEovWXBxK2tuZ0k2ajlUT3M5OENwZWRmTlY2SGRnVi9CdmtWS1Y4?=
 =?utf-8?B?UG13S2RDM2lBazVyOTlZRGtsb2FHazV6Vm9sdWtlN2RIaXhUdFE3UjZ1SVpm?=
 =?utf-8?B?RTllb1BhZE9nWm1hWHFtNnAxakcwNHpQRTc4QVRNMENwZUF4MXJPaW4yMmll?=
 =?utf-8?B?WWFSWHNOaW9iVmRYYi9JaHh5OFRkeXk0a1JWaUI2RGg0VFlta1FPM05sYlM1?=
 =?utf-8?B?QkswSHZLaStRUmIvK3BSanZJYzF5eGU4eW5STFFEeGFWK2g1c29lSldlM2NF?=
 =?utf-8?B?NFpYSzJGZmF6Y1J6QlcreThwbFNwTDJoSUU3NGFGMiszdDIrNGNFU05JaXhp?=
 =?utf-8?B?WDNsZjBveStZRUg0bm1yT09mRE1pQStwdk5KeWpwdHRKdE1FU0dyMkNDN3VD?=
 =?utf-8?B?WmdZcytLMlJUUVg3UGUzY3dGSnM0bEFYSDc3V3pPZERLbTVNWTlKZ1ZoSU5q?=
 =?utf-8?B?VkV5WW1QVGhOZ3pRYi9zSkRiMW9jZXY5cVRSMUZPditkejNRM0Fkb2FpMUJW?=
 =?utf-8?B?b0huSmpGdDVPNlgvOEFEZTJya3JtdHd4dW5YWFA0Qi9OUG1mWUpXbkliNjB5?=
 =?utf-8?B?Mm5oTWFpcDU4Q3U0dG9DcVp2QjEzL2NVa3hGN0FKbFVvZS9ZZU5RTHV0ZEtj?=
 =?utf-8?B?Q1dRa0xWc0JDbTZxZjF2cENrL2t2c2pJVkZCNS96UHdjckZPOFdEWnhMb21H?=
 =?utf-8?B?QndBUW5kY3FEa3NFc2U4dURNQlk0aDBlU3BqOEFGdTVmTEorVHVwVEV6REV6?=
 =?utf-8?B?aCsrUlJ3QkRLMm1sMW51SGdKbWFiVGZjT1dLWUFpeEZMN0JWNjNDN3ptUDlJ?=
 =?utf-8?B?YVpSQWNXeXVpNFl4S3prRlRVU3RiMEJ5QzVkd0FneUcxaEsrUVk0RVFGN0pr?=
 =?utf-8?B?U3cvd0xzandPZkcrcFFlcDB4NmUwc3RBdUVsNVYzbTlldE5OYnJ5NVpNTzgw?=
 =?utf-8?B?WElOc3JrcXowdlNWVytmemVBSXI0QjB4b1FmS3RBQTM0RTRMbitpTGY3cWxD?=
 =?utf-8?B?VVJDWUp0Z1dPSVNQZjdaQUNoYzNEblA5QVQzTlpPOFpQYWdKdDVBaFE4Mmpq?=
 =?utf-8?B?SDNrSUEyYnlWL0xoa2l1T2k3QVJZTUxPc3QxSWhtL0VFOFIzVzF3clE4cEE4?=
 =?utf-8?B?NCtjajVIZm1TZGlGWG5jL3RpL1RMS2FqNVZuMldIdFc0bFZHZFhoQT09?=
X-Exchange-RoutingPolicyChecked: Gf/LjTwEmDP7fk4iZJTkO2bl5dMWrWRWOSB00Qt946INV5BjdA//Miol0BCw+oUWCceARjekDFm5Dz7n1JyvLsQwGBCplIMfb8Dyc/719/NKqYDMp5AZm5pkXvq+8ohWpPobr7YH5Tl/KhbxtfXOgmIpHmZsNMxkmN8dv5L9wTou1XgRQ17iET7MacCrEmzU7Au2xtPZtP0NUbYHfL/P7ozql2KqNB3UA70mSAUcZghz8ZzUQdEM7DBlS88bHxWJ4FglsMw8LvEgaz1XtONogONOFfw58JbMxSqBV20r42iFqy80CldPPZhpxIif4Fq5BSeTNkp5pwp0ToQmz5ZnEg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc37aa0-2129-451e-0157-08df1238f21f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 08:19:50.4593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nKXSORCc9yjK5ibxxtKolvOzQIzofypjq/cmLZ6qLm/5s3AzbYx4SA/KZKeo+3WpmNhdTvOND+UuGu1nMA/V2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB989382
X-Proofpoint-GUID: kr0ai2ZvfjUd4kOMTmBDuPzwWVW1naRT
X-Proofpoint-ORIG-GUID: kr0ai2ZvfjUd4kOMTmBDuPzwWVW1naRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNyBTYWx0ZWRfX19RaOpPuIRam
 oSjNKByrOiHAr0erMJgRkSm5WN0rBUtUr1Wva8Uwc+SPf90NTvDen8rt04qQ3KraJLTUCAj7Zw8
 Rg9aX9BRX+tzTacg89lOaqb70u++3mj56RaC2Xs34lm/OiEEc2ULI0N2wNI4nsjp3iloaqqkDyu
 cxXdsKvkrObMi5jJnVYICX6waUW3dntmYlewkP9y+6ysTYXDqNK4D4ouVNuUxY7BWDxTSZXjyh/
 VmJD9BeC1kvmAAFX9t3ymBLMsnKftSgdBpPdw3Ukg9Qhs5WfUAgmzrplmx3jMZNuGH0YPBpQTMh
 HHhR2DGwteG8Aat3XVfzZrr6hq2s4ItgoNcX3KN9aALUwirZlGWcNLJn2wBb2oQ87SfRX5AnIWv
 2QiPvweDHvDF9R6BVSeeCB1JX6TXVBIuHO759RLISi/TUvqXC3YRn+6gG+vvDuyzZUu9/B1+7Co
 REn7yyMbNXq6bsZjNdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDExNyBTYWx0ZWRfX6LmnU+Sb8V9i
 9RCQfnwuJuE2T6pYBXPE23ZgUaDr52KcB95yOXbTBFA/vHK3KYXBqM8xdSBlUM/BLfr2y0LRLih
 pvttKteibNn71qfJfsoRhAV27vuQxDna+iuDwe/boNB/DcJscKqe
X-Authority-Analysis: v=2.4 cv=bcH+w+PB c=1 sm=1 tr=0 ts=6aa7ae29 cx=c_pps
 a=ck9HhUZGATh9INII0mabYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22
 a=DUnRZS7UAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=gAnH3GRIAAAA:8
 a=N1QdOQQhsQYuR7NFzBcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cDzw7mrAGmWHSR5u0tpu:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_012012_742668_C1439CEF 
X-CRM114-Status: GOOD (  30.20  )
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMDg6Mjg6MjVBTSArMDIwMCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBGcmkgU2VwIDExLCAyMDI2IGF0IDU6MzYgUE0gQ0VTVCwgTnVu
byBTw6Egd3JvdGU6Cj4gPiBBZGQgc3VwcG9ydCBmb3IgdGhlIElTU0kgSVMyNVdYMDFHLCBhIDEg
R2JpdCBvY3RhbCBOT1IgZmxhc2guIFRoZSBwYXJ0Cj4gPiBpcyBmdWxseSBkZXNjcmliZWQgYnkg
U0ZEUCwgc28gb25seSB0aGUgZmxhc2ggSUQgYW5kIHR3byBCRlBUIGZpeHVwcyBhcmUKPiA+IG5l
ZWRlZC4KPiAKPiBBZGRpbmcgYSBuZXcgZmxhc2ggaW52b2x2ZXMgbWluaW11bSB0ZXN0aW5nIGFu
ZCBhbiBTRkRQIGR1bXAsIHNlZQo+IFsxXS4KPiAKPiBBbHNvIHBsZWFzZSBrZWVwIHRoZSBmb2xs
b3dpbmcgTGluazogdGFnIGluIHlvdXIgbmV4dCB2ZXJzaW9uOgo+IAo+IExpbms6IGh0dHBzOi8v
d3d3Lmlzc2kuY29tL1dXL3BkZi8yNUxYLVdYMDFHQi5wZGYKPiAKPiA+IFRoZSBmbGFzaCBoYXMg
bm8gU3RhdHVzIFJlZ2lzdGVyIDIgYW5kIGRvZXMgbm90IGltcGxlbWVudCB0aGUgMzVoIFJlYWQK
PiA+IENvbmZpZ3VyYXRpb24gUmVnaXN0ZXIgY29tbWFuZCwgc28gdGhlIGRlZmF1bHQgYXNzdW1w
dGlvbiBvZiBhIDE2LWJpdAo+ID4gV3JpdGUgU3RhdHVzIGNvbW1hbmQgZG9lcyBub3QgaG9sZC4g
QWRkaXRpb25hbGx5LCBpdHMgQkZQVCBRdWFkIEVuYWJsZQo+ID4gUmVxdWlyZW1lbnQgZmllbGQg
Y2FycmllcyBhIHJlc2VydmVkIHZhbHVlLCB3aGljaCBtYWtlcwo+ID4gc3BpX25vcl9wYXJzZV9i
ZnB0KCkga2VlcCB0aGUgbWFudWZhY3R1cmVyIGRlZmF1bHQgcXVhZCBlbmFibGUgbWV0aG9kOwo+
ID4gY2xlYXIgaXQsIHNpbmNlIHRoaXMgaXMgYW4gb2N0YWwtb25seSBwYXJ0IHdpdGggbm8gcXVh
ZCBtb2RlIGF0IGFsbC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBh
bmFsb2cuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9tdGQvc3BpLW5vci9pc3NpLmMgfCAyNyAr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0
aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYyBi
L2RyaXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4gPiBpbmRleCAyZjA1N2Q3MzFkZjIuLmFhYzlk
MTliOTBmYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbXRkL3NwaS1ub3IvaXNzaS5jCj4gPiAr
KysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2lzc2kuYwo+ID4gQEAgLTI5LDYgKzI5LDI5IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cHMgaXMyNWxwMjU2X2ZpeHVwcyA9IHsKPiA+
ICAJLnBvc3RfYmZwdCA9IGlzMjVscDI1Nl9wb3N0X2JmcHRfZml4dXBzLAo+ID4gIH07Cj4gPiAg
Cj4gPiArc3RhdGljIGludCBpczI1d3gwMWdfcG9zdF9iZnB0X2ZpeHVwcyhzdHJ1Y3Qgc3BpX25v
ciAqbm9yLAo+ID4gKwkJCQkgICAgICBjb25zdCBzdHJ1Y3Qgc2ZkcF9wYXJhbWV0ZXJfaGVhZGVy
ICpiZnB0X2hlYWRlciwKPiA+ICsJCQkJICAgICAgY29uc3Qgc3RydWN0IHNmZHBfYmZwdCAqYmZw
dCkKPiA+ICt7Cj4gPiArCS8qCj4gPiArCSAqIFRoZXJlIGlzIG5vIFN0YXR1cyBSZWdpc3RlciAy
IGFuZCBubyAzNWggY29tbWFuZC4gQW5kIFdSSVRFIFNUQVRVUwo+ID4gKwkgKiBSRUdJU1RFUiB0
YWtlcyBhIHNpbmdsZSBkYXRhIGJ5dGUuCj4gPiArCSAqLwo+ID4gKwlub3ItPmZsYWdzICY9IH5T
Tk9SX0ZfSEFTXzE2QklUX1NSOwo+ID4gKwo+ID4gKwkvKgo+ID4gKwkgKiBUaGUgQkZQVCBRdWFk
IEVuYWJsZSBSZXF1aXJlbWVudCBmaWVsZCBpcyBzZXQgdG8gYSByZXNlcnZlZCB2YWx1ZSwgc28K
PiA+ICsJICogc3BpX25vcl9wYXJzZV9iZnB0KCkgbGVhdmVzIHRoZSBxdWFkIGVuYWJsZSBtZXRo
b2QgYXQgaXRzIGRlZmF1bHQuCj4gPiArCSAqIE1ha2Ugc3VyZSB3ZSBkaXNhYmxlIGl0IGFzIHRo
ZXJlIGlzIG5vIHF1YWQgbW9kZSBhbnl3YXkuCj4gPiArCSAqLwo+ID4gKwlub3ItPnBhcmFtcy0+
cXVhZF9lbmFibGUgPSBOVUxMOwo+ID4gKwlyZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBzcGlfbm9yX2ZpeHVwcyBpczI1d3gwMWdfZml4dXBzID0gewo+ID4g
KwkucG9zdF9iZnB0ID0gaXMyNXd4MDFnX3Bvc3RfYmZwdF9maXh1cHMsCj4gPiArfTsKPiA+ICsK
PiA+ICBzdGF0aWMgaW50IHBtMjVsdl9ub3JfbGF0ZV9pbml0KHN0cnVjdCBzcGlfbm9yICpub3Ip
Cj4gPiAgewo+ID4gIAlzdHJ1Y3Qgc3BpX25vcl9lcmFzZV9tYXAgKm1hcCA9ICZub3ItPnBhcmFt
cy0+ZXJhc2VfbWFwOwo+ID4gQEAgLTEyMCw2ICsxNDMsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBmbGFzaF9pbmZvIGlzc2lfbm9yX3BhcnRzW10gPSB7Cj4gPiAgCQkuaWQgPSBTTk9SX0lEKDB4
OWQsIDB4NzAsIDB4MTkpLAo+ID4gIAkJLm5hbWUgPSAiaXMyNXdwMjU2IiwKPiA+ICAJCS5mbGFn
cyA9IFNQSV9OT1JfUVVBRF9QUCwKPiA+ICsJfSwgewo+ID4gKwkJLmlkID0gU05PUl9JRCgweDlk
LCAweDViLCAweDFiKSwKPiA+ICsJCS5uYW1lID0gImlzMjV3eDAxZyIsCj4gTm8gLm5hbWUgcGxl
YXNlLgoKWWVzISBJIHJlYWxpemUgbm93IGl0J3Mgb2Jzb2xldGUuCgo+IAo+IC1taWNoYWVsCj4g
Cj4gWzFdIGh0dHBzOi8vZG9jcy5rZXJuZWwub3JnL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IuaHRt
bAo+IAoKV2lsbCBkbyEgU29ycnkgZm9yIHRoZSBtZXNzISBJIG92ZXItY29uZmlkZW50bHkgYXNz
dW1lZCBldmVyeXRoaW5nIHdhcwp0aGUgc2FtZSBiZXR3ZWVuIDYuMTggYW5kIHNwaS1ub3IvbmV4
dCEKCi0gTnVubyBTw6EKCj4gPiArCQkuZml4dXBzID0gJmlzMjV3eDAxZ19maXh1cHMsCj4gPiAg
CX0KPiA+ICB9Owo+ID4gIAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dAo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
