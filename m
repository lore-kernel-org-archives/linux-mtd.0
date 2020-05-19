Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E19D9C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:12:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89382081A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 13:12:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pecf68A2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B89382081A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jTl8+bmwfU4UyWf5C09rMov1YR8xL7VZhuNq9eM05wg=; b=pecf68A2hgg2hT
	3QvRCQMLw7QmfV7uujb8fdfTbhsJ1/JHSuXd62JSUHmsL3kGNzuooJLCCnNLeRg9lwjaGPYOErakv
	5JmzKDFWgwsxWsPEMzkHu9sK6NWr3gLGrLqJqYZaOQE+EjTDs2puFsQutrRUCN25pga5qLjTNRZLl
	lxyP0llZ2xUa0bevux/fzS3qYbgZInoHE+h3fcjFYlqzyZK+tqabmiOsknsLc8FEBOhCWbP4jAapU
	MVA4zeNBxnviHRmijZRffRu7rmiZJnBsI5eRn6ykf7vI8t3hVfAZaeFEeQbGrhyOLyH/5bndo4F6O
	ziUmMrE48nLHbGIaspsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb22w-0000FP-Ee; Tue, 19 May 2020 13:12:38 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb1rm-00026L-Mn
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 13:01:11 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E9C1FFF80B;
 Tue, 19 May 2020 13:01:04 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 46/62] mtd: rawnand: s3c2410: Stop using nand_release()
Date: Tue, 19 May 2020 15:00:19 +0200
Message-Id: <20200519130035.1883-47-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200519130035.1883-1-miquel.raynal@bootlin.com>
References: <20200519130035.1883-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_060106_902704_06025D9F 
X-CRM114-Status: GOOD (  10.44  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This helper is not very useful and very often people get confused:
they use nand_release() instead of nand_cleanup().

Let's stop using nand_release() by calling mtd_device_unregister() and
nand_cleanup() directly.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/s3c2410.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 0009c1820e21..f86dff311464 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -779,7 +779,8 @@ static int s3c24xx_nand_remove(struct platform_device *pdev)
 
 		for (mtdno = 0; mtdno < info->mtd_count; mtdno++, ptr++) {
 			pr_debug("releasing mtd %d (%p)\n", mtdno, ptr);
-			nand_release(&ptr->chip);
+			WARN_ON(mtd_device_unregister(nand_to_mtd(&ptr->chip)));
+			nand_cleanup(&ptr->chip);
 		}
 	}
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
