Return-Path: <SRS0=CH9v=D5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC5E1C388F9
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2020 15:46:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45FD82463D
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2020 15:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tMsbNto5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=infinera.com header.i=@infinera.com header.b="f5DX8eY+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45FD82463D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=infinera.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4cVS/NFaCiy3SURKCu8PV8IXZcFwAjtxDkAT2MJ09wA=; b=tMsbNto5vDTYHSRSAD/i16t1lO
	j2S6mXYvkuo5mmbQvgJOD+sqnCQNPrfHjlOp8FG31593DNA9vkK6qomQkCPbiOnqSoaOWa1GYV2ZN
	AzN50+pCmrPJfKHEro9tqSGlEDjjzHWgvHfrg45D/yPN3kT/PjvEWtNkPNgbdnLmsMd04CywABwlr
	EdLhLS9RUoIB0Oza8PJYAMZUy1GnCHny/sv8Ta5xCNlxAu83RiaD9df9Xds4wMR82xCG6bwb19Izb
	B7lTMBPHJDG0fIK9t0H9e6nXlYq0XUoWWEchXO1vr4bctX2HUJtfNbMzpwx0bKrSf+OKV/3rgYek+
	qngwm+uw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVcmF-0000Z0-6Y; Thu, 22 Oct 2020 15:45:19 +0000
Received: from mail-co1nam11on2059.outbound.protection.outlook.com
 ([40.107.220.59] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVcmC-0000YH-IZ
 for linux-mtd@lists.infradead.org; Thu, 22 Oct 2020 15:45:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtfhX6QreMeq59pr4mzxaCnwTC4yXgkOj4Pn1aOXOvyzOk4M7Pnr+AQxHwfW9oGs4Ez+Nh2em+wmlj6YalgulS4X0SiRYlnGr8BQMjuOEBbspGng9v4VpPnajAaoVvaN8itPTynAvaHI2sh9WpRVj1VLyuznRuLDgCeh0gG2Y462Gt/vxkOSrX2pYN4Yl3yCekHdGoWnwgNzPtY7xFh1gGbeo7wM/vUAXBYAnDqlHD+PV4ZL4KrN5cHh9NReKY2rYVbLp4kkNBV61tI5yNX3FNZwsrIdoFiC8shJAKckt8h9MqnQBeKV1U2fXzUiA1nFdGnBJuYfaUismDDAmi/3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4QTmTFzjEU4Nrqgyh5ZO5DzF8pqrqakuJWgt6o/tpM=;
 b=mehKvOp0u2Bq5PqCmHzQ+l1m44hF7FN2lEOKQ3EkjQ9BtpEnhcPjdd3IydLK9Jvg2TazQFvQ1u+nsfv5bqBhHM10xtC3qfQ7waLILP8lqBr8/0+P1e2moL8c54RD7KnwwkVpXNSUMK1Dz37JYHO6ci3xWW5/+vYPC5xMbefG0LsB2HS0PP2RKEU4w2v0dRhNcKxQCqKRqhMBjAXnwRWOMTeFuyQvyB5f9bjOX8yn4ZF+W+/BD+znLvKFtrqT5hIL4GrJ4saVN/KwGgnXQsbhSgYiXOtmR9aGp1ovi2xKPfASjDrnJeCZEG/KIehjCF70rckwXVO6BV6yIAatQiH9/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.4.225.191) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=infinera.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=infinera.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4QTmTFzjEU4Nrqgyh5ZO5DzF8pqrqakuJWgt6o/tpM=;
 b=f5DX8eY+KMn1oDJvL+zf07j53wWIjmb8j+3wHT/pM9fiZhyct8uTUFrNYM7fJKCyUlukXTsv28eysbQ7NG18d4dmxW8t9AaAuIag3Xi03iUixY8yWZsjLN8YbZax9luBrlkXg2w2hzSgW92IhaFcBeSvWaCpTfF+JX2EUlSmUWU=
Received: from DM5PR21CA0011.namprd21.prod.outlook.com (2603:10b6:3:ac::21) by
 MWHPR10MB1519.namprd10.prod.outlook.com (2603:10b6:300:28::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.25; Thu, 22 Oct 2020 15:45:12 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ac:cafe::50) by DM5PR21CA0011.outlook.office365.com
 (2603:10b6:3:ac::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.4 via Frontend
 Transport; Thu, 22 Oct 2020 15:45:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.4.225.191)
 smtp.mailfrom=infinera.com; lists.infradead.org; dkim=none (message not
 signed) header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=infinera.com;
Received-SPF: Pass (protection.outlook.com: domain of infinera.com designates
 8.4.225.191 as permitted sender) receiver=protection.outlook.com; 
 client-ip=8.4.225.191; helo=owa.infinera.com;
Received: from owa.infinera.com (8.4.225.191) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 15:45:11 +0000
Received: from sv-ex16-prd.infinera.com (10.100.96.229) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Thu, 22 Oct 2020 08:45:09 -0700
Received: from sv-smtp-prod2.infinera.com (10.100.98.82) by
 sv-ex16-prd.infinera.com (10.100.96.229) with Microsoft SMTP Server id
 15.1.1847.3 via Frontend Transport; Thu, 22 Oct 2020 08:45:09 -0700
Received: from se-metroit-prd1.infinera.com ([10.210.32.58]) by
 sv-smtp-prod2.infinera.com with Microsoft SMTPSVC(7.5.7601.17514); 
 Thu, 22 Oct 2020 08:45:09 -0700
Received: from gentoo-jocke.infinera.com (gentoo-jocke.infinera.com
 [10.210.71.2])
 by se-metroit-prd1.infinera.com (Postfix) with ESMTP id B71D12C03206;
 Thu, 22 Oct 2020 17:45:08 +0200 (CEST)
Received: by gentoo-jocke.infinera.com (Postfix, from userid 1001)
 id B11401328F; Thu, 22 Oct 2020 17:45:08 +0200 (CEST)
From: Joakim Tjernlund <joakim.tjernlund@infinera.com>
To: "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: cfi_cmdset_0002: Use status register where possible
Date: Thu, 22 Oct 2020 17:45:06 +0200
Message-ID: <20201022154506.17639-1-joakim.tjernlund@infinera.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Oct 2020 15:45:09.0552 (UTC)
 FILETIME=[52682B00:01D6A88A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25f82789-c041-4241-b3da-08d876a1762b
X-MS-TrafficTypeDiagnostic: MWHPR10MB1519:
X-Microsoft-Antispam-PRVS: <MWHPR10MB15199AAE2F89964AB315CA9FF41D0@MWHPR10MB1519.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4iakF6xaSBFSf86iRzRrltaEXpXVLn6OEkhaE2MPQ2rsu5SBwhHoBk7eZVISUdlXnK8Rx+EbvWiv4ubbNraufvqZcP/Ha/9f9nLPnykVDeYSv43zD9hcZZ5SEPe94J/kGyJcmTjVqWL7BhLhSRbuBjaCG3DkxGbZKbNUIFUBgiT8zMQ+u/UpB6agtOXllgJ2SNtUtxlntcaGlh5lzgTfZIQOpA7nzqXjlMIRtWbn5seubfL+pyzJdYC9ol5Sng6vM4pcgR6x6L58B6W/r6EMqg17uDYxnAXDSWmpLxmsMsDgfRMUCNvpwW+CdbV1oh+J9VAywQOwdXmKQHS0oGQB/0ETpM49dwuAc/cNxrZ84MV+wNqM1mGZD1jgAiCbh4yvHHaAKypo5fMETSLPtoRqAQ==
X-Forefront-Antispam-Report: CIP:8.4.225.191; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:owa.infinera.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966005)(6916009)(36756003)(82310400003)(47076004)(5660300002)(70586007)(70206006)(81166007)(1076003)(82740400003)(83380400001)(42186006)(478600001)(86362001)(2906002)(356005)(8676002)(54906003)(8936002)(44832011)(336012)(426003)(316002)(186003)(4326008)(2616005)(6266002)(26005)(107886003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 15:45:11.6123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f82789-c041-4241-b3da-08d876a1762b
X-MS-Exchange-CrossTenant-Id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=285643de-5f5b-4b03-a153-0ae2dc8aaf77; Ip=[8.4.225.191];
 Helo=[owa.infinera.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_114516_643376_6B3D91AB 
X-CRM114-Status: GOOD (  18.20  )
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
Cc: Joakim Tjernlund <joakim.tjernlund@infinera.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Commit "mtd: cfi_cmdset_0002: Add support for polling status register"
added support for polling the status rather than using DQ polling.
However, status register is used only when DQ polling is missing.
Lets use status register when available as it is superior to DQ polling.

Signed-off-by: Joakim Tjernlund <joakim.tjernlund@infinera.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/chips/cfi_cmdset_0002.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a1f3e1031c3d..ee9b322e63bb 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -117,7 +117,7 @@ static struct mtd_chip_driver cfi_amdstd_chipdrv = {
 static int cfi_use_status_reg(struct cfi_private *cfi)
 {
 	struct cfi_pri_amdstd *extp = cfi->cmdset_priv;
-	u8 poll_mask = CFI_POLL_STATUS_REG | CFI_POLL_DQ;
+	u8 poll_mask = CFI_POLL_STATUS_REG;
 
 	return extp->MinorVersion >= '5' &&
 		(extp->SoftwareFeatures & poll_mask) == CFI_POLL_STATUS_REG;
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
