Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A83CFA750
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2024 08:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJVwrsngAnJbuo9bkRQB0FfvE9asBV9pexF1E3jSqHM=; b=meHbT5GL78fi33
	hQI9CagSVufT5Ftyaweox/IIY5Omv6gndSnDBxsK62kKWfgOqhGPzKjnVyyBCq4aLZqNIvLh7QAI9
	LA5YFddVlnsvaeUdI4GeITS6lR/nmgfC1Qc/af4mSZgsc1xUYI9d2NFzK75/yZIuqcczqX0e6sxtt
	mxcRHbLxTvX89A3Sx7VCXkEpIBnXzSF+nYmrq7SNImxcIXx5cl50N9hmFWrrO6/AQ9Oit8MDJpzdw
	RxbPdP4cPhU5LM2dFJu/fpxbT23KqFVF4T92olqHcelWFKB8/9OMcmeUrpDOvaME016RVjWFBQcyv
	A2TXcy8V8y9tpN7ME0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdf5-0000000BPFe-05v7;
	Fri, 04 Oct 2024 08:27:43 +0000
Received: from mail-northeuropeazlp170110001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdaH-0000000BOOz-0MAn
	for linux-mtd@lists.infradead.org;
	Fri, 04 Oct 2024 08:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjMUARRD5ZKN3qPbWH0tQpfkbdHwhJqBZKQJAWJ2IYgfXkJWeNkx7mGFsWdP3BoW6WljCbjR/NbPRhF0d3gdN0bQ/G0OYZIqNCFCVhetaCh8BzJBj6R/sSmo0AQnjRaEYjH2Yrf5UszvPcKjAx3vJXahZhQeiWObrCYdXWzjAn8vz83eUrSXDpE4eIYQVcqra//6H06UkIQ4SmHrxP2KnlZP7OsOWfspf4nTe5eoxBMwH8co+JDeoebVvsrWkL8SClQpBO45c3xthT0Gzb3AOvqWTTTokidW5m8+GP5QKBtgFUNRCS9zt9osgmltMKBGwvv/q9XzeYM+/UpdhVmblQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9nLXAL3BuK3ElR8df9lx96zr2PUrfIR9SsaSlH9XYE=;
 b=X3w+F/JQ4jgT291DT/5xIZhrcaD18IB+ptZ5hFigkcIYNtqUKkuMbvHYBE3JJes7QQIU9HHJ2AQc6DWPEt4qU9TfOy//qAg2Llne++w/Nol/oYmM0kZWXDgGVaVyqihJIJJ9jNbWqhDleCKuOGZRm6iFOHIfgZ4/E866OkDx+Haphpcinc/Wxhzw0dFuATPFIOhXbEvquWh467QcCaNoewQ6YnBwJF/wEUw/7RzWtAVHbcO9r2EY+x0YstbcCaVQnura7mAkdhOaBQqQb9ujxdVUyi/USi/Dg0I8Phv71QCmitIy+TWQjx3bN+0A72PNhIUtiSOwiu4LOoXwypRbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9nLXAL3BuK3ElR8df9lx96zr2PUrfIR9SsaSlH9XYE=;
 b=LIBCZBnMzYs6iYIkR+AKmylJ1ZutDga3QxOEgWGTjBwUzwWuo8j80QdbqpfxeNxIqtbcvGK2IQ8BrjOKh+7xsKzLtSYJasctDuP+O2SlFrbTTByZuhqCbIcfhF7RIgOs+MsfuYnA3XQF5kfe1KyVF2TjUp6Jo/XBS3+spinrj48=
Received: from AM4PR0302CA0004.eurprd03.prod.outlook.com (2603:10a6:205:2::17)
 by GVXPR02MB11087.eurprd02.prod.outlook.com (2603:10a6:150:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 08:22:32 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::4a) by AM4PR0302CA0004.outlook.office365.com
 (2603:10a6:205:2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Fri, 4 Oct 2024 08:22:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Fri, 4 Oct 2024 08:22:31 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Oct
 2024 10:22:28 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 2/4] ubi: Expose mean erase counter for fastmap in sysfs
Date: Fri, 4 Oct 2024 10:22:06 +0200
Message-ID: <20241004082208.1103202-2-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241004082208.1103202-1-rickard.andersson@axis.com>
References: <20241004082208.1103202-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A68:EE_|GVXPR02MB11087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eafa1ff-9ea8-40e6-a34f-08dce44db162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xf6x2nZNXwG9Yd2XfndhAjRNWfECY250T9gLTBKVef9ZmmjEhuEYqGO/VXh9?=
 =?us-ascii?Q?DZLEKBRaiKw690cTCynCwbezDX1P0RFgRg3yqfZHaALO0WlzDvosNNYV+y7a?=
 =?us-ascii?Q?0MzlaLXcubrj+Wu4GqEnlOVbLWIBOVhbbr/jd9HN6j8Mlcp9euCirMrF8PGL?=
 =?us-ascii?Q?Dz5K580tToRJB2MgsfXfNPv759IQ3DJg5VvL4/imege4jYmp/GHwKQFyiQKk?=
 =?us-ascii?Q?dBQiHMkz5DCMRAT9O3iXulVYzJwyp/qUirfNAUSLRxjpLQBAB0YMtCczxOAZ?=
 =?us-ascii?Q?77EPFAPTovPKPrd0xNWWiOFZM1JJCn2JBm0elGkciQMKl6AZHgsWrBjDnyeh?=
 =?us-ascii?Q?F+d8Xb0piwtYTIVMI5XDIDsSCV3oRtq6Zph4v3UmcmvZNvjgMEFe1ajXZJa0?=
 =?us-ascii?Q?PkZtLFJjszsvEQCiLpCu4K/IZ5WTrbKKL3Zc8U+MPUHxeywV3smWpm+OF1pq?=
 =?us-ascii?Q?iGS/yP9oqvrMKUB2gOJOgq0CFVHXI6cJ32vw9M+KEwNyzZGIPsuxRsgp8dk/?=
 =?us-ascii?Q?c6qAvooPo3RLDxD0zbMRHrOxq1I41Ym4V3a+TE8l2nqOJQT6h7We9QMdgNse?=
 =?us-ascii?Q?naM30FPg4yrnL8tXCesiPoAdH9lRQi/WFASXXFvIh6aIH7qeS2zAV482b9hF?=
 =?us-ascii?Q?9hxTsAIE1STvoCnZzZ5zfBsqIBRt2OOZ1dAcDmIZjsyesGKzx1kKCYiUdwLy?=
 =?us-ascii?Q?0YwgZG95FmGpTcbpLkx3MJWdB9VhbrTkvOWj+IGwpd88Fj/9JGlLnQHYJUct?=
 =?us-ascii?Q?IKL8hgRLD71jS9k50T4gorcJGJnD3SResop2ESI11FUOOiJG9KbnCMmsM7PB?=
 =?us-ascii?Q?Khf77iR+Zx6asc55sPsrmpqLFaDixF96cfkTOfzdzzC40K/sJJ4I03AVRoW3?=
 =?us-ascii?Q?8c86bpneswGLxdGHKZSHMSCVTu4D97EtfColVU22/f36mwLf3SkVodlD6EWX?=
 =?us-ascii?Q?GTz37Au0IXLSUgLTTo/IxkvgO41Baw95Eg83dcjo25RcveS8Mvpd3TwkCeM1?=
 =?us-ascii?Q?erSxQa2l8g4kmPXknaxrAqtpojq9jmFmFkRi/IWKn/qan4hGRStnorVIRj65?=
 =?us-ascii?Q?YVyQuLF9VJ0lSjgvrs79cR/SXjnyvWyvZhULfhZ3pWS176hB6IofcoshLJJU?=
 =?us-ascii?Q?EOquO3scS0kY/kTUlcuiPnCdlCvwZoEEO5vmJWgBnDTuuD1R3eANIs+4uH2p?=
 =?us-ascii?Q?IKDu8xQ5wC4WhW3aG+tdfXSQjDecI2S6/SXgBpYiJGMAz1J5ZhELDQWEi18W?=
 =?us-ascii?Q?7VJKMJx0UXP3s7hin3EfWJInzKM8Kc8RFl7myS9u3t7VtPPM+zWTs5+9mc7k?=
 =?us-ascii?Q?VRNRSCCTORiPmH7lQd/GEFkBJcnkcVQONc4JkB36tfowF8b3OZ6UbBI3lHJG?=
 =?us-ascii?Q?tEOdB6lBphvW5/RFT1exQ879BOf0?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 08:22:31.8945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eafa1ff-9ea8-40e6-a34f-08dce44db162
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB11087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_012245_151321_A1D122A5 
X-CRM114-Status: GOOD (  19.00  )
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
 drivers/mtd/ubi/build.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8bdfc51cacb1..af67cefd3e5e 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -133,6 +133,8 @@ static struct device_attribute dev_max_ec =
 	__ATTR(max_ec, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mean_ec =
 	__ATTR(mean_ec, S_IRUGO, dev_attribute_show, NULL);
+static struct device_attribute dev_mean_ec_fastmap =
+	__ATTR(mean_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_reserved_for_bad =
 	__ATTR(reserved_for_bad, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_bad_peb_count =
@@ -345,19 +347,33 @@ int ubi_major2num(int major)
 /**
  * ubi_calc_mean_ec - calculate mean erase counter value.
  * @ubi: UBI device description object
+ * @fastmap: true if mean value of just the fastmap area should be calculated
  *
- * Returns the mean value of the all blocks of the device.
- * Returns zero if it was not possible to calculate the mean value.
+ * Returns the mean value of the all non-bad blocks of the device if fastmap is
+ * false.
+ * If fastmap is true then only a mean value of the fastmap area is calculated.
+ * Returns zero if it was not possible to calculate the mean value or if no
+ * fastmap exists.
  */
-int ubi_calc_mean_ec(struct ubi_device *ubi)
+int ubi_calc_mean_ec(struct ubi_device *ubi, bool fastmap)
 {
 	struct ubi_wl_entry *wl;
 	int peb;
 	int ec_count = 0;
+	int peb_count;
 	int mean_ec = 0;
 	uint64_t ec_sum = 0;
 
-	for (peb = 0; peb < ubi->peb_count; peb++) {
+	peb_count = ubi->peb_count;
+
+	if (fastmap) {
+		if ((!ubi->fm_disabled) && (peb_count > UBI_FM_MAX_START))
+			peb_count = UBI_FM_MAX_START;
+		else
+			return 0; /* No fastmap on this UBI device */
+	}
+
+	for (peb = 0; peb < peb_count; peb++) {
 		int err;
 
 		err = ubi_io_is_bad(ubi, peb);
@@ -411,7 +427,9 @@ static ssize_t dev_attribute_show(struct device *dev,
 	else if (attr == &dev_max_ec)
 		ret = sprintf(buf, "%d\n", ubi->max_ec);
 	else if (attr == &dev_mean_ec)
-		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi));
+		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, false));
+	else if (attr == &dev_mean_ec_fastmap)
+		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, true));
 	else if (attr == &dev_reserved_for_bad)
 		ret = sprintf(buf, "%d\n", ubi->beb_rsvd_pebs);
 	else if (attr == &dev_bad_peb_count)
@@ -439,6 +457,7 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_volumes_count.attr,
 	&dev_max_ec.attr,
 	&dev_mean_ec.attr,
+	&dev_mean_ec_fastmap.attr,
 	&dev_reserved_for_bad.attr,
 	&dev_bad_peb_count.attr,
 	&dev_max_vol_count.attr,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
