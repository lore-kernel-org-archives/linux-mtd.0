Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440A5C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 21:20:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D11DD64E58
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 21:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D11DD64E58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jKaOeBaI6MJ+JPzEda40Qeo39cCUJDg0ljXUmYvcA98=; b=07GEWzRp0YickJUZb+D3UoDqB9
	E2ZOI0f0tM4/76xeDDIIpakq83VnOH7ABxwKZhOKk/cNp3LxIrDYdLHPm7U0gebizCoH4zFuaa/IF
	O1wHVjS6cXRKndk5dj0m/y0IufPsKXbFENfmMksrcQhGnI5HxdC07lRFKLTcxaXME44IErCW6ppHE
	OF46/CHX0nygUAvt3v/P0RfZFD7m+l0z6XtGVflJbKVjbqCHWpcrOa74+BFBxznly/4rsjm/qzqbE
	YWa2ht5lQH4dwMlxeURBKPgWjsMfuihqETsSXGYhoK1hANOWhYY3ocfpKoYEgii26wNs0pOvPmn7u
	7odX1bxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCUDt-000620-GI; Wed, 17 Feb 2021 21:19:01 +0000
Received: from mail-eopbgr120118.outbound.protection.outlook.com
 ([40.107.12.118] helo=FRA01-PR2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCUDq-00060b-4Z
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 21:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRbkLkW/KkIRYYqmFCyLfUCTc+dSmnC0D0ImZNqR5DfE3zkwtmJPA5vSKlIzV55tjmC5oz0sp8I+pclBbhsNAptRWYj0sEnUnp2AkfdygZzRZPGKm34XN1H06dvpLCnSo4M2sW9xpZW26hgMVcBM5638qLk21HsZ7uzFX+vNXrZJZCc4Vahy+2M54b2hQROFDyGtJ8siz4VKMJmg2s/jwip9xusDedforwP71m+v1Ux/P0YT82S5pZxrDieswU6CqDoS/31OT6rm/5hbRDNmuYsQA4U+QzjqtJy7eeZd7nI82g/JrEAeMAg6qAShvFTSRjems5Zu4GtOBqotOHDjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxAfcAgnk1bqo3Q4wvBZu/rd0JUSYgolyLn5d182qIY=;
 b=LQ9tZFzzjxjrssVESsigo10gXf3uaSZES7eZE92KI6AnbeeVirZ9p7wH7cuL74yo73e417rzvuocoh9lynERdpos9s0QSBDueKNZNVfn1XHLf2QSyU4lgloPtkMEyFd6TMhXuUB9dPdSRS1TFtxUeOyUgZQvEl0/HxhuYPni80ZAKvI2O9OBk5rg7fDFXc4QCK5PvtrXWAzxt1ZhRxtG474ycJ79L7DpMySUwuel45F6yPizrJxuIrzevtZMUdZDgiCYS+PECEifj2YN0WhYt8mTAdKr+Vb7DkDyqmcQ5t+Fc+6CRCf/dH2/G0r5AFQUiARjdoDkhL/LNbx43fNAyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nokia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nokia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LxAfcAgnk1bqo3Q4wvBZu/rd0JUSYgolyLn5d182qIY=;
 b=bK/RO8f2/SihWkn37jlTImoshM9t8v96TcJruDQ8z8GAwrpUyokmmKVysGjAVgHE2O7JXsPm4o1uqDnSvUKfAQ7yyPrlIGlDHqdW/QZ3aQmt2fAKk7jVQVI4J5QYXuEd4hXc5n+1RGjJg25f35gpUchbnYmxE1X6HPVs1CphyM8=
Received: from MR2P264CA0112.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:33::28)
 by PR1PR07MB4858.eurprd07.prod.outlook.com (2603:10a6:102:a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.11; Wed, 17 Feb
 2021 21:18:53 +0000
Received: from VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:33:cafe::6d) by MR2P264CA0112.outlook.office365.com
 (2603:10a6:500:33::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38 via Frontend
 Transport; Wed, 17 Feb 2021 21:18:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.17)
 smtp.mailfrom=nokia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nokia.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia.com designates
 131.228.2.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=131.228.2.17; helo=fihe3nok0735.emea.nsn-net.net;
Received: from fihe3nok0735.emea.nsn-net.net (131.228.2.17) by
 VE1EUR03FT030.mail.protection.outlook.com (10.152.18.66) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Wed, 17 Feb 2021 21:18:53 +0000
Received: from ulegcparamis.emea.nsn-net.net (ulegcparamis.emea.nsn-net.net
 [10.151.74.146])
 by fihe3nok0735.emea.nsn-net.net (GMO) with ESMTP id 11HLIoTb020561;
 Wed, 17 Feb 2021 21:18:50 GMT
From: Alexander A Sverdlin <alexander.sverdlin@nokia.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/2] mtd: char: Drop mtd_mutex usage from mtdchar_open()
Date: Wed, 17 Feb 2021 22:18:44 +0100
Message-Id: <20210217211845.43364-1-alexander.sverdlin@nokia.com>
X-Mailer: git-send-email 2.10.2
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 1ce135b1-b4a7-458a-fcb9-08d8d389a097
X-MS-TrafficTypeDiagnostic: PR1PR07MB4858:
X-Microsoft-Antispam-PRVS: <PR1PR07MB4858E0FBC85C437BFACB10CF88869@PR1PR07MB4858.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8lakeWOsAB8tUADgvIquPKUrg3eBXQHnEV6t3yNDJtI+q0KUnEGPjuM8kzn+Z4zplKAkDFEOadteyB0jzYX/mCqqQ1zztQnHdLJ7v4M86rMHIPgTc+6QMSylcrAXUeW1V/so+8vmmYTgAWbxSRsExjswpWBnpks3Db5iqEWA5IjxkTLRQDEHF9ETdDrCdOTrhaJ5mDnT9UZOyDRWxFk8WulkmHYy8B5c1triGQJ4MCUxOOJdAF2cRTtI4b/be0HxWGWAshhmdPqG2Uz4T3EYZCSJmquN2uUk6jxVtWVPY/Dh1Aj3wGDcOQ7UolNP/wpyFkN8BLn/cnP0A4KbivgI2moS8gK2duDQrg/hVj0BxSpQExh8bj0V27EG7XsqNlhhWdhr5hISXrYYxKE5mJt0bc3T295Lu3S0hjuEcVvL5vWZ38ZurLBGXrw2P7x5+V+Jf68cwxU0KZ3ebvq7s9QcsklnqLJ+GFFBQovlFPB+kkJURVHhNMJGAm+v+iUzErh/1KaswovHPCx5OLTK48VGgPJSX8eDWnqG9itF3BDiLBEuX8w+eGxJIek37T2ljBRoUiDjIs2oKJeSl/jmwSRFMHUv1C7eQKVUw7mMRQPcQeSyQbQ7BQSuwNFeV5ySumfftNyEETysNwfOuc8fV53x3kjxeeH0NV5V1p2VLvSc7b+T3CQKuuk8N4qCR5KoUs9
X-Forefront-Antispam-Report: CIP:131.228.2.17; CTRY:FI; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:fihe3nok0735.emea.nsn-net.net; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(82310400003)(6916009)(8936002)(8676002)(26005)(2616005)(36860700001)(86362001)(336012)(70586007)(81166007)(478600001)(36756003)(54906003)(82740400003)(186003)(1076003)(83380400001)(2906002)(47076005)(4326008)(70206006)(356005)(6666004)(5660300002)(316002)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 21:18:53.0191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce135b1-b4a7-458a-fcb9-08d8d389a097
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0; Ip=[131.228.2.17];
 Helo=[fihe3nok0735.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1PR07MB4858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_161858_397566_01D2362A 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

It looks unnecessary in the function, remove it from the function
having in mind to remove it completely.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/mtdchar.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 323035d..f31390d 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -58,13 +58,10 @@ static int mtdchar_open(struct inode *inode, struct file *file)
 	if ((file->f_mode & FMODE_WRITE) && (minor & 1))
 		return -EACCES;
 
-	mutex_lock(&mtd_mutex);
 	mtd = get_mtd_device(NULL, devnum);
 
-	if (IS_ERR(mtd)) {
-		ret = PTR_ERR(mtd);
-		goto out;
-	}
+	if (IS_ERR(mtd))
+		return PTR_ERR(mtd);
 
 	if (mtd->type == MTD_ABSENT) {
 		ret = -ENODEV;
@@ -84,13 +81,10 @@ static int mtdchar_open(struct inode *inode, struct file *file)
 	}
 	mfi->mtd = mtd;
 	file->private_data = mfi;
-	mutex_unlock(&mtd_mutex);
 	return 0;
 
 out1:
 	put_mtd_device(mtd);
-out:
-	mutex_unlock(&mtd_mutex);
 	return ret;
 } /* mtdchar_open */
 
-- 
2.10.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
