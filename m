Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IplCi-0005xJ-Bh
	for linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 08:44:31 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JR5002G125NNJC0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 07 Nov 2007 08:44:12 -0500 (EST)
Date: Wed, 07 Nov 2007 08:44:11 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Alexander Belyakov <abelyako@googlemail.com>
Subject: Re: [PATCH] [CFI] Prevent erase command invocation on suspended chip
In-reply-to: <fe810cf0711070058obc3c3fdm4a34f956e5ff4a96@mail.gmail.com>
Message-id: <alpine.LFD.0.9999.0711070843430.21255@xanadu.home>
References: <fe810cf0711070058obc3c3fdm4a34f956e5ff4a96@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 7 Nov 2007, Alexander Belyakov wrote:

> Hello,
> 
> while running stress tests we have met cfi_cmdset_0001.c driver issue.
> Working on multipartitional devices with erase suspend on write
> feature enabled it is possible to get erase operation invoked on chip
> with suspended erase. get_chip() looses information about earlier
> suspended erase and new erase operation gets issued. New erase
> operations report successful completion, but blocks remain dirty
> causing, for example, JFFS2 error messages like:
> 
> ...
> Newly-erased block contained word 0x20031985 at offset 0x00200000
> Newly-erased block contained word 0x20031985 at offset 0x00280000
> Newly-erased block contained word 0x20031985 at offset 0x00240000
> ...
> 
> 
> The patch below fixes that issue.
> 
> Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>

Acked-by: Nicolas Pitre <nico@cam.org>


> 
> diff -uNr a/drivers/mtd/chips/cfi_cmdset_0001.c
> b/drivers/mtd/chips/cfi_cmdset_0001.c
> --- a/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-06 11:40:24.000000000 +0300
> +++ b/drivers/mtd/chips/cfi_cmdset_0001.c	2007-11-06 20:37:03.000000000 +0300
> @@ -795,6 +795,7 @@
>  static int get_chip(struct map_info *map, struct flchip *chip,
> unsigned long adr, int mode)
>  {
>  	int ret;
> +	DECLARE_WAITQUEUE(wait, current);
> 
>   retry:
>  	if (chip->priv && (mode == FL_WRITING || mode == FL_ERASING
> @@ -851,6 +852,20 @@
>  			spin_unlock(contender->mutex);
>  		}
> 
> +		/* Check if we already have suspended erase
> +		 * on this chip. Sleep. */
> +		if (mode == FL_ERASING && shared->erasing
> +		    && shared->erasing->oldstate == FL_ERASING) {
> +			spin_unlock(&shared->lock);
> +			set_current_state(TASK_UNINTERRUPTIBLE);
> +			add_wait_queue(&chip->wq, &wait);
> +			spin_unlock(chip->mutex);
> +			schedule();
> +			remove_wait_queue(&chip->wq, &wait);
> +			spin_lock(chip->mutex);
> +			goto retry;
> +		}
> +
>  		/* We now own it */
>  		shared->writing = chip;
>  		if (mode == FL_ERASING)
> 


Nicolas
