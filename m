Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17dTZ3-00040x-00
	for <linux-mtd@lists.infradead.org>; Sat, 10 Aug 2002 11:33:45 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0M00G3NINEZE@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 10 Aug 2002 12:33:15 +0200 (MEST)
Date: Sat, 10 Aug 2002 12:33:08 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Hardware ECC in NAND flash driver
In-reply-to: <3D527739.5B19816C@sgi.com>
To: Steven Hein <ssh@sgi.com>
Cc: linux-mtd@lists.infradead.org
Message-id: <1028975588.9592.167.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <3D511B55.6ADABE4D@sgi.com>
 <1028726139.19447.255.camel@thomas.tec.linutronix.de>
 <3D527739.5B19816C@sgi.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Thu, 2002-08-08 at 15:50, Steven Hein wrote:
> Hi Thomas,
Hi Steven,
I put this back on the list, because it might be of public interest.

> I basically added 4 fields to the struct nand_chip:
>     eccsize:  size of ECC block  (512 in my case)
>     eccbytes: # bytes ECC per ECC block (3 in my case)
>     calculate_ecc:  pointer to ECC calculation (in my case,it reads HW ECC)
>     correct_data:  pointer to ECC checking/data fix function
> If these fields aren't set, by the hardware-specific driver, they
> all default to the software ECC functions and settings.
I'm not convinced yet, because I have to solve some compability issues.
See below.

> I don't have any experience with how any other Hardware ECC generators
> for NAND flash might work (including DiskOnChip), but the one in the
> S3C2410 is pretty simple.  Before reading/writing data, you write a bit
> to an internal register to reset the ECC generator.  Then, after
> reading/writing the 512 bytes of data, you read a register that contains
> the 3 byte ECC code (this must be read *before* reading/writing OOB data).
3 byte for 512 byte data reduces the recovery probabilty by factor 2.
I'm wondering, why Samsung did it this way. They support 256 byte page
NAND chips and don't care about the ECC for these chips. Also they are
member of the SmartMedia Consortium and the spec's there use definitly 3
byte ECC per 256 Byte, which means 6 Byte per 512 Byte. So you cannot
read/write SmartMediaSpec compatible Cards, if you wan't to use the
onchip ECC generator. 
But maybe they have decided that the ugly SmartMedia DOS-FAT filesystem
is not reliable and give a sh.. on compability :). This is likely the
case as they support booting from NAND  in a way which is definitly not
compatible with SmartMediaDosFAT.

But nevertheless it breaks and influences existing code. But that should
be possible to handle.

> So, I had to make a few changes due to this implementation:
>   1) In nand_read_ecc(), I separated the read of data from read of OOB data
>      and put the calculate_ecc() call between them.  (This means that ECC
>      is calculated/read for blocks that weren't written with ECC--we can't
>      check that until we've read the OOB data).
Should be no problem.

>   2) In nand_write_page(), in order to generate a correct hardware ECC
>      for partial page writes, you need to write the actual data stored
>      in the page (rather than pre-padding with 0xff).
I see your need, but this breaks the datasheet specs. You have to pad
already written data with 0xff or in case of Samsung NAND you can write
only the bytes you want program to the chip and the chip takes care of
0xff padding itself. As far as I understand the physical insides of
NAND, it might lead to erroneous behaviour, if you reprogram contents.  
In that case, which should not happen with JFFS2 or any other
filesystem, which takes care of NAND specific issues, we should skip ECC
for this page in case we are using a 512 byte only hardware ECC
generator.

>   3) For NAND controllers like mine with 512-byte ECC, using ECC with
>      256-byte page NAND chips isn't really practical  (my changes currently
>      don't handle that case very gracefully, but I'm not using chips with
>      256-byte pages).
In this case you could use the software ECC. Your HW driver can specify
this after chipdetection. 

> In general, I don't think the implementation is *too* bad; I think the part
> that needs cleaning up yet is the handling of different ECC block sizes.
> In the cases were there are two operations due to 256 byte ECC in a
> 512 byte page, I put a (mtd->eccsize < 512) check in with the current
> (mtd->oobblock == 512) checks.  Maybe you can think of a better way
> to handle this.
It's definitly not *too* bad. I'm just thinking about a clean way to
seperate the resulting 3byte ECC/ 512 Byte and the standard of 3Byte ECC
/ 256 Byte. 

More comments later today.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
