Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED682CFD312
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtOzfZdoMCWO81bB1+duOBa1fzzmnq1MYqbmqT2oeos=; b=gFPG4FydMw43oc
	yJ9Ey0tmOGeuI9YT1Z7WyVwnr2HZsHEOSRqyOKfXylMV3Si91Fu1JyMXu57G/+dfEiYAPKUgZ+Bn8
	mhDAfwO/CCbZrM11cmqGUKamcARlhiDOKwyu9gtky7LK0GtkKRMe4AFXCn8ueoZymrw6cZuZSI5x1
	2ieA0xj5ZTiRaMqBYLqv2NKa4lti7tMqpziUvu0Ode1sW5pY/Jwu+RUT08AmppsxbbD5O1V2yRSVU
	RhA6IklS2a9zBqe+vxVo1QuRJTnYSgUs/Nk5WI1djvPA6QdDxrgA4XNElxTVtBTKRurY76FlMddrv
	YFTzHuxmysx11SGVsxdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szBr4-0000000FosD-0R6G;
	Fri, 11 Oct 2024 09:22:38 +0000
Received: from mail-vi1eur03on20619.outbound.protection.outlook.com ([2a01:111:f403:260c::619] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szBqy-0000000FomN-2hy6
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 09:22:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzcxoCmFbrIw+J5eyuRIB8SpmrxqFepRUd0L++6pW2qcjyWQtHax4vN7nIppyF3Rmt1JzKL6fRA6hgu7fo84ePgDrnBL/nL5RV74hxifK2buxBNCK+JuwZOoQsPP98+4d+3Ev4CiRrSY36eNa1Z0mLj7MONOvAjHtiemcNhvVrbg9XQ/g9uwL1I4PdX5ifqhDCeFzCoZ+qmI2ANiXk8+wJ1kSV5+J3NsM9FLg/IyzwKXzh0ujyhkMRSKHSANL7U0q2gYbkOAP41eNewiiWBiyVf8MEX5Sey6/a4c7ISVfa1uCbSPZazcoQ7NOufJJaHjmiOQMsCqA0P2Jg7ZZdcRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2wgm8kccPBeeO690RvhSwA/vguOlAByg4pcQjNxNCU=;
 b=T/eiyoUICJzdrmLF+9X5WbtwKfwK4Hfj/+JIDmpvxPFoBUvjzGZcllV2gwKepQSPUpoQ4hIR20iRXYtwuiB1wl9uZzHPUgQa6+XQv9QWLlfkThTyEt3Yab2sIQKPoDyiDVr1ZTK5RhMafb5XX2/tqtDkr8WBH/CV9vOMwh3VKy+tzwqxGFIGx82i7txXhl/gQ+e1yzHHeZloNz1ZYcwnQ3grUvmaivcQiOaqz4JS3trF4vJto0voo0nyURX5GhbEwKlAtpXMy/EZt/2PQtddHV6Bbv12UX7xb1BgvzwfzYwnO+aNBN4q1YxJg4+JC7n3fyqmOCidHiONHPcSBJmi9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2wgm8kccPBeeO690RvhSwA/vguOlAByg4pcQjNxNCU=;
 b=idqGcnp8g0uyjyIM0GkN0yiBsGog86ywL0NQ0bKgK+RsFRtvBGfBj4ohWl2DYELzYw/V/dzytdLbueXF4zuQu7dmdTXALguwbQ4SsjwQI47ClwpOs2HUxkwFs53n+jt8dES2KG9Nj3ERhjWz/od6B6lzwQDCQexsMX13KMpIVdY=
Received: from DU7P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::12)
 by DB3PR0202MB9106.eurprd02.prod.outlook.com (2603:10a6:10:42a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 09:22:26 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::bb) by DU7P191CA0008.outlook.office365.com
 (2603:10a6:10:54e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.17 via Frontend
 Transport; Fri, 11 Oct 2024 09:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 09:22:26 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 11:22:22 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v2 10/10] ubi: Add max erase counter sysfs attribute for data area
Date: Fri, 11 Oct 2024 11:21:34 +0200
Message-ID: <20241011092134.2909496-10-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011092134.2909496-1-rickard.andersson@axis.com>
References: <20241011092134.2909496-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|DB3PR0202MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 2331b3c8-3648-41b6-ec1e-08dce9d638e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i02dU7Up/IA0ikyr2ENXjCKOPbtu+Mkb/uwKxwR7FCq2sOJW0tB1aPAsPLrg?=
 =?us-ascii?Q?4OFrtpM79FOPKT/tIFQiokH040kzVQ5b/Z4x/n8s4psRFPwwcPWII4TN3ejc?=
 =?us-ascii?Q?z3uKUWrV4fDowLHgcwC/+/ZE0KOvCswEU4g5BVibP3bGbwSFjC1smwYVsqQW?=
 =?us-ascii?Q?wfQVZsafOuFXXQy41v7gAtpciIHsaDMZpI/QagWFRjXFK8BWdN78i0ArktNb?=
 =?us-ascii?Q?5sVcJW/5BbqebkZEQWVaUhjvCafQCFL+ulZtnEUHBH16o9WJ137CrDpmVGFq?=
 =?us-ascii?Q?43qWomG6suHxDIrAfN2C+RUixfbrD7pFXWcSN1BrQB2zzSabVASr/DFS30HM?=
 =?us-ascii?Q?1HFawRz9mhAZFgraEWX2Q9sWEQFEDih41k4amXOaRx+/MTuX2r3FKNMw98MQ?=
 =?us-ascii?Q?NbaxEAh36zfRoawE/x0z8zetYKgpI32jQcklLkOpRN64X55ts8XWBGtXnJ5Z?=
 =?us-ascii?Q?9e7tPC0d5lByV1LkmbNhmSIiX/geoDIG+g42QrhHuCS3nw2TQ6vNDXJk1S83?=
 =?us-ascii?Q?09lWh52SVN8TAurfSVrisoiuLPEDTOVhKMfhdUdZnRES62q+qwnT9nAz4qC5?=
 =?us-ascii?Q?HzmXaq7a0kTlZqyyzH/lSOnAQxK9OAbVWxKmRGuJXvssKtP087oH9CS6Kxmy?=
 =?us-ascii?Q?VlnIsbZDAF6P5EoEoiMM0xMcFXAnq7F1JT15bEE37uS87+E2/WsgAVxMKb5A?=
 =?us-ascii?Q?ZSMWt+61CKu0HmlswKkUIiUVOJutEyEmSRPyu/eNb8SFDEjCUbYWV5DTFkxV?=
 =?us-ascii?Q?p/n6uas/mQwFqeKdJnxdjsg7y9KxHABvo9rWWq9KzIoXekAD8iTVAt5IJ2Md?=
 =?us-ascii?Q?Ew9p6PrYIrmOE63mWJwcTOVupWNF9TaeIWGEc4vLSrhTiZZAOgr8aIzmRdOS?=
 =?us-ascii?Q?IRfhYNTjGzHuuzC+44skpMpSbWmiNQTe7i3ni73Z0X0Jqdf0Owe9xlyY5rXW?=
 =?us-ascii?Q?foL0U0NxCc6ESqmFt6hEw7zOTFCqHpmqvGosu/v41PMy/bqSWMo9WM86yZPD?=
 =?us-ascii?Q?gBmbUIY4J9OEnL75bxE/q4wlz0bgbs9XFvuD8L6YO/x7BfbGPoP6sYxq4E1+?=
 =?us-ascii?Q?xnJBtdVxgyF+ZVc87wT0hAxdm3IznEI5M1oNpRmhCMFGaz2S6BOJW0niZ8II?=
 =?us-ascii?Q?15NzfCIZ7cSC5LFi133JPfU0DFZQ2FU75xTe8D7CJYFOlgtot9X34CEECRjN?=
 =?us-ascii?Q?OtzvjYu0RWGCECVfZ0GL2cBY1KAGRDN67VWF/5f8iidM8IapHFjtOoUAzQKA?=
 =?us-ascii?Q?wm8RwYkeo+r5VEZCPlxuYZxTzJK8FHrSeS0vorLAqRRWeVcCvvcSljtwHTMr?=
 =?us-ascii?Q?KUNlEOkOzuh49ZKEVCQWf7fzEhTb4h4/e2oHyDzjhI9bdUn02PRI4bm/5SP8?=
 =?us-ascii?Q?z26nj1yIRbVXtwbeYiDP2Vbdlt/m?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 09:22:26.6270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2331b3c8-3648-41b6-ec1e-08dce9d638e9
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_022232_718478_4D9A2ABF 
X-CRM114-Status: UNSURE (   7.71  )
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

Data area includes all blocks except for the fastmap area.

Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index 100e1c0698a3..ff453557b0db 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -86,6 +86,14 @@ Description:
 		Maximum physical eraseblock erase counter value for a block
 		in the fastmap area.
 
+What:		/sys/class/ubi/ubiX/max_ec_data
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Max physical eraseblock erase counter value for data area.
+		Data area includes all blocks except for the fastmap area.
+
 What:		/sys/class/ubi/ubiX/max_vol_count
 Date:		July 2006
 KernelVersion:	2.6.22
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
