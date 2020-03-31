Return-Path: <SRS0=nWl7=5Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D30C43331
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 15:43:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BBD720786
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2020 15:43:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p5ICVWrm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NJes9/vL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BBD720786
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A9ZnFjPsLVBeW5pGYWaGOersFox7g1hRRNnuvaMpH5c=; b=p5ICVWrmz+CTPq
	SCsVgezKl1hTdBCzXFDzClwGfIZr/oU+zBuLoWESx1Up72q8MdCr/7hTctfu6Ex0kLc3nZ7UgekVh
	t97ZySpd3b9BevCooCs4n10Jkq8Ly1cVdiG0JXsxvvHUb9N7v8VZnUVDbPS8VXmt6tASkOPtsno+b
	TJ1xq0KpYxE9tqGlpv43m3ccGd7qWPMNoXA6mBrbu7J3lRsKjguHJZollWsswlaUn/aCyfgPHMPr2
	P8/uZH7vdei+n7ywb+jE0se//WCFT56VVHdicbUpURns66YnoTG/vz38r7IpThHhmKTcjjqBA3Fm2
	Z2o5QFAEnALZQmGGwJKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJ37-0000Hr-Vv; Tue, 31 Mar 2020 15:43:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJ1Z-0007jn-3c
 for linux-mtd@bombadil.infradead.org; Tue, 31 Mar 2020 15:41:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=IWFEd0Q6ENs84s53fm1VWC6N3uZNrg9BQ1HtZRG3ALw=; b=NJes9/vLJP91uzucYVYA/mNqnw
 HzaVV2o3Hh9kDvohwDiRJULCT1QFID62tz5TqUlG6bhcGkOWLWBAZFQsFK8dVfef6KtHJdcIRo6Iz
 exTcMdO95TjJJjoGryz4KDLrSdfVhtM+Bl25SGG4/WM41HVkAgwd5wnIFzATVvyxxYmBKN+0XAchb
 Q7FnuYz5XIEi8BhmqVgu8J7Nt+q5LF9OQ1c8MRXxthUEIT3/2grJsLM7MLOmPALJG+0JoL8vdQkXL
 GtdHMvbzJb6n8DtUSlVzHw7qcQdAmzMXDnjVE5wvh6FVSZ958ZVDJ2SSNfjKosv0/J1h9+WcJ6vgt
 Aub4gyZQ==;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJHDh-0002B3-MO
 for linux-mtd@lists.infradead.org; Tue, 31 Mar 2020 13:46:25 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 11B89524D0F547E693DB;
 Tue, 31 Mar 2020 21:45:45 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 21:45:38 +0800
From: Yicong Yang <yangyicong@hisilicon.com>
To: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: spi-nor: Add s25fs128s flash info
Date: Tue, 31 Mar 2020 21:41:51 +0800
Message-ID: <1585662111-4972-1-git-send-email-yangyicong@hisilicon.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_144623_628013_F7D90D80 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: linuxarm@huawei.com, yangyicong@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Previously s25fs128s is not in the flash info list, and is decoded
as s25fl129p1 by mistake.

Add it in the flash info list to correctly decode. No functional
changes. Further capability of the flash will be parsed from bfpt.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 739fba1..0a8c57d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2678,6 +2678,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
 			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
 			SPI_NOR_HAS_LOCK | USE_CLSR) },
+	{ "s25fs128s",  INFO6(0x012018, 0x4d0181, 64 * 1024, 256,
+			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fs512s",  INFO6(0x010220, 0x4d0081, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
--
2.8.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
