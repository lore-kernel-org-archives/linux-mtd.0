Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F951093168
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Mar 2026 03:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVMapF7qOrOZ28tNaxPDXWd1kMRQ3SQFWS3A4cQSZx8=; b=bJZ92thRuFjOZ5
	IODGkJ5PzdT4tNFWl0aYmM2wPkGnBXWFSympr47aWksm6LkcZr1DoetR7FBIofItQtmPY3HjYWZWX
	hrid5hRR2DF1hyNKDDOnlUeZP4SZGfw6YDjmvLwj6GDlyzuyCQFz4VUtqx8D7CW9Re3MmFcIDP23C
	ZuWu7d2G2v5/WKq6x/AyYAvtI0LiZClLeBwn9DtZo91wZk2WUhNNZMe0VE8tSHAzo3Vr30mUXVDbM
	XojOMSBgE0iCrv5Eo9W8Q368tEE2KWVbSA6xCyw+kGwQcuWVUy0A035W9dT8UBGPVLle8mJMjNFr7
	zL2P/K1Z5YFfwqu+99kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QAc-0000000BxGe-2KqQ;
	Fri, 20 Mar 2026 03:05:06 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3QAa-0000000BxG4-0Mvm
	for linux-mtd@lists.infradead.org;
	Fri, 20 Mar 2026 03:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPHo82khyP+OFd75Cpyu2SIyLuzsh2X9+Fn4UMRIERkZApepCRc/HBTj03v++E7DzoPkNz2vbMb5bQiiGXbGzFnrKY+pjL6xLvLfqEC+Q7cvWQJfBDVb59wWd1vzk1IIHeoCgVHA4ZWRUAJO9KCH6DMVFII9BpdqMuda0q6CniGfSIsWdfVfMwcz7QqG7LTMjkSFzk0MxTOxkK6iumeaWa38xnBdyE3MG8Da2WCYrv9Zkh7u4/HcK9eEmH6xj2geum09Ab5kxfmFSz5f49AZazEDLoaLaW3Ft1usUgK4BcTPpn6XFZTqqc1B0o8oddbcgMJJw0+yfxYhRKirCmBoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxTCcQoraEwMpOVZotKHgOrjlYRsX/skDB0wJCOQ+oY=;
 b=St1D0ID8pow/6W9/WLbwrkc6Zmnzf8CxYwzpaNh6+1muYXEbNu2ZOFTnw+xKLXpZ0jJy/T+J+YmN2O/TkACWlCdhJVkUlIJGjOJbkWl2AFbg2nlhqb+i1AFiggo3ApnHJhfQj5UntceR0oEEkvcd7XlyIn3pKbPzqmANN9qvkaKn9PtPwITdjK84wUPfmnJHInz5iOQklklHqtGpJtx4VJ8nKSqf7FkO+OYaTc0sDPQBLW0jksG0LgIbH6VjVZb6TT6X1PI8iyfuR9PnT7m09tQkK/r5kqv9PmtFa7LmgbgmN8L/z64ep7wyO2WwoXMNw8+P3AvY4r4lhqmBPhpZvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gigadevice.com; dmarc=pass action=none
 header.from=gigadevice.com; dkim=pass header.d=gigadevice.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gigadevice.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxTCcQoraEwMpOVZotKHgOrjlYRsX/skDB0wJCOQ+oY=;
 b=nMQmpcnBCWKWji2EpvQoEv1l5ITaJwha3w5EHVNhwDjy7mbzdTzCseMOdrH/rndH11lCO3QRU5Da9qRRUO4aF02DG/Fw78O3CClmmhyOB02DWheczQFUYzenZVvOnvdJuygDFj2Wiq0seZxKE2gstz9npcB340nR7qEWQN5L/gI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gigadevice.com;
Received: from OS8PR06MB7358.apcprd06.prod.outlook.com (2603:1096:604:286::8)
 by TYSPR06MB7305.apcprd06.prod.outlook.com (2603:1096:405:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 03:04:56 +0000
Received: from OS8PR06MB7358.apcprd06.prod.outlook.com
 ([fe80::7663:8299:6284:bbc1]) by OS8PR06MB7358.apcprd06.prod.outlook.com
 ([fe80::7663:8299:6284:bbc1%5]) with mapi id 15.20.9723.019; Fri, 20 Mar 2026
 03:04:55 +0000
From: Victor <vlim@gigadevice.com>
To: git@amd.com,
	havish.mutya@amd.com,
	marek.vasut@gmail.com,
	tudor.ambarus@microchip.com,
	dwmw2@infradead.org,
	computersforpeace@gmail.com,
	bbrezillon@kernel.org,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: vlim@gigadevice.com
Subject: [PATCH V1 1/1] drivers/mtd/spi-nor: add new part numbers
Date: Thu, 19 Mar 2026 20:04:30 -0700
Message-Id: <20260320030430.14064-2-vlim@gigadevice.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320030430.14064-1-vlim@gigadevice.com>
References: <20260320030430.14064-1-vlim@gigadevice.com>
X-ClientProxiedBy: DM6PR02CA0125.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::27) To OS8PR06MB7358.apcprd06.prod.outlook.com
 (2603:1096:604:286::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7358:EE_|TYSPR06MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c211e3-8c33-4822-ea87-08de862d76b1
X-LD-Processed: f84ba339-959c-4ab1-9b67-1e43414f945e,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|10070799003|1800799024|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: j8alKlMpJLAKnVvRgQo4H5HKEbs/LAdVKFKgi7ORwtWWAXZosZ6btorq/zq7CBdO0TOAsFaIJdYARSlWZOgRGDHbckV1thkt/LugJjiQPEvCbC8CxIPyXUmgaRsSnX/zxaCcNfy8kAJinLaKyqCF5ghLEdzdnw1t3fZt7F2E0bBGdCtd3YYhLp7T5ut0zuEemxEeuflQvId/aaP2NUdjNgt9etd+nSy/T5A0rlVslO/dPJ2xFLRaXasZWgt7CX9JZswfyah8gOJ5naOgKhQRoxAeIubv0W0jjFJU7+25E9uKjQLX4ongxBknJPcr6oe0iGIPbPbn0k1n4JrqlHR+PBH4ZgiyPN4bKc4qAStmrAxSgX4qf5Vk7UqCYH9Ryo+T6u1rNJmJHnhGY+FNceUPrbH1CmO2k1b6kSp41AEl2XL255bCwt5CiZz3Kp7pU+/27XcJBoebYTnOV56ADwe/WtvpvtXhDkEctyaPdoOHs/pmHTuDhsi8DjM5u4oaAKWAOzEAH6ckXEo4zvmbmWx04FZYsJp9haftTyoIkXk3qKbnsvimqsvTUJJUl08IwB3HPWw2IUcjQSR5BQBC70IHy+0Rx9I+MfdKmt7LCSInIrM4kKvbhZWTw2nlkdReUcxj0m8efJITOhSSnJo1BH0beCtiPheHZVEe+RQDkCaqA1tmucSW/ZnavzlVrr9wOfCya7TclOsDtvs5SASv31qxQc4VZ7QfEgE85qIgJQrQq5yGvpT2iqWoRS/Vu9s7SyOGCocYvPyzbipLNJNl471xfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7358.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(10070799003)(1800799024)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pOTNsnfBffzWdowlrhfUi36feidkAiM/YRIdvYVSWzQYIfsPt0BjI5/eanam?=
 =?us-ascii?Q?CcQ2GVE+7Wqtpr3O+MoC9R9096edFAxMxdQaANoHtwzFtE/0B92CHTFnrQtZ?=
 =?us-ascii?Q?Jm+gMi33beV3vSyL8bvcbKv9XqkW4ngiSm+Qv9OwcYLYVkY5CONvD9XyJRqW?=
 =?us-ascii?Q?MCLOcXpI+CYK3+jgaT7InegY1SFUNwmvEFMw5+zsoCp6eXgyPaAY222b94cT?=
 =?us-ascii?Q?LqYZMKBxi4wduKpZy4BtbPp2Pi2d1TLIQPnOqPOXQ5aJa3cRC6KV9Ldm4NnD?=
 =?us-ascii?Q?Zqv5REGDWZFiI3ftFCE69Du+dYPtF4ETPoAcF9z7hw62MN4iHpw/sr76usnU?=
 =?us-ascii?Q?nD/raX0ngd/nFy7LXyBlTpuGqalLeHYIrDBf1Z82REmnKcXbZcXcRRtaUtU3?=
 =?us-ascii?Q?gbgZqkTQDqfrSItQOSbjDFpjSkmshCZca0QmO3WsvY5LalZC/HNPz7LCfKB8?=
 =?us-ascii?Q?6WCN7VrKQN+3qdYlt23Kw2LJhdG+nn/CRUSbCpXc8Dyspk7BW04e6bBrBHst?=
 =?us-ascii?Q?NyVbCtXMsLVxyNr76Tg4H2ohl+bS9HKc5rCZoSBg4nvFl+sJs9rLiGs60/kC?=
 =?us-ascii?Q?LqxY0xf1TJDga2DP0MkZAr+GJ3LLsmAmnEUnSgLPvhOPqE8tB4RPPIDI1MPE?=
 =?us-ascii?Q?Klzb/6MCrb3VvF/dvOat8Ra7yRZAAGsV+2gtJSX4yxcJqf+WQuTycwbZnXkX?=
 =?us-ascii?Q?X5UZRuEQop4YXAHMkun3Jo5+/9tdJjAoiv/AbhLfGWkV+kE5Unj8a412DBI3?=
 =?us-ascii?Q?wRrPZwZP1pudDVrlXzYBjs23juWzPs3g5P6144MiQ34SlE0G0VHiyA6Sij+n?=
 =?us-ascii?Q?3AuBGaxWAoWAALRm/NnbYMSSs3i1VMxVjAs564oCdEYtFJM1QMslkpASPdd8?=
 =?us-ascii?Q?pXVwGpanqEqSRnGqmZ8YNPUddCHnp8WIqyTlwZoYF5TJOtGkkZbmLGch/Rkq?=
 =?us-ascii?Q?VOKDqVluWIzIyFDeokajlbyAzxoL/eXHMEmsfoj3bKmdD7dNLox4ba6kUtHQ?=
 =?us-ascii?Q?G/wEv9BQOmLuZ+y7+8xTcpE+pjXrRlFALbFofxGf8SnHtAp65S6FX+TcOBvw?=
 =?us-ascii?Q?CiQTt7EiXj+a5zP1bMajrE22s8babMCPOmwjsXgbjYNwn40UymzfawoDpg8a?=
 =?us-ascii?Q?5IuWriVfZaaJUXh6y6qkgrLPynwb061xK5gyd02bbNE8lp79gCaKCr7UsNle?=
 =?us-ascii?Q?V6QFjPEg8f5ynia3l1X9xALFke2Jy+IA+c1VmJVBSTNeZmZ1RZEMtC+TAFtn?=
 =?us-ascii?Q?mPIchXb8z0nfZGc1KutLk7sQyETJsJliRoP7vYfPuN7ysd0MBa4wmW5UXU3f?=
 =?us-ascii?Q?yq6y6LWmETOb0Xl1lgkNgNt2MsG0hB5SBzeXKR8KMTKLjT76Jj4BVtClaxrA?=
 =?us-ascii?Q?CNJ7O8Chv6T2dS8nSnYcBmYIUfxsP1akMtjSnK7at5zIO4W/bRDm+8K3Z6tW?=
 =?us-ascii?Q?6nEJDeo1kLdgCPKX0lfPKazgt93XOCojcHv34XO9a1SAzGHV7+a6FsQDaviC?=
 =?us-ascii?Q?c8TSHZ+ZRO1wSF9po5JzKlpI29+mwIy6rbBYfwQKPH7b6xcJ9MpuKPsoGkQr?=
 =?us-ascii?Q?bkXxcqtRDa2dP+L6sNzfDSwcdFGeDBCqLIuOrni2YF2jOogEbmtlAi00wTPG?=
 =?us-ascii?Q?U5K2ekkAEELWlpSJZANyD10VcHukJ7l8PaXr7ZPPPHlHynCkcCdIi2MN9iKP?=
 =?us-ascii?Q?+SH4s7Ue+YhZv+BeNizKtIAUGOuoFThmHgKr6qXGbxaAF5+9ZHn7MxxP3sG6?=
 =?us-ascii?Q?YJvl62RoAHMPzrYRRHUIN/48faLGDq6x1otFTh0nLxAPoRGLGltwxDXtjrS5?=
X-MS-Exchange-AntiSpam-MessageData-1: MUhxOWrYtzb7zw==
X-OriginatorOrg: gigadevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c211e3-8c33-4822-ea87-08de862d76b1
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7358.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 03:04:55.8700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f84ba339-959c-4ab1-9b67-1e43414f945e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDiegOp2IBhoIvSqJTnXTinCaLhVcUyWEFgezslTP8DnmX7IPwhj8awcOthQoUrvYIZwGB/vrucyd8TXJtz/QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7305
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_200504_138270_DE407D21 
X-CRM114-Status: UNSURE (   9.48  )
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

These are part numbers added
I can send the datasheet through email

gd25f64
gd25f128
gd25lq128
gd25lf128
gd25f256
gd25lq256
gd25lf256
gd25b512
gd25f512
gd25lb512
gd25lf512
gd55b01g
gd55f01g
gd55lb01g
gd55lf01g
gd55b02g
gd55f02g
gd55lb02g
gd55lf02g

Signed-off-by: Victor <vlim@gigadevice.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 96 ++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index fae147452aff..2c7675eca733 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1789,6 +1789,11 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25f64", INFO(0xc84317, 0, 64 * 1024, 128,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{
 		"gd25lq64c", INFO(0xc86017, 0, 64 * 1024, 128,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
@@ -1799,11 +1804,100 @@ static const struct flash_info spi_nor_ids[] = {
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
+	{
+		"gd25f128", INFO(0xc84318, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lq128", INFO(0xc86018, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lf128", INFO(0xc86318, 0, 64 * 1024, 256,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
 	{
 		"gd25q256", INFO(0xc84019, 0, 64 * 1024, 512,
 			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
-			.quad_enable = macronix_quad_enable,
+	},
+	{
+		"gd25f256", INFO(0xc84319, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lq256", INFO(0xc86019, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lf256", INFO(0xc86319, 0, 64 * 1024, 512,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25b512", INFO(0xc8401a, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25f512", INFO(0xc8431a, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lb512", INFO(0xc8601a, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd25lf512", INFO(0xc8631a, 0, 64 * 1024, 1024,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55b01g", INFO(0xc8401b, 0, 64 * 1024, 2048,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55f01g", INFO(0xc8431b, 0, 64 * 1024, 2048,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55lb01g", INFO(0xc8601b, 0, 64 * 1024, 2048,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55lf01g", INFO(0xc8631b, 0, 64 * 1024, 2048,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55b02g", INFO(0xc8401c, 0, 64 * 1024, 4096,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55f02g", INFO(0xc8431c, 0, 64 * 1024, 4096,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55lb02g", INFO(0xc8601c, 0, 64 * 1024, 4096,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
+	},
+	{
+		"gd55lf02g", INFO(0xc8631c, 0, 64 * 1024, 4096,
+			SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_4B_OPCODES | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
 	},
 
 	/* Intel/Numonyx -- xxxs33b */
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
