Received: from mf00.sitadelle.com ([212.94.174.67] helo=smtp.cegetel.net)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IJVar-0000Q6-6X
	for linux-mtd@lists.infradead.org; Fri, 10 Aug 2007 10:36:04 -0400
Received: from [10.1.111.252] (80-124-168-196.adslgp.cegetel.net
	[80.124.168.196])
	by smtp.cegetel.net (Postfix) with ESMTP id B26821A41B1
	for <linux-mtd@lists.infradead.org>;
	Fri, 10 Aug 2007 16:35:58 +0200 (CEST)
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: mkfs.jffs2.c not compiling for arm
Date: Fri, 10 Aug 2007 16:35:50 +0200
References: <200708091734.24054.schane@osmozis.com>
	<loom.20070810T160837-882@post.gmane.org>
In-Reply-To: <loom.20070810T160837-882@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200708101635.51277.schane@osmozis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Mike,

On the x-86 host machine running linux, I have installed the scratchbox cro=
ss=20
compiler toolchain that includes the arm version of zlib.h under=20

/scratchbox/host_shared/include/linux/zlib.h
/scratchbox/host_shared/include/zlib.h
/scratchbox/compilers/cs2005q3.2-glibc-arm/usr/include/linux/zlib.h
/scratchbox/compilers/cs2005q3.2-glibc-arm/arm-none-linux-gnueabi/sys-inclu=
de/linux/zlib.h

/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/usr/include/linux/zlib.h =
=A0 =A0

/scratchbox/compilers/arm-gcc-3.3.4-glibc-2.3.2/arm-linux/sys-include/linux=
/zlib.h
/scratchbox/users/sara/targets/COM-X270/usr/include/linux/zlib.h

Still, it coudln't find zlib.h. Is there a way to specify the path of the=20
usr/include/linux/zlib.h in the make option ?

Thanks
Sara



Le Vendredi 10 Ao=FBt 2007 16:10, MikeW a =E9crit=A0:
> Saravanan Chanemouganandam <schane <at> osmozis.com> writes:
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
> >
> > thanks
> > Sara
>
> Your crosscompiler toolchain ought to have supplied this file
> in one of its include directories.
>
> For example using ELDK/mips it's in /opt/eldk/mips_4KCle/usr/include .
>
> Regards,
> MikeW
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
