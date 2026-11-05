Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03702606A31B
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=htNP6PKL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=TV1mYgsC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=EXe5lgYF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l3WEMbJiII9S34wuj8IE4ZD2J9Hkofcl8FvpZJYx6nk=; b=htNP6PKL6DuovNbT0Vzss1Zi6g
	O2TUOKWBdeXdFYw+eg7qlO9r9vq2Bis1rs1SJSiBuktBrS2ND9IOVAALtOBFH6/A3H2AkLAgl6PGJ
	8LBTsrByJpt3JzDQ9pqiWZnY8XdI+wPG0T5xV1oDn79cKctQSKrHkfoMoQuM4N9pVsqTx1IiUHYz8
	RkLLbzKXf+CGK57VlKgSDfVyu1WWmr0VWpCHOuf354Ez288yMasIvT7+gpP0VdU9SRa2fCeIPS/ZR
	38bgPJ2gE3AqAZTmwyJ3D7XjYnSUwd1AbLy7RCNQ0/tJ2LtOhoIWMrEZ5U3l3XPZu9abZUoiAj5ZC
	JAmWke/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvkn-00000008fPP-0NcL;
	Thu, 05 Nov 2026 11:35:37 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvkj-00000008fOd-2WIb
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 11:35:35 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59vko9512748;
	Thu, 5 Nov 2026 06:35:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=ZLzBJcISiP21UfMeXdK1hMsApKpJClH4KU4K/FtdLo8=; b=TV1mYgs
	Cfkj3cdjdiF6PR1xEaIK3OVRgKqBCOfLOz3vSFJq2Vyt5EBGexV5flIBAxEVEV3N
	n+YKXRo8PFvwhNjepqg8eypuIAvR43Lc3/UEnF+QdT/iXOlIU6/yMIGgMC0nkFQL
	yzrDgerA6wewzolfFurDAa9u6sLjxi6s/5maOeTR3s49u0hsIz1czb+7nF/bttWP
	xA5f2B94DwnitXS9V/mIdGyLy2ARll/O50MsCW6vw3F+Y3GpNKPHcRqTF6/hX8kL
	Tvf5kDo/BoRKrba/zMfQEVbdhuDE1a3BNY+M9wHboE22Jogv7jZ3hM46Qe0OdG5L
	JJWukr5oDq8CWdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=ZLzBJ
	cISiP21UfMeXdK1hMsApKpJClH4KU4K/FtdLo8=; b=EXe5lgYFCY1YE/3j0s7cL
	gIG14UGpF1nVv3urao1OTb96li3vKkkcy7rwRROWnKJko3CagL1MuNe4LEoVPPXW
	YBP9xqFPjevlQLLxHGobglGWjCAOjKQjt2awSb44vk6ehucjvDMVAi0V+kWu6SPX
	FERiRzUppAz2N4XnicJpOLb5v7imld++N+rpsAdGIv0ZPe9PkJsZU/HEdqv1tilD
	cdbO4o0z7s12ekRSK6fHqhOFgbaa1routgWznyVks5hGfLlr9dDHQ1Gh7RLvWoJO
	YtkLa+XsmJa7sq3RWaoi1ZPwnug3R7pUimEruqvv6xEqN3IODsmr5G9XX4LmSXeO
	w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4hr9xd53hk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 06:35:26 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KS+kzyxRvlEr/IHKcLZq56avGc6jTwGLnHnqsYEiNDq8jkBrLqoXIQLxEFlrEXtSSkzkQenNXbVRWsy1+qXcBgwu+BtjBkYYYUB2DY0aATobhkZJ4+oJ18EqyzxLQH1UCIurNAPz+SKt/OxWittWBchlLg9gpXttcpXmL/8nyLXFZMQQMO+066QgPM940sXzEha1NVa2xII/LomOKCcoLiqCjfvcOjRT2aPCANJ5h2o7cfUIIM3nmtqB6RCklkRRwPONZ8IBYYgDSeT2QNcYcqOogRqk+nQ3cxqiBeyneE5mCxiMf8y4Ebenvr/MSPuBAiVgXxL8DRMUcfHDGg52bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLzBJcISiP21UfMeXdK1hMsApKpJClH4KU4K/FtdLo8=;
 b=J3GFvZAZ8tmDd5Ph3Dnbok2ZmC+iLlzdrCohj5HeAPw5cpUbwn6x6YVWY93yTCidx1/MRfT0HEX7tA6xLdxh9wr2P+JKQULKe1iKPtQMscz6favgg6lWrKnsjCzuHZkGctXIO+9aAdOISM63EGSQqcD42DYLF3uG6f+1+szz9RbYl5r6So4kenVOeLvAh9hFnOSslaODounSEHfL1WohQkXdq1Gxi0j3Dl59+4uhsjNve1WE/bo+TumRtCs5dsY5HbFFc7AMl9/f7P7fyO2QCDO2fGHDWaqi/yzTFpGeSCfX8cZ/rVlQN4l6Gkp/1jWfPFSBuEwqpkkd6qUQkRzHUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by EAYPR03MB461033.namprd03.prod.outlook.com (2603:10b6:303:2ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:35:24 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:35:24 +0000
Date: Thu, 5 Nov 2026 11:36:41 +0000
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Takahiro.Kuwano@infineon.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH RESEND v3] mtd: spi-nor: micron-st: Add support for
 is25wx01g
Message-ID: <auxqLCJuZpSNYgRy@nsa>
References: <20261102-mtd-spi-nor-new-issi-chip-v3-1-f5e38e200fc8@analog.com>
 <0cbfb61d062b437b8e860a9c93b13e4d@infineon.com>
Content-Disposition: inline
In-Reply-To: <0cbfb61d062b437b8e860a9c93b13e4d@infineon.com>
X-ClientProxiedBy: MR1P264CA0161.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:55::9) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|EAYPR03MB461033:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f495e8-563a-4377-4e22-08df3b30e191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|22082099003|18002099003|6133799003|11063799006|4143699003|261021121427099003|261102123227099003|261009223027099003|56012099006|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: otA9EJQaCm/Uyq0njJBqw+2DVDp6quuA/4PYQ5kn8eRfTG5VOxs34ip56gr/G9jC+B+xVJrBUa6jj1AYtSqrCp9eDKaBfEWQCZzLPkZmARSuIPc0hP8QrhcVrs+VdvIRLrIJrT/kQqbVKmmxagAWkJbSMyhS88vG5IZZMqTa4xIKW9B3HLZOtR7zh0Tt28vfWC8EmeZ86k2zyCVgrw+3+pvFVBJgLlkYYhWwdwQnbR+L+r5rzy3bQ3BwHYAisLLmLoJEYeQbMs2njqK42DvaUGqwh6ec7qZizPm0vBoNEzFW/jmVXl2etpvBQBb7QaKpMOkUlvwe/Uy5qRAvoIVDUxHulCJbjyPZsi2PFk3L24lUVTJFIetT0n3DkpnHeTirIiEg4LA0xeyKYYa91+Df7cCyUL0HERL9c22WeWwaoaEx/rP4RVSDr8TIFFW/h2Y4dQJsDI1FaS/vilWpY9d/yEENQRrcB89uV2R0PW2VRBxw9iVFm8KW2ph3ZEuHp5/S3CE1/kaR+GHBkQRS6pLa1aVoNyMVNOcJeeQbPVUz0kb7psBNWLBiLXZSHjlcR/w1fRzTGx4N+BFzkqrs4Pb/Kifww5ihIASThJ2MXPeRBvM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(261021121427099003)(261102123227099003)(261009223027099003)(56012099006)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG9pWFo0d1U1TFZmQkpZbmg2NVg0anc1YVZBNDEwaEQ4SmZZR0wycjg0ajY0?=
 =?utf-8?B?MVk3cHBkL2hNWFRDMTBydkJmbDkrU3hyOFZGeVRQVm1OOFQ5bWh0cDAxeHJP?=
 =?utf-8?B?cHlDYXJXTmF6RlNETFVYc0FqUXB0TGJGS3dJYzk4ZzhpN0Juek1Qd1I4aFN3?=
 =?utf-8?B?aE16V0Jpayt1UjgvSk1VK250Y0lRSnRjZDBWVTh1YjkzWmhQSFdZRUFIVk9h?=
 =?utf-8?B?U2tyTnVRM1lRZzYybVlNZmxCaUlhWWVka213bk5YTnAxYWE0RDI5V3BDdmNL?=
 =?utf-8?B?VEg0WWYwS203ZENMcWdiTlR1amw3RTlnaHRlZWVJUlFFTTZHekxQNHo0U0xm?=
 =?utf-8?B?R1d5eWxBaStkODJ4ekRBYjdUK0xXQUxvMStBYUtOWUVWN3FMTFYyOE9qWkNo?=
 =?utf-8?B?RHlxWHN1M3dhN2YvWTZCUERBc0tFVDg1WmNoK09zSEszemExaG1sMWxjRGhw?=
 =?utf-8?B?L2l1R055SUw0YmYwRjhRRldTYU8yT2ZHcjFDMTAvZkJ0YU5ITGwxb21MMEZO?=
 =?utf-8?B?YTl4MWVJTmUzQWhJUjlDeVczSUNIeHFaQnppOHJFL1pHeUxsR2RpbmVaU0p5?=
 =?utf-8?B?Uks2TTJWeVl1R1NOYnkyVmt4OXZGZUx0aCs3aWRENjlKamNjSmdsemhEM0tw?=
 =?utf-8?B?TjFxakNkbEsrM2Z3UzA5bGs2WUowOXhXbFNuQnlrNHhIck1KcEFHQzQvN2tw?=
 =?utf-8?B?dGVSdHNwb01QMVZnM1FUZlNnWW1JRStyaG9tV3UzY0gzV1B0UklTay9oaWVL?=
 =?utf-8?B?S2NFdldJWmxNczI3TTNkYklZOUk1UndPYzh5OHBYYW44b0N5b0VLWEFFZkNF?=
 =?utf-8?B?d2NiMEpiMHFHV3VPU1pRbnBINE5TR0VyQVhhcERiaHNYY3ZJVGZXU0QwT0hs?=
 =?utf-8?B?T1dkTUlrMWNOcGZ0SW1TQ1c3YXV2Tm1wd1U4S1pHLzZwRVpOMVJRSng3VEli?=
 =?utf-8?B?NjhvWUZYaUhwSVFTdnBMcFNvNGhPUVhVbGZSVk5lVFNSS2ZkQXN4a3Y4aXF1?=
 =?utf-8?B?YzdCTjRvNUZjTXFac3IrU25XZjJlM0Exam9qRVEzWjFUeE9YM0t6T3U5Q0RT?=
 =?utf-8?B?NE42UGlqdVZsM3lGRHAwYThVOVdkbnUzc0VMYlFTSnlicytlRTJQTEt2d09U?=
 =?utf-8?B?Vy9FL1FhRUlnVGEwRzMvMUpjUmExMHUvOURocTlacjJVYmhwSmRoTDR6aFV2?=
 =?utf-8?B?S0c0NlVjeWlIZy9LQ1BUY0lGVWZqaVMrcGxvdEdnK1M1UjlqK0syZXRuazNy?=
 =?utf-8?B?dXRsREZwY0NLbmtKcDZpT1RRMnFVUTkzb1pYSEV3Nk45WjQ4WUZYdlFoWEZu?=
 =?utf-8?B?SUJjWnJRM0NWamtta1F1aTV0clhmWUZUY0NDcEN3eC9ZS2ZwVnZDUWRPdFl1?=
 =?utf-8?B?M2lvWTN3TzU2U1hMZjF2eTJzdkpjQUs5dlZGVEpzRkoxcngxUkJOYy9uVXpC?=
 =?utf-8?B?UjFoa2ZDQmhZTVNZYUpXN3o2TzIyTk8ydlBhdXRYN2VBQytleDU2bU11K1Bi?=
 =?utf-8?B?Mk5ObzFKS0RSMjFIZkJFU0JGWk9SWjBLYm5LMm95alpBb0VpUkkyc2QyUjhw?=
 =?utf-8?B?QTlQQ0VPcFRuWjZZWWloRURkSTdhNG96OW4vKzNiajBiZ0NYeVFoOFFVY0lQ?=
 =?utf-8?B?V05ISVpzOU1iTmpGSG4vYit5ZlBDUTFtSlVWUDNQdi95VHMyM2JVS3ZaKzF3?=
 =?utf-8?B?VER1cGVHZ3YxSnFyZVNJUjR3ZkhyN3dEQ1haKzh4Zi84T28xaTBiZEdsVDY3?=
 =?utf-8?B?YmhGcldwby9lT0hDUzhLT1Z1UzdSZTloeXJtOW1Kb3ZGWC90Rng0bVUyZW5L?=
 =?utf-8?B?UjdhTTFnWVBxUlkrV3RzNzRIUG5hRXF3bVZUVS9CYTlTa2cvNEpCWWFpT2Jm?=
 =?utf-8?B?c243clluWHBEZEo4R0IxZnVEb2xnc241bkE2SGhHV2NtZDRpcXIrcUJqanJN?=
 =?utf-8?B?cG0wN1V6eU9jK2QwKzFqZmJMYndHMlhqVUxwWEIvaFZSNGJTSituTlAzdWJD?=
 =?utf-8?B?MUtpVUg0QUJtMTFzS25FVnp6aG8xMTVtZ2FvSjc1NUpWTVZMRnhjbnFQVGhz?=
 =?utf-8?B?SjdFSCsvaXAraUFWWm9vN2FCcG02UEhzcmpBVHI3YmUzR1NsTVBaV25rOXJr?=
 =?utf-8?B?dHZZcGlyUFpmbEZkSFVKaW9XdmxOQ3JzRXJMUUdGM29qb3JGMmtXbE1iZ2Rx?=
 =?utf-8?B?U0JTUHZicUJNMFhieUFwRVh0WWphWndSYnd4d09sSVU3Y1A2ZHdGQlpQWkFn?=
 =?utf-8?B?MVMvL0RURUtWRXc0c0c0ZCt1SDRMTDgxTHZvUm9aUE1TTlJ4Y2tJYWRzbzZQ?=
 =?utf-8?B?ay9HSDdhc2R3T1NqMHZkOUpPdEw1bzhoUkNZNnZRV3g2WWM3cnFtUT09?=
X-Exchange-RoutingPolicyChecked: hQfYhy0XeBmwWUHPAuRiswbcz1o30/xe0Ell2T+V8tYzj+Iyy4VbPKdQMD/FwsOiLyzO7WAj2jBRpMV2E16nC7VFpcOgsQu6aQs970MK57qomwwupI25tzqhB9mEkbdOuvLxP4fkjsnQ79ScUwBXk8ZpqWmoEwlwdSRk3NEE9bNiFZawI4ggKqVuozXZ4+7t6V0BFhLtU6HyNMLMHj/GAp3JkAtgbIg6ZaGF2aMFnRSBQ+vQX9Nus1x8dt0++fp/n2Sy7idIaZpo+IT1O76hXFhRNgFFm0ve1bSWA7a5TisDZVqHQ7e0xjPlcSYmp8yoR9LAvpUITi/Zl8gD5mSZ1w==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f495e8-563a-4377-4e22-08df3b30e191
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:35:24.1047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KqLDbOY5fnnSWVI8z/f/SBF9GKhfqxnqLM8NKUCzVdy10q6UTv9N33RlQU2hkOfmvNrJJPZS0T7NS04nbt9hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB461033
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX2QxgpHkmWG8P
 kwdBlHMXB34qNK5mRTamx4X7u902LylhvyGWAslD/dGTTcqmiD1g1uUZDmCue17TtbNQtFszmRs
 LcMrpwwt/Z5UI/dJuOIqlgL63a9bfwUkpDddAaYMALwYVAZCzJC6
X-Proofpoint-GUID: TXY2qObVY2CeKmURxvG4tdD-0IQ5Aiuk
X-Proofpoint-ORIG-GUID: TXY2qObVY2CeKmURxvG4tdD-0IQ5Aiuk
X-Authority-Analysis: v=2.4 cv=JrVkP84C c=1 sm=1 tr=0 ts=6aec69fe cx=c_pps
 a=uhkaN0mRh0u8fl/99TXUBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=VwQbUJbxAAAA:8 a=c92rfblmAAAA:8 a=gAnH3GRIAAAA:8 a=bUQKSiCPAAAA:8
 a=ApklxjPEy8_8nPV2SxgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvGzcOZaWPEFPQC_NcjD:22 a=-fHZXUhsFbuwFN3fwQAr:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NSBTYWx0ZWRfX4+q4Yjf2LZO0
 syBMgmYpJrqRqHO5hQ+6Wnuut7ySqOzXsPhn3sQGnViRRa42E+lVzXCWKrZmUXbm5DaxZGIwmdg
 Wz/ne9KF1GbBJr32/pHr1G/jMcUVhmTrf8+HHj4UDi3++0gc3abXAXmwioO7TSzW5iwdlDuRpJF
 hPpvX5isilS0rQKc0yqNsEzNjafKr0PtKhl/HJRo6A4poQT6VS6qt2N2MyJl5oIYj1QhZcHEVW4
 n264sB3wgnPC3Qnz/zs9e9gI4LwaHs9kbOegyv5ST278qTlz+cJQcpfgiUefqzmYDkOLcI+0p6x
 YOKSRI8d5d4TOSClj9/vDNjoLRW8t8ifPCQr22DZPeKq5ryQcOQ98JfxOME+jyfre1f1OHKGKPM
 lOxafIw3g4oI2cezlnPdJmCacmIW5ry4byrCxuuZociTdta4AwSp7Er4a2etkZqEWqVdxd6oyA1
 X8Oy9S1afooVLjcaocw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_033533_691659_76AF2EC6 
X-CRM114-Status: GOOD (  24.71  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMDUsIDIwMjYgYXQgMDQ6NDQ6MDFBTSArMDAwMCwgVGFrYWhpcm8uS3V3YW5v
QGluZmluZW9uLmNvbSB3cm90ZToKPiBIaSwKPiAKPiA+IEFkZCBzdXBwb3J0IGZvciB0aGUgSVNT
SSBJUzI1V1gwMUcsIGEgMSBHYml0ICgxMjggTWlCKSBvY3RhbCBOT1IgZmxhc2guCj4gPiBUaGUg
cGFydCBpcyBmdWxseSBkZXNjcmliZWQgYnkgU0ZEUCwgc28gb25seSB0aGUgZmxhc2ggSUQgYW5k
IGEgc21hbGwKPiA+IHBvc3RfYmZwdCBmaXh1cCBhcmUgbmVlZGVkLgo+ID4gCj4gPiBXUklURSBT
VEFUVVMgUkVHSVNURVIgKDAxaCkgdGFrZXMgYSBzaW5nbGUgZGF0YSBieXRlIGFuZCBvbmx5IGFm
ZmVjdHMKPiA+IHN0YXR1cyByZWdpc3RlciBiaXRzIDc6Miwgc28gdGhlIGRlZmF1bHQgMTYtYml0
IFdyaXRlIFN0YXR1cyBhc3N1bXB0aW9uCj4gPiBkb2VzIG5vdCBob2xkLiBDbGVhciB3cml0ZV9z
cjFfYW5kX3NyMiBzbyB0aGF0IHRoZSBzaW5nbGUgYnl0ZSB3cml0ZV9zcjEKPiA+IHBhdGggaXMg
dGFrZW47IHdyaXRlX3NyMSBpcyBhbHJlYWR5IHNldCB0byAwMWggYnkgdGhlIEJGUFQgcGFyc2lu
Zy4KPiA+IAo+ID4gVGhlIGZsYXNoIGFsc28gaGFzIG5vIFN0YXR1cyBSZWdpc3RlciAyLiBDb25m
aWd1cmF0aW9uIHJlZ2lzdGVycyBhcmUgcmVhZAo+ID4gd2l0aCBCNWgvODVoIGFuZCB3cml0dGVu
IHdpdGggQjFoLzgxaCwgYW5kIHRoZSAzNWggUmVhZCBDb25maWd1cmF0aW9uCj4gPiBSZWdpc3Rl
ciBjb21tYW5kIGRvZXMgbm90IGV4aXN0LCBzbyBjbGVhciByZWFkX3NyMiBhcyB3ZWxsLgo+ID4g
Cj4gPiBTb2Z0d2FyZSB3cml0ZSBwcm90ZWN0aW9uIGlzIGRvbmUgdGhyb3VnaCB0aGUgYmxvY2sg
cHJvdGVjdCBiaXRzIGluIHRoZQo+ID4gc3RhdHVzIHJlZ2lzdGVyOiBCUDAtQlAyIGF0IGJpdHMg
NDoyLCBCUDMgYXQgYml0IDYgYW5kIGEgVG9wL0JvdHRvbSBiaXQgYXQKPiA+IGJpdCA1LCB3aGlj
aCBpcyBleGFjdGx5IHdoYXQgU1BJX05PUl9IQVNfTE9DSywgU1BJX05PUl80QklUX0JQLAo+ID4g
U1BJX05PUl9CUDNfU1JfQklUNiBhbmQgU1BJX05PUl9IQVNfVEIgZGVzY3JpYmUsIHNvIHNldCB0
aG9zZSBmbGFncyB0byBnZXQKPiA+IHRoZSBnZW5lcmljIGxvY2tpbmcgc3VwcG9ydC4KPiA+IAo+
ID4gTm90ZSB0aGF0IGdpdmVuIHRoYXQgdGhlIEZsYWcgU3RhdHVzIFJlZ2lzdGVyIChGU1IpIGhh
bmRsaW5nIGlzIHRoZSBzYW1lCj4gPiBhcyBpbiBzb21lIG1pY3JvbiBkZXZpY2VzLCB3ZXJlJ3Jl
IGFkZGluZyB0aGUgaXNzaSBjaGlwIGRpcmVjdGx5IG9uIHRoZQo+ID4gbWljcm9uLXN0IGRyaXZl
ci4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4K
PiAKPiBQbGVhc2UgYWRkIExpbms6IHRhZyBhcyBNaWNoYWVsIG1lbnRpb25lZCBpbiBbMV0uCj4g
Cj4gWy4uLl0KPiAKPiA+IEBAIC02NTUsNiArNjgwLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBz
cGlfbm9yX2ZpeHVwcyBtaWNyb25fc3Rfbm9yX2ZpeHVwcyA9IHsKPiA+IAo+ID4gIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgc3BpX25vcl9maXh1cCBtaWNyb25fZml4dXBzW10gPSB7Cj4gPiAgICAgICAg
IHsgLmZpeHVwcyA9ICZtaWNyb25fc3Rfbm9yX2ZpeHVwcyB9LAo+ID4gKyAgICAgICB7IC5pZCA9
IFNOT1JfSUQoMHg5ZCwgMHg1YiwgMHgxYiksIC5maXh1cHMgPSAmaXMyNXd4MDFnX2ZpeHVwcyB9
LAo+IAo+IFNhc2hpa28ncyBjb21tZW50IFsyXSBsb29rcyB2YWxpZCB0byBtZSBhcyB0aGlzIGNo
aXAgc3VwcG9ydHMgOEQtOEQtOEQuCj4gQ291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vaz8KClRo
YW5rcyBmb3IgdGFraW5nIGEgbG9vayEgV2lsbCBkb3VibGUgY2hlY2ssIHRoYW5rcyEKCi0gTnVu
byBTw6EKCj4gCj4gVGhhbmtzLAo+IFRha2FoaXJvCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LW10ZC9ETEVUUlJWUlVXRVAuMVZVMUVIQVJEM01TSEBrZXJuZWwub3JnLwo+
IFsyXSBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjExMDItbXRkLXNwaS1ub3It
bmV3LWlzc2ktY2hpcC12My0xLWY1ZTM4ZTIwMGZjOCU0MGFuYWxvZy5jb20KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
