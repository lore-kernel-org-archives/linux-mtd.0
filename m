Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A71ED0D78C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/PUdt3rG8s9ZkvJNX/1u+hvw/RG6p8suiyW1FV3NLk=; b=4zNKE9dTonc7wk
	UC/d5spS0Wp6mqBj7q4HYfalY+wOgVeL//eYl9LPsBAKb8o4wd+Fj6xSM+nThFQ4Au3prPwO/Fl0y
	/VOKTMvK7RnBeyw5t3t+7oaejJbWta5klf+wHtalxd+t+zvuY85zB68sjJ+4ntuUefMa4gViWXdRI
	tK8pGkRxIbveHKo6GxqidB1tnAyPm6tjeu0eDRYsRnSaJ+JRFGT47bpi2y9URhcEE0M4Fc+k/3ev9
	syWxOqyz80ZVEFISawa/pMsdZq8Idc3ryuHAxbp46jFBRjOkSAKwTFRQKZZFflC38vl8pLlHpfGAP
	PLyB8p0RssoK9vlQwuIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGg-0000000GNL1-1itG;
	Fri, 11 Oct 2024 13:01:18 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFC-0000000GN9n-3Nq1
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 12:59:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CdYtuL1WXnKXjb59opiRpIcUAr3C8yYPE3GqBokLyyno2WeyEZIgA8bWM+GbKVNNQ1pGPWkjLSRw+UHbCmBN3Fur2dkYzeYyosB7M+tGmpIXI3BY/25kGTNMKJuvV50g7XEuvwhuLev4yu+sl9kDKmVARPJIyBZbo03oguck5Pqs8KMxIB2Zh6SszeCkJGcsHv1wBg8P01hfNGDSDakL/Oq+fQmP6qshudMqzN70UJfCuFvjC2SogGp5c68haBV5HTmIay63fHnwx1z1yUnqCoDGwuk3vzarUikt5s7lEsECTXQjtw090nJqGnfT4bsIBWIsTI6UllB5Pg0f0QwZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SGtqmpIKxZ6TNl+nygFmSj3n+4dAIgzYPZ/hpHcFr1E=;
 b=xRiHxJs6KsmO0bTCvGSqsa5ZXGzgPeGYm0fUm+FEKNkUVx44Ddz8VtqDDAW9SW2Qr+NWakzSfR/ICUaMw+qyhBcBdJal6xKNrqlAElLkpyOXX/DTOdgWmxI1PzGAGmhG3Uob6tx7S71/6R+ffQjLyud0CrNh8liuOxyJdKPGXwhMBX7cyFR9i4OiDukhmmFMSe2Jj18S4ctC+3ET+ATW4W5Scbqnne/Q/p+OeqRZDzQ0in60ZaLMxcjLuSKZ+/MsB/NQbYFzveSx1pPOI5MpULuuPz217uCC31r0CkKuLlLDNkgRuWrxT8hKcyDYAxHTXT1B8X82q6PSGC7mf4LPSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SGtqmpIKxZ6TNl+nygFmSj3n+4dAIgzYPZ/hpHcFr1E=;
 b=bBspQTbJwgq5AhbA3aVtgEmEIHCirij9RzNw4EuztcJiPst40tB5kS+SOv7Gtfzz4E2iAH14ZDQhKbAgJ98Nh7E5Te/oxfa56KyV4RZa/mkwzjFw0nc+N4nl1Zg+zQCg8GF2bmdA+Pqd2/AuWh+R92G1BYRqFRfNfGThND8jbn8=
Received: from DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) by DB9PR02MB6873.eurprd02.prod.outlook.com
 (2603:10a6:10:217::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 12:59:37 +0000
Received: from DU2PEPF00028CFE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::7c) by DUZPR01CA0172.outlook.office365.com
 (2603:10a6:10:4b3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028CFE.mail.protection.outlook.com (10.167.242.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:36 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:35 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 02/10] ubi: Expose mean erase counter for fastmap in sysfs
Date: Fri, 11 Oct 2024 14:58:56 +0200
Message-ID: <20241011125904.2915983-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFE:EE_|DB9PR02MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c05a536-e45a-4e1b-e67a-08dce9f48f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hpV6YifM12MnGBIU2TQ0QyFq7nfoDh1JKoUBpnmWpiEe7PRhWcQbpwmNRXMh?=
 =?us-ascii?Q?7XZkn7p/T4x3dECIGYL+NE0kjW1kZsg4GxL0gSCZbDA5bpPfKXsfGC8y0I43?=
 =?us-ascii?Q?9zqx7V3moA8vM33u9TcQyajtDfh70pgQV+smC32J7OOzZ6V15mN4Uc8nnV5U?=
 =?us-ascii?Q?rkuhgGz40rTHSWqDQ3HFzEhueYYtUknMS5V/ST3lzF8JjHdm7/vNwnrkIP8z?=
 =?us-ascii?Q?+qY0hAvR6khRJp1x6ZrB6k1sWI+eHkv54RDi8UY2cJ9hXstKH9m3nuh70LlV?=
 =?us-ascii?Q?tb93rTiuLZb6+jJL5T+oiPX3qs6Ezw0Ixwr03qRoRQhi4HW6Ox3ejN3aMELg?=
 =?us-ascii?Q?OFS1TK/DlhoBB8FkQzb6Rcs4R0Hl+aBrlF6wrhk2pAnclwufGZ7CPe0lAQ/g?=
 =?us-ascii?Q?D/01pw8t8jfTJkDsK4AHx1WkRu0cy42LbxsSp3ZCaDzoXmJ8/GyIdPkujV/W?=
 =?us-ascii?Q?mGyE91SONLFmUfKiuxVPSFKuxpDiRa/Nu4RiazLwkacOurYvfri7yvbl68hB?=
 =?us-ascii?Q?mH7LuL+fqq8NsMxIXmfoZ6W3JTb2MRnqnkn6ZiepURkuHdgUzXKoxWLeFpFL?=
 =?us-ascii?Q?/wYp8YFEPGKvTPi9rKxNSgynh954UVLAQE2FZLyO8a8eOaKqFp8/yLHYVVjS?=
 =?us-ascii?Q?7Xcn28cQgZhrrwgn4SIc7kiGfGO3HwOK9FcrYGROZeEtxrV55ZdtozAHVoma?=
 =?us-ascii?Q?VzJuPgHFcT7nCvagJ3Zlg8/VXl4hdYpvWDNfHhmpMqqfVXtuezwfSSTbnKMy?=
 =?us-ascii?Q?NFOXGq0R/k5rjAeQF9Mm84BetP7P/v9LXvsoBiYjoQ9La9cwo2+qiwhx0p7T?=
 =?us-ascii?Q?HjDCU7W5Ux43zWQLgjEUL19Z01wa7OERalPiJw65zoyOW+facuBs7hpQW1kd?=
 =?us-ascii?Q?m9+5qE9mjsmNlmhARNMIr8cpwATQwzMLmB4DgbpJ/+apyCE1JYcM1hoioRN2?=
 =?us-ascii?Q?e6MLS+Ugr6dA65WDxBE6cnCGRI+Ez4FTWxIHebiDQWSZKyahPaXtSzFojWpX?=
 =?us-ascii?Q?r+bht3aVHM2rMS3kYIromBsN3llq/gKykHQb0EdxE4QOCNK/6L+OQkvHZsmO?=
 =?us-ascii?Q?jiKvgAOAISEm0JHT8+OevH0wps8Z3FwEZKMzKD0oB+ZW9g9qjKr75/BapI4L?=
 =?us-ascii?Q?Vu84uRzg9cpVkbXyJYt/jizS3AGmJCcY8/zfktyOhBARm3NfUcw7oZayN69q?=
 =?us-ascii?Q?BayRiAafMbnwvZce3G5hcZmm39Uc4dLQqsGstrvksor+3grAKZwYyjlDe4r0?=
 =?us-ascii?Q?ncSW+Os1+zisI8DfSEHd1q91RjxUuxD/0HT35ceEGspRvcvIx3xToSPFwQJU?=
 =?us-ascii?Q?hVzLnw5/usJ0nSvk9wjV1BiJxadZQGjpuOlhJACXsKcWrnS1gMHUuALW82e8?=
 =?us-ascii?Q?/U53LHiXdM6+K6uPC+qbOOmP1OVq?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:36.9138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c05a536-e45a-4e1b-e67a-08dce9f48f91
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028CFE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB6873
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_055947_178182_9719EB1E 
X-CRM114-Status: GOOD (  10.16  )
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

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 231ca288f397..1c531d623a62 100644
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
@@ -411,6 +415,10 @@ static ssize_t dev_attribute_show(struct device *dev,
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
@@ -438,6 +446,9 @@ static struct attribute *ubi_dev_attrs[] = {
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
