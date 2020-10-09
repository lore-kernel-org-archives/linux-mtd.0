Return-Path: <SRS0=ARza=DQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696E7C43457
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD012226B
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2020 14:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y4mJJprc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OpgwA4h4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAD012226B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/okJ2NPbSUEwVgLa0o4M2+QczyddZYRzb1w/5uw8FC0=; b=Y4mJJprcNNt4dcEWS/lxJqXg0
	DtFsCE/WiUh1VXx4OIn83iMqqodA3bkA07Tvi7IPCPKuOEYfB6EjkMgfML4A7k8lALhbtCJdsojZE
	rz43LLTtss3J1jdbNg5ebj8nDtcyyIwLOQum/0Z+bxcClLumx/wAP/5ZM9lRHgs8NMFe+cR8i+FNX
	KGIN1xriDB4PRseXuV+hMeJuX12qphEIlAR7UBTcPBTnvz01oBD+tIpHMgb8pSZuqMgicaR+l5s0U
	PZmBrP4JTDkzX4VGB0i3Ms6Lqn1xay3G7T+VASb2nXLP+QI7A96iterzvggniWdiKN6l0+I8Ruw8f
	cLYKFTgxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQtQN-0003Mo-AZ; Fri, 09 Oct 2020 14:31:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQtQJ-0003LD-Vc; Fri, 09 Oct 2020 14:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9pnCDQD7BT3wSOEmQ/ujAa+Hm2ir7A48RB79T7IxK0Q=; b=OpgwA4h4sqP1jU/IETGKZCdM+Q
 i2z3mUNTVaNMrPcKu/kIEUukM1dt974qFSZx4F1PJP3u9M1SgxVKgcIonjd/aNrK8oJYJJN4oHRk1
 obdU0/M9Ik9JMH/nzkWE8D3yho4lKnaBpftYWxPJpDwLQo52xiQnfV7kpYc8EtYGLGmDorJ9y8V5N
 CJcX+ugzQELTPBZdvOkJejfwb3L1y6UeR3FiWZL/sICMMOlGRRiA2qGYtu0wV9jkbIzwzA2oq/dOd
 H5aqicfp9nwOgncn7C7ET7kxAk5rWlkDprT8RSZwKu9U+B7N0o7spekfqopBUVo/2X+R5nO4vA99R
 nxNxhJxw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kQtQI-0005uX-P8; Fri, 09 Oct 2020 14:31:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 02/16] mm: Inline wait_on_page_read into its one caller
Date: Fri,  9 Oct 2020 15:30:50 +0100
Message-Id: <20201009143104.22673-3-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201009143104.22673-1-willy@infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Having this code inline helps the function read more easily.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/filemap.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index 95b68ec1f22c..0ef06d515532 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -2834,18 +2834,6 @@ EXPORT_SYMBOL(filemap_page_mkwrite);
 EXPORT_SYMBOL(generic_file_mmap);
 EXPORT_SYMBOL(generic_file_readonly_mmap);
 
-static struct page *wait_on_page_read(struct page *page)
-{
-	if (!IS_ERR(page)) {
-		wait_on_page_locked(page);
-		if (!PageUptodate(page)) {
-			put_page(page);
-			page = ERR_PTR(-EIO);
-		}
-	}
-	return page;
-}
-
 static struct page *do_read_cache_page(struct address_space *mapping,
 				pgoff_t index,
 				int (*filler)(void *, struct page *),
@@ -2876,7 +2864,10 @@ static struct page *do_read_cache_page(struct address_space *mapping,
 			err = mapping->a_ops->readpage(data, page);
 		if (err == AOP_UPDATED_PAGE) {
 			unlock_page(page);
-			goto out;
+		} else if (!err) {
+			wait_on_page_locked(page);
+			if (!PageUptodate(page))
+				err = -EIO;
 		}
 
 		if (err < 0) {
@@ -2884,9 +2875,6 @@ static struct page *do_read_cache_page(struct address_space *mapping,
 			return ERR_PTR(err);
 		}
 
-		page = wait_on_page_read(page);
-		if (IS_ERR(page))
-			return page;
 		goto out;
 	}
 	if (PageUptodate(page))
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
