Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88C3C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 07:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E47A20896
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 07:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZdDjRp/3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="UQByvT5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E47A20896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=spccMpkYA5KkFdtgFkrY3NCyQ3BIvW42nW/4ZJriWCM=; b=ZdDjRp/3UUislg
	0inM2iMPo0+7B1WrZrhTEMrFcqX4v194WZ28OR4sU5CJvlOdzrtY/WGY0wW5sD2nI+x9HZtJhNjco
	MBcjYIq9SyxQfzlsboH1uCeXxJ5AJZrpTo7TZrUga4RcsA+tP01+fLixkrQ1beyGSmaCyCF0zidyE
	atFmwlhTEAO4RwonGEBVcnKkirEVY/LJLuzIyfCKRNwaYKbul3/2eWTPT8OcGACHCFmfoi14cqeUO
	q07FgugmQxN1Atm2SMx3UeWUZ1dFo0uDEAS8xqId59m2KhecHsHx3I5Ds9dZDD8wadYVWQLz/MASj
	9PaTujRkC+7OOPVxqLUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hArpu-0001va-As; Mon, 01 Apr 2019 07:58:30 +0000
Received: from mail-eopbgr790074.outbound.protection.outlook.com
 ([40.107.79.74] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hArpl-0001jb-Mh
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 07:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQ06eZN3W1KYJOQ3gv4JxKyHvs2wq+H0I5CDALB3t1c=;
 b=UQByvT5JKPsqHqslezrTgzggcg1LzO1Nk04um8rSAb7Xai1eZ/18dC2yVPgR8kwXKAFc36g0chCYtsClDz0JyRNA9lncR76xwvBVKM+MxM9e/Iswdqa8VtCYgLlLKgQpNcxPtSKleXUpDshBAD74xVWrLfV5BlsIbKFB2OxX/es=
Received: from CY4PR02CA0002.namprd02.prod.outlook.com (2603:10b6:903:18::12)
 by BN7PR02MB5233.namprd02.prod.outlook.com (2603:10b6:408:2a::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.15; Mon, 1 Apr
 2019 07:58:15 +0000
Received: from CY1NAM02FT025.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::208) by CY4PR02CA0002.outlook.office365.com
 (2603:10b6:903:18::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.17 via Frontend
 Transport; Mon, 1 Apr 2019 07:58:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT025.mail.protection.outlook.com (10.152.75.148) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
 via Frontend Transport; Mon, 1 Apr 2019 07:58:14 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hArpd-00069D-LP; Mon, 01 Apr 2019 00:58:13 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hArpY-0002mZ-IJ; Mon, 01 Apr 2019 00:58:08 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x317vxR4011853; 
 Mon, 1 Apr 2019 00:57:59 -0700
Received: from [172.23.37.108] (helo=xhdnagasure40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hArpO-0002jq-Qv; Mon, 01 Apr 2019 00:57:59 -0700
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <broonie@kernel.org>, <bbrezillon@kernel.org>
Subject: [LINUX PATCH v2 0/3] Add support for Zynq QSPI controller driver
Date: Mon, 1 Apr 2019 13:27:53 +0530
Message-ID: <1554105473-17511-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(346002)(396003)(2980300002)(189003)(199004)(26005)(305945005)(47776003)(186003)(336012)(126002)(476003)(107886003)(14444005)(36386004)(478600001)(77096007)(7416002)(8676002)(7696005)(2906002)(81156014)(36756003)(63266004)(6666004)(426003)(2616005)(50226002)(316002)(4326008)(9786002)(106002)(48376002)(16586007)(8936002)(486006)(51416003)(81166006)(5660300002)(50466002)(110136005)(106466001)(54906003)(356004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5233; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12f2e188-0039-4db6-29bd-08d6b677cb41
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
 SRVR:BN7PR02MB5233; 
X-MS-TrafficTypeDiagnostic: BN7PR02MB5233:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN7PR02MB52338389C53DB06DC89F709AAF550@BN7PR02MB5233.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0994F5E0C5
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: a09lMbYTApLKl3SyPMHmx0Q8jl8y+yE1k06Oq/j1HrFj9RuanU0lEuTG1DdRpH0CCSq6WJ1oUR3Y7xGeUtf16N6n7M1wYoefOgM9xaY8FO2+sWr9+MWW+pQTtlZ0EYLGACYiYpUCwiudLg6507fN3FmItX6lsPr1pRWkryvkYr91p8+3FupFtoe0QGXMOLytmCnt3fvOUVKF2V57AkpTfWAXhiEUseSzauxdEJ6Fhpl/k4w2gltC0J2aFjP13jBc2Gr6HSGUt/+MvUhe4H7hu9kjrwVw0xAXKO6YBrmbcJXv/jyS0sSR9Gnb6QQa4+AgTxiTow2CaRvh4VRQqYpqgPwohErVE1mGLyJ+LyoBaqKnVhqBOCuE7ibgIQxGvKaSbZ938GUjdjLqknoFHz7b0MZAygQO2ogbsD88WxCVwEs=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2019 07:58:14.1418 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f2e188-0039-4db6-29bd-08d6b677cb41
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_005821_897481_926F12A1 
X-CRM114-Status: GOOD (  10.12  )
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

Xilinx Zynq uses a QSPI controller that implements all the functionality
required to support Quad SPI NOR flash devices.
This driver along with the SPI MEM and MTD layer is used to support
flash devices.

The flash device(s) can be connected in three configurations to this
controller:
1. Single - One flash device with 1 CS, 1 Clock and 4 IO lines.
2. Dual Parallel - Two flash devices connected with common CS and
   separate IO lines (resulting in 8 IO lines).
   In this configuration, the controller
   a) Duplicates commands, address etc. sent on both sets of 4 IO lines.
   b) Stripes data both transmitted and received i.e.
      4 bits of data is sent to the first flash and the other 4 bits
      to the second flash. Similarly read data is also consolidated.
   Due to this, TX and RX data handling in the driver need special
   handling for parallel mode.
3. Dual Stacked - Two flash devices connected with separate CS and
   4 common IO lines. This is largely similar to single, except for
   the slave selection logic.
The above configuration is conveyed to the QSPI driver through a
devicetree property(currently not implemented 2 & 3 mentioned above).

As per Boris suggestion We are currently not targetting for
dual stacked/dual parallel handling. There are changes needed in the
framework to handle this. so this update is only for the Single mode.

Naga Sureshkumar Relli (3):
  dt-bindings: spi: Add device tree binding documentation for Zynq QSPI
    controller
  spi: spi-mem: export spi_mem_default_supports_op()
  spi: spi-mem: Add support for Zynq QSPI controller

 .../devicetree/bindings/spi/spi-zynq-qspi.txt      |  25 +
 drivers/spi/Kconfig                                |  10 +-
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-mem.c                              |   4 +-
 drivers/spi/spi-zynq-qspi.c                        | 761 +++++++++++++++++++++
 include/linux/spi/spi-mem.h                        |   3 +
 6 files changed, 801 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
 create mode 100644 drivers/spi/spi-zynq-qspi.c

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
