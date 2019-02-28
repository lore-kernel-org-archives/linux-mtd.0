Return-Path: <SRS0=M8pk=RD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC48C4360F
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 07:02:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADBAE21850
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Feb 2019 07:02:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CjZHG4/d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="aVLXBxO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADBAE21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WDDKWxCvt9AFikoIgWkwBS9xngcDPsEeSFceI7l/Eyc=; b=CjZHG4/dv8Z7gY
	60jzbG0JwKGCFyYCNYeR0FZdWoYaM3vtt4a2Wx4i3gWt7Cy9UvxlyyrB/rxd3HjyjrfbKktVqvqgb
	Au+XGCNr5bDfZGsmDBmssr/ROJnOOY7D4DNGPXfdaGs75zlR79R1tFNaIwCy5jvJgR7d+cbs1AkP1
	4JCBxJ6fnSd2gro0FEJAruImuHNTyfTlfljMeSdJn0vDpnCxXIwTCmgzt5F6gC4BpPwHPvbuDWQg1
	F9Ix1wlyq0N6+gYialshOSYIZ/s9hVjc3/FdKwazPEJh4/CUEyJLLBWE5Z5gqaCFjvA2tWwg6zIMC
	+vW79Ds7zCzsZwb/BbjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzFiQ-00049K-AO; Thu, 28 Feb 2019 07:02:46 +0000
Received: from mail-eopbgr800073.outbound.protection.outlook.com
 ([40.107.80.73] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzFiN-00048z-Q9
 for linux-mtd@lists.infradead.org; Thu, 28 Feb 2019 07:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSCryescbcxy18ebkHvONmzjXblTSxuhvkkuQcJ7oWw=;
 b=aVLXBxO7WCTfq5+PYFeiFKosa+aGSe5lEvWLZdtHnipSVqOkNteVTFYp5K5fX005VjhnjKiJsee//j3JDYTe+fbWCB5KwubqUis2T+/7ZoT12yXW/BfaNCACw6n5+heVTEiPQotrOmDPkHMW81HflsY9wK4En76ku+cIWYNKP7Q=
Received: from SN4PR0201CA0021.namprd02.prod.outlook.com
 (2603:10b6:803:2b::31) by CY1PR02MB1304.namprd02.prod.outlook.com
 (2a01:111:e400:50f0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.21; Thu, 28 Feb
 2019 07:02:40 +0000
Received: from CY1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::203) by SN4PR0201CA0021.outlook.office365.com
 (2603:10b6:803:2b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.16 via Frontend
 Transport; Thu, 28 Feb 2019 07:02:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 CY1NAM02FT009.mail.protection.outlook.com (10.152.75.12) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
 via Frontend Transport; Thu, 28 Feb 2019 07:02:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40373
 helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1gzFiJ-0005Wf-9R; Wed, 27 Feb 2019 23:02:39 -0800
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1gzFiE-00056W-5x; Wed, 27 Feb 2019 23:02:34 -0800
Received: from [172.23.37.108] (helo=xhdnagasure40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1gzFiC-00054j-TW; Wed, 27 Feb 2019 23:02:33 -0800
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: <broonie@kernel.org>, <bbrezillon@kernel.org>
Subject: [RFC PATCH 0/2] RFC for Zynq QSPI controller driver
Date: Thu, 28 Feb 2019 12:32:27 +0530
Message-ID: <1551337347-11035-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(136003)(39860400002)(2980300002)(189003)(199004)(9786002)(36386004)(2906002)(126002)(81156014)(7696005)(81166006)(486006)(476003)(8676002)(77096007)(356004)(26005)(51416003)(336012)(305945005)(426003)(186003)(6666004)(63266004)(2616005)(54906003)(316002)(106002)(16586007)(110136005)(50226002)(5660300002)(36756003)(47776003)(4326008)(50466002)(8936002)(107886003)(478600001)(106466001)(48376002)(107986001)(5001870100001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1304; H:xsj-pvapsmtpgw02; FPR:;
 SPF:Pass; LANG:en; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9c2ecdf-179c-47a6-9446-08d69d4aba8b
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
 SRVR:CY1PR02MB1304; 
X-MS-TrafficTypeDiagnostic: CY1PR02MB1304:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1304;
 20:x02iCtpJihCZqgPq/96GYnYyMFvD6czaGCFy5v4CZIFug+vV9g/tEbvZdc1y806lezNhC3jjgw/kgGgbDbN5p6oMA4tkwWhomDkuxfqdgW1x0VXlh2GE5yRm1U/e5i0N7XqmstM8l/K/btZ+2BnHhksMzFl2KwDbbq7lehomOnkBWtDESpWLOpUPY90JbiJWhfRF5jJD05B6KmlVQ2/PNMdtNldzfLKCQEfnO+rJBQZmJ+mTjx+HOw7sFhCJhwPfowOrwPvsVDXhQch3dTBICp/Yn+JUwCs9m57N2SGnRSWPimSqNs8JhobGZg2jgJST5RnFxDU0W4dbNut2X+ALTyvq95tX5UhRBZzUj6aQXZ3QB3g0KPq4JXTBgnR3SXSe+o3mI3+ogLDR7a1FsXB9rsZ3hiLXObXM5yMth8CWnyL6xvoBzo4ziCWVjk6NvqWMEdsYoS3MZoTcld0fAuGXYA9e62XAj7QClbKDc5V5Gfh0wmq/jezSBGXN4V0h+1yp
X-Microsoft-Antispam-PRVS: <CY1PR02MB1304E916152CA1E5CD4CF385AF750@CY1PR02MB1304.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0962D394D2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1304;
 23:xFfbD7IPkxGdi4/ibA7cMJ4gAMfL+slmBDHpqKzI+?=
 =?us-ascii?Q?fXag0EVPk5tO3Ason8aC5x8jxPPmos4W9rF/PfpyfpaSnvSiTKHtpRobuOvB?=
 =?us-ascii?Q?wz/AR4rY5HQJlTzOrmuiFTc41mmevdbBMnIRRpS52KACwjS6zOOAKOY9iG82?=
 =?us-ascii?Q?GmqsEpr01JZf0SQhQx6mu8Udz1tkYYDWI8mxUmBCpO6tUKKtikp+htr/rgz3?=
 =?us-ascii?Q?jFqxIVByAuN5qppZaPnhh1YtOgFZXXzkSJqfnjDW6+IqAppt4dTM09VMdMd1?=
 =?us-ascii?Q?qM0EE67agRlkTVC7W++e2UQpQFG7NLd1zgadbsiaNtemm+BSQSbthfiHWlhb?=
 =?us-ascii?Q?oOH9+djIcvlfPYbzEuct972QsOhr8r3ielsP3SiNFK7R4qeEW859cDY8Nfo8?=
 =?us-ascii?Q?eQhvJpFPEgRdB9DkiGlFK46tac8qBTBKcuIFKiSmdUdXB2XY5L9YtKbDG51k?=
 =?us-ascii?Q?ivWoT96N5n3tRBGu8eLZZRzDg/7HS5gHSqcUaXJZiidGLboykr99rO+eNdZ6?=
 =?us-ascii?Q?/uceryl+EDIYKOWtrOfsibTBkqeTNkpCLZYS5i21KpKpezO4AUsC/3v0AuLI?=
 =?us-ascii?Q?qzwp76IazB2dWB2+qxzk4EdSB9/1Z18lHEPrsZ+bJVbpR4QJ5azBcnBUpS3E?=
 =?us-ascii?Q?Gx1wLala69mFIINLRInuCz2Zmyo1BQ1L/0U/ee4yllIVKhBNeYX1V+2mO4Od?=
 =?us-ascii?Q?sE7lRtbvpq2kqBt0H6puMk/EG9nM+L+7Cx/vMWQ+s1e0fMH6hr11qSXdroPM?=
 =?us-ascii?Q?+Sv/oqbLMSdnOhktYg9W0lUoK/l+ubuOqtjgXi3tYUgnAg7Vj5IwlJai9zCr?=
 =?us-ascii?Q?zwAKcEIY3auADzk7TtS1kyoArUDd+QfFCSDRC2sTF8FyPKVzqOVbQnfY6XL+?=
 =?us-ascii?Q?nCangR2CqGcWX0VU9Uyy+UH7U9XGu0kbrf/of4+cb92HmyvUKyh1vOEIkycV?=
 =?us-ascii?Q?XY0S1gWM44oahdQ2mrWiMyll7grujZzbqEoC1pIfxHVi79UNZImQDu4A4mpJ?=
 =?us-ascii?Q?LTDZuDpNzh/9wceGTPas29JXBgKICxMMGdOcVNblMvYInDXcwcLT3rvzx4ED?=
 =?us-ascii?Q?eQuGRw=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: +5gQ9vJfHo9g57dGPSIv4T8lKGF108e9oFJXEtjatSHrFF/pUi+gVMD2eQ+EFyg8ZiFXG0qdjPB7XGUyzTwHFKeHQWEKmhzkRoL1JPEVCNOX94MRHB9i4a0i0LPw5QZ7qk1q5HMKLz0SOGBWoEm3IdzpwSEXjB3N+prcmSwB/WhyWvvYMwr1faIIPIm6BSSGAajDQmWxAX4u4TBtMx7qcTnG9LHuFaBn8fY0RceqQROKEu22J3EFm6CEuCp2uhLbmlhGIMRoy14FcxqKxE2E8zl831SAXR7pG4Qor8UM1iAgc91Y0TlIxk2qo5sI6rMl+fdwmFh/zxwDb9y3BebXXeRLXIW80x1YnoCvI0fISIEHa3RIEZNkabfLTDGXlDRa4dGu2r66KB0v242HvmZ0a+Gw45+N8aeIa8Hg1p85zxk=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2019 07:02:39.7620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9c2ecdf-179c-47a6-9446-08d69d4aba8b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.100];
 Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190227_230243_848295_07694FFE 
X-CRM114-Status: UNSURE (   9.78  )
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
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, richard@nod.at,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, nagasuresh12@gmail.com, dwmw2@infradead.org,
 michal.simek@xilinx.com
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
dual stacked/dual parallel handling. looks like there are changes
needed in the framework to handle this. so this RFC is only for the
Single mode.

This is tested with current master branch of Linux.

Naga Sureshkumar Relli (2):
  dt-bindings: spi: Add device tree binding documentation for Zynq QSPI
    controller
  spi: spi-mem: Add support for Zynq QSPI controller

 .../devicetree/bindings/spi/spi-zynq-qspi.txt      |  25 +
 drivers/spi/Kconfig                                |   8 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-zynq-qspi.c                        | 780 +++++++++++++++++++++
 4 files changed, 814 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-zynq-qspi.txt
 create mode 100644 drivers/spi/spi-zynq-qspi.c

-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
