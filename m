Received: from fmmailgate05.web.de ([217.72.192.243])
	by pentafluge.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DySNt-0002cd-Mp
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 11:46:44 +0100
Received: by fmmailgate05.web.de (8.12.10/8.12.10/webde Linux 0.7) with SMTP
	id j6TAkMNr012118
	for <linux-mtd@lists.infradead.org>; Fri, 29 Jul 2005 12:46:24 +0200
Date: Fri, 29 Jul 2005 12:46:23 +0200
Message-Id: <9370766@web.de>
MIME-Version: 1.0
From: Mirco Fuchs <mircofuchs@web.de>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Subject: Problem with AT91RM9200 and intel cfi flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I compiled my kernel with CONFIG=5FJFFS2=5FFS=5FNAND=3Dn and it works fine.

I also patched the kernel with the latest CVS version. After compiling the=
 kernel with
CONFIG=5FJFFS2=5FFS=5FDEBUG=3D0, the following error occured:


xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxx
...
  AR      arch/arm/lib/lib.a
  GEN     .version
  CHK     include/linux/compile.h
  UPD     include/linux/compile.h
  CC      init/version.o
  LD      init/built-in.o
  LD      .tmp=5Fvmlinux1
fs/built-in.o(.text+0x60f3c): In function `jffs2=5Fget=5Finode=5Fnodes':
fs/jffs2/readinode.c:252: undefined reference to `=5F=5Fjffs2=5Fdbg=5Fdump=5Fnode'
fs/built-in.o(.text+0x6149c):fs/jffs2/readinode.c:387: undefined reference=
 to `=5F=5Fjffs2=5Fdbg=5Fdump=5Fnode'
make: *** [.tmp=5Fvmlinux1] Fehler 1

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
xxxxxx

When setting this to CONFIG=5FJFFS2=5FFS=5FDEBUG=3D1 the kernel gets succesfully c=
ompiled
and the jffs2 partition can be unmounted.

I think this is a little bug to be fixed.

Regards
Mirco

=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Mit der Gruppen-SMS von WEB.DE FreeMail k=F6nnen Sie eine SMS an alle=20
Freunde gleichzeitig schicken: http://freemail.web.de/features/=3Fmc=3D021179
