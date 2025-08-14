Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2E6CA0EE3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Aug 2025 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VDdp9j60f0N91dB7Xc+dqvrvkko22Nuv8PsDhHOzmYw=; b=MhhwYb47CjkB8Y
	dbTttrvzaqvRqJMVZQkD6bWdKJ1PyIIdzaO7F0gMJV6gu2+0/pZHdWTI7Bof8auTP4i8IdHPKrx/z
	bfJ4nrmvyhJTRNNtVGPH5i7QGmK+6ZwUn5XznHOtmIMjWXDLRmym/F9peZPpvdcT89U/GZDmb/0Vv
	9a11GZfps+klWcq/p8t7HHhSG3SpZPg8cQ8vGG/3c4eZTbfLdlX8glC6qDHVBUj8C5KrMh0vMSndz
	zmI0/JZ1EON8+Yv6IYTGyQXQJfQnIz7C6lVSheGHPUSWdGpXqOUOPoTeYrelfCnd5fkVGoeJDtoiq
	4LjD+lwc2lbTFo1zq8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umS1c-0000000G1kB-1Vwe;
	Thu, 14 Aug 2025 07:05:24 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRrN-0000000FzHW-1fbW;
	Thu, 14 Aug 2025 06:54:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOPoppOuiAs6/G8JaLd/v40SE3zwlHXdMSjK1TsCQIANVw4sC0kCa+tH3ZaVxQNSGR8M7V/yHinsUT5Q4iZu+NFVg1uxqvmihtbxIw7wcnwPfUdtbF/QnxF+kZmh2rmfhhDZt6u5BxQqrE94/6YQqVSOUXvBHpFLzf6vkjwuE46Ol91upkPWfbDHesOyc63KBUaHV3M5bTau1PBvqj9EsVNDh8Nj0N7S2+VftusQ3Zi4A9CFm0I4SpqagsUH5Dyl9sNmTFXv8z64Vd0X30d7qT1dxTBvJ/9Yn63p1kpVSTFZF5ApcLPsI9Ms/xazvTbYtsGHq5ufqOKF2w/FBsGZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7VT9NMzqZCjVdBwvXOCsCUkrYxBVp8siKFy8LVUaPos=;
 b=VrdNYjF0bEreHhOA74VMng1y6mf9MKu24gxMbA3mNFC6ow/ATOK5gH/LoJUzrlsIEaQfbUmSFfLgg3Fbl7sROoSidwyjdclPwr+FtKnea8reJnHPlpxHG7bhOZ36iwChto5pWlhEv3cfQXqRBRmHcpzZjZNza6G1HFikA5jAu/TrVy6VbCKrNXtQKfpX/j+njeaTwZSD30H638lzzBBs1F26KcxwBxWOH/6Ep+OM55pcpZxep7CTy29zTT9gjUQq87Jg5lEGBu65IDK7sKzWleqwDq4mvTbi7JhRyadn8C0JfGZy+7S+ZpGS0jcOVam/0BPSgZGPSwA/dSe0+mW2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7VT9NMzqZCjVdBwvXOCsCUkrYxBVp8siKFy8LVUaPos=;
 b=VIqB4z2xFO/ZInRMuZSUo6Qk6UypWc9/Q3drElOQRYMe+tnsuITktdfp75MhvvBswwUv5AUJoE7WdOiLoYYjp3iEr5VnwRZzGUjznMZpvAl4DDLMOwO9Wcj7Qszp6opVMj90CKN/axPZFLfPi1qphe/CRWEhFUPE31ZkqXmgVwHdt6wheVaIDm6IYHUtPCJvxHHSdWI+daernBRZxp9RqjESKiwgZZcCSVJFg4Uyjk654R+MacPAPee1Kr8keCKFiE+p4/+MQUqVTp3hFW/7n90rPVHab5N6nQvCg1Dj/6yOdA9eiKx91Lfqi/UcJ5kPrRi9MzDIWfkBpQ+8v4XB5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAVPR08MB9013.eurprd08.prod.outlook.com (2603:10a6:102:320::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 06:54:37 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Thu, 14 Aug 2025
 06:54:37 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Martin Kurbanov <mmkurbanov@salutedevices.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v2 3/4] mtd: spinand: repeat reading in regular mode if continuous reading fails
Date: Thu, 14 Aug 2025 09:54:22 +0300
Message-ID: <20250814065423.3980305-4-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: HE1PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:7:28::36) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAVPR08MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ace555-11f5-419a-27f2-08dddaff6f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Z6LkZ4VsByjNJgVy+8i33k1rYBQkUIXq6HPUVn+Mkh6sc4/0laQLj2yJUPsQ?=
 =?us-ascii?Q?2sIiWRcw5/95iIQME1TvM2Tswm14Zll5s4q+Us89wDVsVDbx7qwOgvGIZHwd?=
 =?us-ascii?Q?XgiAXwVL+z5xF+IrZI+BgwDH4t3+FgrMUcHZUEMBKdciOw8FeqCDsopMHU+G?=
 =?us-ascii?Q?sWGfGdXZRZk564Mwcb1Txf+PtwTO3QuubmmvN9q5uH7VIYcCNxVzylFDP3fF?=
 =?us-ascii?Q?KnS5vldl5zaml3AxN6jKA+/18EhBWVQT0CpAj06m4U9FPcq8UINyNNJ6XjQ7?=
 =?us-ascii?Q?LnnnHw5sp/NZ880vcO/BqF7lQZG0TUrxVUrWbX1W5PfzQ2IZlShv8TWNtrat?=
 =?us-ascii?Q?DxcCVCDjy/P/cV5khU6I31Ce4rXkCWVaskGG/jcvZFppwwop+o/qBZx64w70?=
 =?us-ascii?Q?glFwLxypk9tdrSf5IfyUuisF3qv2CWAT+6IXLZK4zsDPo0wqxRxqp6f/bqhR?=
 =?us-ascii?Q?Q/sryhPcBuZho1zXr/yD8Ps0GGPGeC5IPFNEDKxtJt6IBrPQH6WHMhW+mjd5?=
 =?us-ascii?Q?TW8cjmXCZxCiY4sNXcCkCTs9VPjfp2vkZo8BpVYdsaQJBmCIkcmq89YZVvOs?=
 =?us-ascii?Q?+O+YxWDTMImye+mMCdn1xT+wd9pJU6EsChteSWfT4apiXjXu00V47W916wol?=
 =?us-ascii?Q?xK5HCMKiNPWkh50aldHVsmZkIpKkkrHKg9Yjir/znd14QkvmbteaX65SCaes?=
 =?us-ascii?Q?pgjP/y+M6x0XuQTgkNhvIQzSg2D1eEl34d66dLoZJmLBc401N+rcihoEFVr/?=
 =?us-ascii?Q?vi+BTKobvkPxsRErLX1MF1yjKta9K87uaEXVLI58u4BaqFZ27Q2A1brP2gKt?=
 =?us-ascii?Q?tBcDZgZQJyOMWwSve7Cx2ZOmN0kTi5Rh/tSHKSputakqnze4fL5NGbmvI1gk?=
 =?us-ascii?Q?RsbSli3fWmXfXHwBNKNc565hPCC0G9wppa90wZnxG2iT6wmVuBjccSug+V2k?=
 =?us-ascii?Q?X4oclpH0Z24NN0xWEe/mpyKON35l7NWb7HUfkKUivkM3m/laaMk8elywLHNt?=
 =?us-ascii?Q?7E14Tex1jJRG3hmtIuK6EbLuGj/Ck5M5ChCbI016XuwS5+xHeRrlTnYyqVfL?=
 =?us-ascii?Q?b6PkmQC8S6LWjLhyXdaJuXI6CiGWs1b7RaIW8XW6LuxkTbTlsZOrRGDS6tN4?=
 =?us-ascii?Q?EEJzqwNYmo2uzqWbv+wyIgh5Ydz+lfzticckiH4mm99VtxIF0iDZyBAiH9LK?=
 =?us-ascii?Q?ADd94rY6A8JiG+JbvGssAYYaQtG9WUyrVIj/36p2KCif+ycqylsBp86siNzl?=
 =?us-ascii?Q?9t+EU4SfOvq6qm2jVYpCIKyjGc4hcJYyEm+kOrHS6Yzzou7BHuN1w151eBvm?=
 =?us-ascii?Q?xi3+gYLvHM0T2YLA783DLIDIrxTknAnAhZktHugHGAAKk/kHcSEC5zKmix8d?=
 =?us-ascii?Q?m6nGzPO9BtFxqKM035ju9ZSBnVlGh4JCNfaRJxkdXpZSA6N1QgAcURNuS0J4?=
 =?us-ascii?Q?RWtTqarHTrrwTy9Jy+1Oko+qO3KO03k8rKv3Z5zP49uWkk60i4Sh12NS+FEJ?=
 =?us-ascii?Q?XYlOCi1Qn+bVPH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NMOv5lCyXUICzDavaKM7/0/iZCI3j8cNYWNuv7A+Guw0EidXox0ESktZR2Ro?=
 =?us-ascii?Q?hTi81CcYvm5pkQnOReDudS8jGZqBkYdNVBGaRUqKw9XNZukoKhLV8mzMZRnz?=
 =?us-ascii?Q?9GLta88X7JlnLB2hHU5a1406nSB2kCvxTpBcAZzGP5SXLTf2pa5uBQA5n7gz?=
 =?us-ascii?Q?vxXdzXurHM/NOtZpsgQTElhnpLVcw5QQXzdkRPkj5S0qGheaXcU2wgGWW+8A?=
 =?us-ascii?Q?nnN3Ov34qsprPpmCGNMr+/de6WKOAPhaWg9GtYQafmV7dcBHPP7y7S2Svo8X?=
 =?us-ascii?Q?/FCmta2D2oTjcTto8Z42nlJXxtk8mD9VdBbcdePK/btFmV54pu2yGHmCPFa4?=
 =?us-ascii?Q?59HZQcUncpWfhVfPnnWm11LzZn6/B2xgu7RvINuUxCUH+bf1pHQyKk9vZxuM?=
 =?us-ascii?Q?9/HZkMxpnSyawGeUe13bn1lHiU0DCn7rPDL9qtUF5kxOVhej9ITEMDvBkdMM?=
 =?us-ascii?Q?blRlHS+7ulTx6uws1Fvc0qB7JhciTSTNhIpZGwXlZs4eHeKcY6K2cc7fMspf?=
 =?us-ascii?Q?kZKR8sL/LUCRZCTB40wTtA9HfIor3Q37VhPIzPHbDAajyDkYXcc8ooDv0ohU?=
 =?us-ascii?Q?JCWOng0enhY5WYL6byYKnxlT/QCfLYkjgO8/FroZ5uM4zXdaiAgbFh+K+NNK?=
 =?us-ascii?Q?K//CP0w2+qNj0MKIj1JbvjFhQCUdtmIDPQ+rE7dCXIco+xfOlCHTlS8uhBAN?=
 =?us-ascii?Q?4y4BIw7ftRdRTaXZ2d3rLcDdWi0zeMm2T7ImU051y5Iaxykcf6jll4o7qRtq?=
 =?us-ascii?Q?hnafXig/qniX8GanQWs4NpCCNNlz/+F1UMReb4ogNLc7iDwx2CdnuE3XHMsM?=
 =?us-ascii?Q?cw23paf80JaBi4Tz9zQ1rwkzJ4q8SE+ghfL6tdEVEEjzDAc1uaVEc+Xor1sf?=
 =?us-ascii?Q?GFEMujZ+YrMUDqV/i+28dzdGPh83+gpnE3yJ2qDxbeZ0hbE5Ut10CSm1san5?=
 =?us-ascii?Q?Z0Nu5dwyLCnqsC/fftRpqChyVjKMYCUFV/k7AQFlDIspOkS9aY84odp3eZCi?=
 =?us-ascii?Q?K4xnXjA4ac/u1GGf20bAq/HYBeun9MltDdz4We0nDjbwFaYqWQsavhWgPr4n?=
 =?us-ascii?Q?efeH7R/TUBVO6F0WnCNmSH/ttT4kHEeQUoFQY/b6We2M8QPvrY+iWTKuyD2+?=
 =?us-ascii?Q?1AaheelTiScw0oRTAfpY9RNRvTelG1AWM8cpIzYERQ+1s6ds+9lurE2HRUIR?=
 =?us-ascii?Q?En77q6uqY1mRCCUvZak2WGJwGkIwq5qKR+SmGasO7jasnqyAzuT3UhUR8d42?=
 =?us-ascii?Q?+dEaWEYeFlnwe9Tt4iRSeHY36PuMCb5NxwKNgQNwHT7lL1Vo/li19g4SJEHb?=
 =?us-ascii?Q?hAplsjkGRGcL8Dazoe23ptyEb6DO7zW4zVe0JXoqMNg8FHuf8MZveAK0Muw6?=
 =?us-ascii?Q?J01fNH5v/r+YE3Olc7b0xlAslzsAOSCPdrxki4Z1klXfBJuTcWI+UEL5KDaw?=
 =?us-ascii?Q?NxDmjb9Y20TAAoVy7FlbBz/mqbKyI0faQ4iLZXN45LooPmK5gN7E3gi9O16L?=
 =?us-ascii?Q?taQ0WrgGOyhsH2jL/HO4Qf6XH/WClvELdcp9SpKli4xMftyo27qK7x5xz4ri?=
 =?us-ascii?Q?18q4M4V0x25IbZ+FMZCh41sSFYjB4q03czUXg4/q6VnSdCboLkeF42SQWUPg?=
 =?us-ascii?Q?Kg=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ace555-11f5-419a-27f2-08dddaff6f27
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 06:54:37.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zIUp4gXamt2+RZkXv22/4/+37lr1ICzmuS+CoQjvjmDf4xyp2lsYoRNR/V4vbBZaF9wjHz5QnZIfo/l6GLOFj+7bhCoCRWtCFgFVsQ+2III=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_235449_437141_B0054369 
X-CRM114-Status: GOOD (  16.37  )
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

Continuous reading may result in multiple flash pages reading in one
operation. Unfortunately, not all spinand controllers support such
large reading. They will read less data. Unfortunately, the operation
can't be continued.

In this case:
 * disable continuous reading on this (not good enough) spi controller
 * repeat reading in regular mode.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 39 ++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 0f8636047365..5528e1f72dbc 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -378,7 +378,8 @@ static int spinand_load_page_op(struct spinand_device *spinand,
 }
 
 static int spinand_read_from_cache_op(struct spinand_device *spinand,
-				      const struct nand_page_io_req *req)
+				      const struct nand_page_io_req *req,
+				      bool *controller_is_buggy)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct mtd_info *mtd = spinand_to_mtd(spinand);
@@ -430,8 +431,11 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		 * Dirmap accesses are allowed to toggle the CS.
 		 * Toggling the CS during a continuous read is forbidden.
 		 */
-		if (nbytes && req->continuous)
+		if (nbytes && req->continuous) {
+			if (controller_is_buggy)
+				*controller_is_buggy = true;
 			return -EIO;
+		}
 	}
 
 	if (req->datalen)
@@ -646,7 +650,7 @@ int spinand_read_page(struct spinand_device *spinand,
 
 	spinand_ondie_ecc_save_status(nand, status);
 
-	ret = spinand_read_from_cache_op(spinand, req);
+	ret = spinand_read_from_cache_op(spinand, req, NULL);
 	if (ret)
 		return ret;
 
@@ -770,7 +774,8 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 
 static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 					    struct mtd_oob_ops *ops,
-					    unsigned int *max_bitflips)
+					    unsigned int *max_bitflips,
+					    bool *controller_is_buggy)
 {
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct nand_device *nand = mtd_to_nanddev(mtd);
@@ -808,7 +813,7 @@ static int spinand_mtd_continuous_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret < 0)
 			goto end_cont_read;
 
-		ret = spinand_read_from_cache_op(spinand, &iter.req);
+		ret = spinand_read_from_cache_op(spinand, &iter.req, controller_is_buggy);
 		if (ret)
 			goto end_cont_read;
 
@@ -892,6 +897,7 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 {
 	struct spinand_device *spinand = mtd_to_spinand(mtd);
 	struct mtd_ecc_stats old_stats;
+	bool controller_is_buggy = false;
 	unsigned int max_bitflips = 0;
 	int ret;
 
@@ -899,10 +905,25 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	old_stats = mtd->ecc_stats;
 
-	if (spinand_use_cont_read(mtd, from, ops))
-		ret = spinand_mtd_continuous_page_read(mtd, from, ops, &max_bitflips);
-	else
-		ret = spinand_mtd_regular_page_read(mtd, from, ops, &max_bitflips);
+	if (spinand_use_cont_read(mtd, from, ops)) {
+		ret = spinand_mtd_continuous_page_read(mtd, from, ops,
+						       &max_bitflips,
+						       &controller_is_buggy);
+		if (controller_is_buggy) {
+			/*
+			 * Some spi controllers may not support reading up to
+			 * erase block size. They will read less data than
+			 * expected. If this happen disable continuous mode
+			 * and repeat reading in normal mode.
+			 */
+			spinand->cont_read_possible = false;
+			ret = spinand_mtd_regular_page_read(mtd, from, ops,
+							    &max_bitflips);
+		}
+	} else {
+		ret = spinand_mtd_regular_page_read(mtd, from, ops,
+						    &max_bitflips);
+	}
 
 	if (ops->stats) {
 		ops->stats->uncorrectable_errors +=
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
