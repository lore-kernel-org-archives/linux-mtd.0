Return-Path: <SRS0=gt70=JF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1120C433B4
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 14:19:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66A1A6024A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Apr 2021 14:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66A1A6024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6Q+9torZgGN8XLx6ce5gdRYOhvrmlEt7EtMy45HUB0=; b=KBi4H7ScIGEGy8
	4/y1biF0wyh1amgBG94VDo6AdvmgmY1+CmwAYogqAxYoTotwXR8I2ud6m8xTcDFBNqVLcVj51DH37
	Qdsk5kRekRsm4YmhmSyNH2g22GgmCWx4xOb3nvNI+m8A8GfFpJiQKD/DMTCt5RNWvuT+8iDv48OFM
	4Tml8sYK2lIhHBMxnOyMOQORa9xSXMRn4vB+3zWC6Rn5ji6qL9vIaUjenv4bvEPoH8OKB9S3NBbcp
	oOikkMUWI4EUCdutjANXqRtj1aJdXT6hABpZTvdbxJHHIM2U/iEXA5j2loiD0DozpCZ/lAc3v4YQ9
	K4srm7qBBxVlRVbuKDKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUVV7-008Ebv-3h; Thu, 08 Apr 2021 14:19:17 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUVUt-008EZ4-4u
 for linux-mtd@lists.infradead.org; Thu, 08 Apr 2021 14:19:05 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FGNc22wz5z9wy8;
 Thu,  8 Apr 2021 22:16:34 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 22:18:37 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <zhangxiaoxu5@huawei.com>, <yukuai3@huawei.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd: mtd_oobtest: fix error return code in mtd_oobtest_init()
Date: Thu, 8 Apr 2021 10:24:13 -0400
Message-ID: <20210408142413.748040-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_151903_844556_05BDA920 
X-CRM114-Status: UNSURE (   7.86  )
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

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhangxiaoxu 00467499 <zhangxiaoxu5@huawei.com>
---
 drivers/mtd/tests/oobtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index c71daa89bfce..590d619d2760 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -701,6 +701,7 @@ static int __init mtd_oobtest_init(void)
 			       (long long)addr);
 			errcnt += 1;
 			if (errcnt > 1000) {
+				err = -EINVAL;
 				pr_err("error: too many errors\n");
 				goto out;
 			}
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
