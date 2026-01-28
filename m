Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D451D25B52
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Jan 2026 12:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gq45yZEJc/3g04tDnq2oC0Z894vToyOY88Sj85e2stA=; b=uYj4SHwSoQmA4L
	LAZ1WE9T9nIsjJ4LISecJw/jCjUPTt0fNT5EsRz0Ze6aXiFhYdGCONAjJtsa6fzlr4Yv2inbr3lig
	K9WevQV212Vx3Uc+jjIZdBz3AzxSNwwQok3EZ+xgVXqskt/JHy67r3/O1syddD796T8nCZ4kYLXiC
	EZ2i/cTnlGydIfgzbch/rpaMIoZN51EJ5AXMkR13wgHe99WfBF1sODg2RYTBi69f4e5dCVoHUgwBt
	1eL4JYAmMMIC+DYAghEQrowpRMYMAv0nW2s0RcA94sz+JsqFZcl4b14h3nfmSyFNCELMUeIEqWsY6
	CLtlllrPknRZcZdE0clQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4uO-0000000G0z1-2gao;
	Wed, 28 Jan 2026 12:44:32 +0000
Received: from mail-japaneastazolkn19011029.outbound.protection.outlook.com ([52.103.43.29] helo=TYVP286CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4uK-0000000G0yW-2JDb
	for linux-mtd@lists.infradead.org;
	Wed, 28 Jan 2026 12:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Use8Ee+XkjwFz68hruPGzfB6hl/V+6KglPhNc17c6S7+lMVUXg4ZA2h35yBZ80/gG8of4Cg29TE95jDDpyUI+w88dkq1qNzPs7al4/CWI8fcn5FikQmcTCBKyRI0nNBd5wUo2AXvVirjuWvj/VHRNgnJyWJ1k52hDibsloW1ScjxbectJ/St8LDbpx6ILMh7308UxLjbcRoOEOH0BrU1nikKbp+YbNogTK9I6Jvgoy0oUjxiy3Ei+p9eEExK2FTBWVgcFBjf27Z5s8GTsQeJ81S/WEKLnXjXdkEr9xvkOfQMMka9rTQlI5Y4oBDlXvk/QFeauZm5eiT6R/vlG9GEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDAMbWgEIcsz0/HpN/W48xZr+NRUtqAZqgU84LS7ebA=;
 b=F8C2I8C+LpfoSypts/YXcMWis+Nm+xLbJl8f2P2oYi8kB/2HdkLbD8HJ3hOsphtTw25NYZIG+UWmK9/kkiSOJLdNtMDCkZEhYtKeN6GtbnPRGOlJm2yRnah5gD3Cc7h484EfDUIMmipXaD4LAfBzbjgd2KvA4aM5GlY8n1d/AT/GdYRM3EX85uP8dM44oRPxCzsZqquAk1ogI2kZ7DcCl2Fb+nCu6LK+am86lC2f88YnMGlKNQjYVHJDCFoD48mwzWQsPhQ1yBQApsqmRPjlYzVwik94hwUHFUexuUdm39TqfnQkcLQF78MWtiLq+YDk3N5qacyfcyJf8XhS/WX89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDAMbWgEIcsz0/HpN/W48xZr+NRUtqAZqgU84LS7ebA=;
 b=iyj0xwrq6n9m8v/yOB1+zcurT9hxhBLEq7bpzZ8Iq+WrOuh4R4rdSTRgP1kAeoNi/SZIGdjwFtJ0kqwQUzev7Go/3bL0MZMAzZRqsCDWNGHnAlYBxNmU2rQ3ELLnSlxdEw+VSO+T0BoQc0Wf/pyYf5LR1S5kyUPZzXJgkDfd7s2HU8PxkeBhu+W0MocBjX75ZHv6bO2ukiSSMfOhpgA1/tj5/qK82wP9mi0mIft+6DMDvDdlqvEXBjzHx2FU9Ow18JJZLuRKolnQ1E/51Y1UgNFgOlUTJtdFJkGTXT5jJdeUsptJ7FF+PMltBxKXRj1kCz4MXtktYzwYc+mc8YJjjw==
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB13642.jpnprd01.prod.outlook.com (2603:1096:604:37d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 12:44:18 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 12:44:17 +0000
From: Shiji Yang <yangshiji66@outlook.com>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH] mtd: spi-nor: swp: check SR_TB flag when getting tb_mask
Date: Wed, 28 Jan 2026 20:42:56 +0800
Message-ID: <TYRPR01MB135884849485DE52A81D94965BC91A@TYRPR01MB13588.jpnprd01.prod.outlook.com>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
X-Microsoft-Original-Message-ID: <20260128124257.10202-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB13642:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a1e5bc-4fe4-47de-502b-08de5e6af2a7
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|23021999003|19110799012|5062599005|8060799015|41001999006|15080799012|461199028|440099028|3412199025|40105399003|53005399003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f9cauak9/woGCJiAmfLHPuLQr1mjy+ZITy8RPD9OM0Zd300QmSOB23aD8RrR?=
 =?us-ascii?Q?wA1xVaRdb/w/0r6OqDdLLTcdkaBkHBfC2XiG0lHmn61y+DbOSlQizcaZc8UE?=
 =?us-ascii?Q?ViYx0FbR4OAerW8hMNGJCC6un0t70aR2Ia/AJ+7nfvwBo8gQ71Xx2HywtgyC?=
 =?us-ascii?Q?HiX1IVmKkszRe4lbYhS4covThAJTRk+qmto6X0nxpYbXbTGpWxrEH+ofFtFI?=
 =?us-ascii?Q?WnWRpwccEAZfiAuLgkyfODFS7uNWHmCAJCjwM///Ln3rWb8lgeMJTDdn24Sf?=
 =?us-ascii?Q?mPgj9gpvc8t303lUGjZtVHzRQgPphSNZh8AU5KHvnwR02xPQm92zC2YeQ1gF?=
 =?us-ascii?Q?MD24ZWPG6YmeZDP2ZxMf+NK73qWLI4tZBJ0v9s0E4Lmil/qIEn0LmJt46evS?=
 =?us-ascii?Q?lwsYpsIKxbVk8jbj2pOuhfOo5XT6sZflsqw0gbfrvwdrKAtC14qEQqAN3W+R?=
 =?us-ascii?Q?qik6+EF8l74ZipQ543aoo3TtG3fpPI8fs18hY+YioikG5Hf/pbOb2WZeYlVp?=
 =?us-ascii?Q?n2cY6m5FS/NzDSRa0/DWIf9bwHxfNa7Etr61DJ7LMeOn5UWywkjS3kyUVTiR?=
 =?us-ascii?Q?xuLIgbjCdeQkcfTwLFe6wl2/l75lj3X5L1espfZvagG3L/mgTpyozrVOvjai?=
 =?us-ascii?Q?kSL8C/LQqlAwKcCGit2Aq4HoI+VuF+kmhNq9pOLpPN4ciYtuTWgkJjXQUXSk?=
 =?us-ascii?Q?6qsD0b8k+cyV6TMoqdRX/ZrU3VAQ7qVQlOM3p4wfRSmGenIS/t5cKI8q6Jwq?=
 =?us-ascii?Q?wsfP1bjP2qeK1dicPrtMK7t3CX6hTKaShjNjEZqbWQdbvN+6V4sgyBrUeifo?=
 =?us-ascii?Q?y5ZayUJL5MaN5VjAqhfvGezEdYnhEL3bhotdg8bFVbsdNQPjX91DqjfLa1Mh?=
 =?us-ascii?Q?gTVBRF0djJmKQnWghn8xzTPZn1VGF4oBWu0d4suecS/AvxUJaZERBNr72kKD?=
 =?us-ascii?Q?zyU9gLPGvjrLLR2hMrBl+N+4wS8jVUfberVYpaXH1zwRV04vnOVaoFXs62xd?=
 =?us-ascii?Q?T2/f6WE86qvc/bvNJr+f1H+sHAiKuYZwd8+HqRtIuJxsHoVQGoXK2MO5qK78?=
 =?us-ascii?Q?1phmZHmXTkzRmB4qYwFCBQas38rwx9WAvcGGDJNTgHhGL9jwR8K61H/5Z+Du?=
 =?us-ascii?Q?d8kTwyM91uLlFsUFqB4/XDeUlFpoeFW5ecdkbkf4qD7klCFCwWU9JQQCRGdj?=
 =?us-ascii?Q?fXMoQDqsv+Sf2wr8z44aiEGTqwRbKU231TdHDDwB2p0JW4Ho6FeQALRl7pMc?=
 =?us-ascii?Q?xdcwv5NqdlrazeDbkmIZ6L3mHP0tN8fy0To29DN/iQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZwX+11FRpwA9x0ywYVLjaVaZFRKfZIEt7x8xKcEvwEU/erVU4KYR2pBU6mhM?=
 =?us-ascii?Q?xufN7qUBFfKzJYMxVQqExv3pvdsaxoX+eK4fNtUPldYlWRdsqZzbMjgzv9TJ?=
 =?us-ascii?Q?B3iexiur0qXvIKrA4Ffv36eUQSKAZSwFuojf5oKNpIWa+8RFI3Vsfc44RDos?=
 =?us-ascii?Q?q1VMeYyx3NSqiLAOQycdYqV0fL2QlOihJ0UvEJHT7+vHQdpeYFP4LSFbyzHs?=
 =?us-ascii?Q?+Fp+3Rgg3LCr4pi4IAj09mJi8hCZO94tiNWRzRJfZ5a/FKzMITKhOsZjdkuB?=
 =?us-ascii?Q?KxXddZI2jjDjjAJTaIogUJC2wQF7CvZ/6oAZi12XH+UYYMfbqPy8FslUa6O/?=
 =?us-ascii?Q?NT5Muv4aq93eU74LHD1WV55iK0uUuBeMls63MgHJPh/a9DcUUIClRVJUm566?=
 =?us-ascii?Q?TudSmcWVbrvq9WIUGcEDoFzXP+dxH2Jg9gNjRWZXUB18rpv5LoQ3kFy/ryLi?=
 =?us-ascii?Q?aMHsnC6gPCbuZXSv9qTVx/80S32rTIY6els+iGVUongq+9gCcB5ql9ceRZJk?=
 =?us-ascii?Q?9ZlRVLFz3hQVJZFNJN2SqONU3mUkwV1+lzVBpvFzffXkJChugMa1EZJ26LFx?=
 =?us-ascii?Q?wPv7aWkaug3B7gXq3lQK1aAeOoxhJZLoWuFK4iSp6BhN7i8GLhzwyEYxT9Td?=
 =?us-ascii?Q?dG2iRi3fH26hRVnMk56VcXNjvcjvqKOSt7Y1ETqSCx4z00ACnWAm3VOpQKip?=
 =?us-ascii?Q?r5wKmkrEnJVEQHm38l2dx/yR61TMl1hppLfgVQeZSTLvbl1kaI0wpzTl94sA?=
 =?us-ascii?Q?B1XG4/l6jkc73Ed0wjN8oX+pGMsVm+IYq1NdbowDNzB6piCJbA00+GgakA4A?=
 =?us-ascii?Q?vooa3G4T0tsJgxFOoIODF5UZQG2O7BUwK+MFHKfJsd1ZYhOK+VhR0orOyj+E?=
 =?us-ascii?Q?4wobYxrX7z8zHYrZs8Hfe66v1jWElAZXtjDWGU4T2RLJz6ye03EDIYO25Gc7?=
 =?us-ascii?Q?F1GoN/wO+S5oZvXjYqft6vAI7DqZdyVhzkBVTm4Y2l0SCflLl3EdEvDQ1yUP?=
 =?us-ascii?Q?Da8pQeFjXvVgHt5vF+45TEB89Z9vb5SS3la6aqvdyxPzjoOm9Pu+yX9oXm2L?=
 =?us-ascii?Q?mh/mNnsF2s2r/K2g6HN3CMOzRielJknbu6xZk8X4wV0xg8M0R5JbiHdOnLEn?=
 =?us-ascii?Q?LNR9Wiw9xv/7EeXrYwnefqdeMaxueh7s/nsF9mgcDD2RDHE8x9U9B0lTBcO7?=
 =?us-ascii?Q?C3qMYXfDJFmUuK5wtafCe1SxBMtctMT4h1mpI3+/TtNzO/qiavqLK+Y1go9N?=
 =?us-ascii?Q?yFyEXfnsFqpJ00K1iJrYROa6HtF6u+zI/fLFAvQCv0w9DsYYIvOqNL+dvY3P?=
 =?us-ascii?Q?tIutI4bESXA9fqDdb5O0jN7XpCiI6yHGNe2EAXU8tviQdl9svQPkm6sOi7Rt?=
 =?us-ascii?Q?uXgzmCfNTUMvhKqI5pxcx0CBNMfL?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a1e5bc-4fe4-47de-502b-08de5e6af2a7
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:44:17.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13642
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_044428_598928_2C7E3DA0 
X-CRM114-Status: UNSURE (   9.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

When the chip does not support top/bottom block protect, the tb_mask
must be set to 0, otherwise SR1 bit5 will be unexpectedly modified.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/mtd/spi-nor/swp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 9b07f83ae..e67a81dbb 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -28,8 +28,10 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 {
 	if (nor->flags & SNOR_F_HAS_SR_TB_BIT6)
 		return SR_TB_BIT6;
-	else
+	else if (nor->flags & SNOR_F_HAS_SR_TB)
 		return SR_TB_BIT5;
+	else
+		return 0;
 }
 
 static u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor)
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
