Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79F5C61DA4
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Mar 2023 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=grbAKGKJ9q3V/17xVdSjC7juswxKrbV+lO4BD5fgsZw=; b=RcpgngGKbCyS0M
	NCwV+pQ7PEewY/ILa2CteINHR44zk3I29bjVkv9L4sZcrEZ5ZP+cMhoxi0ES4umPlhtH7Y1/N/rXa
	MH/yDwv4kLP0pijitoTy7jrYp+LJnmEezGCwUk4d4oPBZ+DD6K00EGIBvmV2MNYRRhtFDGWAeyiMw
	jwjAHKl36Le+bIgPvDkzOoxUrL1J54NkAfdqInEOT30hw/R9DuBHUCZSGH9+5i/G4EGbW+hFF/SAx
	TctJAtO9RDh0vOfYygffv3fJTwy+Rdp31UfcG/h+4vWdlkNVcDS75f8RTx4r5GqOdQPzc2bTvwkJD
	2DAgMUQPTHmwm9KWAvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pavY7-0003Uz-Sv; Sat, 11 Mar 2023 09:29:59 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pavY2-0003UV-PE
	for linux-mtd@lists.infradead.org; Sat, 11 Mar 2023 09:29:56 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E617961989E6;
	Sat, 11 Mar 2023 10:29:50 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 3g_el_QkYBeq; Sat, 11 Mar 2023 10:29:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id CA1EA61989EA;
	Sat, 11 Mar 2023 10:29:49 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 0uJFQxCAaqwE; Sat, 11 Mar 2023 10:29:49 +0100 (CET)
Received: from blindfold.corp.sigma-star.at (089144204221.atnat0013.highway.webapn.at [89.144.204.221])
	by lithops.sigma-star.at (Postfix) with ESMTPSA id 03ECF61989E6;
	Sat, 11 Mar 2023 10:29:48 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Daniel Palmer <daniel@0x0f.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH] ubi: block: Fix missing blk_mq_end_request
Date: Sat, 11 Mar 2023 10:29:29 +0100
Message-Id: <20230311092929.2827-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_012954_989698_4361B408 
X-CRM114-Status: UNSURE (   9.33  )
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

Switching to BLK_MQ_F_BLOCKING wrongly removed the call to
blk_mq_end_request(). Add it back to have our IOs finished

Cc: Daniel Palmer <daniel@0x0f.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>
Fixes: 91cc8fbcc8c7 ("ubi: block: set BLK_MQ_F_BLOCKING")
Analyzed-by: Linus Torvalds <torvalds@linux-foundation.org>
Reported-by: Daniel Palmer <daniel@0x0f.com>
Link: https://lore.kernel.org/linux-mtd/CAHk-=wi29bbBNh3RqJKu3PxzpjDN5D5K17gEVtXrb7-6bfrnMQ@mail.gmail.com/
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/block.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 1de87062c67b..3711d7f74600 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -221,7 +221,10 @@ static blk_status_t ubiblock_read(struct request *req)
 
 	rq_for_each_segment(bvec, req, iter)
 		flush_dcache_page(bvec.bv_page);
-	return errno_to_blk_status(ret);
+
+	blk_mq_end_request(req, errno_to_blk_status(ret));
+
+	return BLK_STS_OK;
 }
 
 static int ubiblock_open(struct block_device *bdev, fmode_t mode)
-- 
2.26.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
