Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C89C88E73
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 20:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJNdcSIikiybJNXvVltfjeyneoZk4BTqWRlHNHUS1/M=; b=KBLR5HpUht+emRHEblZFfOejMZ
	eC8K/J2s9pwlanwKD7tZtklGaHHspQMmSBnCrVcvvEbazWWzU0vQ+1x+p2J8iWfsFkUQjwPJD0/Ox
	u+ZwoPQTFv2N5c1toMc8QikstStw865cHhqC98BHOcdUHlGehUajsAX6qLt53T3w3tXTFkx6R2m9j
	1lJOf26FdzJRcSfLDM6+NJmIUV1Fs/WQ4PQpbDahly90rrsKrE732o9A1sDMNMU+vWE0Wzuq8b9qN
	SQc61p/tj9f1yEplMygj/hOaCiqu8IdGL5GlmHw6UWHlrcRtX/hdlZ21cIwnWmDBYD7FF60dRus/X
	k89C1bbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DPq-00000004cHA-3Df6;
	Mon, 14 Sep 2026 20:36:38 +0000
Received: from mail-southcentralusazon11011029.outbound.protection.outlook.com ([40.93.194.29] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DPo-00000004cGj-291V
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 20:36:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMwdMrpjbJuiBcKVlx+Bsys1nwAI1qweMdFcJRp5n8GbDlOyx+Ti4e6DtHXchus4rqMMitgz2ZR5zqjdgklSqa8B6eFM4PxZCSlb06lw5fdPW2r1ucC8qxDh2tQEV5SbGx8+CqEKeeW/hRei99S9s0aiPW/Zfy+4f0bMr8hVgdwu3symdkHE0qCPXlvc0BN8bjtaICOvd7Ap4rUZewkPXux6kuOeP/VS8B5va9TpP8yESdgq/mS2GjhNEKEp69dwGVXL9f+jRjV+3xeu1t39gDV5cFEUnX6VoxaT8WpSxzlFfTfvDvvcv1h2nupHLZL9HUyP3vy8ZWuBg/LMg2XLCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pF0h36P3eA+6i8fJhn6I2X0u0OSpBjTvDJ1vLEwOvc=;
 b=eHSzT2Qe53ujz5oeHeoUsLCoVFKKL8Q+GOJzYoPUt2fPiXUndp2gq7VfbOn1pq12p4OLz0WSvFL7X12wd6ieqReV0KOX7hhJcvrwOMn4VZ0hcC1Mot1xhaJQ/G/0MOLoECVtJ1XeodHBLm/K+FNEwlJ/aMKYyB53EtP91B6WlkKliyBYmwporWcU7csPmt9imyxqSBUx3UyvPYPTEnbPrpggK9IAf1HEvZsugyc1X8TAbmcyVwMJfCfFgshs0piPVNTF+oExvcs1+mnjyTnU+Z0wR55vjtN4V0egL6bDHFk9IRzAVnLUFSN1MTK4VIEU7NvrUWPhuEpTS+cnLGOD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pF0h36P3eA+6i8fJhn6I2X0u0OSpBjTvDJ1vLEwOvc=;
 b=uiHReE1yfXHf9UtOByTLbDgufwue7S2+KS+jeB9No40OnHmvtwHVKlMXCAaai67k1pa4nqZYM8SR6wRzl9a+faxzEqOkD5NAdRNf0mzeYP5tgzTO4nFNfZry2tl25Zg6Xst25HsMpsrPSWkw52o2fI4ehqzIHJiUBAkniEY+5wUvsxWVJgZ7h4FYZs368j52DNPt/pwIGY8KuSoTtDUregYchXlphnZ1Hz6T4G80BddA6z2Iq0OsdPNNz5LrDgq7onR2eS5vtFJF7o9I98GuFYQk90C6GA5mJcqQdPvbhCvfl/npy7y3JtStcEfrh5ynedTcqHut0SWMMp5zI4sFpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by DS6PR12MB186998.namprd12.prod.outlook.com (2603:10b6:8:52a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 20:36:29 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 20:36:29 +0000
Message-ID: <9fd915af-59c2-44c0-89ab-2d611e81fb30@nvidia.com>
Date: Mon, 14 Sep 2026 21:36:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260911-perso-fix-spi-nor-qe-mxic-v4-1-5da8a25b9579@bootlin.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260911-perso-fix-spi-nor-qe-mxic-v4-1-5da8a25b9579@bootlin.com>
X-ClientProxiedBy: FR2P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::18) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|DS6PR12MB186998:EE_
X-MS-Office365-Filtering-Correlation-Id: 5098cee8-0e42-434b-97cb-08df129fdabe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|7416014|376014|23010399003|1800799024|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wyvT8rhQ/Mxh+OGQ552mKjgkXGnyJt7wqaog/VACsKMs7IszCkqA8LB+xHqVTdg6HMb0hvRwlLQ4gxUp+9tKoDfHBeHaOiwp5TA/3Njipmq8IuG9WHzg3EBKHwzZBD9dXfvugbWap+gDiFkXHOjsa+taZyHdUm6ecYHTksxL3LmsCNtwFJVVvq2GxfwXUG0v6NRO07Dh6yqn9Pl1KHiOK3j21ACM+udQEK8QcP82f2zf8NI2PYvdNlhQCS2JQPnQnsgs1GQE7nCD4I9IizUyiLeuNgTpb5ozCEjrSiz7oj7kEIKaBge2FQc6YAo/FzdFeadafnyzGOHF5Okp33vbz8VgZ9LBwbHQXoj7nl/AaVdJ5yP/ioAgZiINtc4wLdsbpH6/ZEGd+e/FRVmW/h0FPrhB8WMAJi6EYHMYil9fUWMxk0vdMh3n3x0hkPVQ/ONWAFY+Y0O9Hi9/F367mdfOlh9nHddtzKJWHBAssUZNU4uBV4J4E8YsqU6d43m6blksuMVk3woTy/3FcYlK0+LB49KFvnWwks9bznFAGK8k1OhKB5LeYPkgbMe2jnb5CaFXLXBEwicPtdIMcT7ES01RWPezOyrJbVh1zbGPJRI0hdL7bEu9fea2PgAxcRayHZAhoL+K1ClN+3+ePO1Ll2OUsrH4UndcA+CR5nGipVteYzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pNNE9pZ1dPMzVNb3JQN3BMODhaOW9HbXdJR1lqQ3lzZlVwZHBMM2c4ZllG?=
 =?utf-8?B?Q0E1RkhtSWpTUmRzcGVRSDRHWVI4SXY5bFR2Y0hzMTVOcXlLcjBkMG5mRVFV?=
 =?utf-8?B?NUVpSjIwQm9PWHZYQ0NZenVyVXJtRnJ5RmRaZ1hkRk1WQnVuVE5FZGxFUHVo?=
 =?utf-8?B?M0EzRXk1a2xDR2pKbTg3NVRrSHZOZXZFaFJkWElWUzR3MkVXWWoxa1lzTnh0?=
 =?utf-8?B?bVo2TjBMalUweDJ0MzhOejJldmhkZlNybXVIWWZpRG5LaVZFRVU2Y1g4Titw?=
 =?utf-8?B?S0c1b1NLZWVyWUM1eGp6ZHpXNXByREhRdU5CbU11RlpUZTM0ekU2MDZmQUYw?=
 =?utf-8?B?RUhhT1BNUUN4YTI1dWQyTjVqbGFJUWU1bStlVWQ1YlZRNVdBS0oyYXd1ZVpU?=
 =?utf-8?B?amE0QlRKS3J2S29YNnR1QXpFbUhmQmJTMjM5OGVPRWVQcmdNbkpzek9ZZzQy?=
 =?utf-8?B?dWRTRGVwUFFPNkl5cE5yTDRHMWhiandqajA3LytTdE5sOXluRkdPVnorR29x?=
 =?utf-8?B?WVJiN3ZVWTVJYm1ldVB6NFpiNXdrUVNZVGxkdTRTNHMrMERiYkFHUURLN1lN?=
 =?utf-8?B?QnFqSjRqblZ3a1E1cjRUdmhHMXZ3SEtZSXIyNVE3VzdET003cGMyT1d1Vldi?=
 =?utf-8?B?eVdrUTlGQ1U1dENtREpqeC8rQnA1TjV2aDJkOUZYblRQYlpUYW81cXAvc3dy?=
 =?utf-8?B?ZmZxNUMrdVVCQW9SYkJ3eEx2MmRRM3NxZ3ZUb1JER3ovUDVEY01oNkVJTGdz?=
 =?utf-8?B?elplVUJVQkhvREJIaGpON0VzOUtEVVFLMTV4dm9oK2R0WWZ1dENvcFRmTm1W?=
 =?utf-8?B?VUdkaTVoQ0lHdE1ObERtMk9BRnFGMUJxVmFRcVpMb1RwTkZ5U0x2cVRIQnEy?=
 =?utf-8?B?eEc0L3VWd1dkZUd6SmdjTVZHcXNBTTAvN2tFeCtyd3lFNU1EY2ozc0tFMUNM?=
 =?utf-8?B?YzlEdnZwQlV5ZFZBTFhuRmJzOXRNVExMamplYnRmVE1MQ1ZuY2xKdW9leWJy?=
 =?utf-8?B?T251TlNTZHIzLy9FOUJ6R0szNHN3cXd4Qm1MWHJsWUhNZitWZEJXUzlyRkZR?=
 =?utf-8?B?eUVIVmMzSkh2RzJDWHhNRjBEYTkrdFpiRkVlTGlCNDRXZSttT3R2MmY1T0Jn?=
 =?utf-8?B?OXhiYkIxU2dZbVg3dE1TUTVFUzhmeFlRNWJPYWQ2YjY2Nmh3eWVxc2dGVjV2?=
 =?utf-8?B?YjVvcXVTVHg3L1BvUGFXKzRPK1IzaWNITTUzSzBFQlhlTGZKM2dJeTRHQVls?=
 =?utf-8?B?VVY4NTY5cmsrUEhXcFBGZFlyTTRnU05RVmxYell5SlgxYUxkd044OElyYXZq?=
 =?utf-8?B?R21QMy9Pby9NSHlRRjBqclNsQTFUc2Z4L2lXQy9vUk5hNGNxamRueTJZSm9x?=
 =?utf-8?B?dEhZOUpsNGpQbmhyeTJtVVdaTGVPK2o3NFlaaFhpMnBMQ3liNHllWHRYQk9N?=
 =?utf-8?B?TVl3N2xJZ3BzUzZJVTd1MGwxZExJeFBvbzN4Q01NWkFBU2wwV2pUbWQvbEI0?=
 =?utf-8?B?c0haV3g2SU50SWtvelZMTnM5WXJJcFJUNHJ3N3RFUVZjeXg4L0Z6dkV2N2RS?=
 =?utf-8?B?YjVoY1U4MnNpWW1zZEdpczJyeXFxeFlxOVEwSFhRTXYrZDVHMStqWlNsb2s5?=
 =?utf-8?B?MWRhVHAxVm1NN25aUnRDb2JHZ1pFdXc1Y0FKdjV5bllJWUxya3I4OFFqTEFp?=
 =?utf-8?B?UmJOcnlMZ0x5djdxMlM5UjZ1QVdvRXAwcUZkMEpKZ2lWVDJvTEdtWExFYzRx?=
 =?utf-8?B?czBLZWZkN3IvRGVFemtEM2FrdFUzWm5TTDdrQm8xNVhjOWJkNlNkMlMwbnFW?=
 =?utf-8?B?R2tvMHlaRi9iYXdoWm53SndCMWdLWHptOENpenRNT1ZWOW8yZFNwU1RlLzJ6?=
 =?utf-8?B?NU9TSTZIOE1oT29vWDdHd1N2WUNwa2w0YVdlZjZyUDVXZHFQTW5xR21PZm9l?=
 =?utf-8?B?MlZkekxidFExbDlnaXp6YVFpTEk0aWZudUFGUjhkeHh4NTRvSGNlZ2sxbVpp?=
 =?utf-8?B?Z1VodmNuT25qdlpRai91aHdicWtQbkUzdkJscFYxNkVHWUErV0Vwcnhybkk3?=
 =?utf-8?B?Y3NwRXNoVk9HcllsdWFQOHRCcEFUcVh1SEdjZzczVGNPb2FvNGxTeFhUYXZu?=
 =?utf-8?B?Tm1yeGM4QU5zNmhxaWdLSDVFeGJxcHlZR21rMUJ3cWRxM3h3MEV6OG92aysy?=
 =?utf-8?B?dmNPSW1rcnNxTndkRWZsbU9MakdRSXdtdGdweGRWLzNQNkY5NGRMQTRCaDgz?=
 =?utf-8?B?ZUtYUWpMbE9Ld0g5czBKMVZ1aWF5S2ZCa0dVVmNxb3lvMWozcmRoOTl0NXFD?=
 =?utf-8?B?T1NLQ0pmY2JMMFN4dDJzSnovVlBTMHphbFlHamh2aW8zYkJSeFpXNXcwdVls?=
 =?utf-8?Q?Hg/8hlHkTGw5CbBaaMVF6xFzLSXtAjMJDH0D4OZ8NuobQ?=
X-MS-Exchange-AntiSpam-MessageData-1: LzpMs3/q+3eh8A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5098cee8-0e42-434b-97cb-08df129fdabe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 20:36:28.9914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeA11c57UxPjCVOOsPEC4zx4TElbtkClGQWvoeaTRoaV8recE8D7yZZsoEJ7oH9YkkNZB4VmkeQcThm5L2VjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB186998
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_133636_564500_DCB4D5AC 
X-CRM114-Status: GOOD (  28.03  )
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


On 11/09/2026 18:22, Miquel Raynal wrote:
> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
> means they do not have an SR2 to read from/write to. The new generic QE
> helper was supposed to accommodate this situation but in the last version
> that got merged, parts of that specific handling has been moved to a
> more contained location, swp.c (which needed most of the extra code),
> yet the Macronix case has been forgotten about in that generic QE
> handling helper. Booting with such flashes will always fail probing.
> 
> Fix the situation by making sure SR2 reads just return 0 if
> unsupported. This is safe since there is no chip with a write SR2 path
> but no read SR2 path (which is now enforced in the SFDP parsing step).
> 
> This way, callers still do not have to care about the internal device
> capabilities. Calling sr1_and_sr2 read/write helpers is safe in both
> directions (not risk to get a spurious error). The behavior for SR1-only
> chips is respected, the complexity in the core kept to its minimum.
> 
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.14451625037676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> Changes in v4:
> - Make sure we perfom the "_and_check" over SR2 only if SR2 can be read
>    back, otherwise it does not make much sense to do it.
> - Link to v3: https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v3-1-2ecaefb2ef2c@bootlin.com
> 
> Changes in v3:
> - Make sure the read helper returns a "valid" SR2 in the sense that it
>    cannot be random data by returning 0 for chips that do not feature a
>    read_sr2 opcode. The major thread was to get a wrong comparison
>    (against the tmp variable) in the _and_check() helper.
> - Link to v2: https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com
> 
> Changes in v2:
> - Change the approach, see v1 thread below.
> - Link to v1: https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com
> ---
>   drivers/mtd/spi-nor/core.c | 15 ++++++++++++---
>   drivers/mtd/spi-nor/sfdp.c |  3 ++-
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e2b6efafdd8d..4377b73e57fb 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -849,7 +849,8 @@ int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
>   
>   /**
>    * spi_nor_read_sr1_and_sr2() - Read SR1 then SR2
> - * General purpose helper.
> + * General purpose helper, always safe to call. Will expectedly ignore
> + * SR2 on certain chips.
>    *
>    * @nor: the spi_nor structure
>    * @sr: pointer to a valid 2-byte array
> @@ -864,7 +865,12 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr)
>   	if (ret)
>   		return ret;
>   
> -	return spi_nor_read_sr2(nor, &sr[1]);
> +	if (nor->params->opcodes.read_sr2)
> +		ret = spi_nor_read_sr2(nor, &sr[1]);
> +	else
> +		sr[1] = 0;
> +
> +	return ret;
>   }
>   
>   /**
> @@ -960,7 +966,10 @@ int spi_nor_write_sr1_and_sr2_and_check(struct spi_nor *nor, const u8 *sr)
>   	if (ret)
>   		return ret;
>   
> -	if (sr[0] != tmp[0] || sr[1] != tmp[1])
> +	if (sr[0] != tmp[0])
> +		return -EIO;
> +
> +	if (nor->params->opcodes.read_sr2 && sr[1] != tmp[1])
>   		return -EIO;
>   
>   	return 0;
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c21a6953db96..641f17ad51a0 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -656,7 +656,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>   
>   	/* opcodes sanity check */
>   	WARN_ON(!params->opcodes.read_sr1 ||
> -		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2));
> +		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2) ||
> +		(!params->opcodes.read_sr2 && params->opcodes.write_sr2));
>   
>   	dword = bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK;
>   	if (SFDP_MASK_CHECK(dword, BFPT_DWORD16_4B_ADDR_MODE_BRWR))
> 
> ---
> base-commit: 700bf34058ca7cd792236b1ba5caad3770d66208
> change-id: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
