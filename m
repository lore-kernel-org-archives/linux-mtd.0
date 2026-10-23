Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B8606A319
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Oct 2026 02:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZtZ0wH7G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=CMCnXeC0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a3gfrXeklVPz9ANyDsoLkUfpt0THJvy1DoRVbHG47uQ=; b=ZtZ0wH7GjlYdPiL7xnpazLP3gM
	2bQ+BQ/W1iNeuNKP+MR20EMBOwx5SOQ1TXeq7GqAMPCZ8SQVXTfTmHPbUNsaK7TrZ/bFJzkfzWh11
	O2pL5B7NpvTqud8j5RFdItYoItWb+iJVt/hnj/WGdI1xMKlQHwvKXG8RQMD6HMlU2kQUZaLiWQVa6
	nnLxAsYycHXpdiNWLh4WdRWoYby2MM8lRFtPGtlyDhkauEsUbHS5BM9NK6wlsS0hRgAJE8oOswNbK
	nkbhtEC4r80WqtwkIrZ7e5Vvkufpm7iLg3z/VUqFTsxnZw5F5X1BiK0kW4dIg4eCQly7AGZQwhr48
	sYFa555Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4d2-0000000FJW6-2NY4;
	Fri, 23 Oct 2026 02:03:32 +0000
Received: from mail-westus3azon11012003.outbound.protection.outlook.com ([40.107.209.3] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK4cz-0000000FJVj-3FmR
	for linux-mtd@lists.infradead.org;
	Fri, 23 Oct 2026 02:03:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQpxrGPaIVcbY9QbqT8QHI6gN6u1DbVjit3g6h9auXwavUkPNSWiaBnghkK8Vw6WOpJhOiZncM50Lvg9J3Xp3WgI0g+YzOc8oDtQplJl83EjOdXYm0SPqq+x1lgwLdmdDYtzjPOrfLCrjNQj1sEYuR+cnb7YevZ8Hscbx2nDPcRhRn+kaCO0zI3ZLX2GNMLDuhrnQObK1tjxKbbQWYo9zFnrghXa9VOSDxoIJAahZdu1amu71W6aHDDdrYr9Bshr4WzfExZ6Q4JVCQWf/1w8r/w868nTVUu6RQb46Isx/WL+9Y+cWU9VGaiGvudLFDkRZgLdvo2yiuAmFqiHjtu1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrSWmUxQ18JWaepOOU3ZjLhJEXHwJ0ds3a6bY0G+zZE=;
 b=os8UvpUtdXKtBoyiJyX/cOQJsugE96+ix7kPbhZf5yE7Qq4bnhfXc8Q4FILTIoR06uEjtpHxCQoc2M5aa3xNtfl1sXolmOzS8yWcgjsf/7D4OzPrPt454Uz9/yOS2nEEl26K7zE0o0nQEB6H60i+BL7L5F5uzJe3jsiwjBLx/Fg3pFGGdvIDtZHzKqdW2MtxCNg/OXqHI66go1OPphk0lNz/cgcyLii8fBwkwR99YoCEXFTxMRp3sfc/vZ1gMR75qQwogbWKcuwPYPTQqpnMvMjBVmgAc/oFbbZi2N4O9D4P46W4hH3xQ3LsXo85MXPuPqt0nrfLR06SzPIoTh/B4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrSWmUxQ18JWaepOOU3ZjLhJEXHwJ0ds3a6bY0G+zZE=;
 b=CMCnXeC0rGWK/J0e+oqRT58uSLApjfTKvgXRMeBnPXH2Xj4Hizw+HDEW0lVkQpK4zRN+31wfAtMc4px0m2xtugndDfIw76NL4jlCV2oEEe23u4Dc+yrwxyewKsupEvnMyX9hjEqMKvIXhS5JN0jKVuJftqnyhRlF/kV6lHQ8gnwVelrmyzpc47LmnjPACMazF+S04DURAeVDvqGEI+q31P8oTJGYskMzvvFLpebQNfu5hu+umnhCWfkTy7xLOC8juZsvXk74UKhpn2f0gVUlsPesXnKdaAsIdAc3Acy68TIBxE94PGoEENKHjbL6TIiwcFwSFt4ZiIyTaTrvuXVxtA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BN5PR03MB8041.namprd03.prod.outlook.com (2603:10b6:408:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 02:03:25 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0522.017; Fri, 23 Oct 2026
 02:03:25 +0000
Message-ID: <e2da1db8-48ed-4095-888b-03e65ef771ba@altera.com>
Date: Fri, 23 Oct 2026 10:03:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, linux-mtd@lists.infradead.org
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
 <20261022035352.52129-3-tze.yee.ng@altera.com>
 <sashiko-outbox-180997@kernel.org>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <sashiko-outbox-180997@kernel.org>
X-ClientProxiedBy: BY1P220CA0011.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::11) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BN5PR03MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 92dbb8dd-fc81-4334-3ff2-08df30a9d282
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|261022105027099003|56012099006|261022075727099003|11063799006|4143699003|261009223027099003|261021123027099003|261021121427099003|10067099003|18002099003|22082099003|55112099003|6133799003|261022113327099003;
X-Microsoft-Antispam-Message-Info: Yb1WWPQSLsVsN9vvEPFoRwDj180JwgPvh/heP/GdrVut0lecxWLURyKP2nuGUCB2qFEbNGkFafgCAMExxTQihUUVZXiUB41w7BoQTKsF60nSMlu/32QttjP3PW/UbIh8yNfhoGPQQfclFv3OFGBs3tK4bNQ37xu8aTKEgJlZbv/rGqwBvkXy75By4lap1j16BBrs72dPj5QdaycC5LC+/UWGAJExCwqDeW9Gm9HgLt031LSJbn5DK4NXgbPguC5fy86/yFpadD3KiMnJQw6fov72MLxmRk6uYbw6RNfAIXSVfCzK17fKn95xVf1Wy0GcsIPvrctqz0Dxb20RkNy6ReWieDFM7P/7ZhntHfocLwHL8VkBuxoQE6GbTpkKMoRhgenqmfLYdR2SBGMusWRAzj1p9AsxrJnKERHQUUwXgLzij6nTBkgF2fT2dni4CS/7U5yYano9IUNAsoIugh7MNLcMZMbgec2pSQ3NxHBESGZ3mmpQV+Sx9vwBNRKB56yDoxPKvC/7uJe+Uowl/8Z6CtWTSYER3XPbCf1qojXNp/T8YlwSsbr64p4IfUeczYitJ8fKLY6BplB/5MDLVfaUxRJpzaLbGtm1HDR7Gz3QiDgJGRAM4SnOV1dwKeh5p0knv9xdBkznquu9IyNn19PeXkv8Zs8lMSlJIkbAdt24nVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(261022105027099003)(56012099006)(261022075727099003)(11063799006)(4143699003)(261009223027099003)(261021123027099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(55112099003)(6133799003)(261022113327099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjRidU1HMXZmK3A1QkxnckNYaFBsRUl4ZncyK01sOGZlMjZSTlIycUZxRmpE?=
 =?utf-8?B?dTNrcUZtRVI2VEEwRm5pVFo4SWdXTDNJY29zZGZnVURIOW8wUkZ5Y0MyMkN3?=
 =?utf-8?B?UkFvY1laTmErdW8xYVdPNndRd3pPMS9nYVJLVG9HNEhvaithTXNoN2JLUHRY?=
 =?utf-8?B?T2J5NS85NVdnMlJRczdkV01rSnZIU1R3R0p3dEVmVDZUSWV1aWRmZXZGQ3dn?=
 =?utf-8?B?VVhiZUlVZXhrSXNQbWc3cWpNNlVJdGlIaXg5OVg2aUJjVlE4VDRzNE9YUEdn?=
 =?utf-8?B?NCtsaVFyajVrUi9Rd1JCRVc2VWxJOTg0WGZRVFhDcGd0WEpIOXFhM2NwMUNU?=
 =?utf-8?B?NjlkK0Y4cUtYV3ZGMGZ1Q3JFZzg1NnhRNXVqWWlma0EyeXNyVm02ODZuK2E0?=
 =?utf-8?B?WG1WeGd2SVQyZUliRzJveDVkU2hXdHgwQXlyNytKUUJITFZUMk9zVG90RzF3?=
 =?utf-8?B?MkZOV1VrR1NRNDZYYUZYenp3K2U3S2JiZTA1cThqdnBQUkZNYk9HeHJkL29B?=
 =?utf-8?B?d0w0ZVNRWmNjditVWDBWanF5cllYUVBORXQzR20wMGlmYWNvYXJyY3hjbXFw?=
 =?utf-8?B?aTRKVURha1dETmlVL2hZWkxpMzZrODJXSzl5MlZBNyt0dWJjbEZ6NkE2aG1h?=
 =?utf-8?B?enQ0OWk0N1Z0Z3lnSytjazFQd3VTbmhrdkxQamJNc05WQTA4c25WNkhNRkFF?=
 =?utf-8?B?Y2xMWW92Qk51RXNjYkg0QWFKNEdVL1dqRmRNR3VMbVBYTk9vb2JBRlpraUt3?=
 =?utf-8?B?anpnY0tOVWFhZm1XTE1PdGs5bmxab3QvU2NGOGVjVFJGQ0w2TkZ2bmM1WUJp?=
 =?utf-8?B?MllrM2xMRStSeVZqS3RRWWVPVGw0WVd2cUh0QThxWmxrajZTdmpWR1crNmg1?=
 =?utf-8?B?UVIyRHJmWjNPTzRHUkpvbjV4RmRZcDhMRG5yYmpDYVBDWFBuYlVhS0hXclVy?=
 =?utf-8?B?QXlFUnBBQ1RmYjdSUTdUMElkMzZaY1hDVUlTY2dUUE9oTHliSHZvQ1ZZTFFl?=
 =?utf-8?B?R1l0VnpUTlNKZkdsbFRZMUZ6dUFCV2FFcFdMWDlranQ2NWRsK1pWMEpCWUZ3?=
 =?utf-8?B?V29sQWM0TGFxaVlXc3dNeDY0cmE3amV2d1RBMTVOZ1dFcUxQaHJJRzJ2RjBY?=
 =?utf-8?B?UXI5QVlHRFkySUVEV1F4NUF1ek5SVHRPczFDcncxZHQ1Tm5YVzZwMFprSkRp?=
 =?utf-8?B?enBBS091WEpmRE1KMnM0QjlNYmhteGVtOHVtS2ZwV2ZyS0E2eHk1bENmOElR?=
 =?utf-8?B?aDdkTkZHc3dscmNMNXNNaVRuNG80b0N2RW5jWnJlSnpUQkRrN044QTZsR3lH?=
 =?utf-8?B?dExHcmdaYk16TTVSMCs0VmJGVVZIOUpJazNuUmVGV1JGaWg0SUJRUDk4eHhT?=
 =?utf-8?B?YVFWOFVmMUQvdy9EZGhZL3g5bmF3c0xBd0RQT0d2bUNjSllXL3c0OTdPcVMz?=
 =?utf-8?B?d1Z3b1RVTFdKTnpVUFY2UDlaejBsN0F2OTBvZCtIWkZMdDdKRkpLRWwrek90?=
 =?utf-8?B?dTN0UzMrbGZnd3BlbWk5V3hIVDc5NmNzTjA1b2l3WG42MUtjeTFNaytUazNs?=
 =?utf-8?B?eVdBMThRWFVQelNNM1pITmVPOXZvelJFWEdEZFFzWXdzUVJzMXV4U0tGMWpT?=
 =?utf-8?B?TTVDWkxOVHV1RUs1OVF4WFpzR1ZLbFE2SnlLaG93bk14aHBKTXoxRWo3L1Yy?=
 =?utf-8?B?Nk1WSlZFaTFLMGxKK2JzOHdOQWt5R3JEU3FVTDlQdlVDT2xXNFZkd1ZVOUtP?=
 =?utf-8?B?VWx4bnM0N2RrNUJKcDl3VzNmNGY4UjNlTGxwUXArRnpxd0Y3cG01eFpXN3lz?=
 =?utf-8?B?bkpGeGZ0ZUxRS2Y2cis4UWVUNzVTTjlEL3dVMEZLOU92dlpFaW41KzYxcUFV?=
 =?utf-8?B?MlJxR1VTa2NNREIzQ3ZJc0FvR21vRm5QZ1U0TGRzOUNGWG1FU1FFc1NqSlFF?=
 =?utf-8?B?eGkzT2FQbGhEYWNTVkdwVkJ4YVNQQm4vMTlyN3RmSWZnTTNTVkNnWmhPbStO?=
 =?utf-8?B?RlhKWXMxU0NLY1VJK1Q1Sk5SRHBVY2FZbHNpRVB4K21IaEMzQmtjNzk2SzRM?=
 =?utf-8?B?Y3VUQkFJYTh1amphcmFDSGhZa0xkUjlMYk9ZaldoOU4wSktyM1dkeDdKbEIr?=
 =?utf-8?B?Yk10Y0QrVk1ML2p0bWZ5RExIYThTOHk5bCtHWDVMV2pqd0tkOEhaa1BqMURn?=
 =?utf-8?B?bGZpNkczWDAxSUIzRVlLZWZDSkpwNFpsa0xyMTlOenF2U3IyWXg0cEVyMjcz?=
 =?utf-8?B?cWRqSWFwcHlWbmdHdXJpVWtEMHdvZWFoMFM3elpVWldiSkNHUm5Qb2lrWXpW?=
 =?utf-8?B?U2haZi9ScklMcGZqaXRaQUZHYnJQa09qL0l6TlluUXBCVnNreWJ4QT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92dbb8dd-fc81-4334-3ff2-08df30a9d282
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 02:03:25.0651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QO/U+ij1c4jn3HGK9ozcnJT/3w+6+KAyV0F3WYfGxZ8Y2ySmLIrfGXV5XPCLvtfHM4sZpz6mdT7NOm41UwRwbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR03MB8041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_190329_882120_1EB8A6E7 
X-CRM114-Status: GOOD (  27.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hi maintainers,

Thanks for the review. These four are real, but they are not new in this
series, and I'd prefer to keep it limited to the unbind use-after-free
on the I/O paths:


On 22/10/2026 12:18 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Critical] mtd: spi-nor: use-after-free in spi_nor_suspend() and spi_nor_resume()
> - [High] mtd: spi-nor: use-after-free of nor->dev in dev_dbg() after unregistration
> - [High] mtd: spi-nor: use-after-free of devres-backed nor->mtd.name after unbind
> - [High] mtd: spi-nor: missing nor->removed check in spi_nor_get_device() after unbind
> --
> 
> commit de3094832a517827e88d8d0203973cdc91471e95
> Author: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> mtd: spi-nor: fix use-after-free on unbind with open handles
> 
> This commit moves spi_nor and its associated buffers off devres on the
> spi-mem probe path and refcounts struct spi_nor across registration and open
> MTD handles. During remove(), it unregisters debugfs and the MTD device, marks
> nor->removed under the lock to fence subsequent operations with -ENODEV, and
> drops the registration reference.
> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 8bc117b46e028..76928bd8413ed 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
> 
> [ ... ]
> 
>> @@ -3420,20 +3449,48 @@ static void spi_nor_resume(struct mtd_info *mtd)
>>   		dev_err(dev, "resume() failed\n");
>>   }
> 
> [Severity: Critical]
> What happens if the system suspends and resumes after spi_nor_remove() while
> an open file descriptor still holds a reference on the MTD device?
> 
> When a partition (or a master device with CONFIG_MTD_PARTITIONED_MASTER
> enabled) is open during spi_nor_remove(), del_mtd_device() drops mtd->refcnt
> from 2 to 1 without running mtd_device_release() -> device_unregister(), so
> mtd->dev remains registered on mtd_class with mtd_cls_pm_ops active:
> 
>    mtd_cls_suspend() -> mtd_suspend() -> spi_nor_suspend()
>    mtd_cls_resume()  -> mtd_resume()  -> spi_nor_resume()
> 
> Meanwhile, once spi_nor_remove() returns, devres_release_all(&spi->dev) frees
> nor->spimem, nor->dirmap, nor->params->vreg_offset, and nor->params->priv, and
> disables the vcc regulator:
> 
>    drivers/mtd/spi-nor/core.c:spi_nor_suspend() {
>        struct spi_nor *nor = mtd_to_spi_nor(mtd);
>        int ret;
> 
>        /* Disable octal DTR mode if we enabled it. */
>        ret = spi_nor_set_octal_dtr(nor, false);
>        ...
>    }
> 
>    drivers/mtd/spi-nor/core.c:spi_nor_resume() {
>        struct spi_nor *nor = mtd_to_spi_nor(mtd);
>        struct device *dev = nor->dev;
>        int ret;
> 
>        /* re-initialize the nor chip */
>        ret = spi_nor_init(nor);
>        ...
>    }
> 
> Since neither spi_nor_suspend() nor spi_nor_resume() acquires nor->lock or
> checks nor->removed, won't a suspend/resume cycle execute SPI operations
> through the freed nor->spimem and freed params fields?
> 

Agreed. Mainline already runs these on a freed spi_nor after unbind;
with this series the spi_nor stays allocated until the last close, so it
is narrower, but the suspend/resume paths still reach freed bus
resources. Needs the nor lock and a removed check in both. Left for a
follow-up.

>> -static int spi_nor_get_device(struct mtd_info *mtd)
>> +/* Free spi_nor and its buffers; safe on partial init. */
>> +static void spi_nor_free(struct spi_nor *nor)
>> +{
>> +	spi_nor_debugfs_unregister(nor);
>> +	kfree(nor->mtd.eraseregions);
>> +	kfree(nor->bouncebuf);
>> +	kfree(nor->params);
>> +	kfree(nor);
>> +}
>> +
>> +static void spi_nor_release(struct kref *kref)
>> +{
>> +	spi_nor_free(container_of(kref, struct spi_nor, refcnt));
>> +}
>> +
>> +static struct module *spi_nor_controller_owner(struct spi_nor *nor)
>>   {
>> -	struct mtd_info *master = mtd_get_master(mtd);
>> -	struct spi_nor *nor = mtd_to_spi_nor(master);
>>   	struct device *dev;
>>   
>> +	/* The controller may be gone on the last put; use the cached owner. */
>> +	if (nor->refcounted)
>> +		return nor->controller_module;
>> +
>>   	if (nor->spimem)
>>   		dev = nor->spimem->spi->controller->dev.parent;
>>   	else
>>   		dev = nor->dev;
>>   
>> -	if (!try_module_get(dev->driver->owner))
>> +	return dev->driver->owner;
>> +}
>> +
>> +static int spi_nor_get_device(struct mtd_info *mtd)
>> +{
>> +	struct mtd_info *master = mtd_get_master(mtd);
>> +	struct spi_nor *nor = mtd_to_spi_nor(master);
>> +
>> +	if (!try_module_get(spi_nor_controller_owner(nor)))
>>   		return -ENODEV;
>>   
>> +	if (nor->refcounted)
>> +		kref_get(&nor->refcnt);
>> +
>>   	return 0;
>>   }
> 
> [Severity: High]
> Should spi_nor_get_device() fail with -ENODEV once nor->removed is set?
> 
> When spi_nor_remove() runs while a handle is open on a partition (or master
> with CONFIG_MTD_PARTITIONED_MASTER), mtd_device_unregister() only decrements
> mtd->refcnt without calling mtd_device_release(), so the MTD device stays in
> mtd_idr until the open handle is closed and mtd_release() runs:
> 
>    mtdchar_open()
>      -> get_mtd_device()
>        -> __get_mtd_device()
>          -> spi_nor_get_device()
> 
> Without checking nor->removed (or using kref_get_unless_zero()), new opens of
> /dev/mtdX after unbind will still succeed and take new references on
> nor->refcnt, allowing userspace to keep struct spi_nor and the controller
> module pinned indefinitely after the original pre-unbind handle is closed.
> 
> In addition, in __put_mtd_device(), master->_put_device(master) ->
> spi_nor_put_device() frees struct spi_nor immediately when the last handle
> closes, whereas idr_remove(&mtd_idr, mtd->index) only runs in mtd_release()
> when all device references on mtd->dev drop. If anything holds a temporary
> reference on mtd->dev across the final close, could a concurrent
> get_mtd_device() still find the mtd in mtd_idr and call spi_nor_get_device()
> on a freed struct spi_nor?
> 
> [ ... ]
> 

Agreed. A new open after unbind succeeds and pins the object, and its
I/O then fails with -ENODEV. A removed check in ->_get_device() would
stop that; the lingering idr entry in the second paragraph is a core
lifetime question and would need a core change. Left for a follow-up.

>> @@ -3788,12 +3870,15 @@ static int spi_nor_probe(struct spi_mem *spimem)
>>   	if (ret)
>>   		return ret;
>>   
>> -	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
>> +	nor = kzalloc_obj(*nor, GFP_KERNEL);
>>   	if (!nor)
>>   		return -ENOMEM;
>>   
>>   	nor->spimem = spimem;
>>   	nor->dev = dev;
>> +	nor->controller_module = spi->controller->dev.parent->driver->owner;
>> +	nor->refcounted = true;
>> +	kref_init(&nor->refcnt);
> 
> [Severity: High]
> Does nor->dev need a get_device() reference tied to nor->refcnt, or need to be
> avoided before nor->removed is checked?
> 
> With CONFIG_MTD_PARTITIONED_MASTER disabled, opening an unpartitioned master
> /dev/mtd0 calls __get_mtd_device(), which increments nor->refcnt via
> spi_nor_get_device() but does not increment master->refcnt:
> 
>    drivers/mtd/mtdcore.c:__get_mtd_device() {
>        ...
>        while (mtd) {
>            if (mtd != master)
>                kref_get(&mtd->refcnt);
>            mtd = mtd->parent;
>        }
> 
>        if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
>            kref_get(&master->refcnt);
>        ...
>    }
> 
> If the SPI controller is unbound or the SPI device is unregistered while
> /dev/mtd0 is open, spi_nor_remove() -> mtd_device_unregister() drops
> nor->mtd.refcnt to 0 and unregisters nor->mtd.dev immediately, releasing its
> parent reference on &spi->dev. Once spi_unregister_device() finishes, struct
> spi_device (nor->dev) is freed while struct spi_nor remains alive for the open
> descriptor.
> 
> A subsequent read, write, or erase on that open descriptor calls dev_dbg() on
> nor->dev before spi_nor_prep_and_lock*() checks nor->removed:
> 
>    drivers/mtd/spi-nor/core.c:spi_nor_read() {
>        ...
>        dev_dbg(nor->dev, "from 0x%08x, len %zd\n", (u32)from, len);
> 
>        ret = spi_nor_prep_and_lock_rd(nor, from_lock, len_lock);
>        ...
>    }
> 
> The same pattern appears in spi_nor_write(), spi_nor_erase(), and
> sst_nor_write(). Could this dereference a freed nor->dev when debug logging is
> enabled?
> 

Agreed for unpartitioned flash without CONFIG_MTD_PARTITIONED_MASTER.
Holding a reference on nor->dev for the lifetime of spi_nor would fix
it. Left for a follow-up.

>>   	spi_nor_set_flash_node(nor, dev->of_node);
>>   
>>   	spi_mem_set_drvdata(spimem, nor);
> 
> [Severity: High]
> Right below this in spi_nor_probe(), nor->mtd.name is assigned from
> spi_mem_get_name(spimem):
> 
>    drivers/mtd/spi-nor/core.c:spi_nor_probe() {
>        ...
>        if (data && data->name)
>            nor->mtd.name = data->name;
> 
>        if (!nor->mtd.name)
>            nor->mtd.name = spi_mem_get_name(spimem);
>        ...
>    }
> 
> In spi_mem_probe(), spimem->name is either dev_name(&spi->dev) or a string
> allocated via ctlr->mem_ops->get_name(mem), which drivers such as
> spi-nxp-fspi, spi-fsl-qspi, spi-nxp-xspi, spi-aspeed-smc, and
> spi-cadence-quadspi allocate with devm_kasprintf().
> 
> When spi-nor or the SPI controller is unbound while an open handle keeps
> nor->mtd alive in mtd_idr and sysfs, devres_release_all() frees that name
> buffer. Won't subsequent reads of /proc/mtd (mtd_proc_show()),
> /sys/class/mtd/mtdX/name (mtd_name_show()), or lookups via
> get_mtd_device_nm() read freed memory from nor->mtd.name unless the string is
> duplicated and freed in spi_nor_free()?
> 
> [ ... ]
> 

Agreed. Duplicating the name at probe and freeing it with the spi_nor
would fix it. Left for a follow-up.

Happy to send these as a separate series if the maintainers prefer.

Thanks,
Tze Yee



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
