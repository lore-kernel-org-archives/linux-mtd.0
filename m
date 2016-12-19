Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ3Pl-0004Be-D9
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 19:16:02 +0000
Received: by mail-pg0-x242.google.com with SMTP id p66so19303315pga.2
 for <linux-mtd@lists.infradead.org>; Mon, 19 Dec 2016 11:15:39 -0800 (PST)
From: Eric Biggers <ebiggers3@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-fsdevel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
Subject: [PATCH] ubifs: allow encryption ioctls in compat mode
Date: Mon, 19 Dec 2016 11:12:48 -0800
Message-Id: <1482174768-104224-1-git-send-email-ebiggers3@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Eric Biggers <ebiggers@google.com>

The ubifs encryption ioctls did not work when called by a 32-bit program
on a 64-bit kernel.  Since 'struct fscrypt_policy' is not affected by
the word size, ubifs just needs to allow these ioctls through, like what
ext4 and f2fs do.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ubifs/ioctl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ubifs/ioctl.c b/fs/ubifs/ioctl.c
index 78d7136..da519ba 100644
--- a/fs/ubifs/ioctl.c
+++ b/fs/ubifs/ioctl.c
@@ -217,6 +217,9 @@ long ubifs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC32_SETFLAGS:
 		cmd = FS_IOC_SETFLAGS;
 		break;
+	case FS_IOC_SET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY:
+		break;
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.8.0.rc3.226.g39d4020
