Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1AFD6E2A4
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 10:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QmWy9W4qS4NvG2TKlh4d+rDMhUc2NXOHdYRCGnCXt1w=; b=TfSzakxADjLRGe
	Gy3ZwKrPwHhrOM9ECu4g22+BRmVuJ34aX1kUb26f8y9zWqxtiTh1E8Kb7oZ/r8wcjaYpFJT7TLbks
	FgyFIGOaHS+hmh2x2B9L9wf6d/cEovkh5+BTNwdFuIZ++KOurEeoFDsvwVrLjJOI+YHyusOyDFzyr
	IZ8cuv5zGbwS/rirA/T3fqSnsCK87x+vSvWFR64YhVcH4vvQp204kqKOuobBYqfO5xvoEIXCiaVlX
	Pa1RwrCFClLTyIbzhzDE25mtaDVP902lNgxDFPNWxgtQeNf+qFE6svgn1SKyUoVQsLifDcPBZQi/v
	3ZONDPP9wA0Ko7EMwpCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4KY-0000000HLVT-3TVE;
	Thu, 21 Nov 2024 10:22:34 +0000
Received: from mail-db8eur05on2061d.outbound.protection.outlook.com ([2a01:111:f403:2614::61d] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4KW-0000000HLTU-0SDL
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 10:22:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWMvS+apGw2W2r18rwOWlV6r96SlyDAVZkr2HkvBa9M+KzfWTpQ0flVUgQqfgm3PqIeG8BBYRTwi3IJ91TGH9gNnmP7N8XQC9l+fXnFeelhD2TwyUhwrBK3GO+ss2Q6lLcKLTljUsS1Sz5x473D2ktyFuViWvLwPFc8PeQuyOz+ebcbRQjZUW7VIPR4qdkqI1aecJcFRBYupDYYjrdFPn61aUyIxc+S2GpTevep1X2pW5EkeZ1YIqEZDTA4F6mv9n0J87QBZeEuQhBZ1z+8X5J4zSfp/mqOTXPge5v6osKEXZWY7jMyrdhIkQN3o4tA4B0S3euf46wKJy8onUiMW0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdXBOxGUGOra9GuNKomdeulSa9DKUHkQRk9vtmqdx5U=;
 b=iMQwkGCeHcjrmexlv/XuMWwsGVKn8AMGYEMtN9hPNc9cV25hP1srWNc6xwpUuHmNI+tXdiVsJsCOkcfxIoMC0Q5eA7nk0tS30InqUHgd9tgyKClJ34x4uZYZMUXzG2vHeaVvkobFfn3NvYEmKtBiEKVjTAWtIot0D9nn0aphCKNtonqM4r2VxuoIWnBgJEM6GDXzkMWAS6WYqEO+SCSWS6M4nl90CjJoNmYE1U7DwlhdVypJcoR1b2PP1SjVzaWXouBSmkPWhAf2lgimycbDtvx+pyNN9f2mxPm+SO6x0Kv1yP9WuOxgdumbvQr5h7NPpO7VrEl7qgkXo5rfbl9cpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdXBOxGUGOra9GuNKomdeulSa9DKUHkQRk9vtmqdx5U=;
 b=Nc+773UZugmVMoZ1L0McCvxPwT5NHEhla0r1t0pYob6BTnCEh2EnBKceO1WUZeKHy/RLh61+KYmYx0lOgivo1acH9hfWe/IFjRuvPUY5OT/d4NBS6eVc8pRfa2D4bK+HiV+sdwwtb3US0ltIXcU5tSJgAr3MjJPmz8W+yGyHFi8=
Received: from DB7PR03CA0093.eurprd03.prod.outlook.com (2603:10a6:10:72::34)
 by PAVPR02MB9570.eurprd02.prod.outlook.com (2603:10a6:102:304::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Thu, 21 Nov
 2024 10:22:21 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:72:cafe::e8) by DB7PR03CA0093.outlook.office365.com
 (2603:10a6:10:72::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend
 Transport; Thu, 21 Nov 2024 10:22:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 10:22:21 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 11:22:18 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 1/2] ubi: Expose interface for reading erase counters
Date: Thu, 21 Nov 2024 11:21:56 +0100
Message-ID: <20241121102157.3498056-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885E:EE_|PAVPR02MB9570:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6cb261-b48d-4b9a-47fc-08dd0a166267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHwXIQxcApHZ9VNrEZEkq5X1mMgX15Eov3UudEn7C/ZiGWg8Y0nNDBw/NUk8?=
 =?us-ascii?Q?1FOvk6mBEUQc1AAxRceJriYqxux9p2/11hhR1Wk6oUeJ2LSSRs3TeBsKx9lN?=
 =?us-ascii?Q?hYGXcUvDqOMrEEBTA4/omT49T5jdLXNMqe7blE7va196CfVWZW1/5uomb/Nz?=
 =?us-ascii?Q?ZWzgNQKDlW2qr/9Zmccjf1zIctYOK+X7rciBwbCu/QcFEMuLPyU7V7BZNubj?=
 =?us-ascii?Q?kh9K7P4Dug5sEWR8OXulZOSM7nmKFHfpbyqA7TwpFAd30s8yXRTyeV+etqgN?=
 =?us-ascii?Q?VuRao0gm06Mu3w+EsgyQEitdsrQ/TRukb2LkDCatNXgffUx3cmlPHIY0X6Yi?=
 =?us-ascii?Q?0rayo5HnLU1G1O02mFxEb6L50jX1bl02Fn1b27b+1IGWjHlh4zzBeCqEA2Fr?=
 =?us-ascii?Q?Es0NvSz6qI4biHftQFHycuZ5z6Qpd/DQxoGtBWgiWo2p/lcCIFvNGo4d8NS0?=
 =?us-ascii?Q?8Qi7dxTWFEaytje7zMKJ1csOpn/VKvw+FR7ot5cu1PN+vl+bnXgA2AVxB2Xm?=
 =?us-ascii?Q?q+eALH8JI0lFq2nlcItn95YKEFbo88Fw53Z0lIa70ZVCcigvRLFYivlvBnPJ?=
 =?us-ascii?Q?dRULPwo3R78/o9N9+rFcy8MkQe1uICbRJpQP317AO+CHicsFYsi+shg6t/pn?=
 =?us-ascii?Q?OXkd1hqcEq60hmmlCSTJmyDAmeAlP9snXRN9F8MXLDalCKYs3o3IWG12i07/?=
 =?us-ascii?Q?+gIG2QZBHK27BxTag9obQHe3KnXKswkLcBzt9sd1WKp4/u8w8x4pPpnFCiNV?=
 =?us-ascii?Q?fKkfncSA62HjO1lrzX1JWAOFEY0lrWTIbpkEJZTCyE4a5aWIVX4Hp9CXVc3h?=
 =?us-ascii?Q?MDw3Qx/bPD3Sae5jv1stDxxTKXxI5/xYBw9YdPR3U4FwHWHJNQw7zLR0euqU?=
 =?us-ascii?Q?njKqVDIgK+BhVd7SmX6/YWPQP8qDT5fnT+CoZaVWX5s9q9ZX90y8451YKn7Y?=
 =?us-ascii?Q?Lm/zdzAn5hItB44MTL5k5FZvc9Sh6skBwuHoi0gTHaYTsYDfG3Yoh3xBYWc4?=
 =?us-ascii?Q?wHxwz2s08FxzANAOwXySA5HedyCbGfJdkGVGZqJyS4LQdNv6YPCkIC6WNluj?=
 =?us-ascii?Q?M7RTy46CILyv3hYsitjjnIv++lbeYxRrsexNqRrXMm7XSTcfx6GghQmVfxGp?=
 =?us-ascii?Q?9E9N86irrxcYRu6quHFM4g/n3we+7VzmKQZxf/pKxHqcSr3z8gHXzw6G/Zuc?=
 =?us-ascii?Q?wr163DUZv5NU9Z2NsMS5ybGSzA/GdPPvvgBBoTHn9G4OHwTGmuleU9MvQbBN?=
 =?us-ascii?Q?BgV8l5YITBxzAb/N0Ub63MaWVJPfOvoA65AG0QyKgXgP7XH+BdPvXtwv8PEQ?=
 =?us-ascii?Q?zl5EuQ7Q2IuILUTGypSmEuVek/8H3RLhsctXLgR4Acqesqsa0JY//sxJvYFU?=
 =?us-ascii?Q?+OZ6unVw5Fc5GSkuEiY1V27cRf/Kk/kNu389LD4JvcOAUJqpAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 10:22:21.2191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6cb261-b48d-4b9a-47fc-08dd0a166267
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_022232_289350_304BD986 
X-CRM114-Status: GOOD (  11.27  )
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

Using the ioctl command 'UBI_IOCECNFO' user space can obtain mean
and max erase counters of a device. If fastmap is enabled also erase
counter information of that area and its complementary area is
provided.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 include/uapi/mtd/ubi-user.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index e1571603175e..00cc8a083675 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -175,6 +175,8 @@
 #define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
 /* Force scrubbing on the specified PEB */
 #define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
+/* Read detailed device information */
+#define UBI_IOCECNFO _IOR(UBI_IOC_MAGIC, 6, struct ubi_ecinfo_res)
 
 /* ioctl commands of the UBI control character device */
 
@@ -470,4 +472,27 @@ struct ubi_blkcreate_req {
 	__s8  padding[128];
 }  __packed;
 
+/**
+ * struct ubi_ecinfo_res - a data structure used in UBI device erase count
+ * information responses.
+ *
+ * @max_ec: Max physical erase block erase counter value of whole UBI device
+ * @mean_ec: Mean physical erase block erase counter value of whole UBI device
+ * @max_ec_fastmap: Max physical erase block erase counter value of fastmap area
+ * @mean_ec_fastmap: Mean physical erase block erase counter value of fastmap area
+ * @max_ec_data: Max physical erase block erase counter value of data area
+ * @mean_ec_data: Mean physical erase block erase counter value of data area
+ *
+ * @padding: reserved for future, not used, has to be zeroed
+ */
+struct ubi_ecinfo_res {
+	__s32 max_ec;
+	__s32 mean_ec;
+	__s32 max_ec_fastmap;
+	__s32 mean_ec_fastmap;
+	__s32 max_ec_data;
+	__s32 mean_ec_data;
+	__s8  padding[64];
+}  __packed;
+
 #endif /* __UBI_USER_H__ */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
