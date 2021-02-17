Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A02C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 21:20:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEE164E79
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 21:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEE164E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UJ9PoumwL0WPIIhrrbNs3NHdiyotfQGDBfJmiX1v98U=; b=RNDaTh+PQMEUe/d3mjOm1Uo7H
	2LUQ0ayXzWzN3n+DJQESL20lkRhpG+0RvB9VQZWElIJi8S7c3SIzr3ZZrTG+0fHhPZomCXaVzfqef
	gLopz8JgtXmolki6mtnfH3wTYUznftqgkCeoYcPV72M4Sn/h8FMKHla6asAduMowU3kOiJFBG1j2Y
	BiS+SgynwTdDaOu9ytP/g4iGIVpMzbm28jT82biRtAnzYjLv//VJRoIdcFmUjN6ISI84Q3YAWkeN7
	Adm365dsG/GvJm2sXUyBOXtPl9/JAf9Ub5ZZIHvOGMFYsElKv42GEkQlrcDZZXb2D8sECR5vF7opm
	NRj2vMRbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCUDu-00062D-Gm; Wed, 17 Feb 2021 21:19:02 +0000
Received: from mail-eopbgr130119.outbound.protection.outlook.com
 ([40.107.13.119] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCUDq-00060d-6k
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 21:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVFX0bqHLeqXZ4VsrGnnlXR4Cz9Z2k0f1kI+Dj+4O/vEECv4sqdFN/xRE6U09wqCpXoNPrd4+X4mzDjjpiNHIWXZ3C4rUyd9rRhFLOfzNKQ8Qgg249bvMNV4lt+SORRqkmvwd+58iu+wZfF5NFR02IEZAxuveSlnpYhDvrDo67tYOsnBw2IAA13SGw9ugiNx4l5RLIZj1p+yPhZfXQ+O6xxYnHhKn9S2sbKwWYCSv9JgH/OJyzYdgLuqiavXExRfKqj0StIBeVd2XcaRY4FIns4gW8Q2Xsak3z54LRvwPk1Xb8C9z2ri8CbqqKAOah1LZZuMfLY+kmUC9Mzi7UcT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgsHrchjGVk7Ze3KVVMsru3Mt0s7xlwCJsTedi/ISMw=;
 b=RlEZSNeeXOKjx3vjd7bT4txGFBzDz/8JA/iNaiTfZU1g4Dx/PIb0XrDDnyB5YszLQzdMoM2yxhjFjxJogIcJ3fSW8uos/RHU1eV+uI+jtmfMUpZDE4VwVng+motnQkvFUAdKmz5NRAENw/EBm6jWMxL/pZbdlSO/b6gLdGyr4ZU/yIYrc3b8bUwhbXn396RBTXQOFGhPOLCpKfFzych4RV80UxwMZxosmYmScuJv4knfhjzHgps8sk2vFmGkFkkFZV1Az9r0MmBiOAX+I1IZSRb8LYGCApXEXhkc4SJVRk5+HkfujnJJP8UMkmLKoyB0G5V1Kmx6PnDV4owBLSiR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgsHrchjGVk7Ze3KVVMsru3Mt0s7xlwCJsTedi/ISMw=;
 b=ETywvuNL2grdwpgoUFsCM12P20gvdHqeqlOTlLDG+0R9tOEkDK7ntgmnLO3mKdJHfdNv1Izk6xjZGAwJq7PTrq3t9nuQ5gKga46U3ujzM+y6kjbD0sXmjUzD/hz3b+82h1x7DZyyFaxvcDjRPu4pmx6tFQhrJis5QJ8PSXkIQWw=
Received: from AM6P193CA0117.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::22)
 by AS8PR07MB7430.eurprd07.prod.outlook.com (2603:10a6:20b:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11; Wed, 17 Feb
 2021 21:18:53 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::10) by AM6P193CA0117.outlook.office365.com
 (2603:10a6:209:85::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Wed, 17 Feb 2021 21:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.17)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.17; helo=fihe3nok0735.emea.nsn-net.net;
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.17) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 21:18:53 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net
 [10.151.74.146])
 by fihe3nok0735.emea.nsn-net.net (GMO) with ESMTP id 11HLIoTc020561;
 Wed, 17 Feb 2021 21:18:51 GMT
From: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: char: Get rid of Big MTD Lock
Date: Wed, 17 Feb 2021 22:18:45 +0100
Message-Id: <20210217211845.43364-2-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20210217211845.43364-1-alexander.sverdlin@nokia.com>
References: <20210217211845.43364-1-alexander.sverdlin@nokia.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 2e665b0a-8223-4e2d-1ad2-08d8d389a0b3
X-MS-TrafficTypeDiagnostic: AS8PR07MB7430:
X-Microsoft-Antispam-PRVS: <AS8PR07MB743063D0ECA4E29EBE150F8788869@AS8PR07MB7430.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:302;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qa6SS+BSeQborYbTxH+Q5VY1KX8p9n4LelfoQ5zGZdTtoKcn1BEVFLnWX/8QA/xH8VVHwM0VNSiNdOn3pEt5YJEqUFtPC6qac5AlgiI6D+p9N0sCOrM4L9Z9stlqO8Vy71TdKi5OACOQ2lLE3l2LfqQCsx3b7AXa1/pUDlbHq6K9C6sViShBJDnUp7vpfhw80lAIs67vAzMOVZMJ4mXCwRIu92IvUyyTj3QlwZ/Z0W0bSuGx0hPBXoXLLN0i6242/GWYD6RyqBMPKbOc3CAhuV6hcHEaEJeB50xff1rwrpw/kG2rU0zvUpFi6e1A6/2/9AxFlXrJ0nPTbR6vJ+U5TjOnCIikACom8s64NxscZ3d2yG+NUOUvSVOzjRiTuR9SOvF6HKBRnjNr/lLZ51YzFtCv/LaWHw5BIcNRH1r5s4/pnmj5IyXLNsPrXGyhYJTb9xsF9ZCfgbl9Viw/Zx6svFwIJTyutUNXG9pA8A0wYfcYUFipvqNdWqpDwEaptCtoHjDWfRlqbaL1oyjzGbw502/gtUlUq+SgBSxOPchPp5uvBYve1GC1/2sOAaVbRpT7TAmaG4BMfD0C5LW0B0tabQMbbMoKErRLE2hVG70BvXCpCN6vLUS8hlJCR4a5JOS5ysuNeleO3pp3xKdiiAXzECqQipKtzEdoMpJxHmTpiyEYFAviC4vH25OWV7BT70tbHH7+GRZCwMUjACVEF6UmDQ==
X-Forefront-Antispam-Report: CIP:131.228.2.17; CTRY:FI; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:fihe3nok0735.emea.nsn-net.net; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(36840700001)(46966006)(4326008)(83380400001)(1076003)(36860700001)(86362001)(2616005)(47076005)(54906003)(356005)(81166007)(82310400003)(82740400003)(186003)(70586007)(26005)(5660300002)(8676002)(316002)(70206006)(6666004)(478600001)(8936002)(336012)(6916009)(2906002)(36756003)(26583001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 21:18:53.1978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e665b0a-8223-4e2d-1ad2-08d8d389a0b3
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.17];
 Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7430
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_161858_378809_885CB64D 
X-CRM114-Status: GOOD (  14.33  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

Get rid of central chrdev MTD lock, which prevents simultaneous operations
on completely independent physical MTD chips. Replace it with newly
introduced per-master mutex.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/mtdchar.c   | 14 ++++++++------
 drivers/mtd/mtdcore.c   |  1 +
 include/linux/mtd/mtd.h |  1 +
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index f31390d..57c4a2f 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -27,8 +27,6 @@
 
 #include "mtdcore.h"
 
-static DEFINE_MUTEX(mtd_mutex);
-
 /*
  * Data structure to hold the pointer to the mtd device as well
  * as mode information of various use cases.
@@ -1020,11 +1018,14 @@ static int mtdchar_ioctl(struct file *file, u_int cmd, u_long arg)
 
 static long mtdchar_unlocked_ioctl(struct file *file, u_int cmd, u_long arg)
 {
+	struct mtd_file_info *mfi = file->private_data;
+	struct mtd_info *mtd = mfi->mtd;
+	struct mtd_info *master = mtd_get_master(mtd);
 	int ret;
 
-	mutex_lock(&mtd_mutex);
+	mutex_lock(&master->master.chrdev_lock);
 	ret = mtdchar_ioctl(file, cmd, arg);
-	mutex_unlock(&mtd_mutex);
+	mutex_unlock(&master->master.chrdev_lock);
 
 	return ret;
 }
@@ -1045,10 +1046,11 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 {
 	struct mtd_file_info *mfi = file->private_data;
 	struct mtd_info *mtd = mfi->mtd;
+	struct mtd_info *master = mtd_get_master(mtd);
 	void __user *argp = compat_ptr(arg);
 	int ret = 0;
 
-	mutex_lock(&mtd_mutex);
+	mutex_lock(&master->master.chrdev_lock);
 
 	switch (cmd) {
 	case MEMWRITEOOB32:
@@ -1111,7 +1113,7 @@ static long mtdchar_compat_ioctl(struct file *file, unsigned int cmd,
 		ret = mtdchar_ioctl(file, cmd, (unsigned long)argp);
 	}
 
-	mutex_unlock(&mtd_mutex);
+	mutex_unlock(&master->master.chrdev_lock);
 
 	return ret;
 }
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d..0b09597 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -773,6 +773,7 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 
 	INIT_LIST_HEAD(&mtd->partitions);
 	mutex_init(&mtd->master.partitions_lock);
+	mutex_init(&mtd->master.chrdev_lock);
 }
 
 /**
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 157357e..ceabc2c 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -229,6 +229,7 @@ struct mtd_part {
  */
 struct mtd_master {
 	struct mutex partitions_lock;
+	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
 };
 
-- 
2.10.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
