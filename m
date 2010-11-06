Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PEjxT-0008QZ-NS
	for linux-mtd@lists.infradead.org; Sat, 06 Nov 2010 14:41:32 +0000
Received: by ewy19 with SMTP id 19so2157527ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 06 Nov 2010 07:41:28 -0700 (PDT)
From: Vasiliy Kulikov <segooon@gmail.com>
To: kernel-janitors@vger.kernel.org
Subject: [PATCH] mtd: mtdchar: fix information leak to userland
Date: Sat,  6 Nov 2010 17:41:24 +0300
Message-Id: <1289054485-18190-1-git-send-email-segooon@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Structure mtd_info_user is copied to userland with padding byted
between "type" and "flags" fields uninitialized.  It leads to leaking
of contents of kernel stack memory.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/mtd/mtdchar.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 3eff1e5..2a0bc9e 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -601,6 +601,7 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 	}
 
 	case MEMGETINFO:
+		memset(&info, 0, sizeof(info));
 		info.type	= mtd->type;
 		info.flags	= mtd->flags;
 		info.size	= mtd->size;
@@ -609,7 +610,6 @@ static int mtd_ioctl(struct file *file, u_int cmd, u_long arg)
 		info.oobsize	= mtd->oobsize;
 		/* The below fields are obsolete */
 		info.ecctype	= -1;
-		info.eccsize	= 0;
 		if (copy_to_user(argp, &info, sizeof(struct mtd_info_user)))
 			return -EFAULT;
 		break;
-- 
1.7.0.4
