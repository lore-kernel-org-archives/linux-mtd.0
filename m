Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EgvEX-0004pc-TJ
	for linux-mtd@lists.infradead.org; Mon, 28 Nov 2005 21:28:50 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1EgvDA-0000z6-3q
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 03:27:16 +0100
Received: from desk.marajade.sandelman.ca ([205.150.200.247])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 03:27:16 +0100
Received: from mcr by desk.marajade.sandelman.ca with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Nov 2005 03:27:16 +0100
To: linux-mtd@lists.infradead.org
From: Michael Richardson <mcr@sandelman.ottawa.on.ca>
Date: Mon, 28 Nov 2005 21:26:22 -0500
Message-ID: <v0mzjofaup.fsf@marajade.sandelman.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
Sender: news <news@sea.gmane.org>
Subject: [PATCH 1/2] --cvs-exclude for mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--=-=-=



This adds an option to ignore CVS directories.
We keep bunch of our system that are hard to recreated easily from source
in CVS, and we don't really want to waste space with CVS/Entries, etc.

Man page in following patch.

Signoff: Michael Richardson <mcr@sandelman.ca>

---

 util/mkfs.jffs2.c |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)

applies-to: 078d53047fee81aaab9205a659805a07715076e5
092cb3518a5faa486e62a83796a280f3d45e1229
diff --git a/util/mkfs.jffs2.c b/util/mkfs.jffs2.c
index 7e60a3f..fe0cc63 100644
--- a/util/mkfs.jffs2.c
+++ b/util/mkfs.jffs2.c
@@ -69,6 +69,14 @@
 #undef crc32
 #include "crc32.h"
 
+#ifndef TRUE
+#define TRUE 1
+#endif
+#ifndef FALSE
+#define FALSE 0
+#endif
+
+
 /* Do not use the wierd XPG version of basename */
 #undef basename
 
@@ -101,6 +109,7 @@ static int verbose = 0;
 static int squash_uids = 0;
 static int squash_perms = 0;
 static int fake_times = 0;
+static int CVSexclude = FALSE;
 int target_endian = __BYTE_ORDER;
 static const char *const app_name = "mkfs.jffs2";
 static const char *const memory_exhausted = "memory exhausted";
@@ -391,6 +400,15 @@ static struct filesystem_entry *recursiv
 			continue;
 		}
 
+		/* ignore the CVS directories */
+		if(CVSexclude &&
+		   (strcmp(dp->d_name, "CVS")==0
+		    || strcmp(dp->d_name, ".KEEP_ME")==0
+		    )) {
+		  free(dp);
+		  continue;
+		}
+
 		asprintf(&hpath, "%s/%s", hostpath, dp->d_name);
 		if (lstat(hpath, &sb)) {
 			perror_msg_and_die("%s", hpath);
@@ -1171,6 +1189,7 @@ static struct option long_options[] = {
 	{"disable-compressor", 1, NULL, 'x'},
 	{"test-compression", 0, NULL, 't'},
 	{"compressor-priority", 1, NULL, 'y'},
+	{"cvs-exclude", 0, NULL, 'C'},
 	{"incremental", 1, NULL, 'i'},
 	{NULL, 0, NULL, 0}
 };
@@ -1183,6 +1202,7 @@ static char *helptext =
 	"                          not specified, the output is padded to the end of\n"
 	"                          the final erase block\n"
 	"  -r, -d, --root=DIR      Build file system from directory DIR (default: cwd)\n"
+        "  --cvs-exclude           Ignore CVS directories, and .KEEP_ME files\n"
 	"  -s, --pagesize=SIZE     Use page size (max data node size) SIZE (default: 4KiB)\n"
 	"  -e, --eraseblock=SIZE   Use erase block size SIZE (default: 64KiB)\n"
 	"  -c, --eraseblock-header=SIZE  Size of eraseblock header (default 28)\n"
@@ -1388,6 +1408,10 @@ int main(int argc, char **argv)
 				rootdir = xstrdup(optarg);
 				break;
 
+ 		        case 'C':
+			        CVSexclude = TRUE;
+			        break;
+
 			case 's':
 				page_size = strtol(optarg, NULL, 0);
 				break;
@@ -1548,6 +1572,10 @@ int main(int argc, char **argv)
 	if (!(cwd = getcwd(0, GETCWD_SIZE)))
 		perror_msg_and_die("getcwd failed");
 
+	if(verbose) {
+	  printf("Initializing image from %s (%s)\n", rootdir, cwd);
+	}
+
 	if(in_fd != -1)
 		parse_image();
 
---
0.99.9.GIT


-- 
]       ON HUMILITY: to err is human. To moo, bovine.           |  firewalls  [
]   Michael Richardson,    Xelerance Corporation, Ottawa, ON    |net architect[
] mcr@xelerance.com      http://www.sandelman.ottawa.on.ca/mcr/ |device driver[
] panic("Just another Debian GNU/Linux using, kernel hacking, security guy"); [

--=-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iQEVAwUAQ4u8UYCLcPvd0N1lAQI+Kwf/XFVLqmj+Rc2kpj58d9lpATCExBA/U4mU
3d1aOa/ZK/FMT6Fy2vgovBY5VI64a2Dyqoj0OO7HEzo5tzFC3FWBfC5J93dB061p
sGLLM9Wwf7mjOI2RZV7L9+mLm0Hz4DElYsHLlZGcUO1IZNN3XPVEjkHsHT7SnQfH
JrMJX0TlITY6MY7f2yV4K6KTquNW6lslgDPX7DyfjZvdom6DF3nkOBNkwm2uAHzq
8KIiqFMCME5Kuv59YGPNBxanSOW5HHgyCM8Pir7IICyVd4AtOq7lplCUo7eDXkwt
6g5xXrUuahzbfHBvE+vzK78D9L1K3VE4Yg8JO0BMv2qKlGLitRDWxw==
=2Arx
-----END PGP SIGNATURE-----
--=-=-=--
