From: guo_zl9@hotmail.com (guo_zhenglin)
Date: Thu, 13 Mar 2003 09:07:07 +0800
Subject: help : JFFS2 compile error :background.c
References: <OE605pneeFUtLch9wPi00017e8f@hotmail.com> <20030310151356.GA24341@wohnheim.fh-wedel.de> <OE25mGItB6rCjCuDauo00020d7f@hotmail.com> <20030312220950.GA27517@wohnheim.fh-wedel.de>
Message-ID: <OE65GvnCjnZS08i7M4B0000f7b5@hotmail.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

thanks for you answers.

I decide to not use mtd_cvs_20020612.tgz.
only use linux-2.4.4.

thanks.


----- Original Message -----
From: "Joern Engel" <joern@wohnheim.fh-wedel.de>
To: "guo_zhenglin" <guo_zl9@hotmail.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, March 13, 2003 6:09 AM
Subject: Re: help : JFFS2 compile error :background.c


> On Tue, 11 March 2003 09:31:29 +0800, guo_zhenglin wrote:
> >
> > 1)I had used  mtd_cvs_20020612.tgz (from
> >   http://qslinux.org/qslinux_2_4/tarballs/mtd_cvs_20020612.tgz)
> >
> >  2)input: "sh patches -j /home/guozl_1/linux-2.4.4-2002-10-06"
> >  3)linux kernel is :linux-2.4.4
>
> All three are a bit dated and likely noone has ever tested that
> combination before.
> Can you upgrade to something more current? kernel 2.4.21-pre5 should
> work out of the box, I would guess.
>
> There is little point in fixing a problem _again_. :)
>
> >
ppc_8xx-gcc -D__KERNEL__ -I/home/guozl_1/linux-2.4.4-2002-10-06/include -Wal
> >   l -W
> >
> >
strict-prototypes -Os -fomit-frame-pointer -fno-strict-aliasing -D__powerpc_
> >   _ -f
> >
> >
signed-char -msoft-float -pipe -ffixed-r2 -Wno-uninitialized -mmultiple -mst
> >   ring
> >    -mcpu=860 -g -DJFFS2_OUT_OF_KERNEL  -c -o background.o background.c
> >   background.c:108: arguments given to macro `recalc_sigpending'
> >   background.c:155: arguments given to macro `recalc_sigpending'
>
> Don't know, didn't look at the code. But it appears as if
> recalc_sigpending has been changed sometime and one of 1), 2) and 3)
> has the new version and another one the old one. Just a guess.
>
> If you want to fix it yourself, look at fs/jffs2/background.c and
> search for recalc_sigpending in http://lxr.linux.no/ . But upgrading
> sounds like the better option.
>
> J?rn
>
> --
> Beware of bugs in the above code; I have only proved it correct, but
> not tried it.
> -- Donald Knuth
>
