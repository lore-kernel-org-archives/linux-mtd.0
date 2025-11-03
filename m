Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E9BCCF9E3
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Nov 2025 01:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/wuGYuo3CsvO7hmjlYfPq4kYM4H2TV+7QjzgwxNo8iQ=; b=GMh99tMqIzrveT
	9qSI132HlnpkEZkXIpsPSOR2ylbjRyFSHBEo8Ejg/FgvIN5jEMxX4EpQRr3KBHcrrJSCEXYwpLtpE
	0t72FZCsuJBr6bJQI2TtWTWtwGubXEv7UJlUr5OCfMmDQweRv90yXdIw+9FSdMjuB08IkmrBElpD9
	sCVmrsO70dh/UGrWpTuyZdme5xoABjqiOWM9Sjr/3kuF1RVuLXOCGQoRBNj2RRTd3Vk72H7xyAyNA
	KQeTx3JQlHXPvmG3qWyeAUvAO93W/lqJAgaarT3CrIf5WKOeBIBjjL2WJu+bXswblL5XhYcE4HZRX
	SPflZCLkTxoLd8zZ5zoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFixT-00000008zNe-2MAh;
	Mon, 03 Nov 2025 01:02:07 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFixP-00000008zMf-21PD
	for linux-mtd@lists.infradead.org;
	Mon, 03 Nov 2025 01:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8p9U56XyEm3NRaivPuciHIhxxl3ENXLVq0UzQt9U1foiDPCzbv7yerDkNIHyBAOCRfJEB6mhWKoeuXd6ha0RQOHdgrmodcvfgyyd2n4a6m0Qfc1N43/ei6zvudAItsPFMiNdJLDpeD5NicarCTiBvoDaeaj/tNzTcoz93vmoc2NE2aDCFY8nZXe7w3jUuRQJJS11mWVIlLI/jR9Rnb209qObRm+BMCwGp+lnRNo1SPr/q6bx04ctXx9KFJLpPkfponoc5o78m+bVsCWZ2frtA7NAoZiMAnVCfTLoVCGbZagttSXumdTVkX3CyAKcNH6nc0xkuHImFu6QlFpBXUkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaFjw+NJXzjeDMbfmbpglnj8O4f6WzHKqyWAibLSPeA=;
 b=fQZrZDLqOAnjASfn1ZTGJ2gjHlKSBoLFlD7aqHfUYNgoFG0nGmJxYxGyCiW060liYx9jh/SUUCLnArG0orY+04FRinQELj1qhDepyyOPb2PhSpk9ddAuOXHKVgX++TzELrrPxPLUjiQx8zjMIse26Ym7jv8+ZEndTB2p5J1Kz7IqfqNJiVZ0NTS0/uUJq/OX1K6li4tpa0wWovfW2pkkuBp3xAJnn3jneFrtniZpmmRRs0ilNHEAPykyFpF07BW+pS2xxvKgTa6r9ekditKOyXfHYgVrb2UpHFuWqgDreK/ieAvmCCLbBof2sl5O9OWy2A8o6exOO+2NwOCgM+IOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GaFjw+NJXzjeDMbfmbpglnj8O4f6WzHKqyWAibLSPeA=;
 b=Vc4RjCX+23QpVQDFRWsSDjCKt5ICGcCdFqbEXv9nHEVGQES/NttiD9cKJfViaTcTU3c711P/3HMVg9kLhmSNFU1mNBJHXalqhC4XHNNt91u6Tv0KUmFviW08ZNyeqb+lyMA7WhkUjv8JEuAZM7pK4xyvFoXYkm7CZAchj3vnbI5TJQcy5lBhDp4TvxmR9oWgGFJJ5NUhRuqpffX7wWCFKGmNgHof6PababgVSSZJ7dHiMAsVdMVb9kYbF5l3v2z779dq0QQuOJFF4w38UsCBoOnT7tNFlL3OIPLa4/7keOu3OzVBNieFoUmXFia0jDAhTPs8FwGzY7u6YZfwKXj2fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DB4PR08MB8125.eurprd08.prod.outlook.com (2603:10a6:10:384::19)
 by AS8PR08MB6183.eurprd08.prod.outlook.com (2603:10a6:20b:29e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 01:01:56 +0000
Received: from DB4PR08MB8125.eurprd08.prod.outlook.com
 ([fe80::e9de:ca06:dae1:ef2f]) by DB4PR08MB8125.eurprd08.prod.outlook.com
 ([fe80::e9de:ca06:dae1:ef2f%5]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 01:01:56 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tianling Shen <cnsztl@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH] mtd: spinand: fmsh: remove QE bit for FM25S01A flash
Date: Mon,  3 Nov 2025 04:01:48 +0300
Message-ID: <20251103010148.3855648-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: GV2PEPF00004537.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::349) To DB4PR08MB8125.eurprd08.prod.outlook.com
 (2603:10a6:10:384::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB8125:EE_|AS8PR08MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 11491559-167c-4067-3820-08de1a7495d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NoPWH6TVo0jAQbs4L40N7MMcFf1NsrX+nif5NX8Qm8WxUIrW+5GWVhaY8Cn6?=
 =?us-ascii?Q?6oxelV5UBVB0HzDQlmi8QaoCF1PEm3hxOTIl/ZVjFtoU8YFNwuyP5wrjBl+2?=
 =?us-ascii?Q?MiXbSrqHySfa9r1hJ+xMvmNKVlKO8A3NftXM8KZd79fmpU/nQ1aYUfCsL4Ib?=
 =?us-ascii?Q?FVf6kEmpW0Zmd2BeI9bnSvM0Fv2Dm4iAvQtEes4mcfiBazai9d4O0ccW6mxX?=
 =?us-ascii?Q?7bQtrwJ5BLQTBfNCuV4gJxDSo0YcuE0zXripW1wqw1VTgRqiKwvSgYzDPoCO?=
 =?us-ascii?Q?rCPAHDWKMhnQlCibSbDmsN52pIOigAUnBEgJQ4tPc5XhVh6RMmnxkTnKmGll?=
 =?us-ascii?Q?gc/8cCqiRQRfWvjUSk+/NE/8D2CJ3LT18tLfZeTSzG8SDpUryTUWGCeZQEdP?=
 =?us-ascii?Q?0+y1zAsydjavJqzkZC16gadcfNgr3rjmNnhaKOjaRPMbkOLtZEcaTB2NK8VY?=
 =?us-ascii?Q?VHaRBF55qKYzgX1G0U8XG8+KzeqPpY4Z3mUwxvfboPgbpWe9UyHeu+ff7hsv?=
 =?us-ascii?Q?4F+EkE7fpJWIV2EEeii0W8ciRKtIVBjAFigqS/ZHNhawyXiS2HNZWqNpE6OF?=
 =?us-ascii?Q?0AeEVw04bjcpY8JWlXCtuCy/VFaB1c6rSPe8S9e2nf3rUDTuaBPX1rh9gB/Z?=
 =?us-ascii?Q?vkfJzzTlRgmzez0y+JpFVRA+wmEJ40jCiP17bF8y8KtIShWnC+VfZfmvYJuw?=
 =?us-ascii?Q?9ye213EA5WJ5TvlGi8kV4Dd4P+kVgbY3lMAAQCRjYCZGEQ+NhNHEsW76UgHq?=
 =?us-ascii?Q?I0P7XU/g5VEOqfuKUHXGL90kS9a7HDxYdbddh3IKoDQxv3ecOr7R0OCVdSC0?=
 =?us-ascii?Q?VzWtjiE7G4Sq/sX61yF2i7ssB6nZ6aafjsq+tlZpUhDHPTUwQFkQ48uY0NXa?=
 =?us-ascii?Q?bCTcogcW6nHCsO6KnReM1SfWuukdRtqyuMGU4vKOxt93B5a+oDIPCl6dKkGK?=
 =?us-ascii?Q?vzQ4JZrGQPeTB+DuCnlEyrSrpOuHfY44r74oyA+eSfPBNWbkpDVtVCgF6w4p?=
 =?us-ascii?Q?VVqTonbBdiwbmUHawKRUEksdyXHeeTaEKuliWMpBpupwWXVJGzArRx+Ckomt?=
 =?us-ascii?Q?L9t9Kwi/y8J9bsUTWZhSbXJjxIvRykCGKArPFJzYtYR3dGP/IteLjR6Ufrim?=
 =?us-ascii?Q?YNQBi/imsjvSdWGLVslfVqM2cK1fiJwICrxImb/qIgTtM+Qv08NAaBdUFvyl?=
 =?us-ascii?Q?pL4ufHNYH5ysLLu+1kVPNXSeRzgDzl5/lIjwullcaft1n4nPnkPzaxHTw8Da?=
 =?us-ascii?Q?eiuNDsp1jf9GDOoloVHxyDPW98aj8PXuLttY2dLQZKfKqMYyrvSGkhEtBhGP?=
 =?us-ascii?Q?i28NAJiBO+teVctkxsHe9ygVUtOOjZuIj1yRSlho0JIUnntEZUmnL1/s2moc?=
 =?us-ascii?Q?GPb39R/DSAkAJhM++LCLVfED+KXhTXZWSKj2iKeZOag1La5BHrqIUMuF47Um?=
 =?us-ascii?Q?SW7/M0d7DDRUJBRivPdAqZr1vRqyPjiT141ExWAB/5U22ybXD71PMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB8125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i2zcqy4BouWqKwziAeYk0fGKyEWOBsdf/vZ1ho67FBKX5D6aQq1eigTKkmIJ?=
 =?us-ascii?Q?3MoSaR1kM9SvnBlmj9cGU16VDI8FlRPsVIHbDNluMv9NmTZFI9rL38Zt2qey?=
 =?us-ascii?Q?sm2LGAKhj/PIVVKNbYhymrdmjmXBYPh/YENvUVzeBDkEmUl/a1sOdet3fJgK?=
 =?us-ascii?Q?xhnBb2JwsnbZ9+gg/fFQYu00UrE0yTSAOGRcXQ7bw6m1ceJzkLP4jVGBpz1S?=
 =?us-ascii?Q?DOgFWUWhIjBUJnTixg4F8ajhT0lkcFno18Hxo2/QE+/8NNIgdauqKvkzwLJY?=
 =?us-ascii?Q?lf7cSdY4XrkN0pv9h9ONCjV7OSuIFtY+Ae4rpr+hiQe383k2uXb79nfpBuJf?=
 =?us-ascii?Q?1gm7UbE48cwJPPK1P22CdzUjalmN1wy03JWhCePs4W8kv3vFMRPCEdy3xPGP?=
 =?us-ascii?Q?OrETnU5U1/3YOmXFj8PRKZuyrDtaiEkrXqUWhAqUOkDbE5JYfnhRApelXo7U?=
 =?us-ascii?Q?+V06mbowPgztfpoaT8d+LIyrMn+89MZu7XRevI/DacLhkZ1eVK4jwbbZO81F?=
 =?us-ascii?Q?BENNdRjILYZPKSz5PdmyIJZY3NW+sQvbn0qVjpGnTtshgSW2w6m5kjOijYGz?=
 =?us-ascii?Q?mKw0WlLpylLNjZ6EKD+rR8oXnYtkgZL1hOLrUlLRLY81wNHo9hIqY3rOvT5T?=
 =?us-ascii?Q?DF4/PtYsziHFSlNLGlvOQ9skp3WA2CrMSQSVPR4ucluswFk8sjWirNETO5DD?=
 =?us-ascii?Q?W0LwLVKAHfvm+CeJuyxegvdeW3zJGREP7tq0WLqxKlS/p8tnsTrMAgXALTE7?=
 =?us-ascii?Q?80qdV4jx2QzDm1fp5f60FNGdipGP76H2VkR52hrFgceXFIOrqxzhKWpjRfum?=
 =?us-ascii?Q?3huFdrm9ErjjbRanct/8eMl5FXBJZslpnrFs09gmaf1CR9I2plFeHjR057ny?=
 =?us-ascii?Q?y86zb2FFW7eKKwzPP2pjBNYlo2us6oXU2rTpstKuj/SdJ6p54SA8839rZIFa?=
 =?us-ascii?Q?qTU60cPyBzQI4oXsG4GKx/w6xh7w5gMwtkmH5bZNRDfF5r8dB4kolwE3VeJV?=
 =?us-ascii?Q?OVtsya3cHBfT5B974uYZCL5zDxrDiuR9bTQI4h3NXlbxLVmuL3cdZzy6CA7k?=
 =?us-ascii?Q?lbpEuFAid68daA7C9jitLhvQmBgC+k9Pk1nSYPsWDd5Kz+0X/wYGw0jR8BH0?=
 =?us-ascii?Q?L6H7jmfzFtBMZKh1tn0778GTwVNBHB2ESL5Ot3sFSBSguoe0vLyNEDAsUCAu?=
 =?us-ascii?Q?/crt+SEA3jTwWzYYcas7tN1Q3aJnPP1W5vMjaz7nZm65DUNg9Ei51gRzog4w?=
 =?us-ascii?Q?+7mcBs0OL34utR2YhMSyplpt4XklCJFGWZ0VWfqnKvww5fw5ZkZUF10UL/8i?=
 =?us-ascii?Q?6lDf4QOhZbAJEb5NPD8hxKngFD115hGnzrlAiDQ1tSP6AkGbV69tvDc2hrNN?=
 =?us-ascii?Q?FkwzGBGWhzvpBQrchziWVo5gJ5EEM7zg3C/s90u8kktl/+o3kcIieOYyd2NG?=
 =?us-ascii?Q?dTzahK/Dne3IcCY+u9tePYFxnLUaz1HvYhZLB6JOhrTBU9PGCtRKSMYa6oOi?=
 =?us-ascii?Q?5iuv1CGg044bWNIG5HtxtGBiLYEsLZA+7W4GIsDfOhEJZiMwNgxSElSBkJpf?=
 =?us-ascii?Q?kTAWjc/zU2l35BJEjuFlAsydx0O58gaK/l/a92/vpDM4H5+5VmDSD2Y8NOg4?=
 =?us-ascii?Q?9uH5cBBo244WA1yaFATZP9o=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 11491559-167c-4067-3820-08de1a7495d1
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB8125.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 01:01:56.7182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKtgxRAXz/jV77z/inYzs+dL7hjafOeCUA7rU17jjXziVOlDIp8c61mD6yNZxrCSj7hYHLrt4aVnPSxwSEQYozvLAcE0StAj2VzAb5wfONg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_170203_661268_8870D812 
X-CRM114-Status: UNSURE (   9.85  )
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

According to datasheet (http://eng.fmsh.com/nvm/FM25S01A_ds_eng.pdf)
there is no QE (Quad Enable) bit for FM25S01A flash, so remove it.

Fixes: 5f284dc15ca86 ("mtd: spinand: add support for FudanMicro FM25S01A")
Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/fmsh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index 8b2097bfc771..c2b9a8c113cb 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -58,7 +58,7 @@ static const struct spinand_info fmsh_spinand_table[] = {
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
 					      &write_cache_variants,
 					      &update_cache_variants),
-		     SPINAND_HAS_QE_BIT,
+		     0,
 		     SPINAND_ECCINFO(&fm25s01a_ooblayout, NULL)),
 };
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
