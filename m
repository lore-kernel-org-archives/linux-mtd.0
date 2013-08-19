Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBLB0-0007lu-MG
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 08:51:03 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [RFC] mtd-utils: integck: add support for volume specific power-cut
 test
Date: Mon, 19 Aug 2013 08:50:28 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
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

Problem:=0A=
The current power-cut test requires power-cut emulation to be enabled globa=
lly=0A=
(e.g. for all UBIFS volumes) but this may lead to some practical problems w=
hen=0A=
the root fs of the tested machine is also of the same type.=0A=
=0A=
Proposed solution:=0A=
Add a new option -P that extends the existing -p with the ability to=0A=
automatically re-enable power-cut emulation after every re-mount by writing=
=0A=
"1" to the specified control file. E.g.=0A=
=0A=
# ./integck -eP /sys/kernel/debug/ubifs/ubi1_0/tst_recovery -m 1 ./ubifs=0A=
=0A=
Note:=0A=
The following patch includes some perhaps unrelated changes that maybe shou=
ld=0A=
be handles separately:=0A=
- #include <linux/fs.h> : I couldn't build integck without it due to some m=
issing=0A=
  defines; to be investigated.=0A=
- usleep(MOUNT_DELAY) : To avoid error 16 (Device or resource busy) when=0A=
  remounting. I have not seen any problems with this on my target system wi=
th=0A=
  real flash but when running tests on my PC with mtdram the tests keep fai=
ling=0A=
  within a minute or so without these delays.=0A=
=0A=
=0A=
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/=
integck.c=0A=
index 8badd1f..fa94f44 100644=0A=
--- a/tests/fs-tests/integrity/integck.c=0A=
+++ b/tests/fs-tests/integrity/integck.c=0A=
@@ -37,6 +37,7 @@=0A=
 #include <sys/vfs.h>=0A=
 #include <sys/mount.h>=0A=
 #include <sys/statvfs.h>=0A=
+#include <linux/fs.h>=0A=
 =0A=
 #define PROGRAM_VERSION "1.1"=0A=
 #define PROGRAM_NAME "integck"=0A=
@@ -61,6 +62,9 @@=0A=
 /* Maximum buffer size for a single read/write operation */=0A=
 #define IO_BUFFER_SIZE 32768=0A=
 =0A=
+/* To avoid trouble with error 16 (Device or resource busy) */=0A=
+#define MOUNT_DELAY 10000=0A=
+=0A=
 /*=0A=
  * Check if a condition is true and die if not.=0A=
  */=0A=
@@ -95,6 +99,7 @@=0A=
 static struct {=0A=
 	long repeat_cnt;=0A=
 	int power_cut_mode;=0A=
+	const char * pc_reenable;=0A=
 	int verify_ops;=0A=
 	int reattach;=0A=
 	int mtdn;=0A=
@@ -2580,6 +2585,25 @@ static int rm_minus_rf_dir(const char *dir_name)=0A=
 }=0A=
 =0A=
 /**=0A=
+ * Re-enable the power cut emulation mode on the tested file system=0A=
+ */=0A=
+static int reenable_power_cut(void)=0A=
+{=0A=
+	int fd;=0A=
+=0A=
+	fd =3D open(args.pc_reenable, O_WRONLY);=0A=
+	if (fd =3D=3D -1) {=0A=
+		errmsg("failed to reenable power-cut: %d", errno);=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	CHECK(write(fd, "1\n", 2) =3D=3D 2);=0A=
+	CHECK(close(fd) =3D=3D 0);=0A=
+=0A=
+	return 0;=0A=
+}=0A=
+=0A=
+/**=0A=
  * Re-mount the test file-system. This function randomly select how to=0A=
  * re-mount.=0A=
  */=0A=
@@ -2604,6 +2628,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 	if (rorw1) {=0A=
 		flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2614,6 +2639,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2626,6 +2652,7 @@ static int remount_tested_fs(void)=0A=
 	if (um) {=0A=
 		if (um_ro) {=0A=
 			flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, flags, fsinfo.mount_opts);=0A=
 			if (ret) {=0A=
@@ -2635,6 +2662,7 @@ static int remount_tested_fs(void)=0A=
 			}=0A=
 		}=0A=
 =0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D umount(fsinfo.mount_point);=0A=
 		if (ret) {=0A=
 			pcv("cannot unmount %s", fsinfo.mount_point);=0A=
@@ -2642,6 +2670,7 @@ static int remount_tested_fs(void)=0A=
 		}=0A=
 =0A=
 		if (!um_rorw) {=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, fsinfo.mount_flags,=0A=
 				    fsinfo.mount_opts);=0A=
@@ -2651,6 +2680,7 @@ static int remount_tested_fs(void)=0A=
 				return -1;=0A=
 			}=0A=
 		} else {=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, fsinfo.mount_flags | MS_RDONLY,=0A=
 				    fsinfo.mount_opts);=0A=
@@ -2662,6 +2692,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 			flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 			flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, flags, fsinfo.mount_opts);=0A=
 			if (ret) {=0A=
@@ -2674,6 +2705,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 	if (rorw2) {=0A=
 		flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2683,6 +2715,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2693,6 +2726,13 @@ static int remount_tested_fs(void)=0A=
 	}=0A=
 =0A=
 	CHECK(chdir(fsinfo.mount_point) =3D=3D 0);=0A=
+=0A=
+	if (args.pc_reenable) {=0A=
+		ret =3D reenable_power_cut();=0A=
+		if (ret)=0A=
+			return -1;=0A=
+	}=0A=
+=0A=
 	return 0;=0A=
 }=0A=
 =0A=
@@ -3015,12 +3055,16 @@ static const char doc[] =3D PROGRAM_NAME " version =
" PROGRAM_VERSION=0A=
 "file-system error) for all operations which modify it. In this case this =
test\n"=0A=
 "program re-mounts the file-system and checks that all files and directori=
es\n"=0A=
 "which have been successfully synchronized before the power cut. And the t=
est\n"=0A=
-"continues forever.\n";=0A=
+"continues forever.\n"=0A=
+"Whereas -p requires power cut emulation to be enabled globally, the -P op=
tion\n"=0A=
+"enables the use of power cut emulation on the tested fs instance only.\n"=
;=0A=
 =0A=
 static const char optionsstr[] =3D=0A=
 "-n, --repeat=3D<count> repeat count, default is 1; zero value - repeat fo=
rever\n"=0A=
 "-p, --power-cut      power cut testing mode (-n parameter is ignored and =
the\n"=0A=
 "                     test continues forever)\n"=0A=
+"-P, --pc-reenable=3D<sysfile> Like -p but power-cut mode is re-enabled by=
 writing\n"=0A=
+"                     '1' to the specified sysfs file after every re-mount=
.\n"=0A=
 "-e, --verify-ops     verify all operations, e.g., every time a file is wr=
itten\n"=0A=
 "                     to, read the data back and verify it, every time a\n=
"=0A=
 "                     directory is created, check that it exists, etc\n"=
=0A=
@@ -3031,13 +3075,14 @@ static const char optionsstr[] =3D=0A=
 "-V, --version        print program version\n";=0A=
 =0A=
 static const struct option long_options[] =3D {=0A=
-	{ .name =3D "repeat",     .has_arg =3D 1, .flag =3D NULL, .val =3D 'n' },=
=0A=
-	{ .name =3D "power-cut",  .has_arg =3D 0, .flag =3D NULL, .val =3D 'p' },=
=0A=
-	{ .name =3D "verify-ops", .has_arg =3D 0, .flag =3D NULL, .val =3D 'e' },=
=0A=
-	{ .name =3D "reattach",   .has_arg =3D 1, .flag =3D NULL, .val =3D 'm' },=
=0A=
-	{ .name =3D "verbose",    .has_arg =3D 0, .flag =3D NULL, .val =3D 'v' },=
=0A=
-	{ .name =3D "help",       .has_arg =3D 0, .flag =3D NULL, .val =3D 'h' },=
=0A=
-	{ .name =3D "version",    .has_arg =3D 0, .flag =3D NULL, .val =3D 'V' },=
=0A=
+	{ .name =3D "repeat",      .has_arg =3D 1, .flag =3D NULL, .val =3D 'n' }=
,=0A=
+	{ .name =3D "power-cut",   .has_arg =3D 0, .flag =3D NULL, .val =3D 'p' }=
,=0A=
+	{ .name =3D "pc-reenable", .has_arg =3D 1, .flag =3D NULL, .val =3D 'P' }=
,=0A=
+	{ .name =3D "verify-ops",  .has_arg =3D 0, .flag =3D NULL, .val =3D 'e' }=
,=0A=
+	{ .name =3D "reattach",    .has_arg =3D 1, .flag =3D NULL, .val =3D 'm' }=
,=0A=
+	{ .name =3D "verbose",     .has_arg =3D 0, .flag =3D NULL, .val =3D 'v' }=
,=0A=
+	{ .name =3D "help",        .has_arg =3D 0, .flag =3D NULL, .val =3D 'h' }=
,=0A=
+	{ .name =3D "version",     .has_arg =3D 0, .flag =3D NULL, .val =3D 'V' }=
,=0A=
 	{ NULL, 0, NULL, 0},=0A=
 };=0A=
 =0A=
@@ -3052,7 +3097,7 @@ static int parse_opts(int argc, char * const argv[])=
=0A=
 	while (1) {=0A=
 		int key, error =3D 0;=0A=
 =0A=
-		key =3D getopt_long(argc, argv, "n:pm:evVh?", long_options, NULL);=0A=
+		key =3D getopt_long(argc, argv, "n:pP:m:evVh?", long_options, NULL);=0A=
 		if (key =3D=3D -1)=0A=
 			break;=0A=
 =0A=
@@ -3065,6 +3110,12 @@ static int parse_opts(int argc, char * const argv[])=
=0A=
 		case 'p':=0A=
 			args.power_cut_mode =3D 1;=0A=
 			break;=0A=
+		case 'P':=0A=
+			args.pc_reenable =3D optarg;=0A=
+			if (args.pc_reenable[0] =3D=3D '-')=0A=
+				return errmsg("bad power-cut enable file: \"%s\"", optarg);=0A=
+			args.power_cut_mode =3D 1;=0A=
+			break;=0A=
 		case 'm':=0A=
 			args.mtdn =3D simple_strtoul(optarg, &error);=0A=
 			if (error || args.mtdn < 0)=0A=
@@ -3205,13 +3256,16 @@ static int recover_tested_fs(void)=0A=
 	 * while mounting in 'remount_tested_fs()'.=0A=
 	 */=0A=
 	mntent =3D get_tested_fs_mntent();=0A=
-	if (mntent)=0A=
+	if (mntent) {=0A=
+		usleep(MOUNT_DELAY);=0A=
 		CHECK(umount(fsinfo.mount_point) !=3D -1);=0A=
+	}=0A=
 =0A=
 	if (args.reattach)=0A=
 		CHECK(reattach() =3D=3D 0);=0A=
 =0A=
 	if (!um_rorw) {=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 			    fsinfo.fstype, fsinfo.mount_flags,=0A=
 			    fsinfo.mount_opts);=0A=
@@ -3221,6 +3275,7 @@ static int recover_tested_fs(void)=0A=
 			return -1;=0A=
 		}=0A=
 	} else {=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 			    fsinfo.fstype, fsinfo.mount_flags | MS_RDONLY,=0A=
 			    fsinfo.mount_opts);=0A=
@@ -3232,6 +3287,7 @@ static int recover_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 			    fsinfo.fstype, flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -3243,6 +3299,7 @@ static int recover_tested_fs(void)=0A=
 =0A=
 	if (rorw2) {=0A=
 		flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -3252,6 +3309,7 @@ static int recover_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -3261,6 +3319,12 @@ static int recover_tested_fs(void)=0A=
 		}=0A=
 	}=0A=
 =0A=
+	if (args.pc_reenable) {=0A=
+		ret =3D reenable_power_cut();=0A=
+		if (ret)=0A=
+			return -1;=0A=
+	}=0A=
+=0A=
 	return 0;=0A=
 }=0A=
 =
