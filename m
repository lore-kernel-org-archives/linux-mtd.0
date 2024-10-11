Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41C8CFD30C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DUagpB2HxC3bPg9RJMPDjSE0JIrPEX7ZgTkHz/LTVc=; b=MYOkdLxLMj0Yjl
	PGluM/jeAwybjobgbauU7gy2cIRFOtKJFmA9K/X2xOs5JnC9cJckltx+Jlta9TmTpxi4760rTJsGO
	0Ythlmss0HsdixAiCxKX++42a6FGU8DlJQX0aYbXE/0PIwD7B3cEOUYKvL8elfrw5ilmvWUTzMANJ
	HRhPA4Pyvw6h1Fop7EB8qNoz5IZRvA2U3XcsZp4vu/kPLs4NjmeVbyLLjTCcVpS1JcSzs+zFP+b9b
	mq3dRBjz8KqhFgcquOa+h4blz1/LW5UNegKqy7jM3zqR7DUt0xF5AdNVxJ0VGiVs1o9BRfECWg/mL
	3FaXM2WDJ7vUi5gLAvPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBrM-0000000Fp29-1lAP;
	Fri, 11 Oct 2024 09:22:56 +0000
Received: from mail-westeuropeazon11010026.outbound.protection.outlook.com ([52.101.69.26] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBrJ-0000000FozY-0Rpt
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kTZpM/7QsXsv3r+jN0ldNnjvVZloLV5CNUm/mW49vWM3irsOxJLPalRWp7V48NnDyQdWpxovquTPFUT+WBc6Q5NaCeR7ZVDexjXAb7bks5R3FSTo+leOqZzNcsBw1TmH8jTHtQyyo2FWQkM/uZs75tAXDFJgSfVIPMIY0fNjUHsd0NlHX7c0yZzcxfmsU21FxhX3VI4n4hWxmfsFjgEEnL2akura9m6KUqbCgBv2uyogcz3WfadVZRwCCGwNczlD5OBdnPahuY/lwiIUZvTx09RVAMATAd7nAS0lR6riyymdSw2fDnbMpWd5Auz+KsvioVmJP7cpN5nmXmVyisbfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSy4Ph8mRdsuxP5rE0rW0F4tcQLsL0a/XZhnf3krgvM=;
 b=VNto1VURnIjdVISFdMmEQ/dhRS86CDPE4qsHS9ZG1nXqqmFp3JRIVcdi/mMxxvR/b7PFoa1nZJM0AzKoF75BC4QNPDoWvDQZ+BwZNG+J6GXD2SOACycT/w7yoPnA7ge8ju09iseSBIGGkF4JWLMXSdrhSF3ziIWkj6tcDIlGE32P/IRH66tR9JjbNEqty0x4U+7+5ZRGJmXHel1V6/7j7CrMmB78qHAvSVG8HSdeFjR69hkVrSt759QHydGlijKDniMoHiiNQ50rxJpR4NchdLaeWcryUD2h39ysiah1RA0pD0uGqaiQFVkVgVymi+In2Br+gHSSFxxC4ZuCe1oleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSy4Ph8mRdsuxP5rE0rW0F4tcQLsL0a/XZhnf3krgvM=;
 b=GVjSjAeVgqvzkcf4OtCF83voaq7FuvgTR28KKm/V3YnbAeoNQJiGFtdknTFbO+ZbZwoOJgL0O7BC7bsQEQjpimZwXe3xQ2RwO6xERDm175CqPbBkRrljqkJrnn2ksjvj7BNh2Vdl0kfTD/Vs1jtbs/l5LxsjpqMajAoWXZHzGw4=
Received: from DU7P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::32)
 by VI0PR02MB10659.eurprd02.prod.outlook.com (2603:10a6:800:202::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 09:22:10 +0000
Received: from DB1PEPF00039234.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::8e) by DU7P195CA0019.outlook.office365.com
 (2603:10a6:10:54d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00039234.mail.protection.outlook.com (10.167.8.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:09 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:08 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 02/10] ubi: Expose mean erase counter for fastmap in sysfs
Date: Fri, 11 Oct 2024 11:21:26 +0200
Message-ID: <20241011092134.2909496-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039234:EE_|VI0PR02MB10659:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc19ebc-e284-4b86-acf2-08dce9d62ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Gab/nC0Y82bWZFd7gtamg/BBzfbR7ZuRfxH8IuLC1YOIIunwzmozJDy+nj9h?=
 =?us-ascii?Q?M49z/n4UPN+r/sWsm6198KljPm8vvkQSSXv38a6vm3p/pz7b7KoNSgdyD8cj?=
 =?us-ascii?Q?Fquz68AqefbJhn/2quEPstwubFXYTdKBvB6PUW7CaXOT6Q01dpERWk9RS/5K?=
 =?us-ascii?Q?qmDL8tx/4wtqorZB2av+Pu7FuuefTNle0U5vsbZwmrdL7g2+Kpf9goO3PG+L?=
 =?us-ascii?Q?ZFY/kzDBK5SQMIaOjBNTRpw6Q/HweP8fqeTiBYfEQkuuq3avRfNDxnbgrvkw?=
 =?us-ascii?Q?bNDxitlwynIbNQWAXEC1uuu/Gy995NqCys0dlbmHdEtdahIwnYOJoh0fXcYN?=
 =?us-ascii?Q?f0Gk9vTxB++CwwmJxeo1vLNAvr3jaxEfPYr/I5tpmzDh66NH9TpmJdzzxyUF?=
 =?us-ascii?Q?WF1/oDeaCWhkPs9PTvTRsePgf0CCcOpyr11aNL/jx7Nvir5k28OaUvz79Yli?=
 =?us-ascii?Q?tga7yiNPYfNU1ogrBUc5Ij0wIFA26ee+fS21dQOcr+5Mfnxof0yTxYXspw0N?=
 =?us-ascii?Q?K4U2kxS1PaM9t/7ecyJ5g1Bg21k9QgqGNvmZfPl84WWz32AxpEBjSaDDImew?=
 =?us-ascii?Q?3Gxq3eHMJyn7zUaQC/F97K2zXw/AoIgomPZ0d9a/7RrZ3tb2kQUB7L1oJLdg?=
 =?us-ascii?Q?gLsKeWwoRKd8Heyj6jrrwID2GOr9PE+X13hiLX9/8elRx5Mmsf/A5Pt7RbP+?=
 =?us-ascii?Q?ACyjdCQg2IbsL8t/meddiUbOJmOJgpQn4lfPPC+NTDwRJULgXlYnM34BdEy2?=
 =?us-ascii?Q?lO/EVzJCxlXxUIN4PD4Xg7hQXs+QDtRqJuQzxJwC2smFlWN3OTWRrZ9DcO0r?=
 =?us-ascii?Q?Xi0Ym/pbGdjP6tYUOdxRfvYWeFyykCHfZ8NVAzEioVejDhWENPbtBV5OBEkO?=
 =?us-ascii?Q?IKvXC0knQVMzbgsGOqOZC4369bvv/C2N8XM5oohfxbjbmGtMvo7CGbn+8K/o?=
 =?us-ascii?Q?CZCvP9YwbOlR78bEzNksUPxJ7zLOSNFenZwJBRpQP32IwMWE4qD5rz+RZHO7?=
 =?us-ascii?Q?RXuOHm9aodbf2/bzJCa0QzmCh6lqMNyCgmwlOkbkUS62zPZIkUstqKYMqI70?=
 =?us-ascii?Q?rf4Tihd31XPqBL03DlYMirLc/HFpBq9AEG3YdMhSekXPM0j4TDjr3uolgzqF?=
 =?us-ascii?Q?jwc2yoqmdztVcrIuSDUntuQSHrPW8FzonJrgEGFcoTNqfG41AfxjK/Wa1Cjv?=
 =?us-ascii?Q?n5t2fIysix42OprG+o6czMBpOfQABeX8UILT7ZhIDvNFw7II8M2pm461eC0R?=
 =?us-ascii?Q?d03OevBkVch512U5H/gHuBK2LKnlVymB+YbA7Sz/ONMCw8wZpbzO57XtpfNv?=
 =?us-ascii?Q?+uCmc6rgM2gUbHYDXaXdKTs/Bc2N8k9awrDNy6b0ooJZnk4YLxbVJrYkN4Lk?=
 =?us-ascii?Q?0VXLCwiyynZjUn09HWxZRJhooVOj?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:09.7433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc19ebc-e284-4b86-acf2-08dce9d62ed9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039234.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10659
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022253_448085_34C0357F 
X-CRM114-Status: GOOD (  10.28  )
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

Since the fastmap area has its own wear levelling it is valuable to
provide a mean value for that area. This value can be used in order
to estimate life expectancy of the flash.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index fa38c434e447..3633c743e7d1 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -133,6 +133,10 @@ static struct device_attribute dev_max_ec =
 	__ATTR(max_ec, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mean_ec =
 	__ATTR(mean_ec, S_IRUGO, dev_attribute_show, NULL);
+#ifdef CONFIG_MTD_UBI_FASTMAP
+static struct device_attribute dev_mean_ec_fastmap =
+	__ATTR(mean_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
+#endif
 static struct device_attribute dev_reserved_for_bad =
 	__ATTR(reserved_for_bad, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_bad_peb_count =
@@ -413,6 +417,10 @@ static ssize_t dev_attribute_show(struct device *dev,
 		ret = sprintf(buf, "%d\n", ubi->max_ec);
 	else if (attr == &dev_mean_ec)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, ubi->peb_count));
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	else if (attr == &dev_mean_ec_fastmap)
+		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, UBI_FM_MAX_START));
+#endif
 	else if (attr == &dev_reserved_for_bad)
 		ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
 	else if (attr == &dev_bad_peb_count)
@@ -440,6 +448,9 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_volumes_count.attr,
 	&dev_max_ec.attr,
 	&dev_mean_ec.attr,
+#ifdef CONFIG_MTD_UBI_FASTMAP
+	&dev_mean_ec_fastmap.attr,
+#endif
 	&dev_reserved_for_bad.attr,
 	&dev_bad_peb_count.attr,
 	&dev_max_vol_count.attr,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
