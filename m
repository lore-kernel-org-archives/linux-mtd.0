Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EFACD6E45
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 17:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpuFdH5hD7i13QqTTT1aDxuquFV71zDBZldNPc8YxJA=; b=3RtEi53QG8OcNx
	MW0/uQTCf+Uh43LBn+YuL4Epam8WUUrdTFPSOK4nY6aiAxXE0W/mP44ny1Mkqci5qHG1mdYdBaPJ8
	g6LsP9zKp1eqhA85S2VRZGYD02e/zEyqp2atQJ+2n10Zg/kWPbTsNaHOkZS/ovSUKR9FM2Zgg1z2U
	VMe0pQ+hgcGAeXLwf3mGWaDmYREqdz4SUqUE1SoyEm1yhLLGhUXchiKezIW6rAQVv9gnak+w/1Knm
	VLb0W2SCd9zMnig5HUyo/k5Ed3fFNgcZ6hQpRwx3wPmJ4bisUmdii4ORkQ5L2HfU8mzXfLuoQ/UIy
	5Qt9SL0VcMiKc5Xq8LyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUx-00000004bxU-0X3k;
	Wed, 27 May 2026 17:56:55 +0000
Received: from mail-westus2azon11010042.outbound.protection.outlook.com ([52.101.46.42] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSIUt-00000004buq-1pMo
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 17:56:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9cypyHBDjuxR7u+Plpr3mHN9tIEeyrIkTt8004WQZHDphs+TITEMd7RA2POi7/kG6q+CHttSupDMD6F7U0bBdivirjZSx6aLO4UzsSsibTiHxsbdVYXCSNb3U8Ra18cJzw7U1qvdbSopPekbVNpeSDn2rHwKQzxVN2l+PzvoggC6MXFm0ppeDW5fzfs1aet+SZFRlNVjEh5kx1bSDSntpny03915ohNgMmpURHsxLO0/gRVh8tRda5sNfeEoDbDHfQcuN7lGaRdK9e17gJkb8Xbos36NobQ9vaNhk63h+Y7dxFV+brlaI/85ji6SxL5C9tF1cLywIlI3LyCjeWkzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSFK1LcSZX0OA7Az20GmaFFaMbMXhDuR3o6DZJCyo60=;
 b=xElSGBHL6yWulKpasj/jQ2VdZzNNLUjlXJW7wGugij5FZQD3NSWlRhgKJLv4MZiwl+mqvqf9IyyRJfDEdHmxaR0vf4HVy8xOdEYhx8Q/ftHDAVM7XmwaqqfXgVNoymVIPaSEaIdIjInmyv2dLiMhu4OtMk3JyDuU40FEmTr8scRo3NN7qow+mj9wS9z9F0T0XBgicYrNTl9kJwhnG5X5zl+nlKS7Ab3kFv7P1FNihC5s+kIcfaoogtLTmgkewhYKhKmZFdkGgDgaUfsUpg7THTloYFHg70w2CfsSqd4OMITgoDq0U0H+WZSTYLp8nVDEb7wcv3N+XnFqEJNaL5sUWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tSFK1LcSZX0OA7Az20GmaFFaMbMXhDuR3o6DZJCyo60=;
 b=KOsTQP/grEIlfJ03eiLjijSTl1g9m2oIVUY9qo/ABrSimC0hZ2uuqSuRefBmgggD2QQ0sgiGK6v000zKuyo/mFlDobL7poFSJDjJsYJ9PmnvfPaHWbFW2mQWEOkXGH3AH1B/bWdGy0Ve2gz6jkTNnNZF1dhwdZMb9eImwLZ4cSo=
Received: from CYZPR14CA0025.namprd14.prod.outlook.com (2603:10b6:930:a0::27)
 by PH0PR10MB5643.namprd10.prod.outlook.com (2603:10b6:510:fa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 17:56:39 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:930:a0:cafe::3c) by CYZPR14CA0025.outlook.office365.com
 (2603:10b6:930:a0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 17:56:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 17:56:38 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:36 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 27 May
 2026 12:56:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 27 May 2026 12:56:35 -0500
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64RHtYpn4052476;
	Wed, 27 May 2026 12:56:31 -0500
From: Santhosh Kumar K <s-k6@ti.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
	<vigneshr@ti.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<takahiro.kuwano@infineon.com>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
Subject: [PATCH v3 11/13] mtd: spinand: run PHY tuning after init and update dirmap frequencies
Date: Wed, 27 May 2026 23:25:25 +0530
Message-ID: <20260527175527.2247679-12-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527175527.2247679-1-s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|PH0PR10MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: 488ca640-f2a9-4dbc-ab4e-08debc194d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|921020|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: KTuMe1wUMQNGGsrzfZCqyxqUTsUN52dF7cudpfgXcwd8nceyb0PDy9pV99xxT/82cLaZb8ICECF8eg7xC4xZKVFDlz3YgWtEGmwI9h2YSGOeIvuih1L9ZWVuUw7gYzBtIM+EOJ1TsTL+ndDBk+UkWtx4YSYsPAUjemY/IlNTuaIh0kH4Xf3UCxi2QJZJ2xMg2V9l1Ab68UWHR7AV+3YL0TZfq5PGgkjpiJLmNYM85IaqZCIaA/SE56DNcPDSc71DmuexiKfeJuYfmh7NZu7H15lRXxDWeZpSL1PkFO8C9/tiRcYfZeuBhmqMETtXgrxAh+OKffjSvPDmLeSXmb8LvZvfkJiQAn0bHo9S2hOHsX144FG2IE+t8jbgUlG9BtHWpDRB4vJNWBIn/0tpr6HFMxGk7pPE9GsoZyLfj5PfZRKn+nlqySVpfVoFtnR4e3ARz5QPRFRJCDFQkTzwYd18yE2zrq9fEjU6Jkb53otgC1PE9MZfCU/h+cTDWbffqu4j4PaHVGUXZJ23trjmlyYt8yHQ7KOYQbjb1EoKE3Py60LJpFQPIiaOUUpcBChWRO4LBxdnSWECWgKP1wqe6piZI6ZWFlu0YYqYmchEyZv186LQ2euhl+Hb4Yjt2q35snV/yTijQSy5Zw6zVS390GjhD0U77AJivH85fylPbsewQX2sCeYcu7Sz/xSj2dOzU/M4OSyOn+amDu8FH8fW6ErFBg5XrtmNMy0BuL0KYDXzb3m3KUZCOZtEkFJ5bmIpTr+HkrHlqy22ICVBZBCzGWXE9Q==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(921020)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x+LLh/BiuRHNaOaKpuIsG2Bq3b607cwyv45BU6PKoNGZABK31BbuL0ZW1IydH0KyoAWpopKRBHfzCoTgMNesomshOAj1swFgMJbRowKWHBmCnOMKy2xJBCazubG7gv6fkJ+YNEtJ/9XK/BbpFPwv+5HAVeTn1r8vaDuGeM3CmHFDuQOsJtOyQwNYzt47FohA5+DUsamqXQSbBVFaWsH8NJ46d+x+JP+m0u3BvebQiQ75ntNcm8LuJ54EwBO5NkhNnX0vJeubMh7mm94WARR76r+BiEGwJpyGJ8BKJ9zWIt20hVAgX1RRTqi+s30EOkQJ4gO4jX0k7H5vZagIHsgD9IfistbROezoCuzqclWdMBNwNR/cLy/QNlTlI8qDqH1z2kClzmK/evY3PMqIZvFf87fUO1jaf9wip1F+wtvuDNKbBO4Ypzw/nRSnv2WezRtn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 17:56:38.8398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 488ca640-f2a9-4dbc-ab4e-08debc194d3e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5643
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_105652_179708_4673D44B 
X-CRM114-Status: GOOD (  16.05  )
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

Run spi_mem_execute_tuning() in spinand_probe() after spinand_init()
completes. The read and write op templates are copied into persistent
fields in spinand_device so the controller can write the validated
frequency directly back into them. On success, propagate that frequency
to every dirmap's primary and secondary op templates. Updating the
secondary template ensures continuous-read dirmaps also benefit from
the validated speed, not just the primary read path.

Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---
 drivers/mtd/nand/spi/core.c | 35 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  4 ++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index f1084d5e04b9..9b54e4607cfe 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -2030,6 +2030,41 @@ static int spinand_probe(struct spi_mem *mem)
 	if (ret)
 		return ret;
 
+	/*
+	 * Copy the read and write op templates into persistent fields so
+	 * execute_tuning can write the validated frequency back into them.
+	 * Tuning failure is non-fatal; the device operates at base speed.
+	 */
+	spinand->max_read_op = *spinand->op_templates->read_cache;
+	spinand->max_write_op = *spinand->op_templates->write_cache;
+
+	ret = spi_mem_execute_tuning(mem, &spinand->max_read_op,
+				     &spinand->max_write_op);
+	if (ret && ret != -EOPNOTSUPP)
+		dev_warn(&mem->spi->dev, "Failed to execute PHY tuning: %d\n",
+			 ret);
+
+	/*
+	 * Dirmaps were set up in spinand_init() before tuning ran; update
+	 * their op templates to use the validated frequency.
+	 */
+	if (!ret) {
+		struct nand_device *nand = spinand_to_nand(spinand);
+		int i;
+
+		for (i = 0; i < nand->memorg.planes_per_lun; i++) {
+			if (spinand->dirmaps[i].rdesc) {
+				spinand->dirmaps[i].rdesc->info.primary_op_tmpl.max_freq =
+					spinand->max_read_op.max_freq;
+				spinand->dirmaps[i].rdesc->info.secondary_op_tmpl.max_freq =
+					spinand->max_read_op.max_freq;
+			}
+			if (spinand->dirmaps[i].wdesc)
+				spinand->dirmaps[i].wdesc->info.primary_op_tmpl.max_freq =
+					spinand->max_write_op.max_freq;
+		}
+	}
+
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret)
 		goto err_spinand_cleanup;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 44f4347104d6..e5af90281762 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -786,6 +786,10 @@ struct spinand_device {
 
 	struct spinand_dirmap *dirmaps;
 
+	/* Persistent op templates updated by execute_tuning with validated speed. */
+	struct spi_mem_op max_read_op;
+	struct spi_mem_op max_write_op;
+
 	int (*select_target)(struct spinand_device *spinand,
 			     unsigned int target);
 	unsigned int cur_target;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
