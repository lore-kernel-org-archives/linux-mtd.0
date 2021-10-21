Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73545C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38CFF60F46
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38CFF60F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZPI9f+kJAOAxI2Vjp1aYln+GD3RE8cnAm+44661rRi8=; b=y+0nZuV2I9bnrL
	Yi1dfpD23xB2DMrKSVrD7JyPXgQ7J3wb/V/TruzEDtF3uRat9ZpV66CGkasGAmGfGsKcUUweGjnFS
	hl4dqkt4m8OzKXaUkUgGwbn0q7PxTzMJtOSgj6FnspXhiaG6gLLgfHN8/EV4tGBqwcjvfQ7LKedBF
	JY91JBxPihMKtEmQT6jnZpRXO2+PltVJr7CpSvx1XidJu5PTxoFehNFLxfhbb0M/geQszojbFqEkQ
	6P15qSxJ5rrWa5er3HTABsWrkt/Ib7V+WqWMmT137KR9O2hnsiDdqHYGjygLxy3zAcwlLj2+FTg5A
	0vxdM0oqQXRBRpoet3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXS2-007XHK-9d; Thu, 21 Oct 2021 12:45:42 +0000
Received: from [2001:4bb8:180:8777:dd70:8011:36d9:4c23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXRI-007X0C-RZ; Thu, 21 Oct 2021 12:44:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jan Kara <jack@suse.cz>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 4/5] mm: don't automatically unregister bdis
Date: Thu, 21 Oct 2021 14:44:40 +0200
Message-Id: <20211021124441.668816-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021124441.668816-1-hch@lst.de>
References: <20211021124441.668816-1-hch@lst.de>
MIME-Version: 1.0
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

All BDI users now unregister explicitly.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/backing-dev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 8a46a0a4b72fa..768e9ae489f66 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -965,8 +965,7 @@ static void release_bdi(struct kref *ref)
 	struct backing_dev_info *bdi =
 			container_of(ref, struct backing_dev_info, refcnt);
 
-	if (test_bit(WB_registered, &bdi->wb.state))
-		bdi_unregister(bdi);
+	WARN_ON_ONCE(test_bit(WB_registered, &bdi->wb.state));
 	WARN_ON_ONCE(bdi->dev);
 	wb_exit(&bdi->wb);
 	kfree(bdi);
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
