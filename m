Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5EEC83F1A
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Jul 2025 00:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmg1GOK0GnwnRGeTLTHglPvtZM7/JFHYChyr2BJlDus=; b=fCLywo8ccA5TY0
	BnpayJAbQKiWpY3JC/U2hQZURpIImyRfuR0CmLvxSb189bBRF+D02CMArTKLNgbu+7gy9fL3TiVCP
	ytgs4AhTrurrPVRxP+lRF31Bfws9+LhhrxqyngymZt7mJsJI1emJb3KEatjud4seor8XmvKTL/9pt
	QO0PvM9ukhPz2Im3DTrHEcdFf4zamne8z7UZKsTTWEkCfChru3nZrF23jHb95J8YM8KWvHIgO+EAQ
	Pnu5rAAg2EWz+UW9n6CjsYfJCMBRTPnDZkMXp0q1GIqQLy3dddApjp3vIuuQTl5JvHdIf9ydw6CGG
	64xkhONAzKCt+3mkASEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTn5-00000003fhp-46J5;
	Tue, 15 Jul 2025 00:45:03 +0000
Received: from mail-dm6nam10on20606.outbound.protection.outlook.com ([2a01:111:f403:2413::606] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTn3-00000003fh3-20x3
	for linux-mtd@lists.infradead.org;
	Tue, 15 Jul 2025 00:45:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wz6d3j5bekNDYBm1XGPNkOBRcrykqiglvPHbiOwsd6ilqnpU3G60FhZ4Xtj+G3BDz+wjjWHAvi3MtY9gQsqGTj/sFQc+YMRxIgtcVnHXBdNbYc1oHIfg+9fSQg+cPS/G7aw2djM64E/KAOFSHVQZ1pcRW+CEgkFL5rQM1TF9V9FAYQPuSuketaY1STqhPn+p1xiGsVv7/jY7VrfxCqS58I9HfnmphJsCZT0tzSwL5AEsn20rpmUcaXVtgScT/za5RnUSPPe/wQhf2bqTgPZ9NLLTgFxHfax9y60aqfQEeG9KIlGHl9MnRUVMcL8VT5j/JpKk0GGPUxsmo5NSUW2H2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiK1hSNNYdx+WCZTLAGa4w0hqIvHqXUasmzInsebg6I=;
 b=INBL+ivqraVVFLxoXqb73xoj38Nyx5fZ93vYj6wiODHCK1GIlLJzz5AJ/MVc2okSxcsWParCK2OTM9QdHZxabzeEuqcGnUCdHvLQse1eQYLcnp8N1WnrXY2aBEQAKRcoyeN0JnVnUST3fo/XfvRpA8XAGPmSRr68wURaRoEZETfJ+Ni5Bhc6ui2zrOPZqarZM1k+7UuJnAp1wYHjkKY/mvfkKnIqWfGZAGW1tcsNmh8e0ILSATXKT838wRv7zIrJqDpSp4E9YTXtLqo0sGBVnjDilhwPLgWwEkSgNW/qT6rUC6Hzst+6uYT1NIflsP5UbZ0e7od4eY/7uQGLtoN2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiK1hSNNYdx+WCZTLAGa4w0hqIvHqXUasmzInsebg6I=;
 b=uCeXtfFdjgwrDIlgmPoEIqJ9km2xWoJ1aBoj0pkhRcYzibvB+1E0YzxSaCq3jnb7AN3bcJEqdpG8jg8oroiJaFY5/IJhZWZZatUI6Jv8QSACbOpzX5YxCEWNU2s+M5CrRDcnjnZJdcBLxlvxEFSUlnmUpaJatPCpRMw6P3Hu6S3UD8ANRCEadHLJaOOVZ4tnCTDX2rI88HECxMR8iAmkzH8XpcSLHuzNhK+0xUxgQYh6yTNar46cSJ+AWLhzWLnuNC3z/pQLKfEH9GjKsm6oYV+AQsJQppTmbdiTDzAQj8aQg+9gbbjxr5vGutSkv2PZoLrDRpPkUU4gCcNdAtBofg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BY5PR03MB5299.namprd03.prod.outlook.com (2603:10b6:a03:229::12)
 by BN9PR03MB6140.namprd03.prod.outlook.com (2603:10b6:408:11d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 00:44:57 +0000
Received: from BY5PR03MB5299.namprd03.prod.outlook.com
 ([fe80::b106:261f:6a67:9615]) by BY5PR03MB5299.namprd03.prod.outlook.com
 ([fe80::b106:261f:6a67:9615%5]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 00:44:56 +0000
From: khairul.anuar.romli@altera.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org (open list:SPI NOR SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list),
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Subject: [PATCH v2 1/1] mtd: spi-nor: core: Prevent oops during driver removal with active read or write operations
Date: Tue, 15 Jul 2025 08:44:52 +0800
Message-Id: <d2bba90684f50a66b81ce4d7da3d405783209f95.1752539969.git.khairul.anuar.romli@altera.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1752539969.git.khairul.anuar.romli@altera.com>
References: <cover.1752539969.git.khairul.anuar.romli@altera.com>
X-ClientProxiedBy: SJ0PR03CA0255.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::20) To BY5PR03MB5299.namprd03.prod.outlook.com
 (2603:10b6:a03:229::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR03MB5299:EE_|BN9PR03MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 0278b1b9-91ef-48c2-2b02-08ddc338d19c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ChQjGFAbxBS8tnaEAK5c0Q3/rZ+MafrPkNJT/711UI45EzgE2WqW+qpOyk4?=
 =?us-ascii?Q?MxVXhsnY0iz0z0LDmPr8nZlz39ygKA/PCKGSdBf3wah4biUdZ1P+wl2dyFtp?=
 =?us-ascii?Q?r0aNSgXohD/1+mRt0Sp26ReBftWxZ+Fc1dQkcRx0kcsTwnAhzCg/ObVL04jH?=
 =?us-ascii?Q?01MBo/gevykXRXV8px2+KZ2p7w4PV9n8wId0HH8SBOg0vovX24+a7xBNhw2T?=
 =?us-ascii?Q?ZtmycOUMvZLDnMNQ4G8CUJMP7QatyO81dxqvHR5rYUOR9Flf0TDNytJiZ6kp?=
 =?us-ascii?Q?9h1Heb5d8wKoR/+g6y7vPvHt53QQJNGJEKyKkTS4QBDpwflA+Am4aJS/PcaP?=
 =?us-ascii?Q?McoTpU8OZwV3wTIKV6k4NHRIvSD2sqy6QYpcdH/GT9d3a0q6t890tylc9CjF?=
 =?us-ascii?Q?k1zLjjrqVejKcpuyg1DLSWJ/73khoJ7k7VClW+BoGvNUp0fy0EoGHS5dl3dg?=
 =?us-ascii?Q?+TSTMdhLn/gbnZC3ij2E+58jGKvgXCHv0BKzG8qezaoczSVxLjUb4vGltbVS?=
 =?us-ascii?Q?faQIQ5KzKF5ZLB9LWRtrIqrD/8b1f+vtUGFfjENaNUq3d+Mv4mQOQs4LXeNh?=
 =?us-ascii?Q?vDsq07A+gwIrgx835SgiLMl7kmgUQfIGJibEOHHGeiF9LHhw2hVsWxW7BnSO?=
 =?us-ascii?Q?0nzvcJziYHrnF8XBXD+/QTH7XdybWLjyjniIgfa38u5g9lTZy9gzrwQbf8Ow?=
 =?us-ascii?Q?Wryx4ptsMyQmf/rB21G+scXwKs+tWyDpBnMIhLXUPg+u0MMeG2+d8+z8ya4a?=
 =?us-ascii?Q?gHEU5cYdlKkUo1pHpcmv/JIoIhqrUqVyxKWDGgfwuPvQaOP6jU/2sRqNcx0M?=
 =?us-ascii?Q?SVElepertswSNnDFM5ZyvyAaY192RvXrzeP+Np+qxtjUQjh93EGnr0hphQwy?=
 =?us-ascii?Q?T6EIoA1LgjDuAJ9thZuHjmsxgFe1WhUA3D47v0OgvAmVLUMeSwURrJwDx4t1?=
 =?us-ascii?Q?+FiavFkEpc4YIa2rbiJLNbUVJU7wIo/odhA9YdaZbdldtSS4WwRHZu/sgcwF?=
 =?us-ascii?Q?wgn6dValVXidqt74gXkH9uYuzYP+G8a5S6ScJD/dyZEfQZZU4b+crsH+4Zhp?=
 =?us-ascii?Q?vWZ3QkLTDVExXT5v7MqpQmqCYTR1gWSaa9khJhDK8xUAISEDhTpH1UwqhzAJ?=
 =?us-ascii?Q?EX2ZRTe9+DRbl1nwPr4GSaVlLi8SdRY/srwK7zmir58XMdljMTRDXXwHIwK9?=
 =?us-ascii?Q?sWvTugp/G+E+KBxw8BXkiN+doDvGpdiI8B5NWdcd2VYacIHvWVQE5I9YmJ8h?=
 =?us-ascii?Q?gLD2/YQup8lgX+7UO1H4U3WkOPz6mE8XP7lfObcQH4qEyYMHkTL+Q0PRGnPJ?=
 =?us-ascii?Q?G2A7UcY3XSvTlsNUb6Tz5ZkSG1IzH9sSi8kmlPOiZta/oD3INCf/uer11oy0?=
 =?us-ascii?Q?0OiJ/9QGRInfNXkC0U1N9HGcaiADREurWsptuf29JvGdujk6T3kgPrEdC8Rc?=
 =?us-ascii?Q?2XEps/QZeLqLCGoxo8GsVVRRlHbPlyDO7/DXElmdZZiyT+iHRfbmDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR03MB5299.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WzzyeIMVM6BmvHSg4qWLA9RUm/VKCC2k+tHIYoSmuuj1CVOkV+5kY9jKWtYG?=
 =?us-ascii?Q?eBBfqkuYNt1Sd7EcdcCOS+21k0zGtfzdr+bn9iNJsfGdqOlUU6cbIWEQa9PV?=
 =?us-ascii?Q?N+GCWIgO/5XwfQnaD7nUGjgE1RSkzzQ8M7TBzJFkUyQ2NkWZN0BWipJ+PVdT?=
 =?us-ascii?Q?+kA6x51Vz/Mb84y8dXBF2+XaX01yLAy804YeOolaRVxbNKIlk4pMByFVyxgs?=
 =?us-ascii?Q?4es4HzF0L8RJxGYYnDMc0lCdHNTOgaIBVWze96gmHWYIZGiv9fgZsv5IO2VF?=
 =?us-ascii?Q?w4wjfNl0rQuEx+QJCZ64ljSANdYTQyoEv9ed326nHZmJSX9AImMB5OXz+Yo5?=
 =?us-ascii?Q?fhjQA8H4qdQGjMix8mCHtW9SV0WUp6qg7HMOX5LF7lFI8oAdOBb9mXxIJqRQ?=
 =?us-ascii?Q?1MwSE2kTHZK2t3whq84XhqAmESq7D4qLxvE0z/v3/BjIf3xqp4zEz9oiAm2y?=
 =?us-ascii?Q?AkI+4272HomyK/PMNyhPmPlfLhGEH9dQy70Gq1iQBB/nREhYGXszuvlSifKF?=
 =?us-ascii?Q?9QcDILw6GB6YQIOBHxmenJQRnwJhkDQpfSnA7ItGY1q++Lzu9vh3bQufYwYU?=
 =?us-ascii?Q?yfmEUNrFq/s9nHR+q2mnd9f4oEflZ0feqdEuyc37H07mY7YFv5V0yRg7+/CM?=
 =?us-ascii?Q?db3UQ3GXoYBhitM73CF+lXTvR7bSE3FTtDWBPLjubTFRvtbp36hcT4xQrKEK?=
 =?us-ascii?Q?k+LRRJyZjsN0uEo5vbdgKlUTEc8EWVqLWz7+Ivgvxc3fFZ+lFt/RA5XpMs/C?=
 =?us-ascii?Q?ZouhLJx0Z/ZuzPD94/fko+xHhkiBd1ysd1tkmGmIKLQKxkkrS0rzSYGLVwMG?=
 =?us-ascii?Q?8/wKJVgbkqWtrMbMt6cGj3EgthWhaN+jhAe1q9XpCNJldVmy1G8S+1fbx6BC?=
 =?us-ascii?Q?yd1eQyIdFPeaVtw2bDC5t4rO/ctuCCRfueFFCa91CNvokk2ibl3slaNl+nKv?=
 =?us-ascii?Q?bWR8H59Rli7yPZfSxMOIZiUIvq2mIe8R8hfjNbKJtixdTCdHx+NVJKExhWbf?=
 =?us-ascii?Q?FL3mfwD9NNrBY+SQgyPZKT3QrXE/Sc4uHap4NDbllAyiA2ijEEKoeWkPH2kk?=
 =?us-ascii?Q?82XBt3oRqsmUGZRLPRsNh1VGBz3IhMwOi2mXH4X1wCYxDg4tUjY78SasMoO/?=
 =?us-ascii?Q?329faY4qH94krDCUss9iuCaDyMU3NoIUAUIf2SJn9Ml4lBwMfulruQluGWdt?=
 =?us-ascii?Q?ACzp8CoQTYxMB8PIR5MLFZahrpunVsRvneYVl4MtomsypbIeYdvJfSAkVjwY?=
 =?us-ascii?Q?lnR1x+jQYHrlbdAhLZnpjpLvw9ZRu7/VwCn4am8/EpuQj38UZqOFlptN1+LC?=
 =?us-ascii?Q?xggeluawYF3Kh4HNPCpiOqzJ752AWqztlb18f9IentG/irLUcLbRJBEU2sFl?=
 =?us-ascii?Q?u/6dLVBAlqluC11bLM09voywllsGVYK8nVRWkM64XCvkuqoaHUGXHexMFReo?=
 =?us-ascii?Q?t/gcmDQGK/hVFe0NBYGdIKhFirys/LToLKJTEuDsBhbQXx5zpWQ/PA0BId1E?=
 =?us-ascii?Q?dOC1ENXvGHefHAVasXno34qasR0JOdh31yeQ4n5kY4hu5QdtjxyyHOkhpQjh?=
 =?us-ascii?Q?w07KLqSSBpqUx/W9aLLDYDnNvbGDc1V2e7kn2bPa0TfbVdqwqJj2F6uHlVjR?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0278b1b9-91ef-48c2-2b02-08ddc338d19c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5299.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 00:44:56.1641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3unP33wNXKBpfXuB+GrVF9GAl9NlUtkOJKHOzYWIx7zNMZJRf0UVUzG0gfpQtObBI82HpsLSwLdYWvY9k1QJOxHlotSBEoQMg31HWdIhDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_174501_527935_DE6B4A18 
X-CRM114-Status: GOOD (  13.56  )
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

From: kromli <khairul.anuar.romli@altera.com>

Ensure that the pointer passed to module_put() in spi_nor_put_device() is
not NULL before use. This change adds a guard clause to return early,
preventing the kernel crash below when the cadence-qspi driver is removed
during a dd operation:

[  200.448732] Unable to handle kernel NULL pointer deref
erence at virtual address 0000000000000010
[  200.457576] Mem abort info:
[  200.460370]   ESR = 0x0000000096000004
[  200.464136]   EC = 0x25: DABT (current EL), IL = 32 bits
[  200.469527]   SET = 0, FnV = 0
[  200.472609]   EA = 0, S1PTW = 0
[  200.475904]   FSC = 0x04: level 0 translation fault
[  200.480786] Data abort info:
[  200.483659]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[  200.489141]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[  200.494189]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[  200.499500] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000185df8000
[  200.505932] [0000000000000010] pgd=0000000000000000, p4d=0000000000000000
[  200.512720] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[  200.518968] Modules linked in: 8021q garp mrp stp llc bluetooth ecdh_generic
ecc rfkill crct10dif_ce rtc_ds1307 at24 stratix10_soc soc64_hwmon gpio_altera of
_fpga_region fpga_region fpga_bridge uio_pdrv_genirq uio fuse drm backlight ipv6
[  200.540016] CPU: 0 UID: 0 PID: 372 Comm: dd Not tainted 6.12.19-altera-gb6b26
c4179a6 #1
[  200.547996] Hardware name: SoCFPGA Stratix 10 SoCDK (DT)
[  200.553292] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  200.560234] pc : spi_nor_put_device+0x30/0x60
[  200.564594] lr : __put_mtd_device+0x8c/0x120
[  200.568856] sp : ffff80008411bc20
[  200.572161] x29: ffff80008411bc20 x28: ffff000185e2c500 x27: 0000000000000000
[  200.579282] x26: 0000000000000000 x25: ffff000185e2cb00 x24: ffff000185e2cc88
[  200.586404] x23: ffff00018034c620 x22: 0000000000000001 x21: ffff00018873e080
[  200.593524] x20: 0000000000000000 x19: ffff00018873e080 x18: ffffffffffffffff
[  200.600645] x17: 0030393d524f4a41 x16: 4d0064746d3d4d45 x15: ffff000185757700
[  200.607767] x14: 0000000000000000 x13: ffff000180045010 x12: ffff0001857576c0
[  200.614888] x11: 000000000000003a x10: ffff000180045018 x9 : ffff000180045010
[  200.622009] x8 : ffff80008411bb70 x7 : 0000000000000000 x6 : ffff000181325048
[  200.629129] x5 : 00000000820001cf x4 : fffffdffc60095e0 x3 : 0000000000000000
[  200.636250] x2 : 0000000000000000 x1 : ffff00018873e080 x0 : 0000000000000000
[  200.643371] Call trace:
[  200.645811]  spi_nor_put_device+0x30/0x60
[  200.649816]  __put_mtd_device+0x8c/0x120
[  200.653731]  put_mtd_device+0x30/0x48
[  200.657387]  mtdchar_close+0x30/0x78
[  200.660958]  __fput+0xc8/0x2d0
[  200.664011]  ____fput+0x14/0x20
[  200.667146]  task_work_run+0x70/0xdc
[  200.670718]  do_exit+0x2b4/0x8e4
[  200.673944]  do_group_exit+0x34/0x90
[  200.677512]  pid_child_should_wake+0x0/0x60
[  200.681686]  invoke_syscall+0x48/0x104
[  200.685432]  el0_svc_common.constprop.0+0xc0/0xe0
[  200.690128]  do_el0_svc+0x1c/0x28
[  200.693439]  el0_svc+0x30/0xcc
[  200.696454] dw_mmc ff808000.mmc: Unexpected interrupt latency
[  200.696485]  el0t_64_sync_handler+0x120/0x12c
[  200.706552]  el0t_64_sync+0x190/0x194
[  200.710213] Code: f9400000 f9417c00 f9402000 f9403400 (f9400800)
[  200.716290] ---[ end trace 0000000000000000 ]---
[  200.720948] Fixing recursive fault but reboot is needed!

Fixes: be94215be1ab ("mtd: spi-nor: core: Fix an issue of releasing resources during read/write")
CC: stable@vger.kernel.org # 6.12+
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
Reviewed-by: Matthew Gerlach <matthew.gerlach@altera.com>
---
Changes in v2:
    - Move the null check prior to try_module_get().
---
 drivers/mtd/spi-nor/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ac4b960101cc..4fc44455f94f 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3210,6 +3210,9 @@ static int spi_nor_get_device(struct mtd_info *mtd)
 	else
 		dev = nor->dev;
 
+	if (!dev && !dev->driver && !dev->driver->owner)
+		return -EINVAL;
+	
 	if (!try_module_get(dev->driver->owner))
 		return -ENODEV;
 
@@ -3227,7 +3230,8 @@ static void spi_nor_put_device(struct mtd_info *mtd)
 	else
 		dev = nor->dev;
 
-	module_put(dev->driver->owner);
+	if (dev && dev->driver && dev->driver->owner)
+		module_put(dev->driver->owner);
 }
 
 static void spi_nor_restore(struct spi_nor *nor)
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
