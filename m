Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 818EDCA0EE3
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Aug 2025 07:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEFlGWoisN2CWD98BZubwNgHUpV+R6aeHgAOJTmnwOc=; b=QVs1oYdHE3PNat
	n5Pe0KPLZnHoKK/ljDOriZ1j4BnN5l55IfbjIChhcO25z455y1xwp5Ch5Vr7KhuZsrdGfHP/th/Vq
	XPFdDwNDBZzfmPXxHnMz4/7QXIWkZTFmIS6OGmv1g5qVtTYXKhB7ffGCiKAu+K6yI3jE6P/tK2u16
	ilTD5Q1bUlgaxPDyOl98cpi2qhNoPVG1UOvCSq7q0ECDoiSUyq6vYXaETq93XBCZRoiHYx2QyhqsF
	Bf4ykQnCMVm5CSB9oABPnJP/lC9WuHwHVF/q9IPYpVLOF0yG7EtJqdYB9z74IyhJhHcNJHb+oD3DM
	ssrkKa5wte+2aisVzOZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRwW-0000000G0j7-0FvI;
	Thu, 14 Aug 2025 07:00:08 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umRrK-0000000FzHW-2Kez;
	Thu, 14 Aug 2025 06:54:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4CAuOXDZJ/rxVpEDpViLCf0tIaWc2DjtDvW5URaDZLTwvkOoNUXdQ9iFDfBVF/4F7EUtc9dwfFgXKC4ylhWnEEfzKHnO3NHFq0G+5SGoil4ijB2pH58+Odpxh9gkUlsAc9/pIbB0REU6gcOE567TN9mWfSXeLk9ZEMKeMf2Sf+iywNlz9yU1mqcmNx3y3dqywA7YP8fTTDH/Yj37nBPSAcBryAVgUXUZLhgu3OtvtlK6XLvkDkbzFV5LB7Q1sbAPEoGsAg0B1YE6rq/hRFqAAmDEQVaSOC/txpOQl8GkdsHGvmv3B3nwyGhTu6fVuFg2YY0p+0P6HCDlCbpY+Q8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/w2WIgLnuWOWmC0UgqGOLyNjwGVYChlJl+uuUstHaw=;
 b=JoJ+7htUtI1LOuf0t9tjXpcCcA1y6sFUHtqapuX//DJBEywjR9lUvbDYxsTcnegi352Y98tS1bH1yLhRoJ/qrTw0afOUpTqXzmzk700km5QfDnfhjF9osVmX1jjZZYlMk9w+pYc4TaBIlyYS/oSvKaIiOCDZ54a+Amsa1rKRk2pG1NK7j3yqvIXFzD0U/d2yzRRRhG0b6EehAqk3w58mI38eG5N8OfUAfxKskNECbMj4NOPofz11FWADooKoYloOUNuS7etPP2Iv+Uw4G/wiNqmRzMYh+D6+rErKsgHMBQj91nCtozm0vtzVsU1eeClLB0PavAtJ6Wu6hjdezlxZwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/w2WIgLnuWOWmC0UgqGOLyNjwGVYChlJl+uuUstHaw=;
 b=j0N5n4TBAiWfy0eruPSP1cjXYelJYb1/ju3vCJHi57pkm4p4SnR4vzIwR7kWy9Np2NT1PY3U46qRBJC35gNYmxRVAYDiaALT44KizrIcsMm/e4DYn5oLrbPybBTm8GkKbEZLwGNwIPmwLp/X67FTXhmGMf3a9rV+fI6mTKeJRi+vEZUZtDt+E+3WFEdiGSxAx2OgRR8HHULFOxdHvBukrrtUzxk0lAwYWBj5NfVOud3lJifB2n5syFe+/lhYGdIFKNCojY7GV7tP7XO61RUKHK2+ZkuRTZMhdbZhkmovjcjKDfueI2sJen8Kpl2WXVmtR0hf0p1RsskitKQffK8S/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by PAVPR08MB9013.eurprd08.prod.outlook.com (2603:10a6:102:320::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Thu, 14 Aug
 2025 06:54:35 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%4]) with mapi id 15.20.8989.018; Thu, 14 Aug 2025
 06:54:35 +0000
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
Subject: [PATCH RESEND v2 1/4] mtd: spinand: fix direct mapping creation sizes.
Date: Thu, 14 Aug 2025 09:54:20 +0300
Message-ID: <20250814065423.3980305-2-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
References: <20250814065423.3980305-1-mikhail.kshevetskiy@iopsys.eu>
X-ClientProxiedBy: HE1PR05CA0149.eurprd05.prod.outlook.com
 (2603:10a6:7:28::36) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|PAVPR08MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: bc18ffce-6a71-40f9-2758-08dddaff6d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3323gb6iCVxVz1M2a3YFK8n7SUu+g3whzeJZbTzGHyvAInE6gunNOchuq6aY?=
 =?us-ascii?Q?9GpqxJg3JuYn6wlmVVwGSKAfipb7en8IQKoA7Agex5QUe861uit7Ww4s1/H6?=
 =?us-ascii?Q?cHzrq/c8K9DCSVor2khqu4twx3JU19vY9j+BW3lOT/iZGcXX831wXJ0YGIvU?=
 =?us-ascii?Q?r+nf8QC+ZdxS9urCP/etIH1D4ajNWj2Zym4rQcbTr1GYcxP+Nk0yzlMfjKhg?=
 =?us-ascii?Q?pm69j2NG8ukq1aM/xyZ3urSjrEcWL/mkzwwmYZwFQAflr1bNiYU849gvDqLO?=
 =?us-ascii?Q?YNHYy/JT7nLPbjVYWBHNwnSWBBGaDTDiYBa9Ffex2OQesvpVQIN6BBWu0PPK?=
 =?us-ascii?Q?k/EuF2AvKg5jtYZ7CNXwlzSB7oI8dbKbwv6EYebOjzGCyvULBbG6nzZ2mEoN?=
 =?us-ascii?Q?uaBrjO/yhIxq3YhnREBix0fMSI2fM6OwwC8zuE4ONSG2SFg692LGCtXBtxco?=
 =?us-ascii?Q?Dcw9zKfzYSjbOVBpsrKt/62fuxUI9QaDstAUOUjwCzd4ICNmkD+F8NiyGRfc?=
 =?us-ascii?Q?/M5J8J8f87y7x7+VRjoN/xKd8DDlfJ/M3dGKeDWG4Lv+liSfj4+hObqU5sTb?=
 =?us-ascii?Q?ppgvBgk4c6HhURv64km5QFqU4dhJkfyMZGHNsNKZ6f8OMk1cJ5KFbxTYId8/?=
 =?us-ascii?Q?NkSbMsk3byGvXbT+iuAQZOEoBHCTe17xDICU04tCuojghbdTHoOMsZE4VNjf?=
 =?us-ascii?Q?1PowvlE9zosknu36vPSAWeRqWKZPVdGrL9ys+l3+ITg78okPyvXP6fUikJCX?=
 =?us-ascii?Q?IIRAAxDtIVl8DCkGremcE7dah3JioxiXKuaFwOXHA2HvAd6ruNafuLbHa2+k?=
 =?us-ascii?Q?rPCBphZ1C7g+jv2I+nfQ5lwoCwJeIkwaE7Aj/mJyBaLLhc1b4+91RcDW/HgG?=
 =?us-ascii?Q?YdF2Ad4nT2HwgOfkJXtMhW9spg+iFc9r7Xe4nvmmtfD3QgRMS3Z0FiTrl+XX?=
 =?us-ascii?Q?ZWgUbK9zxbkY2yvAs8lEgICxG+heFtrfJXjdi29TZPAaOl8bzEOX3cTQM96d?=
 =?us-ascii?Q?86WHnc/UwAuBNwMLhwzMJYMsUXxM41FBK7IpNWom7UDhO9VsOgqne+wmc3XV?=
 =?us-ascii?Q?/4nD876r2wYyHfe3TRgkujwssaCtnJyRZ3sgH4iaGokBiUYa2NgTLpu1KGGq?=
 =?us-ascii?Q?WfqcaN4bnJP+yX3Sl5RvW5jD6KxkEfxPxd1rrCnSjrLbfWYdfMYj8Rx2JTqN?=
 =?us-ascii?Q?Bqfob92ULnx25bemBQAGYYPqVThuvSGI5mv0U98/9UKRMGM/XSVFT/98tfg5?=
 =?us-ascii?Q?ZUj12k1oUlnHYPUQdPTvVqVUxu3IR6tJSXUMFvmmsMlvSnf1Rm4KVbCgQejt?=
 =?us-ascii?Q?1vWCILgYTK2lPK/OBJUHXxX3Ngf+1t9MS6hJwGgKqVu8zJyhfa+69ykEtX7Q?=
 =?us-ascii?Q?wDt0uX+YtIiAohRC2xpuN87OXeEUw7bCptsvWBKYWlAMLJdAbkI9fMYYm6pP?=
 =?us-ascii?Q?3mBsw+Igp/877+U6LpNk6Wqqg2Yt1kBq7Y4RVFcz/sw1rr6qZMqoeXrqY6NQ?=
 =?us-ascii?Q?I7qLlOV5EOVAuyQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6/eN5rXjnwIZgqrc1gNb8ZMiT2EwCERJl6waTmCHGZ9IYQdFChXFMPNSt4D?=
 =?us-ascii?Q?P6jrRZYBDVrl2mtYtK5nt73AQkNdsa4GF4bY79+jLmf4fZZsNSomFx3+f7f5?=
 =?us-ascii?Q?Z9+3EQp0qKVn2/85BTych8YgXMMcnYb/I2p60ZHsmkNTmcO82zvfqTwrlcyK?=
 =?us-ascii?Q?sSrPAKB3uwzPtFO0mnI9UCB46xKLVeQyEbrMLifuey+rDpfYEIoNmfoHmdrT?=
 =?us-ascii?Q?7txvJgY2zRzLf9CEHqFssyDrUQk8VaUUPRybCvgiIaV22o7gEiMS8vGMdd8o?=
 =?us-ascii?Q?hni85VTKuGbMh3+nF4XpAnUtvEcrYxWw1UEkSz2PLLC0X3IdGn9ICwRlbX+/?=
 =?us-ascii?Q?iZFqNo6IU35nLrQEKmbcMHcrCrBqkWQbcTPeP719zATDcTXxK26G0e0halZC?=
 =?us-ascii?Q?9is3ImIijWJ1+KfpudQi12ufVvcD7zzkj2MV2tSGibOxLXZW4Bj5Kav+RqNW?=
 =?us-ascii?Q?XRBrY8bS4e+Pv3QWkP/4TZszVpj9IKUpZgssKQJq8whqKGl7mK/BxDmdRuER?=
 =?us-ascii?Q?866PJEsCIzrOPUBiDXi7c7u/d9odIq/s74Nzg+Vfhx+nB3ESLtSUcP3YQdWs?=
 =?us-ascii?Q?o8DEU5LnprDFcnbYa4He3laJYcdn1lEXXOSO5Owv6586MtpLnzS3Sdb9PqWo?=
 =?us-ascii?Q?iKFpHWNNEgUU2ZShMPFATFuBylVrpFy9zgo6ymn6RoGxm63sBBtwy1E4IJih?=
 =?us-ascii?Q?EJFB09ODDn4kjerdZkr/I5OirD8F/0e47WcvyJQCgka3pQe/0uwxNxUhLtQ/?=
 =?us-ascii?Q?0BudvnOPi8JwaNpeD4vquqSXt6Dt4XFq3lRaDCEmPFDQD5T/F05coZ0yT/59?=
 =?us-ascii?Q?xzpZjUww/Hl8vHGJGrGCxVqHEQsB36N3UHvwU6ioFAu/PYdgGUT5zraJ1hTN?=
 =?us-ascii?Q?qih5kVodGemGxLmyWn9+BaS2VxcSAKEkypNnGUOqRZVgX/FIZ4/epVuvKehR?=
 =?us-ascii?Q?bm9uvfOIVC9COm4NCQJPJS/q+qDSvTZFB8a9u92DyYNRIG6K+vvEMcOcwEAt?=
 =?us-ascii?Q?WFXnGjFq8Qx4XTUrOCb1X0+xmcb8XK3tv7FgzhDNLIRSBrb9CVZGsOv8pPyV?=
 =?us-ascii?Q?RgwtnYIpQihLffn1DdeTPVaQYD/Yiz5cOxgKVLfPecjVEByaCtIThw0XWAlI?=
 =?us-ascii?Q?aQb4JxMZaReGctxqLS1Eu7G+xEegQ9W93T6Oi+WgUeblbm8gH3z9PoftLsM2?=
 =?us-ascii?Q?FkutCC2ZSvQjfqiY66Li/BFdqxHh996MGupfB5N2o9GmFRUO9nkFHL3prS8H?=
 =?us-ascii?Q?Zl9Tc/zlfqu6tOZPkH0ETr3/F9c9NVEjqnz0srsGB7m3u9KPtEZ64+G4hLNp?=
 =?us-ascii?Q?vJOUxEbU+noKiHntni/qEsr3HZEwYjGWqfYF8b3gtSjCoR49wg1dHGxFzoq1?=
 =?us-ascii?Q?hzeCuoD7U1M3Dao0dorwaX1CN0X+PYJ5y7sHH+vbuPtWKTSfiM6QO9yySrXh?=
 =?us-ascii?Q?WkCRyRKzATBW1NTiAemIkF20VPdHhdyFkI2F5OlcS9E2QyiCaa5OoXUZny5u?=
 =?us-ascii?Q?X1qj8pvAUTeX2L7Yh0BA1EfoF62Njava1rA6dHq/Cy3/tdRGRP+nH82T3/IF?=
 =?us-ascii?Q?J1MJhXnunweQbdEoqOYnDRIIQmUEV43j4duVC2Xhvtt2Lh0fj2dC58LZDJ+A?=
 =?us-ascii?Q?Gg=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: bc18ffce-6a71-40f9-2758-08dddaff6d2f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 06:54:34.1891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARgYwbKx6vOZA9EKCcOaa8+fCahpxcfcRU3dZ2dQ3K5Yk9gsWeHh0AlgVned3VWOULS2Ex1GGC/y4v+EUu6iPDbPEihKzoLscMnHGqRPiXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_235446_595401_1439E3C9 
X-CRM114-Status: GOOD (  10.81  )
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

Continuous mode is only supported for data reads, thus writing
requires only single flash page mapping.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index b0898990b2a5..09dd6e40e308 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1097,18 +1097,13 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 				 unsigned int plane)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
-	struct spi_mem_dirmap_info info = {
-		.length = nanddev_page_size(nand) +
-			  nanddev_per_page_oobsize(nand),
-	};
+	struct spi_mem_dirmap_info info = { 0 };
 	struct spi_mem_dirmap_desc *desc;
 
-	if (spinand->cont_read_possible)
-		info.length = nanddev_eraseblock_size(nand);
-
 	/* The plane number is passed in MSB just above the column address */
 	info.offset = plane << fls(nand->memorg.pagesize);
 
+	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
 	info.op_tmpl = *spinand->op_templates.update_cache;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
 					  spinand->spimem, &info);
@@ -1117,6 +1112,8 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc = desc;
 
+	if (spinand->cont_read_possible)
+		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
 					  spinand->spimem, &info);
@@ -1132,6 +1129,7 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 		return 0;
 	}
 
+	info.length = nanddev_page_size(nand) + nanddev_per_page_oobsize(nand);
 	info.op_tmpl = *spinand->op_templates.update_cache;
 	info.op_tmpl.data.ecc = true;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
@@ -1141,6 +1139,8 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 
 	spinand->dirmaps[plane].wdesc_ecc = desc;
 
+	if (spinand->cont_read_possible)
+		info.length = nanddev_eraseblock_size(nand);
 	info.op_tmpl = *spinand->op_templates.read_cache;
 	info.op_tmpl.data.ecc = true;
 	desc = devm_spi_mem_dirmap_create(&spinand->spimem->spi->dev,
-- 
2.50.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
