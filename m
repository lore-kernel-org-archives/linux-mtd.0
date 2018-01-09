Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYptz-0000z1-3O
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 09:09:01 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23993599AbeAIJIqZXxfT (ORCPT
 <rfc822;linux-mtd@lists.infradead.org>);
 Tue, 9 Jan 2018 10:08:46 +0100
Date: Tue, 9 Jan 2018 10:08:45 +0100
Sender: Ladislav Michl <ladis@linux-mips.org>
From: Ladislav Michl <ladis@linux-mips.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH] mtd: nand: samsung: Disable subpage writes on E-die NAND
Message-ID: <20180109090845.GA22600@lenoch>
References: <20180108234837.GA15913@lenoch>
 <20180109094621.23a5e368@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109094621.23a5e368@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 09, 2018 at 09:46:21AM +0100, Boris Brezillon wrote:
> On Tue, 9 Jan 2018 00:48:37 +0100
> Ladislav Michl <ladis@linux-mips.org> wrote:
> 
> > Samsung E-die SLC NAND manufactured using 21nm process supports only
> 
> I would add the chip name here (K9F1G08U0E).

Ok.

> > 1 partial program cycle, so disable subpage writes for it.
> 
> Which means it does not support partial page programming, so how about
> rewording it like that:
> 
> Samsung E-die SLC NAND manufactured using 21nm process (K9F1G08U0E)
> does not support partial page programming, so disable subpage writes
> for it.

Yes, will post v2 eventually, but see bellow.

> > Manufacturing process is stored in lowest two bits of 5th ID byte.
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > ---
> >  Note: Patch generated and tested against next-20180108 on at91sam9g20
> >        board with K9F1G08U0E.
> 
> Just out of curiosity, what are the symptoms when you don't have this
> flag set?

Device is identified as:
nand: device found, Manufacturer ID: 0xec, Chip ID: 0xf1
nand: Samsung NAND 128MiB 3,3V 8-bit
nand: 128 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64

Short test:
# flash_erase /dev/mtd4 0 0
Erasing 128 Kibyte @ 7f60000 -- 99 % complete flash_erase: Skipping bad block at 07f80000
flash_erase: Skipping bad block at 07fa0000
flash_erase: Skipping bad block at 07fc0000
flash_erase: Skipping bad block at 07fe0000
Erasing 128 Kibyte @ 7fe0000 -- 100 % complete 
# ubiformat /dev/mtd4
ubiformat: mtd4 (nand), size 134217728 bytes (128.0 MiB), 1024 eraseblocks of 131072 bytes (128.0 KiB), min. I/O size 2048 bytes
libscan: scanning eraseblock 1023 -- 100 % complete  
ubiformat: 1020 eraseblocks are supposedly empty
ubiformat: 4 bad eraseblocks found, numbers: 1020, 1021, 1022, 1023
ubiformat: formatting eraseblock 1023 -- 100 % complete  
# ubiattach -m 4
ubi0: default fastmap pool size: 50
ubi0: default fastmap WL pool size: 25
ubi0: attaching mtd4
ubi0: scanning is finished
ubi0: attached mtd4 (name "atmel_nand", size 128 MiB)
ubi0: PEB size: 131072 bytes (128 KiB), LEB size: 126976 bytes
ubi0: min./max. I/O unit sizes: 2048/2048, sub-page size 2048
ubi0: VID header offset: 2048 (aligned 2048), data offset: 4096
ubi0: good PEBs: 1020, bad PEBs: 4, corrupted PEBs: 0
ubi0: user volume: 0, internal volumes: 1, max. volumes count: 128
ubi0: max/mean erase counter: 0/0, WL threshold: 4096, image sequence number: 1387212117
ubi0: available PEBs: 998, total reserved PEBs: 22, PEBs reserved for bad PEB handling: 16
ubi0: background thread "ubi_bgt0d" started, PID 716
UBI device number 0, total 1020 LEBs (129515520 bytes, 123.5 MiB), available 998 LEBs (126722048 bytes, 120.9 MiB), LEB size 126976 bytes (124.0 KiB)
# ubimkvol /dev/ubi0 -s 4MiB -N kernel -t static
Volume ID 0, size 34 LEBs (4317184 bytes, 4.1 MiB), LEB size 126976 bytes (124.0 KiB), static, name "kernel", alignment 1
# ubiupdatevol /dev/ubi0_0 linuximage 
__nand_correct_data: uncorrectable ECC error
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 309:512, read only 64 bytes, retry
__nand_correct_data: uncorrectable ECC error
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 309:512, read only 64 bytes, retry
__nand_correct_data: uncorrectable ECC error
ubi0 warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 309:512, read only 64 bytes, retry
__nand_correct_data: uncorrectable ECC error
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 309:512, read 64 bytes
CPU: 0 PID: 720 Comm: ubiupdatevol Not tainted 4.14.4 #7
Hardware name: Atmel AT91SAM9
[<c010796c>] (unwind_backtrace) from [<c01053e0>] (show_stack+0x10/0x14)
[<c01053e0>] (show_stack) from [<c0337fac>] (ubi_io_read+0x1d8/0x2ac)
[<c0337fac>] (ubi_io_read) from [<c03384c4>] (ubi_io_read_vid_hdr+0x70/0x214)
[<c03384c4>] (ubi_io_read_vid_hdr) from [<c0335b44>] (ubi_eba_read_leb+0x154/0x414)
[<c0335b44>] (ubi_eba_read_leb) from [<c033e5b8>] (ubi_check_volume+0x7c/0xb8)
[<c033e5b8>] (ubi_check_volume) from [<c0334180>] (vol_cdev_write+0x254/0x364)
[<c0334180>] (vol_cdev_write) from [<c01a617c>] (__vfs_write+0x20/0x128)
[<c01a617c>] (__vfs_write) from [<c01a6420>] (vfs_write+0xb4/0x13c)
[<c01a6420>] (vfs_write) from [<c01a65b8>] (SyS_write+0x40/0x74)
[<c01a65b8>] (SyS_write) from [<c0102480>] (ret_fast_syscall+0x0/0x44)
ubi0 warning: ubi_eba_read_leb: corrupted VID header at PEB 309, LEB 0:0
ubi0 warning: vol_cdev_write: volume 0 on UBI device 0 is corrupted

There's another patchset to deal with this issue:
http://thread.gmane.org/gmane.linux.drivers.mtd/54167

And it brings a problem to us as those patches are mutually exclusive.
Once no subpage write patch is applied UBI's VID header offset changes to 2048
from 512, so on flash filesystem is no longer readable if we wish to give
optimize subpage writes a chance later.

I do want to introduce any hard to overcome incompatibility, so isn't Pekon's
patch worth considering again?

> >  drivers/mtd/nand/nand_samsung.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/nand_samsung.c b/drivers/mtd/nand/nand_samsung.c
> > index f6b0a63a068c..9400b4a84243 100644
> > --- a/drivers/mtd/nand/nand_samsung.c
> > +++ b/drivers/mtd/nand/nand_samsung.c
> > @@ -92,10 +92,17 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
> >  	} else {
> >  		nand_decode_ext_id(chip);
> >  
> > -		/* Datasheet values for SLC Samsung K9F4G08U0D-S[I|C]B0(T00) */
> > -		if (nand_is_slc(chip) && chip->id.data[1] == 0xDC) {
> > -			chip->ecc_step_ds = 512;
> > -			chip->ecc_strength_ds = 1;
> > +		if (nand_is_slc(chip)) {
> > +			/* K9F4G08U0D-S[I|C]B0(T00) */
> > +			if (chip->id.data[1] == 0xDC) {
> > +				chip->ecc_step_ds = 512;
> > +				chip->ecc_strength_ds = 1;
> > +			}
> > +
> > +			/* 21nm chips do not support partial page write */
> > +			if (chip->id.len > 4 &&
> > +			    (chip->id.data[4] & GENMASK(1,0)) == 0x1)
> 
> NAND vendors tend to change their ID decoding scheme a lot, so maybe we
> should be more restrictive here: replace "chip->id.len > 4" by
> "chip->id.len == 5" and restrict it to chip->id.data[1] == 0xF1.

Well, K9F1G08U0E returns chip->id.len = 6, but adding chip->id.data[1]
seems to be a good idea.

> > +				chip->options |= NAND_NO_SUBPAGE_WRITE;
> >  		}
> >  	}
> >  }

Best regards,
	ladis
