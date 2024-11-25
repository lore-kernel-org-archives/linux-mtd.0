Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5311FD58D4B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Nov 2024 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zi3kXmmJBjN8QRoqMi5OoLHCLSoueoH1qWXHcmNKmTE=; b=qb5x0JZFLBba4p
	5yUwJpZOhJmP2g4Jo47yvHSviwnViQgxVM1hHPFDcpUKnYHrJh0msQ0Sl32zmPXiQDhQ7hzISx0dx
	WVUXNu3UNk3Y9Y6cH6Uae/Gk/wN899q+IA8oIpV3T7M7bcFs5Y/eGKj40caadqzBrkUBTKTtPgBeM
	cp/bvdIalRWXJhFgaidnN+NRCFifacFnB6aPQ81+5QB60n6jNhDN1vbKEbipt2hBBSSEPZREZUHcG
	yjFuwRnbw3y16OKIGaYYK8wXYoyWBKxWLhkZm9Re/Q4CLYzLWpej/r1VLXCHwMT5dedfSYq3RoTNX
	VJnWjFBFB8k7RcJXHgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZSJ-00000008BQN-33Tf;
	Mon, 25 Nov 2024 13:48:47 +0000
Received: from mail-vi1eur03on20612.outbound.protection.outlook.com ([2a01:111:f403:260c::612] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFZSH-00000008BPT-1l9q
	for linux-mtd@lists.infradead.org;
	Mon, 25 Nov 2024 13:48:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5SJUsAdvTaxy9zyr+oWHY4UGAWrhVDabJ8ybvyvGc+cu3xwBPm6seA+4I5gK8zlOKcUu+Ds7AlI/GPH3DaVMegBq7U35vW4d/UWA8AfpP1WKbc3S6hJWHSaT1sDT3Hfv84RyXcPMH30YHEx+iI9OogeeEBl4B/0bwZJGUfdACv8lla1FO/0Wf01gHz6hdj+yiwlQneG7jodRUmu/DlJMWollYCMZiCH/C0q3rg5ALg73bE0TZ6aZxujCOyu0fg9Gg47CCoVByyn2zw6rSHI8CrzONMORBvfaJ2d37nXoT4sg83U8IBCYIBYtrjpiaWJylB3vdhtpZQfaIRfwI5q8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H46HkazASBtXrw37WGLwZ3nvxcUA5NGCEglAUn2uNzg=;
 b=akCzjd5kS2TKJS+b/36/l9eYeov6i6Kc8XJHZX5mVJRZJU6S6M4aMpaFOlkh2Nbs5/2LF+00b4HM2wKn6KjoBRwAE1rVW60JUDZBwIEGck27RxTYuqEOWLCP0990v/2V7OADas8BhwlGvgkxQ9QBHHCfcM8anf11/G5DQYBt17fpX3j8mIeGrZ+MS2xVIJ0UFs5lFkx6iATzdOirBM6x9pSlT0mloFooLb6Pi36MoLcUtGQLTghRcoh49bogn9C+PSuQYBFxeig3BipXtuiHRWN4c8k3dgwxGyuamfYej8Sf1MJyXTTLWssqkCGqQ+DZiTlNKHLqZ6+4OPTCiceaYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H46HkazASBtXrw37WGLwZ3nvxcUA5NGCEglAUn2uNzg=;
 b=YLbyjsfl9+2DNFiFw70CZjBCrz5le5kT6wyCmVYMR+AeLG/n85/w2v7KqOc4N9Cd1BSF67GG3AJEcSazAneONT3L8mmbE2hCuxh6gf1UJuAjLFu1j6NoymmMbSsidol7l61buoelBCccqNSF+a5hdvJF0v2S5wX/d/EpArBjggA=
Received: from AS9PR05CA0333.eurprd05.prod.outlook.com (2603:10a6:20b:490::19)
 by AS8PR02MB9259.eurprd02.prod.outlook.com (2603:10a6:20b:5c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 13:48:38 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:20b:490:cafe::f4) by AS9PR05CA0333.outlook.office365.com
 (2603:10a6:20b:490::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19 via Frontend
 Transport; Mon, 25 Nov 2024 13:48:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Mon, 25 Nov 2024 13:48:38 +0000
Received: from pc50632-2232.se.axis.com (10.4.0.13) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Nov
 2024 14:48:36 +0100
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH 1/2] ubi: Expose interface for detailed erase counters
Date: Mon, 25 Nov 2024 14:48:19 +0100
Message-ID: <20241125134820.560648-1-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A3:EE_|AS8PR02MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bbd7c13-d291-4ffb-8d92-08dd0d57dd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?heo4Q6WjeYANXqCVGugb4DPVLVcXErGsUigt2qD0vaCxaMlHy6Cg4zOsslGZ?=
 =?us-ascii?Q?0zrzDUQmroZOSLfuFTFOFcydNmTJfW0iGaAbmah7kJzT9OfwW2k/fsXF6qlW?=
 =?us-ascii?Q?nHSvnP59tpciMyoOWqziABqsKQmUnpfGQ/RHPacVoPsakAlp5oHh/JPG3hWt?=
 =?us-ascii?Q?AMrPXAM1MHb9o7aSIpHlwtYYtZRagzHihIMtaxc2h/6zf0FCxoIcrHqtMqLr?=
 =?us-ascii?Q?1SU2qbdxUMySo8U2y8X+OpXpbufVPQcNy5+y87TUuQzYC00nQCVqPa/fgQS+?=
 =?us-ascii?Q?3cPK6iWcnMDhtrQvi/cHpvGfSdAzwOJHHkZURDtTOUUt7kjOg1MAnTH+7BMJ?=
 =?us-ascii?Q?D+DmfdI7EFLGaYqxmwNzfEXDfG0ZU1+U4Cquz0Jo6DOkfIGzAXqgGq+K+3Tu?=
 =?us-ascii?Q?clwxBcyJWbJS753CMJXlAmBL7EvXW3AAng/sUskSzCx2NUcylJhu6wUMdcUc?=
 =?us-ascii?Q?JlrrLuVpW+NvbJA5odWkDwkkv/ZYS5CwPnmynpzDtLA4snbbtVoZJcPz+uaV?=
 =?us-ascii?Q?kHmtMSj9atASuVBX/vZ050Y+yGqyEZLzVEnt866wvCKP710nXkrGuFg49aZe?=
 =?us-ascii?Q?rVUUOWSlFP0s0seAFaedIKNf1Yxpg2iIoPGuxbQuHtOgYsfi9uXgdIlUtVcO?=
 =?us-ascii?Q?sj7MSUTGoqCBoG3fr7QwwPbvbGIa6lXGk2kOseGjzdUx2Jl303yrmzp8mc52?=
 =?us-ascii?Q?GfIpr6GURrhbdvkVEdUb6D1i4SioAeoK4jZ8Gv/A7Ok2eSamRVrg1kB5m8u1?=
 =?us-ascii?Q?pdW48O8xVBBdrIBPhSyoo865tEPRZXPrSn0D/BlnFvmc2yS44gnY7MMMd1Nd?=
 =?us-ascii?Q?nlnkKMR9AfG8FfM3rbVn23M9RTjMsXp1qLbyuWSE5ABRhqpQ5mrTHfVDdfck?=
 =?us-ascii?Q?G/ZGuncP/hiCJatdKwH5Z09tG2RHrfA6mVKf3kYGJMFf0cjX6YHK9aYI3aQx?=
 =?us-ascii?Q?1xrSOnL7+chcsuzYNikTpv6fUQscYKf1kIv0JkTrf5SCe8KB1vdkoCfkrz6e?=
 =?us-ascii?Q?A1Ee9cyQxKvMPmCyMc12jVWTwhODO1oF8MdC7q36EaObV1ahIo26iOslwMKV?=
 =?us-ascii?Q?I9l/umra4pY6PpNJ5DRM6kr3ryclWJ2GQ3NILUU2Kjfm5pRI1HNuaiV8uJ5l?=
 =?us-ascii?Q?jORGRfF/2RcWtr0ZVdXRAET68eCsOUEeFqfRjqq3tm+e6mEltm5XwLAwLJrf?=
 =?us-ascii?Q?+kJWQGMnMPM4gtt33ak6HKxVi5cmq7Rh6yBvvlV5dWAk7AdtYBuuUQh0lEwD?=
 =?us-ascii?Q?vTnnUmYGJg2FLVwQh5FVsGvcXknN6nWxBe+zOjk15VkTaljXZG0dOM2iEtp7?=
 =?us-ascii?Q?jWIWYVYDwJtuYnpBDyNYenQBQ1xW8QK4kpoHNlEC66Rnpgdihblq/R57PQXE?=
 =?us-ascii?Q?Cm7gQfbEFnSGutiFXTrvHUxRHY10CdmdxyHgGVg5PoW5sFhoEakue1nS3uO2?=
 =?us-ascii?Q?sz76dmnBZsMHypBOE6vLFhP6aI7OS80b?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 13:48:38.0206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbd7c13-d291-4ffb-8d92-08dd0d57dd2f
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9259
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_054845_649242_BC556CDE 
X-CRM114-Status: GOOD (  12.33  )
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

Using the ioctl command 'UBI_IOCECNFO' user space can obtain
detailed erase counter information of all blocks of a device.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 include/uapi/mtd/ubi-user.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
index e1571603175e..667680e44ed4 100644
--- a/include/uapi/mtd/ubi-user.h
+++ b/include/uapi/mtd/ubi-user.h
@@ -175,6 +175,8 @@
 #define UBI_IOCRPEB _IOW(UBI_IOC_MAGIC, 4, __s32)
 /* Force scrubbing on the specified PEB */
 #define UBI_IOCSPEB _IOW(UBI_IOC_MAGIC, 5, __s32)
+/* Read detailed device erase counter information */
+#define UBI_IOCECNFO _IOWR(UBI_IOC_MAGIC, 6, struct ubi_ecinfo_req)
 
 /* ioctl commands of the UBI control character device */
 
@@ -470,4 +472,27 @@ struct ubi_blkcreate_req {
 	__s8  padding[128];
 }  __packed;
 
+/**
+ * struct ubi_ecinfo_req - a data structure used in UBI device erase count
+ * information requests and responses.
+ *
+ * @start_ec_req: first erase counter block in range to read
+ * @end_ec_req: last erase counter block in the half-open range
+ * @end_ec_res: last erase counter block that was actually read
+ * @erase_counters: array of erase counter values
+ * @padding: reserved for future, not used, has to be zeroed
+ *
+ * Erase counters are read in range @start_ec_req to @end_ec_req. Range is half-open
+ * i.e erase counter of end_ec_req is not actually included.
+ * The read erase counters are placed in @erase_counters. If a block is bad or if the
+ * erase counter is unknown the value of the block will be set to -1.
+ */
+struct ubi_ecinfo_req {
+	__s32 start_ec_req;
+	__s32 end_ec_req;
+	__s32 end_ec_res;
+	__s32 erase_counters[1000];
+	__s8  padding[84];
+}  __packed;
+
 #endif /* __UBI_USER_H__ */
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
