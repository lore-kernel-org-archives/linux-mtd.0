Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E8CCFD2FD
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hl6PEV1zyjsNl5YwX8W5GEoWs59OPtvMBuAPFCvRjrw=; b=QPTuEwumvbrFd8
	9LX87LuhtR8J1hCxf2jTqeW1ML0ejLn8KN6FfWizr3nMSvaaqEYlOSHfzguWK++Z+kjdCEDEDjrCV
	cgEQFu7cWSpfiHhwXRdpZvc+VReUE6Po1JcsWE0JE9wWpKpklwVtw2rALev43FEsavZCxmJU+vAFg
	vIA/WT6kdNAaimDK4QYFUMejW4EK0nVxYSfQm0L1nxHuEzheldoqdj//NtnAoMscpuKfEDr2gnVaM
	KmYgydp7epHR0Nva1WnliSA9kZW+r4VTDcTrw1QnXkl96TZJjNPk5q10XO59s44i6ci7KQkvQmJQP
	WT0GfA5pNkSFWBtEa4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqr-0000000FokH-2nNX;
	Fri, 11 Oct 2024 09:22:25 +0000
Received: from mail-dbaeur03on20619.outbound.protection.outlook.com ([2a01:111:f403:260d::619] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqm-0000000FoiP-3ffe
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeSKIOuZ9+/clHSSExkAnaObxAhRXI0QqOnh7ys6jJdn1HFCWCsGA/LsWloEsbzjGy4erg6hr+evbcN1hMq1TNpVFtmxP16pi4zHevdqDX6b/+78eyPesaNSGPbIBeBdet/DjE/deu+aKNNQbP6iGG2xbmMtYyEQ/550ghvnIBRxOFIXzfzLxNZaaT64+R4C4USv2gCf+z+s+0QRRe6b/tlqr5KaS126PUpssZSyyhoa7P0WsXV26MEAf9tFvIFRntP+R4qWPkEkwWPyiJwvQtMPA4M1Tp4CtOxojezWg9IXQa1s+geZlgrgDh4wNof+gk4SNBjE8pOJJilTxDc1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuo7sj2uTXID1/S4LL2UUknVgGWcWXNxILM1v5PM8/4=;
 b=ArTO3yUVgq2fvl2mNBCgsXCaMAkhNkpg4AVqhxDi3uKNi1EMSqtmFiaDor/nGDh/n+Rtlk7H+hfeY9cTJ2d5c1Cvtnpdf0ihk9IuKlXT//SKfaMIOR6EQ2aD386nRefav1w3K4JDT4UxDa0BNEOqBr+1CNRGjZdFMu7h2p0DIEdRwnPpZ53/DI+si3+4ijTIVaQxYDVojJiokr5D0lWTpaeSuyCQxeYFwUgJy2QLVx7aIlSMs7CBFj1xoygKG30/jax7aA9QaJTLLoAFQBjlfsXZ1nAeRWWII8tdFA9MbQ8MEF29IOcB74Sj1U1g59Nipyy/t8/QTBDF5tW0s/wQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuo7sj2uTXID1/S4LL2UUknVgGWcWXNxILM1v5PM8/4=;
 b=n/h7YEyP78go6GY8iqDs+k0RjIaac7d1R8WMv0aEpXVoZ4QSQIJ8mUbysBviNGLLoxGdlO6cvAaX61kvpoyxrox0J6FS9RPIvkKv/Ghn63QTN7+vBI50Y+olNPlHC1iuZ0qnb8rcm7Atyapp1TpYaSFJOK79zJZZNaaAYliDp3U=
Received: from DU2PR04CA0303.eurprd04.prod.outlook.com (2603:10a6:10:2b5::8)
 by AS4PR02MB8744.eurprd02.prod.outlook.com (2603:10a6:20b:58d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 09:22:14 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::af) by DU2PR04CA0303.outlook.office365.com
 (2603:10a6:10:2b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:14 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:12 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 03/10] ubi: Expose max erase counter for fastmap in sysfs
Date: Fri, 11 Oct 2024 11:21:27 +0200
Message-ID: <20241011092134.2909496-3-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039232:EE_|AS4PR02MB8744:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d58bdca-9c6f-4147-da27-08dce9d63176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rhuhk6SVVlNUtNe3VIXE+u83GpgjSNR+hOJOB63UB4d/o24AnciXm1bp8sol?=
 =?us-ascii?Q?glMgnn9eu4+Atc0V4HuX3W3j8g+ORXu2bPfxBxaIpLQYskE2Eew7lrFLN9ed?=
 =?us-ascii?Q?l22Sq9M/unfr8pi4OejBqXv1UIr+8pyWyeWgnX9NkY1RrtDHsLF87eodCFuY?=
 =?us-ascii?Q?vg1C5lcgp+2ziz6NB2KqQQBo58xgz4qboC4JX5XvCBGFydi9Ch7is3n/nblT?=
 =?us-ascii?Q?cyap+QO90nJDIU1AXwZdGl48U78YXdjVLQzDGaS1AwjMWaEjG4wu+TZoSHe2?=
 =?us-ascii?Q?N9rCiBMrEX7CQuVkXDepaZ5+9HmX1Fh/hmkQ/xh2XkkfClcmtCZh1yymQNaU?=
 =?us-ascii?Q?frtlbdF0M+ASG4l8ITtqSVJa+bqk604vUrHous7/zVzFZuHMoFg1ITNapLub?=
 =?us-ascii?Q?7inX/9XfhL8XlzKVsJvE5CIqG4csyKfLcRzX0DGXxf8Ls1cSUDpsG73yDf0K?=
 =?us-ascii?Q?dScnCMfkSMvrxJF15EAG7UByez1LVhXQyaLexmhltKEBpqWCr6QeT1yYnxA+?=
 =?us-ascii?Q?riTonhjuxMMdq8vHOZEcAk0ym98HDmUIOaAfIR2IrN3Od9cNLjLYbvpAdXbd?=
 =?us-ascii?Q?XTgFKcDFtQWvDjYjnGAp9zusBXECsOXAqpSWlXPfm34cSA67XUgrR43lUs4G?=
 =?us-ascii?Q?zkVMI/mQjmMg5bUTbYs+EAbu9HdRrr7Pk2JwcWGYNIJFdhgucLLXDt7Ho5EO?=
 =?us-ascii?Q?cK1MVPOoIzQPi45wfUdF1q9fPJP3mv7aEsY65vL1MBAAZSXoTcQkdBI/raol?=
 =?us-ascii?Q?vyBVRV2qTVHwimwEMvpH791H8R2vpWsjbIDXirSkAKB13Xm9Qj0ODueWR5UQ?=
 =?us-ascii?Q?gseYGnGfmHEqnziH4Slc2yIUpagG1oawuo/vfiBhIsH0njtFp9j30Q04WsMT?=
 =?us-ascii?Q?JsNrxog8S7vkhx/ehNHDcAuupXrT8tB+vy1c9ENO4VXDXud8QIg/MwJ5Gfg1?=
 =?us-ascii?Q?ZYaWtausXsOBczpGSEoEGnFd/0SMXjSNKZmK/taTKAIbG26qmDcODHKY6Fkk?=
 =?us-ascii?Q?/Swow5afGBo9+4Oclsu5UlrSnY6dMX/HzFtwVv1uzfHGrbX8bbPXkEDtegco?=
 =?us-ascii?Q?pdZGnZXnzjFoqpt0MEP9p8uTFVgJmkvPhHk5oNagRFOssSBh7/U0+4YOL7Cc?=
 =?us-ascii?Q?IqfGbG74Qy0fDqHkdvZExPGtUsxmlrlWyaJpVbLl+K/fDEPF5gvp08xzj0hX?=
 =?us-ascii?Q?UsGy5JfSrWwVW31mWbexHMrKNZbiuKgaQeDDN9zwsDa0gvJp5scGpP4DSfq+?=
 =?us-ascii?Q?lxZcg0iMNzJgOJMS8x84Txz12OUnKmpnQ1nJQolCZDPlWOXRaKqkaFNImuiA?=
 =?us-ascii?Q?xdlliomIH2bJTnZq/Y2LnB8yA7wLMT0p98WlpEHXFnaZgusPPLaO7uTXyAdM?=
 =?us-ascii?Q?JygirihULy2jo5u+JvF5/Gs5y2zw?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:14.1288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d58bdca-9c6f-4147-da27-08dce9d63176
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022220_938587_58EC74E5 
X-CRM114-Status: GOOD (  15.46  )
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
provide a max erase counter value specifically for that area.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 drivers/mtd/ubi/build.c | 44 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 3633c743e7d1..f5a3a3f7d490 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -134,6 +134,8 @@ static struct device_attribute dev_max_ec =
 static struct device_attribute dev_mean_ec =
 	__ATTR(mean_ec, S_IRUGO, dev_attribute_show, NULL);
 #ifdef CONFIG_MTD_UBI_FASTMAP
+static struct device_attribute dev_max_ec_fastmap =
+	__ATTR(max_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
 static struct device_attribute dev_mean_ec_fastmap =
 	__ATTR(mean_ec_fastmap, S_IRUGO, dev_attribute_show, NULL);
 #endif
@@ -386,6 +388,45 @@ static int ubi_calc_mean_ec(struct ubi_device *ubi, int start_peb, int end_peb)
 	return mean_ec;
 }
 
+/**
+ * ubi_calc_max_ec_fastmap - calculate max erase counter value.
+ * @ubi: UBI device description object
+ * @start_peb: First PEB in the range
+ * @end_peb: End PEB in the half-open range
+ *
+ * Returns the max erase counter value that can be found in the range.
+ * Range is half-open i.e end_peb is not actually included.
+ * Returns zero if it was not possible to calculate the max ec value
+ */
+#ifdef CONFIG_MTD_UBI_FASTMAP
+static int ubi_calc_max_ec(struct ubi_device *ubi, int start_peb, int end_peb)
+{
+	struct ubi_wl_entry *wl;
+	int peb;
+	int max_ec = 0;
+
+	for (peb = start_peb; peb < end_peb; peb++) {
+		int err;
+
+		err = ubi_io_is_bad(ubi, peb);
+		if (err)
+			continue;
+
+		spin_lock(&ubi->wl_lock);
+
+		wl = ubi->lookuptbl[peb];
+		if (wl) {
+			if (max_ec < wl->ec)
+				max_ec = wl->ec;
+		}
+
+		spin_unlock(&ubi->wl_lock);
+	}
+
+	return max_ec;
+}
+#endif
+
 /* "Show" method for files in '/<sysfs>/class/ubi/ubiX/' */
 static ssize_t dev_attribute_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
@@ -418,6 +459,8 @@ static ssize_t dev_attribute_show(struct device *dev,
 	else if (attr == &dev_mean_ec)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, ubi->peb_count));
 #ifdef CONFIG_MTD_UBI_FASTMAP
+	else if (attr == &dev_max_ec_fastmap)
+		ret = sprintf(buf, "%d\n", ubi_calc_max_ec(ubi, 0, UBI_FM_MAX_START));
 	else if (attr == &dev_mean_ec_fastmap)
 		ret = sprintf(buf, "%d\n", ubi_calc_mean_ec(ubi, 0, UBI_FM_MAX_START));
 #endif
@@ -449,6 +492,7 @@ static struct attribute *ubi_dev_attrs[] = {
 	&dev_max_ec.attr,
 	&dev_mean_ec.attr,
 #ifdef CONFIG_MTD_UBI_FASTMAP
+	&dev_max_ec_fastmap.attr,
 	&dev_mean_ec_fastmap.attr,
 #endif
 	&dev_reserved_for_bad.attr,
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
