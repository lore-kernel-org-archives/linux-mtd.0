Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE879C04AAF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 05:58:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3C8520815
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 05:58:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KNUL7Nyz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3C8520815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfglLSXDvrKcHjcsfnBWBdXT+sZecKalHClpfIcOroQ=; b=KNUL7NyznCzwIk
	15/hHyKNnuL/BdtoAQvl555m7Dwi+jsO545tQBdJH8fXSxs8ZG4iO1Jp5hHF57iCdEbi34c6GQJgr
	pzLuA7gKBLImApxlQnDHn+Oq0+6Acrl3WhQOC4n0r32mcpDm6zySRYjLHVkvFBRxaYa4BLVpnxjNO
	ft+O00ozE6zEYV9C+8Bq3M8qWgDreaZrL92QKf7/udP8WPYitYzk7qxtSEv0rDC6J7EgG+ZI4zuTy
	3g1Auxwtx3udCzMsC1AaQSz4HezSKzVWxhEpJozFafG8fj+YNuIchnGLdL56pT/SUwE466xFT2m9s
	c+a9brmtOjVBkfofbQ8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSbJs-0006c9-1z; Mon, 20 May 2019 05:58:44 +0000
Received: from 089144206147.atnat0015.highway.bob.at ([89.144.206.147]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSbJe-0006FV-Qn; Mon, 20 May 2019 05:58:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/4] mm: don't cast ->readpage to filler_t for
 do_read_cache_page
Date: Mon, 20 May 2019 07:57:29 +0200
Message-Id: <20190520055731.24538-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520055731.24538-1-hch@lst.de>
References: <20190520055731.24538-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

We can just pass a NULL filler and do the right thing inside of
do_read_cache_page based on the NULL parameter.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/pagemap.h |  3 +--
 mm/filemap.c            | 10 ++++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 9ec3544baee2..6dd7ec95c778 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -396,8 +396,7 @@ extern int read_cache_pages(struct address_space *mapping,
 static inline struct page *read_mapping_page(struct address_space *mapping,
 				pgoff_t index, void *data)
 {
-	filler_t *filler = (filler_t *)mapping->a_ops->readpage;
-	return read_cache_page(mapping, index, filler, data);
+	return read_cache_page(mapping, index, NULL, data);
 }
 
 /*
diff --git a/mm/filemap.c b/mm/filemap.c
index 6a8048477bc6..3bec6e18b763 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2772,7 +2772,11 @@ static struct page *do_read_cache_page(struct address_space *mapping,
 		}
 
 filler:
-		err = filler(data, page);
+		if (filler)
+			err = filler(data, page);
+		else
+			err = mapping->a_ops->readpage(data, page);
+
 		if (err < 0) {
 			put_page(page);
 			return ERR_PTR(err);
@@ -2884,9 +2888,7 @@ struct page *read_cache_page_gfp(struct address_space *mapping,
 				pgoff_t index,
 				gfp_t gfp)
 {
-	filler_t *filler = (filler_t *)mapping->a_ops->readpage;
-
-	return do_read_cache_page(mapping, index, filler, NULL, gfp);
+	return do_read_cache_page(mapping, index, NULL, NULL, gfp);
 }
 EXPORT_SYMBOL(read_cache_page_gfp);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
