Received: from tritech.se ([46.59.120.190])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VG9XY-0004fF-CO
 for linux-mtd@lists.infradead.org; Sun, 01 Sep 2013 15:26:14 +0000
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Artem
 Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtd-utils: integck: add support for volume specific
 power-cut test
Date: Sun, 1 Sep 2013 15:25:37 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FCE4195@post.tritech.se>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
(i.e. for all UBIFS volumes) since the power-cut mode is otherwise lost whe=
n=0A=
the file-system is re-mounted but this may lead to some practical problems =
when=0A=
the root fs of the tested machine is also of the same type.=0A=
=0A=
Proposed solution:=0A=
Add a new option -P that extends the existing option -p with the ability to=
=0A=
automatically re-enable power-cut emulation after every re-mount by writing=
=0A=
"1" to the associated control file. The file to use is deduced from the mou=
nted=0A=
device and the assumption that debugfs is mounted on /sys/kernel/debug.=0A=
The old option -p is kept for backwards compatibility and because the resul=
t=0A=
may be different if the power-cut mode is active also during re-mount.=0A=
=0A=
Note:=0A=
The following patch includes a perhaps unrelated change; a number of=0A=
'usleep(MOUNT_DELAY)' has been inserted to avoid error 16 (Device or resour=
ce=0A=
busy) when remounting. I have not seen any problems with this on my target=
=0A=
system with real flash but when running tests on my PC with mtdram the test=
s=0A=
keep failing within a minute or so without these delays.=0A=
=0A=
Signed-off-by: Mats Karrman <mats.karrman@tritech.se>=0A=
=0A=
=0A=
diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/=
integck.c=0A=
index 8badd1f..7a65b03 100644=0A=
--- a/tests/fs-tests/integrity/integck.c=0A=
+++ b/tests/fs-tests/integrity/integck.c=0A=
@@ -61,6 +61,12 @@=0A=
 /* Maximum buffer size for a single read/write operation */=0A=
 #define IO_BUFFER_SIZE 32768=0A=
 =0A=
+/* To avoid trouble with error 16 (Device or resource busy) */=0A=
+#define MOUNT_DELAY 10000=0A=
+=0A=
+/* Kernel debug fs mount point */=0A=
+#define DEBUGFS_MOUNT_POINT "/sys/kernel/debug"=0A=
+=0A=
 /*=0A=
  * Check if a condition is true and die if not.=0A=
  */=0A=
@@ -94,7 +100,7 @@=0A=
 /* The variables below are set by command line arguments */=0A=
 static struct {=0A=
 	long repeat_cnt;=0A=
-	int power_cut_mode;=0A=
+	int power_cut_mode;	/* 0=3Doff, 1=3Don, 2=3Dauto enable */=0A=
 	int verify_ops;=0A=
 	int reattach;=0A=
 	int mtdn;=0A=
@@ -123,6 +129,8 @@ static struct {=0A=
  *              options as stored as a set of flags)=0A=
  * mount_point: tested file-system mount point path=0A=
  * test_dir: the directory on the tested file-system where we test=0A=
+ * pc_reenable_path: path to the debugfs control knob file used to re-enab=
le=0A=
+ *                   power-cut mode for the tested file-system=0A=
  */=0A=
 static struct {=0A=
 	int max_name_len;=0A=
@@ -137,6 +145,7 @@ static struct {=0A=
 	unsigned long mount_flags;=0A=
 	char *mount_point;=0A=
 	char *test_dir;=0A=
+	char *pc_reenable_path;=0A=
 } fsinfo =3D {=0A=
 	.nospc_size_ok =3D 1,=0A=
 	.can_mmap =3D 1,=0A=
@@ -2580,6 +2589,26 @@ static int rm_minus_rf_dir(const char *dir_name)=0A=
 }=0A=
 =0A=
 /**=0A=
+ * Re-enable the power cut emulation mode on the tested file system=0A=
+ */=0A=
+static int reenable_power_cut(void)=0A=
+{=0A=
+	int fd;=0A=
+=0A=
+	fd =3D open(fsinfo.pc_reenable_path, O_WRONLY);=0A=
+	if (fd =3D=3D -1) {=0A=
+		errmsg("failed to re-enable power-cut: %d", errno);=0A=
+		return -1;=0A=
+	}=0A=
+=0A=
+	v("re-enabling power-cut for %s", fsinfo.fsdev);=0A=
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
@@ -2604,6 +2633,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 	if (rorw1) {=0A=
 		flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2614,6 +2644,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2626,6 +2657,7 @@ static int remount_tested_fs(void)=0A=
 	if (um) {=0A=
 		if (um_ro) {=0A=
 			flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, flags, fsinfo.mount_opts);=0A=
 			if (ret) {=0A=
@@ -2635,6 +2667,7 @@ static int remount_tested_fs(void)=0A=
 			}=0A=
 		}=0A=
 =0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D umount(fsinfo.mount_point);=0A=
 		if (ret) {=0A=
 			pcv("cannot unmount %s", fsinfo.mount_point);=0A=
@@ -2642,6 +2675,7 @@ static int remount_tested_fs(void)=0A=
 		}=0A=
 =0A=
 		if (!um_rorw) {=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, fsinfo.mount_flags,=0A=
 				    fsinfo.mount_opts);=0A=
@@ -2651,6 +2685,7 @@ static int remount_tested_fs(void)=0A=
 				return -1;=0A=
 			}=0A=
 		} else {=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, fsinfo.mount_flags | MS_RDONLY,=0A=
 				    fsinfo.mount_opts);=0A=
@@ -2662,6 +2697,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 			flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 			flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+			usleep(MOUNT_DELAY);=0A=
 			ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 				    fsinfo.fstype, flags, fsinfo.mount_opts);=0A=
 			if (ret) {=0A=
@@ -2674,6 +2710,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 	if (rorw2) {=0A=
 		flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2683,6 +2720,7 @@ static int remount_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -2693,6 +2731,13 @@ static int remount_tested_fs(void)=0A=
 	}=0A=
 =0A=
 	CHECK(chdir(fsinfo.mount_point) =3D=3D 0);=0A=
+=0A=
+	if (args.power_cut_mode =3D=3D 2) {=0A=
+		ret =3D reenable_power_cut();=0A=
+		if (ret)=0A=
+			return -1;=0A=
+	}=0A=
+=0A=
 	return 0;=0A=
 }=0A=
 =0A=
@@ -2850,6 +2895,115 @@ static int integck(void)=0A=
 }=0A=
 =0A=
 /*=0A=
+ * This is a helper function for 'make_ubifs_power_cut_reenable_path()' th=
at=0A=
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
+static char * make_ubifs_power_cut_reenable_path(void)=0A=
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
+	=0A=
+	sprintf(path_tail, "/ubifs/ubi%d_%d/tst_recovery", ubidev, ubivol);=0A=
+	return cat_strings(DEBUGFS_MOUNT_POINT, path_tail);=0A=
+}=0A=
+=0A=
+/*=0A=
+ * Set path to the power-cut enable knob file according to the type of=0A=
+ * the tested file system.=0A=
+ */=0A=
+static void set_power_cut_reenable_path(void)=0A=
+{=0A=
+	char * path;=0A=
+	struct stat st;=0A=
+=0A=
+	if (!strcmp("ubifs", fsinfo.fstype)) {=0A=
+		path =3D make_ubifs_power_cut_reenable_path();=0A=
+	} else {=0A=
+		errmsg("automatic power-cut re-enable not supported for %s",=0A=
+		       fsinfo.fstype);=0A=
+		CHECK(0);=0A=
+	}=0A=
+=0A=
+	if (stat(path, &st) =3D=3D -1) {=0A=
+		sys_errmsg("failed to stat power-cut re-enable knob '%s': %d",=0A=
+			   path, errno);=0A=
+		CHECK(0);=0A=
+	}=0A=
+=0A=
+	fsinfo.pc_reenable_path =3D path;=0A=
+}=0A=
+=0A=
+/*=0A=
  * This is a helper function for 'get_tested_fs_info()'. It parses file-sy=
stem=0A=
  * mount options string, extracts standard mount options from there, and s=
aves=0A=
  * them in the 'fsinfo.mount_flags' variable, and non-standard mount optio=
ns=0A=
@@ -3015,12 +3169,17 @@ static const char doc[] =3D PROGRAM_NAME " version =
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
+"automatically enables the use of power cut emulation on the tested fs ins=
tance\n"=0A=
+"only (currently implemented for UBIFS only).\n";=0A=
 =0A=
 static const char optionsstr[] =3D=0A=
 "-n, --repeat=3D<count> repeat count, default is 1; zero value - repeat fo=
rever\n"=0A=
 "-p, --power-cut      power cut testing mode (-n parameter is ignored and =
the\n"=0A=
 "                     test continues forever)\n"=0A=
+"-P, --pc-reenable    Like -p but power-cut mode is re-enabled by writing\=
n"=0A=
+"                     '1' to the associated sysfs file after every re-moun=
t.\n"=0A=
 "-e, --verify-ops     verify all operations, e.g., every time a file is wr=
itten\n"=0A=
 "                     to, read the data back and verify it, every time a\n=
"=0A=
 "                     directory is created, check that it exists, etc\n"=
=0A=
@@ -3031,13 +3190,14 @@ static const char optionsstr[] =3D=0A=
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
+	{ .name =3D "pc-reenable", .has_arg =3D 0, .flag =3D NULL, .val =3D 'P' }=
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
@@ -3052,7 +3212,7 @@ static int parse_opts(int argc, char * const argv[])=
=0A=
 	while (1) {=0A=
 		int key, error =3D 0;=0A=
 =0A=
-		key =3D getopt_long(argc, argv, "n:pm:evVh?", long_options, NULL);=0A=
+		key =3D getopt_long(argc, argv, "n:pPm:evVh?", long_options, NULL);=0A=
 		if (key =3D=3D -1)=0A=
 			break;=0A=
 =0A=
@@ -3063,7 +3223,11 @@ static int parse_opts(int argc, char * const argv[])=
=0A=
 				return errmsg("bad repeat count: \"%s\"", optarg);=0A=
 			break;=0A=
 		case 'p':=0A=
-			args.power_cut_mode =3D 1;=0A=
+			if (!args.power_cut_mode)=0A=
+				args.power_cut_mode =3D 1;=0A=
+			break;=0A=
+		case 'P':=0A=
+			args.power_cut_mode =3D 2;=0A=
 			break;=0A=
 		case 'm':=0A=
 			args.mtdn =3D simple_strtoul(optarg, &error);=0A=
@@ -3205,13 +3369,16 @@ static int recover_tested_fs(void)=0A=
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
@@ -3221,6 +3388,7 @@ static int recover_tested_fs(void)=0A=
 			return -1;=0A=
 		}=0A=
 	} else {=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 			    fsinfo.fstype, fsinfo.mount_flags | MS_RDONLY,=0A=
 			    fsinfo.mount_opts);=0A=
@@ -3232,6 +3400,7 @@ static int recover_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point,=0A=
 			    fsinfo.fstype, flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -3243,6 +3412,7 @@ static int recover_tested_fs(void)=0A=
 =0A=
 	if (rorw2) {=0A=
 		flags =3D fsinfo.mount_flags | MS_RDONLY | MS_REMOUNT;=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -3252,6 +3422,7 @@ static int recover_tested_fs(void)=0A=
 =0A=
 		flags =3D fsinfo.mount_flags | MS_REMOUNT;=0A=
 		flags &=3D ~((unsigned long)MS_RDONLY);=0A=
+		usleep(MOUNT_DELAY);=0A=
 		ret =3D mount(fsinfo.fsdev, fsinfo.mount_point, fsinfo.fstype,=0A=
 			    flags, fsinfo.mount_opts);=0A=
 		if (ret) {=0A=
@@ -3261,6 +3432,12 @@ static int recover_tested_fs(void)=0A=
 		}=0A=
 	}=0A=
 =0A=
+	if (args.power_cut_mode =3D=3D 2) {=0A=
+		ret =3D reenable_power_cut();=0A=
+		if (ret)=0A=
+			return -1;=0A=
+	}=0A=
+=0A=
 	return 0;=0A=
 }=0A=
 =0A=
@@ -3285,6 +3462,8 @@ int main(int argc, char *argv[])=0A=
 		return EXIT_FAILURE;=0A=
 =0A=
 	get_tested_fs_info();=0A=
+	if (args.power_cut_mode =3D=3D 2)=0A=
+		set_power_cut_reenable_path();=0A=
 =0A=
 	/* Seed the random generator with out PID */=0A=
 	random_seed =3D getpid();=
