Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBDCC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 07:59:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AA76213A2
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 07:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OAjYtl6k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="OhVjpsu5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AA76213A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XvoshEStwUazAnqg5OKsZWL9wqhImWuts3voMmZ4r9E=; b=OAjYtl6kE+t7tC
	NolP2rFmzsG+/y5vuln6Za/GmIBiA+BrtZqYZKXVvg1n3Abb7RrGtR19Ut1JxYsev43NI3hjymSNw
	jTsz9iOsWl5qH0/glhwgXg/g3nqUmvjLXxnMNNAvHhkt0Hykm4AsbfjvFmTJ8rKybs/4n6p9P19cM
	U24MUGcr/sHlm5nQZ81Bgjil/4+QAnUEkJLsVlkZkYCOwSe2fLR52TL7mzkg1nWKDmxQbJO2mpAX6
	Sqo238Ik1Cx20UiZo31IoxyRQGorHgpGMFE3MmPp52/yvKgVc2zgvQo+SdwcAnxw+FB6HUtV3E0cB
	hbUa6LF7zgGzyUgzLrXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hArqt-0002Us-FE; Mon, 01 Apr 2019 07:59:31 +0000
Received: from mail-eopbgr800081.outbound.protection.outlook.com
 ([40.107.80.81] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hArqq-0002UZ-SW
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 07:59:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sKACOfY8dtEd5gYvF5/OByWHY3xl4BHiWXQIuM//Dc=;
 b=OhVjpsu5/bm+qO7U+0RVTybEchc2pACZXIyxWM8a3JaJfman95dfDGqhWnPh3SzwoO13N61IdG8fQV/pPxpiUJs2AWSpOWW4m+p2SokXUxbqhtfIYKuODmLaXMLFI+STwFhUQc6+ezaDIR0mRcTgDyTl0w0PdCQYyu/h/lJz3pg=
Received: from DM6PR02CA0002.namprd02.prod.outlook.com (2603:10b6:5:1c::15) by
 BLUPR02MB1651.namprd02.prod.outlook.com (2a01:111:e400:525f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.15; Mon, 1 Apr
 2019 07:59:25 +0000
Received: from BL2NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::202) by DM6PR02CA0002.outlook.office365.com
 (2603:10b6:5:1c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.15 via Frontend
 Transport; Mon, 1 Apr 2019 07:59:25 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 BL2NAM02FT018.mail.protection.outlook.com (10.152.77.170) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
 via Frontend Transport; Mon, 1 Apr 2019 07:59:24 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50740
 helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hArqm-0007nQ-2n; Mon, 01 Apr 2019 00:59:24 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hArqg-0003JE-Vf; Mon, 01 Apr 2019 00:59:19 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x317x7mv012516; 
 Mon, 1 Apr 2019 00:59:07 -0700
Received: from [172.23.37.108] (helo=xhdnagasure40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hArqU-00038d-Sl; Mon, 01 Apr 2019 00:59:07 -0700
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <broonie@kernel.org>, <bbrezillon@kernel.org>
Subject: [LINUX PATCH v2 2/3] spi: spi-mem: export
 spi_mem_default_supports_op()
Date: Mon, 1 Apr 2019 13:29:00 +0530
Message-ID: <1554105540-19704-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(136003)(376002)(346002)(2980300002)(189003)(199004)(47776003)(8676002)(36756003)(9786002)(110136005)(478600001)(54906003)(16586007)(106002)(2616005)(426003)(63266004)(77096007)(7416002)(126002)(476003)(336012)(186003)(26005)(305945005)(51416003)(81156014)(107886003)(316002)(486006)(106466001)(36386004)(7696005)(48376002)(50466002)(6666004)(5660300002)(50226002)(81166006)(356004)(2906002)(8936002)(4326008)(5001870100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB1651; H:xsj-pvapsmtpgw02; FPR:;
 SPF:Pass; LANG:en; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80de0dd4-9488-44be-5225-08d6b677f512
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
 SRVR:BLUPR02MB1651; 
X-MS-TrafficTypeDiagnostic: BLUPR02MB1651:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BLUPR02MB165137BCF47A54621FD4C2E8AF550@BLUPR02MB1651.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0994F5E0C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: uMnm9XQEptlLlVYxFbI2Fwx5v1xOGz6h55M0Czg+/6gvoaEuXZ0gBkS8Fh8voHf9GjRaVSagLQ7dgrAzNZHuvtl1qpZw2h0eGPHVTD47oolrAXSHbvO2pkkTm1AHnIRNyrsp5k7ZRWijs2kayKyCTzjlSm/JUC1Tx2Rovb0bbKoO3r9qBpssTgOv2So0aqpyC3CkW3OVg3WgLMkniXHpaEi/vEcpeFudmMsijp3UHRXJQjp9Ci3whAOUznI9CZHdW+my9KDdQhGtrmgKMaZFU/enEgFFUbJxVR6rqcSaVSsSVupuKhR3W7rCp38Q5x7IVnfkkY2PrhuV9FmXsH8AjkkQz76XDqMNv70S1W4o4t3DrWV1Y3LkC5VZ7sJQyA80sXbjw4NRxwKgNU+y9D8/4vPJzlZE092e1upt7HI69m8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2019 07:59:24.6754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80de0dd4-9488-44be-5225-08d6b677f512
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.100];
 Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB1651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_005928_922918_68CB7BEC 
X-CRM114-Status: UNSURE (   9.02  )
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

Export spi_mem_default_supports_op(), so that controller drivers
can use this.
spi-mem driver already exports this using EXPORT_SYMBOL,
but not declared it in spi-mem.h.
This patch declares spi_mem_default_supports_op() in spi-mem.h and
also removes the static from the function prototype.

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Changes in v2
 - Export spi_mem_default_supports_op(), so that controller drivers
   can use it
 - Removed the code, which modifies calling spi_mem_default_supports_op()
   before calling ctrl->supports_op()
Changes in v1
 - None
---
 drivers/spi/spi-mem.c       | 4 ++--
 include/linux/spi/spi-mem.h | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 5217a56..10ebf20 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -135,8 +135,8 @@ static int spi_check_buswidth_req(struct spi_mem *mem, u8 buswidth, bool tx)
 	return -ENOTSUPP;
 }
 
-static bool spi_mem_default_supports_op(struct spi_mem *mem,
-					const struct spi_mem_op *op)
+bool spi_mem_default_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op)
 {
 	if (spi_check_buswidth_req(mem, op->cmd.buswidth, true))
 		return false;
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 3fe2450..eb71e9d 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -336,6 +336,9 @@ int spi_mem_driver_register_with_owner(struct spi_mem_driver *drv,
 
 void spi_mem_driver_unregister(struct spi_mem_driver *drv);
 
+bool spi_mem_default_supports_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op);
+
 #define spi_mem_driver_register(__drv)                                  \
 	spi_mem_driver_register_with_owner(__drv, THIS_MODULE)
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
