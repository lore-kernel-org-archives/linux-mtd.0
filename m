Received: from mf01.sitadelle.com ([212.94.174.68] helo=smtp.cegetel.net)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IKVjX-0008Iu-IB
	for linux-mtd@lists.infradead.org; Mon, 13 Aug 2007 04:57:10 -0400
Received: from [10.1.111.252] (80-124-168-196.adslgp.cegetel.net
	[80.124.168.196])
	by smtp.cegetel.net (Postfix) with ESMTP id 885D76A0133
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Aug 2007 10:57:03 +0200 (CEST)
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2.c not compiling for arm
Date: Mon, 13 Aug 2007 10:56:56 +0200
References: <200708091734.24054.schane@osmozis.com>
	<46BE971D.1050305@compulab.co.il>
In-Reply-To: <46BE971D.1050305@compulab.co.il>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200708131056.57824.schane@osmozis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Mike,

I have tried to compile the mtd-utils from within the scratchbox environeme=
nt.=20
Still the problem exists with the Zlib.h file.

[sbox-COM-X270: ~] > wget=20
ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.0.0.tar.gz
[sbox-COM-X270: ~] > tar -xvzf mtd-utils-1.0.0.tar.gz
[sbox-COM-X270: ~] > cd mtd-utils-1.0.0

[sbox-COM-X270: ~/mtd-utils-1.0.0] > make=20
CROSS=3D/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-

Makefile:34: no file name for `-include'

/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o ftl_format.o ftl_format.c -g -Wp,-MD,.ftl_format.c.dep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc  -g -o=20
ftl_format ftl_format.o
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o flash_erase.oflash_erase.c -g -Wp,-MD,.flash_erase.c.d=
ep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc  -g -o=20
flash_erase flash_erase.o
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o crc32.o crc32.c -g -Wp,-MD,.crc32.c.dep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o flash_eraseall.o flash_eraseall.c -g=20
=2DWp,-MD,.flash_eraseall.c.dep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc  -o=20
flash_eraseall crc32.o flash_eraseall.o
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o nanddump.o nanddump.c -g -Wp,-MD,.nanddump.c.dep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc  -g -o=20
nanddump nanddump.o
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o doc_loadbios.o doc_loadbios.c -g=20
=2DWp,-MD,.doc_loadbios.c.dep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc  -g -o=20
doc_loadbios doc_loadbios.o
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o mkfs.jffs.o mkfs.jffs.c -g -Wp,-MD,.mkfs.jffs.c.dep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc  -g -o=20
mkfs.jffs mkfs.jffs.o
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o ftl_check.o ftl_check.c -g -Wp,-MD,.ftl_check.c.dep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc  -g -o=20
ftl_check ftl_check.o
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o compr_rtime.ocompr_rtime.c -g -Wp,-MD,.compr_rtime.c.d=
ep
/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc -I./inclu=
de=20
=2DO2 -Wall -g -c -o mkfs.jffs2.o mkfs.jffs2.c -g -Wp,-MD,.mkfs.jffs2.c.dep
mkfs.jffs2.c:68:18: zlib.h: No such file or directory
make: *** [mkfs.jffs2.o] Error 1
rm ftl_check.o mkfs.jffs.o flash_erase.o ftl_format.o nanddump.o=20
doc_loadbios.o
[sbox-COM-X270: ~/mtd-utils-1.0.0] >


Thanks
Sara
Osmozis


Le Dimanche 12 Ao=FBt 2007 07:14, Mike Rapoport a =E9crit=A0:
> Saravanan Chanemouganandam wrote:
> > Hello,
> >
> > I am a newbie to use MTD tools. I have downloaded the latest version of
> > the mtd tools and when I try to cross compile mtd-utils-1.0.0 for the
> > Xscale platform, I am getting the following make error.
> >
> > sara:/home/sara/mtd-utils-1.0.0#make
> > CROSS=3D/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-
> > ....
> > /scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/bin/arm-linux-gcc
> > -I./include -O2 -Wall -g -c -o mkfs.jffs2.o mkfs.jffs2.c -g
> > -Wp,-MD,.mkfs.jffs2.c.dep mkfs.jffs2.c:68:18: zlib.h : No such file or
> > directory
> > make: *** [mkfs.jffs2.o] Error 1
> > rm ftl_check.o mkfs.jffs.o flash_erase.o ftl_format.o nanddump.o
> > doc_loadbios.o
> >
> > The host development machine has already installed with supporting Zlib
> > libraries but still it couldn't find the file.
> >
> > Can anyone precise me, is there any missing build options ?
>
> If you are using scratchbox, it might be better to compile the mtd-utils
> from within the scratchbox environment.
>
> > thanks
> > Sara
> >
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
