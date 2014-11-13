Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xp1yd-0004kI-H7
 for linux-mtd@lists.infradead.org; Thu, 13 Nov 2014 21:30:52 +0000
Received: by mail-wi0-f182.google.com with SMTP id h11so899971wiw.9
 for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2014 13:30:29 -0800 (PST)
Sender: Pieter Smith <smipi01@gmail.com>
From: Pieter Smith <pieter@boesman.nl>
To: pieter@boesman.nl
Subject: [PATCH 29/56] fs/jffs2: support compiling out splice
Date: Thu, 13 Nov 2014 22:23:06 +0100
Message-Id: <1415913813-362-30-git-send-email-pieter@boesman.nl>
In-Reply-To: <1415913813-362-1-git-send-email-pieter@boesman.nl>
References: <pieter@boesman.nl>
 <1415913813-362-1-git-send-email-pieter@boesman.nl>
Cc: "open list:JOURNALLING FLASH..." <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Josh Triplett <josh@joshtriplett.org>,
 open list <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Compile out splice support from jffs2 when the splice-family of syscalls is not
supported by the system (i.e. CONFIG_SYSCALL_SPLICE is undefined).

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 fs/jffs2/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
index 64989ca..bb4e88b 100644
--- a/fs/jffs2/file.c
+++ b/fs/jffs2/file.c
@@ -58,7 +58,7 @@ const struct file_operations jffs2_file_operations =
 	.unlocked_ioctl=jffs2_ioctl,
 	.mmap =		generic_file_readonly_mmap,
 	.fsync =	jffs2_fsync,
-	.splice_read =	generic_file_splice_read,
+	SPLICE_READ_INIT(generic_file_splice_read)
 };
 
 /* jffs2_file_inode_operations */
-- 
1.9.1
