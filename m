Subject: Re: re-formatting a Disk-on-Chip without going to DOS
From: David Woodhouse <dwmw2@infradead.org>
To: Christopher E Piggott <cepasp@rit.edu>
In-Reply-To: <06CCEA2EB1B80A4A937ED59005FA855101199C07@svits26.main.ad.rit.edu>
References: <06CCEA2EB1B80A4A937ED59005FA855101199C07@svits26.main.ad.rit.edu>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Feb 2007 10:32:31 +0000
Message-Id: <1170844351.29759.1121.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-02-06 at 15:49 -0500, Christopher E Piggott wrote:
> I did something with a bit too much haste, and I erased my DOC2000-D08
> chip.  
>  
> Before I did this, I attempted to save something that I could use later
> as an backup:
>  
>     dd if=/dev/mtd0 of=backup.img bs=8k
>  
> The file I got makes sense, at least in that it has the ANAND in it at
> offsets 0xC000 and 0xE000... which makes me think I saved my bad block
> map.
>  
> My trick now is how to put it back.  Linux sees the chip, but not as a
> DoC:
>  
>     Using configured DiskOnChip probe address 0xd0000
>     DiskOnChip found at 0xd0000
>     NAND device: Manufacturer ID: 0x98, Chip ID: 0xe6 (Toshiba NAND 8MiB
> 3,3V 8-bit)
>     ECC error scanning DOC at 0xc000
>     ECC error scanning DOC at 0xe000
>     DiskOnChip ANAND Media Header not found.
> 
> This means that there is no /dev/mtd0 to put it back.
>  
> Is it even possible to do this without going back to DOS?  That is a
> problem for me as the systems I have with DoC sockets don't have the
> ability to boot off of a FreeDOS floppy or CD-ROM.  It MAY be possible
> to do something using an external hard drive, putting freedos on that,
> and going on from there ... but life would be much simpler for me if
> there were a way to do this entirely from linux, considering that I
> saved the image before I started.
>  
> Any ideas or tricks?

Hack drivers/mtd/nand/diskonchip.c to register the raw device even if it
doesn't find the Media Header. At about line 1349, in the function
nftl_scan_bbt() where the call to nftl_partscan() fails, make it jump to
the add_mtd_device(mtd); at the end instead of bailing out. You may also
want to set nand->options = NAND_SKIP_BBTSCAN at about line 1666 instead
of its current value.

Then write the original table back using nandwrite.

We really ought to do something about how we expose devices to userspace
-- present a 'raw device' as well as the one mapped with the BBT and
partitions. For the CAFÉ driver I've implemented a 'skipbbt' module
option, but it's something we need to fix in generic code.

-- 
dwmw2
