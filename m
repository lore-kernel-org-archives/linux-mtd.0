Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IBeJ9-0001jn-1h
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 18:17:17 -0400
Date: Fri, 20 Jul 2007 00:13:39 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Tobias Simon <tobias.simon@sp-ss.de>
Subject: Re: flashcp
Message-ID: <20070719221339.GC27750@lazybastard.org>
References: <200707192046.47340.tobias.simon@sp-ss.de>
	<20070719195635.GA27750@lazybastard.org>
	<200707192308.21410.tobias.simon@sp-ss.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200707192308.21410.tobias.simon@sp-ss.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please keep me on Cc:.  It is generally considered to be polite and
significantly reduces the chances of me missing a reply.

On Thu, 19 July 2007 23:08:21 +0200, Tobias Simon wrote:
> 
> > 1. You're off-by-one when (filestat.st_size % mtd.erasesize) yields
> > zero.
> Oops, you're right!
> 
> > 2. In principle the "patch" looks fine.  Except that it should be a
> > patch and probably follow kernel coding style or something similar.
> 
> --- mtd-utils-1.0.0/flashcp.c   2006-04-30 22:59:15.000000000 +0200
> +++ mtd-utils-1.0.0_new/flashcp.c       2007-07-19 22:57:25.000000000 +0200
> @@ -258,7 +258,14 @@
>  #warning "Check for smaller erase regions"
> 
>     erase.start = 0;
> -   erase.length = filestat.st_size & ~(mtd.erasesize - 1);
> +
> +   if (filestat.st_size % mtd.erasesize) {
> +      erase.length = filestat.st_size + mtd.erasesize - (filestat.st_size % 
> mtd.erasesize);
> +   }
> +   else {
> +      erase.length = filestat.st_size;
> +   }
> +

Still off-by-one and needlessly complicated.

	erase.length = (filestat.st_size / mtd.erasesize) * mtd.erasesize

This always rounds down, just like the current implementation.  Whether
rounding down is correct I don't know.  Maybe Josh does.

> The standard page/erase-size of the AT45DB642x Dataflash we use 
> (http://www.atmel.com/dyn/resources/prod_documents/doc3542.pdf) is 1056.
> Although it is configurable to 1024 by software, the atmel_mtd.c driver 
> (linux-2.6.21) uses 1056 as the erase size. The driver itself is full of odd 
> erase-sizes: 
> /*
>  * Detect and initialize DataFlash device:
>  *
>  *   Device      Density         ID code          #Pages PageSize  Offset
>  *   AT45DB011B  1Mbit   (128K)  xx0011xx (0x0c)    512    264      9
>  *   AT45DB021B  2Mbit   (256K)  xx0101xx (0x14)   1025    264      9
>  *   AT45DB041B  4Mbit   (512K)  xx0111xx (0x1c)   2048    264      9
>  *   AT45DB081B  8Mbit   (1M)    xx1001xx (0x24)   4096    264      9
>  *   AT45DB0161B 16Mbit  (2M)    xx1011xx (0x2c)   4096    528     10
>  *   AT45DB0321B 32Mbit  (4M)    xx1101xx (0x34)   8192    528     10
>  *   AT45DB0642  64Mbit  (8M)    xx111xxx (0x3c)   8192   1056     11
>  *   AT45DB1282  128Mbit (16M)   xx0100xx (0x10)  16384   1056     11
>  */

Not too odd.  Just the usual 8/256 bytes extra for OOB usage.

> ------------------------------------------------------------------------
> Important Note: This e-mail and any attachments are confidential, may contain 
> trade secrets and may well also be legally privileged or otherwise protected 
> from disclosure. If you have received it in error, you are on notice of its 
> status. Please notify us immediately by reply e-mail and then delete this 
> e-mail and any attachment from your system. If you are not the intended 
> recipient please understand that you must not copy this e-mail or any 
> attachments or disclose the contents to any other person. Thank you.

Such a disclaimer will make most people simply ignore you.  If I hadn't
already answered most of your mail before seeing this I would have as
well.

Jörn

-- 
Happiness isn't having what you want, it's wanting what you have.
-- unknown
