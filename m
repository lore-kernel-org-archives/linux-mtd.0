Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D3B8C433B4
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 07:51:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD616113B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 07:51:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD616113B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tvVSMhFWJBmGt2uRi8+g+9XpFqZxOSUvESFIVg8COoE=; b=A8yWTklH4knXSZ38sVyeaeAMB2
	6VEJ2Whi2z6THap9Mfv5J89ER+HU+9AUbMqyN4qAKxvsmBnE8hNuoOX/LX49wr2p6eJPdUj90S4N+
	2zz4KQ3FTbt4R891hJfaMeW5zjSYsuKVp4NvoB6ETkZwD1Ju3aWplP1gnyQmlV60uLsVd3CkyFtYv
	45H3ExciAK/hTpsPRZuwAM/2iA2vhRWOMQ6e+PZFGS5PVbZlXE9DOXRBI5RdiYO0vttYCC3OwXIOZ
	pepF0K3e414XTk1T2mOOCHxhGqtrStGlnoL5iWlScrCj8B9/wPkFJRFrR3W0CMhrlJBD+ZiA4zpHs
	RZdsSm0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXJFK-001FHP-Qe; Fri, 16 Apr 2021 07:50:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIx4-001CQy-Kg
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 07:32:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=rjMk9ACL0ZS01gqkr0Nw+cVCjUNoF19a3KBHaRwkDVw=; b=2Z/qlCZ1oiS3OColLCvtqoS+O4
 w73mLjCFwsG9q1UJUQ/l9Icg2j4hvINzUXKrJmeBhIz7b6hRliC0HTaqYLQot9XikUjQCTCfZivs5
 NQOXp0lPeAkqYUsCvQeOGAS81K59huPqvYkQEa7mzKs+DZVo+cfrklmYyuNETpqPrl/ccpVG6Cvp7
 02OqtUUSg860sJUNJ+bnUQbbMCPIzegJm2ofDwXD0CJgJM7OZ7K3PeNezs3SEBDrWNcDRxTCyKBMa
 ZzybTewiffXtRa1WT3HWwmv8yifywFI/4PAOSuuwvKPW7XKNo5ChK0xGBDni02RPfFZd6cDRocteO
 A2KH/SsA==;
Received: from mail-bn7nam10on2086.outbound.protection.outlook.com
 ([40.107.92.86] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXIx1-0099Wo-QX
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 07:31:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c50h1vX1Q/pnCVVXXi3s245+C0+0fm4Ou5nvjGoOJGkv6Pzr92vIEse3m2CqYQtI+i0TTdDYaii3nihscMx5cRv3zfpWt2xBKjCvBHMYWK7P9l581FO95+ZyLkG0IVzDXHpRMwQ7m+6VYqLxZ6qRNCBryEQhKXs/gcT0995vrCKE98buQ6VDARF6uRjNmVMWO1vXr3KS6l4vTZ2cUzyy6GZVOyywaQbjkxy4nd+Y5g0o6imfyDfcJIbIgPPH5o278B0oz9SOlN6Mraw7kjPq6Dt4eBJNEwqLXG343YFi3s8zczm2a2YXamuLItQgW49oRkKKvGBGU8X/JlB1I7zznA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjMk9ACL0ZS01gqkr0Nw+cVCjUNoF19a3KBHaRwkDVw=;
 b=ENhLxndhV1BYFPjtfe1In0afxuCGEjd80J8AbcAD1vXqmQq1bgwPuC2fKjKuFERjUk6TGeIVmLDA7E1ra7kRmOM6/0gXcgxIX1smayHa8W8Zh41yBRM3Tp2ZnDC4By/FKxH4ELkYY5do3PlFEi+n7p2GB+RZUVqGHxkrQhXhZwsJ+HHQCyR5tgwtB5omABBoWl6dIIA1xnr0JYw9VQtR5z0ekSFmeZKVfhzWmuUH9/GfKyLOkgrK1oA1ge48aJFHXohGocFqIAkV/dJEtu8yHqEnvjJaHahOyw8SUXcrqnkqk+EuQ4v1sOXi+ZHKTYz/rXbVbZe8DSCIie78T3CXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rjMk9ACL0ZS01gqkr0Nw+cVCjUNoF19a3KBHaRwkDVw=;
 b=LLdy4vX8mhlDrm7704LzypwGR2jzMLbeDyTXzaWzKb7UuQvUXljJZEwPytpHToickQeIxYoRymbpHYBmhGo5Ca7u19l3kXkXZqlVXSr7lTk6I4mSLgOrRZ3MOrpTKKif8FhlpfCUVp1/5wuglPLbz3ztnOfrTeNOckbkXkP+qkc=
Authentication-Results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none
 header.from=windriver.com;
Received: from SA0PR11MB4766.namprd11.prod.outlook.com (2603:10b6:806:92::20)
 by SN6PR11MB3197.namprd11.prod.outlook.com (2603:10b6:805:c5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 16 Apr
 2021 07:31:34 +0000
Received: from SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d]) by SA0PR11MB4766.namprd11.prod.outlook.com
 ([fe80::618e:7a26:8bb6:4c1d%2]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 07:31:34 +0000
From: yaliang.wang@windriver.com
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com
Cc: linux-mtd@lists.infradead.org,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
 Pratyush Yadav <p.yadav@ti.com>, Yaliang Wang <Yaliang.Wang@windriver.com>
Subject: [PATCH v2 1/3] mtd: spi-nor: core: Add the ->ready() hook
Date: Fri, 16 Apr 2021 15:31:04 +0800
Message-Id: <20210416073106.1267805-1-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0014.apcprd04.prod.outlook.com
 (2603:1096:202:2::24) To SA0PR11MB4766.namprd11.prod.outlook.com
 (2603:10b6:806:92::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-ywang12-u18.wrs.com (60.247.85.82) by
 HK2PR0401CA0014.apcprd04.prod.outlook.com (2603:1096:202:2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend
 Transport; Fri, 16 Apr 2021 07:31:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfeb5f1f-0a5e-44c1-ad45-08d900a9a919
X-MS-TrafficTypeDiagnostic: SN6PR11MB3197:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR11MB319750AAF6E196B04FB9D8459F4C9@SN6PR11MB3197.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HCQHKQMIhxnZQZAXbVOlGYQqJs82FtYd6ntEnA0UaY5iGKQa+sjTI7ZeYELm/qnRcxv6Bty/mJhzIQ4Mdag00HxRGMP2SDFN71DATf8M3hz8aO+8JFRKpOdVOHjIjlFsGdgxWIHn/guC0io0YnEKSRfcKsu3nOvHgYAziEEAbpYE68szMOTecbUFAetnQ4xNJ7Iu8xkd/0IU88/b+PRYW6xxhSnmeyzohaA13HLsUkPy49J4ATKHivPPZVHKh3T1W8lAVr0i8BeI/KqemopG+8gjef7NGzB2azeBnAoFqaxYW9cGLMxw0CXJ8KCav0LfaxJMlbXfuZhSHptVhLa1vcBE5pTNpEUw/b4eF2jQcULl18bMu9cXXKDDQu3UUQ0H4pUHGVDk0x23Te839Es3Z6kVaq8Q4nT7U+C4odREjLIZp1lzlKKJ3kWWqxJLBX24w6jzimKYH6v6gTrhusQ0p9VKr3bmX22WHoTZbx/GRdP/VBql6TTFhx5uMGAMHRQe3ngfGHMIwv8zxrxXIGqmBcbmtZImyY7eHin64bETdJ8c0eEC2Hf2dqF8/GwyT/9BlQbPF90qi8U3WcDLeC5H54BAQkJ7spJFJRXaDS2yXJn0PG0ohm+pIyYfytu880QzcZlusX7bts6hoDMIKE28xzA1HN1wNBmCO67zwqTqg2RTnOj4RmYELxEAGO3twnvElV1N+z05fSD7NLiqr5dkSIVWEwYBaeuIZEnDS2JjhSI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR11MB4766.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(2906002)(8936002)(2616005)(26005)(956004)(316002)(36756003)(54906003)(478600001)(186003)(86362001)(16526019)(83380400001)(6512007)(6486002)(8676002)(6506007)(107886003)(9686003)(5660300002)(7416002)(38350700002)(38100700002)(66946007)(66476007)(66556008)(52116002)(4326008)(1076003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o/lxM9oCJ+9WY6zZ8T0O63S5oYY6sZ0LOQz07g3hmlh8QjSAURjtKz09gOw3?=
 =?us-ascii?Q?NSiR4PaIPlquUB7KATQQHAYqwn1e4q8HEhZu8gkWZ5bEfliPNshwlFne78d8?=
 =?us-ascii?Q?+BZS9ypy3Ta4J91tOAryGXG+ZWVONBD4qmPTFM3+URoJlG2e5LZfyyMvc+bY?=
 =?us-ascii?Q?hnHHSpUjW3Yd5ObBktTq7jLFtGvY+9BHysv1n5hgc1HVyFjrcOV5yMWjhPri?=
 =?us-ascii?Q?Rm2+jaWxX6wL1+3XE1IdnyLPgRNrSj5eHfRvhn1TdcYjqbZQj7M4g4Do5482?=
 =?us-ascii?Q?vGO4xWb8vaR5eGJCtKQtE5Lafa8U6caWPrWAPCXx87N3WTs49xsmimJb1ERp?=
 =?us-ascii?Q?IqzvAEeMWunQIZmm3Dha3+V8KBqsMd0RJ8ztNqg+tyklJVvWqvIscVqHAKNw?=
 =?us-ascii?Q?zFuASif44ny6xa3HLqusWqojKPXTQDxy6UCd7HXPuuZ9j4jPdPc5jI/lboTY?=
 =?us-ascii?Q?oa86Aj1OAUYnWgS8A00VC7wkej7FS5V+stuVA3Yz570ggi4gXZ08FWxR/Pq7?=
 =?us-ascii?Q?J83oDNx8N6uVluHGYibmX+Iri9xH/r1efOf6Q1PRxa0x2cIxXC6MWrXbvcy8?=
 =?us-ascii?Q?Ww8H7eC2FvW87pSdhA+TCQOGf2ASEbiKPdXa6IuQgDhXQxH/W0ZGfHc/fTya?=
 =?us-ascii?Q?79c4I/Bz2kMEa9Y4UTIDXGmi4WOanu+EikGMn2SXRHgo+Os9BWkJ2r61SUS9?=
 =?us-ascii?Q?YOShKLDN7jBB5NhcmrkgbVUvKB/gw0d8Yy4LQDgqLQSxCf6/8D6ckkwdeAQn?=
 =?us-ascii?Q?kV5OitWhBL/ajPYiCOS56ioFDE3DFSyPFKVLp5zKod0e+OZu5IDuG952XXLz?=
 =?us-ascii?Q?KN5HagT0TTtm80jMH1aOo2vSXZmSforqBZ/Djphh0oGrBjI3qH+eVL8X5YGD?=
 =?us-ascii?Q?giVhW/y88/FBQukPSWaT7Ifht50ziKPiUBJdrKKQo8FIe4t0pyK3YgOejEPm?=
 =?us-ascii?Q?J5ETAf4kQurdl3GJJz70Na8HXu1im3ztD/5Vkt7lqlItsYzxoZdko1hHAwQg?=
 =?us-ascii?Q?8+xxYWnPYUKEoRuQG4rq1df4azXxfv2kFYGnXXXgHXLw/7+naO+kdIb3RPit?=
 =?us-ascii?Q?AKWGBNyuRLvex3Ds4fhxiWS3xFEn+WVck1FZwd1Ufz8FVwgh8FTUuhQm3rdW?=
 =?us-ascii?Q?LkSt8sjdLnvzpdO10XiG9PLV2Em7n9c2UTXjyrTlpYrL9jy6/E/pbidKZp+S?=
 =?us-ascii?Q?+SETRkFbA57C5YjnrBIViKQRjvcBYSix4hJCLJ+nMTCEbXvDXjs6kyTM83DT?=
 =?us-ascii?Q?ntoxMe1rthstWWvcDKADPOa6H8Ka79erJzMPYrqaeihlYAyAR9vWvfUTFLDf?=
 =?us-ascii?Q?j8kh9VF3p8K/Ql1mAzn847vJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfeb5f1f-0a5e-44c1-ad45-08d900a9a919
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4766.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 07:31:34.5231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ratxmhgXH7LO3XFN5wyjhGumpnte4hAVI9bWh+hnN2vzPaB/0X60q7D47ZeUbde/fTY6Sn6W8xE/vmcXyb2o0Ra5yPBDN0rIYiCRTM1sasY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_003139_961497_1793FC24 
X-CRM114-Status: GOOD (  13.63  )
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

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

This hook can be used for SPI NOR flashes that do not support default
status read method.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
Changes in v2:
  - Totally reuse the patch Takahiro made [1], this patch is introduced
	as the base of the following patches.
    [1]http://lists.infradead.org/pipermail/linux-mtd/2021-March/085741.html

 drivers/mtd/spi-nor/core.c | 8 +++++---
 drivers/mtd/spi-nor/core.h | 2 ++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..5de72322ae32 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -785,12 +785,13 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_ready() - Query the flash to see if it is ready for new commands.
+ * spi_nor_default_ready() - Query the flash to see if it is ready for new
+ * commands.
  * @nor:	pointer to 'struct spi_nor'.
  *
  * Return: 1 if ready, 0 if not ready, -errno on errors.
  */
-static int spi_nor_ready(struct spi_nor *nor)
+static int spi_nor_default_ready(struct spi_nor *nor)
 {
 	int sr, fsr;
 
@@ -826,7 +827,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
 		if (time_after_eq(jiffies, deadline))
 			timeout = 1;
 
-		ret = spi_nor_ready(nor);
+		ret = nor->params->ready(nor);
 		if (ret < 0)
 			return ret;
 		if (ret)
@@ -2920,6 +2921,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
 	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
 	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
 	params->setup = spi_nor_default_setup;
+	params->ready = spi_nor_default_ready;
 	/* Default to 16-bit Write Status (01h) Command */
 	nor->flags |= SNOR_F_HAS_16BIT_SR;
 
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 4a3f7f150b5d..cf265044b543 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -218,6 +218,7 @@ struct spi_nor_locking_ops {
  *                      flashes that have peculiarities to the SPI NOR standard
  *                      e.g. different opcodes, specific address calculation,
  *                      page size, etc.
+ * @ready:             checks if the SPI NOR flash is ready.
  * @locking_ops:	SPI NOR locking methods.
  */
 struct spi_nor_flash_parameter {
@@ -238,6 +239,7 @@ struct spi_nor_flash_parameter {
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
 	int (*setup)(struct spi_nor *nor, const struct spi_nor_hwcaps *hwcaps);
+	int (*ready)(struct spi_nor *nor);
 
 	const struct spi_nor_locking_ops *locking_ops;
 };
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
