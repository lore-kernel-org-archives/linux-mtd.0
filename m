Received: from fmmailgate05.web.de ([217.72.192.243])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FMOWG-0005xb-Su
	for linux-mtd@lists.infradead.org; Thu, 23 Mar 2006 07:02:28 -0500
Received: by fmmailgate05.web.de (8.12.10/8.12.10/webde Linux 0.7) with SMTP
	id k2NC1iXF018033
	for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2006 13:02:21 +0100
Date: Thu, 23 Mar 2006 13:02:21 +0100
Message-Id: <457792036@web.de>
MIME-Version: 1.0
From: Mirco Fuchs <mircofuchs@web.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
Subject: 2.6.16 compile error with latest cvs mtd source
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

i have a problem compiling the 2.6.16 kernel for my csb637 board. I think =
this
is an mtd related question because it works without patching the kernel
against the  mtd source code.

I have gcc 3.4.4 and binutils 2.16 and glibx 2.3.5.

The first step was compiling the 2.6.16 kernel without patching against th=
e
mtd cvs sources. --> The compilation was successfull.

But patching the kernel against the head of the mtd cvs repo resulted in t=
he
following warnings and errors:

(I used the command 'patchkernel.sh -2cyv $KERNELDIR' for patching)

...
  CC      drivers/mtd/mtdcore.o
  CC      drivers/mtd/mtdpart.o
  CC      drivers/mtd/mtdconcat.o
  CC      drivers/mtd/cmdlinepart.o
  CC      drivers/mtd/mtdchar.o
  CC      drivers/mtd/mtdblock.o
  CC      drivers/mtd/mtd=5Fblkdevs.o
  CC      drivers/mtd/chips/chipreg.o
  CC      drivers/mtd/chips/cfi=5Fprobe.o
  CC      drivers/mtd/chips/cfi=5Futil.o
  CC      drivers/mtd/chips/cfi=5Fcmdset=5F0020.o
drivers/mtd/chips/cfi=5Fcmdset=5F0020.c: In function `cfi=5Fstaa=5Finit':
drivers/mtd/chips/cfi=5Fcmdset=5F0020.c:1417: Warnung: =BBinter=5Fmodule=5Fregister=AB=
 ist veraltet (deklariert bei
include/linux/module.h:571)
drivers/mtd/chips/cfi=5Fcmdset=5F0020.c: In function `cfi=5Fstaa=5Fexit':
drivers/mtd/chips/cfi=5Fcmdset=5F0020.c:1423: Warnung: =BBinter=5Fmodule=5Funregiste=
r=AB ist veraltet (deklariert bei
include/linux/module.h:572)
  CC      drivers/mtd/chips/cfi=5Fcmdset=5F0001.o
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c: In function `cfi=5Fintelext=5Finit':
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2458: Warnung: =BBinter=5Fmodule=5Fregister=AB=
 ist veraltet (deklariert bei
include/linux/module.h:571)
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2459: Warnung: =BBinter=5Fmodule=5Fregister=AB=
 ist veraltet (deklariert bei
include/linux/module.h:571)
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2460: Warnung: =BBinter=5Fmodule=5Fregister=AB=
 ist veraltet (deklariert bei
include/linux/module.h:571)
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c: In function `cfi=5Fintelext=5Fexit':
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2466: Warnung: =BBinter=5Fmodule=5Funregiste=
r=AB ist veraltet (deklariert bei
include/linux/module.h:572)
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2467: Warnung: =BBinter=5Fmodule=5Funregiste=
r=AB ist veraltet (deklariert bei
include/linux/module.h:572)
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2468: Warnung: =BBinter=5Fmodule=5Funregiste=
r=AB ist veraltet (deklariert bei
include/linux/module.h:572)
  CC      drivers/mtd/chips/gen=5Fprobe.o
drivers/mtd/chips/gen=5Fprobe.c: In function `cfi=5Fcmdset=5Funknown':
drivers/mtd/chips/gen=5Fprobe.c:210: Warnung: =BBinter=5Fmodule=5Fput=AB ist veralte=
t (deklariert bei
include/linux/module.h:575)
  LD      drivers/mtd/chips/built-in.o
  LD      drivers/mtd/devices/built-in.o
  CC      drivers/mtd/maps/physmap.o
  LD      drivers/mtd/maps/built-in.o
  LD      drivers/mtd/nand/built-in.o
  LD      drivers/mtd/onenand/built-in.o
  LD      drivers/mtd/built-in.o

...

  CC      lib/kref.o
  CC      lib/prio=5Ftree.o
  CC      lib/radix-tree.o
  CC      lib/rbtree.o
  CC      lib/rwsem-spinlock.o
  CC      lib/sha1.o
  CC      lib/string.o
  CC      lib/vsprintf.o
  AR      lib/lib.a
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp=5Fvmlinux1
drivers/built-in.o: In function `cfi=5Fcmdset=5Funknown':
drivers/mtd/chips/gen=5Fprobe.c:203: undefined reference to `inter=5Fmodule=5Fge=
t=5Frequest'
drivers/mtd/chips/gen=5Fprobe.c:210: undefined reference to `inter=5Fmodule=5Fpu=
t'
drivers/built-in.o: In function `cfi=5Fstaa=5Finit':
drivers/mtd/chips/cfi=5Fcmdset=5F0020.c:1417: undefined reference to `inter=5Fmo=
dule=5Fregister'
drivers/built-in.o: In function `cfi=5Fintelext=5Finit':
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2458: undefined reference to `inter=5Fmo=
dule=5Fregister'
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2459: undefined reference to `inter=5Fmo=
dule=5Fregister'
drivers/mtd/chips/cfi=5Fcmdset=5F0001.c:2460: undefined reference to `inter=5Fmo=
dule=5Fregister'
make: *** [.tmp=5Fvmlinux1] Fehler 1

Are there any suggestions=3F

Note: I patched the 2.6.15 kernel against the head of the mtd cvs repo whi=
ch
resulted in a successfully compilation.


regards

Mirco

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=

Erweitern Sie FreeMail zu einem noch leistungsst=E4rkeren E-Mail-Postfach!	=09
Mehr Infos unter http://freemail.web.de/home/landingpad/=3Fmc=3D021131
