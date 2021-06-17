Return-Path: <SRS0=jwHe=LL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F3EC2B9F4
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 13:38:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B435E613CB
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Jun 2021 13:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B435E613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nSrHcz9wXV0ObLXdANIceGZi0enqvYs03AyUR+mpL98=; b=r/AhPdBgM6Tdw5
	UYPi0Tnj85agHPuLH7ozUKdRtZHKn3xkana3hxBFZp9IE5aGoSwr6Rk2g9A/s96YiX3pXEYhbv21i
	6jNhBEXCWoS6CKCXnyJIDbhaVxhZT1Ce0w0di0g4NroD390MyvDku7DnDcA9q9SLC+xpLGE7R5Tle
	HbTdJMnAyp64v8YZNN70yun4/u0H7XxudNuh0B8qixyOMQSAB2dyZWmEwotXaUoswCuPTdgzfg+nG
	0Lx7detXnYxHhBpuyXCiz5l/TLRNtCQJ0IZj3DanxPQBCFyIQLwyQ8ubKs67gGTb8BQio3RyxeCuy
	7EZmSsuBT+Puxa/Aswpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltsDU-00AX29-9I; Thu, 17 Jun 2021 13:37:56 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltsDR-00AWzR-H0
 for linux-mtd@lists.infradead.org; Thu, 17 Jun 2021 13:37:54 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HDVavx028406; Thu, 17 Jun 2021 13:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=zE3j2Enhao1E66i+SdrltR4Eo5w6687dBGPeyUl6wBs=;
 b=CPMGPUci7B8uu9qqTaMRA12RxKpKBlk/lMDV2c40s72SN18lJ/TulHMd5KmwwRS2vrKp
 b7S8pvBdicZ1ZuiDUwmZYSuHSOVYPjJUxTG+yc/s90/WbFOtvTUjke+7LcYwOxH/uesW
 BvRe2uqMns4oM1ie/MoJl+gB9D9Q7p5D6pzKYQv4L/1WupiXmL8eCtbZ3cl3cObnHyi9
 qNowM1QMzk/usCW+kfFZvB+0cKwOsxTZ2LxEy33N9Jg9gPAVlP/EpU4wcyQuZSZztX48
 +9vaDJMrP7qTgjgJvyu5Ilh7f+RraLa5Pl4uNzE1yVk8NYyd4aMUUajrKzLsu91K/1Wy rg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 397w1y13jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 13:37:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15HDUuB7102021;
 Thu, 17 Jun 2021 13:37:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3030.oracle.com with ESMTP id 396waq5ym0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 13:37:44 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15HDUtlk101912;
 Thu, 17 Jun 2021 13:37:43 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 396waq5ygf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 13:37:43 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 15HDbYkg005013;
 Thu, 17 Jun 2021 13:37:35 GMT
Received: from mwanda (/102.222.70.252)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Jun 2021 06:37:33 -0700
Date: Thu, 17 Jun 2021 16:37:25 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: rawnand: Add a check in of_get_nand_secure_regions()
Message-ID: <YMtQFXE0F1w7mUh+@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: y8_E4bor5i1y9sjIhzYPGkMtqm2sB-xz
X-Proofpoint-GUID: y8_E4bor5i1y9sjIhzYPGkMtqm2sB-xz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_063753_721606_7AFA71F0 
X-CRM114-Status: GOOD (  15.17  )
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

Check for whether of_property_count_elems_of_size() returns a negative
error code.

Fixes: 13b89768275d ("mtd: rawnand: Add support for secure regions in NAND memory")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mtd/nand/raw/nand_base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 57a583149cc0..cbba46432e39 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5231,8 +5231,8 @@ static int of_get_nand_secure_regions(struct nand_chip *chip)
 	int nr_elem, i, j;
 
 	nr_elem = of_property_count_elems_of_size(dn, "secure-regions", sizeof(u64));
-	if (!nr_elem)
-		return 0;
+	if (nr_elem <= 0)
+		return nr_elem;
 
 	chip->nr_secure_regions = nr_elem / 2;
 	chip->secure_regions = kcalloc(chip->nr_secure_regions, sizeof(*chip->secure_regions),
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
