Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6ECC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 07:53:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E4B610A3
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 07:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E4B610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4hyQFr0RzFGWPWVvx3YKxctuj1Hny3XC37l0TPoHnPc=; b=G7jOdVssFvyOssA2RyHX1TamoP
	FOtDJ8AcWDVvb7waJ+EQD3xyeJgwLq1ngeUJicURQUem42/W9NQAUpg6vubpfcIIZ7jjCTrFqLfZY
	oCQXwHDpwWVmOzBNXDhLa5MfYP08iYCxcD4jd3fwiMJPezElXPsZy2vg9eEd9Eo7oG5+2xTXU0zTR
	Di+s4yrrTO9uiQWV2bAo1A5vvLlkuM/mFSVuuJvLOb1k2rYTTf+uk52q0SBmUZ8f4RqsTZnlal4up
	88pWs5yKCvbkLUroLHZU9kOnLnTVWudYXE1NMtfWkNp2k783QbniL6u4uc5PpN5e6nEq2kCdfS+l3
	oTKMplng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUltM-00AUxR-Mh; Fri, 09 Apr 2021 07:49:24 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUlsJ-00AUpF-6B
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 07:48:21 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGqtC24kXzpWrF;
 Fri,  9 Apr 2021 15:45:23 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Fri, 9 Apr 2021 15:48:00 +0800
From: Luo Meng <luomeng12@huawei.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>
CC: <luomeng12@huawei.com>
Subject: [PATCH] mtd: remove unneeded return statment in mtdswap_write_marker()
Date: Fri, 9 Apr 2021 15:56:22 +0800
Message-ID: <20210409075622.2111788-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_084819_514915_04711FE0 
X-CRM114-Status: UNSURE (   7.50  )
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

It should be impossible 'ret !=0' and 'ops.oobretlen != ops.ooblen',
So remove the unneeded return statment.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 drivers/mtd/mtdswap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 795dec4483c2..12bacb4ae9de 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -398,12 +398,10 @@ static int mtdswap_write_marker(struct mtdswap_dev *d, struct swap_eb *eb,
 		return ret;
 	}
 
-	if (ops.oobretlen != ops.ooblen) {
+	if (ops.oobretlen != ops.ooblen)
 		dev_warn(d->dev, "Short OOB write for block at %08llx: "
 			"%zd not %zd\n",
 			offset, ops.oobretlen, ops.ooblen);
-		return ret;
-	}
 
 	return 0;
 }
-- 
2.25.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
