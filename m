From: dwmw2@infradead.org (David Woodhouse)
Date: 15 Feb 2003 00:13:51 +0000
Subject: copy filesystem to nand flash without ecc
In-Reply-To: <200302142337.34683.tglx@linutronix.de>
References: <4EF56021.2C81712E.0265FBE9@netscape.net>
 <200302131752.54716.tglx@linutronix.de>
 <000901c2d44b$fef48a70$1a00a8c0@itc.intrinsyc.com>
 <200302142337.34683.tglx@linutronix.de>
Message-ID: <1045268030.13543.3.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-02-14 at 22:37, Thomas Gleixner wrote:
> On Friday 14 February 2003 18:10, Alex Samoutin wrote:
> > But I can see call     mtd->write()  in  jffs2_flash_write() (wbuf.c).  It
> > is not ECC write.
> > This function invoked from jffs2_garbage_collect_pristine(). and   cause a
> > problem.
> Well spotted. Thanks.

Sorry. Mea Culpa. We really shouldn't have jffs2_flash_writev() writing
into the wbuf, which jffs2_flash_write() writes directly to the flash.
It'll confuse me into writing directly to the flash just because I have
only one iovec to write :)

-- 
dwmw2
