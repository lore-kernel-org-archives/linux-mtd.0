Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19foV8-0000xV-Rb
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jul 2003 23:23:55 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Holly Gates <hgates@eink.com>
Date: Fri, 25 Jul 2003 10:27:37 +1200
References: <3F1D98F4.8060904@eink.com>
	<1058905076.32360.45.camel@lapdancer.baythorne.internal>
	<3F1D9FDC.8070403@eink.com>
In-Reply-To: <3F1D9FDC.8070403@eink.com>
MIME-Version: 1.0
Message-Id: <20030724222352.16C301620F@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Smartmedia block mapping
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 23 July 2003 08:34, Holly Gates wrote:
> David Woodhouse wrote:
> >On Tue, 2003-07-22 at 16:05, Holly Gates wrote:
> >>Maybe I could see using the mapping table if it was on the card
> >>somewhere,
> >
> >It is. It's in the 'out of band' area of the data blocks I believe --
> >see the SmartMedia specs for details.
>
> Right, I sort of got a bit of that by reading docs at samsung's website.
> It seems like the logical block number is stored in the out of band area
> of the physical block. But it seems to me that if this was the only
> place it was stored, then when you plug in the card, the card reader
> would have to read the out of band area for all the blocks on the card
> and make a table in RAM. At least on my card reader, it is only a little
> ASIC on the board. I would be surprised to find a few hundred K of RAM
> on that ASIC, which is what you might want for a table on the larger cards.

SmartMedia does require the logical to physical mapping to be held in RAM 
(well for any acceptable performance anyway). This is not much 2 bytes of RAM 
per block of 16kB ie. ony about 32kB of RAM data for a 256MB card (isn't that 
the biggest?). 

As others have noted, if the device is using the USB mass storage driver then 
it is doing all this internally and you can't get at the low levels.

>
> By the way, any idea where to get the SM spec? I can't seem to find it
> anywhere that I don't need to sign and NDA or pay hundreds of dollars
> for it.

You can get it from the samsung flash www.
>
> >> but ideally I could just write the binary file to the sectors
> >>in true, physical, incrementing order. Anyone know of a utility I could
> >>use to do this?
> >
> >You need special hardware which gives you access to the raw flash
> >without doing the translation _for_ you. Most 'card readers' will do it
> >for you and hence you don't get this option.
>
> Hmm. OK. Thats too bad.
>
> >>I suppose I could build a parallel port adapter and write some software
> >>or something, but that is annoying since I know the computer is capable
> >>of doing what I want if I could get at the right layer of the driver
> >>stack...
> >
> >No, it's not. Your USB card reader doesn't let you have access to the
> >raw flash; it has the translation built-in.
> >
> >Either implement the full SMTL in your FPGA, or make sure you use
> >hardware which accesses the flash directly, when writing to the device.
>
> Dang! Oh well, thanks for the advice. I'll get out the soldering iron I
> guess...

You can get NAND eval boards from Samsung etc that will give you low level 
access. 

-- CHarles
