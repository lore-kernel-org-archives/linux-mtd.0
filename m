Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDEECCFA1A
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 11:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r8XCPX3aMitaSglc/YkSYPAfeVCztMs0yb6qTVXiQ8o=; b=KjqwTV5lqw/wn8
	8ljZ2YGUU7HBq3+TU6DjRebmSEOvUns6rIJm4JP9Fll4jdPH41RFpclPxAaB0bTG4wXDVbaEpGaDp
	knE/xlrvMTJydDG+6VzMx61OB+L/wE45LEuqiVRi1G3wUAzOJBJilBdKP1YkoHox/XCCxPcjvpGTz
	eioKJbcorU7do4rymNBA6RI+u/nc64dMX1vZIIIjwHPo7HrcvOM73GvC40D09fnfrYIzSFkVSW5J2
	0209KFE6jqPruGFUsIF8x1mx4HpZZIDnaNtdAY3uxxjeJxfOt52SZGJT1rX0ykLnQsO7olZy12Ugm
	Oj53t6dEJ9NkcLx081qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8ez-00000008dI0-2wcr;
	Wed, 12 Nov 2025 11:05:09 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8ev-00000008dH2-0yrK
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 11:05:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ug1+6CnXGCLYk/WSkrbAFyOewmWbZaVKBts3m2QLMvr0LkfaHijMG/4fIfjynw84z/3Gr+ph+i//yJF0rJCLdyCvg6HDeDcvSKG2ymZZjWliBoWPPt6XS4gYJKngSU0UUR33/AzcbZ2HS/dNbvf753bn/7cW7RHLQLqL9iOFMTCOWj+BRkmDc41ENxRh/VAjLXY16VtX+L0H1uGd4XeR7nywoScvXtPgJu7PNB8tUbkPvRpPW0l2Xnpd8gypSJZbZRuBjXzBuuWWpCdrdxAkUsxr04CtVNJzFHf96vrI7+8GZufhHdrcVQs79MQBl6as01+TOSgVo4+jpKUqK1+I7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnIRL3Oq+G+6iP3skTwM1VwM8bN3G16jHIn21VvNUrY=;
 b=Cxuhep0SQJcVrrE9cl58md2fA9S3xx9PHsj2kx+8ns+tWeLyevInhpZ/rypFHVBZF35TXLqRtN7C0BEhZJ66afn6yeY0ghN6c65a7rt73DPmvYL7q0XscJnA9ZSzty00Uhb5OBicTV8Gf+b7kI89/SCZtfF41Ypx+CuTYTIOoP8deErDLv99jmD9FE0KikGLTaUTWPP/o68mcODJQuBG6igB0LfAzy0Soh8WsZ7qzMTJJR6BoeIOExnSShJLQAvBdPAWOl/HGuqe+k4j1nJLBv9Y1H37YuHiaqAY9yzsoYMyQWVnrApBs5JLHStRbJ0M5sZDNNTvSORk3OYed1qr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pnIRL3Oq+G+6iP3skTwM1VwM8bN3G16jHIn21VvNUrY=;
 b=QhYUftXQwUAKERk01qUfdeoobUYexFSCFgiLXnpVgYr/3GOxd00+Nhcgv72iBfid81mb3bPwlBOKG1+cVQVQiEXH+OJ9oqVhCTUuTPLMySs1+hsZbdO+sFSUNLjmhc/QyUNPmnkiHr6Mxoj77hgJIA6hqer2cKcxZjkMV9xQYW0Va97a84JKikbSt0o0T9J6uaUUI9JC0V0RkvtZYoR28vga5en75x1dR29MD6+MhEfHzWhDVJJ2Xj519daHp/i0Vq9dlpt1bn2c7cqxxFZpNQ1FD3QUwwVJ8mfSdn2tYtkLLkegF2RMiJaZa2zrXxfxplbvhWn1Xc9Hai2pDf3Q5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS4PR04MB9364.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 11:04:58 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 11:04:58 +0000
From: Haibo Chen <haibo.chen@nxp.com>
Subject: [PATCH v4 0/5] mtd: spi-nor: micron-st: few clean up for micron
 spi nor chip
Date: Wed, 12 Nov 2025 19:05:08 +0800
Message-Id: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
X-B4-Tracking: v=1; b=H4sIAORpFGkC/23MQQ7CIBCF4asY1mIGaAt15T2MixYGy0JowJCap
 neXVhM1cflP5nszSRgdJnLczSRidskFX6La74geOn9F6kxpwoHXjIGkPkSqKosgUQvRCFI+x4j
 WTdvK+VJ6cOke4mMbzWy9vj2DzWdGgWqDNWjFTA/1yU/jQYcbWXXm34K/BC9CNW0rlJCs6ttfI
 f4IUQSHrrNWcqml+YhlWZ7gn1NM+AAAAA==
X-Change-ID: 20251107-nor-84fe07ec3363
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Haibo Chen <haibo.chen@nxp.com>, imx@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762945552; l=2539;
 i=haibo.chen@nxp.com; s=20250421; h=from:subject:message-id;
 bh=VzcZjBPPKQt4Q5DH3qoRxDeX0Te1si3YBAO2+DSXsTQ=;
 b=QUsccK/bGC6lEIHBukKwpUwaAwscZLOHnOJvBybQ9cWUnw1tOJ3lXfAFtGIFEyB5go1AoqJ9z
 wMtCgclLLP5CeXkawQ2/lHQQe0pZkVQ8MN8i8ZUraZM0jGveEUgR7IM
X-Developer-Key: i=haibo.chen@nxp.com; a=ed25519;
 pk=HR9LLTuVOg3BUNeAf4/FNOIkMaZvuwVJdNrGpvKDKaI=
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To DU0PR04MB9496.eurprd04.prod.outlook.com
 (2603:10a6:10:32d::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9496:EE_|AS4PR04MB9364:EE_
X-MS-Office365-Filtering-Correlation-Id: 461c951e-ca85-4a24-37b9-08de21db513a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGQxcmN1TGJEWTJpbTZFbFpjdi9tUzZSODBVZ1JQMXAwVVlQcTJjaXBjS1A2?=
 =?utf-8?B?a2UxRG5TSFhrNEVaL01jd1RPcHpTaXRUWGFMNW5OWFJTMGhIZjFVR04va3F6?=
 =?utf-8?B?Nlh6NFRGYWJSZnErRjRZWTJZT1RlYmp4cER4NlhvUkF5MkJxL3o3ZXZLbzZT?=
 =?utf-8?B?TVYwdUpNaG5uV1Q5bDBsaUlGV2p4MkRxOGtPWDY5THVJSzRBTHl3aHN0UVBx?=
 =?utf-8?B?YjNsOEpoWXVHbWtwNmNQZTc1MVFOclB0RWtwWEFSTkt3Z0RWN2pYSDlTYmpx?=
 =?utf-8?B?djN5RUxmbncxcVdkMFZHTk0wL0ZoUGJWcDNLSXFQSlkxMUxXUGJ3MG5Cd2Jk?=
 =?utf-8?B?M09jRXRCbWVBUG44cHoxQnExSkNYd0hmMGxYM1lOVVEwbFVCQ1FoVXkvQW03?=
 =?utf-8?B?WS9FVm8xWStnaVBLMlVNeWdFQStGcUMwV2ZBUFpWUjBuZzlSZTZ3RFBpV1M1?=
 =?utf-8?B?Qk4xQzBJVnFmVzByUFRzV3pVNFNzRDRCWWd0azU4NzZvdGU3d2Fta3REUGQ0?=
 =?utf-8?B?ZTdNYXRwU1EyN0VrandmTUx6ZFRrc3V1V0owRGNaWEl4WWpveVY2WEhjc0JP?=
 =?utf-8?B?OTc4U3N0aXFHVXdxTERTK2dhZjFhVUFnM2VMZzVKTHk2Q0pNM0tPRTRxK2o1?=
 =?utf-8?B?ZEU4NW5IU3FSTGJJV2IzRllqRDVhTkVhbHFlbmxVSGMvaFNhWDNVektENW9x?=
 =?utf-8?B?b3AxVEZLRXZyRXRzbW82MFpMN21Ba0JZZG95Sm1FYWhlbnVRVTZWQmtjbDhJ?=
 =?utf-8?B?Zjl6ZXI4QWx6L3FTTCthUEhSNjhGRit5U05DZVc2c0YvN1lXZnpQU29KK0s5?=
 =?utf-8?B?MG90SkpyU1NLUUc0T0ZBOThZK2ZGd1V3Q29JcDMvc3c5YkxZWGZkS3dOcTcy?=
 =?utf-8?B?SkUxeXVlVWlaTEVBbWtwSmRtOXZTRTBuQnAxYU1UelNhTHZSR2svWEQyNTNr?=
 =?utf-8?B?cS8vemNDL2Q0bXRNNzFNQWkwbDdUanpBemFjYzE1dVJ5aFdZTzB6SEs0ZVJT?=
 =?utf-8?B?eXBVYWhSelVKSnlyWjgvRU82T1dTUnJ1eW8vd2Zma095OFpjZUhpckdDRnNx?=
 =?utf-8?B?eWNXVDdNL2xKQjZnZEk4d0ZNK1lzZ29mbFpwWjA1TkpVQ1c4RDRHRUFXWHJr?=
 =?utf-8?B?dHpGR3VhRFBjaFV6blliclVLRGlIaUE4K01KTSs5dm5UK2t2cmg5a2tJQjRq?=
 =?utf-8?B?SlZWM1pUc0o2cFBQenplZUV4a3crVyswZmcrY3FWR1htVzZKMFdrU0Z5TVln?=
 =?utf-8?B?V05FZFpydzBWU2g5RTNSdmwvT0hUc1MvOU5VR0pzMGo0Q1RuTUZzVkJXcEsr?=
 =?utf-8?B?N1hPODVlQW54Q0FFcUFYZXB4Vjk2L3NITTNkcDR1MVRHT2V4OFpRSG8rRmkw?=
 =?utf-8?B?K3M2TzJJTmNaUUdwbFJqdmwvVStEUnJlTndnVVlraXJpYXl0c1ZCcHpjZVo0?=
 =?utf-8?B?aTQrSDEzTmtlZ3N4V2xneXQ2eks1WEZ2K0doUWdZNm1QZFNrbVNPcnhjRjVa?=
 =?utf-8?B?eXJnRUxsdUFyTzl0ZUNRQXR4VXFxZmZXM3U2aHJtdVQvMXYvYjlsSzJtTUsw?=
 =?utf-8?B?SFNmYkc2K2lHUkFZOHVCZGkxWFNLa1dKdW5lSlhMR3lZR25HT2hRTlpGOVBI?=
 =?utf-8?B?ejNhVDhYbVR3bktzUE50enJaKytRMUNpOHNjZVR1UUNKczhoVFZGV2tmNlJ1?=
 =?utf-8?B?akZ2cUptSW1QNkhscFpUbENUdzVoNkwyeWZLOHpZT25aVDBwdFdkNmM2bU9t?=
 =?utf-8?B?Wmx0ZGh4ZGpOREtqQmJ2bndJdmZtd1l2L2Q4L1p6UXZPbEx4aVJtdW44VSs5?=
 =?utf-8?B?UFhoRHJwNlBQVE90eGVWd243ZjN4TFFOYmd6R1VBTlFwUDVFc1JFMlUwQzJu?=
 =?utf-8?B?VWVsN3VJRGFqNFBIeENUblhiaytlR0UxT21ud2J1ZDc0OUEvNEFtSzh1eEM2?=
 =?utf-8?B?Wm93Q1Vvc1o2Q0RoSEF1d0VFZFc2eC9Hak0xUnN5TmtXTHhSNVlDRVBKYWo4?=
 =?utf-8?B?M1JRdDBwMjdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlJWZDNaQlRObzNjZTI0TEo4U2dFRmN3UFhOZVhhODEvMFFsN2VzVFlzQmY2?=
 =?utf-8?B?dDVYeDcra3F6V3ZGU3JBNHdId0hmZzJDK3pDbTJzSmZTbU9zcnk2M1lnSGF5?=
 =?utf-8?B?VzNFUUFNVGZhekVyek1wTVpVTlFFbHozWWQ0eld4M1N4eWRjNnBmRUMrUTJv?=
 =?utf-8?B?T2U0ZjlNYUVTZFRGV0ttdGQwMkF5NWtVcVB6K1FPZEQzMFVJTURBVnJubXNs?=
 =?utf-8?B?by9heEtuZGs4OVlvOEhGVGJNTzRpTE9nb1RMNVgzN05pU1pLbUdnZ2VTVkNC?=
 =?utf-8?B?VnFvR0w5ZEY3cFplZVdKaWIzaWVucUZLZDN1WHBGa0dDL0xJQnVWblo3aUR6?=
 =?utf-8?B?eWR5MldHOXhWZzNYOW9vdTJ2ZmdNeXpjMGhqYTMzM3JaRDBGVmhSZWRpbzdQ?=
 =?utf-8?B?UU1CZmNVdmlyMEFJNURiRjI1U1RvVTQxNXJWRTVEREFGaG4wdGRHS0VSL1FI?=
 =?utf-8?B?NDZXZWhmNjYzb0gwREJhRm9IL25PREpCQjZuQWt2TGFjUUF0T1pYeHlDZUNN?=
 =?utf-8?B?RDBPbkgvQVlydnJLUEpLOE5rNHBSU3dvemN6eWFvMm5TYTBPMzNaWFJHWEpD?=
 =?utf-8?B?ZzVGNVdiR3dtRHFjU054U3ZmSi9mRHRwL3lkMkozMXdKd0ZtME5PQWlXVzBL?=
 =?utf-8?B?aldOK1lEdCsxRXpWQVBZY0Q1NDZNVG9DRkY0cHU5UXhiQXVjZGVqOFBzSHRT?=
 =?utf-8?B?NXdTaFY1cjdyajF2aWUwNUJoZ01NL2UrQ1dsWWVTOFc2azQ3R0I4NXdrZmpp?=
 =?utf-8?B?TzdNN2I0WnA3dy9RL3UzK0FRVk84Mm9PbCtjNUdib2kzS3JXUG5FblRSQjg1?=
 =?utf-8?B?TStTME5aWEpYdFErekJjTkJzOGVKSFNWYkxzNmpoY0tWM0Zqek9QYVF3TVZk?=
 =?utf-8?B?TVFwS2Z5ZHBQUjFnTWNTYTQ5aDlCbW1yRmEyS213aFlTcXNoZFdCR2ZmNncx?=
 =?utf-8?B?VkhsUEJsOXFQZHZQR09selpTK2FncmZsRms4Y2ZMUFA0WGd2SmRUbDZ6UlA3?=
 =?utf-8?B?S2p2dWkzSzFMSDcvSVRNUlNzdmgxSDFveWRsSFlRSzJqNnRPclY0dUZOUWtM?=
 =?utf-8?B?RzFTT3BRYkJYbFM4WGNlTklmOEFlTzVuK3ZJanZuNmgrdHVpSDB6YmlZaXBV?=
 =?utf-8?B?UkFQQlhIUVFtUWNTdFFiNGxwdDFsdHF4TStCZ2tmT242bVUzU3lKWEZya3Bz?=
 =?utf-8?B?TnFMWThZRVBzWjVNTDg0TFFmMjFsazczQ1FSdlpJVVhkRlJ6RXNZTjRVbzJw?=
 =?utf-8?B?algyaTByeFJUdlRJamY2Z3Z3TEhjd1BWR1lENVpkWUFSYmN2MyttTHhBazNT?=
 =?utf-8?B?cU9jSGZUbC9LSWErOENXZGFsV29TK3lMR3hEZWQwOWZDTHFFVm85NjU4MFVW?=
 =?utf-8?B?YXc3WFpDWnZVU25WbkdGZmxNZWZGbllSdjRxZ1JWM0NHVHNzMVg1end3ZHY5?=
 =?utf-8?B?L2dZUkNoSXdxUVNwSVkrcmEvR3FqR2s2ZXU0UXlacHp4T1pPZktZcWcxY1pM?=
 =?utf-8?B?SVlKSFYxNHN3R2MyMXY3N0xPU1FyUFljczBua1JvS1c0YjgzN3JHdmcxaWJJ?=
 =?utf-8?B?UVo1SU5veDA5NGdLb1J0L2Rib3EzbjRZbTFEQkxKWWZZZzR3S3dHNE5YaWNo?=
 =?utf-8?B?cFBYVzFIaGFvbkZ3eG1EaS9LcmJYcUN0eGFOakFlTERkQWhpbWtYWW1HZThE?=
 =?utf-8?B?WUFuOWYrNzl0UlF2ZE5aWnR4Q3A5QnVCSTFwa2xRSUlPcWZ2TS9SNFJVZEZK?=
 =?utf-8?B?T25jK0pBWmZHRklMa0NaYVhxM3Y0MmtibTNURFVvcEllWmIxTUxoTkZLRkhq?=
 =?utf-8?B?Tno2aTRvVXFmZEk1SkM2TXZiTEFEck5vaHVoWXJDUXVNejdGRDB5bzFNTFFx?=
 =?utf-8?B?RXJ6VXlIbU1IV0plOUwwOXN4b2tyNnJxS0UxOVluKy9QekNYS1c0bThyRnBJ?=
 =?utf-8?B?Ym9MV0d5d1JQaGZSckY1YXJjeGpFeDZjZ0hFbHJxUHErUjZoOTEvbDNGVVZB?=
 =?utf-8?B?WlpwUTZTYXkwZUYrelJlQXVNTlFtY21CYnBsUU9qemZpMHlLR3M2dUVGeWs3?=
 =?utf-8?B?T2RQMGJrd2xwZHNSOGdJU0hObU0rSjljeXlmY1BNNnVvRGdWMTYzVXM3Q2lH?=
 =?utf-8?Q?s5kE58mTEjRmGBVRyrkcLHlj0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 461c951e-ca85-4a24-37b9-08de21db513a
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 11:04:57.9776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+518tM70WXy7a6+qLjkBpeg5bYCqXbseX6v9HHDpwEhFwsXABh6VBleD4NX4tax9ahs8Q16Ft99v5GtLZnRwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_030505_287683_EA7DB396 
X-CRM114-Status: GOOD (  14.16  )
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

mt35xu02gcba, mt35xu01gbba and mt35xu512aba are similar, but with
different number of dies. According to the datasheet:
https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
these chips all support die erase command, but do not support chip
erase. But accroding to test, mt35xu512aba support chip erase, do not
support die erase. mt35xu01gbba do not support chip erase, but support
die erase. 
This patch set clean up the mt35xu512aba, and add mt35xu01gbba.
since do not have mt35xu02gcba to do the test, just add some comment
under mt35xu02gcba for further work.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
Changes in v4:
- PATCH 2: change the commit log accroding to Tudor's suggestion.
- PATCH 3/4: remove sector_size, SFDP alredy contain this info.
- PATCH 5: change the commit message according to Tudor's suggestion.
- Link to v3: https://lore.kernel.org/r/20251112-nor-v3-0-20aaff727c7d@nxp.com

Changes in v3:
- only change the commit message of PATCH4, no other change.
- Link to v2: https://lore.kernel.org/r/20251112-nor-v2-0-8699383714b9@nxp.com

Changes in v2:
- PATCH 1: edit the commit message, mention the function move a bit up,
           and add Tudor's ack.
- PATCH 2: new involved in v2, move set_octal_dtr to late_init() to benifit
           all micron/st chips.
- PATCH 3: v1 add die erase for mt35xu512aba, but find it is wrong after test.
           mt35xu512aba can support chip erase, but not die erase.
	   v2 also remove some fixup flags and size, because mt35xu512aba has
	   SFDP.
- PATCH 4: V2 use SFDP, remove some fixup flags and size.
- PATCH 5: V2 remove the code change for mt35xu02gcba, because has no chip to
           test, just add some comment to remider a code change in future if
	   has a chance to test on this chip.
- Link to v1: https://lore.kernel.org/r/20251110-nor-v1-0-cde50c81db05@nxp.com

---
Haibo Chen (5):
      mtd: spi-nor: micron-st: rename the die_late_init functions
      mtd: spi-nor: micron-st: move set_octal_dtr to late_init()
      mtd: spi-nor: micron-st: use SFDP of mt35xu512aba
      mtd: spi-nor: micron-st: add mt35xu01gbba support
      mtd: spi-nor: micron-st: add comment for mt35xu02gcba

 drivers/mtd/spi-nor/micron-st.c | 101 +++++++++++++++++++++++-----------------
 1 file changed, 57 insertions(+), 44 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251107-nor-84fe07ec3363

Best regards,
-- 
Haibo Chen <haibo.chen@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
