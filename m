From: samoutin@hotbox.ru (Alex Samoutin)
Date: Fri, 14 Feb 2003 09:10:31 -0800
Subject: copy filesystem to nand flash without ecc
References: <4EF56021.2C81712E.0265FBE9@netscape.net> <200302131752.54716.tglx@linutronix.de>
Message-ID: <000901c2d44b$fef48a70$1a00a8c0@itc.intrinsyc.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> if you copy files around. As ECC is essential for NAND, we removed the
> non ECC stuff for JFFS2 :)
>


Hmm
But I can see call     mtd->write()  in  jffs2_flash_write() (wbuf.c).  It
is not ECC write.
This function invoked from jffs2_garbage_collect_pristine(). and   cause a
problem.

Alex.
