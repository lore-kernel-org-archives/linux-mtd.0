From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 23:37:34 +0100
Subject: copy filesystem to nand flash without ecc
In-Reply-To: <000901c2d44b$fef48a70$1a00a8c0@itc.intrinsyc.com>
References: <4EF56021.2C81712E.0265FBE9@netscape.net>
 <200302131752.54716.tglx@linutronix.de>
 <000901c2d44b$fef48a70$1a00a8c0@itc.intrinsyc.com>
Message-ID: <200302142337.34683.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 18:10, Alex Samoutin wrote:
> But I can see call     mtd->write()  in  jffs2_flash_write() (wbuf.c).  It
> is not ECC write.
> This function invoked from jffs2_garbage_collect_pristine(). and   cause a
> problem.
Well spotted. Thanks.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
