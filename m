Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C97C27C79
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2024 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1059KuNHJWouygAl0kv6w4AoNunzDpqiBxRHtrTlRGM=; b=D2FIPr+yXd8Ncj
	pnZ9pjnJzIWpOWS7xnoeOiwQIKi1662xxL57HStQ+Vr8Tafohp/l2UisPZZzOnP07D9jfR1n4izRx
	kAng8av1lCjiIGWkD5+YQVA2cPP8t5PXc4ICOiy6eWijnkhfsv6bOIDXsSWNqb/o4SdBC0wn4KNC5
	C/uJU0gqcw7wK+ZMuCItv/9Dp566kcGm0KutcXBsiUjBlg10A6ZFZCEHjcyu9OvloGIc9FEr/ORW5
	/1GC7azRifcybFWxeZxH2dvPCfWdh7UQ5qir7fXlIaWe6a8qd/wdE6JmbUZoApQnFfss6vjyUOLim
	+cYLeyGqfgx8kvDfQF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHiVE-0000000GI2R-2meV;
	Thu, 13 Jun 2024 11:20:24 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHiVC-0000000GI2B-1SjS;
	Thu, 13 Jun 2024 11:20:22 +0000
Date: Thu, 13 Jun 2024 04:20:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, willy@infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-m68k@lists.linux-m68k.org
Subject: Re: Issue with JFFS2 and a_ops->dirty_folio
Message-ID: <ZmrV9vLwj0uFj5Dn@infradead.org>
References: <0b657056-3a7f-46ba-8e99-a8fe2203901f@yoseli.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0b657056-3a7f-46ba-8e99-a8fe2203901f@yoseli.org>
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

On Thu, Jun 13, 2024 at 09:05:17AM +0200, Jean-Michel Hautbois wrote:
> Hi everyone !
> 
> I am currently working on a Coldfire (MPC54418) and quite everything goes
> well, except that I can only execute one command from user space before
> getting a segmentation fault on the do_exit() syscall.

Looks like jffs2 is simply missing a dirty_folio implementation.  The
simple filemap_dirty_folio should do the job, please try the patch
below:


diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 62ea76da7fdf23..7124cbad6c35ae 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -19,6 +19,7 @@
 #include <linux/highmem.h>
 #include <linux/crc32.h>
 #include <linux/jffs2.h>
+#include <linux/writeback.h>
 #include "nodelist.h"
 
 static int jffs2_write_end(struct file *filp, struct address_space *mapping,
@@ -75,6 +76,7 @@ const struct address_space_operations jffs2_file_address_operations =
 	.read_folio =	jffs2_read_folio,
 	.write_begin =	jffs2_write_begin,
 	.write_end =	jffs2_write_end,
+	.dirty_folio =	filemap_dirty_folio,
 };
 
 static int jffs2_do_readpage_nolock (struct inode *inode, struct page *pg)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
