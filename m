Return-Path: <SRS0=2WOf=VN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF9EC76188
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 05:31:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEEA72145D
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Jul 2019 05:31:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P0JBHEPi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="rh105JbM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEEA72145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=clJ2VXCuo7wnkbMqyeHtn9EDzgV+KXQr76gzjPU9nto=; b=P0JBHEPiPEFlUH
	maxyd4POJyEoG52kDNa530lSdFQEHxUJ2knrWGmqPAZlknt1KRXUvOLVeSLsAZq19+A4ruRPQl4jT
	i/lINtHbSQ266EHUSU6TvLVrmMJWRgS5tLTAr3kVb4/a8Wbs+gQHR7frJt3eog0aoK9J9/fiTtNmY
	GsYGKjsnVIuvD7rw7NuFWzorsSG3/fDp1qlI+C0YR3yPb0GMWoZ6QOaWoFeEJuwEhoMI2dA/qhzUK
	EP3VT22ydwihePnvGDqHoTZd150YmolgRMzQTNalZdoOT3W+d+BgkYTg02zK7EFIBszdkglzndi8j
	VHUy5BFcVmqJbIKkoXcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hnG3b-00007t-0R; Tue, 16 Jul 2019 05:31:19 +0000
Received: from mail-eopbgr770072.outbound.protection.outlook.com
 ([40.107.77.72] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hnG3V-00007C-9d
 for linux-mtd@lists.infradead.org; Tue, 16 Jul 2019 05:31:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T668A3saXhEt2vACYEMmJyzQ9Qk7ZzyhLpU4Wf+rs3a2PFXp2ssHGpUGV2YjU/2uPsiHf60qIAyHF7PMtx/u85/TgHqLyZlg3DQqOteI2mMrADthZZ6xO6+7KRdohgHXWj8q7Rt+fj1nChsyJRu2rvUPe/JsndhZxpIcdKb0OpI/s4Y820Ww5ROkXjeLRVT9Tp41qoMcQIfxXdGVEi0LAnQ9kEK+dTIPSlqyn73+TX7WmRuZ3xtcL78jqspw2QxP2hPuywSDKQcOyj3sY6oyF5Q5RXSoZIOJQwbq6mcqWF4je+yclUumXVe6aIaAL7ySbXVwWI90Z7S6tGp1ieZmKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwnEIc2SBNiosSdSpLbQs2BPFVWjDZKvuODms67/918=;
 b=Q9cdoCvlcCt1evXJc0utU/+mMdU5Iivh6WYapSgw6HS/MOeDE+psxgFq50kjmqD3c/OOYIkVTW9xUElcNKi0Ntz3RpDPZu13TIR/uJT/Sv9TEZ3PJaDeO93ul1CKln7K1WHN5AViDJ1dD/QYE2hqMX6TL92NIb5micL/bI4yoBQxquLf/qveY8DewvA28LjHvavv5bYK/fyqO/as/Z12vW0kMQL6RifTRHKb2uUAb2SFwhC2WU6SVDzOCNLw+vUuEOh82ckqMeZ/pIlzK+GJojV+W5iFwvliU4TZyGCzQmxQGWLXivff08pzhkMTD+8YVblbf4JAAau/v44L5uDCpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=bootlin.com
 smtp.mailfrom=xilinx.com;dmarc=bestguesspass action=none
 header.from=xilinx.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwnEIc2SBNiosSdSpLbQs2BPFVWjDZKvuODms67/918=;
 b=rh105JbMoUxC3mx4dQGdRx6qTrBDvggo8v0ld/qa4UUhIHMz4nu7Wys7OSUH7PNMkkhrDwZu/RFWwEfIFh8R7bEGgxYC2RAb5c3YMVsUTrClTGD47QbSVI0+8uP7CMnM659lObWShQYS9N6gHEujIBMtjIkBiBoarJkOGZYSL+I=
Received: from DM6PR02CA0068.namprd02.prod.outlook.com (2603:10b6:5:177::45)
 by BYAPR02MB4376.namprd02.prod.outlook.com (2603:10b6:a03:58::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2073.10; Tue, 16 Jul
 2019 05:31:07 +0000
Received: from SN1NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by DM6PR02CA0068.outlook.office365.com
 (2603:10b6:5:177::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2073.14 via Frontend
 Transport; Tue, 16 Jul 2019 05:31:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT061.mail.protection.outlook.com (10.152.72.196) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2032.15
 via Frontend Transport; Tue, 16 Jul 2019 05:31:06 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hnG3N-0004wI-JE; Mon, 15 Jul 2019 22:31:05 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hnG3I-0004wJ-Fs; Mon, 15 Jul 2019 22:31:00 -0700
Received: from [172.23.37.108] (helo=xhdnagasure40.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <naga.sureshkumar.relli@xilinx.com>)
 id 1hnG3E-0004qS-HC; Mon, 15 Jul 2019 22:30:57 -0700
From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
To: miquel.raynal@bootlin.com,
	bbrezillon@kernel.org
Subject: [LINUX PATCH v18 1/2] mtd: rawnand: nand_micron: Do not over write
 driver's read_page()/write_page()
Date: Mon, 15 Jul 2019 23:30:51 -0600
Message-Id: <20190716053051.11282-1-naga.sureshkumar.relli@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39850400004)(396003)(346002)(2980300002)(189003)(199004)(107886003)(48376002)(316002)(16586007)(305945005)(186003)(50466002)(47776003)(426003)(7416002)(2616005)(126002)(2906002)(26005)(106002)(336012)(476003)(51416003)(70206006)(81166006)(356004)(36386004)(4326008)(8936002)(7696005)(6666004)(70586007)(5660300002)(50226002)(1076003)(478600001)(103116003)(81156014)(63266004)(9786002)(8676002)(36756003)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4376; H:xsj-pvapsmtpgw01; FPR:;
 SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98001829-8175-48d3-5b95-08d709aeccf8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
 SRVR:BYAPR02MB4376; 
X-MS-TrafficTypeDiagnostic: BYAPR02MB4376:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4376AAB9559FD52DCAC76E0EAFCE0@BYAPR02MB4376.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:494;
X-Forefront-PRVS: 0100732B76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TmW+swNN7iL3wPxo9saCwWDisD/R0L+oyOtGikdlR1TtQsNqCooMuFfgb9MklO2SQetSLveRvYXfWlIQnkjxsTvYLZzERGsjjxqv9ypdSoQQyYfz0cimc3fJKMiisVMCRvz5ORF+yLcDi+qsIKbOs69UoWHrV1RFYdwyPhvo6xG0jiCrEx5uqVPTIpfh6xRRcW/1urVbiwAsUVsDTDExxhaYIcCzKnQlXtrMVNsVxrCFuMnSHvbTTqQdrRfPAnJdWqABXZBYfyxMd4qFlCiqY9sOfgBpgPlnm8LsWo3prOMY7PD4dmV7qwDGV6C1xfCKh7VkpRo59pl3Q5/bLnagPOoQ0JCqMIV+LvZ32HqcWTgsUoDsTW/Bx9kyhdVAmXxLalW5R6fVneRHSi5fjmXgRQMgTlradmk1WcRHN/Efyz4=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2019 05:31:06.0079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98001829-8175-48d3-5b95-08d709aeccf8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4376
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_223113_367549_BB6F9AA5 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, vigneshr@ti.com,
 marek.vasut@gmail.com, richard@nod.at, svemula@xilinx.com,
 linux-kernel@vger.kernel.org, michal.simek@xilinx.com,
 yamada.masahiro@socionext.com, linux-mtd@lists.infradead.org,
 nagasuresh12@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add check before assigning chip->ecc.read_page() and chip->ecc.write_page()

Signed-off-by: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
---
Changes in v18
 - None
---
 drivers/mtd/nand/raw/nand_micron.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
index cbd4f09ac178..565f2696c747 100644
--- a/drivers/mtd/nand/raw/nand_micron.c
+++ b/drivers/mtd/nand/raw/nand_micron.c
@@ -500,8 +500,11 @@ static int micron_nand_init(struct nand_chip *chip)
 		chip->ecc.size = 512;
 		chip->ecc.strength = chip->base.eccreq.strength;
 		chip->ecc.algo = NAND_ECC_BCH;
-		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
-		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
+		if (!chip->ecc.read_page)
+			chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
+
+		if (!chip->ecc.write_page)
+			chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
 
 		if (ondie == MICRON_ON_DIE_MANDATORY) {
 			chip->ecc.read_page_raw = nand_read_page_raw_notsupp;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
