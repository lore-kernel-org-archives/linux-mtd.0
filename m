Received: from zproxy.gmail.com ([64.233.162.200])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPlud-0003H7-H7
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 15:05:20 -0400
Received: by zproxy.gmail.com with SMTP id i11so183285nzh
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Oct 2005 12:05:07 -0700 (PDT)
Message-ID: <6934efce0510121205t2558aaei8ab91a79e22f75a0@mail.gmail.com>
Date: Wed, 12 Oct 2005 12:05:07 -0700
From: Jared Hulbert <jaredeh@gmail.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <6934efce05092915519ffe76c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <F92C2EFE7C3BA745855BF7036E1F3F9A01376415@NNSMSX401>
	<Pine.LNX.4.63.0509221318180.18381@localhost.localdomain>
	<6934efce05092915519ffe76c@mail.gmail.com>
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: XIP fails on kernels 2.6.12 and higher
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/29/05, Jared Hulbert <jaredeh@gmail.com> wrote:
> > If you can find the exact intermediate release between 2.6.11 and 2.6.1=
2
> > that broke it that would be extrelely helpful.

I found it.  This is the change that was causing my problem
---------------------------------------------------------------------------=
--------
commit 3871b11e8c07c9e6652f81ae5afc1ae3bb120c40
Author: mpm <mpm>
Date:   Tue Mar 8 18:05:40 2005 +0000

    [PATCH] lib/sort: Replace insertion sort in exception tables

    Replace exception table insertion sort with lib/sort

    Signed-off-by: Matt Mackall <mpm@selenic.com>
    Signed-off-by: Andrew Morton <akpm@osdl.org>
    Signed-off-by: Linus Torvalds <torvalds@osdl.org>

    BKrev: 422de974WUZpIt5eM36-PMJe_h6Nfg
---------------------------------------------------------------------------=
--------

The following is the diff from the old git repository.  Unpatching
this in the 2.6.14-rc4 kernel made the xipImage work.  What is going
on???

Index: lib/extable.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- lib/extable.c=09(revision 29)
+++ lib/extable.c=09(revision 28)
@@ -13,6 +13,7 @@
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/init.h>
+#include <linux/sort.h>
 #include <asm/uaccess.h>

 extern struct exception_table_entry __start___ex_table[];
@@ -25,26 +26,17 @@
  * This is used both for the kernel exception table and for
  * the exception tables of modules that get loaded.
  */
+static int cmp_ex(const void *a, const void *b)
+{
+=09const struct exception_table_entry *x =3D a, *y =3D b;
+=09return x->insn - y->insn;
+}
+
 void sort_extable(struct exception_table_entry *start,
 =09=09  struct exception_table_entry *finish)
 {
-=09struct exception_table_entry el, *p, *q;
-
-=09/* insertion sort */
-=09for (p =3D start + 1; p < finish; ++p) {
-=09=09/* start .. p-1 is sorted */
-=09=09if (p[0].insn < p[-1].insn) {
-=09=09=09/* move element p down to its right place */
-=09=09=09el =3D *p;
-=09=09=09q =3D p;
-=09=09=09do {
-=09=09=09=09/* el comes before q[-1], move q[-1] up one */
-=09=09=09=09q[0] =3D q[-1];
-=09=09=09=09--q;
-=09=09=09} while (q > start && el.insn < q[-1].insn);
-=09=09=09*q =3D el;
-=09=09}
-=09}
+=09sort(start, finish - start, sizeof(struct exception_table_entry),
+=09     cmp_ex, NULL);
 }
 #endif
