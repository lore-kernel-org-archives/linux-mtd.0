Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173zKc-0006tw-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 May 2002 14:12:10 +0100
Received: from pd9e343b9.dip.t-dialin.net ([217.227.67.185] helo=callisto.pengutronix.de)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 173zKb-0008GM-00
	for linux-mtd@lists.infradead.org; Sat, 04 May 2002 15:12:09 +0200
Date: Sat, 4 May 2002 15:11:48 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: 2.4.18-howto?
Message-ID: <20020504151148.Y13984@schwebel.de>
References: <20020503214738.U13984@schwebel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020503214738.U13984@schwebel.de>; from robert@schwebel.de on Fri, May 03, 2002 at 09:47:38PM +0200
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Fri, May 03, 2002 at 09:47:38PM +0200, Robert Schwebel wrote:
> can somebody give me a short pointer what has to be done to patch 2.4.18
> with the mtd stuff from cvs? I tried to checkout the main branch and the
> jffs2-2_4-branch and run patches/patchin.sh, but the kernel breaks. Is
> there some kind of a howto? I searched in the repository and the mailing
> list but didn't find anything. 

Somehow today the main branch seems to work (yesterday I got lots of
warnings and the kernel compilation broke...), so I could compile a kernel
with the latest CVS stuff. 

Now, I want to compile the utilities. Is it really necessary to copy the
utils to the kernel directory? I tried it with the below patch against
util/Makefile and 'make KERNELDIR=/path/to/my/kernel', but it breaks here: 

----------8<----------
ln -sf
/home/robert/embedded/ptxdist-0.1.1/build/linux-2.4.18-rthal5-jffs2/fs/jffs2/compr.c
compr.c
cc
-I/home/robert/embedded/ptxdist-0.1.1/build/linux-2.4.18-rthal5-jffs2/include
-O2 -Wall -Dprintk=printf -DKERN_NOTICE= -c -o compr.o compr.c
compr.c: In function `jffs2_decompress':
compr.c:135: warning: implicit declaration of function `printf'
compr.c:135: `KERN_WARNING' undeclared (first use in this function)
compr.c:135: (Each undeclared identifier is reported only once
compr.c:135: for each function it appears in.)
compr.c:135: parse error before string constant
make: *** [compr.o] Error 1 
----------8<----------

... which comes because in compr.c there is no #include <stdio.h> in case
of non-kernel code. The whole thing with -Dprintk=printf looks a little bit
like a hack, so is there a better way to compile the utilities? 

Robert

----------8<----------
--- Makefile-orig       Sat May  4 15:06:34 2002
+++ Makefile    Sat May  4 14:42:12 2002
@@ -3,7 +3,7 @@
 
 # $Id: Makefile,v 1.23 2002/03/03 16:14:24 dwmw2 Exp $
 
-CFLAGS += -I../include -O2 -Wall
+CFLAGS += -I$(KERNELDIR)/include -O2 -Wall
 
 TARGETS = ftl_format erase eraseall nftldump nanddump doc_loadbios \
 nftl_format mkfs.jffs ftl_check nandtest nandwrite mkfs.jffs2 lock unlock
\
@@ -20,7 +20,7 @@
 compr_rubin.o: pushpull.h histo_mips.h compr_rubin.h
 
 $(SYMLINKS):
-       ln -sf ../fs/jffs2/$@ $@
+       ln -sf $(KERNELDIR)/fs/jffs2/$@ $@
 
 mkfs.jffs2: crc32.o compr_rtime.o compr_rubin.o compr.o mkfs.jffs2.o
compr_zlib.o
        $(CC) -o $@ $^ -lz
----------8<----------
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
