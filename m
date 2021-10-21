Return-Path: <SRS0=KyYR=PJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF12C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:45:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A100260F02
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Oct 2021 12:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A100260F02
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=btab1Z72B1j8eslIBiknsTSBbAzTZKT4YpaEFtBw3ZA=; b=LX8F5yZBdRe6Nn
	+7kCeX8lkxJQom53fqOhAYoDZRBK2GusMJYqSmO0jA0A1go/0Fyh0taYY4Zb9tSw8Vv3XXYzAedL3
	7h1cOKJlnc/ihYG0T7Prv5aDuAhZyUwa65UoCKHtj1wxkTDUcLytoLhwIvC9ZXA1n3uE1wFSj7tKv
	A7ViJm3fwWIcFa8Hq2Pgei8xFKiB3rGje0/I3tXBKc4pLKXQ1D2HG1TQQO4W3YZ+BQkDqzqwWflNo
	3GlvWK2yn+q17TtyjrEfb4W+a412xKfk5WWCugjJX1DoYRRY7jK59urIAgmuyX37lmhfRtv6MGH4u
	VFQxoFtxVgcIqOol/MfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXRM-007X2v-I0; Thu, 21 Oct 2021 12:45:00 +0000
Received: from [2001:4bb8:180:8777:dd70:8011:36d9:4c23] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXRA-007Wxh-Qs; Thu, 21 Oct 2021 12:44:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jan Kara <jack@suse.cz>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 1/5] mm: export bdi_unregister
Date: Thu, 21 Oct 2021 14:44:37 +0200
Message-Id: <20211021124441.668816-2-hch@lst.de>
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

To wind down the magic auto-unregister semantics we'll need to push this
into modular code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/backing-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 4a9d4e27d0d9b..8a46a0a4b72fa 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -958,6 +958,7 @@ void bdi_unregister(struct backing_dev_info *bdi)
 		bdi->owner = NULL;
 	}
 }
+EXPORT_SYMBOL(bdi_unregister);
 
 static void release_bdi(struct kref *ref)
 {
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
