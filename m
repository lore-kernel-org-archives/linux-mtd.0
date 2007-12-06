Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J0F9T-0003X0-0R
	for linux-mtd@lists.infradead.org; Thu, 06 Dec 2007 11:44:31 +0000
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.13.11.219])
	by miranda.se.axis.com (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	lB6BiAas025529
	for <linux-mtd@lists.infradead.org>; Thu, 6 Dec 2007 12:44:10 +0100
Date: Thu, 6 Dec 2007 12:43:47 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Linux mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH][MTD-UTILS] Set mkfs.jffs2 page size runtime instead of fixed.
Message-ID: <Pine.LNX.4.64.0712061232550.28640@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="218815243-1052512628-1196941427=:28640"
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

--218815243-1052512628-1196941427=:28640
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


This patch reads the default PAGE_SIZE from sysconf(), i.e. the system
mkfs.jffs2 is running on, instead of just setting it to 4096 (which of=20
course is valid for most systems but not all).

This is useful if mkfs.jffs2 is running on the target system, e.g. to=20
create a backup image during firmware upgrade, so that the page size does=
=20
not have to be set explicitly using a command line parameter.

The --pagesize option is supported just as before.

Patch is included both as an attachment for patching and inline for=20
review. (Patch made against git head).

Signed-off-by Ricard Wanderl=F6f <ricardw@axis.com> .

Index: mkfs.jffs2.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
RCS file: /usr/local/cvs/linux/apps/utils/mtdutils/mkfs.jffs2.c,v
retrieving revision 1.2
retrieving revision 1.3
diff -u -r1.2 -r1.3
--- mkfs.jffs2.c=0917 Oct 2006 11:40:40 -0000=091.2
+++ mkfs.jffs2.c=096 Dec 2007 07:46:47 -0000=091.3
@@ -672,9 +672,9 @@
  =090xff, 0xff, 0xff, 0xff, 0xff
  };

-/* We default to 4096, per x86.  When building a fs for
- * 64-bit arches and whatnot, use the --pagesize=3DSIZE option */
-int page_size =3D 4096;
+/* We set this at start of main() using sysconf(), -1 means we don't know =
*/
+/* When building an fs for non-native systems, use --pagesize=3DSIZE optio=
n */
+int page_size =3D -1;

  #include "compr.h"

@@ -787,6 +787,10 @@
  =09struct stat *statbuf;
  =09unsigned int totcomp =3D 0;

+=09page_size =3D sysconf(_SC_PAGESIZE);
+=09if (page_size < 0) /* System doesn't know so ... */
+=09=09page_size =3D 4096; /* ... we make an educated guess */
+
  =09statbuf =3D &(e->sb);
  =09if (statbuf->st_size >=3D JFFS2_MAX_FILE_SIZE) {
  =09=09error_msg("Skipping file \"%s\" too large.", e->path);

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
--218815243-1052512628-1196941427=:28640
Content-Type: TEXT/x-diff; charset=US-ASCII; name=mkfs.jffs2.c-pagesize.patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.64.0712061243470.28640@lnxricardw.se.axis.com>
Content-Description: patch file
Content-Disposition: attachment; filename=mkfs.jffs2.c-pagesize.patch

SW5kZXg6IG1rZnMuamZmczIuYw0KPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0K
UkNTIGZpbGU6IC91c3IvbG9jYWwvY3ZzL2xpbnV4L2FwcHMvdXRpbHMvbXRk
dXRpbHMvbWtmcy5qZmZzMi5jLHYNCnJldHJpZXZpbmcgcmV2aXNpb24gMS4y
DQpyZXRyaWV2aW5nIHJldmlzaW9uIDEuMw0KZGlmZiAtdSAtcjEuMiAtcjEu
Mw0KLS0tIG1rZnMuamZmczIuYwkxNyBPY3QgMjAwNiAxMTo0MDo0MCAtMDAw
MAkxLjINCisrKyBta2ZzLmpmZnMyLmMJNiBEZWMgMjAwNyAwNzo0Njo0NyAt
MDAwMAkxLjMNCkBAIC02NzIsOSArNjcyLDkgQEANCiAJMHhmZiwgMHhmZiwg
MHhmZiwgMHhmZiwgMHhmZg0KIH07DQogDQotLyogV2UgZGVmYXVsdCB0byA0
MDk2LCBwZXIgeDg2LiAgV2hlbiBidWlsZGluZyBhIGZzIGZvcg0KLSAqIDY0
LWJpdCBhcmNoZXMgYW5kIHdoYXRub3QsIHVzZSB0aGUgLS1wYWdlc2l6ZT1T
SVpFIG9wdGlvbiAqLw0KLWludCBwYWdlX3NpemUgPSA0MDk2Ow0KKy8qIFdl
IHNldCB0aGlzIGF0IHN0YXJ0IG9mIG1haW4oKSB1c2luZyBzeXNjb25mKCks
IC0xIG1lYW5zIHdlIGRvbid0IGtub3cgKi8NCisvKiBXaGVuIGJ1aWxkaW5n
IGFuIGZzIGZvciBub24tbmF0aXZlIHN5c3RlbXMsIHVzZSAtLXBhZ2VzaXpl
PVNJWkUgb3B0aW9uICovDQoraW50IHBhZ2Vfc2l6ZSA9IC0xOw0KIA0KICNp
bmNsdWRlICJjb21wci5oIg0KIA0KQEAgLTc4Nyw2ICs3ODcsMTAgQEANCiAJ
c3RydWN0IHN0YXQgKnN0YXRidWY7DQogCXVuc2lnbmVkIGludCB0b3Rjb21w
ID0gMDsNCiANCisJcGFnZV9zaXplID0gc3lzY29uZihfU0NfUEFHRVNJWkUp
Ow0KKwlpZiAocGFnZV9zaXplIDwgMCkgLyogU3lzdGVtIGRvZXNuJ3Qga25v
dyBzbyAuLi4gKi8NCisJCXBhZ2Vfc2l6ZSA9IDQwOTY7IC8qIC4uLiB3ZSBt
YWtlIGFuIGVkdWNhdGVkIGd1ZXNzICovDQorDQogCXN0YXRidWYgPSAmKGUt
PnNiKTsNCiAJaWYgKHN0YXRidWYtPnN0X3NpemUgPj0gSkZGUzJfTUFYX0ZJ
TEVfU0laRSkgew0KIAkJZXJyb3JfbXNnKCJTa2lwcGluZyBmaWxlIFwiJXNc
IiB0b28gbGFyZ2UuIiwgZS0+cGF0aCk7DQo=

--218815243-1052512628-1196941427=:28640--
