Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06348D1038C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Nov 2025 08:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E1GHLXPPp8V3wIgkonf6vT15t0FwbLFF6xn7GSjVkzo=; b=2HqYZ0StYWNnSJ
	S2/vXTbISgxqX3Cu76SyK696/PAsG1cEoZauZ3z/eSjjunpIE+R2M0vrag8u1vK+pPCzd+kvmBVmt
	UoOLKZ8edDnUCfk9YHgn86a/EfRxHzjqQ07xPV3MqSREBShKEiHeldm3Z/colje1UTAErHhOyIpgU
	3agdEovdQiKmU6Wd+kpF04wDQglYM/yqv3gsadwuTPRYg2FJMOHJmITE4CJZLumKGvD0rPoZ0m24q
	CDahCkqGZUemrb5v/82gM6mpcq/mavc6V2ZD1DhQ7+g3KdlAxyZ/A+gAPYAHHlWWy1YEFsKrFFaEe
	tU8ybiaL++yo6RQsEw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAY3-0000000EZUB-0CXu;
	Wed, 26 Nov 2025 08:06:47 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAY1-0000000EZTC-21ni
	for linux-mtd@lists.infradead.org;
	Wed, 26 Nov 2025 08:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/tWAi7wsw+EG+xMYTJE6DVgFbaYRl2LPNtdy9wBXyiTunjb926C4tNn4E+JLQ7wgWeSZOxSMRf/EENbC4jPOUJpZe5xv5jp7yn5OwdPijZm3VTGDysQjvt1iFQW55RnkP+g1GZQBBE2axba7j6p/qTbz+SEutOQ3/7LZJ98/JDzBVrX/zRaJ9YcupUALRsoM0W6gkZ4VOt6xBZOHbQ8qDKQWc3Nzt8h+N7FTl9o34/urp8X+lH86f7WP9rrZ8i8tVHGOhp89l9pjWcTSdBLUMlW7Uv1QYdCPs1kiGUOtqf7RScpW+50rRaRtcqC9mnakkZzbGQFRFD20o5gqqBp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VMyCaqpn2MpaQ9eIZRS0DFyyYlPsGPct2M3233v9jU=;
 b=LHehSxPQ7++tmGL/jx+ywKJ45sbD7C+KX4lVkC5KRm8goWLo/tayLcPoeAaemumKJlPl+TVWPPhhEZhVAbnzKByaHVDW26RjtPSCLrKV18/BYdVZRruKzn8Wfk5NiVrcJ4rK1MItoPEvNA1dcc6f6tyZqv5XMNYBpD1s1cjDp3GSCTpWGuVG5OFTIxSjnDPqLW6r9/tJoBhcplrpoBTWbZ6TBZbWUp5n07PlgdLWZnemtURzb9pp1UZyzJJWCB2RulrANgd8YDHZ5uCIeXN/M2qsljmbMk9TbmpwFraLVGVr4sMs/kiZt6rWd9KpgxED5AcUL2kk0FDdb9aqvwCpug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VMyCaqpn2MpaQ9eIZRS0DFyyYlPsGPct2M3233v9jU=;
 b=U3bYBoY5oVafLLOfZDeShFP6D78woG3xzrpTVkDOtB9vFZX8nlc/+48GgaAKe8ZD5P6aMeryRO1m4YG9RlPm0l3trICYCdxyKCqOA0cljuf+4Do0HEP5CwKVvR1uISJzA8DlTkQIE4R39unq6K+UIXcERZ7a2rZOe3N94lys3aOrCDRsw+7qa+cxPzlTxwlGAc/WYRDuPc6zSF0S6n+x6+rHcsKSZGAZFP0hxz3YekjcbwIGg9ntrRfs34er7DWayegW+bkkVlENXcpf07ljzjPlHcly9lEOPYQkgQFnrfX7A7PJFzP6NcJkmunPRSveub4l8okxPwGhEa+ZiFpgDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from MN2PR03MB4927.namprd03.prod.outlook.com (2603:10b6:208:1a8::8)
 by SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Wed, 26 Nov
 2025 08:06:39 +0000
Received: from MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419]) by MN2PR03MB4927.namprd03.prod.outlook.com
 ([fe80::bfcb:80f5:254c:c419%5]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 08:06:39 +0000
From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Niravkumar L Rabara <niravkumar.l.rabara@intel.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH 1/3] dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
Date: Wed, 26 Nov 2025 16:06:22 +0800
Message-ID: <af528a83b4749fb3e6062bbc75bcb4fd5a6fec23.1764143105.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1764143105.git.khairul.anuar.romli@altera.com>
References: <cover.1764143105.git.khairul.anuar.romli@altera.com>
X-ClientProxiedBy: SJ0PR05CA0202.namprd05.prod.outlook.com
 (2603:10b6:a03:330::27) To MN2PR03MB4927.namprd03.prod.outlook.com
 (2603:10b6:208:1a8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR03MB4927:EE_|SJ0PR03MB6581:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3d3a02-6928-4539-64e0-08de2cc2ba10
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THlBNmw3ZGRLdjZ5azV6WDBQV3RhaUxTRStVUVpTNCsrTk9uNkh2bkF1ZVlQ?=
 =?utf-8?B?VUZVZHpwUWFTaU92MytxaFZtaEh6VE5NM2R5K1I5NUZoTGhJVVYyc1JrVlIy?=
 =?utf-8?B?ck5YbkV4VTRRTUZCcEFzWjRmdTVuLzc5WGt6dm1ENktlanJPS1pLVm9mdyto?=
 =?utf-8?B?aVJOSTFFRmVmcVBRKzhUWGczQXZtR2txcCtPVDRoL2IxWmMzMTA5bUoyWGI3?=
 =?utf-8?B?YmVaUUw0dThwczIrWVRIL0xWMzBmL0xLVEFFR0p1dFlNWnpKR2NKQWlWSVY4?=
 =?utf-8?B?WTV1MnArQ3lhckg1a1FodjF4a1R0UER6Y204UkJtNFdyOUtjLzR3QmhVdU10?=
 =?utf-8?B?VWM0TG1JVHduSnJEaEhPZTJxWWdjWll1d3AzTmpUZmtUekpwRjBHNTBWRDNW?=
 =?utf-8?B?SUI5bVFJdTQ5ZWhNSUV3RTBuY3d0aGlzVTRVdnRCMWJ1SmUxTGlqaGUvZkl1?=
 =?utf-8?B?OENIeWx0aXJRU2pPSDFOaWoxaWhxd1FpajFieVNWaytPM0wzSlZnbTRBRExu?=
 =?utf-8?B?aElOem9tbVJINFZPN1QwY0M0WWFzNFg2TzVlWXVoU1BhcU9ubGJMUDMvWE1D?=
 =?utf-8?B?QTRVRzVkdVB6NEtwME8wYjBvYVZiMkFld0gycmcvT2I1NndvSUlxOW9JeWNO?=
 =?utf-8?B?MzRDUmtWMnFWNjR1KzJ4cEU5WWpCNWZvTFIvc1NqZFcxUFRpUHNOOTJpQXQz?=
 =?utf-8?B?bXo5VTNmdEtCOHpBOEFKbmtWSE84YWZvSmhEWmNhOElydThtczlhUmtGamx2?=
 =?utf-8?B?cGk5bTI4NXQvSGRsZnVSZWtjdXgwR3p6enlYWUsra0dSQytJOStUSnMvZFpK?=
 =?utf-8?B?NEw2K0lUcUtnMlpGaW5md25HL2haZm1mQ0ZkakNRSVAvQmk1OTFUZEpqbVlC?=
 =?utf-8?B?RzMzdzdDYUJxbngvMW9CdndVVG1qd3Z0R0tFaVQ1Qk1TWCtGRE1kVkFMcDhZ?=
 =?utf-8?B?QVJRQmltQjhvZWFFTXROR1FlTHpsTmttY21UNlhHQ1JyZ3dqS3owSG5JenN1?=
 =?utf-8?B?bkhyYU5iTFcrWFlMRngzL2lXKzBHUUNGaHBaa212dUowUGE3bjJPK3RTS3FO?=
 =?utf-8?B?c25TTVZXQUF0NysyaEphL2xvNWZxaTh4ODVLQVBpVm1ENkE3RUY2aDU3ajlO?=
 =?utf-8?B?dDIrWWhYcUwyUzhkQ2FtL0VLcXFIUE1Qc2d1R0pmVDJwTUhtUFlBTFlCcTd4?=
 =?utf-8?B?aWRMWEhxTk9JeXgyc2RhdnZ6RWZjcitieFNPTE0rTTFoTk1oTFQvSldFbVZ5?=
 =?utf-8?B?TFBsUUZZekt5QjZwM3NiblJnSHRTYnVIRTRXQ0dYTnVMc0wwdjhobHhEZ3J5?=
 =?utf-8?B?cnc1bmFhN0NrU0RFQnRlTmhJQ2t5d2JGNVJvQjR6N09GUXhRMHZaV2t0TVcy?=
 =?utf-8?B?dGQ1L1lTVy9YVW5BeVVOUTZQbUpUUWozOE1ZeWdxWGY4cllIakcrR3YyZ3ZI?=
 =?utf-8?B?SVA4YzZhdklUWDA3bW4vMWVnanZRaTdvSjJReFBuZjFQUjhzUndmWUZRTXRS?=
 =?utf-8?B?ZTJMNG9EVHY0ZDVGY1N2S2ZCUDdqTElWU29HbUdPSEJrVTkzcFhndklIS1Nx?=
 =?utf-8?B?U0ljVE8vbmpETDlxZUYxMnFHRUs1QXMvWC9vaEtxNm4wc0dYdHVjc3lOdm9B?=
 =?utf-8?B?UGtmRGR5T0oxQmFlYkYxT3hQK2ZTeHFqOS9rM0JSb09QdS9XY3YwTHhjb043?=
 =?utf-8?B?TWc3a0VMbzErMkU1bXFZWFlZT1VBNVR4Q21jRUdKYmNSSnpyb3JYRllHVnZN?=
 =?utf-8?B?Z2kwR00zUy9ZUUZnVXZtZ2pKMFo4L2dJN0loRFRJV1JKZTl5cjlZOVhHNDln?=
 =?utf-8?B?bFduV3YyeW9lVDFCL3JUVUlMZ0xCMU9tMFh3WDdNRzNqSEpuVjNjM1JzaWhq?=
 =?utf-8?B?eWFDd0hWL2psa2p4T3JWSmcvRytBNlI5bEdFMEcvM0gyUGp2SUtxWE5lLzlO?=
 =?utf-8?B?Zmd2WS9KZWRsWE1qaEZVZ0FlblBFcVdROGJsQnJreW9ZSGxlK1hhNCtKS2dv?=
 =?utf-8?Q?SkKK8sAtFNjU1Hu+xcNHB1a16JMYMo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR03MB4927.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnU2ZUVnWUsrMnFBYm5EVG9DQ2xLMFRWUVV2T1I3Q2hDakdpQldxMnZENkQx?=
 =?utf-8?B?c1BMeExyZ3I4SDBWcE05MmgweExkU254elhaaVJCUjRuaXU1SExtRjYwaWtQ?=
 =?utf-8?B?Q01NRnB4MWl3OG5YekZBTVBKSDVhTjZPRnppRmc5czNQd1JqOURBbFFpZ25O?=
 =?utf-8?B?dWk0TlRmSGtkSjhRRmNxZDBFVWk3dkhHeUxrNUtPSFBCM1FvYjJvc1ZUUmd1?=
 =?utf-8?B?UXI0M00zSnBtTWkvREVXU21uUjEzd3RSbXZyS000Zzc0amxEWDRodHU1NS9J?=
 =?utf-8?B?cGRxUWszL0tRSUJXRktubldaL0wzZXRyZnlkK1JXYVl3NEJLZTFITWE3blRo?=
 =?utf-8?B?QXJGV0VRUkh1T2d4TjFZczZmd0lOVURzckJ4U0ZPQW1QZDcrRHQxdEhLelI5?=
 =?utf-8?B?NWptUEVPdFAyMHF3dmI0WGdQZmsxNFpwdFNCQ3IrSWFpakQyaXZUOEtHMVkx?=
 =?utf-8?B?YXdzREZ2ZEI1eXFUWDR4a2RLdFdCZm1zU2hXZXFBZUZYdHpuRmV3SjdPMFJm?=
 =?utf-8?B?dUpKQjd4RVhuei9QOTdBU29nMG44S2xhSndCeDlkdE9qckhnaDloZ3FpVzZS?=
 =?utf-8?B?dDNCVURLRjJMSk1XdkxrcHRNWjhOT3pYVktqcFZWb3luU2haL3RLM3c2ZWRY?=
 =?utf-8?B?aStvVzd2VnpDNlpOOWdpdVFoQ0JxYXk3VC9QRStkYWJkck1oYWlsa3lqa0Jp?=
 =?utf-8?B?VFlCamltQzRESzhmZ0RrM3dwellwWmJoN0RHdmVxOXByZThpOGhTRTNZZFg1?=
 =?utf-8?B?VnN2ejJ5STEzbUg2d05oYzNhTXZYbmdDZlRXTW5vTVh3VFVoUy9QK3dyMFBL?=
 =?utf-8?B?NnFzbzFsa3FKQVROcWZJN1RtSTExTXl5OWhHcmZZZGRlSUtNQ3NTYjU4UGRD?=
 =?utf-8?B?emY0U1FCMWZXZ3BVN25RRy9id293VCtWTlJ0NEhWWWRxK2dHdEhDRCtVRG45?=
 =?utf-8?B?dG5ySktjaEtwUnVXS25xTFR0Qlh3SzJqZnVUNzByNkpCZkJCYVZQSlh1TGY5?=
 =?utf-8?B?ZWc3YWN4U0R4NGJ3aHc0WU15cFVqRlJnV2hOczRtZkpNR0VGeDd3dTlqanJJ?=
 =?utf-8?B?UjRvOHgvUHpYeHgvVG1UVm5hQ3RMaTE5N1hCcC91a2swNXhKRnFrdkJWZm43?=
 =?utf-8?B?TFI0UmdXVVo4WlNjT21INTVIWE1jTFpkWGVCVERWVkl6YStmdmFMRk5XbWpU?=
 =?utf-8?B?T3FFUC95ZzFwUENYNnFVR1hCMy83U3B6YmgyMnJhN0ZMSWhMNWd5T3M3SzM3?=
 =?utf-8?B?dkY2N1FHRFQ4NFFmL0hRSXBDTDdRV0hwNGR3aTIyeWRMSFpBclE4cWRLL0Fw?=
 =?utf-8?B?UldXa3dENTRYSEJlYk9DUStOL2ZTd2kvKzgvU0xsYko5dUFBcldmU0FPTElB?=
 =?utf-8?B?eCtEbjdUc1hOQTdJbTBDWVNldmlqbnFDbXVyQ29tZC9vc2tncUdFWElhNVhl?=
 =?utf-8?B?clRCSG5SWTRobzkzUkhuNUZNTjJqNmZsamtsb0N4MWIvdVVPbTBFbTVzSmR5?=
 =?utf-8?B?YTR5aGtpN0NpU09RbzcrN0tUR0g3bWxUN0JobzgrU21pelN6QWxadncvSjRP?=
 =?utf-8?B?NXhhZVkrOE9NdFRhdHBGZ2QyeW44Nyt1bWpCS3A0Mm1pMVpIN0xsQkduTUtU?=
 =?utf-8?B?L1pPMUgrczVOYytpdHFJUDBsbm0wdDI4VUliSTlpRUovaTRtLzRrMUwxaU0v?=
 =?utf-8?B?SEZwNENabVZXT2xzNzNSVGZJa0NvNGxaQVlTNG5QQjJqVno4em9oRjYwM3pS?=
 =?utf-8?B?TXNpVHluMGtUNGRucnJ5Z3VpQjdUM1Z6czVjeGE1R1Zra25tTkcrTU5zN1Z4?=
 =?utf-8?B?dkNURWJFR0RjOEhEdjRSeEF2YkxyNmtocU1SM2JaWitHR1M3MEtnL0x3L2s5?=
 =?utf-8?B?RjN6MkhKZmxxOHFyTHVrYU5oVjNLbzBZMittcDhNTGhwRW0wa2lPeXhXT1dM?=
 =?utf-8?B?Rk0vYUQ3b0pocXQrVE5rVnRVbUx5d25tekhBcTMyOSt0OGRPMUswc2FkNXhn?=
 =?utf-8?B?SjBodklMSTZQS2lqdVZocEYwYTVCM0dLN25BNnp6OHB1cVI5Z2t5aG53QTN2?=
 =?utf-8?B?ZzdYNTBzdzFoSGVqY3BwQjBUa1BPRHoySVY3TW5iV3RLUzEyWFVUOGN6bEwy?=
 =?utf-8?B?Vmd5eldpcm9wRGl5OE1PbTVyMG0wYmxWdEN4UHdGekhqYWpWd0RIVzFSWnNE?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3d3a02-6928-4539-64e0-08de2cc2ba10
X-MS-Exchange-CrossTenant-AuthSource: MN2PR03MB4927.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:06:39.2614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zF+zMxn71V5bVlc4zYHNcJLmEvd03CZiMWlabkStruQM5dbq1C8oLABO8pe/y3fRb3r5vbVe1D0+q1U2/Z2v/mjVIhLGrByftxhScj7yZ1U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_000645_525413_9146CD37 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

VGhlIENhZGVuY2UgSFAgTkFORCBGbGFzaCBDb250cm9sbGVyIG9uIEFnaWxleDUgZGV2aWNlIHBl
cmZvcm1zIERNQQp0cmFuc2FjdGlvbnMgdGhyb3VnaCBhIGNvaGVyZW50IGludGVyY29ubmVjdC4g
ZG1hLWNvaGVyZW50IHByb3BlcnR5CnByZXNlbnRzIGluIGRldmljZSB0cmVlIHdpbGwgYWxsb3cg
dGhlIGtlcm5lbOKAmXMgRE1BIHN1YnN5c3RlbQpjb250cm9sbGVy4oCZcyB0byBwZXJmb3JtcyBE
TUEgdHJhbnNhY3Rpb24gaW4gZG1hIGNvaGVyZW50IG1vZGUuCgpTaWduZWQtb2ZmLWJ5OiBLaGFp
cnVsIEFudWFyIFJvbWxpIDxraGFpcnVsLmFudWFyLnJvbWxpQGFsdGVyYS5jb20+Ci0tLQogRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9jZG5zLGhwLW5mYy55YW1sIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY2RucyxocC1uZmMueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvY2RucyxocC1uZmMueWFtbAppbmRleCA3M2Rj
NjljZWU0ZDguLjM2NzI1N2EyMjdiMSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL210ZC9jZG5zLGhwLW5mYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tdGQvY2RucyxocC1uZmMueWFtbApAQCAtNDAsNiArNDAsOCBAQCBw
cm9wZXJ0aWVzOgogICBkbWFzOgogICAgIG1heEl0ZW1zOiAxCiAKKyAgZG1hLWNvaGVyZW50OiB0
cnVlCisKICAgaW9tbXVzOgogICAgIG1heEl0ZW1zOiAxCiAKLS0gCjIuNDMuNwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
