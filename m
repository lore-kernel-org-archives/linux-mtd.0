Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19f3XE-00055P-ID
	for <linux-mtd@lists.infradead.org>; Tue, 22 Jul 2003 21:14:56 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HIG00IUT084NN@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Tue, 22 Jul 2003 22:14:29 +0200 (MEST)
Date: Tue, 22 Jul 2003 23:11:21 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3F1D98F4.8060904@eink.com>
To: Holly Gates <hgates@eink.com>, linux-mtd@lists.infradead.org
Message-id: <200307222311.21913.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <3F1D98F4.8060904@eink.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Smartmedia block mapping
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 22 July 2003 22:05, Holly Gates wrote:
> Hello all, I'm hoping someone can give me some advice on a smartmedia
> issue. Here is the deal: I'm working on a display controller based on an
> FPGA, some lookup table data is stored on a smartmedia card. The FPGA
> just pulls data from the card sector by sector in incrementing order.
>
> The cards I am using are samsung 32MB, and I was kind of hoping to find
> some cards with no bad blocks in the area I care about, but we could
> write VHDL to skip bad blocks if need be.
>
> I've been writing the card using a linux laptop running redhat with a
> PQI USB smartmedia adapter which just worked when I plugged it in, by
> executing:
>
> sh> dd if=table.bin of=/dev/sda bs=512c count=64000
>
> When I read back the card using dd, all the data is in order. However
> the problem comes when I read the card with the FPGA. First I noticed
> that my binary file didn't show up until about sector 0x42, and also
> occasionally data would come out that was supposed to be written
> thousands of sectors away. Same thing happens if I do the
> writing/reading using a PCMCIA/smartmedia adapter.
>
> Having done all the work so far with just the data sheet, I started
> poking around the web and it seems like I am running into the
> logical->physical mapping inherent in most uses of smartmedia. However I
> don't want this mapping since it would be a major pain in the ass to
> build and maintain a RAM translation table in the FPGA part of the
> system. I'm still not sure exactly how the translation table is made and
> stored either; is it on the card somewhere? Maybe in those first 0x42
> sectors?
>
> Maybe I could see using the mapping table if it was on the card
> somewhere, but ideally I could just write the binary file to the sectors
> in true, physical, incrementing order. Anyone know of a utility I could
> use to do this?
>
> One thing I tried already was using the "raw" utility:
>
> sh> raw /dev/raw/raw1 /dev/sda
>
> and then using a C program to read out the sectors, however the raw
> utility must be plugging in to a level that is above the mapping since
> when I watch what sectors the computer requests from the card on a logic
> analyzer, it still just jumps around for no apparent reason.
>
> I suppose I could build a parallel port adapter and write some software
> or something, but that is annoying since I know the computer is capable
> of doing what I want if I could get at the right layer of the driver
> stack...

You cannot access the layer, as this is all faked stuff. The smartmedia 
adaptor has some firmware, which does all the sector translation. The first 
two sectors are reserved anyway for FAT.

The nand support in Linux gives you access to raw sectors. So build a adaptor 
for the parallel port and  write a small board driver, then you can do what 
you want. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
