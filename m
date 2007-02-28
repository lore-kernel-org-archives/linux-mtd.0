Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMKSH-0006Fc-Hb
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 03:46:36 -0500
Date: Wed, 28 Feb 2007 09:46:31 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: "doodiexx doodiexx" <doodiexx@gmail.com>
Subject: Re: NAND flash mounting problem
Message-ID: <20070228094631.2e8f7b45@dhcp-252-105.norway.atmel.com>
In-Reply-To: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
References: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 Feb 2007 09:52:21 +0200
"doodiexx doodiexx" <doodiexx@gmail.com> wrote:

> Hi,
> 
> We are using Atmel's AT32AP7000 processor and ST 512Mbit NAND Flash
> and having problems in creating a JFFS2 fs.

Interesting :-)

> The mtd system detects the flash and I think everything is fine with
> the kernel startup:
> 
> NAND device: Manufacturer ID: 0x20, Chip ID: 0x76 (ST Micro NAND 64MiB
> 3,3V 8-bit)
> Scanning device for bad blocks
> Bad eraseblock 2995 at 0x02ecc000
> Bad eraseblock 4078 at 0x03fb8000
> Creating 1 MTD partitions on "NAND 64MiB 3,3V 8-bit":
> 0x00000000-0x04000000 : "rootfs"
> 
> I try to flash_eraseall -j and it completes without any error, but
> when I try to mount it I get :
> # mount /dev/mtd1 /mnt/nand
> mount: mounting /dev/mtd1 on /mnt/nand failed
> 
> nanddump gives:
> 
> # ./nanddump -l 512 -p /dev/mtd1
> Block size 16384, page size 512, OOB size 16
> Dumping data starting at 0x00000000 and ending at 0x00000200...
> 0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> <skipping.., all values are ff >
> 0x000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   OOB Data: ff ff ff ff ff ff ff ff 19 85 20 03 00 00 00 08
> 
> The 1985 and 2003 parts seem to be wrong endian ??

What are the expected values?

> Any ideas to solve the problem ?

I suspect there may be something funny going on with the avr32 I/O
accessors, although I don't know the mtd nand code well enough to know
more specifically what the problem might be in this case...

Did you write the NAND setup code yourself? If so, could you send me a
patch so that I know how things are set up?

> The processor is big endian,
> kernel version 2.6.18

Did you apply the Atmel BSP patches or something else? AVR32 isn't
supported in plain 2.6.18.

Haavard
