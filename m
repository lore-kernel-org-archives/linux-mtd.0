Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMRKO-00031n-B5
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 11:06:55 -0500
Date: Wed, 28 Feb 2007 17:06:48 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: "J. Doo" <doodiexx@gmail.com>
Subject: Re: NAND flash mounting problem
Message-ID: <20070228170648.34bd4118@dhcp-252-105.norway.atmel.com>
In-Reply-To: <87f18bad0702280717k6d50b712j9f166eb29f2ca734@mail.gmail.com>
References: <87f18bad0702272352v44058e20x17390c10b9373930@mail.gmail.com>
	<20070228094631.2e8f7b45@dhcp-252-105.norway.atmel.com>
	<87f18bad0702280717k6d50b712j9f166eb29f2ca734@mail.gmail.com>
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

On Wed, 28 Feb 2007 17:17:18 +0200
"J. Doo" <doodiexx@gmail.com> wrote:

> > > # ./nanddump -l 512 -p /dev/mtd1
> > > Block size 16384, page size 512, OOB size 16
> > > Dumping data starting at 0x00000000 and ending at 0x00000200...
> > > 0x00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > > <skipping.., all values are ff >
> > > 0x000001f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > >   OOB Data: ff ff ff ff ff ff ff ff 19 85 20 03 00 00 00 08
> > >
> > > The 1985 and 2003 parts seem to be wrong endian ??
> >
> > What are the expected values?
> 
> According to the second table in
> http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_bootloader
> It should be 85 19 03 20 ...

I had a look inside flash_eraseall, and it seems like it converts
the 16-bit magic values to target_endian, which is by default the CPU's
native endian. So 0x1985 becomes 0x19, 0x85 and 0x2003 becomes 0x20,
0x03 on a big endian CPU. The values you read are therefore correct as
far as I can tell, but of course, I could be missing something...

> > I suspect there may be something funny going on with the avr32 I/O
> > accessors, although I don't know the mtd nand code well enough to know
> > more specifically what the problem might be in this case...
> 
> I don't think it's because of avr32 i/o, because I have added some
> printf's in flash_eraseall to see the buffer to be written to flash
> and it's the same, i.e. wrong order.

Ok, the problems I suspect are related to some incorrect mangling of
the least significant address bits, but those aren't supposed to be
wired up to the NAND chip anyway. So I guess the I/O macros are fine.

> > Did you write the NAND setup code yourself? If so, could you send me a
> > patch so that I know how things are set up?
> 
> I ported it based on the nand code for at91, it's very basic, just
> handles the ALE and CLE lines and chip select...

Yeah, it should be fairly straightforward.

> I'll try to send you a patch later today.

Great. I'll have a look at it tomorrow to see if there are any obvious
problems. Please send me your .config too while you're at it.

It's a bit strange that you don't get any error messages from the
kernel before the mount fails though. Enabling MTD debugging might help
of course. Btw, did you check dmesg? If the loglevel is set too low,
you might not see the error messages on the console.

Haavard
