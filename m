Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E09AD0D791
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Oct 2024 13:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nOq6WhKjLfCDjkfC/uLP1J4uk3Jw6j4BocKr+vIb4g=; b=sZTkDDgWXaba7A
	k7dDp+SkKPqqjF5hTlt20dSGZqqQmbtGbv/jYLYYgB/waD2Pz04oiVxL9QZOME6H8rAfQGCFrnIKR
	9TfjRCtKDuCns5jqaA9zf7aX1aIETBwBjRmPobEA5c+lpAt4qnDKXF5V8zDN89gD93W+j6HXV4JaH
	YMnQcIq/YYDPGMIUpFFCPQdCJRNElh1cZz2IOtR5MaVfLgnsOEpdVNUVzRLMK1RkprMInyDdTYSB6
	oCeqsLNPErGNDrJWuIj5zjS8KKJbCrB+3LfPKrN41iLm7vkEb25Oja25MEYvpeZOLFfY3//xqvPOV
	7XNXIO8Ry8t61KmM4Itg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFGl-0000000GNNV-0j9K;
	Fri, 11 Oct 2024 13:01:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFT-0000000GNFD-3M1s
	for linux-mtd@bombadil.infradead.org;
	Fri, 11 Oct 2024 13:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BncWQRUuUZ+HE5Ok7Vjufrqhf7livi2yvpMPu96d6LA=; b=YAx4Ckn7kldY+gCChhJDkSyNqh
	VEFeb49umM1lHU1aMMjSdrEALt2zLCmM4qVXglo6IEyuKeZPxsapR2oLINu03NPM5nLKLseNzoZ9o
	781UcykTGC3qOdn9hSYO/XhbCAkFRs7CcMEetIOXBhXqefn0U7RZ5HVz9ZWA9NDfl5MT0BNDMxjsQ
	K/gxCsr5vhNd3Z8/uHQwoT8b9CES607PsNECXFlcayi1Ukl/ccnG54VNb2Bg5N8Z9HorhipujblBD
	RYHovyw3PyuiJGbg6mxHWXeY8wOuLqj4GIp44mBGGIycwC6m8Qfyr/PMS63FhmgEgQVlV4rSMRAwO
	k7WCeopQ==;
Received: from mail-db8eur05on2062f.outbound.protection.outlook.com ([2a01:111:f403:2614::62f] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFFP-00000005tGi-3Ne6
	for linux-mtd@lists.infradead.org;
	Fri, 11 Oct 2024 13:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMUjue3scbk+qX4noDMOanPZFNpJSuLyCikxPDk5kdyq85b7Ji5BmMnARKrHjpzZ1FJwsVAJM6jwByCFgSHu6TNdIzi9HTY2fD84IySPR6x8ITV8+tbtYVUMELUSCEBCA7mDHtkjBU3//RQqKXhBNKHyfabZh1/nNzUv6h4tJQUO+pjTH++C9JkJPeEMib7E4yk7t/YHw/pdJd1xh5svf/f+3wWIYXaAGc7pVHWAtwWYm6yVfAtWJRkopiuUZw4914poaR3DtKeEn33USZbaCvEQ8+yhcyp1eC6VG7mNlqbfu4hIltA1oLhqoTsuPrx6Mq0o+dcxi1mL0dEFn8LwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BncWQRUuUZ+HE5Ok7Vjufrqhf7livi2yvpMPu96d6LA=;
 b=XXIh7s9jZ+8bxk8Q0gwJs2agdbsqYfYH03vH7WIjqog73c9wiidamRlRZg2ULirGlXnTuFO5vlxtkMSTMWIN3WO7Iv+G7iSJZibnQisdlb8dW0ZbcmCpskc8cN2iKkHNSn/zd2Okj3dcwMts45m5QNiik9WNRXlv074Q595jr23sK5PuL+dcWr9ZabARZUU0CjUiY86b3MmmFcWib2a+CTejZnrqmrYc+LPFSribvK0QxXjk0poAV0Jju2wA2Szr46w3YeUwn7VnZcB961BSamBsTEwpnoX9R3dTQ3Owu5Lmmk8oBzaesoHVy79ro5z8/62xTMqjw1YFdSCZvmW65Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=nod.at smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BncWQRUuUZ+HE5Ok7Vjufrqhf7livi2yvpMPu96d6LA=;
 b=H66v4tq91Gq0KYQ4/0TuwvQxy4fIFo0bx1mNWhcMF8xesdRecRxaxDW/2ev+t45uqSuEiVLYRuUcmzCa7bs6+jUujz0lx9IS2fALUXDD6k1OeyQX7i+5VpnMnuzYIxgQZCuKE4owNFzVmSWzIGyrq1U40bam0B8RBzO1bdL6QJk=
Received: from DUZPR01CA0205.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::18) by PA4PR02MB6591.eurprd02.prod.outlook.com
 (2603:10a6:102:fd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 12:59:52 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::b6) by DUZPR01CA0205.outlook.office365.com
 (2603:10a6:10:4b6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 12:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 12:59:49 +0000
Received: from pc50632-2232.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 14:59:45 +0200
From: Rickard Andersson <rickard.andersson@axis.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>,
	<linux-mtd@lists.infradead.org>, <rickard314.andersson@gmail.com>
CC: <rickard.andersson@axis.com>, <kernel@axis.com>
Subject: [PATCH v3 07/10] ubi: Add mean erase counter sysfs attribute for fastmap area
Date: Fri, 11 Oct 2024 14:59:01 +0200
Message-ID: <20241011125904.2915983-7-rickard.andersson@axis.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241011125904.2915983-1-rickard.andersson@axis.com>
References: <20241011125904.2915983-1-rickard.andersson@axis.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|PA4PR02MB6591:EE_
X-MS-Office365-Filtering-Correlation-Id: 08354678-8bb6-42f7-3514-08dce9f49717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rPWlPl8nEvQUF3uxJSUnDv/rn13DOP8iUbLO0zpxfWbO25i7xGcWlu6ZX2u3?=
 =?us-ascii?Q?FEZrzMD8vfdHewwO5Xbc9oO3iODKvLy2C0PyxPDNKFimt5alYhLUOWAnidF+?=
 =?us-ascii?Q?QI3LaZR1UZLwLxFPFJ4v5rQrw52bL1+B6s9af8P1/Kk6T6F5VabOD4x3vfHo?=
 =?us-ascii?Q?rqz/BbeDLhaBrH2bopXqTC4SXZ8UgDmuUosWKJfE15wQyXPDKYSjn0cO4Qvl?=
 =?us-ascii?Q?Dzu82hJK5Ytc+pOfsasu3V5Fm40JIOxABEIcYoTEc7no1B73HPt0pjw1Pgmg?=
 =?us-ascii?Q?FXU57lkff3BC3EjqpdFwV/2TlV/iI6LxFSNr8Y13/TLhkh1k3qO7grQY8RNy?=
 =?us-ascii?Q?GIIYiJlFMIWo3U5oDqQoQTYOWI4jGzZAN0xXC1w1ETP+AVU/QHQxkj+D0X/U?=
 =?us-ascii?Q?I94yIhKhUJeNcdSpKcyr8a1ZDXsW8Y+VZ1JynTsrqEFOUXRm//FXxQO7Gj2w?=
 =?us-ascii?Q?wy6fr4wAhvK6s5+58V0HsOlj9GXHdkw0MayxGIhlqBuVruAAjnxSvBpOiK2e?=
 =?us-ascii?Q?se/ixSkFvj62IhwBIIcoeiMWr+sSVl/+wYbAAtegA47zR7ik3NXy73B4a68x?=
 =?us-ascii?Q?FqRVNYp5lY7YfQRkyyO/8RY32Rv7+UDU5AckbYTo7ZHymM41JJoCVU83Onct?=
 =?us-ascii?Q?ZTfnbzmn4k3iDOrR7becPxjoEP7Y/6QYVc3prcMHgNgWM5DuweTfUzpDQ5uC?=
 =?us-ascii?Q?w/WoxGJF1s8mstrNFJd4UNSbhgT9C/f5rZE/aL4/NGWwZTlxjgj1W54U1ufd?=
 =?us-ascii?Q?vh6nm1yvqkk9fffr61CFJrfFr1OpX0MHZaMlrbsOC9V3aGyn1Q/3N3WmQ0vs?=
 =?us-ascii?Q?Q/TrmLAGzA7dZ/jm+C9YbDpgtpfBK+73T0Zzk5nvcJo0daDy8uOxAaw94J5B?=
 =?us-ascii?Q?2vJ7ZZVmWqUGLifihCfTJohSHKkYd5sutzIRQV5ME1ssVg8BqCwdvCGzVDUs?=
 =?us-ascii?Q?2pGTWyHJY4S3lMO2yVfHLXRgcOzsvtFSt/IdQjOdAwrxiOe4q67VX39z2dvk?=
 =?us-ascii?Q?uzL1MEYt8xc+ygw4G4KOh9+x4LXiOwoKZHzi25mwXUejxaC71Hq6OSZTj7X0?=
 =?us-ascii?Q?wz0yKdXUt0P9K8bO+aqQOXy0Fn0k4Yud7ie3WhuyiIufPRi1CaGKY11FvJ/U?=
 =?us-ascii?Q?MfcChzC/m1zrB6AROcGProCslPMCfgXfYeafzJ8KyyA/a6KxA9fOKhpfDJgo?=
 =?us-ascii?Q?bFq4/8e9YXt1xq7lx7rDtjjq/nVkfeYTLGFN7rVD41TIBD6Li9hXlkdbpkZe?=
 =?us-ascii?Q?uSKCuClqmNa2MqUp2uaEDepSlRb77W6LdSRuCmLgnzaxnRiMPmiYvgGWnq7S?=
 =?us-ascii?Q?wW75PDD4JybhIVZA1iP4ugcBp8d4CyP9KpDXjKUCIjkIBYdqgq4k//lEB23W?=
 =?us-ascii?Q?PTUj0b4=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 12:59:49.5159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08354678-8bb6-42f7-3514-08dce9f49717
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6591
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_140000_021025_9F437AE5 
X-CRM114-Status: UNSURE (   7.96  )
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

A mean erase counter gives a better understanding of the flash
wear of the fastmap area.

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Rickard Andersson <rickard.andersson@axis.com>
---
 Documentation/ABI/stable/sysfs-class-ubi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-class-ubi b/Documentation/ABI/stable/sysfs-class-ubi
index 535a3e6dab12..05a701b03a9a 100644
--- a/Documentation/ABI/stable/sysfs-class-ubi
+++ b/Documentation/ABI/stable/sysfs-class-ubi
@@ -226,3 +226,11 @@ KernelVersion:	6.X
 Contact:	linux-mtd@lists.infradead.org
 Description:
 		Mean physical eraseblock erase counter value.
+
+What:		/sys/class/ubi/ubiX/mean_ec_fastmap
+Date:		October 2024
+KernelVersion:	6.X
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Mean physical eraseblock erase counter value for the fastmap
+		area.
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
