Received: from atlrel9.hp.com ([156.153.255.214])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BB5wk-0005xI-2S
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2004 06:49:58 +0100
Date: Wed, 7 Apr 2004 07:47:17 +0200
From: andreas.huebner@hp.com
To: linux-mtd@lists.infradead.org
Message-ID: <20040407054717.GA18413@smstf09.bbn.hp.com>
References: <Pine.LNX.4.44.0404041514100.12090-100000@kiire.colleduc.ee>
	<200404041421.11425.tglx@linutronix.de> <407355CB.8000602@umd.umich.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <407355CB.8000602@umd.umich.edu>
Subject: Re: CVS compile errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

On Tue, Apr 06, 2004 at 09:13:47PM -0400, Jon Schlueter wrote:
> 
> I think I found another missed update but I'm not sure.
> 
> make -C devices modules
> make[3]: Entering directory `/usr/src/linux-2.4.25/drivers/mtd/devices'
> gcc -D__KERNEL__ -I/usr/src/linux-2.4.25/include -Wall 
> -Wstrict-prototypes -Wno-trigraphs -O2 -fno-strict-aliasing -fno-common 
> -fomit-frame-pointer -pipe -mpreferred-stack-boundary=2 -march=i486 
> -DMODULE  -nostdinc -iwithprefix include -DKBUILD_BASENAME=doc2000  -c 
> -o doc2000.o doc2000.c
> doc2000.c: In function `DoC_IdentChip':
> doc2000.c:415: structure has no member named `page256'
> doc2000.c: In function `DoC2k_init':
> doc2000.c:601: warning: assignment from incompatible pointer type
> doc2000.c:602: warning: assignment from incompatible pointer type
> doc2000.c: In function `doc_writev_ecc':
> doc2000.c:1026: warning: passing arg 7 of `doc_write_ecc' makes integer 
> from pointer without a cast
> make[3]: *** [doc2000.o] Error 1
> make[3]: Leaving directory `/usr/src/linux-2.4.25/drivers/mtd/devices'
> make[2]: *** [_modsubdir_devices] Error 2
> make[2]: Leaving directory `/usr/src/linux-2.4.25/drivers/mtd'
> make[1]: *** [_modsubdir_mtd] Error 2
> make[1]: Leaving directory `/usr/src/linux-2.4.25/drivers'
> make: *** [_mod_drivers] Error 2

I can confirm this error.


Andreas
