Received: from www.osadl.org ([213.239.205.134] helo=mail.tglx.de)
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwoC7-0001Ig-EC
	for linux-mtd@lists.infradead.org; Sat, 01 Jul 2006 23:44:08 +0100
Subject: Re: initializing chip->wq in cfi_cmdset_0002.c
From: Thomas Gleixner <tglx@linutronix.de>
To: dbyron@hheld.com
In-Reply-To: <001101c69d3a$b12f2a00$6534800a@RudiDell>
References: <001101c69d3a$b12f2a00$6534800a@RudiDell>
Content-Type: text/plain
Date: Sun, 02 Jul 2006 00:46:18 +0200
Message-Id: <1151793978.25491.869.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-07-01 at 11:18 -0700, David Byron wrote:
> I'm using cfi_cmdset_0002.c to access a flash chip and I ran into an oops
> from trying to dereference a null pointer.  I found a fix for it, but I feel
> like there must be something I don't understand.  Seems like other folks
> would have run into this as well.
> 
> The crash comes with the call to wake_up(&chip->wq) on the last line of
> put_chip.  I can't see anywhere that this data structure is initialized.  I
> looked at some of the other cfi_cmdset* files and decided that
> 
> diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c
> b/drivers/mtd/chips/cfi_cmdset_0002.c
> index 9885726..8a390b3 100644
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c
> @@ -320,6 +320,7 @@ #endif
>  		cfi->chips[i].word_write_time =
> 1<<cfi->cfiq->WordWriteTimeoutTyp;
>  		cfi->chips[i].buffer_write_time =
> 1<<cfi->cfiq->BufWriteTimeoutTyp;
>  		cfi->chips[i].erase_time =
> 1<<cfi->cfiq->BlockEraseTimeoutTyp;
> +		init_waitqueue_head(&cfi->chips[i].wq);
>  	}
>  
>  	map->fldrv = &cfi_amdstd_chipdrv;
> 
> was a good place to initialize.  It fixes the oops for me.  Can someone
> confirm that this makes sense?

Yes, it makes sense. Please fix your mailer not to line wrap patches.
Makes them hard to read and impossible to apply. Please resend !

I'm sure we fixed that some time ago. Might have been lost when we
switched from CVS to git. David ?

	tglx
