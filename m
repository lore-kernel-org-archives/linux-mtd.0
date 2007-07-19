Received: from wp110.webpack.hosteurope.de ([80.237.132.117])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBfLe-0002Wy-Mb
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 19:23:56 -0400
From: Tobias Simon <tobias.simon@sp-ss.de>
To: linux-mtd@lists.infradead.org
Subject: Re: flashcp
Date: Fri, 20 Jul 2007 01:23:46 +0200
References: <200707192046.47340.tobias.simon@sp-ss.de>
	<20070719221339.GC27750@lazybastard.org>
	<200707200055.29457.tobias.simon@sp-ss.de>
In-Reply-To: <200707200055.29457.tobias.simon@sp-ss.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200707200123.46618.tobias.simon@sp-ss.de>
Cc: joern@logfs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello J=C3=B6rn,

I just saw the following line, which is part of the original source:
"if (filestat.st_size % mtd.erasesize) erase.length +=3D mtd.erasesize;"

So either this line could be deleted (when using my last patch):


=2D-- flashcp_old.c       2007-07-20 01:15:28.000000000 +0200
+++ flashcp_a.c 2007-07-20 01:16:48.000000000 +0200
@@ -257,9 +257,15 @@
 #warning "Check for smaller erase regions"

        erase.start =3D 0;
=2D       erase.length =3D filestat.st_size & ~(mtd.erasesize - 1);
=2D       if (filestat.st_size % mtd.erasesize) erase.length +=3D mtd.erase=
size;
=2D       if (flags & FLAG_VERBOSE)
+
+   if (filestat.st_size % mtd.erasesize) {
+      erase.length =3D filestat.st_size + mtd.erasesize - (filestat.st_siz=
e %=20
mtd.erasesize);
+   }
+   else {
+      erase.length =3D filestat.st_size;
+   }
+
+   if (flags & FLAG_VERBOSE)
        {
                /* if the user wants verbose output, erase 1 block at a tim=
e=20
and show him/her what's going on */
                int blocks =3D erase.length / mtd.erasesize;



=2E.. or left there in conjunction with your "rounding down" code:


=2D-- flashcp_old.c       2007-07-20 01:15:28.000000000 +0200
+++ flashcp_b.c 2007-07-20 01:14:02.000000000 +0200
@@ -257,9 +257,12 @@
 #warning "Check for smaller erase regions"

        erase.start =3D 0;
=2D       erase.length =3D filestat.st_size & ~(mtd.erasesize - 1);
=2D       if (filestat.st_size % mtd.erasesize) erase.length +=3D mtd.erase=
size;
=2D       if (flags & FLAG_VERBOSE)
+
+   erase.length =3D (filestat.st_size / mtd.erasesize) * mtd.erasesize;
+       if (filestat.st_size % mtd.erasesize)
+      erase.length +=3D mtd.erasesize;
+
+   if (flags & FLAG_VERBOSE)
        {
                /* if the user wants verbose output, erase 1 block at a tim=
e=20
and show him/her what's going on */
                int blocks =3D erase.length / mtd.erasesize;


I prefer the second patch, because it's easier to understand.


Best Regards,
Tobias
