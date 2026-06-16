Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FCCCD98E1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jun 2026 12:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLwIV2W023uaTG+SJUL1H8xTceIgPoYte+iGKlY9qJc=; b=Smdw5KZLG/tt3eUpsQPMK4XV+U
	iqYqm8LsRG20ACnG1FAWZ5DFLNxQd9jzF2bbpa2JfpQEGQBD3DkjftsVIT5Nv8a9Zhhh/D55iLAxO
	C8/BJGdXUEmX5/HCRQ2X0hCfMC/DFIiyCPrYRSRvs6LNNzdfpKifVUtlOuRc924YOR6dkq4favxGT
	938/221ijdzsGe4PX4/A7nj+71xJpx3t/vQEK48C0zyP4UIUTP1NUG117T4Xsk3Sz/0I+QezI7hnB
	2GgTGpRLo6aKYkn3+h2Hct5xWErTLoHwsL5jPEneIYCwDCZqAvvBMe8RxcGdCr7P2eppp2vyLsOI3
	bf+rrPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSrs-0000000Fl6c-4Bum;
	Tue, 16 Jun 2026 12:26:13 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSro-0000000Fl6A-2HM5
	for linux-mtd@lists.infradead.org;
	Tue, 16 Jun 2026 12:26:11 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GC1fID1304515;
	Tue, 16 Jun 2026 12:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=yJXhR8RGFN0iJZAkpDh879eKBU1sPoUZFWnBnl9DdPw=; b=
	aPNTGmeG2/fINbnus2IcgjCVb1TJt09EXgSUiy1tAX7V6kkejGSzY9qGOBpt5k3Y
	6NL1i2XfJJ9faHjOb7ecSiV7V78NYzDMLgejyZWx4lc8Rz4iISrbQesAe8wrZq9U
	g+dApyklrSLzNbkhAdyL7u4P+jt86dpqk9+K7yxW9oVSaQoToL5xPAe+q+5aGbL8
	G6k4xcbcqECDc2Zp3TAoTFcT5fM1PWWzQTwF7tjB97iBZTnHsj7Lm1mJmsO3rt84
	RxLyR7ZptpIM0y/yYR4V9QZXAS136TSo2/8MWEg/R+caos6z/dVmkr9c6hjJMTuG
	3cuUDjLcpbHs/AGMSC5arg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1q7mamu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 12:26:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65GCNbkO029266;
	Tue, 16 Jun 2026 12:26:00 GMT
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011018.outbound.protection.outlook.com [40.93.194.18])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4erwnqe38h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 12:26:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wF4hkMa8sjAB/Ou/5GZGAtgsFCBt2arA+5vZcaJu332gLPTp3YhrOZ5VuVzTl1H3PBuLUV59Sw6Dsvspmf8aZFh5KLF5tjZT/3bUnUZOhCUNRN6XbmSjeqCzzsH3R9PO2eZPZyVJi1PsejDuBtLD7WMoCY6tcrP1YoSuToDS/OTsrCZMSR1TAAClZlMKqTrO4ZJSacTXZ7uMYiQD3bKvIFo9b+5YbkElzOQ6XxFnRXedTMhl8M7P03A30j/IcMiSTpT3uJY2Ci9O7RxXk+ZnxNerSicqS44fvA8Gj6uwtRHerkxp1dGYa3uVOKEt+69JsRT1GHC2hEAytcEw9Ijthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yJXhR8RGFN0iJZAkpDh879eKBU1sPoUZFWnBnl9DdPw=;
 b=Xt6FbUvMcGAdlToeu8CU0aMUANCXdVUiwCQ5GG/wzxQt8vs0FJDZmW/2dzVsguukm/nGxe57sZ1h0OS9ZmI+Do3i2U5wjof4vf1nTNpzhpca8pzxlm/AY7xloVelBfZGofkgEhT0bEt4yO+ILL8jiZbil5YXJjv4kphdcxIefnWytlvHDlGQKj0ep/KRhNdnNMxrokIkV4RMJwSz1+qfKUCUmt9rrJI0L8YZtEVfxBL9GGVOBHM/53ZkdHHV1c11sYpZ7cnhWm8JviNAF7ylw1s4qsr7eTAr/l94HMvXnaWsYPHPwx9t8gxG5E0Ak+CDfEjchBFRttHF/s2ddOnoIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yJXhR8RGFN0iJZAkpDh879eKBU1sPoUZFWnBnl9DdPw=;
 b=zligrf2cbt44CMYhMy5h2ka4JmBJIgui8YeDS+uf/TI3ON21OhZYDhNzx1ODXMWwV4CHnho4xC9K4eAZ8w4uXw7wqoWfr036m5YFHWDIoP/1bDnyKGv6yWNI0op70EnmAvz6aiRIxDsUxTJizzEP2n9jKCnv4v2RpTIbOoGWtQQ=
Received: from CH5PR10MB997695.namprd10.prod.outlook.com
 (2603:10b6:610:2ee::6) by DS0PR10MB7089.namprd10.prod.outlook.com
 (2603:10b6:8:142::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 12:25:55 +0000
Received: from CH5PR10MB997695.namprd10.prod.outlook.com
 ([fe80::6458:28b8:6509:8b83]) by CH5PR10MB997695.namprd10.prod.outlook.com
 ([fe80::6458:28b8:6509:8b83%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 12:25:55 +0000
Message-ID: <43037a50-30d8-44b9-a588-1592b244267a@oracle.com>
Date: Tue, 16 Jun 2026 17:55:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
Content-Language: en-US
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
X-ClientProxiedBy: PNYPR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2b7::11) To CH5PR10MB997695.namprd10.prod.outlook.com
 (2603:10b6:610:2ee::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH5PR10MB997695:EE_|DS0PR10MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e08ef0-4bdb-4760-67f7-08decba26975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VLXmQNy5dWJlgU41RyA9hckM/gCx/WVEKmWlPwRve5CGxXDChxqD0S34nUBG0DSrNz63l8GmKipcJSNjC1gQ0REMkaEnDpbpucCyaxbwPyFDNYi0L2TXjyLk3mhPQ8BTCFiMEKC1cD7cRbuilZSECSM8B1R1gJb6dXiBnaNHlj0JJJrjpgeSNoC9y9eyYFEylOwEiZpzANLx3cJj9mrOTRYcGpQu0rGFhNmts2dtgw1v4YvCSvpu/tTE6cYT8efEU8dzsvGHrBWh3LOFUwgh4hpNnGJsTw6IEaMtbEoT7XRDCajynz+eLdDDVo6EVlzMi0wIB2iwkLGYm3R4FU1X2G2RStfmiSdMBM6HDgaoLZd5xEQVoY5kL3p/UoNAlSMQT8ciQ9Nm2Uhv5WM2DStUCD7YdzDY71elP2563R7qurZZ1dt8Gr1HAsTAXunBo6oHw2NJkuqM3Bs/lwusYfqpjY4sUydyXSPQ+NeEoVLGGfj7Z3X4lrcsqAx4HHScPM3eM0iGzf9+qLW8tmTITx/jNb7xE2yHamh+eyv2eTzfwo8KdAfYMJSncn40bii21q7Ue3OsnOMQN7w2RcTGxgBIkgP35eWFORShX1S5QKzjUxW3hLZQt0loC7/PlE/mFITcZL1PZPEtDKht3EZZZton13ZNovVhlX2KNnOlwHvuhcQc5TM/H3JgjOfQkrWHCqCh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH5PR10MB997695.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RklOa3ZMNWFXY1VsejZ6OWtVL0lJeDgxVkg4S3pSNS80dmo2eWlSS0svNGYv?=
 =?utf-8?B?R3FqSldLZlIwNk5OSVc2YmtnUEVZZUxOUlNVUit2UGtWbWJ0MHhpK21JMEFy?=
 =?utf-8?B?NktjVmV4L0hncGdSRm9PNTd4dFRkRUhpdVA3UXFqYTdpdnczdGZ5UjA5SFMy?=
 =?utf-8?B?eEsxUWRsV0hScDF6d1V5RHdyUW9TNjE4VVJJYmNxdnc4cVB0d05CM2lzQ09o?=
 =?utf-8?B?alJDZVpxREI3aUJPaVVaNjdJeERUaUlaZ0U5Qm03RDJiQzJMSkh2ek1tV0w3?=
 =?utf-8?B?ZWdFVXFoblVGMThNWHZqLzlSbG4rcU1EL29PTS81TC95RngrU09PVlc3b1I1?=
 =?utf-8?B?U09Ta3hGckp3eS8yaUFteU81R2gwTlRCdk9udkhBWTVHMW9wRnBPU3ljQ0k2?=
 =?utf-8?B?T2NIMk5NeUlnM2wxY2txdHZJNU1Ya3ovc2ZkSDRzRnBJNzNnaTV2RnNGZEUw?=
 =?utf-8?B?cFRJdlVOZGNqN1diRVhQbWc1WENGNWpFcVhtbWoxbmpENytwV2NTUHBtbEI0?=
 =?utf-8?B?N1N1YSsyWWE3ems3RTIzdnBqMXNrZVVreS9rMGpKUTNyUktDUWNVL3YxTW1G?=
 =?utf-8?B?cmRmRXFrRWZBTjZBaWpqY2NPbVVpb3dieW83YThGcHd0RkRQN0RvMVhvKzlj?=
 =?utf-8?B?c243Smt2YjFZa1VtWTM2b0FXNk1kM2gvN0gvajdJaWtJcFRUTFFYY3VkaTQ0?=
 =?utf-8?B?TlU4ckN1UmlRYWpqbm91V0tjY21rSmxlOFpITUpCN1JBT1ZRTnd6U0FJMDla?=
 =?utf-8?B?MUwxTWJOY3hZVXRDc2tCbDBjMEpweWZIUDZxVjZJMjV1aEJEZVowNERubHR0?=
 =?utf-8?B?NnNhUzFHc2M2S3VzRjZLdldjZHZyUVpXNy9VcldSbFV2bEd1T1pPbXZIQ0g2?=
 =?utf-8?B?WEpYWHFFNWd6VW9EeGU5ZW5hTWdUREFwMmh6bXVpVjBuVlhZSUVlYmExalpY?=
 =?utf-8?B?TVdKWnR1bnhxdEVYSUpBZVVJR1VyZUdaU2k5MUJpRlFjdFlGdWhKRkI0Zjd4?=
 =?utf-8?B?WEVQeFo4T0NhMngvcVhpTHpycWViSksxS2xmamxKak9uZk0wdjRPV2FaK0dD?=
 =?utf-8?B?MUJMbHpNYjNiZVgwN0t0VjdBZGZhTnNyOHo3Y241cWM2RmhZTXNXTHBOUGYx?=
 =?utf-8?B?ZDA4bnlpUUNIdmltK3J6SHdVVGJERTFwemJ4QWRlWGlpRURINVNrN0lvN1RS?=
 =?utf-8?B?WVB2SEJWWkJ4NjhISkhUemJTNlRGUWc4elU5RjJGcXh1WWVpcnhIczFVdDZ2?=
 =?utf-8?B?WEpWSmo2U3RTM2M5VmZkemNPd01OKzdLMnlMeWZxN3ZVUDYxSGEvSDhveERU?=
 =?utf-8?B?Ti9qVzhMUVRUcEZkTC9QS0FTalREQ08zYlc1dWIxSHRxRktkOXQvKzEyd3BG?=
 =?utf-8?B?aGdYejRBNlU1dHczU0VYdTFaR1RjL1VwWlIzVTcwd3BYTitLclA4OUZBNnhK?=
 =?utf-8?B?UXZTQWNra2c3cWFadnpZN0lGMlFWTFVKa085T1ZuVWpiYmRNVVhUaEtqbUdL?=
 =?utf-8?B?ckI2eVNlUmpRWE43S1pCWDFIM3k1eVhDLy9wWUpKVlljWnVYc2xSZjhzMWdH?=
 =?utf-8?B?bTJ1ZDlCWHZBeHFRRm1kSDhFbHJSeTV6TjBrNEpSWXZ0ZWljRVNuaDcycUh0?=
 =?utf-8?B?Slh2MHl6YzNzS0R6b2NaWldaMHY5U1o3K1VzWmd4b0dtTXNsY01idmRObWo2?=
 =?utf-8?B?WXV6ZXpCNFhXenJRcUtneGI3R3Y3M2VlQzdNWms4Ti9rMCtaelI1ZUduTlhI?=
 =?utf-8?B?S2NzNzQyT1RBYzF1MkpIbnRDUzFlSmZGTWU3dzBHWHRjamRFOUZrQ0dqeUNR?=
 =?utf-8?B?Y3FQN1ZvZmVXYzJmSEUrTjRmK0JISGYzK2cwU3pVSG1ON2pnaktTWmxKVkFR?=
 =?utf-8?B?c09CTkZiT1c1MERGQk83M1NYR1FJeUlzMGdkTVBaMkliM0lBbUpJOFBGZThw?=
 =?utf-8?B?WEFQZHR6eEJNMXBhNkFJeE1TK3FXK0tjVUFvZktHUWIwMC80RDNhZWR6N2l2?=
 =?utf-8?B?cXhOSExNMHpJYVRNRkhzZWc0aFFCS3RoVHhSNlVMa2xGbDVTNTI4SklJV3Zn?=
 =?utf-8?B?aFJVQnFxNE5OdXl6eDBjVFlmaHVRbVlEYytFWjlZRXEvV0RNNTVoTlFvdi9u?=
 =?utf-8?B?M1dtT3UwNTN2MDNEcFh3UERhMDFlaVdxdWNKL0NnNGtZa2Y0UjhqcXN6OVBG?=
 =?utf-8?B?NThPRXRkTXlMWDVvZURiUXcrbTRiMEU0L1JWMW5CWnQxbnBBWUFkeFhadWxi?=
 =?utf-8?B?dFZ1VER2OEZHbGIzTGpla21TV2xlVkNVTWtpNXpoRFZSZnBVTVpWdEh4RHhl?=
 =?utf-8?B?OXlTRlEzUXJzNVF5NEpKL1dUNFJDcm1vVVJaUFhhY05TejFmZXR2eUtBYytM?=
 =?utf-8?Q?cPDpKGiiPB5xu6waoCVRVtPyKrxz6QrJrWzeK?=
X-Exchange-RoutingPolicyChecked: kBGCL7clyRZ+hNbYGcxMgbmDAm4fyLOoB6zg46bMk7HK/VPVp3DxBhUcnEP2Q6utnJ5ORQM/L0W+ojWL6NKH7GzvduTwPJc4+jQPa1u//92nOyau0B+sx2aUKNNM+tyGO9NcgldOCRwu+PZaNB+i1ER9rkNEXkSjV1GHl8kZRaxhwzPT79PnnRTxZMHVZVEZePO9AvKEcHnrO3h7wf4JcuwOQcEtiXzjZ8e/3QlbQubFETbgYcSULv5hwf45gqEpF7xmI+FPlHK2IHJgOoJRcaOiQmJJCwWGnKlOtKRN0h+xGgwQOhZOt2UQt1n4cr10IJv2Kts7dS1ZJOyi5T+t/g==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: W9eSOZ1jzkHYnVthL2l9CrBm7Zn92E8o+Qi0YKWqI5QqZ/UGlk45XqnmfjzdHBZ9UOWbkbFUD/b+gIM7PINJnfZ1nmMEVDtnoQFw81Bi3086WFUsMNMmNkscCeLDrTNEX6df02jBtiQskjtUGnCy6cQ6SWFfx7d+CLfBs033pLmOLKAm0x8t6kB+kaNhDxGBIbNdrMrZvoBqvLW0biSQKfXxlqwUVZeT4cd6EBhmb+hdhQwkq89f1B7UIRXET72Zq3qlsOAbpNb8+40VamzpjzJcH+3VHIUqlM5xGx2L3UI8fdkmb1Tsp5qxQ1EEgiW/vcqM2spx/8VvmZBm/cBzCWG3QadqZvpe8S12mZz0rbr+8g1p4xR7x6y4UAIQxzc5ui1aAfHLzsIOeDy5iJbIBSxcgi6S0sOvHZ7WBvfiGLCnMR5hhzs0+dOr6SdktjsPlvhjsQ42VoU/cx4uOS6ADqdh6zZiQIcOh5fbw8p1v608A4S3/fkFFSiOY5fmUpqgenMeZWJd8Nd6rgZbA8MNWUzfJ9OuWxf0l4JB31Cku43TLch8BsoVjt59ZxMWIy5uHiXOjD93x0frSzUnlpTGPv4BAUsUtF3U9JMrxqAl134=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e08ef0-4bdb-4760-67f7-08decba26975
X-MS-Exchange-CrossTenant-AuthSource: CH5PR10MB997695.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 12:25:55.0743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2L4tBlCHAmXdmRml+Uk03leGWvx1f+fc2nV1s/lzWBkyyj4snBGsCUSt9qrYQZ+iqy0qxauPJ3cyBjRyeyGilgH46FraNYkewhrCwPN1iDYJU8v7O3BpSerkdoIj2MOA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7089
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2606040000 definitions=main-2606160126
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX+ttc93ZkNM/z
 oDBxEmi7SMrKL2of9CCVwP+9/QDQ9LiRHWui6iTcFDPXb08oHEoACJblMT95ndtNjFrdYHN4RlK
 CgnkVzlNGZwJ0+tbccXIzoLbhQFaiIhHj6HV8FQDMcRkxQBmPhOV
X-Authority-Analysis: v=2.4 cv=e+A2j6p/ c=1 sm=1 tr=0 ts=6a3140da b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=yPCof4ZbAAAA:8
 a=GOeYOXb7dexyrdvMlJ0A:9 a=QEXdDO2ut3YA:10 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12313
X-Proofpoint-ORIG-GUID: WcR6DCPYQlxcYdLjDTfF_k5HGRcRzOD2
X-Proofpoint-GUID: WcR6DCPYQlxcYdLjDTfF_k5HGRcRzOD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEyNyBTYWx0ZWRfX79M8ipr+DbXY
 e726cWu/yqY1APqCV3OdkvArWLeRF55PsI7ApTMfN8GOcDUM5iBYkeeOAbxYIknM2jRhEeM1PJF
 NrfPFFiWQWJ5OTMgWAdpDM4yRcBAz59Rw6hQZo4pTzM+RHN66bGwjkJDZjJpsKMMRhALXanBbq4
 zotkC5GJjd0Sf+7o8/zHkz8ADuxgXt5RiIUGhwEEDSkR9hRGus9J2vaQoI3Ouy8Vj1rdwTwJmEq
 UVc9OS7TNAMdgXzzz1ww78h182e1T7ESXWg6a8teuRJDSkcBYLF6U/5tSmc/xviipBoOkScySVq
 JIegkQ2eUMyNU+rafasLzT/ARFEMnDrYKTHcYPMtm/4SkGr7ICNY01bKtOPhypZEKfclRcr5/Ne
 EIqitfcUSLn7QOi6U7uR5OWGU1JYEkW5xy3/WjPUT5NeTxOe971r2lrDcE8LYjcO4Vz9Co0gNB1
 B5GybO8lF8v16pJkbw1WZj9a7CR+5i6en+brChlU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_052608_868039_61D8D14D 
X-CRM114-Status: GOOD (  18.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi all,

Luca: thanks for the review.

On 14/06/26 13:40, Harshit Mogalapalli wrote:
> mtd_concat_destroy() frees item->concat so calling
> mtd_virt_concat_put_mtd_devices(item->concat) leads to a use after free.
> 
> Fix this by moving mtd_virt_concat_put_mtd_devices() before
> mtd_concat_destroy()
> 
> Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is static analysis finding by Smatch, only compile tested.
> ---
>   drivers/mtd/mtd_virt_concat.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
> index 37075ead0f33..a3fb96788e9d 100644
> --- a/drivers/mtd/mtd_virt_concat.c
> +++ b/drivers/mtd/mtd_virt_concat.c
> @@ -75,8 +75,8 @@ void mtd_virt_concat_destroy_joins(void)
>   		if (item->concat) {
>   			mtd_device_unregister(mtd);
>   			kfree(mtd->name);

This diff in this patch is correct, but smatch does report any UAF in 
above few lines which really can't be fixed easily and needs more 
careful review.

drivers/mtd/mtd_virt_concat.c:77 mtd_virt_concat_destroy_joins() error: 
dereferencing freed memory 'mtd' (line 76)

So mtd_device_unregister(mtd) also frees mtd, which I think is incorrect.

-> mtd_device_unregister
--> mtd_virt_concat_destroy
---> this have:

out:
         mutex_lock(&master->master.partitions_lock);
         list_del(&child->part.node);
         mutex_unlock(&master->master.partitions_lock);
         kfree(mtd->name);
         kfree(mtd);

mtd_device_unregister(mtd) calls mtd_virt_concat_destroy(mtd), whose 
error path does kfree(mtd->name); kfree(mtd);, so the later dereference 
in mtd_virt_concat_destroy_joins() is a use after free.


Thoughts ?


Thanks,
harshit


> -			mtd_concat_destroy(mtd);
>   			mtd_virt_concat_put_mtd_devices(item->concat);
> +			mtd_concat_destroy(mtd);
>   		}
>   	}
>   }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
