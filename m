Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090FFEB64D9
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 04:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPmu/g9mKnEQMNVYIvfqQkDkzWvbsvsd06r0bmLsMHE=; b=2MLGgo4ERGqAso
	fgKcXZQSnK2BAD/qzg0J2ZF2O3iY+zvqpFCZHA2LEnYPiE4zpsDlRKkFucZ0NA4yKnPLhynNPlU3Y
	TdxwCvvda4Fvh/2CuAQR+obRJIvCRSCJC3uisz3L9Yml+hfF3QBCrI8xNG9a96phfQqml789PmjYD
	2q2qXubl9AIGoFjl1AkhiwBw0wgMa0YZZ9wC2VxllXzvzHlMj4F/qeNQde8iNzmkMq88SO+cefHp+
	OxA9e06B+bYNmzmRzCmW4t8HV7KS9CbO5t7uE8MMRZQwTO6r0ZzbmwDyosWZCXvSWo0Vjj0J7ojdY
	ffsQOLpeihBBDv85+Rlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckQ-003Pyh-0a;
	Fri, 07 Jul 2023 04:07:10 +0000
Received: from mail-tyzapc01on20713.outbound.protection.outlook.com ([2a01:111:f403:704b::713] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckI-003PgP-0s
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 04:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DF+su9SEvbbKhuEbijPEKEzUxHEMki/3p7RFxhLMhd8eICmV2mdqpf8MAljE+cTbHazlWRaZzpBhMIntg1ZQpTZS4s7sIDFHKEgLjtZcpagwdyhVlbKormWdcTKGW/j4x1eUt9b8yq5xaOabtIa9PrabBfoKDvwlnkHtPjNQEmHG3ampfDc6YN2eV6b4/O5uXipFBQFdNKDCmpgJUCyfdkKK15KF8vq8YJrCRddwwI5hWmtB0Zhlo4ykU+c/6TXhbe6B5iRrf6X5GSpsRnXkgmihi6HzrIzx9OWjDn5T/QupBO1NkEllM79jvTHO72KSE0xD0dvJKJ4Rl1aRA+TXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjRAjnMaal/P3wu6xKBSm/lExPY9h7o4aVevsB2dRGc=;
 b=AAPSEBBvifVdYs0uaBLDf6Ie5Mu6Mg9QkqWVR3QrzAqMhodgQxLCyiT3v0/iTa+JepW9pxorEYTF2bR7WUi/iBxiJoD9UGqXfogh8TRe5C7D4gblmIsqwJx0ivKZJXCfpfuLwyfkCl0WgIATJ3VLsocJWgXoYBl6jBkdCvVmyqlrFwaeo3PlStnR2i1q5dXev+rolNNHcZ6p/ph2dYj/MZmV/hlFq0DvzFQOby8fJICo4qvz/crsSP0ozqPLavbhAFWWziMjRXu4g3aSQVQQ5nh+XD2c+3PoVhVI74Mu4WSq0K0LOMHD4G70EVdbr+Z4meScvq0IwnwdWUkh/2VUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjRAjnMaal/P3wu6xKBSm/lExPY9h7o4aVevsB2dRGc=;
 b=fzEegoIw4x7hDl+vbE2Is+xYeXEtA34Umz1IXQu0/jcpNHStLQDu/TaHZ+4r/WTqSz5G1lhFS2ks+qN0CkEx0YcPMTTanz0Fp5IcN+XPOalgORe3V/F/HrC9/F+o02oif15J9I7G9Ro27PJrwCh4E6oenrKjmSbx7FtneiD3vyCCDsSLKf0ciHbrHVWVVIhqsfQEDEgGbxLJ61qwVkJtWs7Q4TGGjbtJtrzeopRm4myAAM799rF8MkwFXZ4Ukfa6+X34WrrWs/eK3Wvtn28RSrT8VGs1uL4Wxq3h7WN1Gj7ZTs1o82OWmITJ+wq9cMCSdpSvQtYkjGX8+x5PCj7d5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5470.apcprd06.prod.outlook.com (2603:1096:400:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:06:56 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:06:56 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] mtd: nand: omap: Use devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 12:06:16 +0800
Message-Id: <20230707040622.78174-12-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: ce92174c-ac53-46b1-5936-08db7e9f9a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i5Lk75gVTI8Ys6dop0NQoBiOQl+s7zxTtbopvdg6XnFYocV5Nzd+qNFcr8BgBcmViyfZMn8FDUxZueCjLA9zZb8AaJ5gTMPnPndGRiN+7VG3dc2iNJvElKI406cHqQxhKbgFGN485FLFL6/83bMeXRsm3GGU3uAEo02FZqqP7nHlqTJ1XDNaqb38oZM8DtKpOBToUdgQSYRN5AaCMn4YU5WIpj3t7nqJOtOwDXgc75nRIwEReIjGVbjETVfFnr1+hxu+mxZcSrRA8JXwuCnvI3VxQSTTKn9yum7TEKH3aiPdc34myGAznpErCcEcz7pbcolo7n70KE9CVCbL+wNNLBjyBN3IuyNJGBPvH3+ECBmYsg1FKGrzXj7XeyNqaD+/QOESuzYwLmDm4R9/K7tx9LTez1uu/lXLaWGsbKeDk+97varM7OTjyEvhFEasujMVpplAWrkZAOAEEGHN66rKihbprmhtpXnHqvX/sq9Fy6pgfqafeqqiW8dvFzKYeZPzM1kuI6rmHC478Dl05pTXNeky6VPkWnXleieCEic3t+4faPmQbhUDvcswFcjb6O7Gf2rJRqYblmLa9bui5QoDToZ0bhMQ4g2wt0s0uq90XDXbBArzLURaTsMWJfF0pH+0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(478600001)(6486002)(52116002)(6666004)(110136005)(26005)(186003)(6506007)(1076003)(6512007)(2906002)(316002)(4326008)(41300700001)(66946007)(66476007)(8936002)(5660300002)(8676002)(66556008)(38350700002)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DW2QilqYaCZqg3tgAtLh8xw9a4bLQhP10V5DXSg78xGbpq5Cn6sUKIutl36v?=
 =?us-ascii?Q?ABYpyErBA+YbzkiczVaHxIqAv7NOFFgS3g4Aj/AwzrCiQYCrE3mlEHjG6dzb?=
 =?us-ascii?Q?Inyhp0ymHUPgKi1a8xb5JcjanCthyJuArBnSAvoqA9mzAM2kUw9zMO/cC5ry?=
 =?us-ascii?Q?GmGQNLDQ3EDSlC/xlfyTQ2dGmAkKUr3o/8m/crtn1kaaaM9jMgUMb8UVzZ3k?=
 =?us-ascii?Q?Xd0mvllCNPquudHrSrBbKSz6fl/GTMd/UtUyEqIo7vWj7oYLld0x7iPhVoWl?=
 =?us-ascii?Q?o+SgVC63krcXtV2dbuMsLyhNai1CsqjLFllOIg0VOjcUaAYQRjEhY+AVAWxU?=
 =?us-ascii?Q?dDocMZDv0x7AqsgOtCLWep+zq68peZ+8C5PL2z6vR3huEPoMRfwxW4+vyOKD?=
 =?us-ascii?Q?KLO2DXlZYPnhY9vqt4ZOu46GtCEvmgehMyK8fcF6x9ZuOk/3FnQVE2ghPXdG?=
 =?us-ascii?Q?6p/1ZgaVvWQqKo3Ex2gXxkANcgR0JIdgQq6A4aheePpEGiDY7ZGBUdc+uhK/?=
 =?us-ascii?Q?VAh0H5RfFazLN+KW8/MbV9TelYKzlDMIS93pG+26y0wknfkw8qjvUZODzq1f?=
 =?us-ascii?Q?2DQ4A9fOFrMDj8vQYGj2qkzRiKBV2LU262s+WdlokAf+bsJhipCkYzcVWUKU?=
 =?us-ascii?Q?fIBlU1XjNKgHFYMoPRBwgBDGG6Td2XoTqd6dRP+k9Dcnx5Zhr+sTlvkcVd3S?=
 =?us-ascii?Q?znTf7yKcJ7192WYMXIW/BIv3lh7lIum4Derk4XehOvlUejssVu+j3wsxjnhm?=
 =?us-ascii?Q?cFL1hQXwS0LwAnFnxgi8ujhH9IWnvf4XaVKpZLM0sYaMZ41RpwC4MWhpxNEQ?=
 =?us-ascii?Q?23U6j5UtZKCFgmHqiuiSRR7OamkKP/hHMBk+H94Y98hl5wTf08dsI/T/ZpTZ?=
 =?us-ascii?Q?zF5rwX8hsjpfuvGQ19k68bJLtPzytssV4OpCFLe1hWBCpQtkUGbBrCs1DltN?=
 =?us-ascii?Q?i5P8/QotBSSaGdCNI8ovsHYpqTWTd9Hxr4PXAlPrdpTcBJye8TonRlv8nEt6?=
 =?us-ascii?Q?r85jbSFsKlbY4/DscAC5iihQd5S0NG7pwEdZWOxxW8xUj8BzSsjxVctrhm4a?=
 =?us-ascii?Q?iZMw5l9biBsBODptpB+S3dKCAUO6eqGKTmxHV7MYBdQafTrtkADhhNMAVxmg?=
 =?us-ascii?Q?O2faoEyhR6Ywrm6MjZ2vRLASjErRfIBtZP/03E9NnJciLaBaQGnMZbZSuwRX?=
 =?us-ascii?Q?rFIhIljcVMmmelvAws3yUUN4vyz/HNs6ZzKmtRx6hxpw1CCB9zBLg2PEfmhU?=
 =?us-ascii?Q?24WGbE7zR96hRv3ONrG57QiAqxgA/s8rYR28UNrDFbUDil9/Wa9kvQgPp6z+?=
 =?us-ascii?Q?qD1Ut/nrPgTr0FOtbTYuGQaJxsFpfPu0rZPFbBzSbjztUnOez6IoJ7WghAjn?=
 =?us-ascii?Q?G+X4o3IRfUPQANzRD2Fq6agE3W0TjuxBB48nrGLkrHMyowTnwRZUOGd6cDf7?=
 =?us-ascii?Q?/DoZ1pl74bsmxG6egOXyjXgbnLIJz+xCmrWxeMGVrf0Ogqied0ARTbeXQsTo?=
 =?us-ascii?Q?W/n8whqvHsF8t8gyBEKcIMFQITbDzp6WCwTl329lSVon4HqQbrkUmsuP9nxj?=
 =?us-ascii?Q?hxZh07R+mva8jLASMnT9wKOu3+cMTyUy8/r9FDza?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce92174c-ac53-46b1-5936-08db7e9f9a99
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 04:06:56.2988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jAMAFfSdVWEdYURdmpJiRb91UVbsGU1UTuGWX0w168BAdqeZ5eaDENLaxGN4eKOqAmBaUAzyBhY3iEJqm7lgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_210702_317403_D75C9B8F 
X-CRM114-Status: GOOD (  11.90  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/mtd/nand/onenand/onenand_omap2.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index ff7af98604df..b39aee023103 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -467,11 +467,9 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "error getting memory resource\n");
-		return -EINVAL;
-	}
+	c->onenand.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(c->onenand.base))
+		return PTR_ERR(c->onenand.base);
 
 	r = of_property_read_u32(np, "reg", &val);
 	if (r) {
@@ -488,10 +486,6 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	c->gpmc_cs = val;
 	c->phys_base = res->start;
 
-	c->onenand.base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(c->onenand.base))
-		return PTR_ERR(c->onenand.base);
-
 	c->int_gpiod = devm_gpiod_get_optional(dev, "int", GPIOD_IN);
 	if (IS_ERR(c->int_gpiod)) {
 		/* Just try again if this happens */
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
