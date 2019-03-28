Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0E2C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 11:16:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B48BD2082F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 11:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fnSzl+Il";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="tEIIagTq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B48BD2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcUMy82BcavNF2XATYWwLiNPsKwXvBmtpmyVkWp+Kis=; b=fnSzl+IlX5DDI7
	DxU1/z9jPRePe95ybmDiVuRfv+4DRJU4kk9JGbkZNT0iLo87yCnwocBW8PYdGonhEs/ksdHVSnRVT
	i0PA/R1yOxMsvfbwY1+D/NGo4yPica1xfYTDm9biOm8GkHOnvZoVNlE1BiSOrkmAafuL5lPa2IIbi
	xeprHkTbGS6uCciEkswXb0PXOFsflVr1agzxAEGMabGJzV8qHmNNp3/L7+yt98u5nc8/J3AU4egBa
	0Qe2rurZEUptULLLsERleExsoYTnkeX/WW8RAN7zkQixC+B5NZVeZS2Xx3FFNVPVq3Sw/v0bb9AeM
	uEDh5RBQ//ObX784gDiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9T1i-0008AH-Jm; Thu, 28 Mar 2019 11:16:54 +0000
Received: from mail-bn3nam01on0626.outbound.protection.outlook.com
 ([2a01:111:f400:fe41::626]
 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9T1d-00089e-DI
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 11:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbIpdAKKJ9lhe1/bn6sE86k8BgyCWXLQeGUakY5si4Q=;
 b=tEIIagTq6ELHeWLzk9DgYet2lPmsfj13UvOYyZoIjFrYrUWJyy93a7JCC+vJVPO/JY7xUxx37rhb8ptPzz2ys5UZ1ioEsBya9jEwq2QSe+XNIrkJgldLsl/F/AZWqzm4WkDvOsk3ZdEh/5esrHYpX5zbY3EgIM/Ll69OntufJCc=
Received: from CY4PR02CA0006.namprd02.prod.outlook.com (10.169.188.16) by
 DM5PR0201MB3397.namprd02.prod.outlook.com (10.167.105.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1730.16; Thu, 28 Mar 2019 11:16:46 +0000
Received: from CY1NAM02FT057.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by CY4PR02CA0006.outlook.office365.com
 (2603:10b6:903:18::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.15 via Frontend
 Transport; Thu, 28 Mar 2019 11:16:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT057.mail.protection.outlook.com (10.152.75.110) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
 via Frontend Transport; Thu, 28 Mar 2019 11:16:45 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1h9T1Y-00025u-Ta; Thu, 28 Mar 2019 04:16:44 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1h9T1T-0000k9-Qb; Thu, 28 Mar 2019 04:16:39 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x2SBGTLI010455; 
 Thu, 28 Mar 2019 04:16:29 -0700
Received: from [172.23.37.108] (helo=xhdnagasure40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1h9T1I-0000iA-LI; Thu, 28 Mar 2019 04:16:29 -0700
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <broonie@kernel.org>, <bbrezillon@kernel.org>
Subject: [LINUX PATCH 2/3] spi: spi-mem: call spi_mem_default_supports_op()
 first
Date: Thu, 28 Mar 2019 16:46:24 +0530
Message-ID: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(39860400002)(346002)(376002)(136003)(396003)(2980300002)(199004)(189003)(6666004)(48376002)(107886003)(5660300002)(186003)(966005)(7416002)(8676002)(50226002)(81166006)(305945005)(81156014)(356004)(9786002)(4326008)(486006)(8936002)(426003)(126002)(476003)(47776003)(478600001)(51416003)(110136005)(106002)(63266004)(106466001)(2906002)(16586007)(2616005)(316002)(36756003)(54906003)(77096007)(26005)(36386004)(336012)(6306002)(7696005)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0201MB3397; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ad90f5f-6f85-4846-6d16-08d6b36edd46
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4709054)(2017052603328)(7153060);
 SRVR:DM5PR0201MB3397; 
X-MS-TrafficTypeDiagnostic: DM5PR0201MB3397:
X-MS-Exchange-PUrlCount: 1
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR0201MB339774C54A7D6E40CCF909E0AF590@DM5PR0201MB3397.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0990C54589
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: R8CtErkogfDK+NZWr5u0Yfm837t0XdoVaQJDRCrsNUpKPgIX4ndjkI6pOEjvVJ6gAHJxESPl55raL+52caNQ3YnKAeJ57fppQWtjp+cKlzpfMHWKpX4wc4CcMtEtuYb5ziM/FDpc7mYewUKzEbRHhzl4750tgX3KWY00RPk4MrOCJxsPnuuzse1ldjUDOZTXDLxR9Ha7uLj7eQk/EbSJjI98wpRHfZ9jSw28HKQszE+wsQfmc+oUZ/YXTtl8f6MeRvdxp7Dz6I9bkkc5RGVBtz7eAJIS8VYYkX7hKFNf9Hp9eYX8uRJDZKedJ4VAWxz0qbw1iCCZnpGGt2LRcm6VJVBZOazEKHvQedb69FEvwpz/ugvMHjvfMTE62LMEwhdxZsUO7MFpXyEfUDGWZ9SwyIS8rPCDJpR7e6NVLOt//zY=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2019 11:16:45.4054 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad90f5f-6f85-4846-6d16-08d6b36edd46
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0201MB3397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_041649_452878_E8A4B4F0 
X-CRM114-Status: UNSURE (   9.16  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, vigneshr@ti.com,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, linux-mtd@lists.infradead.org, nagasuresh12@gmail.com,
 dwmw2@infradead.org, michal.simek@xilinx.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Call spi_mem_default_supports_op() first, before calling controller
specific ctlr->supports_op().
With this, controller drivers can drop checking the buswidths again.

Suggested-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Details can be found at https://lkml.org/lkml/2019/3/1/183
---
 drivers/spi/spi-mem.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 5217a56..56aa158 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -189,11 +189,14 @@ static bool spi_mem_internal_supports_op(struct spi_mem *mem,
 					 const struct spi_mem_op *op)
 {
 	struct spi_controller *ctlr = mem->spi->controller;
+	bool ret;
+
+	ret = spi_mem_default_supports_op(mem, op);
 
 	if (ctlr->mem_ops && ctlr->mem_ops->supports_op)
-		return ctlr->mem_ops->supports_op(mem, op);
+		ret =  ctlr->mem_ops->supports_op(mem, op);
 
-	return spi_mem_default_supports_op(mem, op);
+	return ret;
 }
 
 /**
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
