Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959AF606A321
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2026 11:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LelE0x7y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=NyyEAT1p;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=stBFY9xl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CJDIP8/dqvlSVLsm/0utI87L7L8RreGw0pbnhVHg8vA=; b=LelE0x7yTb6/2SxHCmGVhcaHuz
	5oRYm1pw9vqGQ+OBWfrY29xoEEcxmK07oiRlJ/nZ0Cx5ZQKbF8S+oS8lDAkfVz9GlTVuFR/IWbBMb
	UO74sOquZld+opZYtCUc2wWXYRJjLqpjsbYSfuVr5GLR101KRKo4+sr67GBGFx7y16D/UY9NK2ppI
	Z/AwXLzpgGIJpAdLn5OFS5eukMcGayTlaoeaOFuvX9q4IHYmYrmb2/KubJZHA4XAcCKHb/a/TVDh9
	gotn6hesgwHHQprGLm6jwmj3n8Zr4qstEMByhd+QECSXE7aXW/v7G4mkXyKFx/2No6LWgNPOGzM/w
	fuejTwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB7p-00000009cVc-1E6i;
	Wed, 25 Nov 2026 11:25:21 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB7K-00000009c3I-0ODK
	for linux-mtd@lists.infradead.org;
	Wed, 25 Nov 2026 11:24:55 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9okii4131589;
	Wed, 25 Nov 2026 06:24:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=hvRpU8CknZ+lr7x2omDrw4YAhNpnBx28dS8AWLm4A3Y=; b=NyyEAT1
	pUPtjbq7Imr1x2HG6g7R0O3BO6Xeo/QgF8jjyNHd88IEtuSYTXXp+1efO18V/SPp
	EPRxXCpRYVg9X5eJCjp7GYYT1aj6TzHCgxEI9cx5kbA0k340H9Tn1FNLptrxxuwe
	SC6HnIaxq3HUWue30VRzkSWBM9vLZVT/pHefUuBUOhqMbUo8qV3twozCRqgj5+WH
	E04fOxh9NuRSvooCfjagLlKroXM/Y2bFQJ8WbY0jf5owQA8p94jmolWfGV+mOMO9
	Cv1kHy5rf0Aeh1xU1Gh5BUGyXyP31QuBskL+o+bmMJTp+qMJP8VYMBhDvJytQc93
	gR8Tq/cIhT90+9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=hvRpU
	8CknZ+lr7x2omDrw4YAhNpnBx28dS8AWLm4A3Y=; b=stBFY9xlOXzdHHrPmhCJ1
	213N0W+cyOfk1hduAdMNw65S1GsZrZgT605dZ991mHsVgq7d7QNVfaDOxUbMP7QA
	Mo1MwhCn8nRJXEAZbRduhymdTuOp73/1QF9IdKcTu4zPDixM/MwcvysH/PT2uK0k
	c75OVK3w0NfnqufvXs5PWHpSASw4Jj4Gvc0OncGBL4ZTroWDwQQMaXuxlJ1feeMq
	22QOUrPA+T5mYhzIW09L6EY3araLUdTojgDPTU5KMwk3MeS33CKmPqhlP/3SVIXe
	pBcMjH+ge29LVWun0JoajGvX6qHzct1+atHcMjI71O++Jl0qsO46YegBZsb/ax9I
	g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j56d6qumg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Nov 2026 06:24:20 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4S6HVxGB3IM6WXcXH+nwshp5Nv6xZAyo2DAahsYCUP+kYVrci5VEhwK8uqETGfyhh+JEfH9Yf1RGzVObH7pznM0KhPWqTvi0hfLwhvIxu59JaMyZVFNaULs9tjwslJ1kwqAD4RE9cnMJoWRnhXAHhHGkGGRS4vxI3NmD1OlVTwR/iPJTAWIS0IcPLWj3F0ajyRavBgBTegKBXuaowO3tmb+jUy5m8uMIQlGrZ/r7lvY4FA+81lQGGFkWU1hR0QQeTf/oWrWlDBPONxAifZxhx23vx1gTOupV4YLexIB9W4f79akJTSaMKMtlW2jOTU+QfZtyHf7pZmN7y//psn+Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hvRpU8CknZ+lr7x2omDrw4YAhNpnBx28dS8AWLm4A3Y=;
 b=bwfIQ5FFoqXHjQSPAr7RzGXAKSKICPYQAoJCbn3YDxMQ9I55icaUGl4kB6r5oOzGBKZc+TaqdeNcv9pXfmnHBAUlbeev23QUynWOHxBvivpoRLLKBBmNHbUFXboGSEOh8CMnUsdQlE9W63fDLceELCQPJHlXwkX/lsgBoqqktMnOt39mj8EgdNJm8aLP+B9X3S8O/lrvjqeB+Wj6HrgiGvmenRKjZjQ6mHeFcJbrjfTqrR2TFMshYYaw5qaK/qUwrdRWULBpiU4kGI1cK03jgZw1MZflGCnuALe/ihx3aq49run77UWkMck+ODMcD04UAxjMixsuGxWD2J5t3080og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by CHXPR03MB989198.namprd03.prod.outlook.com (2603:10b6:610:2fa::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 11:24:18 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%5]) with mapi id 15.21.0639.011; Wed, 25 Nov 2026
 11:24:17 +0000
Date: Wed, 25 Nov 2026 11:24:14 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v4] mtd: spi-nor: micron-st: Add support for is25wx01g
Message-ID: <awbFRkNDZUj-PcI4@nsa>
References: <20261106-mtd-spi-nor-new-issi-chip-v4-1-7e2b6a361fe0@analog.com>
 <DMYDPBNBU7IY.3956HW6C59693@kernel.org>
Content-Disposition: inline
In-Reply-To: <DMYDPBNBU7IY.3956HW6C59693@kernel.org>
X-ClientProxiedBy: MA3P292CA0030.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:46::13) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|CHXPR03MB989198:EE_
X-MS-Office365-Filtering-Correlation-Id: d44c0b78-6f3c-406b-bd19-08df4ae6a4cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|4143699003|261009223027099003|18002099003|22082099003|10067099003|5023799004|11063799006|56012099006|261102123227099003|261026121527099003|261022075727099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: sCSODUnZeNzt1WBwRsPktfaE1psdPOlNXaMFZRVbGa/sX4IaO9P+VnJsOc3qc9qntsxyPXAe+jBA+PwEzGpEEqEL8B3EntokM6ZAJETr+thJYlEgNMWgU3PKN4+XMUazsrb1sIYPzpOKT8g5ff1yyobqPxm3DPr6qaksLpYHa7MjyyFstzZWsncctAxXIxwn5oY3sPoHvvYB+fBMJ490fVaOkYqLLJxSsanH9LNGs630dR8eC7Qt8xw7BsJ0+J54zlE/R6/S9CQiiWnKVXWr3Nh0JPgbDUlnGknAFmaGgGiwrlaC2L81EvqqXnLxxBTealooBmtByAr9hK7jmvvrCJjibVXODuKcUey6avX94AvClwr17+mk3DwHJhqc/2Gn5A3nFMltmZ033mDRXdC+UuDcCc8Q52k3EgGr+54oM92Q0zp0k/NYePapk6ij89qi5RlHM8iP75Y+VzfxfLEJ7ZpcdkK6o7JP9bXfw4IGl65WTCd9jiOTVfeMVurPTXnFcVXRcntlKkn+IPqDHRwkb8PK1+nz136eIkXn90SzSTNxJVnpEA+bq7PJKkmP8BhhHI076WFrz19gLbPgZvAF01NGwPK6+tG9Puj4Hnpfijc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(4143699003)(261009223027099003)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261022075727099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDRicElOOU16dTltdmQrdFdTVVFlSm9TMkprTW14N0d1WGhrRHZuQldwU2RI?=
 =?utf-8?B?a3pISGwyWDY3RGRPekgwZHBHeUhZNy9MaGwzTGdnS2xFVjNKUXdwaUx1ZUxZ?=
 =?utf-8?B?Y0tTVkcyd3Z2aUJiTHpxT1pqNFZuZzAyNDJjVC9UYnZkU0VXUVhGTDhBRHFJ?=
 =?utf-8?B?ZEQyVkNBWFBMTHlyN2pGMTlUQlh4LzdrU0ZQZlc5Q2dwWkpLa3k5NDVqN2w4?=
 =?utf-8?B?TjNpaWFTUmdxT00xbEJ1Y2NlSzNPdEtGZCs2QUs1ZUMwTlZsYllRNThHQ3hX?=
 =?utf-8?B?OXlsZUtCaTI3dW92QkJMdit6bG5ScmlKMUVrMnNNSmFnVW5ieXNFU0VSSlpP?=
 =?utf-8?B?UWw4VWZnMFYyaEF2ZkNKbmtRWlQvWGF1Zk40bmd6Kzd4NHBncnVvclhnclJo?=
 =?utf-8?B?WGd5MjY2VTlZMFcxRzhzNkFtSTdmZDlSbUFRZE0wSk5vZHBNZjJSZFBkbk5N?=
 =?utf-8?B?MXNnTSs4U1hJMHVGN3BvQzdiaWhWNDA3MnNZcHJBaHZ5aGdxd0t6WjVRRjJD?=
 =?utf-8?B?QlBJSFAxQlFETkhOTVI1ZnIyek5jTEJqL2lBV3Mrd3lrZEJnUC9hNGI5Y09n?=
 =?utf-8?B?bFZ5K2NndlNOSi82Y29HaTlZU1VwVkFrQ0NLTXB3WFQ4VEwvdVRKdmVHeTNB?=
 =?utf-8?B?ZjloMFZtcDhNK3ZRb2dIRzRXQTFBUmp0UWU5eHlQTnp1a1I2aGFaNVZLOElr?=
 =?utf-8?B?R0cvQ21UUTI0NW82dW8ydzYrVGZobE82WHY2K0JhMzlIZ0UzVW8wYkZaRFBS?=
 =?utf-8?B?Z2VubVcyRWlwYjRPdlI2MzNod0czRDVJSk9EZlRIb2xIbmRsa1REalFzejRE?=
 =?utf-8?B?UzdIWTRJVGplcWxheFB1MWsrYnA2bGdRWGtRYXZmTUcwb1V1M0x3dEluN2Zq?=
 =?utf-8?B?SUt3K202dWhCTFk2eXBUS2F2TUJHdW5kenFWZjJ6dEJSa2lBRDBLd09uYnB6?=
 =?utf-8?B?OCt5UzdhM0Roc3BYTHdpZFArdUdTaUF3N2lFWjNUTlpTcUZ5RWxMaTI0ejlr?=
 =?utf-8?B?RDZ0NWUwc2N6aE4wMlJ4NlFyZ0VGSTVYNGlna2pCYlJWOUk3SkNjSHNOZXJM?=
 =?utf-8?B?YTYzeDd0cFBNV3RMWTdLVEI5NzBPU0NoQUhESDR3SlFFZUNOQm5uU0lNYnFr?=
 =?utf-8?B?d0ZVVTRhVnU0WHFRemlSejdGT1R4RHB3QWVQbUVDRCtXZlZhZFRsZzYveFRZ?=
 =?utf-8?B?VTZqU0hvNUtLYmc2bTN4bWZxSCs4b3EwL3hGN2liSExqSnU0bFlWd0xSa2d6?=
 =?utf-8?B?QlJiMXFwVCtOV2l5R01qRXVGSW9JaU8rNGpQdmo3VGt2WUhXdys0OHpIOW8w?=
 =?utf-8?B?QUVLWHdaQzQySG52TmhqZ0pxU014a0NoendxeCtHaWR2bDJFVEFjY2V6S2tl?=
 =?utf-8?B?YWQ0RU5FSkZ3aXk5cjIxUjAyRWdsMklxM3pvU0tZNUNlQVZVSWhBSDZaMERq?=
 =?utf-8?B?R3pBRjRWMHV0NEVXRWFuVU1jOUJhMHlMODlVNmxNSS9iZmhMR1hFQjdVdjN6?=
 =?utf-8?B?c1k0ZkVNV3dRSCtQZ2pzN1RxUitQdTVQZjFuZTI2VnpPR205eXhGOHhZcGF0?=
 =?utf-8?B?VThRY2pTRXZRSENhQUhXNVQ4THpJSFMxbjNwN3YrelJKa1Yxd1lUeGpybGs0?=
 =?utf-8?B?OXI0Vko1QkJSL3F2aFNQS012Q2dsQzhGcFFqSTRlYU1FSXE0dlBMc2lBMHJB?=
 =?utf-8?B?V1I0WXVickpPVXg4MkcxaTdRQW5ZQWl3cFlBU0FFeTAyellqRTNpTjNUdENE?=
 =?utf-8?B?NHJEaDR1WndzSjlja1c2OUxFaTIxd1pUSUc4VGcvYmdmSkdMYmZ6UVVOZGow?=
 =?utf-8?B?d0MyQUk1YUduSzF1Y0pWdjNXNStkLzRORmZDbHNQcVR5eGNrKzR0NDBDMnI0?=
 =?utf-8?B?T3llMjZtMmZmL3RORk9aV0xTY3hNWjc4dWk2SEhUcUNYTFBnditUK3d4T2oz?=
 =?utf-8?B?dlNwV3duUjcrUlRMZzIrTVY0WC90Y1pWZkFWbkdyb3B6dUIrcGRCdjRqcFky?=
 =?utf-8?B?bE5RdlVXMTVCMEZoVGZFcWhKRURKOG4vMDFPVnd2cEU5aHZjUDZ2ODBxSjVJ?=
 =?utf-8?B?OGthMEIxQm1VZ0w2SWlSYmc1VUx2b0RWOC9jcTdzaGoybnR2KzFFL0xwSkRL?=
 =?utf-8?B?TFFVd0dQdmZrcjNldTdlN0hnYVV5QUZaQjMrRGZYOXlzOElZNlk0dHltVEJI?=
 =?utf-8?B?TTNER2V6bHF3YzVrZFo3U1hOYkJpMWhuSGtHeGVMZzZrdXZhRkV1SkFKeWwv?=
 =?utf-8?B?YkZBbnRJWkZVTEY4MjBnVWpGYjJwQ0R3MlpmRWhWdWhjaGh0SnRIVCs0ZFNE?=
 =?utf-8?B?a2FkR1loUWJiLzFNVHVNb2VmMktYeVRObWRsZUc4UEhoM1BPY3RGdz09?=
X-Exchange-RoutingPolicyChecked: iIjDcA0NYaPzMFnhnB5fObFZjRETiGpmNXvaKSwOIYLTORRcVtQSaywxQvtXK4hJq0OLa2/460KUulySrjC3moWxygFj18rESAMkcG4c68UifTIzoeN0wF+SitKHSh78az4p3BHNFH1muJKwpgYxF1hhWuKgWb7nVSzeMW+1nPPC/1HPgYBJ9oRblHE58SdEbADQUDt3zaG+KOqr48pvDtQazccWg4ikIk9QkepxO6aG6hImXMTxnC4Dr6bTvyeNjvuaOukCignOxGeILvVH9uEXMkn5CTZNIieDSqBTq8D5NoWgXw3KRWCAWyYmBuDLUPTfpLofxgdJ2r3T7QSCmA==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d44c0b78-6f3c-406b-bd19-08df4ae6a4cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 11:24:17.9042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CoOdjeHyiAFAZfS+TlU3w4z+YHbQNNKNh6o2+LlRKe6ICdWLLDmCM8LKikrae3Yg3pYj07m1oHFJ9Hws4G1kYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR03MB989198
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX446rkmJyiFUm
 hOixkRJ7SKGFvgeaHp2fcSndG9H3cpZhSau1o0avv5XL4sHcvxPRhQdR/+PBcBO4qEa35PGf5vV
 ZcLdW+e53N3dRm+oyAoYdl9Pr1FV1ve1UaaTJlgWFyr92H3tQbX9xmmdORud4TkXVIM1DyNKesC
 mWWeutPbkaLL2xbD6YsNPI8/SPs2No0R1/56wK45/nxnhdX7f9BjikuH2Gfn0u9JrTYt0A1QGu9
 m0UbYirvu8wczn5ZJF7SyFIcrZjMR4QzpU3NXhACsDMxOj1w2dszB7CjxNqP4om0nmdTTlVS3hj
 9hn0xJNi47WJxh1vgqYJIZ1IiX08eA04vflH0ES6gnuR4zQhfGVPUo8FhL50lwBFrck4yJdDCWR
 U34XUPSRTC8Zz3VA53rKGhg61NFyXQDdPqJk3iiWiV4N9yZePBS9xZ7p9f+LNv7pbOo49bTIeln
 1B88zJbmzzcUKN7fKwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX+soCAODskMGo
 UZFiGikr0Kdlorc5SjHkuQM0VxyBE3QHLDhuchgynBwbntaLmyawrPress0AofPNwZsh89ChikU
 y0iqTkg8zs17hAMbwIC9muvHq+zCkGWzkRrdIfr3DndX6GjpUpRV
X-Authority-Analysis: v=2.4 cv=bv3Zl0ai c=1 sm=1 tr=0 ts=6b06c564 cx=c_pps
 a=J0oTDZHsw5jmD/+vARdUUA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=P-IC7800AAAA:8 a=DUnRZS7UAAAA:8
 a=gAnH3GRIAAAA:8 a=ApklxjPEy8_8nPV2SxgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ST-jHhOKWsTCqRlWije3:22 a=d3PnA9EDa4IxuAV0gXij:22 a=cDzw7mrAGmWHSR5u0tpu:22
X-Proofpoint-ORIG-GUID: N3wEgfxEcOxvTN5Scy3rFQQzzxaKeKfW
X-Proofpoint-GUID: N3wEgfxEcOxvTN5Scy3rFQQzzxaKeKfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_032450_231038_50DD6172 
X-CRM114-Status: GOOD (  27.24  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMDI6NDI6MTNQTSArMDEwMCwgTWljaGFlbCBXYWxsZSB3
cm90ZToKPiBIaSwKPiAKPiBPbiBGcmkgTm92IDYsIDIwMjYgYXQgNTozMyBQTSBDRVQsIE51bm8g
U8OhIHdyb3RlOgo+ID4gQWRkIHN1cHBvcnQgZm9yIHRoZSBJU1NJIElTMjVXWDAxRywgYSAxIEdi
aXQgKDEyOCBNaUIpIG9jdGFsIE5PUiBmbGFzaC4KPiA+IFRoZSBwYXJ0IGlzIGZ1bGx5IGRlc2Ny
aWJlZCBieSBTRkRQLCBzbyBvbmx5IHRoZSBmbGFzaCBJRCBhbmQgc21hbGwKPiA+IHBvc3RfYmZw
dCBhbmQgcG9zdF9zZmRwIGZpeHVwcyBhcmUgbmVlZGVkLgo+ID4KPiA+IFdSSVRFIFNUQVRVUyBS
RUdJU1RFUiAoMDFoKSB0YWtlcyBhIHNpbmdsZSBkYXRhIGJ5dGUgYW5kIG9ubHkgYWZmZWN0cwo+
ID4gc3RhdHVzIHJlZ2lzdGVyIGJpdHMgNzoyLCBzbyB0aGUgZGVmYXVsdCAxNi1iaXQgV3JpdGUg
U3RhdHVzIGFzc3VtcHRpb24KPiA+IGRvZXMgbm90IGhvbGQuIENsZWFyIHdyaXRlX3NyMV9hbmRf
c3IyIHNvIHRoYXQgdGhlIHNpbmdsZSBieXRlIHdyaXRlX3NyMQo+ID4gcGF0aCBpcyB0YWtlbjsg
d3JpdGVfc3IxIGlzIGFscmVhZHkgc2V0IHRvIDAxaCBieSB0aGUgQkZQVCBwYXJzaW5nLgo+ID4K
PiA+IFRoZSBmbGFzaCBhbHNvIGhhcyBubyBTdGF0dXMgUmVnaXN0ZXIgMi4gQ29uZmlndXJhdGlv
biByZWdpc3RlcnMgYXJlIHJlYWQKPiA+IHdpdGggQjVoLzg1aCBhbmQgd3JpdHRlbiB3aXRoIEIx
aC84MWgsIGFuZCB0aGUgMzVoIFJlYWQgQ29uZmlndXJhdGlvbgo+ID4gUmVnaXN0ZXIgY29tbWFu
ZCBkb2VzIG5vdCBleGlzdCwgc28gY2xlYXIgcmVhZF9zcjIgYXMgd2VsbC4KPiA+Cj4gPiBTb2Z0
d2FyZSB3cml0ZSBwcm90ZWN0aW9uIGlzIGRvbmUgdGhyb3VnaCB0aGUgYmxvY2sgcHJvdGVjdCBi
aXRzIGluIHRoZQo+ID4gc3RhdHVzIHJlZ2lzdGVyOiBCUDAtQlAyIGF0IGJpdHMgNDoyLCBCUDMg
YXQgYml0IDYgYW5kIGEgVG9wL0JvdHRvbSBiaXQgYXQKPiA+IGJpdCA1LCB3aGljaCBpcyBleGFj
dGx5IHdoYXQgU1BJX05PUl9IQVNfTE9DSywgU1BJX05PUl80QklUX0JQLAo+ID4gU1BJX05PUl9C
UDNfU1JfQklUNiBhbmQgU1BJX05PUl9IQVNfVEIgZGVzY3JpYmUsIHNvIHNldCB0aG9zZSBmbGFn
cyB0byBnZXQKPiA+IHRoZSBnZW5lcmljIGxvY2tpbmcgc3VwcG9ydC4KPiA+Cj4gPiBUaGUgZmxh
c2ggYWxzbyBzdXBwb3J0cyA4RC04RC04RCwgYnV0IHRoaXMgY291bGQgbm90IGJlIHRlc3RlZC4g
U2luY2UgdGhlCj4gPiBTRkRQIGhhcyBubyBTQ0NSIG1hcCwgdGhlIGNvcmUgd291bGQgc2VsZWN0
IDhELThELThEIG9uIGEgY2FwYWJsZQo+ID4gY29udHJvbGxlciBidXQgbmV2ZXIgc3dpdGNoIHRo
ZSBmbGFzaCBpbnRvIGl0LiBIZW5jZSwgZHJvcCB0aGUgOEQtOEQtOEQKPiA+IGNhcGFiaWxpdGll
cyBpbiBhIHBvc3Rfc2ZkcCBmaXh1cCBmb3Igbm93Lgo+IAo+IENvdWxkIHlvdSBwbGVhc2UgdGVz
dCBpZiBvbmUgKG9yIG1heWJlIGJvdGgpIG1ha2VzIGEgZGlmZmVyZW5jZQo+IGhlcmUgYW5kIHRo
ZSBmaXh1cHMgY291bGQgcG9zc2libHkgYmUgZHJvcHBlZD8KPiAKPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9yLzIwMjYxMDIzLXNwaS1ub3ItZml4LXY1LTEtYmI2ZTBjZTIxMTY5QG54cC5jb20v
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MTAxMy13aW5ib25kLW1hc3Rlci1zcGkt
bm9yLXczNXQtdjMtMS02ZGRlMWQ1MTNkZjhAYm9vdGxpbi5jb20vCgpJJ2xsIGFjdHVhbGx5IHNl
ZSBpZiBJIGNhbiB0ZXN0IERUUiBvbiB0aGlzIG9uZS4KCi0gTnVubyBTw6EKCj4gCj4gVGhhbmtz
LAo+IC1taWNoYWVsCj4gCj4gPiBOb3RlIHRoYXQgZ2l2ZW4gdGhhdCB0aGUgRmxhZyBTdGF0dXMg
UmVnaXN0ZXIgKEZTUikgaGFuZGxpbmcgaXMgdGhlIHNhbWUKPiA+IGFzIGluIHNvbWUgbWljcm9u
IGRldmljZXMsIHdlJ3JlIGFkZGluZyB0aGUgaXNzaSBjaGlwIGRpcmVjdGx5IG9uIHRoZQo+ID4g
bWljcm9uLXN0IGRyaXZlci4KPiA+Cj4gPiBMaW5rOiBodHRwczovL3d3dy5pc3NpLmNvbS9XVy9w
ZGYvMjVMWC1XWDAxR0IucGRmCj4gPiBTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBh
bmFsb2cuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
