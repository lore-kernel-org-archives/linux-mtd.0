Received: from netserv.ipi.ac.ru ([83.149.245.1] helo=ipi.ac.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DR30Q-0003sW-Cy
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2005 03:00:15 -0400
Message-ID: <427089FF.4020704@ipi.ac.ru>
Date: Thu, 28 Apr 2005 11:00:15 +0400
From: "Timofei V. Bondarenko" <timm@ipi.ac.ru>
MIME-Version: 1.0
To: Todd Poynor <tpoynor@mvista.com>
References: <426F40A3.8010308@ipi.ac.ru>	<1114592403.879.175.camel@tglx.tec.linutronix.de>
	<426F56C1.6020204@ipi.ac.ru> <426FD97D.9000105@mvista.com>
In-Reply-To: <426FD97D.9000105@mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand locking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Todd Poynor wrote:
> Timofei V. Bondarenko wrote:
> 
>> It would be nice to unlock the rw partitions only.
>> After add_mtd_partitions() my startap code has no handle to actual 
>> partition info.
>> The mtd_partition.mtdp seems only choice, though it prevents 
>> partitions from registering...
>> So, could couple of lines in add_mtd_partitions() do that work?
> 
> If I understand correctly, it may be the same issue I ran into on Intel 
> NOR flash: the chip driver (which may have the knowledge of whether the 
> particular chips are locked or lockable) gets to see the "whole device" 
> struct mtd_info at probe time, but doesn't see the "partition" structs 
> registered later via add_mtd_partitions(), which have the per-partition 
> r/w flags.

Yes, exactly.

> I tried adding a callback to the chip driver at each device/partition 
> add (see first patch attempt in recent "Fixup Intel flash that powers up 
> locked" thread).  But I believe that was part of what was (justifiably) 
> deemed messy about the patch.

Do you mean 'mtd_info::notify_add' ?
I've mentioned the 'mtd_partition::mtdp' - it could be an alternative
(a bit complicated though). The register_mtd_user() also may help...

> So far the general verdict on these flashes that power up locked seems 
> to be either leave all blocks locked or unlock all blocks (either in the 
> bootloader or at flash probe time), and let custom code in userspace 
> lock/unlock what is needed.  I do like the idea of the kernel rectifying 
> lock status with the map flags myself, though...

I'm not complaining about.

--
	Timofei
