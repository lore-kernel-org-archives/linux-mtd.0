Received: from host11.oneononeinternet.com ([209.239.43.35])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AjBIu-0000ks-NK
	for linux-mtd@lists.infradead.org; Wed, 21 Jan 2004 05:53:28 +0000
From: "Mark Richards" <markr@massmicro.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Date: Wed, 21 Jan 2004 00:51:02 -0500
Message-ID: <00a001c3dfe2$93f3b090$6e01a8c0@solarwave>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1074622256.7885.12.camel@hades.cambridge.redhat.com>
cc: linux-mtd@lists.infradead.org
Subject: RE: MTD - DOC 2000 freezes on umount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David, I ran the kernel build process and, sadly, no joy.

Here's the ending of a long string of various warnings from the compiler =
as
it worked through the MTD code...

gcc -D__KERNEL__ -I/usr/src/linux-2.4.24.new.mtd/include -Wall
-Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common
-fomit-frame-pointer -pipe -mpreferred-stack-boundary=3D2 -march=3Di686 =
-DMODULE
-DMODVERSIONS -include
/usr/src/linux-2.4.24.new.mtd/include/linux/modversions.h  -nostdinc
-iwithprefix include -DKBUILD_BASENAME=3Dwrite
-c -o write.o write.c
write.c: In function `jffs2_new_inode':
write.c:91: `current' undeclared (first use in this function)
write.c:91: (Each undeclared identifier is reported only once
write.c:91: for each function it appears in.)
write.c:103: `CURRENT_TIME' undeclared (first use in this function)
make[2]: *** [write.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.24.new.mtd/fs/jffs2'
make[1]: *** [_modsubdir_jffs2] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.24.new.mtd/fs'
make: *** [_mod_fs] Error 2
[root@localhost linux]#

The compile was performed on a new source tree (2.4.24) that had been
patched according to instructions and the configuration process operated =
as
recommended.

GCC: 2.96 20000731 (Red Hat 7.1 2.96-98) Specs from
/usr/lib/gcc-lib/i386-redhat-linux/2.96/specs

I wonder if I should just re-install RedHat, or is there any hope
otherwise??

Mark Richards


> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: Tuesday, January 20, 2004 13:11
> To: Mark Richards
> Cc: linux-mtd@lists.infradead.org
> Subject: RE: MTD - DOC 2000 freezes on umount
>=20
> On Tue, 2004-01-20 at 13:04 -0500, Mark Richards wrote:
> > drivers/mtd/chips/Config.in: 14: unknown command
>=20
> Try 'make oldconfig' instead.
>=20
> --
> dwmw2
