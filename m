Received: from dialup.rama.com.au ([202.0.186.166] helo=gateway.perth.rama.com.au)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15UNya-0000Qm-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 Aug 2001 08:42:02 +0100
Received: from willhart-tech.com (IDENT:alex@[192.156.249.82])
	by gateway.perth.rama.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id RAA22140
	for <linux-mtd@lists.infradead.org>; Wed, 8 Aug 2001 17:07:17 +0800
Message-ID: <3B70ED72.78088871@willhart-tech.com>
Date: Wed, 08 Aug 2001 15:42:42 +0800
From: Alexandru Harsanyi <a.harsanyi@willhart-tech.com>
MIME-Version: 1.0
To: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: Re: DOC 2000 driver (NFTL) in kernel 2.4.7
References: <3B70C06D.5908CAC8@willhart-tech.com>  <3B677B90.B2E244BD@cvs.anu.edu.au> <E15RXGo-00058Q-00@pentafluge.infradead.org> <30960.997176999@redhat.com> <22004.997252928@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Hi,

I commented out the ECC checking part, and nftlmount.c now detects my
partition. I mounted it read-only and made some tests with copying some
files of it. It seems to be working.

However, when I mount it read-write and I write some files to the
partition, the NFTL driver hangs my system...

The messages are:
------------
_Doc_WaitReady called for out-of-line wait
Setting inplace to 0. VUC 194, block 2 was 0 lastEUN, and is in EUN 333
(!=) 673
Cannot fold Virtual Unit Chain 194 in place. Trying out-of-place
-------------

The DOC data doesn't seem to be corrupted (as I can boot from it again)
but nothing gets written to it.

Best Regards,
Alex.

David Woodhouse wrote:
> 
> a.harsanyi@willhart-tech.com said:
> > ANAND header found at 0xc000 in mtd0, but ECC read failed (err 1)
> > ANAND header found at 0xe000 in mtd0, but ECC read failed (err 1)
> > Could not find valid boot record
> 
> And with this applied...?
> 
> Index: nftlmount.c
> ===================================================================
> RCS file: /home/cvs/mtd/drivers/mtd/nftlmount.c,v
> retrieving revision 1.20
> diff -u -r1.20 nftlmount.c
> --- nftlmount.c 2001/08/07 09:22:07     1.20
> +++ nftlmount.c 2001/08/08 06:41:48
> @@ -103,6 +103,7 @@
>                         continue;
>                 }
> 
> +#if 0
>                 /* Finally reread to check ECC */
>                 if ((ret = MTD_READECC(nftl->mtd, block * nftl->EraseSize, SECTORSIZE,
>                                 &retlen, buf, (char *)&oob) < 0)) {
> @@ -119,6 +120,7 @@
>                                buf[0], buf[1], buf[2], buf[3], buf[4], buf[5]);
>                         continue;
>                 }
> +#endif
> 
>                 /* OK, we like it. */
> 
> 
> --
> dwmw2
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
