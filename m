Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ef2hO-0005Mg-1r
	for linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 17:02:47 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQF002TPH8GQLH0@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 23 Nov 2005 17:02:41 -0500 (EST)
Date: Wed, 23 Nov 2005 17:02:40 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F92C2EFE7C3BA745855BF7036E1F3F9A0161CDF8@NNSMSX401>
To: "Korolev, Alexey" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0511231440450.6022@localhost.localdomain>
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

I tested the above and cannot reproduce any hang whatsoever, even with 
additional parallel writes.

> I made small investigation. Platform falls to deadlock in get_chip
> function.
> I was unable to definetly locate the place of the halt. But I gues it
> happened here.
>  
>   struct flchip_shared *shared = chip->priv;
>   struct flchip *contender;
>   spin_lock(&shared->lock);
>   contender = shared->writing;
>   if (contender && contender != chip) {
>    int ret = spin_trylock(contender->mutex);
>    spin_unlock(&shared->lock);
>    if (!ret)
>     goto retry;
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

Actually, the above is a bit too strict. I don't know if the following 
patch will fix your problem, but it certainly makes it look more correct 
from a theoretical point of view.

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index 143f01a..a4b07e2 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -644,9 +644,8 @@ static int get_chip(struct map_info *map
 		 *
 		 * - contension arbitration is handled in the owner's context.
 		 *
-		 * The 'shared' struct can be read when its lock is taken.
-		 * However any writes to it can only be made when the current
-		 * owner's lock is also held.
+		 * The 'shared' struct can be read and/or written only when
+		 * its lock is taken.
 		 */
 		struct flchip_shared *shared = chip->priv;
 		struct flchip *contender;
@@ -675,14 +674,13 @@ static int get_chip(struct map_info *map
 			}
 			timeo = jiffies + HZ;
 			spin_lock(&shared->lock);
+			spin_unlock(contender->mutex);
 		}
 
 		/* We now own it */
 		shared->writing = chip;
 		if (mode == FL_ERASING)
 			shared->erasing = chip;
-		if (contender && contender != chip)
-			spin_unlock(contender->mutex);
 		spin_unlock(&shared->lock);
 	}
 

Nicolas
