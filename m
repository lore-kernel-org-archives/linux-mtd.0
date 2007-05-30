From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Pete MacKay'" <linux@architechnical.net>, <linux-mtd@lists.infradead.org>
References: <2453.69.30.123.186.1179897401.squirrel@architechnical.net>
Subject: RE: OneNAND alternative to X-Load
Date: Wed, 30 May 2007 10:27:42 +0900
Message-ID: <001001c7a259$bd351470$e1ac580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <2453.69.30.123.186.1179897401.squirrel@architechnical.net>
Cc: u-boot-users@lists.sourceforge.net
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Pete Mackay,

Before the main story, I explain the history of x-loader.
First, it was designed for NAND boot from TI for their platforms. With simple
code and similar structure of U-Boot, it's easy to modify for OneNAND.
And at that time, we also considered another bootloader, of course, including
U-Boot. So we released the X-loader for OneNAND as 1st bootloader.

Now you want to add the 1KB bootloader (1st bootloader) for OneNAND at U-Boot. I
think there's no problem except the handling of code position at OneNAND.

The original handling of xloader is like this
1. The xloader (less than 1KB) loads u-boot image to DRAM using BufferRAM0.
2. Jump to DRAM address
3. run u-boot at DRAM

0x0000 (BootRAM0) __xloader_start                   --> load u-boot code to
BufferRAM0
0x03fff                     __xloader_end
0x0400 (not valid)
0x0800 (BufferRAM0) used for xloader buffer ram --> u-boot code
0x0bff                
0x0c00 (BufferRAM1) not used                           --> used for u-boot
buffer ram
0x0fff

But as you mentioned, you can make a u-boot.bin image with linker script
handling. Overall structures are similar except that it's built with one time.

Also you can find the similar idea at
http://linuxdevices.com/articles/AT2779754250.html

And please see the below comment.

Thank you,
Kyungmin Park

> 
> We're developing a PXA-270-based machine that will boot from 
> OneNAND.  I
> wanted to share my ideas (and code) with anyone faced with 
> this challenge,
> since this forum (esp. Kyungmin Park - thank you!!) was quite helpful.
>  I'll start off explaining my u-boot code, then when I get 
> some time I'll
> submit my PXA-270 platform driver as a patch (currently works 
> on 2.6.18).
> 
> We use a common approach: in lacking JTAG we have chip select 
> jumpers that
> swap CS0/CS1 between NOR and OneNAND.  The OneNAND has a 
> bottom-mapped 2K
> boot buffer of which 1K is valid, which is where the level 1 
> boot loader
> fits.  It uses two memory-mapped 'bufferrams' to ping-pong 
> data out of the
> NAND pages, but you want to use BUFFERRAM1 only as writing 
> BUFFERRAM0 can
> corrupt BOOTRAM0 on some revs of the chip.  (We're executing out of
> BOOTRAM0 so that's bad :).
> 
> There is open-source code called "x-loader" that is a 
> stripped-down u-boot
> for the level 1 boot loader.  What I did was integrate the level 1
> function into u-boot itself with a custom configuration and 
> linker script.
> In the top u-boot Makefile I added this:
> 
> myboard_config	:	unconfig
> 	@./mkconfig $(@:_config=) arm pxa myboard
> 
> myboard_onenand_config	:	unconfig
> 	@./mkconfig $(@:_config=) arm pxa myboard
> 	@echo "LDSCRIPT := 
> $(TOPDIR)/board/myboard/u-boot.onenand.lds" >>
> include/config.mk
> 
> In include/configs/myboard_onenand.h I simply define 
> CONFIG_BOOT_ONENAND
> and then include myboard.h, with conditional switches inside for base
> address, etc (i.e. define CONFIG_IDENT_STRING as " from 
> OneNAND" or " from
> NOR").
> 
> The linker script replaces cpu/pxa/start.S with oneboot.S and 
> makes sure
> the C code to load the other pages positions there too.  Then 
> it aligns
> the rest of u-boot at the 2K boundary (NAND page 1).  The 
> oneboot.S code
> melds start.S with lowlevel_init but calls C code to read the 
> rest of the
> block 0 pages into RAM.  I later optimized it to replace 
> start.S entirely
> for the NOR version.
> 
> BTW, I lacked originality and stole (liked) the name: oneboot 
> is not to be
> confused with the script that merges x-load and u-boot into one binary
> image.
> 
> This is the relevant portion of the u-boot linker script:
> 
> 	. = 0x00000000;
> 
> 	. = ALIGN(4);
> 	.text :
> 	{
> 	  board/myboard/oneboot.o	(.text)
> 	  board/myboard/onenand_boot.o	(.text)

The onenand_boot.c is common code for all platforms. I think it's located in
drivers/onenand or onenand_spl as nand_spl in U-Boot.
Yes I know the OneNAND patch for U-Boot is not merged yet. In this code,
however, there's no problem to boot with OneNAND.

> 	  __oneboot_end = .;	/* must not exceed 0x400! */
> 
> 	  . = 0x800;		/* reposition to 2K page boundary */
> 	  __page1_start = .;	/* OneNAND loading starts here */
> 	  *				(.text)
> 	}
> 
> Look at System.map to make sure your level 1 code fits within 
> 1K.  Also in
> oneboot.S I commented out labels and used relative branches 
> to save symbol
> space and replaced ldr with mov wherever possible.  And with the 270
> optimizations in oneboot.S our system screams!
> 
> The full code is at http://code.architechnical.net/onenand, 
> including the
> 2.6.18 pxa27x OneNAND driver.  Please don't laugh at my lame 
> ancient web
> site.
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
