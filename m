Received: from miranda.se.axis.com ([193.13.178.8])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GkFhC-0001AO-Ek
	for linux-mtd@lists.infradead.org; Wed, 15 Nov 2006 03:00:40 -0500
Date: Wed, 15 Nov 2006 09:02:34 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: KokHow.Teh@infineon.com
Subject: Re: Mkfs.jffs2.c:68:21: sys/acl.h: No such file or directory
In-Reply-To: <5049F8BE55F36348A315EFBE6CF34386980112@sinse301.ap.infineon.com>
Message-ID: <Pine.LNX.4.64.0611150853370.5230@lnxricardw.se.axis.com>
References: <5049F8BE55F36348A315EFBE6CF34386980112@sinse301.ap.infineon.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="218815243-1741278625-1163577754=:5230"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--218815243-1741278625-1163577754=:5230
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Wed, 15 Nov 2006, KokHow.Teh@infineon.com wrote:

> =09I am trying to build mtd-utils-1.0.1 using a mips cross
> toolchain and I am stumbled at mkfs.jffs2 which includes sys/acl.h and
> it is not present anywhere in my mips toolchain include directory but it
> is present in my host /usr/include/sys/acl.h Has anybody encoutered this
> problem before that you could enlighten me on this?

We've encountered the same problem. I'll expose my ignorance here and say=
=20
that all I know is that acl.h is used for some form of access control list=
=20
feature that has been introduced to mkfs.jffs2, but I don't really know=20
what it is for.

We didn't need this feature either so I made a patch to optionally remove=
=20
it from the source, controlled by a #define; it is included as an=20
attachment and in the text below. Don't know if this should really be=20
included in the main stream source. Obviously at least two people have=20
come up against this as a problem.

/Ricard


--- mtd-utils-1.0.1/mkfs.jffs2.c=092006-09-18 09:42:57.000000000 +0200
+++ mtdutils/mkfs.jffs2.c=092006-10-17 13:40:40.000000000 +0200
@@ -47,6 +47,8 @@
   *  -Erik, November 2002
   */

+#undef HAVE_ACL
+
  #define _GNU_SOURCE
  #include <sys/types.h>
  #include <stdio.h>
@@ -65,7 +67,9 @@
  #include <time.h>
  #include <getopt.h>
  #include <sys/xattr.h>
+#ifdef HAVE_ACL
  #include <sys/acl.h>
+#endif
  #include <byteswap.h>
  #define crc32 __complete_crap
  #include <zlib.h>
@@ -1030,6 +1034,7 @@
  =09padword();
  }

+#ifdef HAVE_ACL
  typedef struct xattr_entry {
  =09struct xattr_entry *next;
  =09uint32_t xid;
@@ -1258,6 +1263,10 @@
  =09=09padword();
  =09}
  }
+#else
+/* don't do anything, corresponds to  if (!enable_xattr) return;  above */
+#define write_xattr_entry(x)
+#endif

  static void recursive_populate_directory(struct filesystem_entry *dir)
  {
@@ -1451,9 +1460,11 @@
  =09"  -q, --squash            Squash permissions and owners making all fi=
les be owned by root\n"
  =09"  -U, --squash-uids       Squash owners making all files be owned by =
root\n"
  =09"  -P, --squash-perms      Squash permissions on all files\n"
+#ifdef HAVE_ACL
  =09"      --with-xattr        stuff all xattr entries into image\n"
  =09"      --with-selinux      stuff only SELinux Labels into jffs2 image\=
n"
  =09"      --with-posix-acl    stuff only POSIX ACL entries into jffs2 ima=
ge\n"
+#endif
  =09"  -h, --help              Display this help text\n"
  =09"  -v, --verbose           Verbose operation\n"
  =09"  -V, --version           Display version information\n"
@@ -1772,6 +1783,7 @@
  =09=09=09=09=09perror_msg_and_die("cannot open (incremental) file");
  =09=09=09=09}
  =09=09=09=09break;
+#ifdef HAVE_ACL
  =09=09=09case 1000:=09/* --with-xattr  */
  =09=09=09=09enable_xattr |=3D (1 << JFFS2_XPREFIX_USER)
  =09=09=09=09=09=09| (1 << JFFS2_XPREFIX_SECURITY)
@@ -1786,6 +1798,7 @@
  =09=09=09=09enable_xattr |=3D (1 << JFFS2_XPREFIX_ACL_ACCESS)
  =09=09=09=09=09=09| (1 << JFFS2_XPREFIX_ACL_DEFAULT);
  =09=09=09=09break;
+#endif
  =09=09}
  =09}
  =09if (out_fd =3D=3D -1) {

--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-1741278625-1163577754=:5230
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=mkfs.jffs2.noacl.patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0611150902340.5230@lnxricardw.se.axis.com>
Content-Description: Patch file 
Content-Disposition: attachment; filename=mkfs.jffs2.noacl.patch

LS0tIG10ZC11dGlscy0xLjAuMS9ta2ZzLmpmZnMyLmMJMjAwNi0wOS0xOCAw
OTo0Mjo1Ny4wMDAwMDAwMDAgKzAyMDANCisrKyBtdGR1dGlscy9ta2ZzLmpm
ZnMyLmMJMjAwNi0xMC0xNyAxMzo0MDo0MC4wMDAwMDAwMDAgKzAyMDANCkBA
IC00Nyw2ICs0Nyw4IEBADQogICogIC1FcmlrLCBOb3ZlbWJlciAyMDAyDQog
ICovDQogDQorI3VuZGVmIEhBVkVfQUNMDQorDQogI2RlZmluZSBfR05VX1NP
VVJDRQ0KICNpbmNsdWRlIDxzeXMvdHlwZXMuaD4NCiAjaW5jbHVkZSA8c3Rk
aW8uaD4NCkBAIC02NSw3ICs2Nyw5IEBADQogI2luY2x1ZGUgPHRpbWUuaD4N
CiAjaW5jbHVkZSA8Z2V0b3B0Lmg+DQogI2luY2x1ZGUgPHN5cy94YXR0ci5o
Pg0KKyNpZmRlZiBIQVZFX0FDTA0KICNpbmNsdWRlIDxzeXMvYWNsLmg+DQor
I2VuZGlmDQogI2luY2x1ZGUgPGJ5dGVzd2FwLmg+DQogI2RlZmluZSBjcmMz
MiBfX2NvbXBsZXRlX2NyYXANCiAjaW5jbHVkZSA8emxpYi5oPg0KQEAgLTEw
MzAsNiArMTAzNCw3IEBADQogCXBhZHdvcmQoKTsNCiB9DQogDQorI2lmZGVm
IEhBVkVfQUNMDQogdHlwZWRlZiBzdHJ1Y3QgeGF0dHJfZW50cnkgew0KIAlz
dHJ1Y3QgeGF0dHJfZW50cnkgKm5leHQ7DQogCXVpbnQzMl90IHhpZDsNCkBA
IC0xMjU4LDYgKzEyNjMsMTAgQEANCiAJCXBhZHdvcmQoKTsNCiAJfQ0KIH0N
CisjZWxzZQ0KKy8qIGRvbid0IGRvIGFueXRoaW5nLCBjb3JyZXNwb25kcyB0
byAgaWYgKCFlbmFibGVfeGF0dHIpIHJldHVybjsgIGFib3ZlICovDQorI2Rl
ZmluZSB3cml0ZV94YXR0cl9lbnRyeSh4KQ0KKyNlbmRpZg0KIA0KIHN0YXRp
YyB2b2lkIHJlY3Vyc2l2ZV9wb3B1bGF0ZV9kaXJlY3Rvcnkoc3RydWN0IGZp
bGVzeXN0ZW1fZW50cnkgKmRpcikNCiB7DQpAQCAtMTQ1MSw5ICsxNDYwLDEx
IEBADQogCSIgIC1xLCAtLXNxdWFzaCAgICAgICAgICAgIFNxdWFzaCBwZXJt
aXNzaW9ucyBhbmQgb3duZXJzIG1ha2luZyBhbGwgZmlsZXMgYmUgb3duZWQg
Ynkgcm9vdFxuIg0KIAkiICAtVSwgLS1zcXVhc2gtdWlkcyAgICAgICBTcXVh
c2ggb3duZXJzIG1ha2luZyBhbGwgZmlsZXMgYmUgb3duZWQgYnkgcm9vdFxu
Ig0KIAkiICAtUCwgLS1zcXVhc2gtcGVybXMgICAgICBTcXVhc2ggcGVybWlz
c2lvbnMgb24gYWxsIGZpbGVzXG4iDQorI2lmZGVmIEhBVkVfQUNMDQogCSIg
ICAgICAtLXdpdGgteGF0dHIgICAgICAgIHN0dWZmIGFsbCB4YXR0ciBlbnRy
aWVzIGludG8gaW1hZ2VcbiINCiAJIiAgICAgIC0td2l0aC1zZWxpbnV4ICAg
ICAgc3R1ZmYgb25seSBTRUxpbnV4IExhYmVscyBpbnRvIGpmZnMyIGltYWdl
XG4iDQogCSIgICAgICAtLXdpdGgtcG9zaXgtYWNsICAgIHN0dWZmIG9ubHkg
UE9TSVggQUNMIGVudHJpZXMgaW50byBqZmZzMiBpbWFnZVxuIg0KKyNlbmRp
Zg0KIAkiICAtaCwgLS1oZWxwICAgICAgICAgICAgICBEaXNwbGF5IHRoaXMg
aGVscCB0ZXh0XG4iDQogCSIgIC12LCAtLXZlcmJvc2UgICAgICAgICAgIFZl
cmJvc2Ugb3BlcmF0aW9uXG4iDQogCSIgIC1WLCAtLXZlcnNpb24gICAgICAg
ICAgIERpc3BsYXkgdmVyc2lvbiBpbmZvcm1hdGlvblxuIg0KQEAgLTE3NzIs
NiArMTc4Myw3IEBADQogCQkJCQlwZXJyb3JfbXNnX2FuZF9kaWUoImNhbm5v
dCBvcGVuIChpbmNyZW1lbnRhbCkgZmlsZSIpOw0KIAkJCQl9DQogCQkJCWJy
ZWFrOw0KKyNpZmRlZiBIQVZFX0FDTA0KIAkJCWNhc2UgMTAwMDoJLyogLS13
aXRoLXhhdHRyICAqLw0KIAkJCQllbmFibGVfeGF0dHIgfD0gKDEgPDwgSkZG
UzJfWFBSRUZJWF9VU0VSKQ0KIAkJCQkJCXwgKDEgPDwgSkZGUzJfWFBSRUZJ
WF9TRUNVUklUWSkNCkBAIC0xNzg2LDYgKzE3OTgsNyBAQA0KIAkJCQllbmFi
bGVfeGF0dHIgfD0gKDEgPDwgSkZGUzJfWFBSRUZJWF9BQ0xfQUNDRVNTKQ0K
IAkJCQkJCXwgKDEgPDwgSkZGUzJfWFBSRUZJWF9BQ0xfREVGQVVMVCk7DQog
CQkJCWJyZWFrOw0KKyNlbmRpZg0KIAkJfQ0KIAl9DQogCWlmIChvdXRfZmQg
PT0gLTEpIHsNCg==

--218815243-1741278625-1163577754=:5230--
