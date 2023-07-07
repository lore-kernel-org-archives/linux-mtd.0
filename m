Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EED3C001B0
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Jul 2023 04:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIZuD5Ete09w/p/Bw4etI4U8nUUKpEzDW0ibHTsHRmA=; b=YgP0G/8H+dtv4A
	tTuuAxX7KBMfewa2vNPzUtxoXaZnf7yMDkUlUeem+O7zuqAMLBRBOSvkYPU86pM0ToLmnl8D/6P/T
	tUafAlMe2pOZcKsxtQjdRuoEE4eIIus0LoXIXUjZYbtPQZ1LF1tzu6M/drs1odnlu1Sy5ix4A65kA
	YWwoUgFMAfS3WN9Paa8ZzQUIhgCPcORKEngyMcovkkd4kCsqUvsgZU63e4Z6N2OTNKUgicNvc3Ao0
	zfjz43/w29TKdOp59VHkX/6xRUEz4mFcveVjns/9dSRP5p4+sEzjnLr0oADcVo1uFy/QLzNyKYFwM
	fxFnsxhAaUaWeiX2FINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckS-003Q1H-1t;
	Fri, 07 Jul 2023 04:07:12 +0000
Received: from mail-tyzapc01on20713.outbound.protection.outlook.com ([2a01:111:f403:704b::713] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHckJ-003PgP-2n
	for linux-mtd@lists.infradead.org;
	Fri, 07 Jul 2023 04:07:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHmJZT+p98ybDGVZlzWtQ3BeG3pWUhJ1HZPU4ApmDwCLk1cdFCpOrhMu/p+DHdszWVcNTLjk7qazEuwfopHWBjc6JfBBs81ulHFq9wq9xjV+xHSJLcBrRChEPve+QkHN8ZM7G3dQTEcJqDqmKwdOC7ciOVk364fhkFAePROlihile2MMBE/kl34E4ncosVaUUvrctyE6P7amSWbMqbT6SBmJE7e+RM2HbRq7NzQ+qypV6JCaQauntaEZMJZWWr3IhqJdBYbvr9PhqeTvMzfIvVqtnA6xjSsavvAooFrXAdhOkXgvhDTut5H8VEwS6OCZVAJIogJzi7fMpsUqaFySXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLnedmqp0Liv3jUq63+vBWQ6QaBCDUwtBoUs0ehTfxs=;
 b=I+8RyEA92Ud8vG6NjQEtHSY4VFqJlY1rZwqnlOFZREFhRLEEGVjwVh+IH8h5xfXVZnQZR6tLM9S+ygS2Mt/pIi+ln+uJ2Gd7TyQepldA2cPHbybQLF6Lzj41+wnBa5lOf7lKz5DsY5c1zBiCeecNiGmCwQgE/JiZRDMsUHLtLaZzCkaX5xp+PrWHaVx3oHe4H5J4ddWw1rS/PjrDQFCeuA+95eNQj+Sls1Bc8A9BUTRnogTP97623CjCEwxMuDfHgm+bWMXrbOoY4+h+9kgw1eYS9nxck1q049tICky5Z7UUcYE0alyZeAS6hFynUnGqFs0v0jll7HvNIe0OBpBlkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLnedmqp0Liv3jUq63+vBWQ6QaBCDUwtBoUs0ehTfxs=;
 b=hCSP9vfHnDSb62tZdwrWhBT8UOq/Lr8Ngif7OfSZMl73NGcg+toL7JvG0Haxsd3qCOJdGDg/RXKiWU0YQyZbN8mkZnHHj44BYa5+ACzrkRK5q0bht7Xc0YVqFjpGUceKla9fSh231jP+EuXSYmVccS1rWFDEH6Qwgod0/G53kvXxIHBenFg+w+TxoPANE8GdCL564bRLjoDE1AoWeFkBaTO02CENnEigqTGSQPJJjooB3JNEnvTPi1qubX5WbPNk4aLK4ZToa4gwFLMlATPigl2HyogarPydo1Oc7wz3IsHV1Qi7/Nj9ngNbMCueNXmtGUFx1F+tLk7JaO/SCSWRWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5470.apcprd06.prod.outlook.com (2603:1096:400:264::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 04:06:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 04:06:59 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/18] mtd: lantiq-flash: Use devm_platform_get_and_ioremap_resource()
Date: Fri,  7 Jul 2023 12:06:18 +0800
Message-Id: <20230707040622.78174-14-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707040622.78174-1-frank.li@vivo.com>
References: <20230707040622.78174-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5470:EE_
X-MS-Office365-Filtering-Correlation-Id: 472c6a2c-ba51-4a72-4e27-08db7e9f9caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q3s0HuUM7nuaUU8c0NuUzJshkF6dzkn+xnCTpwvuVJVQGt/gU4xxxegCVOXx6VDZBjViY3TJsxsF0STqC6AhqiI46DcGtMRqJOHy8j7Auj6FjQ2xgi+LyFvYniUmUSWHhbQ/rD3/55mtTTm/hllYvCOeb2OFSGXxZX/JniUb0xI+Hp1Jl/K1g+yUjzvmwCFanm58fzhvcCyXpgxFbsc8hzOzs/gGwjoFWUbPHf9cQ1WMVEdZp8M0jXzGBopiW3ORbqu9zUcbmwac/xtAQI3TZCb6IrGcM4xEu4XlfCPk3jva8Hu2IlW3WKj0rKaTWYsvzi1QttI19Bo1WyPPHFIbL1csZszpEJcaFrWCcSPFpEl0bA1aiDO//s+qA/hURAnR4YEiwc65vcILYcuc74hSdH+cap1brLmEEKIJoNmrGB/E1DrkWX/VFWtMEkp0xa32A8D3EUtuKQ9L7t35NB4t/C/UP8u27XSPaWWq1FhaiZsPvOQEDRqt/6bRc7OZaI0r+4KCF4MqCOkksyP51uz5wfH3fgxZaX/tPgngzgjS31F0ZnpcUApHdpEY2NKI1LXaxODyuleVfvsmRue6xz9fYRhO9/XGlVmzZNlKLBbcTmwbwEjcZOO8cn9FOF42uYBP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(478600001)(6486002)(52116002)(6666004)(110136005)(26005)(186003)(6506007)(1076003)(6512007)(2906002)(316002)(4326008)(41300700001)(66946007)(66476007)(8936002)(5660300002)(8676002)(66556008)(38350700002)(38100700002)(86362001)(36756003)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wXLgUhHDv14ZRQsbWk9pB2b2pXeKuEfVJwzB6O+9QwHNSXQQU+aYRMW3Z483?=
 =?us-ascii?Q?IHScs6LdHbcmvpxbRvmidJmtuAW6faN4MKE2+5OvtgXvubM/usy+CHCZNeXU?=
 =?us-ascii?Q?mxwzEna4S/CNEwPqCI2A2AaXJvMnsvK5wT3kYwmI1sCQ6BFVPQb8GrGt02Ae?=
 =?us-ascii?Q?1tCZtqv3Lca1Wqsivcoz5A2q15VibMfz0ePzE19Hz9+X+bXGoH+xZKgob5i8?=
 =?us-ascii?Q?mMbMXwoGeiqoQbxEgm8t2c6lL0RTNsn6LCVeton3GxHQPuEWrSp+xm3y6K2B?=
 =?us-ascii?Q?CHaSMXZOTwN9g/W4KEQW+KtPTH42oxykpV0nR3f3s+XtFtOEzwAXwvqWHtPs?=
 =?us-ascii?Q?mtshGGy8JaDD0u5RbSipiXSUMeNA7yMC7EzXFLCosViObNE9ksEvdCs1ezFK?=
 =?us-ascii?Q?CEgj06b8Pip5enCWD4hzMnrD52iRkgVI2EtuW7aFwLjd7Tg15vFxqOS+K52k?=
 =?us-ascii?Q?LjRDsbgzz8MBryeLZYR+Dq1GDV/E7X6rraHOZvcrhQLJul//gcCwM2VOQXQ5?=
 =?us-ascii?Q?RmDoi/tqOP6l4PL1nmCkUIJ8u563sJecYQjQmorr1uUadg3298Ig6cPYyrfw?=
 =?us-ascii?Q?OLmqI0EYnVXiYdFw0BmWdWPibhawq/HIIds5Zen9XxKRgmTqugh3KDnyx5Xc?=
 =?us-ascii?Q?UTzkMM/0/UVi08cSM7BWNZhLHg5flbOjItzcYhNVaDvnc8Y2eRR7+MGn79Hr?=
 =?us-ascii?Q?dGgiyDDcqRA4QFzvk25vNxDbVwqYYaKEuIf5aLxo7S3jM8uigBzSpqHVvU5S?=
 =?us-ascii?Q?ocu+TahHFGBpBvadqhcBE4n3MLAaH990XSeKyRFRCQb86Zd2TOHUmgqx7Bfk?=
 =?us-ascii?Q?WyNJxefJs+BLr8Q20nf5hMy3LkVgTNqIdzxXTEUlAMpfnRHFNyMWNlyU6Ffp?=
 =?us-ascii?Q?cYQBXcWeYQbC2jyRHZbncuIXtd3wzayjsXtHcrMx/bIoR4IpBzMyRmmBWmnU?=
 =?us-ascii?Q?mFg+oyjmxOWGJu7j24NCQvCabSeL1v3Ck4BBhA4FVeoGJy+FgUlBqv2QuaoA?=
 =?us-ascii?Q?x9k2DWVZvUpa/mzvgpEbVzLtzKtdkjmrzHZ9dP/BKEuEWO97Q5qNqo4SGGk2?=
 =?us-ascii?Q?g1+zAaPxzRtGPVqOLQmldPq+VQU9FtA0ClAg27RqAVcd2Ezq5vT3oHpOzXcm?=
 =?us-ascii?Q?M2nVTlmN6vNYJfS0QW1ej/2QWfnuNvS1HHM8sAlUggrbZ2KFqJy47tRNevIv?=
 =?us-ascii?Q?NbWglIjjx6wWOpq/+DjTsvT7kLtYNnLCOGDrgbJdk44/qLUyGOJoKRQgbHVv?=
 =?us-ascii?Q?DIm34eeBMGx52aRdZ+TC1/lO8z6zwCtuf1g5JPj1++JKk6W0i9Qht7uCLVgv?=
 =?us-ascii?Q?247FiJF7LbFYdmjj+K8elWJuql7leQqh3Gda5eqnLtPPpLXJVpoI5RuWKGm2?=
 =?us-ascii?Q?0Oe/2xb1BI9KSB7pprYrwknFZgkn1w//odyIYnEora+gOUCvFXKv6EZh1YnO?=
 =?us-ascii?Q?rE1ItwCGan8fqIVJ0D6Wrx4+H2a5fyPIYpvbueHCevL2fz7/0zUajnXVaVVi?=
 =?us-ascii?Q?vhWeWkyLMRV403uLYrjMN+u9BpTXD/XvNzXJtOfwv8RxAky2FmXVEVHYbHq7?=
 =?us-ascii?Q?t3noUdvuqQlJb+YeRJMgSOex7mD5niqS63Zeenpr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472c6a2c-ba51-4a72-4e27-08db7e9f9caf
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 04:06:59.8000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjAfgKtV1skAXmvRE4FS15BWsKedXEOQ5b6cF2wiYYFx16cWurtqJMkGUZInBb2etn9N3vrUc9rYhae+Msh2dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5470
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_210703_910771_079D193A 
X-CRM114-Status: UNSURE (   9.86  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/mtd/maps/lantiq-flash.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 67a1dbfdd72c..a1da1c8973c0 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -118,11 +118,9 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ltq_mtd);
 
-	ltq_mtd->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!ltq_mtd->res) {
-		dev_err(&pdev->dev, "failed to get memory resource\n");
-		return -ENOENT;
-	}
+	ltq_mtd->map->virt = devm_platform_get_and_ioremap_resource(pdev, 0, &ltq_mtd->res);
+	if (IS_ERR(ltq_mtd->map->virt))
+		return PTR_ERR(ltq_mtd->map->virt);
 
 	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
 				    GFP_KERNEL);
@@ -131,9 +129,6 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 	ltq_mtd->map->phys = ltq_mtd->res->start;
 	ltq_mtd->map->size = resource_size(ltq_mtd->res);
-	ltq_mtd->map->virt = devm_ioremap_resource(&pdev->dev, ltq_mtd->res);
-	if (IS_ERR(ltq_mtd->map->virt))
-		return PTR_ERR(ltq_mtd->map->virt);
 
 	ltq_mtd->map->name = ltq_map_name;
 	ltq_mtd->map->bankwidth = 2;
-- 
2.39.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
