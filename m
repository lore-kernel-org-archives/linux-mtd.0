Received: from bs1.dnx.de ([213.252.143.130] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1745HG-0007Ib-00
	for <linux-mtd@lists.infradead.org>; Sat, 04 May 2002 20:33:06 +0100
Received: from pd9e343b9.dip.t-dialin.net ([217.227.67.185] helo=callisto.pengutronix.de)
	by bs1.dnx.de with asmtp (Exim 3.34 #1)
	id 1745HF-0000Sc-00
	for linux-mtd@lists.infradead.org; Sat, 04 May 2002 21:33:05 +0200
Date: Sat, 4 May 2002 21:32:42 +0200
From: Robert Schwebel <robert@schwebel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: 2.4.18-howto?
Message-ID: <20020504213242.A29364@schwebel.de>
References: <20020503214738.U13984@schwebel.de> <20020504151148.Y13984@schwebel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020504151148.Y13984@schwebel.de>; from robert@schwebel.de on Sat, May 04, 2002 at 03:11:48PM +0200
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

On Sat, May 04, 2002 at 03:11:48PM +0200, Robert Schwebel wrote:
> ... which comes because in compr.c there is no #include <stdio.h> in case
> of non-kernel code. The whole thing with -Dprintk=printf looks a little
> bit like a hack, so is there a better way to compile the utilities? 

... meaning that at the moment they do not compile at all. At the moment
I seem to have resolved some of the problem, but I'm stuck here: 

----------8<----------
robert@callisto:~/embedded/cvs/mtd/util ! make
KERNELDIR=~/embedded/ptxdist-0.1.1/build/linux-2.4.18-rthal5-jffs2
cc -o mkfs.jffs2 crc32.o compr_rtime.o compr_rubin.o compr.o mkfs.jffs2.o
compr_zlib.o -lz
compr_rubin.o: In function `encode':
compr_rubin.o(.text+0x88): undefined reference to `pushbit'
compr_rubin.o: In function `end_rubin':
compr_rubin.o(.text+0x124): undefined reference to `pushbit'
compr_rubin.o: In function `rubin_do_compress':
compr_rubin.o(.text+0x3ee): undefined reference to `init_pushpull'
compr_rubin.o(.text+0x447): undefined reference to `pushedbits'
compr_rubin.o: In function `rubin_do_decompress':
compr_rubin.o(.text+0x695): undefined reference to `init_pushpull'
compr.o: In function `jffs2_compress':
compr.o(.text+0x1a): undefined reference to `zlib_compress'
compr.o: In function `jffs2_decompress':
compr.o(.text+0xa8): undefined reference to `zlib_decompress'
collect2: ld returned 1 exit status
make: *** [mkfs.jffs2] Error 1
---------->8----------

Where comes pushbit() from? I cannot avoid the impression that I'm doing
something significantly wrong...

Robert
-- 
 +--------------------------------------------------------+
 | Dipl.-Ing. Robert Schwebel | http://www.pengutronix.de |
 | Pengutronix - Linux Solutions for Science and Industry |
 |   Braunschweiger Str. 79,  31134 Hildesheim, Germany   |
 |    Phone: +49-5121-28619-0 |  Fax: +49-5121-28619-4    |
 +--------------------------------------------------------+
