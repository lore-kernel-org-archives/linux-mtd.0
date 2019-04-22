Return-Path: <SRS0=axHB=SY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA1BC282E1
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2019 07:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EE3B20811
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Apr 2019 07:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uE9QGsK7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Bk+FFBvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EE3B20811
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sjzl3Gugq01J9xumjzd34v41hWAYWmDERPCMMixnSc0=; b=uE9QGsK73HCVTN
	TqSbsaa78bJWbxBND5NW8Tf96WBA2JjgV0I7uFSe5TmokrK3u1kdCDolIuFFdvBgfBuLdELG4z8gZ
	yzEHHwgqK9wfRYI9zfC/wqj7ZCilMcv6ARx/00C0Mxu3uOmC/UixOjAA8ILMDHzKvBpwT9OcKyqhJ
	a+0ipxEnyM81wv5aFo+Ab7bl8/1/DhaT009RuYjUUrxz7iIcT9AX+ss4l/wY3IXQ4ehb2LHCQy/LS
	C2+9fEg4li1yFVAsTw44OT0LP8VVh9qn5w+SvG6WU4EKHydYhwt1qF2lp3ve+sEDcgUXQR/DplkgS
	+u0qTdtq/VAJDevPwUiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hITMA-0003sK-TI; Mon, 22 Apr 2019 07:27:14 +0000
Received: from mail-co1nam03on061e.outbound.protection.outlook.com
 ([2a01:111:f400:fe48::61e]
 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hITM5-0003re-M2
 for linux-mtd@lists.infradead.org; Mon, 22 Apr 2019 07:27:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7E89gd2jcx6AKRt8PZJwv1TegRYua2XgT35zjY//dc=;
 b=Bk+FFBvigLRFGYm2hwpOds/ZQ+RwdfUFASkHgN9IuTejzqieZJCS7ryYzXw2us9PkWu1yFk91z0KaYd37v2zn8WdOdqo7CvPy7c+b3FvNDQYnQzIfYdfLyWigXavlzDkPHTFAsKm625qzkwfChjFvATSCS68PxIE+e7w1tEBwpY=
Received: from MWHPR02CA0014.namprd02.prod.outlook.com (2603:10b6:300:4b::24)
 by BN6PR02MB2676.namprd02.prod.outlook.com (2603:10b6:404:fa::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1792.19; Mon, 22 Apr
 2019 07:27:04 +0000
Received: from SN1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by MWHPR02CA0014.outlook.office365.com
 (2603:10b6:300:4b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1813.12 via Frontend
 Transport; Mon, 22 Apr 2019 07:27:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT025.mail.protection.outlook.com (10.152.72.87) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1771.16
 via Frontend Transport; Mon, 22 Apr 2019 07:27:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hITLz-0007TJ-9o; Mon, 22 Apr 2019 00:27:03 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hITLu-0003El-6S; Mon, 22 Apr 2019 00:26:58 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x3M7QsDI011234; 
 Mon, 22 Apr 2019 00:26:55 -0700
Received: from [172.23.37.108] (helo=xhdnagasure40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hITLq-0003EY-Bf; Mon, 22 Apr 2019 00:26:54 -0700
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <broonie@kernel.org>, <bbrezillon@kernel.org>
Subject: [LINUX PATCH] spi: spi-mem: zynq-qspi: Fix build error on
 architectures missing readsl/writesl
Date: Mon, 22 Apr 2019 12:56:49 +0530
Message-ID: <1555918009-13172-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(346002)(136003)(396003)(2980300002)(199004)(189003)(2906002)(305945005)(16586007)(478600001)(51416003)(7696005)(63266004)(26005)(81166006)(48376002)(8676002)(36386004)(50226002)(186003)(81156014)(316002)(106002)(8936002)(77096007)(54906003)(110136005)(486006)(47776003)(36756003)(336012)(9786002)(5660300002)(70586007)(2616005)(70206006)(126002)(426003)(356004)(6666004)(476003)(4326008)(7416002)(107886003)(50466002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB2676; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e63173c-c3f0-49fb-ec19-08d6c6f3eb0c
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4709054)(2017052603328);
 SRVR:BN6PR02MB2676; 
X-MS-TrafficTypeDiagnostic: BN6PR02MB2676:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN6PR02MB26769A1768BF8DE7A4601479AF220@BN6PR02MB2676.namprd02.prod.outlook.com>
X-Forefront-PRVS: 00159D1518
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: BRtKSPNEBFCrG1BIF+iu5BSLWtB6AE6+dQYsw8xNBYKS3llLYjbyIN251paUhBedNJtUNX79zQcBcRVfUXUqWfBEGzeKS0lCAmikF8WmRvk3tQmcObilRMRKYjMnDDtfl1owWG50rYq8H4hun1wP5TulSFz/2X+Xnd3uobJ1WWgNwhLQmOWYdW8VBVR9WWd4Op6NECyM7e0NS4U0krdTqzzMMPeCdrXw7/suWM7kFjVNwtXytnIbWE5e8TxkuFvYsBgedFzYvpwp/ktgZg/t4+Gf85ceYGZ+NMX0D2RJcRNewDc/p48iF/wLBaZHKDYn3hZclqkoaJfOURt5Y28XJ16Pwbxd+86lQfy5aRao42crIewh67ynf4o/ZsgWbUudwk7+quvZZ58FgVcr6MsLrBHajF8UKAnZwot7I3AnTxI=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2019 07:27:03.8736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e63173c-c3f0-49fb-ec19-08d6c6f3eb0c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190422_002709_720842_D7398CAE 
X-CRM114-Status: UNSURE (   8.98  )
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
 michals@xilinx.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Alpha and some of the architectures are missing readsl/writesl functions.
so the zynq-qspi driver won't be able to build on these arches. hence use
ioread32_rep()/iowrite32_rep() instead of readsl()/writesl().

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Reported-by: kbuild test robot <lkp@intel.com>
---
Verified the same by cross compiling the zynq-qspi driver for alpha
architecture
ARCH=alpha CROSS_COMPILE=alpha-linux-gnu- make all

Reference took from the below commit
0cf1725 mtd: spi-nor: cqspi: Fix build on arches missing readsl/writesl
---
 drivers/spi/spi-zynq-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index 8079d00..c6bee67 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -407,8 +407,8 @@ static void zynq_qspi_write_op(struct zynq_qspi *xqspi, int txcount,
 		count = txcount;
 
 	if (xqspi->txbuf) {
-		writesl(xqspi->regs + ZYNQ_QSPI_TXD_00_00_OFFSET,
-			xqspi->txbuf, count);
+		iowrite32_rep(xqspi->regs + ZYNQ_QSPI_TXD_00_00_OFFSET,
+			      xqspi->txbuf, count);
 		xqspi->txbuf += count * 4;
 	} else {
 		for (k = 0; k < count; k++)
@@ -433,8 +433,8 @@ static void zynq_qspi_read_op(struct zynq_qspi *xqspi, int rxcount)
 	if (count > rxcount)
 		count = rxcount;
 	if (xqspi->rxbuf) {
-		readsl(xqspi->regs + ZYNQ_QSPI_RXD_OFFSET,
-		       xqspi->rxbuf, count);
+		ioread32_rep(xqspi->regs + ZYNQ_QSPI_RXD_OFFSET,
+			     xqspi->rxbuf, count);
 		xqspi->rxbuf += count * 4;
 	} else {
 		for (k = 0; k < count; k++)
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
