Received: from saturn.open-widgets.com ([209.251.101.200]
	helo=saturn.billgatliff.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AhueD-00036o-5i
	for linux-mtd@lists.infradead.org; Sat, 17 Jan 2004 17:54:13 +0000
Received: from billgatliff.com (meta-adsl-71.mtco.com [207.179.223.71])
	by saturn.billgatliff.com (Postfix) with ESMTP id 7108E4E0004
	for <linux-mtd@lists.infradead.org>;
	Sat, 17 Jan 2004 11:52:00 -0600 (CST)
Message-ID: <40097640.2020305@billgatliff.com>
Date: Sat, 17 Jan 2004 11:52:00 -0600
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <4008E43E.3080009@billgatliff.com>
In-Reply-To: <4008E43E.3080009@billgatliff.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Using mtdparts= right?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guys:


Got it, at least partway...

I'm running an Intel E28F640J3, and for reasons I haven't tracked down 
yet the chip ends up in READ STATUS mode by the time my map driver's 
copy_from() is called.  For the short term, I'm breakpointing there and 
forcing the chip back into READ ARRAY mode by doing this:

(gdb) set *(long*)<flash-address-from-ioremap> 0xff00ff

[I'll track down a better solution shortly]

I now also know that the reason the @offset field in my mtdparts command 
line isn't working is because although the command line is getting 
parsed correctly, do_cached_read() (or somebody underneath) isn't 
applying that offset to the addresses sent to the read/write functions 
in the map driver.  As a workaround, I modified the read/write functions 
in my map driver to look something like this:

void csb337_copy_from(struct map_info *map, void *to, unsigned long 
from, ssize_t len)
{
#if 1
  /* TODO: assume we have only one partition and offset, since I can't
     see where else to apply this offset.  b.g. 1/17/2004 */
  if (mtd_parts)
    memcpy_fromio(to, map->map_priv_1 + from + mtd_parts->offset, len);
  else
#endif
    memcpy_fromio(to, map->map_priv_1 + from , len);
}


I'm somewhat confused about where to apply this fix correctly, although 
the above code appears to work (as long as there is only one 
partition!).  MTD_READ has the mtd_info structure, but I don't see where 
it does anything involving partitions, so I don't know how to figure out 
which partition offset (if there are multiple partitions) should be 
added to the address that eventually gets handed to the map driver.

Doing it in the map driver doesn't seem right, either, because to do it 
right I'd have to do a kind of reverse-lookup in the partition and map 
structures to figure out which partition the provided address applies 
to, so I can figure out which partition offset to apply.

Of course, it could also be that I'm totally misunderstanding the 
purpose behind @offset...

I'd love to hear more from someone who actually knows how this stuff is 
intended to work.  :^)


Thanks!


b.g.



Bill Gatliff wrote:

> Guys:
>
>
> I need a quick sanity check here.  I'm giving this to my arm-linux 
> 2.4.21-rmk1 kernel (and the MTD code it contains, I'm not running from 
> CVS sources):
>
> root=/dev/mtdblock0 mtdparts=csb337-nor:1536000@0x8d43c(root)ro ...
>
> I've added a maping for "csb337-nor", which starts at the first 
> physical address of flash and contains the whole flash.  My romfs root 
> image starts at an offset of 0x8d43c from the beginning of that flash.
>
> I get this during boot:
>
> ...
> CSB337-NOR: 0x00800000 at 0x10000000
> cfi_cmdset_0001: Erase suspend on write enabled
> Using buffer write method
> mtd: Giving out device 0 to NOR flash on CSB337
> CSB337-NOR: using command line partition definition
> Creating 1 MTD partitions on "NOR flash on CSB337":
> 0x0008d43c-0x0020443c : "root"
> mtd: Giving out device 1 to root
> ...
>
> Then I get this:
>
> ...
> NetWinder Floating Point Emulator V0.97 (double precision)
> mtdblock_open
> ok
> mtdblock: read on "NOR flash on CSB337" at 0x0, size 0x400
> mtdblock_release
> ok
> Kernel panic: VFS: Unable to mount root fs on 1f:00
>
>
> I have romfs turned on, and I've stepped through a lot of code in the 
> kernel during boot.  What I've noticed is that get_sb_bdev() is 
> returning EBUSY.  I also don't understand why MTD is reading 0x400 
> bytes from the start of flash, when it should be getting the 
> superblock from 0x8d43c.
>
> Ideas?  I'm on my way to step through get_sb_bdev() now...
>
>
> Thanks!
>
>
> b.g.
>

-- 
Bill Gatliff
Embedded GNU development and training services.
bgat@billgatliff.com
