Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVJ2m-00013a-Qp
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 15:59:47 +0000
From: Arnd Bergmann <arnd@arndb.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] jffs2: use unsigned 32-bit timstamps consistently
Date: Tue, 19 Jun 2018 17:59:04 +0200
Message-Id: <20180619155925.4107498-2-arnd@arndb.de>
In-Reply-To: <20180619155925.4107498-1-arnd@arndb.de>
References: <20180619155925.4107498-1-arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Most users of jffs2 are 32-bit systems that traditionally only support
timestamps using a 32-bit signed time_t, in the range from years 1902 to
2038. On 64-bit systems, jffs2 however interpreted the same timestamps
as unsigned values, reading back negative times (before 1970) as times
between 2038 and 2106.

Now that Linux supports 64-bit inode timestamps even on 32-bit systems,
let's use the second interpretation everywhere to allow jffs2 to be
used on 32-bit systems beyond 2038 without a fundamental change to the
inode format.

This has a slight risk of regressions, when existing files with timestamps
before 1970 are present in file system images and are now interpreted
as future time stamps. I considered moving the wraparound point a bit,
e.g. to 1960, in order to deal with timestamps that ended up on Dec 31,
1969 due to incorrect timezone handling. However, this would complicate
the implementation unnecessarily, so I went with the simplest possible
method of extending the timestamps.

Writing files with timestamps before 1970 or after 2106 now results
in those times being clamped in the file system.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/jffs2/os-linux.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/jffs2/os-linux.h b/fs/jffs2/os-linux.h
index acbe1f722f2d..a2dbbb3f4c74 100644
--- a/fs/jffs2/os-linux.h
+++ b/fs/jffs2/os-linux.h
@@ -31,13 +31,13 @@ struct kvec;
 #define JFFS2_F_I_GID(f) (i_gid_read(OFNI_EDONI_2SFFJ(f)))
 #define JFFS2_F_I_RDEV(f) (OFNI_EDONI_2SFFJ(f)->i_rdev)
 
-#define ITIME(sec) ((struct timespec64){(int32_t)sec, 0})
-#define JFFS2_NOW() (ktime_get_real_seconds())
-#define I_SEC(tv) ((tv).tv_sec)
-#define JFFS2_F_I_CTIME(f) (OFNI_EDONI_2SFFJ(f)->i_ctime.tv_sec)
-#define JFFS2_F_I_MTIME(f) (OFNI_EDONI_2SFFJ(f)->i_mtime.tv_sec)
-#define JFFS2_F_I_ATIME(f) (OFNI_EDONI_2SFFJ(f)->i_atime.tv_sec)
-
+#define JFFS2_CLAMP_TIME(t) ((uint32_t)clamp_t(time64_t, (t), 0, U32_MAX))
+#define ITIME(sec) ((struct timespec64){sec, 0})
+#define JFFS2_NOW() JFFS2_CLAMP_TIME(ktime_get_real_seconds())
+#define I_SEC(tv) JFFS2_CLAMP_TIME((tv).tv_sec)
+#define JFFS2_F_I_CTIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_ctime)
+#define JFFS2_F_I_MTIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_mtime)
+#define JFFS2_F_I_ATIME(f) I_SEC(OFNI_EDONI_2SFFJ(f)->i_atime)
 #define sleep_on_spinunlock(wq, s)				\
 	do {							\
 		DECLARE_WAITQUEUE(__wait, current);		\
-- 
2.9.0
