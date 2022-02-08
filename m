Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F684C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Feb 2022 13:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p8Em+O57tXhzFwu4wWtVatCuee8UyNLuXE+ybmHj0Oc=; b=dHqnCxX4q8636I
	s2E3d9NaYY8MeERt2vLTxI8EcdxQBYsaGEQbOBQacHSfGJN9vFeczLhJCC1uLuqWM3P6bhNphlYYp
	3CqnQW2sd3aZ7lNWiQnDL3B8XXunGHY28mo0lKLR788N7UDiki20OKtSHxGvlmJXxB6SVGqXzNAPv
	Z0dsuKv82J9BcxKxmG2Xwtvp7xbz75uHuffTqB5TxyPygHJJy1ToCfj2su28Ct9wxtrzaRv6bmu92
	64biVHNxUQj3dl/0sBUt5jsdv5FdM84Ekw5/pIDL5V54mK+Yv8u9xYcQuTrPKf9DnJMWXXBpRj0h/
	aTc3Y4r7z+vBxhJHADlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHQGE-00E06q-1k; Tue, 08 Feb 2022 13:10:22 +0000
Received: from mail-bn1nam07on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::60d]
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHQ46-00Dv1t-Hr
 for linux-mtd@lists.infradead.org; Tue, 08 Feb 2022 12:57:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EAbVY9/VIjy8GFKeNRbHuAAJcf1wEFZc52GKxOXXqENQe9fbVs0Vl4S3ADE+9w+XlHPZq7yE31CdHFfqjKi+4/UVeTwPss5RNhu0GqzEPIVw9yj/o8CfMMh6PrPcaz4l8/GSqLrwdRCdwPnd82HcEY2mOKiPuMtJJYxmmWu2bjSFXdfFF1/taXmnlc+Q8oFU2Qa0qcFIGsz9Hok1OAUuovrEUcF78hIcr5h0FDZ58XpUqP0mzl3XTJnb24rMzNlSXi81BJgEL5jCm+fcYn6ks5SBZWquw58CiIT8GnNs796A0Y/KJE9UUlcwTxh4LP4pLmjTT+jRsPYa6fu7lWdkeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ztjqr1QYyqqbTkuQaTkAxMFfubmfc6Z5cJXFi20Exw=;
 b=ge6y/wQLygDiJRlfCqmVo3FSJi6vSdZ3fj1j6JFnbe4R54LSadi/yKrReBcBRanHnOU4ydkZ1Qlm3T6eXgAdQ68SXkRUth4o0HT0aspT3FOmjd5s/LEpbU7PT+ALNXfHeSC/u7WIdu6lpXJlNfQgFD++V31XqwHkXEJfInj83kJwNwQPraw0glWEDnD44zNNCqBUb0gt7VPJHBhsCkzqAu2f7fasvc/L+9I/grkzxa0zaMSGYal5ObT4IzCf7vaxdRKMW5Z04eV/jealfUwyNYzNJgkxcOBYTE6GgnkUfWHCjSDoFHxZXGNGLhx0EXYrNEQfY/q0v+SxNHVNzVOgmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=bootlin.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ztjqr1QYyqqbTkuQaTkAxMFfubmfc6Z5cJXFi20Exw=;
 b=HH0CUwYhfnJx0JjGgHzZM6DyvZVzw/lW2aSNtuhfxjdmoOKVXZk50l64MwssONmewYLjAkZdnJG1iQ5CtwDyYBD8FlKBj98tF76M8KzcP2lxmfGh5tqh1/JjMUA8R+IVvED7sXEj4vamRR1DDILWSA33+5+o/ujzkOuX+2YjEQM=
Received: from BN9PR03CA0519.namprd03.prod.outlook.com (2603:10b6:408:131::14)
 by SJ0PR02MB7744.namprd02.prod.outlook.com (2603:10b6:a03:31b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 12:57:46 +0000
Received: from BN1NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::17) by BN9PR03CA0519.outlook.office365.com
 (2603:10b6:408:131::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 12:57:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT005.mail.protection.outlook.com (10.13.2.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 12:57:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 8 Feb 2022 04:57:43 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 8 Feb 2022 04:57:43 -0800
Received: from [10.140.6.18] (port=57436 helo=xhdlakshmis40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <amit.kumar-mahapatra@xilinx.com>)
 id 1nHQ3z-0007s6-DJ; Tue, 08 Feb 2022 04:57:43 -0800
From: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
To: <miquel.raynal@bootlin.com>, <vigneshr@ti.com>
CC: <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <git@xilinx.com>, Amit Kumar Mahapatra
 <amit.kumar-mahapatra@xilinx.com>
Subject: [PATCH] mtd: rawnand: pl353: Set the nand chip node as the flash node
Date: Tue, 8 Feb 2022 18:27:38 +0530
Message-ID: <20220208125738.32162-1-amit.kumar-mahapatra@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2d1af60-3186-4359-d04c-08d9eb029a67
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7744:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB774424A692222F32EF701CACBA2D9@SJ0PR02MB7744.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1jT5mKBnbNQbv9wAvK3TLnBnjKjeL0i12+SAspVCTyiN/ujw3g+9Q5WPS3Dg+5sArYbY8l4Gm4d9g7TGFSsYe145v96UEyZMIHDUMqjkKUDiYIPTUJb/7uaIJ3J2f0v5YyWSxeczHtDqqJ+mh8yJZBv3kY3inHIsdJE7sIH0rMJ9KT6zYsZtU3BmPkiFnhxm5okLTq4YMm7cZI3JVVz1qCnKOM/XzVH9DyN3UwQ+DoyvANRwuizuenkOvoFQOeo6IVE49QD6TIIBlpgv20mLGMWl50wIBm3d76ZDPCG2Ao8884Ajn2rmPH+k2dZTEm22lnnaTd9eyeRq+eKyrTt5sOsMT1ecACwZaDXHx/X9Ajb9Irmrwzqsh0r3NE0f1G/0BnINoW70FiAXkRI8VWlMFCduwsM4XnYJ3cT5KowmiYlQg/SwhViDRbF2N8kWSUFviJ2wZAdYPYN+xMpFsOYAWOI/p1eeZ9BhUS7ghC2+LrYBu5vU+plMWPcRg6oKBKiuoH1t3h7cXBNSAmIWhCk/pJEhXz7wf/tdmZu/iEDW1IdWmtZG/C4GjkUhCGAl/QCFxKG1keQjf6a227aWdIcswgxSSg53BLmwEyMTD2m4LHzWbOt62fhe0ToaZljCrlxULmQjgS0Xw8FKcpTUkm8KHdvelAm658dMbbRTG1omGHhCyw+iHPhQne1aMWHvUOATHFtOYv+9TiM5pJUkkrV/A==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(40460700003)(82310400004)(6666004)(7696005)(7636003)(36860700001)(2906002)(47076005)(508600001)(2616005)(83380400001)(186003)(9786002)(356005)(5660300002)(336012)(426003)(26005)(8936002)(4326008)(110136005)(70206006)(36756003)(54906003)(107886003)(316002)(70586007)(8676002)(1076003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:57:46.1186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d1af60-3186-4359-d04c-08d9eb029a67
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT005.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7744
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_045750_651244_73DB184F 
X-CRM114-Status: UNSURE (   8.83  )
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

In devicetree the flash information is embedded within nand chip node,
so during nand chip initialization the nand chip node should be passed
to nand_set_flash_node() api, instead of nand controller node.

Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
---
BRANCH: nand/next
---
 drivers/mtd/nand/raw/pl35x-nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/pl35x-nand-controller.c b/drivers/mtd/nand/raw/pl35x-nand-controller.c
index 8a91e069ee2e..3c6f6aff649f 100644
--- a/drivers/mtd/nand/raw/pl35x-nand-controller.c
+++ b/drivers/mtd/nand/raw/pl35x-nand-controller.c
@@ -1062,7 +1062,7 @@ static int pl35x_nand_chip_init(struct pl35x_nandc *nfc,
 	chip->controller = &nfc->controller;
 	mtd = nand_to_mtd(chip);
 	mtd->dev.parent = nfc->dev;
-	nand_set_flash_node(chip, nfc->dev->of_node);
+	nand_set_flash_node(chip, np);
 	if (!mtd->name) {
 		mtd->name = devm_kasprintf(nfc->dev, GFP_KERNEL,
 					   "%s", PL35X_NANDC_DRIVER_NAME);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
