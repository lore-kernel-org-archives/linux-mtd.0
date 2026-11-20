Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B76606A325
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 02:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZAOe2g2L;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=vqrI6QC+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RnG3WTnNkIskHvNPD3CqgHzv0iQ7m5XMjT6GtlZtzm4=; b=ZAOe2g2LGqqTtjRnd62bw1Zx5J
	21xMklkm7fz0gzvmmo6jFrqB7uqsJ9DgtMeABGzLC3VQxvq+2IujHhhqhI4yw2zeqqML6myoHg//t
	wf5utkj2ecKZnFBRBZkAWsW3iZqBhBRR02K0mxGx6UJ1SaLpru/58x5Ulm2snNLvh61Y2Oh+KjNt2
	JGX9iaKXWDjYOf/JAW86ED9rpTQcJOLlWkq7G+hGnKXvPRD6HLsZI76J69x5FI7QJTRoVcPHpZ5W8
	q9QTFAIESoRDeRKJQYV4RU6dFSOptbEh0pOk/O5Wfr8tN6/BbnTTyMuBb8bqHIqrpYTbwHxmItGXy
	GFwJ6knw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEGC-0000000Dsfy-1QhO;
	Fri, 20 Nov 2026 02:21:56 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUEG9-0000000DsfA-1yQz
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 02:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kATPRMeYsvLOR1aOlA5eSMVlC6GPESujpUx9YlB1RiPTeU6lDta1sjMnnscrNS85PPQehO1DE41xIhABRmq3qd0RQqyr9cw1LPagutFlu9IWcIF7CEcOLb/rGXCY9i73R0BR0KBNUFQ2YNgkkKXWxZFTXImvVs9ONp4W7Kehnm3ju1Sktuqi9KlRy8QB4h/Jmhr09RQnYP+aMJyPVcc/M4Jb/HPPLbkS/SP2h3Xrv7VjmGW/c6cVrmAFUgl2T7V6Wh2Xta4juqisxQK98zB+RLVMo6l93I/9U7AIqPdg9b57P4QTePKX4JuMYJHd+lyEVR7SDrdwfV3S35DCY/aBFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCF8tAqMO2gB9RH6MjvwZVjk8nEKZBKLT/xmwNyW+wY=;
 b=L+/Pf3FTZVMCJdPFuiCkt1o92XL0DHHvP1fuXDr36mVSLWY//+t3E7M6ZWi072VhTas6iJ67cvzaAh9+eKh7g9/jXJFxurhrdu7sekS1mw4h3F2QxX/uiHrjY6CDM5X0sCU8+n8mlaS9us+oDof5y67Oo/pqf5D2O/3XHYzc8UM9rjb6B86KzKdDlX1LZ75222bJH/QFNt8YpmbFRWP1b4mlK67ViGtWrSvangxgOm96nCKYUdjPegxgu8T0RaKdrgv2ggHGbOMFXLn9do6z4EHtzol+Xhg66dfshrnIUQJvdW229LScp4QXbbFt6gBbhqkR+mqooqMWlifxKIVODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCF8tAqMO2gB9RH6MjvwZVjk8nEKZBKLT/xmwNyW+wY=;
 b=vqrI6QC+LpDA/QLrCKmKmV1fwQygkjGC1lFex28zv0EKovNGDa4Iyx8A+qEbE+ddtxxq7vkfll2p+yB0dOkEFIRWdbHUVO9dd9+yPr5ukOd0USMN1umNEN7lpC7d0qTAxz5MQoztoXzhgHwp8+UnNPj18dcn3rJJsrrpocamixtFxUeVLRQ1cBUHMmq8PG/i8hdLABIpME8BHc6iI3h8EtbCJaIqmsV3x48ZVEL98BJPX4XT5kSIK0s04uGgSOWBFmKX89g1ZTsD28RUjI0k9C+uHtPWBOxSDLPhvVsRGeRLJDLckGfFf5YJXUs2j6apudAO5N2ue3CzeWtFmwS78A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by IA6PR03MB846654.namprd03.prod.outlook.com (2603:10b6:208:5e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 02:21:47 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%3]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 02:21:47 +0000
Message-ID: <381b16ea-cc02-4504-bbe0-83762886b46b@altera.com>
Date: Fri, 20 Nov 2026 10:21:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] mtd: spi-nor: fix use-after-free on unbind with
 open handles
To: Michael Walle <mwalle@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <20261022035352.52129-1-tze.yee.ng@altera.com>
 <SJ0PR03MB5950FE5D82CA5E77AAE0AC9CA17A2@SJ0PR03MB5950.namprd03.prod.outlook.com>
 <DMY8H2AUQ3LV.VQ3MVOE3YV41@kernel.org>
Content-Language: en-US
From: "NG, TZE YEE" <tze.yee.ng@altera.com>
In-Reply-To: <DMY8H2AUQ3LV.VQ3MVOE3YV41@kernel.org>
X-ClientProxiedBy: SJ0PR13CA0057.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::32) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|IA6PR03MB846654:EE_
X-MS-Office365-Filtering-Correlation-Id: 73a46c29-fe7d-4315-9115-08df46ad0719
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|18002099003|55112099003|22082099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: WC4bOfuXjJ4p5VwaIOPN/7/u9lI7n2e0exHk1jfe/KiXOoc4sSa6Iv5JsEg5DJ7S/RbzDVXwx8Y1Dtzhre5f3vHfi9XxX2vvVhrmWlHjpnzJpo3BWaGZNKbf9WnDRjR5cNMpAA2iYKcrRpBS3rU0R+4oE3LSPjozZ7qJDygn9AJF8SJvAeCKosC2ywulx8dCF809NX/CEyR06o7sS5/ghqeJIoufyWDbYdqLJDMM7m22d4XKpyB6wIJe6BiNw4AfcurYJC+6UGLPNCL5cr0HLCNFYnnEmolfK36yNxT2TPvVYaLD6DsSatTHlXdx1tNeFga4c7WcoL+ZPsYIPA4t6VUsbTGnBQ6aRQlnyPi7eC9FtOJFlbGpSn6nIao8ydp92BKzmNcf+DZIZkVG4kf7RMIqAksFY2sG00JSgIbZKZjDg3Ywm+kUM9t+yeYf4jVsMxb2hf60MN5s5TTsX7PGBhTK73wOzWkyXJnjqMM6SfrjDftw7qqB4Pp8dF1RS8mR0dPDNBYQHgs4aSKEgzNJZktxNbESYw0ZA2HIQpZqlpYSUkTae+kmwUXScSMn8BslXvfCBOX0RrjYg4WnDkTd5nvxb5VRkS4QoyTVScXmA1n74CCchu+72o2+nKVV++UT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(18002099003)(55112099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZjT21xWWZKRk5jbWU5VG92SHVOb2xFcDB2Zzl4V0ljQjhBKzlmSm1SMkZi?=
 =?utf-8?B?NUNCS0JDQ0l6RDlhT1FORW9oamxFMFEyNHZKL2hvc3dPeUdKRDYrSmx5WTFt?=
 =?utf-8?B?MC8rc1R5QmYydVZEOWFCMHMxcGRwMGprTzJCendEb2ZST0NqSTZSNmZVbkpF?=
 =?utf-8?B?WVpPeG1pdEdETFhHRlQzUHh3RllWSHdlMWpDbU93Rk1yRjNxK2phNmNtNTU3?=
 =?utf-8?B?ZmpEVzREZHJPMUJ5OCt1SENNVW9TVFhkaVU5VDE5WWRyUnlFK3JmL0NqVks2?=
 =?utf-8?B?S0RJMXUwMG9mYXliOXNKdUpXZW11RUNSR0tEY1dCOFYrV1N6b2ZMNTgweG1q?=
 =?utf-8?B?VktNK1o4WTZjaEYzd1lYYk5lN21Ldml0N2hFVHF4aEsvdFNJLytJZ1Ezb045?=
 =?utf-8?B?QUNMZCtpK2hXL09NaXVsTHNPUlhZVmEwb3hJZnR5N21XWUdVcWJGbW5pQWNC?=
 =?utf-8?B?eFVtZVBMckMzWmVYYU9KTzZSZ09ueXRjcDFyVE9QcG1PZFhPUWIrMitmeDJo?=
 =?utf-8?B?OWJWSW8vVktPR3JrNjg5MS9pclhpdnFFUzVGRGd1Q1dLb3k4bnkyZW1wYVlB?=
 =?utf-8?B?NStHNzlWdjFlVFJRRGdVblpQRk5YcmdhNGd5R2psOVZma2dRMjBtS0xyZjMz?=
 =?utf-8?B?T0tiWnduWmJ6WGNnbEZIK2ZlVlFobWFPU0NLVkxhNlZCTEFiTzU0ZW9vbnlH?=
 =?utf-8?B?M0FsaENCZjRxRmYrZm9DeTEwckhZZkd3Q0pwTDE1d3VOZ0wzQUtUcmU5bzY3?=
 =?utf-8?B?NXNBa2JGd2NlSytFSG5NbXBIQmNOOVpLdmtEcG5YbjZYUzBMaEw2UndXNzlx?=
 =?utf-8?B?WFNWS0lqOG1zcm5sSzhJNTRMVFhXV0ZIZm5PU1ZSaU9yaFpMZ1NGZk01QjBn?=
 =?utf-8?B?bmF1bzZnMUFIK2EvakxHN0dvWmkrTFpMWnZzYnhvai9GR2FrdWo3M0Ird2Zj?=
 =?utf-8?B?RDI0TFlneFRvVm9waWhYcUNCRHpqdzF4LzZRN2M2MURLQXRHWHh0UEp2MUpp?=
 =?utf-8?B?Y2docmRaazhkRHFyT09CZndUVmZTdXZBSFlwQ1E2U1VjMGJYbG8waUFxZGM5?=
 =?utf-8?B?NDRBajVLaDMwNm4wT01sell5WS9scEJNc0RkdWZSb2dNL1Z1dHpic0t4djlo?=
 =?utf-8?B?UGVmUFhKTG5wUDlkNm9wa1diWmE3SGZKaC9VK1hQUEVkREt1NWwySzQrUzF2?=
 =?utf-8?B?czV6NnVFZjN3WTBvL1QrWERUVDNoZXRHaVJsQkh5VFJrRjQxenRuYjJXWXFP?=
 =?utf-8?B?WldDMnBFRlJzangyZ1k5UUVGZlZXYWFseFVlOU1xaGpZYnN5Tm1ZYjhQZk1Q?=
 =?utf-8?B?NjdVUGxtSHQrMjl0b3VLdVVKWVh0UDErdjdXM1RQT0tsc29KZHlJZVRDWWp2?=
 =?utf-8?B?RE15cmxRWDltOFhlWitGYkh4RGkwT3dHWXNhOXRPcGVDcExCWUYyS3o1cDA5?=
 =?utf-8?B?UWZFZ2xwREt6VTZEMmtQMU5ROGh0V2JQckFXN21kVlUwazhvYkxDUytFbTcv?=
 =?utf-8?B?eFJsbmlkbmdPMStpT2dsalpXODBCTnIzbGdNUE9zSUdqTHZNaVR3dE9pMVFs?=
 =?utf-8?B?Qkp6WHZYS3hDU1RFelpFUHRhNU43bXRGT2NaK1RDQ0g3NHBKaGljaXdnaVE1?=
 =?utf-8?B?VTFlZW1QcU4xbXJPZE9JbmtVUHQ4MXYxT2dsbmNveWhYalRpMUJxSEowdUR4?=
 =?utf-8?B?d2lFVS9LbXoxUjhnM2xJSERYZFdieUUxSHY2U0NmNkh4WHhvS2QwNUJSVXlv?=
 =?utf-8?B?M3pxMlNxTnovQWp1MnBuRzNRM1U2elFzT3llNnNsS2NvQ2F1cnA5LzY1eTVw?=
 =?utf-8?B?eEMyRG1uMGZKa0xZZEVYMkpLdGV6d1Njbmo0ZGszQm81WnZxNW9PL3ptVnBo?=
 =?utf-8?B?ZG9mdGtITjkxSzRkd1dnWEx4dzhpekpJT3M2QVFSR0ZxYXBlS1JwVjZPUktQ?=
 =?utf-8?B?azdTMkNoeGpMQkdaekd4QVZBZ2pFdDF3Y0d3cVlwdkdYVXJ6dzV2RXpuamhz?=
 =?utf-8?B?UVZSWHBmVDlyTW9vbFc1VERDaCsyT0hXV05VTEo4bmlmRE9TV2JRNEtYUmEx?=
 =?utf-8?B?QUJVZ0lLdXp5NkdTT2lCL2hsU0JiTzN5VEExRHVraDN1ZjhsbW1TTGJIY3B1?=
 =?utf-8?B?UzUzdmwzMHkzemJvZktYYmV4eks2czVXN3V5OG91TlpjamRIQjFkekR5SE52?=
 =?utf-8?B?dHZ3a24vNk01NFY5VjIxSDZFTzAxenMvTStNRHhVY3U0eHRxZ3F2cUtZNnpH?=
 =?utf-8?B?VU1YeGI2Q0c3QmNNM1ZGTC9ZNVFZZ3g1VWZIQW1NYm5QSUNXV2c2YVNUcE9t?=
 =?utf-8?B?UHkwMS9rMVBCeFQrNjBiMDZjaExkdU5XWlA2VmdCZ1M1RitOaXlKZz09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73a46c29-fe7d-4315-9115-08df46ad0719
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 02:21:47.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLgl5NuP9Nc4/huZXX5o+0Lk7dw7pRqb4X9I9KgAUsqzJO8uTbc5qyr51Iq76ZjH1O8tvP0TviDpGOw+enGSdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR03MB846654
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_182153_550126_62E87E66 
X-CRM114-Status: GOOD (  18.17  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Michael,

Thanks for taking a look.

On 18/11/2026 5:36 pm, Michael Walle wrote:
> Hi,
> 
> On Wed Nov 18, 2026 at 9:07 AM CET, Tze Yee Ng wrote:
>> Gentle ping on this patch. Any chance for a review when you have time?
> 
> I had a quick glance, and honestly, I really don't like all the
> reference and resource handling splattered all over the place. 

I agree it is spread across spi-nor. It comes from one thing, which the 
MTD core still uses the driver object after unbind, so spi-nor has to 
keep that object and its data alive and fence its own operations.

> Also do we really need the low level kref_ handling? 

A core-owned lifetime would avoid it. v2 tried that, with a release hook
and a removed flag in the core. Review found problems in that design:
the master can be freed inside __put_mtd_device(), the driver object
leaked with CONFIG_MTD_PARTITIONED_MASTER off, and a lockless removed
check raced with remove(). The kref in spi-nor is what works without a
larger change in the core; patch 1 is the only core change.

> And what about spi-nand and all the other MTD subsystems? They have the same
> problem, no?
> 
> -michael

Yes. spinand allocates its object with devm_kzalloc() and frees it after
mtd_device_unregister(), and many other drivers that embed mtd_info do
the same. A generic fix belongs in the core, but it is a much larger
change that touches every MTD driver's lifetime rules.

I would prefer to keep this series as a spi-nor-only fix, since it 
solves the problem for spi-nor today. James Hilliard's raw NAND series 
[1] adds a generic opt-in lifetime to the core (mtd_set_release()). I 
would be happy to look at moving spi-nor onto it if it lands, but maybe 
in another series. Are you okay with keeping this series as is?

Thanks,
Tze Yee

[1] 
https://lore.kernel.org/all/20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
