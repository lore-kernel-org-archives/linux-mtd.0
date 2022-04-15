Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A21C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 00:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ypcWw3uUOZvAaLMOSEbf6q3wvItq/EuIRmLN4XWkuYU=; b=gT85X6qvJ76G2LNC9ZwQX1139m
	YWSOXTCIcZpLVwBH046+KVUVnXyrC4fkpw1xhAOoAxY1eN5lWjIi5cw4H7HuAycKY1zAq22vKqcgA
	9HQ6C3W79aEbj374pFjo6fdhKm5biIToFcXDm9lyPOAnYF5FlCJjnzUzB6H5g7USF9TVALHNZTyRJ
	6ATngQW3LpNWCp2zTpw/7B5eV9o71mRLqI+0AqqpogVskdN9jgYQOslYwEQ7qP2whoLq7W9WFYi+L
	SSumPb9LYvYm+8jDJgRCkyt10p6cRFTidtWCbYgDAHiNSYYC1eBKvLSTCfwzDKGID1RR7DYQaOrDE
	ey0ZyLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf9bE-007reQ-Dj; Fri, 15 Apr 2022 00:14:08 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf9bB-007rdW-OQ
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 00:14:07 +0000
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2ec12272fb2so55070507b3.6
 for <linux-mtd@lists.infradead.org>; Thu, 14 Apr 2022 17:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=XrMml7qKUkK/vfRO+Yh9HesyPHxDc4iM4I0XZDhBTs0=;
 b=NOCt70nhWy1emhIvsudKXkm4pJsO2JlwqpGNAW593FYdxY46MUU9gMxIC1thIfmwFq
 2yJTcFGDzWQLAn1FLyW19CMYYSsnhqt4HASAriTHBwL5szrjXnClfPOhyi1ozVCQ/YC+
 cN896HhGn0hf55j8WigJsjtz3EBg8p0sAwhg9rJsEd2rneuZ2gbzhOyCIADBu5eN5/j8
 Yd8JxQlSC8Q0VVyGq1jqAoE5UH2XrRzFbcHO08wxLp2xhklKU8jW6cvU0hWfqXOyTynp
 ltgIvcpB7DLWiXOJJsQBVKG1MZ3XRsLZrghodhDc8qNSCvH/o+HnDlz2LPIjPFm9XYHe
 d9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=XrMml7qKUkK/vfRO+Yh9HesyPHxDc4iM4I0XZDhBTs0=;
 b=mmz46XEnQw0Y5qydN7QXb91dk1dkb3nadyrpWDIRPhTjfsqrsvAIHsUMrVBj8QKrtP
 3fSROkPFZaT7SIcCwmbUvq6nx131ifvsl+fi9h3OcWLjKhEsfiv/3QvFHYOuM5DAy61R
 vdo9y5H8FrMngLl68oUZD3zs38BjOHZn33+rvxaIXhGp/5X3HGTEkuBhcTbqkcc9zOgY
 0zVTm3Ue1HIIkhM5BzpLzIfqpm2FeVC1PvTfk+IEIVbI+O7CAtXArcRPd/7z43owCzV2
 RMXJH1CaQo7vUcYyyULaJig71vDMrjR2zWV+wBeaIND0Y/onQT6yKM7CC6G6UqCcpGDO
 jh7Q==
X-Gm-Message-State: AOAM531E85GZpeh/EUPq8UryWXH78TW7kA37FS4hFJBoLbRxy0mmfOnZ
 n8Ii8UksNNkWyZeI/hWgFyy/ELhEPrLR
X-Google-Smtp-Source: ABdhPJw6OIlBScgMItG1ez9NzljktXTkxPDeFx6Lr0saWhpnJFjwgeDN+52OvPjR0WJONlvR/kqFmQ7v1Pyg
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:7d77:8cae:9dfe:95c])
 (user=jmeurin job=sendgmr) by 2002:a5b:8c8:0:b0:641:e8de:a6f4 with SMTP id
 w8-20020a5b08c8000000b00641e8dea6f4mr3814847ybq.533.1649981644388; Thu, 14
 Apr 2022 17:14:04 -0700 (PDT)
Date: Thu, 14 Apr 2022 17:13:19 -0700
In-Reply-To: <20220415001321.252848-1-jmeurin@google.com>
Message-Id: <20220415001321.252848-2-jmeurin@google.com>
Mime-Version: 1.0
References: <20220207163409.19c3bc4c@xps13>
 <20220415001321.252848-1-jmeurin@google.com>
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH v3 1/3] mtd: mtdoops: Fix the size of the header read buffer.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_171405_831128_C01971C7 
X-CRM114-Status: GOOD (  11.41  )
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

The read buffer size depends on the MTDOOPS_HEADER_SIZE.

Tested: Changed the header size, it doesn't panic, header is still
read/written correctly.

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 227df24387df..09a26747f490 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -223,7 +223,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	int ret, page, maxpos = 0;
-	u32 count[2], maxcount = 0xffffffff;
+	u32 count[MTDOOPS_HEADER_SIZE/sizeof(u32)], maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-- 
2.36.0.rc0.470.gd361397f0d-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
