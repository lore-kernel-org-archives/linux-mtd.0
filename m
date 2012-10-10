Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TLuUU-00045M-1a
 for linux-mtd@lists.infradead.org; Wed, 10 Oct 2012 11:30:19 +0000
Message-ID: <1349868630.20594.16.camel@sauron.fi.intel.com>
Subject: Re: mkfs.ubifs problem when output file really isn't in the UBIFS
 root directory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marcus Prebble <marcus.prebble@axis.com>
Date: Wed, 10 Oct 2012 14:30:30 +0300
In-Reply-To: <1349865249.2552.1965.camel@lnxprebble2.se.axis.com>
References: <1348242118.2552.1460.camel@lnxprebble2.se.axis.com>
 <1349367416.20373.75.camel@sauron.fi.intel.com>
 <1349708696.2552.1821.camel@lnxprebble2.se.axis.com>
 <1349851661.20594.6.camel@sauron.fi.intel.com>
 <1349859856.2552.1962.camel@lnxprebble2.se.axis.com>
 <1349861452.20594.12.camel@sauron.fi.intel.com>
 <1349865249.2552.1965.camel@lnxprebble2.se.axis.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hsdS+JBFAzvaH0K2+Yvb"
Mime-Version: 1.0
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-hsdS+JBFAzvaH0K2+Yvb
Content-Type: multipart/mixed; boundary="=-XdGn5+fecTJ/i5cWU+eh"


--=-XdGn5+fecTJ/i5cWU+eh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-10-10 at 12:34 +0200, Marcus Prebble wrote:
> I will implement and come back with a patch when I have time.

I actually went ahead and cooked something. Could you please review and
give it a test? Inlined below and also attached. Thanks!


=46rom 7c1b939f2cf0141dfb1969d51b4157a75f55ddac Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Date: Wed, 10 Oct 2012 14:23:18 +0300
Subject: [PATCH] mkfs.ubifs: rewrite path checking

We use the 'in_path()' function to check whether the output image is
withing the mkfs.ubifs root directory or not. However, this function
is not correct and it fails for the following situation, as
Marcus Prebble <marcus.prebble@axis.com> reports:

1. We have our root file-system mounted at / and want to build an image
   out of it.
2. We have tmpfs mounted at /tmp
3. We mount the root file-system under /tmp/newroot
4. We run mkfs.ubifs with -r /tmp/newroot -o /tmp/image

And this fails. It fails because 'in_path()' misses this use-case.

This patch re-implements the check completely. Now we use 'realpath()'
to find canonical paths and just check that the output file is not
under the root mkfs.ubifs directory.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 mkfs.ubifs/mkfs.ubifs.c | 116 +++++++++++++++-----------------------------=
----
 1 file changed, 37 insertions(+), 79 deletions(-)

diff --git a/mkfs.ubifs/mkfs.ubifs.c b/mkfs.ubifs/mkfs.ubifs.c
index 149806b..885c202 100644
--- a/mkfs.ubifs/mkfs.ubifs.c
+++ b/mkfs.ubifs/mkfs.ubifs.c
@@ -20,6 +20,7 @@
  *          Zoltan Sogor
  */
=20
+#define _XOPEN_SOURCE 500 /* For realpath() */
 #define PROGRAM_NAME "mkfs.ubifs"
=20
 #include "mkfs.ubifs.h"
@@ -235,93 +236,50 @@ static char *make_path(const char *dir, const char *n=
ame)
 }
=20
 /**
- * same_dir - determine if two file descriptors refer to the same director=
y.
- * @fd1: file descriptor 1
- * @fd2: file descriptor 2
- */
-static int same_dir(int fd1, int fd2)
-{
-	struct stat stat1, stat2;
-
-	if (fstat(fd1, &stat1) =3D=3D -1)
-		return -1;
-	if (fstat(fd2, &stat2) =3D=3D -1)
-		return -1;
-	return stat1.st_dev =3D=3D stat2.st_dev && stat1.st_ino =3D=3D stat2.st_i=
no;
-}
-
-/**
- * do_openat - open a file in a directory.
- * @fd: file descriptor of open directory
- * @path: path relative to directory
- * @flags: open flags
+ * is_contained - determine if a file is beneath a directory.
+ * @file: file path name
+ * @dir: directory path name
  *
- * This function is provided because the library function openat is someti=
mes
- * not available.
+ * This function returns %1 if @file is accessible from the @dir directory=
 and
+ * %0 otherwise. In case of error, returns %-1.
  */
-static int do_openat(int fd, const char *path, int flags)
+static int is_contained(const char *file, const char *dir)
 {
-	int ret;
-	char *cwd;
+	char *file_base, *copy, *real_file, *real_dir, *p;
=20
-	cwd =3D getcwd(NULL, 0);
-	if (!cwd)
+	/* Make a copy of the file path because 'dirname()' can modify it */
+	copy =3D strdup(file);
+	if (!copy)
 		return -1;
-	ret =3D fchdir(fd);
-	if (ret !=3D -1)
-		ret =3D open(path, flags);
-	if (chdir(cwd) && !ret)
-		ret =3D -1;
-	free(cwd);
-	return ret;
-}
+	file_base =3D dirname(copy);
=20
-/**
- * in_path - determine if a file is beneath a directory.
- * @dir_name: directory path name
- * @file_name: file path name
- */
-static int in_path(const char *dir_name, const char *file_name)
-{
-	char *fn =3D strdup(file_name);
-	char *dn;
-	int fd1, fd2, fd3, ret =3D -1, top_fd;
+	/* Turn the paths into the canonical form */
+	real_file =3D malloc(PATH_MAX);
+	if (!real_file) {
+		free(copy);
+		return -1;
+	}
=20
-	if (!fn)
+	real_dir =3D malloc(PATH_MAX);
+	if (!real_dir) {
+		free(real_file);
+		free(copy);
+		return -1;
+	}
+	if (!realpath(file_base, real_file)) {
+		perror("realpath");
 		return -1;
-	top_fd =3D open("/", O_RDONLY);
-	if (top_fd !=3D -1) {
-		dn =3D dirname(fn);
-		fd1 =3D open(dir_name, O_RDONLY);
-		if (fd1 !=3D -1) {
-			fd2 =3D open(dn, O_RDONLY);
-			if (fd2 !=3D -1) {
-				while (1) {
-					int same;
-
-					same =3D same_dir(fd1, fd2);
-					if (same) {
-						ret =3D same;
-						break;
-					}
-					if (same_dir(fd2, top_fd)) {
-						ret =3D 0;
-						break;
-					}
-					fd3 =3D do_openat(fd2, "..", O_RDONLY);
-					if (fd3 =3D=3D -1)
-						break;
-					close(fd2);
-					fd2 =3D fd3;
-				}
-				close(fd2);
-			}
-			close(fd1);
-		}
-		close(top_fd);
 	}
-	free(fn);
-	return ret;
+	if (!realpath(dir, real_dir)) {
+		perror("realpath");
+		return -1;
+	}
+
+	p =3D strstr(real_file, real_dir);
+	free(real_dir);
+	free(real_file);
+	free(copy);
+	return !!p;
 }
=20
 /**
@@ -376,7 +334,7 @@ static int validate_options(void)
=20
 	if (!output)
 		return err_msg("no output file or UBI volume specified");
-	if (root && in_path(root, output))
+	if (root && is_contained(output, root))
 		return err_msg("output file cannot be in the UBIFS root "
 			       "directory");
 	if (!is_power_of_2(c->min_io_size))
--=20
1.7.11.4



--=20
Best Regards,
Artem Bityutskiy

--=-XdGn5+fecTJ/i5cWU+eh
Content-Disposition: attachment; filename="0001-mkfs.ubifs-rewrite-path-checking.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-mkfs.ubifs-rewrite-path-checking.patch";
	charset="UTF-8"

RnJvbSA3YzFiOTM5ZjJjZjAxNDFkZmIxOTY5ZDUxYjQxNTdhNzVmNTVkZGFjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogQXJ0ZW0gQml0eXV0c2tpeSA8YXJ0ZW0uYml0eXV0c2tpeUBs
aW51eC5pbnRlbC5jb20+DQpEYXRlOiBXZWQsIDEwIE9jdCAyMDEyIDE0OjIzOjE4ICswMzAwDQpT
dWJqZWN0OiBbUEFUQ0hdIG1rZnMudWJpZnM6IHJld3JpdGUgcGF0aCBjaGVja2luZw0KDQpXZSB1
c2UgdGhlICdpbl9wYXRoKCknIGZ1bmN0aW9uIHRvIGNoZWNrIHdoZXRoZXIgdGhlIG91dHB1dCBp
bWFnZSBpcw0Kd2l0aGluZyB0aGUgbWtmcy51YmlmcyByb290IGRpcmVjdG9yeSBvciBub3QuIEhv
d2V2ZXIsIHRoaXMgZnVuY3Rpb24NCmlzIG5vdCBjb3JyZWN0IGFuZCBpdCBmYWlscyBmb3IgdGhl
IGZvbGxvd2luZyBzaXR1YXRpb24sIGFzDQpNYXJjdXMgUHJlYmJsZSA8bWFyY3VzLnByZWJibGVA
YXhpcy5jb20+IHJlcG9ydHM6DQoNCjEuIFdlIGhhdmUgb3VyIHJvb3QgZmlsZS1zeXN0ZW0gbW91
bnRlZCBhdCAvIGFuZCB3YW50IHRvIGJ1aWxkIGFuIGltYWdlDQogICBvdXQgb2YgaXQuDQoyLiBX
ZSBoYXZlIHRtcGZzIG1vdW50ZWQgYXQgL3RtcA0KMy4gV2UgbW91bnQgdGhlIHJvb3QgZmlsZS1z
eXN0ZW0gdW5kZXIgL3RtcC9uZXdyb290DQo0LiBXZSBydW4gbWtmcy51YmlmcyB3aXRoIC1yIC90
bXAvbmV3cm9vdCAtbyAvdG1wL2ltYWdlDQoNCkFuZCB0aGlzIGZhaWxzLiBJdCBmYWlscyBiZWNh
dXNlICdpbl9wYXRoKCknIG1pc3NlcyB0aGlzIHVzZS1jYXNlLg0KDQpUaGlzIHBhdGNoIHJlLWlt
cGxlbWVudHMgdGhlIGNoZWNrIGNvbXBsZXRlbHkuIE5vdyB3ZSB1c2UgJ3JlYWxwYXRoKCknDQp0
byBmaW5kIGNhbm9uaWNhbCBwYXRocyBhbmQganVzdCBjaGVjayB0aGF0IHRoZSBvdXRwdXQgZmls
ZSBpcyBub3QNCnVuZGVyIHRoZSByb290IG1rZnMudWJpZnMgZGlyZWN0b3J5Lg0KDQpTaWduZWQt
b2ZmLWJ5OiBBcnRlbSBCaXR5dXRza2l5IDxhcnRlbS5iaXR5dXRza2l5QGxpbnV4LmludGVsLmNv
bT4NCi0tLQ0KIG1rZnMudWJpZnMvbWtmcy51Ymlmcy5jIHwgMTE2ICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzNyBpbnNl
cnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL21rZnMudWJpZnMvbWtm
cy51Ymlmcy5jIGIvbWtmcy51Ymlmcy9ta2ZzLnViaWZzLmMNCmluZGV4IDE0OTgwNmIuLjg4NWMy
MDIgMTAwNjQ0DQotLS0gYS9ta2ZzLnViaWZzL21rZnMudWJpZnMuYw0KKysrIGIvbWtmcy51Ymlm
cy9ta2ZzLnViaWZzLmMNCkBAIC0yMCw2ICsyMCw3IEBADQogICogICAgICAgICAgWm9sdGFuIFNv
Z29yDQogICovDQogDQorI2RlZmluZSBfWE9QRU5fU09VUkNFIDUwMCAvKiBGb3IgcmVhbHBhdGgo
KSAqLw0KICNkZWZpbmUgUFJPR1JBTV9OQU1FICJta2ZzLnViaWZzIg0KIA0KICNpbmNsdWRlICJt
a2ZzLnViaWZzLmgiDQpAQCAtMjM1LDkzICsyMzYsNTAgQEAgc3RhdGljIGNoYXIgKm1ha2VfcGF0
aChjb25zdCBjaGFyICpkaXIsIGNvbnN0IGNoYXIgKm5hbWUpDQogfQ0KIA0KIC8qKg0KLSAqIHNh
bWVfZGlyIC0gZGV0ZXJtaW5lIGlmIHR3byBmaWxlIGRlc2NyaXB0b3JzIHJlZmVyIHRvIHRoZSBz
YW1lIGRpcmVjdG9yeS4NCi0gKiBAZmQxOiBmaWxlIGRlc2NyaXB0b3IgMQ0KLSAqIEBmZDI6IGZp
bGUgZGVzY3JpcHRvciAyDQotICovDQotc3RhdGljIGludCBzYW1lX2RpcihpbnQgZmQxLCBpbnQg
ZmQyKQ0KLXsNCi0Jc3RydWN0IHN0YXQgc3RhdDEsIHN0YXQyOw0KLQ0KLQlpZiAoZnN0YXQoZmQx
LCAmc3RhdDEpID09IC0xKQ0KLQkJcmV0dXJuIC0xOw0KLQlpZiAoZnN0YXQoZmQyLCAmc3RhdDIp
ID09IC0xKQ0KLQkJcmV0dXJuIC0xOw0KLQlyZXR1cm4gc3RhdDEuc3RfZGV2ID09IHN0YXQyLnN0
X2RldiAmJiBzdGF0MS5zdF9pbm8gPT0gc3RhdDIuc3RfaW5vOw0KLX0NCi0NCi0vKioNCi0gKiBk
b19vcGVuYXQgLSBvcGVuIGEgZmlsZSBpbiBhIGRpcmVjdG9yeS4NCi0gKiBAZmQ6IGZpbGUgZGVz
Y3JpcHRvciBvZiBvcGVuIGRpcmVjdG9yeQ0KLSAqIEBwYXRoOiBwYXRoIHJlbGF0aXZlIHRvIGRp
cmVjdG9yeQ0KLSAqIEBmbGFnczogb3BlbiBmbGFncw0KKyAqIGlzX2NvbnRhaW5lZCAtIGRldGVy
bWluZSBpZiBhIGZpbGUgaXMgYmVuZWF0aCBhIGRpcmVjdG9yeS4NCisgKiBAZmlsZTogZmlsZSBw
YXRoIG5hbWUNCisgKiBAZGlyOiBkaXJlY3RvcnkgcGF0aCBuYW1lDQogICoNCi0gKiBUaGlzIGZ1
bmN0aW9uIGlzIHByb3ZpZGVkIGJlY2F1c2UgdGhlIGxpYnJhcnkgZnVuY3Rpb24gb3BlbmF0IGlz
IHNvbWV0aW1lcw0KLSAqIG5vdCBhdmFpbGFibGUuDQorICogVGhpcyBmdW5jdGlvbiByZXR1cm5z
ICUxIGlmIEBmaWxlIGlzIGFjY2Vzc2libGUgZnJvbSB0aGUgQGRpciBkaXJlY3RvcnkgYW5kDQor
ICogJTAgb3RoZXJ3aXNlLiBJbiBjYXNlIG9mIGVycm9yLCByZXR1cm5zICUtMS4NCiAgKi8NCi1z
dGF0aWMgaW50IGRvX29wZW5hdChpbnQgZmQsIGNvbnN0IGNoYXIgKnBhdGgsIGludCBmbGFncykN
CitzdGF0aWMgaW50IGlzX2NvbnRhaW5lZChjb25zdCBjaGFyICpmaWxlLCBjb25zdCBjaGFyICpk
aXIpDQogew0KLQlpbnQgcmV0Ow0KLQljaGFyICpjd2Q7DQorCWNoYXIgKmZpbGVfYmFzZSwgKmNv
cHksICpyZWFsX2ZpbGUsICpyZWFsX2RpciwgKnA7DQogDQotCWN3ZCA9IGdldGN3ZChOVUxMLCAw
KTsNCi0JaWYgKCFjd2QpDQorCS8qIE1ha2UgYSBjb3B5IG9mIHRoZSBmaWxlIHBhdGggYmVjYXVz
ZSAnZGlybmFtZSgpJyBjYW4gbW9kaWZ5IGl0ICovDQorCWNvcHkgPSBzdHJkdXAoZmlsZSk7DQor
CWlmICghY29weSkNCiAJCXJldHVybiAtMTsNCi0JcmV0ID0gZmNoZGlyKGZkKTsNCi0JaWYgKHJl
dCAhPSAtMSkNCi0JCXJldCA9IG9wZW4ocGF0aCwgZmxhZ3MpOw0KLQlpZiAoY2hkaXIoY3dkKSAm
JiAhcmV0KQ0KLQkJcmV0ID0gLTE7DQotCWZyZWUoY3dkKTsNCi0JcmV0dXJuIHJldDsNCi19DQor
CWZpbGVfYmFzZSA9IGRpcm5hbWUoY29weSk7DQogDQotLyoqDQotICogaW5fcGF0aCAtIGRldGVy
bWluZSBpZiBhIGZpbGUgaXMgYmVuZWF0aCBhIGRpcmVjdG9yeS4NCi0gKiBAZGlyX25hbWU6IGRp
cmVjdG9yeSBwYXRoIG5hbWUNCi0gKiBAZmlsZV9uYW1lOiBmaWxlIHBhdGggbmFtZQ0KLSAqLw0K
LXN0YXRpYyBpbnQgaW5fcGF0aChjb25zdCBjaGFyICpkaXJfbmFtZSwgY29uc3QgY2hhciAqZmls
ZV9uYW1lKQ0KLXsNCi0JY2hhciAqZm4gPSBzdHJkdXAoZmlsZV9uYW1lKTsNCi0JY2hhciAqZG47
DQotCWludCBmZDEsIGZkMiwgZmQzLCByZXQgPSAtMSwgdG9wX2ZkOw0KKwkvKiBUdXJuIHRoZSBw
YXRocyBpbnRvIHRoZSBjYW5vbmljYWwgZm9ybSAqLw0KKwlyZWFsX2ZpbGUgPSBtYWxsb2MoUEFU
SF9NQVgpOw0KKwlpZiAoIXJlYWxfZmlsZSkgew0KKwkJZnJlZShjb3B5KTsNCisJCXJldHVybiAt
MTsNCisJfQ0KIA0KLQlpZiAoIWZuKQ0KKwlyZWFsX2RpciA9IG1hbGxvYyhQQVRIX01BWCk7DQor
CWlmICghcmVhbF9kaXIpIHsNCisJCWZyZWUocmVhbF9maWxlKTsNCisJCWZyZWUoY29weSk7DQor
CQlyZXR1cm4gLTE7DQorCX0NCisJaWYgKCFyZWFscGF0aChmaWxlX2Jhc2UsIHJlYWxfZmlsZSkp
IHsNCisJCXBlcnJvcigicmVhbHBhdGgiKTsNCiAJCXJldHVybiAtMTsNCi0JdG9wX2ZkID0gb3Bl
bigiLyIsIE9fUkRPTkxZKTsNCi0JaWYgKHRvcF9mZCAhPSAtMSkgew0KLQkJZG4gPSBkaXJuYW1l
KGZuKTsNCi0JCWZkMSA9IG9wZW4oZGlyX25hbWUsIE9fUkRPTkxZKTsNCi0JCWlmIChmZDEgIT0g
LTEpIHsNCi0JCQlmZDIgPSBvcGVuKGRuLCBPX1JET05MWSk7DQotCQkJaWYgKGZkMiAhPSAtMSkg
ew0KLQkJCQl3aGlsZSAoMSkgew0KLQkJCQkJaW50IHNhbWU7DQotDQotCQkJCQlzYW1lID0gc2Ft
ZV9kaXIoZmQxLCBmZDIpOw0KLQkJCQkJaWYgKHNhbWUpIHsNCi0JCQkJCQlyZXQgPSBzYW1lOw0K
LQkJCQkJCWJyZWFrOw0KLQkJCQkJfQ0KLQkJCQkJaWYgKHNhbWVfZGlyKGZkMiwgdG9wX2ZkKSkg
ew0KLQkJCQkJCXJldCA9IDA7DQotCQkJCQkJYnJlYWs7DQotCQkJCQl9DQotCQkJCQlmZDMgPSBk
b19vcGVuYXQoZmQyLCAiLi4iLCBPX1JET05MWSk7DQotCQkJCQlpZiAoZmQzID09IC0xKQ0KLQkJ
CQkJCWJyZWFrOw0KLQkJCQkJY2xvc2UoZmQyKTsNCi0JCQkJCWZkMiA9IGZkMzsNCi0JCQkJfQ0K
LQkJCQljbG9zZShmZDIpOw0KLQkJCX0NCi0JCQljbG9zZShmZDEpOw0KLQkJfQ0KLQkJY2xvc2Uo
dG9wX2ZkKTsNCiAJfQ0KLQlmcmVlKGZuKTsNCi0JcmV0dXJuIHJldDsNCisJaWYgKCFyZWFscGF0
aChkaXIsIHJlYWxfZGlyKSkgew0KKwkJcGVycm9yKCJyZWFscGF0aCIpOw0KKwkJcmV0dXJuIC0x
Ow0KKwl9DQorDQorCXAgPSBzdHJzdHIocmVhbF9maWxlLCByZWFsX2Rpcik7DQorCWZyZWUocmVh
bF9kaXIpOw0KKwlmcmVlKHJlYWxfZmlsZSk7DQorCWZyZWUoY29weSk7DQorCXJldHVybiAhIXA7
DQogfQ0KIA0KIC8qKg0KQEAgLTM3Niw3ICszMzQsNyBAQCBzdGF0aWMgaW50IHZhbGlkYXRlX29w
dGlvbnModm9pZCkNCiANCiAJaWYgKCFvdXRwdXQpDQogCQlyZXR1cm4gZXJyX21zZygibm8gb3V0
cHV0IGZpbGUgb3IgVUJJIHZvbHVtZSBzcGVjaWZpZWQiKTsNCi0JaWYgKHJvb3QgJiYgaW5fcGF0
aChyb290LCBvdXRwdXQpKQ0KKwlpZiAocm9vdCAmJiBpc19jb250YWluZWQob3V0cHV0LCByb290
KSkNCiAJCXJldHVybiBlcnJfbXNnKCJvdXRwdXQgZmlsZSBjYW5ub3QgYmUgaW4gdGhlIFVCSUZT
IHJvb3QgIg0KIAkJCSAgICAgICAiZGlyZWN0b3J5Iik7DQogCWlmICghaXNfcG93ZXJfb2ZfMihj
LT5taW5faW9fc2l6ZSkpDQotLSANCjEuNy4xMS40DQoNCg==


--=-XdGn5+fecTJ/i5cWU+eh--

--=-hsdS+JBFAzvaH0K2+Yvb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQdVxWAAoJECmIfjd9wqK04zEP/0qc1Biz54cQ6+/lVJ0nCfRh
RMFjRHecrW3U1RoKW5TNLrnnLa+miKcEg+X9R4o1HHOAEdDZRfQH/nsMau6ucMrw
neaj1n4qJhr+TAytlyNHLzlb/ybICo5jnwS7y8UmGYxW3jmJM/zECJzDuyckTsvi
hF93gzVgJRsrcdF1gDmBJ42EICYuMdydjd1HWKfNJR6OTMswdkMbBvPjs1EzQ0uw
11WX+xvN9/XrRuNl/QB6h1mwCqDq8D75CHo1DKme3yrpw8EBc698Tpw+Cd+WV/uA
cR8Yj3pKOXEC1RiKBYgCd5jCQBhJnU8G9JlBwR+N/tiOGMOefk5vQxubFYF2oOFF
ETZSjyBE0YUqZWZZA451IN+1LWh5jagn7g/eLHyUvD0UOYrAebS6n2BquUcsiale
WUTJfZKE8UP0cwOuXVAmRSbeliCDY3BGWmrK4IHERXTKh/HNJvSsupbWNsbz/VJn
gRZm6vvTMf6kJ79J8gMzYOc13HYrVlZSNGdQtfD2/xuhcRkAVcAP5Svw8Jwfd5YM
fLEvPK8tskZdackZKWNFt+sLPENNeFXGNKTMKAjyD1mhsQbEkZL7ZDtYFEqkmV3Z
ZpiMWBnsed+mVkkS8frA9IRgzmRVC4Xdyam7YFG5o28BsmgPQEc0VmRsPM2tfGfz
2cwuvHhXE6PKg3Hq+l++
=UzKw
-----END PGP SIGNATURE-----

--=-hsdS+JBFAzvaH0K2+Yvb--
