Received: from gateway.innominate.fta-berlin.de ([141.16.74.40]
	helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BEOXU-0004lr-7o
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2004 09:17:32 +0100
Received: from tkeitel by tkeitel001.bln.innominate.local with local (Exim
	3.35 #1 (Debian))	id 1BEOXR-0000YX-00
	for <linux-mtd@lists.infradead.org>; Fri, 16 Apr 2004 10:17:29 +0200
Date: Fri, 16 Apr 2004 10:17:29 +0200
From: Tino Keitel <tino.keitel@innominate.com>
To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-ID: <20040416081729.GN22670@tkeitel001.bln.innominate.local>
References: <20040415144031.GU29551@tkeitel001.bln.innominate.local>
	<200404152050.25417.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200404152050.25417.tglx@linutronix.de>
Sender: Tino Keitel <tino.keitel@innominate.com>
Subject: Re: JFFS2 writes fail with 2.4.25
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 15, 2004 at 20:50:25 +0200, Thomas Gleixner wrote:
> On Thursday 15 April 2004 16:40, Tino Keitel wrote:
> > Hi folks,
> >
> > The system is an Intel XScale IXP425 board (ARM little endian) with
> > 16 MB NOR flash. I use the JFFS2 from the 2.4.25 kernel. Any hints
> > what's wrong here?
> >
> Can you try  MTD CVS code ?

What CVS tag or branch should I use? I tried HEAD, but I got this
error:

/usr/local/innominate/bin/arm-xscale-linux-gnu-gcc -mbig-endian
-D__KERNEL__ -I/usr/home/tkeitel/cvs/mguard_new_gai/source/
linux-2.4.25-mtd-cvs/include -Wall -Wstrict-prototypes -Wno-trigraphs
-Os -fno-strict-aliasing -fno-common -Uarm -fno-common -pipe -mapcs-32
-D__LINUX_ARM_ARCH__=5 -march=armv4 -Wa,-mxscale -mtune=strongarm
-mshort-load-bytes -msoft-float -Uarm   -nostdinc -iwithprefix include
-DKBUILD_BASENAME=mtdchar   -c -o mtdchar.o mtdchar.c
mtdchar.c: In function `mtd_notify_add':
mtdchar.c:480: warning: implicit declaration of function `devfs_mk_cdev'
mtdchar.c: In function `mtd_notify_remove':
mtdchar.c:494: warning: implicit declaration of function `devfs_remove'
mtdchar.c: In function `init_mtdchar':
mtdchar.c:509: warning: passing arg 1 of `devfs_mk_dir' from incompatible pointer type
mtdchar.c:509: too few arguments to function `devfs_mk_dir'
make[3]: *** [mtdchar.o] Error 1

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   enabling security
tel: +49.30.6392-3308                      http://www.innominate.com/
