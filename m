Return-Path: <SRS0=PkFq=XO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D429C3A5A6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:42:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59FD1217D6
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Sep 2019 12:42:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LbSsKX+1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="piHNASCD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cadence.com header.i=@cadence.com header.b="GTCaE50z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59FD1217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cadence.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=88nXOfLGP2wV3zs/wrpNUcbCI37jH1CDw0Fn7Lx3qbo=; b=LbSsKX+1npLuKQ
	M7pSJTzBGmSOLlVrL96OpAao3Pgo+qZ61q/56HuvXlqGK6TTszTcxTDRq0Re7Eg29PeNDS1AkMkFc
	ua+w8d1jSDtKuj2mxdcFi8H9imhNBrZMZt+GBkVuhAnZKS8djFYeDULPurgmHX0VSh2vU161oyUx3
	U5dPwOO1Gv64WmkJeHnFIjcz0YCxWbiJnu+24wgn3y3+c0KOGFNi+MQsbq5g+KDYFkOAKLb9VacDJ
	FbUX92A2NXDh73AXpML6aZEdDFrBSMqfZ/POFLcxBkVybPtJAT0u+HodnbggOicoL0d+b7JAu5/HG
	rcL26Mkx9cAvagIuFe7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAvlb-0001DN-OF; Thu, 19 Sep 2019 12:42:35 +0000
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]
 helo=mx0a-0014ca01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAvlY-0001Cz-Vo
 for linux-mtd@lists.infradead.org; Thu, 19 Sep 2019 12:42:34 +0000
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
 by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x8JCYFL2012555; Thu, 19 Sep 2019 05:42:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=proofpoint;
 bh=yxQIFb41lsENhDLTN1ejSVqcNx8iB7zovNB82Rs6DYc=;
 b=piHNASCDYmXiDyEmk5MSth7D7uMJohVoh0osRWmZhrnuy2OvRDDU+K9zbQBFqU7x8nhe
 4DayJoV3LXafcyFyuax6U/UJ0eKfwGTHcsmcfI2h/ZdJrCQhI+4TEBfk7OLuyS4nlDnU
 qycl7AlW1ObnUWP4f3xSXdDO+K8JoSy6vBF0RzUuAZYPPTQz6KjVkn2cVoZQk2Hc6dLR
 ZmlKENMmNvWPrlhcL7jlDhjMc/Jljofxlhm68H+ZwyIxQeGhoHVZboM9yUY7YLUSzN0W
 q760NyIMdYjDFko53LhpFBUflHDwgynsIHKhRW/6EgBmyBLgs8MHbMwOirQaYxy5i7nB rg== 
Received: from nam03-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam03lp2057.outbound.protection.outlook.com [104.47.41.57])
 by mx0b-0014ca01.pphosted.com with ESMTP id 2v3vb0b22g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2019 05:42:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HahuLLJa5lmjJInwWZ006MHc/WsoZ7mYjNivwJH9rfnglmYPSk1bo5ZpC2J4YnadpcJQuwnb0/autpyPo9iLMC6mwukoiXvUjrXj/l/V3kDZU7M1HLOhUSSx4oVaPZF7IH6msB6GErBuiTLI3SJTEMr6iyRHPauAYnxYQJXWH/30x3O9u0CNME6280CZ0La90rqGmWKCw8VzUWwl76BWGWc2CAOlhjH5JaMWU5PadtnDhU05yExUI+YnQqoS+BYnH0ChOV1Wz/9pS+VPN7tlpP7mK52zuZC1qmzzwkw7tlFFtmq+dVdVwwVOeH0QkXf3VYeilPKAW59XACLnaOLLVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxQIFb41lsENhDLTN1ejSVqcNx8iB7zovNB82Rs6DYc=;
 b=St5ndtcwdtVKjumkoEde3FbVOVXW2LLvz13j3iziiv+HcYrZ5YebFN0u+/1S68x5RWRWw3eZ09ZSz41Py+I8ARnGB3Bq9CZF3J/708HyHjEf48kyyWVfjhLiacHdGtQou/rsnQf6IWrss/OeVn8omdKySRaCGz5NZrXR97DEIat8U9wC8Stsl38lN7f0LsnV3q/9fgCxECogXHwnbyGuAItfdCSgCm0dQULFmHVg9qiK8woc3Z/kdWEikxwc6D+U6ZBcr3m2F3WP+4r0JwVFRWnvSzaQGulE4gUYCMAFY5sQGFLO0csXho6PcD5wxtXzP1RPUZ13VXtfOzxAlIzGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 158.140.1.28) smtp.rcpttodomain=gmail.com smtp.mailfrom=cadence.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=cadence.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yxQIFb41lsENhDLTN1ejSVqcNx8iB7zovNB82Rs6DYc=;
 b=GTCaE50zYzA9DIccT9ppbSIeJiPQo/qrKVFtdoc5LjwOdlJrUuFlDswWDySSD8qnY4CZ9jb1z68tb30ri37ZZRIQw2dphgl5O2Wiw9ruVNdz/D6Po5xqsJg+5aj4ULB0DxGME/RxxhxhxwRuXssiL73riWuX0kAOFdaqXKSwjMU=
Received: from CH2PR07CA0020.namprd07.prod.outlook.com (2603:10b6:610:20::33)
 by MWHPR0701MB3641.namprd07.prod.outlook.com (2603:10b6:301:7d::34)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.13; Thu, 19 Sep
 2019 12:42:09 +0000
Received: from DM3NAM05FT056.eop-nam05.prod.protection.outlook.com
 (2a01:111:f400:7e51::206) by CH2PR07CA0020.outlook.office365.com
 (2603:10b6:610:20::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2284.20 via Frontend
 Transport; Thu, 19 Sep 2019 12:42:08 +0000
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 cadence.com discourages use of 158.140.1.28 as permitted sender)
Received: from sjmaillnx2.cadence.com (158.140.1.28) by
 DM3NAM05FT056.mail.protection.outlook.com (10.152.98.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2284.10 via Frontend Transport; Thu, 19 Sep 2019 12:42:08 +0000
Received: from maileu3.global.cadence.com (maileu3.cadence.com [10.160.88.99])
 by sjmaillnx2.cadence.com (8.14.4/8.14.4) with ESMTP id
 x8JCg0fP014682
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK);
 Thu, 19 Sep 2019 05:42:02 -0700
X-CrossPremisesHeadersFilteredBySendConnector: maileu3.global.cadence.com
Received: from maileu3.global.cadence.com (10.160.88.99) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3; Thu, 19 Sep 2019 14:42:00 +0200
Received: from lvlogina.cadence.com (10.165.176.102) by
 maileu3.global.cadence.com (10.160.88.99) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 19 Sep 2019 14:42:00 +0200
Received: from lvlogina.cadence.com (localhost.localdomain [127.0.0.1])
 by lvlogina.cadence.com (8.14.4/8.14.4) with ESMTP id x8JCfxTb011358;
 Thu, 19 Sep 2019 13:41:59 +0100
Received: (from piotrs@localhost)
 by lvlogina.cadence.com (8.14.4/8.14.4/Submit) id x8JCfttS011203;
 Thu, 19 Sep 2019 13:41:55 +0100
From: Piotr Sroka <piotrs@cadence.com>
To: 
Subject: [PATCH] - change calculating of position page containing BBM
Date: Thu, 19 Sep 2019 13:41:35 +0100
Message-ID: <20190919124139.10856-1-piotrs@cadence.com>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
X-OrganizationHeadersPreserved: maileu3.global.cadence.com
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:158.140.1.28; IPV:CAL; SCL:-1; CTRY:US;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(36092001)(199004)(189003)(1076003)(76130400001)(478600001)(47776003)(7416002)(476003)(5660300002)(1671002)(2616005)(8676002)(50466002)(51416003)(2906002)(426003)(8936002)(36756003)(126002)(6666004)(486006)(246002)(86362001)(356004)(50226002)(70586007)(305945005)(109986005)(336012)(87636003)(26826003)(16586007)(70206006)(26005)(316002)(54906003)(4326008)(186003)(48376002)(7636002)(42186006)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0701MB3641; H:sjmaillnx2.cadence.com; FPR:;
 SPF:SoftFail; LANG:en; PTR:corp.cadence.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9824b149-186c-4b31-ecea-08d73cfec8c3
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
 SRVR:MWHPR0701MB3641; 
X-MS-TrafficTypeDiagnostic: MWHPR0701MB3641:
X-Microsoft-Antispam-PRVS: <MWHPR0701MB3641EC0379A88C1CBA946F36DD890@MWHPR0701MB3641.namprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 016572D96D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: rZhMe58RNEDXabkfXtVxPjhRa5to/yrzis4oRq6usaeNdy8N56J+ioUd5C2KzgWf/ci6AKoIGcsuzrStKaSNfnrTIyO21JOXeSorIukiH8CQGLp6NekcAgmIoNPXuxaygy8kf5zN9R3n6iDBXINv2pdJp4U+SYdmw/eZqpRVWhhiHBQigzUNrL23oOyM1EUbKqtSnBjQeANSx22IsaD/yZEiQw3mQaHEUacAMXva7bNYC+/Lk2NOgDDYkfhM5r58UH1V+hr9cpeNo8Qwg+7IGEUI7UBDcb6jyYPPNeHePFV9+Htw/22pWdsYSiGku8YMSglrlHu5cyvJMRarippFQbLsEKbWUTd/JZxTR4AM4QZ6FEPoxGZCxTGor2Lq5sn+U9U93CjWcRDFZSV8AxAC/9Dfsj8vZNPc8eZGfu7ZWf0=
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 12:42:08.2536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9824b149-186c-4b31-ecea-08d73cfec8c3
X-MS-Exchange-CrossTenant-Id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d36035c5-6ce6-4662-a3dc-e762e61ae4c9; Ip=[158.140.1.28];
 Helo=[sjmaillnx2.cadence.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0701MB3641
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-19_04:2019-09-19,2019-09-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 mlxscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1011 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1909190119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190919_054233_385074_82175F88 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Change calculating of position page containing BBM

If none of BBM flags is set then function nand_bbm_get_next_page 
reports EINVAL. It causes that BBM is not read at all during scanning
factory bad blocks. The result is that the BBT table is build without 
checking factory BBM at all. For Micron flash memories none of this 
flag is set if page size is different than 2048 bytes.

This patch changes the nand_bbm_get_next_page function.
It will return 0 if none of BBM flag is set and page parameter is 0. 
After that modification way of discovering factory bad blocks will work 
similar as in kernel version 5.1.

Signed-off-by: Piotr Sroka <piotrs@cadence.com>
---
 drivers/mtd/nand/raw/nand_base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 5c2c30a7dffa..f64e3b6605c6 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -292,12 +292,16 @@ int nand_bbm_get_next_page(struct nand_chip *chip, int page)
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	int last_page = ((mtd->erasesize - mtd->writesize) >>
 			 chip->page_shift) & chip->pagemask;
+	unsigned int bbm_flags = NAND_BBM_FIRSTPAGE | NAND_BBM_SECONDPAGE
+		| NAND_BBM_LASTPAGE;
 
+	if (page == 0 && !(chip->options & bbm_flags))
+		return 0;
 	if (page == 0 && chip->options & NAND_BBM_FIRSTPAGE)
 		return 0;
-	else if (page <= 1 && chip->options & NAND_BBM_SECONDPAGE)
+	if (page <= 1 && chip->options & NAND_BBM_SECONDPAGE)
 		return 1;
-	else if (page <= last_page && chip->options & NAND_BBM_LASTPAGE)
+	if (page <= last_page && chip->options & NAND_BBM_LASTPAGE)
 		return last_page;
 
 	return -EINVAL;
-- 
2.15.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
