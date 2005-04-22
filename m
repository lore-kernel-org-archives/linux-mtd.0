Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOoTR-0003K3-7L
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 23:04:58 -0400
Message-ID: <426869D7.3050202@mvista.com>
Date: Thu, 21 Apr 2005 20:04:55 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <20050413010315.GA31632@slurryseal.ddns.mvista.com>
	<Pine.LNX.4.62.0504122118560.14514@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.62.0504122118560.14514@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fixup Intel flash that powers up locked
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:

> Properly dealing with this "feature" appears to be so messy that I'm 
> starting to wonder if we should not just unconditionally unlock the 
> flash at boot time and be done with it.

Or leave all blocks locked to err on the side of safety and require 
userspace init scripts to unlock writeable partitions.

> It's only the flash used for the root filesystem which is problematic 
> anyway, right?  If so then I think there should be a mount option for 
> JFFS* such that it directly unlocks the whole of the MTD device it's 
> about to be mounted on when it's mounted read-write.  That's it.

Read-only root with writeable partitions mounted afterwards is what I 
suggest, I imagine there's reasons not to do it that way, though.

> As for the suspend case then you should probably just preserve the flash 
> lock state before suspending and restore that state upon resume.

I'm guessing the code for that would trigger the messy alarms as well...

Am finding the frob DEBUG_LOCK_BITS logic doesn't read lock status 
properly on this board's chip (blocks that appear to be writeable still 
read status non-zero).  This makes it difficult to setup the bitmap at 
suspend time.  Now, I could maintain the bitmap at each block 
lock/unlock time, but the frob code doesn't pass the eraseregion info 
(useful to understand region size and maintain per-region bitmap) to the 
chip driver (which knows whether the chip has this powers-up-locked 
property).  Alas.  I will play with this some more.

> Why are you doing this block by block? You could as well just do:
> 
> 	cfi_intelext_unlock(mtd, 0, mtd->size);
> 
> since the block walking is already performed by cfi_varsize_frob().

Aargh, that code predated the frob on multi-partition flash fix, sorry. 
  Thanks,


-- 
Todd
