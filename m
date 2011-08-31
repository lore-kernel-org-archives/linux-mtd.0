Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qyqze-0006aS-0j
	for linux-mtd@lists.infradead.org; Wed, 31 Aug 2011 20:02:39 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 05/10] libmtd: support MEMWRITE ioctl
Date: Wed, 31 Aug 2011 13:00:34 -0700
Message-ID: <1314820839-7107-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
References: <1314820839-7107-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: b35362@freescale.com, Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

`mtd_write()' now will first attempt to use MEMWRITE. Then, if that
doesn't exist, it will attempt to fall back to old methods for writing
OOB and/or page data.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 lib/libmtd.c |   39 +++++++++++++++++++++++++++++++--------
 1 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index 746ea69..d47b307 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -1077,6 +1077,7 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
 {
 	int ret;
 	off_t seek;
+	struct mtd_write_req ops;
 
 	ret = mtd_valid_erase_block(mtd, eb);
 	if (ret)
@@ -1101,16 +1102,38 @@ int mtd_write(libmtd_t desc, const struct mtd_dev_info *mtd, int fd, int eb,
 		return -1;
 	}
 
-	/* Seek to the beginning of the eraseblock */
+	/* Calculate seek address */
 	seek = (off_t)eb * mtd->eb_size + offs;
-	if (lseek(fd, seek, SEEK_SET) != seek)
-		return sys_errmsg("cannot seek mtd%d to offset %llu",
-				  mtd->mtd_num, (unsigned long long)seek);
 
-	ret = write(fd, data, len);
-	if (ret != len)
-		return sys_errmsg("cannot write %d bytes to mtd%d (eraseblock %d, offset %d)",
-				  len, mtd->mtd_num, eb, offs);
+	ops.start = seek;
+	ops.len = len;
+	ops.ooblen = ooblen;
+	ops.usr_data = (uint64_t)(unsigned long)data;
+	ops.usr_oob = (uint64_t)(unsigned long)oob;
+	ops.mode = mode;
+
+	ret = ioctl(fd, MEMWRITE, &ops);
+	if (ret == 0)
+		return 0;
+	else if (errno != ENOTTY)
+		return mtd_ioctl_error(mtd, eb, "MEMWRITE");
+
+	/* Fall back to old methods if necessary */
+	if (oob) {
+		if (mtd_write_oob(desc, mtd, fd, seek, ooblen, oob) < 0)
+			return sys_errmsg("cannot write to OOB");
+	}
+	if (data) {
+		/* Seek to the beginning of the eraseblock */
+		if (lseek(fd, seek, SEEK_SET) != seek)
+			return sys_errmsg("cannot seek mtd%d to offset %llu",
+					mtd->mtd_num, (unsigned long long)seek);
+		ret = write(fd, data, len);
+		if (ret != len)
+			return sys_errmsg("cannot write %d bytes to mtd%d "
+					  "(eraseblock %d, offset %d)",
+					  len, mtd->mtd_num, eb, offs);
+	}
 
 	return 0;
 }
-- 
1.7.5.4
