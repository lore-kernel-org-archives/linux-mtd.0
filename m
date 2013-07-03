Received: from relais.videotron.ca ([24.201.245.36])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuRql-0004w6-Ta
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 18:32:20 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; CHARSET=US-ASCII
Received: from xanadu.home ([70.83.209.44]) by VL-VM-MR004.ip.videotron.ca
 (Oracle Communications Messaging Exchange Server 7u4-22.01 64bit (built Apr 21
 2011)) with ESMTP id <0MPD00KEHI5780A0@VL-VM-MR004.ip.videotron.ca> for
 linux-mtd@lists.infradead.org; Wed, 03 Jul 2013 14:31:55 -0400 (EDT)
Date: Wed, 03 Jul 2013 14:31:55 -0400 (EDT)
From: Nicolas Pitre <nico@fluxnic.net>
To: "Anna Fischer (novero/Bochum)" <Anna.Fischer@novero.com>
Subject: Re: XIP support
In-reply-to: <CBB26B88EF85F6489575628B28ECBE6D4326BAAE1E@ablexc01.internal.novero.com>
Message-id: <alpine.LFD.2.03.1307031415540.18597@syhkavp.arg>
References: <CBB26B88EF85F6489575628B28ECBE6D4326BAAE1E@ablexc01.internal.novero.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 3 Jul 2013, Anna Fischer (novero/Bochum) wrote:

> Hi everyone,
> 
> I'm looking for help on Linux XIP support on MTD devices.
> 
> I'd like to create a system where I can use a single NOR as XIP device 
> and at the same time as data storage device. E.g. I can imagine that 
> on my NOR flash device I create two partitions: one as ROMFS 
> supporting XIP which holds kernel and application code, and one as 
> standard data storage, for example holding a read-write YAFFS2 file 
> system which my applications can use to store data.
> 
> Can anyone clarify if this is supported with the current kernel 
> infrastructure, and if yes then what support do I need on the NOR 
> flash device itself? I assume that the device itself will need to 
> support reading from one segment in NOR (e.g. XIP partition) whilst 
> writing to another one (data partition). Many flash vendors call this 
> read-while-erase support.

Yes.  And in that case you don't need very much in terms of software 
support, besides making sure that your MTD partitions are defined to 
match the NOR flash partition boundaries.

> On the other hand I assume that if the software is capable, then it 
> should also be sufficient that the NOR flash support partial erase 
> functions, and suspend/resume for those operations. Can anyone confirm 
> that this can be handled in Linux MTD drivers?

There is support for doing that with Intel NOR flash parts.  I don't 
know if the other NOR flash drivers have that capability though.  See 
code related to CONFIG_MTD_XIP in drivers/mtd/chips/cfi_cmdset_0001.c.  

Some platform specific helpers such as those found in the following 
files are needed:

arch/arm/mach-omap1/include/mach/mtd-xip.h
arch/arm/mach-pxa/include/mach/mtd-xip.h
arch/arm/mach-sa1100/include/mach/mtd-xip.h

This feature, however, is not used much by contemporary platforms.  So 
it might not be as well tested as it used to.


Nicolas
