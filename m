From: guo_zl9@hotmail.com (guo_zhenglin)
Date: Tue, 11 Mar 2003 09:31:29 +0800
Subject: help : JFFS2 compile error :background.c
References: <OE605pneeFUtLch9wPi00017e8f@hotmail.com> <20030310151356.GA24341@wohnheim.fh-wedel.de>
Message-ID: <OE25mGItB6rCjCuDauo00020d7f@hotmail.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

1)I had used  mtd_cvs_20020612.tgz (from
  http://qslinux.org/qslinux_2_4/tarballs/mtd_cvs_20020612.tgz)

 2)input: "sh patches -j /home/guozl_1/linux-2.4.4-2002-10-06"
 3)linux kernel is :linux-2.4.4
 4)  Cross compile is MontaVista Hothard 2.0 for ppc platform
 5) make vmlinux:

 6)compile show:


ppc_8xx-gcc -D__KERNEL__ -I/home/guozl_1/linux-2.4.4-2002-10-06/include -Wal
  l -W

strict-prototypes -Os -fomit-frame-pointer -fno-strict-aliasing -D__powerpc_
  _ -f

signed-char -msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mst
  ring
   -mcpu=860 -g -DJFFS2_OUT_OF_KERNEL  -c -o background.o background.c
  background.c:108: arguments given to macro `recalc_sigpending'
  background.c:155: arguments given to macro `recalc_sigpending'
  make[2]: *** [background.o] Error 1
  make[2]: Leaving directory `/home/guozl_1/linux-2.4.4-2002-10-06/fs/jffs2'
  make[1]: *** [_subdir_jffs2] Error 2
  make[1]: Leaving directory `/home/guozl_1/linux-2.4.4-2002-10-06/fs'
  make: *** [_dir_fs] Error 2
  [root at t80c35 linux-2.4.4-2002-10-06]#

  7) I don't know which file(s) should be modified
  8) I don't know where should be modified

  Can you tell me ?
  thanks !


----- Original Message -----
From: "J?rn Engel" <joern@wohnheim.fh-wedel.de>
To: "guo_zhenglin" <guo_zl9@hotmail.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, March 10, 2003 11:13 PM
Subject: Re: help : JFFS2 compile error :background.c


> On Fri, 7 March 2003 19:11:16 +0800, guo_zhenglin wrote:
> >
> > thanks very much.
> > but I am beginner on linux ,
> > I don't know how to modify ,
> > Could you tell me more detailedly?
>
> Not, unless you describe the problem in more details:
> - kernel version
> - applied patches
> - command line and output of gcc
> ...
>
> J?rn
>
> --
> Fancy algorithms are buggier than simple ones, and they're much harder
> to implement. Use simple algorithms as well as simple data structures.
> -- Rob Pike
>
