Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C458C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:37:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248B161242
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 07:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 248B161242
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMVrwZL9msFH8dXLUhjgIteQqqNNaG/6SmjGnEZozUQ=; b=b4fxfBN7jtoTsq
	ZV5p+HVQ1iG1jyfFttr3D0V4rRNYvmkIIwbLss5/thJfiNaVbYdxxNQpnq71oGdBE9zX14tuQNMcb
	48TsPh+tgOsHiBVW9b54L+tvEZzdYfTiXCOa9uLYR9xxhUJUx9sfqGhegpFSYyH++SxLB1IfxgsH1
	FFf5e5CBfGRWAtm30eEw48dQuJQ8oj++rwyOcRPMA3tMFHpUk4/Cl5wv31FgOB4vb89WXKhZDEq54
	P6xwGKjLTYK/Ve+I4PT6XFEOR9bXZIdy+ebiMZF0uU85/El14dF1937B0aNb/47kt/Rda+MokKoHl
	hfSGhdY+GMZWPWTWm4jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI4Vz-00Fkv0-Ki; Mon, 23 Aug 2021 07:37:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4Vx-00FkuB-SG
 for linux-mtd@bombadil.infradead.org; Mon, 23 Aug 2021 07:37:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=yDVJqb52UG/kPc/O2lDZLqU6iuRuPPYbXt2KymxHM48=; b=qw2zPFDKzIICgXNI4UeGsND53I
 r9pL6KIRnBJQNuoCZC7jMThBsfp9Ist8xuRIPNGqtp9zRjSkbyte/Xuk0250mYEwvWF9h1a5GYn5b
 SoIuTcXLbS4LWyD9kNm9SBRHh0Y3Yq7HIhRmZbMpzn07CAsKDrnZ6I7yzt087Js5dYyG5mKFsvcsg
 HIQ+tXh+iJxu5jXPl9q35/qrBtgyTe3GB1oLhah0nToNH1MO6eKq63BAF8PWQQfOGvTQHbVtOeRn2
 +U5r98UBctg75X9A17bbRRNuSj1KKeDp5jKEDDxqyyCkEAcctGiFTUjzoGzFqX6mNt2jmGIEe1L4r
 BbfeXXIQ==;
Received: from [2001:4bb8:193:fd10:c6e8:3c08:6f8b:cbf0] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI4VN-009Qm5-72; Mon, 23 Aug 2021 07:36:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-mtd@lists.infradead.org
Subject: [PATCH 3/8] mtd/ftl: don't cast away the type when calling
 add_mtd_blktrans_dev
Date: Mon, 23 Aug 2021 09:33:54 +0200
Message-Id: <20210823073359.705281-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210823073359.705281-1-hch@lst.de>
References: <20210823073359.705281-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Pass the actual mtd_blktrans_dev instead of casting the containing
structure to void *.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/mtd/ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 9b33c082179d..f655d2905270 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1029,7 +1029,7 @@ static void ftl_add_mtd(struct mtd_blktrans_ops *tr, struct mtd_info *mtd)
 
 		partition->mbd.tr = tr;
 		partition->mbd.devnum = -1;
-		if (!add_mtd_blktrans_dev((void *)partition))
+		if (!add_mtd_blktrans_dev(&partition->mbd))
 			return;
 	}
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
