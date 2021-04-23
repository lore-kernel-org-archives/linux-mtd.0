Return-Path: <SRS0=ovMs=JU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6DFC433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 15:08:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B4961463
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Apr 2021 15:08:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B4961463
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A/xKrVXwmBJqO7XVIPcmOSlImB4PivEAplz3zM73zAw=; b=WhpmE2FQWHMAEmO2TmMUDqrvz
	9u42vxnvCPv3mpW4QxKc+dgx9gTk6J9uO1lUpz2GuD/Lw5Syswi4W3ug1ACDGUy5SU5JllEYrPO8c
	JwHyDeUcnS9kaPbQI7Irzz4ruO18Li4eNAgS8fhCNuskrQqybssXu54S+lLUQBm2hrjtIPHxCcvKp
	1DfGfsw/6vga47pAVuGhn13xgXtaKNKHtzVGbhO3cVG9rRTYVcKc4vikN7Gv5HbJ3HH8uKT0CVGQb
	Im/dpBJIS0A/sUCSZlUFPqkC++3nKCObeUSzOpw/pXaLQJsyWibWpE+etf4MicGjiqKm83ULB0AO7
	/nCvoi19g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZxPE-001jSw-6U; Fri, 23 Apr 2021 15:07:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZxOx-001jSA-NF
 for linux-mtd@desiato.infradead.org; Fri, 23 Apr 2021 15:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:Content-Type:References:
 In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AvMEVum1Ol1MiGzvC7mSMYqxqqYnq9SrXSo6O0fbFLQ=; b=NlAuzrUzkOun2NddsME9jBmUKj
 WiJY9QVGHxCRKzmezpLJjccmzXRC1J7gEq8fr6rTx1batZZbA+73CGuk0gY5+Keeyf6SA9H/eMj90
 PF4oW8+eCZsF7NE+DXG2rWLIZByUyN9GekWsPs/rMEPY2Fq+H1K8vn6MUTzY01KIVuimJk0hL1lmS
 uiuIdvR2kSje0fFnFoD9Q0PvG3svSS2I21euuiSg9xJ8yTTKke+YnhqjJ8R+RGQ+I7sxGWYaNVIug
 deTwEOdcqJ4iHL/9wYiqxjpM+lozUSoqC/8Vq84r712LlyF1CGA/ICYpYKypZCMCE4KEauEumjQDU
 9TUXA2tw==;
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com
 ([40.107.21.67] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZxOu-00EV4V-O4
 for linux-mtd@lists.infradead.org; Fri, 23 Apr 2021 15:07:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZd9C81nvdCln5D+XHsNwp/npWlUHO/fmZbeWIQwPaItFl6ydE/7WpecFaVCq4Qv3BHbk9uUbj3SAEkma2L/2CDdZBwlg6TJk49SG8oOWCMkXiyASTZywLK5m9xUQRM/PV1OBVWcftc29rvKJ6JVYFP9PdmDvvdtwhjGPY/SYTAIIIc1mIl/5T8U7ddjAxHxQ1oa0QaAY+x3eTtJ0C9vgYf2cefTT+OaIQPjoKMYeclLktWDAlIuD9fObgh9bAMn2uvhlM001eBP4YS0qLlmQ4BZt8wMHjF4g7JwnwYzeVkQ8TcZXMZK3I+V+Pti7FPy54+wUVmm3TQgwaPcW/sogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvMEVum1Ol1MiGzvC7mSMYqxqqYnq9SrXSo6O0fbFLQ=;
 b=BFfOIGYMfbSro1uhsMdAQJIqMU3ymWNEl46Bsmf5cc7FwdOGdtDp+JRBQ+X1cq9Yw5Y/B+KqbjWmeTBX/qUS+VyUzJvvRdEnExP4ypOszKRhsqLaIumN1XhV86AKy0i84PwyDjjDNmkQxVNaoZBpVtla5oojlIefSZgQFNpP30M+81aOVGhcIO+qF+xkwHuM+4OqlODGwlVshL/dwwrcjzEx29jZwA5Ev5N0s7hsEms5uKdJDtYaews4UJGE7yOSh4KH8QeiXKrukDdTJDISeA4GmCfRHxMnhqG8+CKyaPOYlk13e+o3LWdl3uj02YAem8/mbVZUGzkUYfgC5EU4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvMEVum1Ol1MiGzvC7mSMYqxqqYnq9SrXSo6O0fbFLQ=;
 b=lQTxJFq/U4DlLse8nD4T9q02kSdsudvoTAnwYTVjDDBs38ldJN3c0vxBqJ4FcmR9HpYsT1FnLGCn/PdfVBj/7CtjtCzNMbhjhTmsBEstm/lQeUqJWis9k7RlEhX/GRKsLlqugRt8UypkR38xSHTIspLIGkvTK9zznlLqEqf4HpE=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR0402MB3343.eurprd04.prod.outlook.com (2603:10a6:803:8::28)
 by VI1PR04MB5615.eurprd04.prod.outlook.com (2603:10a6:803:e9::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 23 Apr
 2021 15:07:17 +0000
Received: from VI1PR0402MB3343.eurprd04.prod.outlook.com
 ([fe80::59c3:e8af:1482:ad35]) by VI1PR0402MB3343.eurprd04.prod.outlook.com
 ([fe80::59c3:e8af:1482:ad35%3]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 15:07:17 +0000
From: Larisa Ileana Grigore <larisa.grigore@nxp.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/1] mtd-utils: flash_erase: Add flash erase chip
Date: Fri, 23 Apr 2021 18:07:04 +0300
Message-Id: <20210423150704.7248-2-larisa.grigore@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423150704.7248-1-larisa.grigore@nxp.com>
References: <20210423150704.7248-1-larisa.grigore@nxp.com>
X-Originating-IP: [83.217.231.2]
X-ClientProxiedBy: AM3PR07CA0086.eurprd07.prod.outlook.com
 (2603:10a6:207:6::20) To VI1PR0402MB3343.eurprd04.prod.outlook.com
 (2603:10a6:803:8::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1864-143.ea.freescale.net (83.217.231.2) by
 AM3PR07CA0086.eurprd07.prod.outlook.com (2603:10a6:207:6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.17 via Frontend Transport; Fri, 23 Apr 2021 15:07:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55297875-f4e6-46e6-701a-08d906697c34
X-MS-TrafficTypeDiagnostic: VI1PR04MB5615:
X-Microsoft-Antispam-PRVS: <VI1PR04MB5615BB4D540FEB96984CE9449A459@VI1PR04MB5615.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f//bwPpgyzLSqwgXP+8l2MWNCZ0UjvMXOaFuvKMHOEDkHdAPTB47xC/gO5xgpMyQtpTtC+Pg8hz7mOvQbuze0kgww4tcg/zSe9WlX/6RPD9QXwaA2J9TGU2kS97ejPSBwTtFew57BTwjH92K5dsSCDRRT5oFjDtlSOENjfiJC94LXLV1n87BtsUaB2JF/M9DgDwIg6UAsjGk/MjhreERgVkR+6wjLIiEX74s9HMPZ+RiM2+38zde2zqMApARjitV7E0C6qKOKQdeiRKErGk/8ND4eooLprh6Wr75s9/8DhR+BYKRZbOGG+zEcRMqvglHKbad+LE/lYj6VAvu3GCqFvVvAKxkb+C9MiAdKa4OOOlllFag0oNOhPKbuC4db5BGbKpwEQQuT41t/cLVDK76leYQSYxDXUnpyBSQfGQnIkQcDnUUAef3wj3V43DCvL3VaYo12skOE6y7iwoiMoQ8NQg8/ae85XZHavDlCSKXqZIvvIdOTqAtWGRsWWaSJ74p8UIoLpAhClGvCkHdaI2F7nhm+5ZhPupkgO0Bc6UfcU3Un9HqkxaFxvGLw+UVZPa4r+VEs4RFS4+wHW2N2Gcoyu/TAmXWqzxttuU1TEmoDm2JYYeL3fDoelUsDLgEAGYBaLtQXkQnTvOzz40c0pwxEJ3+5PBRblwZWUM6nETggrY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3343.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(39850400004)(376002)(396003)(186003)(5660300002)(6916009)(8676002)(6666004)(86362001)(316002)(2906002)(1076003)(83380400001)(52116002)(8936002)(66476007)(478600001)(2616005)(6512007)(6486002)(66946007)(956004)(36756003)(38100700002)(16526019)(26005)(66556008)(38350700002)(6506007)(2004002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?b9qj6+v1WFp7aVrpbsebP5ChDNxTtIy7pa9zbG/SKtIhgfs+izw39+InDWmo?=
 =?us-ascii?Q?p5ZuUgRLm/sKS6fNo56KN+qQMBm92f9fIVXxUdmnk7UXhV7aDcutGqkGGng3?=
 =?us-ascii?Q?EHUdkdGPUT4QOxngCxIqBoLYm20xJsz7phUPY7pYxoeSrQ6kVGj2mUSzLyNM?=
 =?us-ascii?Q?DOCU8GPu1RzAj97XKi/0mLY0vS/8dziaPQPl6e5utHSyBAyDn6XN9CmZbxt9?=
 =?us-ascii?Q?Y9mpLqRDuFQxIGAuvnFPrxYolM9sK4xwwaFcbiR7C05eIFlrrhALwvJRtHj1?=
 =?us-ascii?Q?bvWTeOstlnebXasaZ2dTvOrKhTwSerCacIOXyiJkSD/rnQ1FwnsA3n0BFijk?=
 =?us-ascii?Q?cFf7IUAjXsWM7PRMUvTfCsDtYKX+ztM8b4Jl0x/8aJx7q/bO88EysAkoigzC?=
 =?us-ascii?Q?eD4bJvAB8Anzu5RaueSmuCXMztba+TJiQ9nkXTE+MMVdyCXftDnGdfVmRphs?=
 =?us-ascii?Q?8op8pMLKGhCrVhQki0QP6T4uW+4JYAqhMOjbLHGNiSR8FcfeYIX3NbKP1dbi?=
 =?us-ascii?Q?iCGNdaaFCTjcEAgw3qXEzTpl8/aLXPglG+D/0eE6tAYSj407lrjfSlRanRKo?=
 =?us-ascii?Q?YhfXkZx6jwS0iSuUTo/SrPIz2+nrE10IyFukuXjQOs9bhqu1wk7mwgdTzRRc?=
 =?us-ascii?Q?oiCzyj43USwj0HHHqFC2r23QpRVI6kkayGDyqZLv9PNMHlpFMKaJsUW8tEH5?=
 =?us-ascii?Q?kFTcCq27tj/CcUeYW2/ChO5BU4Dr4wBmIkFmY3Ew5JUU07zpTd5aDoNzNqAz?=
 =?us-ascii?Q?TUlpZC7+HlJ1JbElo/xRwyUKl9JDDVNnBCMTKV3LXTnSCTz8B5D7C3PaNTog?=
 =?us-ascii?Q?Q5N0PWFax/9dr5o7hdkXqbraalc+WXU7Nh2mwPifX3rc3NKnWLqLZ32e7j7u?=
 =?us-ascii?Q?gnu2mnLklEzRr0WtdsyDYtTP+oXl2wHCDE2x/ZW635zO6BrY9rUyRUrgczxd?=
 =?us-ascii?Q?V2sul1HTOpJgcRGI9zCC8d//eLT6AgNIS6Kmu8MteI+Fv8IhJJFoxwih+wUk?=
 =?us-ascii?Q?R/RVkVcFjHir3kMPYZ5p9AE+iE8T65nzgIUYVVp4rB7JyhNXIaf/THqbBo+d?=
 =?us-ascii?Q?Okkm0biB7PyDcrU1HLXlyRNh1Kl3UADg1R4g9NJcNK5uA169HkF1dXnCxc7A?=
 =?us-ascii?Q?JdpJqtYIoSaZmy/qQuPNMUzVKQcP3e3hZfkopo5h/kLtOss25I72WUCTlKYy?=
 =?us-ascii?Q?EXONVoVZnWNCG08OPFipqOkd7E0CbdZF+O9QnVWNqGQCd0vnAQtCIAqRNVFG?=
 =?us-ascii?Q?M9dHuEeDtgNIsi1LqWxGivpFKaewZZY0DOj3HUTDi0XNANa1MdHO/7SXVm84?=
 =?us-ascii?Q?8V6qgSaOhJh/FSpNLshUQChP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55297875-f4e6-46e6-701a-08d906697c34
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3343.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 15:07:17.7748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6SNGyi59x4Dit2VmK4rqKtaDj1zCJ6TELJJ8aBJKDTjYGtfkimzXb9CT/WI097rCZcZRcyu2KC0qtF4x1/Rgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_080724_816071_F2845D6F 
X-CRM114-Status: GOOD (  21.39  )
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

Some flash types support full erase chip command which can reduce the
flash erase time. Try first to erase the entire flash and fall back
to the old method if the operation fails.

Signed-off-by: Larisa Ileana Grigore <larisa.grigore@nxp.com>
---
 include/libmtd.h         | 15 +++++++
 lib/libmtd.c             | 26 ++++++++---
 misc-utils/flash_erase.c | 95 ++++++++++++++++++++++++++++++----------
 3 files changed, 106 insertions(+), 30 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index cc24af8..6ab0de5 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -1,5 +1,6 @@
 /*
  * Copyright (C) 2008, 2009 Nokia Corporation
+ * Copyright 2021 NXP
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -174,6 +175,20 @@ int mtd_lock(const struct mtd_dev_info *mtd, int fd, int eb);
  */
 int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb);
 
+/**
+ * mtd_unlock_multi - unlock eraseblocks.
+ * @desc: MTD library descriptor
+ * @mtd: MTD device description object
+ * @fd: MTD device node file descriptor
+ * @eb: index of first eraseblock to unlock
+ * @blocks: the number of eraseblocks to unlock
+ *
+ * This function unlocks @blocks starting at eraseblock @eb.
+ * Returns %0 in case of success and %-1 in case of failure.
+ */
+int mtd_unlock_multi(const struct mtd_dev_info *mtd, int fd, int eb,
+		     int blocks);
+
 /**
  * mtd_erase - erase multiple eraseblocks.
  * @desc: MTD library descriptor
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 9d8d0e8..c1022cf 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1,6 +1,7 @@
 /*
  * Copyright (c) International Business Machines Corp., 2006
  * Copyright (C) 2009 Nokia Corporation
+ * Copyright 2021 NXP
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
@@ -831,8 +832,8 @@ static int mtd_valid_erase_block(const struct mtd_dev_info *mtd, int eb)
 	return 0;
 }
 
-static int mtd_xlock(const struct mtd_dev_info *mtd, int fd, int eb, int req,
-		     const char *sreq)
+static int mtd_xlock(const struct mtd_dev_info *mtd, int fd, int eb,
+		     int blocks, int req, const char *sreq)
 {
 	int ret;
 	struct erase_info_user ei;
@@ -841,8 +842,14 @@ static int mtd_xlock(const struct mtd_dev_info *mtd, int fd, int eb, int req,
 	if (ret)
 		return ret;
 
+	if (blocks > 1) {
+		ret = mtd_valid_erase_block(mtd, eb + blocks - 1);
+		if (ret)
+			return ret;
+	}
+
 	ei.start = eb * mtd->eb_size;
-	ei.length = mtd->eb_size;
+	ei.length = mtd->eb_size * blocks;
 
 	ret = ioctl(fd, req, &ei);
 	if (ret < 0)
@@ -850,16 +857,23 @@ static int mtd_xlock(const struct mtd_dev_info *mtd, int fd, int eb, int req,
 
 	return 0;
 }
-#define mtd_xlock(mtd, fd, eb, req) mtd_xlock(mtd, fd, eb, req, #req)
+#define mtd_xlock(mtd, fd, eb, blocks, req) \
+	mtd_xlock(mtd, fd, eb, blocks, req, #req)
 
 int mtd_lock(const struct mtd_dev_info *mtd, int fd, int eb)
 {
-	return mtd_xlock(mtd, fd, eb, MEMLOCK);
+	return mtd_xlock(mtd, fd, eb, 1, MEMLOCK);
 }
 
 int mtd_unlock(const struct mtd_dev_info *mtd, int fd, int eb)
 {
-	return mtd_xlock(mtd, fd, eb, MEMUNLOCK);
+	return mtd_xlock(mtd, fd, eb, 1, MEMUNLOCK);
+}
+
+int mtd_unlock_multi(const struct mtd_dev_info *mtd, int fd, int eb,
+		     int blocks)
+{
+	return mtd_xlock(mtd, fd, eb, blocks, MEMUNLOCK);
 }
 
 int mtd_erase_multi(libmtd_t desc, const struct mtd_dev_info *mtd,
diff --git a/misc-utils/flash_erase.c b/misc-utils/flash_erase.c
index a7fc6a6..49a880f 100644
--- a/misc-utils/flash_erase.c
+++ b/misc-utils/flash_erase.c
@@ -2,6 +2,7 @@
 
    Copyright (C) 2000 Arcom Control System Ltd
    Copyright (C) 2010 Mike Frysinger <vapier@gentoo.org>
+   Copyright 2021 NXP
 
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
@@ -50,11 +51,10 @@ static int unlock;		/* unlock sectors before erasing */
 static struct jffs2_unknown_node cleanmarker;
 int target_endian = __BYTE_ORDER;
 
-static void show_progress(struct mtd_dev_info *mtd, off_t start, int eb,
-			  int eb_start, int eb_cnt)
+static void show_progress(off_t start, int eb, int eb_start, int eb_cnt, int step)
 {
 	bareverbose(!quiet, "\rErasing %d Kibyte @ %llx -- %2i %% complete ",
-		mtd->eb_size / 1024, (unsigned long long)start, ((eb - eb_start) * 100) / eb_cnt);
+		step / 1024, (unsigned long long)start, ((eb - eb_start) * 100) / eb_cnt);
 	fflush(stdout);
 }
 
@@ -88,6 +88,27 @@ static void display_version (void)
 			PROGRAM_NAME);
 }
 
+static void clear_marker(libmtd_t mtd_desc, struct mtd_dev_info *mtd, int fd,
+			 unsigned int eb, int cmlen, bool isNAND)
+{
+	off_t offset = (off_t)eb * mtd->eb_size;
+
+	/* write cleanmarker */
+	if (isNAND) {
+		if (mtd_write(mtd_desc, mtd, fd, eb, 0, NULL, 0, &cleanmarker, cmlen,
+				MTD_OPS_AUTO_OOB) != 0) {
+			sys_errmsg("%s: MTD writeoob failure", mtd_device);
+			return;
+		}
+	} else {
+		if (pwrite(fd, &cleanmarker, sizeof(cleanmarker), (loff_t)offset) != sizeof(cleanmarker)) {
+			sys_errmsg("%s: MTD write failure", mtd_device);
+			return;
+		}
+	}
+	verbose(!quiet, "%llx : Cleanmarker Updated.", (unsigned long long)offset);
+}
+
 int main(int argc, char *argv[])
 {
 	libmtd_t mtd_desc;
@@ -95,7 +116,7 @@ int main(int argc, char *argv[])
 	int fd, cmlen = 8;
 	unsigned long long start;
 	unsigned int eb, eb_start, eb_cnt;
-	bool isNAND;
+	bool isNAND, erase_chip = false;
 	int error = 0;
 	off_t offset = 0;
 
@@ -205,6 +226,47 @@ int main(int argc, char *argv[])
 	if (eb_cnt == 0)
 		eb_cnt = (mtd.size / mtd.eb_size) - eb_start;
 
+	if (eb_start == 0 && mtd.size == eb_cnt * mtd.eb_size)
+		erase_chip = true;
+
+	/* If MTD device may have bad eraseblocks,
+	 * erase one by one each sector
+	 */
+	if (noskipbad && mtd.bb_allowed)
+		erase_chip = false;
+
+	if (erase_chip) {
+		show_progress(0, eb_start, eb_start, eb_cnt, mtd.size);
+
+		if (unlock) {
+			if (mtd_unlock_multi(&mtd, fd, eb_start, eb_cnt) != 0) {
+				sys_errmsg("%s: MTD unlock entire chip failure." \
+					   "Trying one by one each sector.",
+					    mtd_device);
+				goto erase_each_sector;
+			}
+		}
+
+		if (mtd_erase_multi(mtd_desc, &mtd, fd, eb_start, eb_cnt) != 0) {
+			sys_errmsg("%s: MTD Erase entire chip failure" \
+				    "Trying one by one each sector.",
+				    mtd_device);
+			goto erase_each_sector;
+		}
+
+		show_progress(0, eb_start + eb_cnt, eb_start,
+			      eb_cnt, mtd.size);
+
+		if (!jffs2)
+			goto out;
+
+		/* write cleanmarker */
+		for (eb = eb_start; eb < eb_start + eb_cnt; eb++)
+			clear_marker(mtd_desc, &mtd, fd, eb, cmlen, isNAND);
+		goto out;
+	}
+
+erase_each_sector:
 	for (eb = eb_start; eb < eb_start + eb_cnt; eb++) {
 		offset = (off_t)eb * mtd.eb_size;
 
@@ -223,7 +285,7 @@ int main(int argc, char *argv[])
 			}
 		}
 
-		show_progress(&mtd, offset, eb, eb_start, eb_cnt);
+		show_progress(offset, eb, eb_start, eb_cnt, mtd.eb_size);
 
 		if (unlock) {
 			if (mtd_unlock(&mtd, fd, eb) != 0) {
@@ -237,26 +299,11 @@ int main(int argc, char *argv[])
 			continue;
 		}
 
-		/* format for JFFS2 ? */
-		if (!jffs2)
-			continue;
-
-		/* write cleanmarker */
-		if (isNAND) {
-			if (mtd_write(mtd_desc, &mtd, fd, eb, 0, NULL, 0, &cleanmarker, cmlen,
-					MTD_OPS_AUTO_OOB) != 0) {
-				sys_errmsg("%s: MTD writeoob failure", mtd_device);
-				continue;
-			}
-		} else {
-			if (pwrite(fd, &cleanmarker, sizeof(cleanmarker), (loff_t)offset) != sizeof(cleanmarker)) {
-				sys_errmsg("%s: MTD write failure", mtd_device);
-				continue;
-			}
-		}
-		verbose(!quiet, " Cleanmarker Updated.");
+		if (jffs2)
+			clear_marker(mtd_desc, &mtd, fd, eb, cmlen, isNAND);
 	}
-	show_progress(&mtd, offset, eb, eb_start, eb_cnt);
+	show_progress(offset, eb, eb_start, eb_cnt, mtd.eb_size);
+out:
 	bareverbose(!quiet, "\n");
 
 	return 0;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
