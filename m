Date: Fri, 10 Aug 2007 09:45:27 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: James Olin Oden <james.oden@gmail.com>
Subject: Re: What is the correct way to make an mtdchar device available?
Message-ID: <20070810134527.GA31564@marvin.netwinder.org>
References: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
	<20070808192832.GA21249@marvin.netwinder.org>
	<ac921f990708091203s4199fc67w751bc0922f65be5c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac921f990708091203s4199fc67w751bc0922f65be5c@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 09, 2007 at 03:03:12PM -0400, James Olin Oden wrote:
 
> Is there any documentation anywhere that talks about the mapping
> driver, their uses and requriements?

Not specifically, that I am aware of.  There is some documentation
in Documentation/DocBook/mtdnand.tmpl althought it is geard towards
NAND flash particulars.  I actually started writing a little HOWTO
after I had figured it out, but it never got far enough to be useful.

> I started looking into this and the config involves answering things
> like "physical start address of flash mapping".   I guess that would
> be the start adress of where the FWH maps itself into memory, but
> since there are two on the system setting this does not seem
> appropriate.

When you have multiple chips arranged contiguously, then you just give
it the beginning address of the block, and the total size.  The code 
does multiple probes in this region to identify the individual flash
chips.  Interleaved devices (eg. two x16 devices on a 32-bit bus)
are also handled the same way.

Flash is often physically located at the very top, or very bottom, of
the memory map.  So if you have say 16MiB of flash, chances are that it
is mapped at address 0xff000000 with a size of 0x01000000.

In the drivers/mtd/maps directory you will see a large number of very
similar mapping drivers for various boards.  They differ in how they
get the address/size parameters-- some are hardcoded for specific boards,
others read information dynamically from the bootloader, etc.  Many of
them also handle partitioning of the flash -- splitting physical devices
into multiple logical ones, much like you'd do on a hard disk.

> Also, is there anything that explains what one might need to do in the
> context of simply making a flash chip available for reading and
> writing through mtdchar mtdblock?

I presume you've see the FAQ and the general documention on the
www.linux-mtd.infradead.org web site?  The general steps are to turn
on MTD debug options in your kernel, enable the appropriate mapping 
driver, and then look through the "dmesg" during boot-up, you should
see your flash chip detected.  If not, check the mapping driver...
You should see something along these lines:

[...]
Uniform Multi-Platform E-IDE driver Revision: 7.00alpha2
ide: Assuming 50MHz system bus speed for PIO modes; override with idebus=xx
ide-floppy driver 0.99.newide
physmap platform flash device: 01000000 at ff000000
physmap-flash.0: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
Using buffer write method
cfi_cmdset_0001: Erase suspend on write enabled
erase region 0: offset=0x0,size=0x20000,blocks=128
[...]

Once the chip is detected, you can enable mtdblock/char drivers and
then probably you want filesystem (JFFS2/YAFFS etc) on top of that.

-R
