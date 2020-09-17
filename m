Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5E3C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7793A2078D
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IsXqYilu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UY+WWn03"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7793A2078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MBzZeh5iB9hH5thU0a9dcpiN/J0wIBudBVVSvEZc8SU=; b=IsXqYiluTMgOJCsDTi8ubqVfR
	Si9KRHsK/H9CAlG/A6c0RZ3MpauGr1GJsbGo6e8XMXUSUIuS0FEDPH+Je25pOMC7dphoYdp9UbiY5
	/FsbRyrXgda3RjVIi7+Ci2C/47WaQGkttjEsb+OCjU1pcQKGRT301ND0kQog6klhRL5iZcoa9v1Gz
	s7S+kJDmRkCCYV5/1pdeA6bgOi9E1phXtACPB6ddQILGMD/mbOQVIxDPVS+b9Y4xkAwhK1kPupK3D
	7rU5XPzw3UPFwObUYzUrffxyVMjph5ZjF5AEGiIRPIwQoo23cbYxNnt+7gvEhh/8YZ7z5zmkfX2eG
	MOl0GWV3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIvZC-0000LU-Tc; Thu, 17 Sep 2020 15:11:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYk-0008Ul-Qs; Thu, 17 Sep 2020 15:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=jmv1iA6ONHdhBCtewTigT8o0CWZcxoZXOX5KqmVgnTU=; b=UY+WWn03vEnSCFKL2cQHuVM2i1
 QWe+kigsY5nChj3dZW/h0aA6t4GCygWRYiPrbLnPJyTb6ae0uBq7cwL0EVmUXxakpgq2oapyhxDVe
 kBTCeumlVxnjVbvMWT8TED6H5Lcw3uow0f5XM1VjF7pOlh95YVKHtIN/5KguGYPRny3fc7WmToepE
 6Jv3+/5X4HTO12zMC+BPVGhiLP9iGEug/FLiAS+EZQ5RUi5fhnhqUz6TLDBMJmQh4+piAUkJgSqEP
 GBPJGhPkoKX4qDNExrVMjUWBmj38ZJGRM5eAJLVtOUR4LK3uM6CBTW568DQXcnfRhTgPg5qDs7lV7
 kS4OBj7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYj-0001Pz-KI; Thu, 17 Sep 2020 15:10:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 07/13] ecryptfs: Tell the VFS that readpage was synchronous
Date: Thu, 17 Sep 2020 16:10:44 +0100
Message-Id: <20200917151050.5363-8-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200917151050.5363-1-willy@infradead.org>
References: <20200917151050.5363-1-willy@infradead.org>
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The ecryptfs readpage implementation was already synchronous, so use
AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/ecryptfs/mmap.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/ecryptfs/mmap.c b/fs/ecryptfs/mmap.c
index 019572c6b39a..dee35181d789 100644
--- a/fs/ecryptfs/mmap.c
+++ b/fs/ecryptfs/mmap.c
@@ -219,12 +219,13 @@ static int ecryptfs_readpage(struct file *file, struct page *page)
 		}
 	}
 out:
-	if (rc)
-		ClearPageUptodate(page);
-	else
-		SetPageUptodate(page);
-	ecryptfs_printk(KERN_DEBUG, "Unlocking page with index = [0x%.16lx]\n",
+	ecryptfs_printk(KERN_DEBUG, "Returning page with index = [0x%.16lx]\n",
 			page->index);
+	if (!rc) {
+		SetPageUptodate(page);
+		return AOP_UPDATED_PAGE;
+	}
+	ClearPageUptodate(page);
 	unlock_page(page);
 	return rc;
 }
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
