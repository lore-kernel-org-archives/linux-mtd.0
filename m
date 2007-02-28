Received: from ug-out-1314.google.com ([66.249.92.175])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMQYX-000275-A8
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 10:17:28 -0500
Received: by ug-out-1314.google.com with SMTP id m2so134897uge
	for <linux-mtd@lists.infradead.org>;
	Wed, 28 Feb 2007 07:17:23 -0800 (PST)
Message-ID: <87f18bad0702280717k6d50b712j9f166eb29f2ca734@mail.gmail.com>
Date: Wed, 28 Feb 2007 17:17:18 +0200
From: "J. Doo" <doodiexx@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: NAND flash mounting problem
In-Reply-To: <20070228094631.2e8f7b45@dhcp-252-105.norway.atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
	<20070228094631.2e8f7b45@dhcp-252-105.norway.atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > # ./nanddump -l 512 -p /dev/mtd1
> > Block size 16384, page size 512, OOB size 16
> > Dumping data starting at 0x00000000 and ending at 0x00000200...
> > 0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > <skipping.., all values are ff >
> > 0x000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> >   OOB Data: ff ff ff ff ff ff ff ff 19 85 20 03 00 00 00 08
> >
> > The 1985 and 2003 parts seem to be wrong endian ??
>
> What are the expected values?

According to the second table in
http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_bootloader
It should be 85 19 03 20 ...

> I suspect there may be something funny going on with the avr32 I/O
> accessors, although I don't know the mtd nand code well enough to know
> more specifically what the problem might be in this case...

I don't think it's because of avr32 i/o, because I have added some
printf's in flash_eraseall to see the buffer to be written to flash
and it's the same, i.e. wrong order.

So I just wanted to have people's opinion before digging the source code.

>
> Did you write the NAND setup code yourself? If so, could you send me a
> patch so that I know how things are set up?

I ported it based on the nand code for at91, it's very basic, just
handles the ALE and CLE lines and chip select...

I'll try to send you a patch later today.

>
> > The processor is big endian,
> > kernel version 2.6.18
>
> Did you apply the Atmel BSP patches or something else? AVR32 isn't
> supported in plain 2.6.18.

Using Atmel's BSP patches.

BR,
J.Doo
