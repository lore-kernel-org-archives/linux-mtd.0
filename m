Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqdQn-0007FT-81
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 10:23:56 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Yuanjie.Huang@windriver.com, raj.khem@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 4/5] Fix libmtd behaviour if MTD is not present on the system
Date: Wed, 22 Mar 2017 11:22:56 +0100
Message-Id: <20170322102257.7605-5-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The documentation of libmtd_open says, if it returns NULL and errno is
zero, MTD is not present. However, the current version always returns
a libmtd_t object. The function internally checks, if it can access the
MTD sysfs files and, if not, sets a flag to use the procfs fallback.

This patch adds an additional check to libmtd_open, to test if the
MTD procfs file can be read and fails with errno cleared if it does
not exist.

Furhtermore, mtd_get_info is documented to fail with errno set to ENODEV
if MTD is not present. First of all, this was broken in the original
version. It was implemented to specification for the sysfs code path,
but if MTD is not present, that won't be executed, because of the flag
set by libmtd_open. This makes the check not only redundant, but masks
an actual error (the sysfs paths suddenly not being readable anymore).
The legacy path that was used if the sysfs files are not avaible fails
with ENOENT if it cannot read the procfs file. With the above changes
in addition, we don't have a libmtd_t object if neither sysfs nor
procfs is readable, so this error status no longer makes sense.

This patch removes the documentation on the ENODEV errno, and
makes sure that mtd_get_info always returns with apropriate errno
on failure.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 include/libmtd.h      |  3 +--
 lib/libmtd.c          | 12 ++++++------
 lib/libmtd_int.h      |  1 +
 lib/libmtd_legacy.c   | 18 ++++++++++++++++++
 ubi-utils/mtdinfo.c   |  5 +----
 ubi-utils/ubiformat.c |  2 --
 6 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/include/libmtd.h b/include/libmtd.h
index f9f3164..db85fb4 100644
--- a/include/libmtd.h
+++ b/include/libmtd.h
@@ -120,8 +120,7 @@ int mtd_dev_present(libmtd_t desc, int mtd_num);
  * @info: the MTD device information is returned here
  *
  * This function fills the passed @info object with general MTD information and
- * returns %0 in case of success and %-1 in case of failure. If MTD subsystem is
- * not present in the system, errno is set to @ENODEV.
+ * returns %0 in case of success and %-1 in case of failure.
  */
 int mtd_get_info(libmtd_t desc, struct mtd_info *info);
 
diff --git a/lib/libmtd.c b/lib/libmtd.c
index 8bc532f..a50f18a 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -578,6 +578,11 @@ libmtd_t libmtd_open(void)
 		free(lib->sysfs_mtd);
 		free(lib->mtd_name);
 		lib->mtd_name = lib->mtd = lib->sysfs_mtd = NULL;
+
+		if (!legacy_procfs_is_supported()) {
+			free(lib);
+			lib = NULL;
+		}
 		return lib;
 	}
 
@@ -676,13 +681,8 @@ int mtd_get_info(libmtd_t desc, struct mtd_info *info)
 	 * devices are present.
 	 */
 	sysfs_mtd = opendir(lib->sysfs_mtd);
-	if (!sysfs_mtd) {
-		if (errno == ENOENT) {
-			errno = ENODEV;
-			return -1;
-		}
+	if (!sysfs_mtd)
 		return sys_errmsg("cannot open \"%s\"", lib->sysfs_mtd);
-	}
 
 	info->lowest_mtd_num = INT_MAX;
 	while (1) {
diff --git a/lib/libmtd_int.h b/lib/libmtd_int.h
index db2f1cf..03b0863 100644
--- a/lib/libmtd_int.h
+++ b/lib/libmtd_int.h
@@ -98,6 +98,7 @@ struct libmtd
 	unsigned int offs64_ioctls:2;
 };
 
+int legacy_procfs_is_supported(void);
 int legacy_dev_present(int mtd_num);
 int legacy_mtd_get_info(struct mtd_info *info);
 int legacy_get_dev_info(const char *node, struct mtd_dev_info *mtd);
diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index ba8eade..46f51fd 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -146,6 +146,24 @@ static int proc_parse_next(struct proc_parse_info *pi)
 }
 
 /**
+ * legacy_procfs_is_supported - legacy version of 'sysfs_is_supported()'.
+ *
+ * Check if we can access the procfs files for the MTD subsystem.
+ */
+int legacy_procfs_is_supported(void)
+{
+	if (access(MTD_PROC_FILE, R_OK) != 0) {
+		if (errno == ENOENT) {
+			errno = 0;
+		} else {
+			sys_errmsg("cannot read \"%s\"", MTD_PROC_FILE);
+		}
+		return 0;
+	}
+	return 1;
+}
+
+/**
  * legacy_dev_presentl - legacy version of 'mtd_dev_present()'.
  * @info: the MTD device information is returned here
  *
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 11e59c1..0606ab0 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -407,11 +407,8 @@ int main(int argc, char * const argv[])
 	}
 
 	err = mtd_get_info(libmtd, &mtd_info);
-	if (err) {
-		if (errno == ENODEV)
-			return errmsg("MTD is not present");
+	if (err)
 		return sys_errmsg("cannot get MTD information");
-	}
 
 	if (!args.all && args.node) {
 		int mtdn;
diff --git a/ubi-utils/ubiformat.c b/ubi-utils/ubiformat.c
index 68906f2..896fe20 100644
--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -698,8 +698,6 @@ int main(int argc, char * const argv[])
 
 	err = mtd_get_info(libmtd, &mtd_info);
 	if (err) {
-		if (errno == ENODEV)
-			errmsg("MTD is not present");
 		sys_errmsg("cannot get MTD information");
 		goto out_close_mtd;
 	}
-- 
2.10.2
