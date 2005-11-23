Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeyB6-0000Br-IH
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 12:13:09 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQF00D5U3TOZWB0@VL-MO-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 12:13:00 -0500 (EST)
Date: Wed, 23 Nov 2005 12:13:00 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F92C2EFE7C3BA745855BF7036E1F3F9A0161CDF8@NNSMSX401>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0511231141460.6022@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F92C2EFE7C3BA745855BF7036E1F3F9A0161CDF8@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Deadlock in cfi_cmdset_0001.c on simultaneous write operations.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 23 Nov 2005, Korolev, Alexey wrote:

> Hi All,
>  
> I faced a halting issue on multi partitioned chip when I tried to
> execute simultaneous write operations.

What platform are you using?  SMP or not?  Using CONFIG_PREEMPT or not?

> Platform has halted, on execution of this sequence:
> dd if=random of=/dev/mtd4 bs=4k count=1k&
> dd if=random of=/dev/mtd5 bs=4k count=1k&
> dd if=random of=/dev/mtd6 bs=4k count=1k
> 
> Halt didn't happens on two simultaneous write operations
> Execution of 
> dd if=random of=/dev/mtd5 bs=4k count=1k&
> dd if=random of=/dev/mtd6 bs=4k count=1k
> was ok.

How big are your MTD partitions?  Are they located on separate 
_hardware_ partitions or do some of them share one of them?

> I made small investigation. Platform falls to deadlock in get_chip
> function.
> I was unable to definetly locate the place of the halt. But I gues it
> happened here.

Could you add some printk()'s to determine if the code is looping ...

>   struct flchip_shared *shared = chip->priv;
>   struct flchip *contender;
>   spin_lock(&shared->lock);
>   contender = shared->writing;
>   if (contender && contender != chip) {
>    int ret = spin_trylock(contender->mutex);
>    spin_unlock(&shared->lock);
>    if (!ret)
>     goto retry;
      ^^^^^^^^^^^ here?

>    spin_unlock(chip->mutex);
>    ret = get_chip(map, contender, contender->start, mode);
>    spin_lock(chip->mutex);
>    if (ret) {
>     spin_unlock(contender->mutex);
>     return ret;
>    }
>    timeo = jiffies + HZ;
>    spin_lock(&shared->lock);
>   }
>   shared->writing = chip;
>   if (mode == FL_ERASING)
>    shared->erasing = chip;
>   if (contender && contender != chip)
>    spin_unlock(contender->mutex);
>   spin_unlock(&shared->lock);
> 
> I slightly simplified functionality of the code and it helped, the
> following code doesn't halt

But that code is broken.

>   struct flchip_shared *shared = chip->priv;
>   struct flchip *contender;
>  
>   contender = shared->writing;
>   if (contender && contender != chip) {
>       yield(); 
>        timeo = jiffies + HZ;
>       goto retry;
>   }
>   /* We now own it */
    ^^^^^^^^^^^^^^^^^^^  wrong !

Nothing prevents another thread coming along and assigning itself the 
ability to write at this point, just _after_ the current thread 
determined that no contender was there but _before_ the shared lock is 
acquired below.

>   spin_lock(&shared->lock);     
>   shared->writing = chip;

And then the other thread sees its ownership overwritten.


Nicolas
