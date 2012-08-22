Received: from mail-wg0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T47Ed-0004Xb-FP
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 09:28:24 +0000
Received: by wgbez12 with SMTP id ez12so444670wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 02:28:22 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH MTD-UTILS 3/5] re-name set volume properties ioctl
Date: Wed, 22 Aug 2012 11:27:58 +0200
Message-Id: <1345627680-8166-4-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

kernel commit 6748482f4153fc0e095aa3dc831d5edac5656a80 renamed:
'UBI_PROP_DIRECT_WRITE' to 'UBI_VOL_PROP_DIRECT_WRITE'

structure from 'struct ubi_set_prop_req' to 'struct
ubi_set_vol_prop_req'.

and 'UBI_IOCSETPROP' to 'UBI_IOCSETVOLPROP'

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 mkfs.ubifs/mkfs.ubifs.c    |    2 +-
 tests/ubi-tests/io_paral.c |    2 +-
 ubi-utils/include/libubi.h |    2 +-
 ubi-utils/libubi.c         |    6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 751e348..149806b 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -2132,7 +2132,7 @@ static int open_target(void)
 		if (out_fd == -1)
 			return sys_err_msg("cannot open the UBI volume '%s'",
 					   output);
-		if (ubi_set_property(out_fd, UBI_PROP_DIRECT_WRITE, 1))
+		if (ubi_set_property(out_fd, UBI_VOL_PROP_DIRECT_WRITE, 1))
 			return sys_err_msg("ubi_set_property failed");
 
 		if (check_volume_empty())
diff --git a/tests/ubi-tests/io_paral.c b/tests/ubi-tests/io_paral.c
index 1d9a97c..615c1dd 100644
--- a/tests/ubi-tests/io_paral.c
+++ b/tests/ubi-tests/io_paral.c
@@ -179,7 +179,7 @@ static void *write_thread(void *ptr)
 		return NULL;
 	}
 
-	ret = ubi_set_property(fd, UBI_PROP_DIRECT_WRITE, 1);
+	ret = ubi_set_property(fd, UBI_VOL_PROP_DIRECT_WRITE, 1);
 	if (ret) {
 		failed("ubi_set_property");
 		errmsg("cannot set property for \"%s\"\n", vol_node);
diff --git a/ubi-utils/include/libubi.h b/ubi-utils/include/libubi.h
index 45afe87..11a186b 100644
--- a/ubi-utils/include/libubi.h
+++ b/ubi-utils/include/libubi.h
@@ -436,7 +436,7 @@ int ubi_leb_change_start(libubi_t desc, int fd, int lnum, int bytes);
 /**
  * ubi_set_property - set volume propety.
  * @fd: volume character device file descriptor
- * @property: the property to change (%UBI_PROP_DIRECT_WRITE, etc)
+ * @property: the property to change (%UBI_VOL_PROP_DIRECT_WRITE, etc)
  * @value: new value of the changed property
  *
  * This function changes a property of a volume. Returns zero in case of
diff --git a/ubi-utils/libubi.c b/ubi-utils/libubi.c
index 9b0eab3..ae805c8 100644
--- a/ubi-utils/libubi.c
+++ b/ubi-utils/libubi.c
@@ -1345,13 +1345,13 @@ int ubi_get_vol_info1_nm(libubi_t desc, int dev_num, const char *name,
 
 int ubi_set_property(int fd, uint8_t property, uint64_t value)
 {
-	struct ubi_set_prop_req r;
+	struct ubi_set_vol_prop_req r;
 
-	memset(&r, 0, sizeof(struct ubi_set_prop_req));
+	memset(&r, 0, sizeof(struct ubi_set_vol_prop_req));
 	r.property = property;
 	r.value = value;
 
-	return ioctl(fd, UBI_IOCSETPROP, &r);
+	return ioctl(fd, UBI_IOCSETVOLPROP, &r);
 }
 
 int ubi_leb_unmap(int fd, int lnum)
-- 
1.7.2.5
