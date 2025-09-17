Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01248CAC59F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Sep 2025 21:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ogOdXpbCtB1o7PlCuwD4z8ynBU1XJTkIcgV8blBCGg=; b=q4el3Xd4/QV2aa
	0tNhUc9rVrHlFQN8zaSUo1qP5EEj+gQMZRECNeRJWA79PCjudxjsxE+hL0QVL0cU9PiwQD51irjPy
	4rxzDZ5PuaDG2facHBYma0JAwZ28m+ZEQNHYVDWXaxj5JmYaQamvF9koUfXT0cIwS3ok9Mq2WiQMo
	vrXn+/4814CWR6jAU+0sA85CaUX4ocIBisZKkNtJTHiYwTQx/QNohrb0pK5n0xP4BPIQc0FBePJuz
	jqdsaihiG4eMzGY0aNjPhFdqFYndWINrYcUS0E/6ieYA6FzidjS9M0eGWwVbzF2YYE8F9ElV6k2yD
	1Wm48oPUrKT7el1vibHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz06X-0000000F2sx-2qHm;
	Wed, 17 Sep 2025 21:54:21 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz06U-0000000F2r1-1WOz
	for linux-mtd@lists.infradead.org;
	Wed, 17 Sep 2025 21:54:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUw6AnJ+6W1j97JrA4RoeUYNrDPOo776BxtYkjnSNV+2eqJ/vg6WNzu+0wIehUAo22CQTb7teD4Hv5Gj9ONQ3w8CJc/pQf77fiTOuGYzYJorRTgjalx/pHErxGStEKZdYHc6SxF97KSYuLzkpAqwxhY81P5P7Hns8j/WPQexDXgxVvNzYbxJtbHfjM39mZc2k3F3ll7HrMdPOzYC6XuEi+cM54gzUIj1loG6Joij2H7YQeWDVvssJFoNAQfV/8BwHNacvaq3M+f/mGqwg9KcbeXngarwjyhB65DOawtpnmIuD3SnOB4xegERfN87kCShXbXp/d/BVIIgF8LyyzGKHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vYi/AiR3zqkZjpYlr2b+F7YJaNWqoakswQwYvAH8nfE=;
 b=DBkfEkrbVBGdBsRhAR49fjN2sugrwkP6o+evMfB+MDvqEBvEMNrLlGCRSxq+ai45Gif/li3Zl5ENjYDCHf/PZqjc9Sv8gIuIg6RwN2t9s8J07IMsxl9i6ijRgqj8cD8nAc8d42fArfpYSQNZZxNvEEr+Ad8zVJVjnU18rc+53TzJElexdLzHaKLXBk5MBu1wBMJPGmWsfkUeMzq45hYIDh3wYUDRts0DlMlVhAULwaWmWSXgLuk/BMw+OpvTYUyQxRoDQUQnMLz5V4jHaUJn7wFWoEhV3IdFR8hNRDKMAB2/DVoJ2RhIMIpVbUhTjYg+E5b/Tr4q7rKYtulfUJpRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYi/AiR3zqkZjpYlr2b+F7YJaNWqoakswQwYvAH8nfE=;
 b=mwR+fKFOym0HizWi1I0FRJXb9KfV7naDqfzAOI2BPqQCQ5ytxlFXsfWUho8xl8j++WvAdFjQ7fb0sWk9oCiuHv1d3osaMqfY7W5eXhxob0Qu6PhwZMMNECVX3dRcT0lptSP2qwRym0KunQ7fampdo9TDu+f1i++zOCVEk4QGAMrhJAhS7UvpA+YacO0zG6jH9NfXlwNOjhntXeyyPSAbAs4I+6uExsgPLTybjlJTrFN8VaApgvHkN6vQIgqg+f3QxDpdDcq8gb5Z2LGzkqK08n3jS7lW3wtch/lemDChcWoClTMg7Pog1eOHvhvzuR3KDina4opO1mgOXCp7x9o/Vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by AM8PR08MB6322.eurprd08.prod.outlook.com (2603:10a6:20b:361::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 21:54:09 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.9094.021; Wed, 17 Sep 2025
 21:54:09 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH RESEND v5 0/3] mtd: spinand: fix continuous reading mode support
Date: Thu, 18 Sep 2025 00:53:58 +0300
Message-ID: <20250917215401.19132-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: GVX0EPF0001A043.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::488) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|AM8PR08MB6322:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e79f12-54d9-48d9-ee93-08ddf634baac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?47sd8WEd/PgnsLlmCym0QRVxHrhJLzuOvet3a1xGRIyg4JG67KsRxKg/87wr?=
 =?us-ascii?Q?QhdVgyLfxAyZj41Rdh32QWh5755cbmMRcPHx/Thg7QN16X5mjQ3iwFoSW+8+?=
 =?us-ascii?Q?cteJ+Lcr6NMY0BkuqoSUddJMs19Ran5s+mXwC06Zlo5CfkrIIR0UiL9wXxow?=
 =?us-ascii?Q?WzX9H95CL+1RRUF1iNOCmdOrVFvqKgussRT9aUyzqXJGmFV3aUZmOcSEVpBQ?=
 =?us-ascii?Q?wZbjK9ZqRx1iXMYTi4xaOMuyIUaASO/aG4w4F5Y/5QNBWZSfT4Yi5fVnXzNb?=
 =?us-ascii?Q?G8mfoaOr9fVDjPd5O74f+rRhmwxeVmxEV4L7tON8FThECXh9ZKs3GnSo8+4T?=
 =?us-ascii?Q?1LxK0uWQFUjHB9z4noZ/IQXOIxXh59ASqtE5NWeKGAmgt1Wyy++c2W3Xye7W?=
 =?us-ascii?Q?GwS5/LyIvXRC6jeBUefcLtRHVmwmzsqVhMTctLBHW0D/APpEUZk7GGJRVqJF?=
 =?us-ascii?Q?20WSIAK0+jkWkA3cXdeytXTz1NM9/yu/ZE2WoFibF4n3WZCF0n80rA3hlUKg?=
 =?us-ascii?Q?MA+Dzh6YwSwmv+JqoWpBJe8vyU9+XdX44f/KLjthNmpOSqR5jyx0DBC5giYG?=
 =?us-ascii?Q?ueyFacKzSxetVIaz9h46UAGVLgyOce5SIkhF+HljneG0dZJQ2ZjvNd4pyBHy?=
 =?us-ascii?Q?oJgfJF02d5xK3XBSdbBXoZTAwqqnuEs90gbCTCSJ//DU9EuC0HEQG1xyajj2?=
 =?us-ascii?Q?zEgULvHT8q+8ceFU1FB6eOfAPiErkMRiofgGXTXxiS1NZ+38mEpKHGJBBUc6?=
 =?us-ascii?Q?4m0j7g84rbtOX0lR0f6OVb9afjsU+nbPLP480orrcvn1D3PH6Jxl5zHVE1Lp?=
 =?us-ascii?Q?EDz1qoDME+DmfMiGMz8xpAuN7QoS34GGZrPINI9WKlcz1zC3Mmegthy6qthU?=
 =?us-ascii?Q?K7urz3L2Xj5Er9LmZS/Qq9aPhLe2OztPV9xwbXK3X79DXXu33QIkQ1xAJ+DT?=
 =?us-ascii?Q?6p7afUUcX+sH55ZKziACRWbL8nvQaJrBUrTppFTRrEEwOmhU7d053IxdKdmI?=
 =?us-ascii?Q?8RDUvnoRyA21LN6TtI42SucwAJDrE6iH72bULpSmiAJU41axxs11XNjmDf4g?=
 =?us-ascii?Q?rrIibCny4aicI7bweTxlbNBkCtnEe+R1tCTLa5Gz6gPGG4O2Bgs6eCfBa5fS?=
 =?us-ascii?Q?zULvQLaPr1kWc1fNrhnoEoVVjhAfuSvPk/z114un8Ljv/mY6V4JU1gOGHD6Y?=
 =?us-ascii?Q?Db5TDOvO1XXkWZsFjF7PpqTxY/tdxob8OviiT7/GMb8I30IsrBJYSSJL6gal?=
 =?us-ascii?Q?h/LHEDbRlo47QTiHfHmEvQbKMV8s+fzM7wKW1Usc6EBxURH184b81Ac110q8?=
 =?us-ascii?Q?MOIkDUclFjebPySSg7QH9d31lj+IacqzZzx36LhkN9eDBU2uJaN7uLUYqbQV?=
 =?us-ascii?Q?MgkoMQh4yrpjqpoT3Y8eWblnc/u6NQUDy1Cz4PWOTzXfy7he5Bo28zpGcus5?=
 =?us-ascii?Q?uYe0x8Z/pJ3xOAaPD6UOn+1p2SD9z9geKFaYWxF86ji+W6Dp/dDXRA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZlVWUGkHXh2dOF2m//A9bAvnIivB2FU16rYrxuAyNOr8dDWPJj2gBfc9Y6Yg?=
 =?us-ascii?Q?ZjplpIEoQvu8s3443jcME36fODhT2axqWrmFTErlpJpZUSxjl+LDaPAzhU/p?=
 =?us-ascii?Q?30GDR82/A28g+gwTVksHE81DXTOqyWZ6Apdy8mexMWjAMHMWiXgRtPvakZFL?=
 =?us-ascii?Q?xz8sJ+sZ4gTE1TJADCszAdXR07vFWIi9m6pXo1DWhxFmixNJdjt9c+Czo02w?=
 =?us-ascii?Q?LQHWS1ZEv0CeTXRhOO9Q2xIjK/33pxFbuj9mR/V0XJbhIqzQL9IyCzka+0s8?=
 =?us-ascii?Q?oTQugmO/lTL1uO2nB7pkYpW3CRsCUvCOlf0Vft0vHs8VimGGc3MjiCa+jco3?=
 =?us-ascii?Q?CVYuBUp0tSJHk8+1K2zjS7Se4NgaV3Xynt4Zfpu1Ejnj6WJFAp1Ekagqmf7k?=
 =?us-ascii?Q?MKR0eUB0P6dzeFeK3YxdL4ocqXCMnnsljPErsfX9UmfHkcYnp/uSeR+AE7Om?=
 =?us-ascii?Q?QGUtVUKpt2EicUFcUoEfFBcuhvtUbKtIyeJ67ClqNwc8WpW4s6fW4p+yzGmW?=
 =?us-ascii?Q?bs1g5UR9nYuRqI9rQ8YA2Fgx1vjgRRVPBw8IqkPp9TdjEw0FxI2bdsj2Ddz3?=
 =?us-ascii?Q?hp6lCZpwYHHPn2Xl91/WK+93Ud4GRuurKTkB2VkNZkLEgKh6Ek05HLtDDcu8?=
 =?us-ascii?Q?rN4REcxJrTjX1iTsLOtbr3hg2zWizfguPB/DoI75ujjtWI5oB6BUic4bPFrN?=
 =?us-ascii?Q?btRCvW1FJWvH5XlqLsMLSqXgLJmu6mvRSAKKK2kXF37G1wlzaFMeziM4KVLb?=
 =?us-ascii?Q?tBV0h6O/BHxC68vRV4N6iMrfOOQjW2GQTwClw3uE93GXqOr/V6VvK0FtPeqf?=
 =?us-ascii?Q?Y3Venx613bzMSEWWnb56cyMV47ER0wShUdtZEagLmT1zwNdlDfw9qsgP2fRk?=
 =?us-ascii?Q?oq1Su698BgM3i5D/xZwNlBfYeR4U2C9ElXObwS70Ruv4V4oTsUOi6slFCowS?=
 =?us-ascii?Q?9bqo91lOpoDj1PZmP+3hUf6MX7hwY/3ETxh9CeC1KICpOpjfABHLjdsUxTb4?=
 =?us-ascii?Q?GdoK/rFgKzzZJSnqhvHyvMBhgkYLex7anuEgxgJoOOIDNzU3+Btr1p7Pk/7h?=
 =?us-ascii?Q?qd9MhtLN9RG7jhTjUISZ4MRefc45Chg6j4Edudq9wi0CU3Ohz/bFJuqueXB0?=
 =?us-ascii?Q?Bi+MUy1CbPIzvCGPxsSBokBsozSBrYva0fvtlXtIk3e5ofrr3tsZBIfuXLDg?=
 =?us-ascii?Q?cZTt9L3evcEER0U0jNdUf0DA8X6uTWr9a0jAOR02evDy/f8cGIu0oSRfjz7k?=
 =?us-ascii?Q?DbFyOivj+dekcNhzHm1HtHbIkm+Hv/dKwPR/Dl99Ycesq1/uzIF2EeWJHwwm?=
 =?us-ascii?Q?LkwsRyXOapIm2R2hGMaRA6RowA2rjEt5fr830mha41Jb2kdLsWiGHo4hiHyl?=
 =?us-ascii?Q?hJnHMIJiwKXs6VgH4K6wnIuHqQKfPeZgToYuqpFvdUTNDW6CwJ7WgChMsiRe?=
 =?us-ascii?Q?hQBwTMfOXMIa6TvSloNzskULetvCJJu81ANsMEsVGLCDsq4//bt+MCONJkhn?=
 =?us-ascii?Q?j0XBoHzQp0z8bc1uXWf1+pN855PSzhwMybw+Suy+rEoWnlNwoOgQlLDMITx6?=
 =?us-ascii?Q?+ak2vrTyPjdtPDTwfgInVlJ1BZmPy661wcn7eutiVj8KA4UzwuD7Spl5UwSA?=
 =?us-ascii?Q?cDSXL10Wv+6UfAk9neJ2BhQ=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e79f12-54d9-48d9-ee93-08ddf634baac
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 21:54:08.9089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXl4A1HKgRC6xL+ECroIdlFOS7mb5WPxGTvEW3uprdv11lKxHSdtTGUEgp5kw0FLmmYtxdiLvDxKd5KTsSHrG1kTVhCf3pKnkRrHGFJW2po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6322
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_145418_406239_57F47795 
X-CRM114-Status: GOOD (  10.88  )
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

Continuous reading mode is broken for some spi controllers. There are two
possible bug scenarios:

1) "continuous mode" flash and spi controller without dirmap support,
   but with restriction on transfer length in adjust_op_size()

2) "continuous mode" flash and spi controller with dirmap support for a
   single flash page

In the first case, any read that exceeds the limit specified in adjust_op_size()
will result in an EIO error. The limit may even be less than a size of a single
flash page. In this case, any read will result in an error.

In the second case, any read larger than flash page size will result in an EIO
error or spinand driver spoofing (because the spi controller driver returns
more bytes than were actually read).

This patch series tries to fix continuous reading (spinand driver side).
Unfortunately these fixes can't resolve "spinand driver spoofing" case.
Spi controller drivers might need fixes as well.

Changes v2:
 * added helper to create reading dirmap descriptor
 * fix spelling
 * error code is not used for regular reading fallback anymore
 * it's possible (but very unlucky) that someone will do raw reading
   of the flash in continuous mode (i.e. without OOB), so fix dirmap
   creation for that case as well.

Changes v3:
 * improve description
 * move airoha spi controller driver fix to a separate airoha spi fix series

Changes v4:
 * the period '.' at the end of the commit title was removed

Changes v5:
 * rename spinand_create_rdesc_helper() to spinand_create_rdesc()
 * get rid of controller_is_buggy boolean

Mikhail Kshevetskiy (3):
  mtd: spinand: fix direct mapping creation sizes
  mtd: spinand: try a regular dirmap if creating a dirmap for continuous
    reading fails
  mtd: spinand: repeat reading in regular mode if continuous reading
    fails

 drivers/mtd/nand/spi/core.c | 74 +++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
