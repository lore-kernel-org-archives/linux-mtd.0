Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA34C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 10:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yZkBjDVmFEXvkYVvkXP901ca+/0FRTn/OjgMrtDlCds=; b=n9RHPge7AztvuY
	RcWBZAvd22Cdq2RZMOQfot8mbXUnX+xroQ9aWjn9eh7hJE17EFj5k5tzhh86LL00kDjqL79dAEvXO
	vT9TnC27yJHEk6xAUNAntNFDqDejGZfX/hdGrr/QfBO06O7wLqtA8Efm2I6yLUTh5ZA0ZsMGN6jiJ
	GLaEIqOnP3EmUIXIbZQZXGKBsoReNGaPpM/qBxSkbSGwIBDl/nRST82pPFdasVmqz1jWdbiBHwSda
	LUOQW5+bDo0y5Oal5pn7BRF2Yvd6RjgFuOwCxZbVc/+XkcgqZWgPEfZf12RLkCcGRWvWoObU3J1yl
	FnDBFhEVtdQ5birvNw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtpQ-002y2U-1X;
	Thu, 13 Jul 2023 10:45:44 +0000
Received: from mail-psaapc01on2070d.outbound.protection.outlook.com ([2a01:111:f400:feae::70d] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJtpN-002y1F-32
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 10:45:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/PI/hWGMll0+eBFTM8YViJVYG3pI/3JzjsZu2GgM7qWnaVgJFAUU7i2iZ4LHFNykGLGTvsUFMc/LhFPWNggf05+oK/VXu5Q/9KLMNiDKsUC02MeWS07pxP4eKGPyDZnPL6A98piKQ2g+j45KmjovTQ47vp/xpTTyYFtwv8oG3ZdtCnbMC+5JMk23MwopzAXX1sfnyqS9jBdb36eS18iZEvBIuqYs51s58MhC9m1iiVIbMVzIWSX9neyY/8Wn4E38+1Di81mdPuifIN/20FPgBbC+cx+xG+XXjtYaY80UKf/8KFvScLZvvk2XDFKNIUFKwFX366uR/qYcO7vNwzhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHhZRiqTtjNAX4MrJq+vd7EUW34Wu8UDCOUjNq/dTe0=;
 b=gCoZmE3ohxoMwDfNV8ijnLpnbNfwXsWagjChQJBREt3zOxx52+V3BLbWY634cNSb6llJsroOhV9QpvKgLHOb/T+Exu/ob/lEUAywUuFGWPNZAe3xxecjahBEdPl/p6BfcKIX8TXfAhZmeNNLLZptvn/lR+ci8NfhMHceXKoJFVsSKsfbcqjV4WdoDiSg9d2rUs+Bc5xGjv+fExgzApS7p/nbqt1ppNlfopYROXHmrEjZOo2rrC/fz9xluO99XAqKerYA6cAagXH80ZYAIypLHMtsHhnE/nssifBNmJwkaOutiKtKmNAWNHp6OkCQ0L367b4Df0gCVl+Qaa5RV8+Qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHhZRiqTtjNAX4MrJq+vd7EUW34Wu8UDCOUjNq/dTe0=;
 b=qLQo8Ns+pc/bIUJeWDV1to/u5Gfrk7h4iXmBCImdZa/ITq3RNlH4P8Hx/M24gtBacvQ4icW+aE78I4mg3HzlMBPNDotBC3P62//RxalCivRDcZv2gx4xLYZ4KMMeIhnr6kuWieHGEb3Q+byRntPYrr+ib92IugOt2zHFaKbtGodfnpFNBoIcjigk+UmZ64ipAEpAAeYVjn8ylLmOp7VMyWr5QRB+9XRfGNRDQ1qGix48N4hcl5zVWOP1BJVNwpfdP6oyNOgB33XqauurBmWb+Hzo5zUoJ7t2vUMSsRVCdkSuHsLQyf7v7UQcCG1LoGu3esqi/A8+RWqzCiUF8YBFfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4123.apcprd06.prod.outlook.com (2603:1096:4:ea::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.24; Thu, 13 Jul 2023 10:45:21 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Thu, 13 Jul 2023
 10:45:21 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: nand: omap: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 18:44:22 +0800
Message-Id: <20230713104422.29222-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To TY0PR06MB5282.apcprd06.prod.outlook.com
 (2603:1096:400:207::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: bc13d717-4e90-4b61-170b-08db838e40d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJXkEAYdVJ5E4mA18PdrY4Ef7CUXRlAJZ2gsD8PLIleveacReHuSHTr19Xpm4iPnBcOonYg0GzJO+KtrPDAAkVF3VPMv6ewT4mNk8fpQKuvKP2ZZE0F88xsWr+c8jVrA9ZuC4+pMlbr9m0gdGPuOHxGL8nTLruNYzV1+Q3y5FApbxLA7U1dPzOXCHULZrvmjme+F0PX+Ltel6jE0/tgi9D8r6dyoyOEgP3zNcguGbIjWMBzaPbqd7q1aatbxwfJ9v572/FA6YNRAgnhNu70FTGCLIRb30Cb4Q4UmC2aIpCYBqRJKeGcg6k0oldkCb6wG6UHLRBXaTkxMlWpFEM9760UzHOSHK9XHUL+sfBH7iE4laGt14Ghbuw1qz18LJkA1BpbUORf4bbjy6xVBJ9lNeD1F5AfZFHM7kvarX4jmc4vt2Q9GUdm/PfIhTfh+5bBzDmobK/EhkpyAV0qAof06SZY0gUht1q0+MoYRk9Wbf2y4RO87VBOXO457ZtjbHr0K+qJHc6KOARaC63ue4xn5nJUxFXsnjXNOKHZWHXQc498aGJCZVA7+WWkf/gwrworDUYiqOTMqgq/D7T9+rMvwrle1jf78Lu6ZonUwcasHIW+l6wLJJUZ1MBoXQZ9GYbhF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(451199021)(478600001)(110136005)(52116002)(66476007)(66946007)(66556008)(6486002)(4326008)(316002)(41300700001)(2616005)(186003)(2906002)(8936002)(8676002)(38100700002)(6506007)(1076003)(36756003)(26005)(5660300002)(6512007)(86362001)(38350700002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KUtGq5YpTXXOx41eweplUYZ94/jLz7mAAPxMepPO8+iOT139uztibfB10vhw?=
 =?us-ascii?Q?xcURqNMPAw/Zco9pOAxVB8v4dd/xBl1TRGC/9CeVChNeZE8dsSfHcF3/ReGn?=
 =?us-ascii?Q?Is97IIJ/YNe/pVO1+nqJpfFzloEheb3iJ47RvJmTK+sDufO2cEIPgF8NncAO?=
 =?us-ascii?Q?ZU94W+XYnaFybFW/m9VRg3JJgLt2YIaNlAUwQRrSsEmmS8E3KQpExTKkoDqC?=
 =?us-ascii?Q?IuWvdM03at1TvJFQ+dyJoatsYLHMp1VYkUFAuOIRKWHjFy7d9gXlUW8RLz2k?=
 =?us-ascii?Q?yr2HIoL/mZzOhRiuNWcLo1wk7nMFvXywYBRza24Q7FrHPDIkc8ZktmK3zVZa?=
 =?us-ascii?Q?yEkaBeq3Pwdsc61D7LOdBFMAuuM2h8k96V5Zagiz0cWc8WwCTEXUx7Qok0Z6?=
 =?us-ascii?Q?QSobmO8l8X3Xvbq+lMP/XXiVRl/ydotUILkFcTTp0OQOUqJzt1TCpw7v3YZ6?=
 =?us-ascii?Q?r1A9LuWqjLWVkhA5ja/4D1MQRmzM/lwDlgvFDeb+Vm6cj4gQ6/f4tv5u3nTr?=
 =?us-ascii?Q?aAzW+4COyj+2nc7J1q/At9/TTHJ6/Vc79qOy2tpKtfBxVHM5amvp2fX/3+wY?=
 =?us-ascii?Q?Wvd4q4YGC18k32v+LLtaEd/chaN+eHtcZ308F9aNOgQTXUkV5FQXZC4o+Nvd?=
 =?us-ascii?Q?55Lj2aVh6Cr8HSV/X32o5Zj+YQRu93hxZ6XYRbmZhr7kyZ/8WVL20aRADPxD?=
 =?us-ascii?Q?MwCWy1dnO2LyVZQ3omFI+YDX5IGB5BCRdRh/B60/xo2tAideX8+7R6mFIlXc?=
 =?us-ascii?Q?fLwm65tpHWBuEJelFNmXuGVWL64qxweR5qzEGoflNYPGoR/BrDyFMNCU1aQ2?=
 =?us-ascii?Q?1qHulfUe8qeO0UP+6AQ1tzUJbrygaEBD7qXskuzyJxonYFM1/UWG3nrGpF7Q?=
 =?us-ascii?Q?McNIMhMYrHbRtsZcbHVEAE83DPdPgEivhECYsBvNHgoB0A1Veh7abz4ziyiR?=
 =?us-ascii?Q?/J+CWmZq5eLuIjwbzsue0hPk9O2OUCDm/xkqptuUCHCYaMQZPlYUOvXam9/s?=
 =?us-ascii?Q?VQwRrAuBw1VRd9RElrxQFUGfolm/vWCtbY6RZB5ev/BklJPw2FfZZJYmpIOe?=
 =?us-ascii?Q?scdIWCb5FZYlC48SOTmt8Ju9E036hTCSoqAH3GKUQYtqJbuVi9zrO8fg6Jup?=
 =?us-ascii?Q?ery7il1+x1h3z92HIKKhCIktzW5gv99RkmLXAh246TUGvLt9j9w7hdGkFh05?=
 =?us-ascii?Q?qzGZePUJe7dVspU7VAWSb1yXK2Xr0odvQP8z975EOvcfitzHojZ5nDr1yCvb?=
 =?us-ascii?Q?xrCCamsB9Wm1odpAkWhzdhzpVA1FHrRM4nMKhFoiecKXyjA23hx+DJGU8WZo?=
 =?us-ascii?Q?oy+yQAAlqqdbT8X6ExyMk/LqryyqDg2LHjUMpS6yH9oKzGuMgk+Ojodb54yt?=
 =?us-ascii?Q?BJMaRZvxxil0LqQRsjPdMP+ZigTUM9sCebgFBzo4Aq0bxjpNlCJzH/NFSGGY?=
 =?us-ascii?Q?AoZvNqasyQCZ6dk3Cw48vzZRvDhv4CHOD6q7EzZl+aDNer6RF9PUzU72olty?=
 =?us-ascii?Q?7VoL39vObZHT55tAHgAQ1oFy5mtA49yOeaOpgL/HAG66lIfWwFai8jTUZpwi?=
 =?us-ascii?Q?Q7SGKpzknqwINYboMEZFZOxlk3yIA4IpTjcBxcqj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc13d717-4e90-4b61-170b-08db838e40d7
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5282.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2023 10:45:20.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7KYnnPKz7GzU3JKwfPhA0bqtvPQlWVXnqdckxFRWfVVEYKcper2A9GDbf04xlQaKm4xXY3u/uEMUnhDgr+pleg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_034541_983261_39472716 
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-Move devm_platform_get_and_ioremap_resource back
 drivers/mtd/nand/onenand/onenand_omap2.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_omap2.c b/drivers/mtd/nand/onenand/onenand_omap2.c
index ff7af98604df..904df2d1538e 100644
--- a/drivers/mtd/nand/onenand/onenand_omap2.c
+++ b/drivers/mtd/nand/onenand/onenand_omap2.c
@@ -467,12 +467,6 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "error getting memory resource\n");
-		return -EINVAL;
-	}
-
 	r = of_property_read_u32(np, "reg", &val);
 	if (r) {
 		dev_err(dev, "reg not found in DT\n");
@@ -486,11 +480,11 @@ static int omap2_onenand_probe(struct platform_device *pdev)
 	init_completion(&c->irq_done);
 	init_completion(&c->dma_done);
 	c->gpmc_cs = val;
-	c->phys_base = res->start;
 
-	c->onenand.base = devm_ioremap_resource(dev, res);
+	c->onenand.base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(c->onenand.base))
 		return PTR_ERR(c->onenand.base);
+	c->phys_base = res->start;
 
 	c->int_gpiod = devm_gpiod_get_optional(dev, "int", GPIOD_IN);
 	if (IS_ERR(c->int_gpiod)) {
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
