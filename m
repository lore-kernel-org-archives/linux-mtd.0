Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CJvw6-0004o5-6B
	for linux-mtd@lists.infradead.org; Tue, 19 Oct 2004 11:30:07 -0400
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: tglx@linutronix.de
Date: Tue, 19 Oct 2004 16:18:25 +0100
References: <E0180EAB7181@baydel.com> <E0CCB8742B31@baydel.com>
	<1098198148.12223.885.camel@thomas>
In-Reply-To: <1098198148.12223.885.camel@thomas>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <E0F06759379E@baydel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Bad Blocks On JFFS2/NAND
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am using an old mtd layer which has nand.c and not nand_base.c.
I have hacked this accordingly and I will see if I can produce the same 
problem.

I did try to update my kernel but patchin.sh failed and I had to hack some 
header files to get a kernel. This kernel crashed in a couple of different 
places when writing to my SSFDC partition. I guess things have changed here 
again ?

Cheers

Simon.

On Tuesday 19 Oct 2004 4:02 pm, Thomas Gleixner wrote:
> On Tue, 2004-10-19 at 16:39, Simon Haynes wrote:
> > Thomas,
> >
> > I am using the ready pin.
>
> Hmm, the strange thing is, that it does not complain about a failed
> erase. It complaines, when checking if the chip is really erased.
>
> Can you try the hack below, which invalidates the page cachen
> unconditionally on erase ?
>
> tglx
>
> RCS file: /home/cvs/mtd/drivers/mtd/nand/nand_base.c,v
> retrieving revision 1.121
> diff -u -r1.121 nand_base.c
> --- nand_base.c 6 Oct 2004 19:53:11 -0000       1.121
> +++ nand_base.c 19 Oct 2004 15:09:35 -0000
> @@ -2091,8 +2091,7 @@
>
>                 /* Invalidate the page cache, if we erase the block
> which contains
>                    the current cached page */
> -               if (page <= this->pagebuf && this->pagebuf < (page +
> pages_per_block))
> -                       this->pagebuf = -1;
> +               this->pagebuf = -1;
>
>                 this->erase_cmd (mtd, page & this->pagemask);
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
