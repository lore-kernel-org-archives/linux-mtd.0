Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962C6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 05:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4awYs2JtWRTkzgwQ2mAjEwR4AUZ/j3NA8hRzTjE0KbM=; b=qQCt4DLYOVrVfA
	Ww5l5mzcFdcvzWkWi4wZumY/jxCoC37FXtyC/iMk0glZH9nyqavHtBYT47HXs+MlQsBGS5NcGBhDO
	96khbw5c0gBYIl/NqvizSnqnKSpW37X+rfen9QiJxzGpTujEyQeRW5RxvmOdRIqgiiyS/cXOlrXFU
	4sEmz3TOI4jwlyAZ9vN+ctBsm7FQA5YAssk6X7xanwfnpFwF0Yb+KvyEkcVXEqDv5xPKmNF70KSsQ
	qnDf5xLpqG7lRuHtXuJ2MMGgMLshJXhViNMMgP7KPptV3pWWA4YUcn3IelYz07tNuoZ6TZZp6pCad
	iO8WCdokMUcAmblM1m/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlOp5-00Hak4-Nq; Mon, 02 May 2022 05:42:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlOp1-00Hair-CG
 for linux-mtd@bombadil.infradead.org; Mon, 02 May 2022 05:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=vlN2HcnECiY2e6tZKUSRm49KVG3UlkoH2PCURMTgL+I=; b=PYoWeoEmvkFY2pnSHECNrTnbFa
 gYgxdKxwGxpknMRzz6Y8P0J4dI3MoHWm13mgoHmJcxbi+swiK0C31n/Xkc7iZ0TUdkYLXmgHJRzya
 HdGM4m8iSPaT9WZ+m9rtWtELH31PLdqIGeG8Cx68Ma/xC8dv56buH7D9P1kFKMQ1Ol4MSr1dxWuUu
 RVxUHwcDQDwx3XuTrEvNtdtOWuxoQBSLZvHGWfUTbFudk6+H7LR0pgq6HoJbiHpa9iQ4lrUvlpWvF
 Bhfp9s6AvuzvLo25J1dI68WNDJVbFWXGvA34wy4CE4GqIFwHUcvB/GghFM9MXiquNoaCYFsZ8O5BI
 3P0zbZFw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nlOot-00EZ03-Sh; Mon, 02 May 2022 05:42:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org
Subject: [PATCH 2/3] nfs: Pass the file pointer to nfs_symlink_filler()
Date: Mon,  2 May 2022 06:41:58 +0100
Message-Id: <20220502054159.3471078-3-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220502054159.3471078-1-willy@infradead.org>
References: <20220502054159.3471078-1-willy@infradead.org>
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

In preparation for unifying the read_cache_page() and read_folio()
implementations, make nfs_symlink_filler() get the inode
from the page instead of passing it in from read_cache_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/nfs/symlink.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/symlink.c b/fs/nfs/symlink.c
index 25ba299fdac2..8b53538bcc75 100644
--- a/fs/nfs/symlink.c
+++ b/fs/nfs/symlink.c
@@ -28,7 +28,7 @@
 
 static int nfs_symlink_filler(void *data, struct page *page)
 {
-	struct inode *inode = data;
+	struct inode *inode = page->mapping->host;
 	int error;
 
 	error = NFS_PROTO(inode)->readlink(inode, page, 0, PAGE_SIZE);
@@ -67,7 +67,7 @@ static const char *nfs_get_link(struct dentry *dentry,
 		if (err)
 			return err;
 		page = read_cache_page(&inode->i_data, 0, nfs_symlink_filler,
-				inode);
+				NULL);
 		if (IS_ERR(page))
 			return ERR_CAST(page);
 	}
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
