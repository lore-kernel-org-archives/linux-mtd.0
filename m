Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqlQj-0000iM-UP
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 17:19:34 +0000
Received: by pasz6 with SMTP id z6so193842360pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 10:19:13 -0700 (PDT)
Date: Mon, 26 Oct 2015 10:19:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Andreas Fenkart <afenkart@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: override read-only flag of /dev/mtd1 partition
Message-ID: <20151026171910.GY13239@google.com>
References: <CALtMJEA7vsVxdg-s03WyehTH+bEHjvFWmGgcW5c5GjVteefFGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALtMJEA7vsVxdg-s03WyehTH+bEHjvFWmGgcW5c5GjVteefFGA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 26, 2015 at 02:28:09PM +0100, Andreas Fenkart wrote:
> Hi,
> 
> I try to modify the u-boot params using fw_setenv from linux prompt,
> unfortunately that fails since /dev/mtd1 is read-only
> 
> # fw_setenv -s enable-rescue-system.txt
> Can't open /dev/mtd1: Permission denied
> 
> Obviously, since our u-boot / linux got the flash layout wrong:
> 
> Creating 3 MTD partitions on "m25p80":
> 0x000000000000-0x0000000c0000 : "bootloader"
> 0x0000000c0000-0x0000000c2000 : "ubparams"
> mtd: partition "ubparams" doesn't end on an erase block -- force read-only

That partition ends on a 4KB boundary. I'll assume that the m25p80
driver only detects a 64KB erase block then? (You can check with
'mtdinfo' or by poking around in /sys/class/mtd/mtd*/.) MTD only allows
partitioning on eraseblock boundaries; otherwise, modifying one
partition will harm the adjacent partition.

I'll assume that your flash actually *does* support 4KB sectors, so you
can probably just add the SECT_4K flag to your flash in the SPI NOR ID
table (either in m25p80.c or in spi-nor.c, depending on your kernel
version). And please send a patch upstream, if it doesn't exist yet!

Doing this should allow you to erase on 4K boundaries and not see this
warning. But it also means that m25p80.c will be a bit slower on larger
erasures, and it won't support UBI (which assumes blocks are larger than
4KB). These are problems no one has fixed, since the MTD driver
currently can only choose one block size or another, not both.

> 0x0000000c2000-0x000000400000 : "unused"
> mtd: partition "unused" doesn't start on an erase block boundary --
> force read-only
> 
> The reason for accessing the u-boot is to switch the bootcmd to boot
> our new and shiny kernel upgrade. Intent is to leave the factory
> kernel untouched and use it as a fallback just in case.
> 
> What are my options to tinker with the u-boot environment, without
> having to replace the kernel first? Is there some magic knob, to
> switch off the read-only flag. As you can see there is nothing
> valuable coming after the u-boot params, and u-boot itself is aligned
> correctly.

So, you can't actually fix the driver first? You might be able to hack
around this problem using cmdlineparts (i.e., specify a 'mtdparts=...'
line on your kernel command line) to expand "ubparams" into the "unused"
partition. Do that at your own risk, though, as I don't know at all how
your U-Boot tools will handle this.

Answer to your second question: no, there is no magic knob to turn off
MTD's partitioning safety check. You have to fix either the partitions
or the driver.

Brian
