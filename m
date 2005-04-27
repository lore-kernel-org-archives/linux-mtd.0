Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DQrFm-0002bc-5O
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2005 14:27:19 -0400
Message-ID: <426FD97D.9000105@mvista.com>
Date: Wed, 27 Apr 2005 11:27:09 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
References: <426F40A3.8010308@ipi.ac.ru>	<1114592403.879.175.camel@tglx.tec.linutronix.de>
	<426F56C1.6020204@ipi.ac.ru>
In-Reply-To: <426F56C1.6020204@ipi.ac.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: nand locking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Timofei V. Bondarenko wrote:

> It would be nice to unlock the rw partitions only.
> But it's weird a bit:
> the mtd_partition may be incomplete before add_mtd_partitions() done.
> After add_mtd_partitions() my startap code has no handle to actual 
> partition info.
> The mtd_partition.mtdp seems only choice, though it prevents partitions 
> from registering...
> So, could couple of lines in add_mtd_partitions() do that work?

If I understand correctly, it may be the same issue I ran into on Intel 
NOR flash: the chip driver (which may have the knowledge of whether the 
particular chips are locked or lockable) gets to see the "whole device" 
struct mtd_info at probe time, but doesn't see the "partition" structs 
registered later via add_mtd_partitions(), which have the per-partition 
r/w flags.

I tried adding a callback to the chip driver at each device/partition 
add (see first patch attempt in recent "Fixup Intel flash that powers up 
locked" thread).  But I believe that was part of what was (justifiably) 
deemed messy about the patch.

So far the general verdict on these flashes that power up locked seems 
to be either leave all blocks locked or unlock all blocks (either in the 
bootloader or at flash probe time), and let custom code in userspace 
lock/unlock what is needed.  I do like the idea of the kernel rectifying 
lock status with the map flags myself, though...

-- 
Todd
