Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE7CC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jun 2022 08:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybWp3zhwHKjsnEBz3qeEI1Fj1Ee8T5JuxufO3Jyc7uw=; b=d6iL9SZsBpBiEO
	Mjpa9ST4NLcMu4tZ6ceU14KbpZCvbDumKqJXqYsgaScqa2tvSoqwNOMMEE0oj8zXnBkD+YYQCi9bb
	t2r8n2NwERIcUdfri7XGn5qPQooJrnYJtOEaJurFDaNTDFi03NPC0MfxYsPTYPsKq5fnXvQNgVpRI
	ioKdlOuUI3s/GDuaM0Ae7A8Y0lk4Ktz7Mk6S5+IuR98+krl6UOfYHzYHLwGEyTH8fH9u2mXu9K1FM
	PDeR+aqsRVMfEnNt/BeglfjYpZ509xW8NQG0IFTSUrtiiMZt5PcvDU3Y2oiOoeS3l2JNnFvEEncRy
	cUAPJrZU5UGfPkB8IPDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Zfq-004Rdi-6D; Tue, 21 Jun 2022 08:55:50 +0000
Received: from mail-mw2nam04on2066.outbound.protection.outlook.com ([40.107.101.66] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3ZfE-004RTr-M9
	for linux-mtd@lists.infradead.org; Tue, 21 Jun 2022 08:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJmfZS3g+94ncYDlUofnWQ7SBZvNnRruFUO6ZR5Jh+wR/YnO8eIXbd8z591FUptPY2Gf5y1CU5DRjiVHVD5Y3FXi5Nf7RovM6ErD+pyc3ug76GMVW0dahOgyMatXG2aBcLl2YYe6mX1/Z9AXFB0jarSM/S/L1byAuGucXZq0Yz4QpBULOk2m8CrYzKtCprb8iENL4KMu5hggvkak5qpX7soOqeu+9KKuXKdjbLLWkOMJwaN3Rc66RMd3GZFFgEevS605DwYTCxbKDWgYmvH5EApA94NXwxcQhvdEM0DHI2h4lLUlKV4Jn6Qe0zw5/ZzEqF2RvE9zhW/RTQ1Ciku5pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbkZ1sWSMtBf+eRb5hDyks57KwdxGXM2FnaP9xoBv6U=;
 b=mErzRGJdr+RoF2v2Gg9r4V+xfXBA+h6gSlYv82tzvA1ruEo/sA2BiXbroo4OTuBDgasZctN2Oa5rCGz2TOTvD/rR46SvF4oKfGQFH5ks9mDOYtFRvR0K0quvr91JqN/aNPlXykIjSSPS8r54KUm4mS8fTuWxbKABp9dk6AjIEtmc1pa4VqPQ+a8ghQO0UumJrmY9BszEiZmZsX++yGtJI9uTyXNgYY6CqV3lwHz28osDwHKBeP9+pygxo+AUmqg7MrkCb1xUBilEbNOdkH+bOGQqlvjyrm8+ZE3yk64kUZu6jCpgIdtctIEtYfLqIL9fJWAft8uh0M7RsxwKN9fEZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbkZ1sWSMtBf+eRb5hDyks57KwdxGXM2FnaP9xoBv6U=;
 b=X5HMdiJWV9lqMylizuzTtawnO9/PZBTrl4LDTrBEL2CVw/apKz+Ig10QvCsvz5SaTrcBcUZwelA8FELgrqg6NJnQQiSlvNOMiuOB9uC3Q3YRiogThurNibN0cSfMe79FFRZwJ2k82Dain4nItA+nNhc7G+DthqsPggkrCr3Agr0=
Received: from DM5PR07CA0165.namprd07.prod.outlook.com (2603:10b6:3:ee::31) by
 MN2PR02MB6766.namprd02.prod.outlook.com (2603:10b6:208:1dc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Tue, 21 Jun
 2022 08:55:06 +0000
Received: from DM3NAM02FT018.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:ee:cafe::da) by DM5PR07CA0165.outlook.office365.com
 (2603:10b6:3:ee::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16 via Frontend
 Transport; Tue, 21 Jun 2022 08:55:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT018.mail.protection.outlook.com (10.13.4.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5353.14 via Frontend Transport; Tue, 21 Jun 2022 08:55:06 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 21 Jun 2022 01:55:05 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 21 Jun 2022 01:55:05 -0700
Received: from [10.140.6.18] (port=52928 helo=xhdlakshmis40.xilinx.com)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <amit.kumar-mahapatra@xilinx.com>)
	id 1o3Zf7-0001C6-Fg; Tue, 21 Jun 2022 01:55:05 -0700
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
To: <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <git@amd.com>, <boris.brezillon@collabora.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<amit.kumar-mahapatra@amd.com>, <akumarma@amd.com>, Amit Kumar Mahapatra
	<amit.kumar-mahapatra@xilinx.com>
Subject: [PATCH v2 0/2] mtd: rawnand: arasan: Fix clock rate in NV-DDR
Date: Tue, 21 Jun 2022 14:24:58 +0530
Message-ID: <20220621085500.1005-1-amit.kumar-mahapatra@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 558e089d-9eb3-4652-d5cc-08da5363bd13
X-MS-TrafficTypeDiagnostic: MN2PR02MB6766:EE_
X-Microsoft-Antispam-PRVS: 	<MN2PR02MB6766A960D0396D9A5AA920BCBAB39@MN2PR02MB6766.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	1I2z16qzE9zRco2M1dEkdEljWJbRBBJSG7BnIePVbNpF2Rzmt74kMB+XXnlYJZTuxl62OImlpasn4nVvR+tvSNOD9WXG5uakhHlGAzybn5tOMHo3lvWzg7XUMzwXRAXUqYOsEFEBMsi+2mAxN3fP25/9MJfad9z9UJ95xpvcWk8srMhhJex/wd+j8upl8tFw0qh4c3OGTofbht7GY31VNsoqxdY8+4WHzoR9v0mHJObPAdcIVizSQJcmklNOygcLMe8DYkTy/oaxKN9Rdd80LftmlBftxk1pZb0sk3lIQQZmAfAaLm2IppJZGqqIwzV4MBoCTY5vON9Q8l+k8NAWeuCH5uUi9h4vaamhb8yrRkVhTPd/D0scMCsXCTP7Bhu9ehTRh6/gpeQJwvT2dxfozns8AigjO5QJhXnXyn4XCgTyFipyviUspLOmk0/TuJzhYwNgBEkkne5g2hKP5ryW1FZS7Oeg4k0YExZB35L9aEaQoXchewKPoJJ7T9KnbVGgfZg1QCeMXkjhUVFR2iJoxHDQyDXHHyo6dq7GzErjIOVyDfcjXJQ7nL/dcPA7rkr5bLmGSivy817hIT91yAvP/ckT39oIwxp6Thr9zAMVZfMbCxiRcME4poel2UJxPcxFbqGGpeKRt05xlnJn36lGY40gkAyxppgmtc2I1615xoZtqo2cKvzvjmcwsqmXKCU2N6aIAPoqDshHPzizhL3uBwD8YjsCRtDFIM50Iz0Aaegvz7rrgvcmZgy9rkJoW7Xor51oH6nSAhl/1h+G8ie0dDTz7e0rIMc2KZ6Ts8SmUQZRxUFhzi/sLke1DajyguJgmDLyPr6LkU00rcW745l9Qw==
X-Forefront-Antispam-Report: 	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(40470700004)(36756003)(356005)(26005)(7696005)(2906002)(6666004)(54906003)(107886003)(4744005)(1076003)(82310400005)(4326008)(316002)(110136005)(70586007)(70206006)(966005)(8936002)(36860700001)(5660300002)(478600001)(40480700001)(41300700001)(40460700003)(426003)(47076005)(186003)(7636003)(83380400001)(8676002)(9786002)(2616005)(82740400003)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 08:55:06.4470
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 558e089d-9eb3-4652-d5cc-08da5363bd13
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM3NAM02FT018.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_015512_814364_1042E7DA 
X-CRM114-Status: UNSURE (   5.54  )
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

Based on upstream discussion here:
https://lore.kernel.org/all/20211127180758.30884-1-okitain@gmail.com/

This patch series:
 - Updates NAND bus clock, instead of system clock, as per the timing modes.
 - Fixes clock rate in NV-DDR
---
BRANCH: mtd/next
---
Amit Kumar Mahapatra (1):
  mtd: rawnand: arasan: Update NAND bus clock instead of system clock

Olga Kitaina (1):
  mtd: rawnand: arasan: Fix clock rate in NV-DDR

 drivers/mtd/nand/raw/arasan-nand-controller.c | 26 ++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
