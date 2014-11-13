Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xp1zD-0004wq-M0
 for linux-mtd@lists.infradead.org; Thu, 13 Nov 2014 21:31:29 +0000
Received: by mail-wi0-f174.google.com with SMTP id h11so882560wiw.13
 for <linux-mtd@lists.infradead.org>; Thu, 13 Nov 2014 13:31:05 -0800 (PST)
Sender: Pieter Smith <smipi01@gmail.com>
From: Pieter Smith <pieter@boesman.nl>
To: pieter@boesman.nl
Subject: [PATCH 42/56] fs/ubifs: support compiling out splice
Date: Thu, 13 Nov 2014 22:23:19 +0100
Message-Id: <1415913813-362-43-git-send-email-pieter@boesman.nl>
In-Reply-To: <1415913813-362-1-git-send-email-pieter@boesman.nl>
References: <pieter@boesman.nl>
 <1415913813-362-1-git-send-email-pieter@boesman.nl>
Cc: open list <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org,
 Josh Triplett <josh@joshtriplett.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Compile out splice support from ubifs when the splice-family of syscalls is not
supported by the system (i.e. CONFIG_SYSCALL_SPLICE is undefined).

Signed-off-by: Pieter Smith <pieter@boesman.nl>
---
 fs/ubifs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index b5b593c..76112a9 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1584,8 +1584,8 @@ const struct file_operations ubifs_file_operations = {
 	.mmap           = ubifs_file_mmap,
 	.fsync          = ubifs_fsync,
 	.unlocked_ioctl = ubifs_ioctl,
-	.splice_read	= generic_file_splice_read,
-	.splice_write	= iter_file_splice_write,
+	SPLICE_READ_INIT(generic_file_splice_read)
+	SPLICE_WRITE_INIT(iter_file_splice_write)
 #ifdef CONFIG_COMPAT
 	.compat_ioctl   = ubifs_compat_ioctl,
 #endif
-- 
1.9.1
