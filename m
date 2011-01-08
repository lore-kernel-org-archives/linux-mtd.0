Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pbi9s-0005gh-Eg
	for linux-mtd@lists.infradead.org; Sat, 08 Jan 2011 23:25:17 +0000
Received: by eyd9 with SMTP id 9so8958530eyd.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 08 Jan 2011 15:25:14 -0800 (PST)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: FTL layer: don't free input argument in
	add_mtd_blktrans_dev
Date: Sun,  9 Jan 2011 01:25:06 +0200
Message-Id: <1294529106-32586-1-git-send-email-maximlevitsky@gmail.com>
Cc: enh@google.com, David Woodhouse <dwmw2@infradead.org>,
	Maxim Levitsky <maximlevitsky@gmail.com>, nnk@google.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This one liner patch fixes double free that will occur if add_mtd_blktrans_dev
fails. On failure it free input argument, but all its users
also free it on error which is natural thing to do.
Thus don't free it.

All credit for finding that bug belongs to reporters of the bug in the android bugzilla
http://code.google.com/p/android/issues/detail?id=13761

Signed-of-by: Maxim Levitsky <maximlevitsky@gmail.com>
CC: nnk@google.com
CC: enh@google.com
---
 drivers/mtd/mtd_blkdevs.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index cb20c67..e0a2373 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -413,7 +413,6 @@ error3:
 error2:
 	list_del(&new->list);
 error1:
-	kfree(new);
 	return ret;
 }
 
-- 
1.7.1
