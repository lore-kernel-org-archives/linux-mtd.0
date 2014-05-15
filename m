Received: from tritech.se ([46.59.120.190])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkqvv-0004XB-28
 for linux-mtd@lists.infradead.org; Thu, 15 May 2014 08:22:32 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Thu, 15 May 2014 08:21:55 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From a3c9a9be5fe136d1a8e1c029a9f8cc3de634afd2 Mon Sep 17 00:00:00 2001=0A=
From: =3D?UTF-8?q?Mats=3D20K=3DC3=3DA4rrman?=3D <mats.karrman@tritech.se>=
=0A=
Date: Thu, 15 May 2014 10:03:56 +0200=0A=
Subject: [PATCH v2] mtd-utils: integck: add support for volume specific pow=
er-cut=0A=
 test=0A=
MIME-Version: 1.0=0A=
Content-Type: text/plain; charset=3DUTF-8=0A=
Content-Transfer-Encoding: 8bit=0A=
=0A=
Problem:=0A=
The current power-cut test requires power-cut emulation to be enabled globa=
lly=0A=
(e.g. for all UBIFS volumes) since the power-cut mode is otherwise lost whe=
n=0A=
the file-system is re-mounted. However this may lead to some practical=0A=
problems when the root fs of the tested machine is also of the same type.=
=0A=
=0A=
Solution:=0A=
Modify the -p option so that it automatically enables power-cut testing=0A=
selectively for the tested filesystem and then re-enables it after every=0A=
re-mount. Enabling is done by writing "1" to the associated control file.=
=0A=
The file to use is deduced from the mounted device and the assumption that=
=0A=
debugfs is mounted on /sys/kernel/debug.=0A=
=0A=
Signed-off-by: Mats K=E4rrman <mats.karrman@tritech.se>=0A=
---=0A=
 tests/fs-tests/integrity/integck.c | 151 +++++++++++++++++++++++++++++++++=
+++-=0A=
 1 file changed, 149 insertions(+), 2 deletions(-)=0A=
=0A=
v2:=0A=
- Meged the function into the existing '-p' option instead of creating a ne=
w=0A=
  overlapping option.=0A=
- Consistently use CHECK() for error handling when dealing with not-to-be-=
=0A=
  expected errors.=0A=
- Bumped program version to 1.2 since it's no longer backwards compatible.=
=0A=
=0A=
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/=
integck.c=0A=
index 8badd1f..3f6b8ad 100644=0A=
--- a/tests/fs-tests/integrity/integck.c=0A=
+++ b/tests/fs-tests/integrity/integck.c=0A=
@@ -38,7 +38,7 @@=0A=
 #include <sys/mount.h>=0A=
 #include <sys/statvfs.h>=0A=
 =0A=
-#define PROGRAM_VERSION "1.1"=0A=
+#define PROGRAM_VERSION "1.2"=0A=
 #define PROGRAM_NAME "integck"=0A=
 #include "common.h"=0A=
 #include "libubi.h"=0A=
@@ -61,6 +61,9 @@=0A=
 /* Maximum buffer size for a single read/write operation */=0A=
 #define IO_BUFFER_SIZE 32768=0A=
 =0A=
+/* Kernel debug fs mount point */=0A=
+#define DEBUGFS_MOUNT_POINT "/sys/kernel/debug"=0A=
+=0A=
 /*=0A=
  * Check if a condition is true and die if not.=0A=
  */=0A=
@@ -123,6 +126,8 @@ static struct {=0A=
  *              options as stored as a set of flags)=0A=
  * mount_point: tested file-system mount point path=0A=
  * test_dir: the directory on the tested file-system where we test=0A=
+ * pc_enable_path: path to the debugfs control knob file used to enable=0A=
+ *                 power-cut mode for the tested file-system=0A=
  */=0A=
 static struct {=0A=
 	int max_name_len;=0A=
@@ -137,6 +142,7 @@ static struct {=0A=
 	unsigned long mount_flags;=0A=
 	char *mount_point;=0A=
 	char *test_dir;=0A=
+	char *pc_enable_path;=0A=
 } fsinfo =3D {=0A=
 	.nospc_size_ok =3D 1,=0A=
 	.can_mmap =3D 1,=0A=
@@ -2580,6 +2586,24 @@ static int rm_minus_rf_dir(const char *dir_name)=0A=
 }=0A=
 =0A=
 /**=0A=
+ * Enable the power cut emulation mode on the tested file system=0A=
+ */=0A=
+static void enable_power_cut(void)=0A=
+{=0A=
+	int fd;=0A=
+=0A=
+	fd =3D open(fsinfo.pc_enable_path, O_WRONLY);=0A=
+	if (fd =3D=3D -1) {=0A=
+		errmsg("failed to enable power-cut: %d", errno);=0A=
+		CHECK(0);=0A=
+	}=0A=
+=0A=
+	v("enabling power-cut for %s", fsinfo.fsdev);=0A=
+	CHECK(write(fd, "1\n", 2) =3D=3D 2);=0A=
+	CHECK(close(fd) =3D=3D 0);=0A=
+}=0A=
+=0A=
+/**=0A=
  * Re-mount the test file-system. This function randomly select how to=0A=
  * re-mount.=0A=
  */=0A=
@@ -2693,6 +2717,10 @@ static int remount_tested_fs(void)=0A=
 	}=0A=
 =0A=
 	CHECK(chdir(fsinfo.mount_point) =3D=3D 0);=0A=
+=0A=
+	if (args.power_cut_mode)=0A=
+		enable_power_cut();=0A=
+=0A=
 	return 0;=0A=
 }=0A=
 =0A=
@@ -2850,6 +2878,115 @@ static int integck(void)=0A=
 }=0A=
 =0A=
 /*=0A=
+ * This is a helper function for 'make_ubifs_power_cut_enable_path()' that=
=0A=
+ * uses libubi to find out the ubifs volume number from a volume name.=0A=
+ */=0A=
+static int get_ubi_vol_num_from_name(int devnum, const char * name)=0A=
+{=0A=
+	libubi_t libubi;=0A=
+	struct ubi_vol_info vol_info;=0A=
+	int err, vol_num;=0A=
+=0A=
+	libubi =3D libubi_open();=0A=
+	if (!libubi) {=0A=
+		if (errno =3D=3D 0)=0A=
+			errmsg("UBI is not present in the system");=0A=
+		else=0A=
+			sys_errmsg("cannot open libubi");=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	err =3D ubi_get_vol_info1_nm(libubi, devnum, name, &vol_info);=0A=
+	if (err) {=0A=
+		sys_errmsg("cannot find UBI volume \"%s\"", name);=0A=
+		vol_num =3D -1;=0A=
+	} else {=0A=
+		vol_num =3D vol_info.vol_id;=0A=
+	}=0A=
+=0A=
+	libubi_close(libubi);=0A=
+	return vol_num;=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Make a path for an ubifs power-cut enable knob file according to the=0A=
+ * device and volume number of the tested file-system.=0A=
+ */=0A=
+static char * make_ubifs_power_cut_enable_path(void)=0A=
+{=0A=
+	int ubidev, ubivol;=0A=
+	char *p;=0A=
+	char path_tail[32];=0A=
+=0A=
+	/*=0A=
+	 * Try to find the ubifs device and volume number using the=0A=
+	 * fsinfo device string.=0A=
+	 * Valid formats are (from comments in the 'open_ubi()' function):=0A=
+	 * o ubiX_Y    - mount UBI device number X, volume Y;=0A=
+	 * o ubiY      - mount UBI device number 0, volume Y;=0A=
+	 * o ubiX:NAME - mount UBI device X, volume with name NAME;=0A=
+	 * o ubi:NAME  - mount UBI device 0, volume with name NAME.=0A=
+	 * The first format may also be preceeded by the path to the dev node=0A=
+	 * directory, e.g. "/dev/ubiX_Y".=0A=
+	 */=0A=
+	ubivol =3D -1;=0A=
+	p =3D strstr(fsinfo.fsdev, "ubi");=0A=
+	if (p) {=0A=
+		p +=3D 3;=0A=
+		if (isdigit(*p)) {=0A=
+			if (p[1] =3D=3D '_' && isdigit(p[2]) && p[3] =3D=3D '\0') {=0A=
+				ubidev =3D *p - '0';=0A=
+				ubivol =3D p[2] - '0';=0A=
+			} else if (p[1] =3D=3D '\0') {=0A=
+				ubidev =3D 0;=0A=
+				ubivol =3D *p - '0';=0A=
+			} else if (p[1] =3D=3D ':') {=0A=
+				ubidev =3D *p - '0';=0A=
+				ubivol =3D get_ubi_vol_num_from_name(ubidev, p+2);=0A=
+			}=0A=
+		} else if (*p =3D=3D ':') {=0A=
+			ubidev =3D 0;=0A=
+			ubivol =3D get_ubi_vol_num_from_name(ubidev, p+1);=0A=
+		}=0A=
+	}=0A=
+=0A=
+	if (ubivol =3D=3D -1) {=0A=
+		errmsg("failed to parse ubifs device string '%s'",=0A=
+		       fsinfo.fsdev);=0A=
+		return NULL;=0A=
+	}=0A=
+=0A=
+	sprintf(path_tail, "/ubifs/ubi%d_%d/tst_recovery", ubidev, ubivol);=0A=
+	return cat_strings(DEBUGFS_MOUNT_POINT, path_tail);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Set path to the power-cut enable knob file according to the type of=0A=
+ * the tested file system.=0A=
+ */=0A=
+static void set_power_cut_enable_path(void)=0A=
+{=0A=
+	char * path;=0A=
+	struct stat st;=0A=
+=0A=
+	if (!strcmp("ubifs", fsinfo.fstype)) {=0A=
+		path =3D make_ubifs_power_cut_enable_path();=0A=
+	} else {=0A=
+		errmsg("power-cut enable not supported for %s",=0A=
+		       fsinfo.fstype);=0A=
+		CHECK(0);=0A=
+	}=0A=
+=0A=
+	if (stat(path, &st) =3D=3D -1) {=0A=
+		sys_errmsg("failed to stat power-cut enable knob '%s': %d",=0A=
+			   path, errno);=0A=
+		CHECK(0);=0A=
+	}=0A=
+=0A=
+	fsinfo.pc_enable_path =3D path;=0A=
+}=0A=
+=0A=
+/*=0A=
  * This is a helper function for 'get_tested_fs_info()'. It parses file-sy=
stem=0A=
  * mount options string, extracts standard mount options from there, and s=
aves=0A=
  * them in the 'fsinfo.mount_flags' variable, and non-standard mount optio=
ns=0A=
@@ -3015,7 +3152,8 @@ static const char doc[] =3D PROGRAM_NAME " version " =
PROGRAM_VERSION=0A=
 "file-system error) for all operations which modify it. In this case this =
test\n"=0A=
 "program re-mounts the file-system and checks that all files and directori=
es\n"=0A=
 "which have been successfully synchronized before the power cut. And the t=
est\n"=0A=
-"continues forever.\n";=0A=
+"continues forever.\n"=0A=
+"Currently power cut testing is implemented for UBIFS only.\n";=0A=
 =0A=
 static const char optionsstr[] =3D=0A=
 "-n, --repeat=3D<count> repeat count, default is 1; zero value - repeat fo=
rever\n"=0A=
@@ -3261,6 +3399,9 @@ static int recover_tested_fs(void)=0A=
 		}=0A=
 	}=0A=
 =0A=
+	if (args.power_cut_mode)=0A=
+		enable_power_cut();=0A=
+=0A=
 	return 0;=0A=
 }=0A=
 =0A=
@@ -3285,6 +3426,10 @@ int main(int argc, char *argv[])=0A=
 		return EXIT_FAILURE;=0A=
 =0A=
 	get_tested_fs_info();=0A=
+	if (args.power_cut_mode) {=0A=
+		set_power_cut_enable_path();=0A=
+		enable_power_cut();=0A=
+	}=0A=
 =0A=
 	/* Seed the random generator with out PID */=0A=
 	random_seed =3D getpid();=0A=
@@ -3380,5 +3525,7 @@ out_free:=0A=
 	free(fsinfo.fstype);=0A=
 	free(fsinfo.fsdev);=0A=
 	free(fsinfo.test_dir);=0A=
+	if (fsinfo.pc_enable_path)=0A=
+		free(fsinfo.pc_enable_path);=0A=
 	return ret ? EXIT_FAILURE : EXIT_SUCCESS;=0A=
 }=0A=
-- =0A=
1.8.5.1=0A=
