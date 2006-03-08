Received: from topsns2.toshiba-tops.co.jp ([202.230.225.126])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGwyJ-00052V-Ib
	for linux-mtd@lists.infradead.org; Wed, 08 Mar 2006 06:36:56 -0500
Date: Wed, 08 Mar 2006 20:36:45 +0900 (JST)
Message-Id: <20060308.203645.48545307.nemoto@toshiba-tops.co.jp>
To: linux-kernel@vger.kernel.org
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: akpm@osdl.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: 64bit fixes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes some bugs in mtd/jffs2 on 64bit platform.

The MEMGETBADBLOCK/MEMSETBADBLOCK ioctl are not listed in
compat_ioctl.h.
And some variables in jffs2 are declared as uint32_t but used to hold
size_t values.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

diff --git a/fs/jffs2/nodelist.c b/fs/jffs2/nodelist.c
index b635e16..d4d0c41 100644
--- a/fs/jffs2/nodelist.c
+++ b/fs/jffs2/nodelist.c
@@ -406,7 +406,8 @@ static int check_node_data(struct jffs2_
 	int err = 0, pointed = 0;
 	struct jffs2_eraseblock *jeb;
 	unsigned char *buffer;
-	uint32_t crc, ofs, retlen, len;
+	uint32_t crc, ofs, len;
+	size_t retlen;
 
 	BUG_ON(tn->csize == 0);
 
diff --git a/fs/jffs2/readinode.c b/fs/jffs2/readinode.c
index 5f0652d..f169564 100644
--- a/fs/jffs2/readinode.c
+++ b/fs/jffs2/readinode.c
@@ -112,7 +112,7 @@ static struct jffs2_raw_node_ref *jffs2_
  * 	    negative error code on failure.
  */
 static inline int read_direntry(struct jffs2_sb_info *c, struct jffs2_raw_node_ref *ref,
-				struct jffs2_raw_dirent *rd, uint32_t read, struct jffs2_full_dirent **fdp,
+				struct jffs2_raw_dirent *rd, size_t read, struct jffs2_full_dirent **fdp,
 				uint32_t *latest_mctime, uint32_t *mctime_ver)
 {
 	struct jffs2_full_dirent *fd;
diff --git a/include/linux/compat_ioctl.h b/include/linux/compat_ioctl.h
index 8fad50f..ae7dfb7 100644
--- a/include/linux/compat_ioctl.h
+++ b/include/linux/compat_ioctl.h
@@ -696,6 +696,8 @@ COMPATIBLE_IOCTL(MEMLOCK)
 COMPATIBLE_IOCTL(MEMUNLOCK)
 COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
 COMPATIBLE_IOCTL(MEMGETREGIONINFO)
+COMPATIBLE_IOCTL(MEMGETBADBLOCK)
+COMPATIBLE_IOCTL(MEMSETBADBLOCK)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
 ULONG_IOCTL(NBD_SET_BLKSIZE)
