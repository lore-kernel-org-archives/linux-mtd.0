Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7BlB-00034b-9D
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 11:13:53 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HV800J2LF73M4@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 12:13:52 +0100 (MET)
Date: Sat, 27 Mar 2004 12:10:30 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <1080383077.17352.5.camel@imladris.demon.co.uk>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <200403271210.30061.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-15
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406328A2.3060905@cray.com>
	<200403270907.07298.tglx@linutronix.de>
	<1080383077.17352.5.camel@imladris.demon.co.uk>
cc: manningc2@actrix.gen.nz
cc: linux-mtd@lists.infradead.org
Subject: Re: nand oob layout assumptions
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 27 March 2004 11:24, David Woodhouse wrote:
> On Sat, 2004-03-27 at 09:07 +0100, Thomas Gleixner wrote:
> > > For instance, the bad block handling is different in different NAND
> > > parts.
>
> And in some cases in the _same_ NAND parts in different environments.
> Consider the DiskOnChip, where on first format we look at the 'bad
> block' markers in the OOB areas and build a separate bad block bitmap in
> a dedicated sector. Then we erase the good blocks and use _every_ byte
> in the OOB area. That's why I added the ->block_is_bad() callback from
> the NAND code to the board-specific code, but I'm not sure that's
> sufficient.

What else would you need ? 

I'm not happy to build in the bad block bitmap stuff as a general solution. 
Next will be translation tables, bad block remapping and all kind of crap, 
which is not neccecary to run a NAND FLASH aware filesystem. 

> > > It is wrong, IMHO, to be handling bad-block logic in the file system.
> > > Instead, the bad block handling should be done in mtd so that each
> > > different chip can have its own methods and the file system can be kept
> > > "clean".
> >
> > I have already considered this.
> > But the fs must be aware of the bad block marker position in the OOB
> > area, as it can not use this byte for storing fs dependend data. The OOB
> > usage is given by the fs layer.
>
> It might not be in the OOB area. The fs does need to be told which bytes
> of the OOB area are reserved for hardware ECC and/or bad block markers,
> but the hardware driver should still be responsible for bad block
> handling.

The NAND specs have defined to have the bad block markers in the OOB area, 
which is quite clever, as it does not restrict the usage of any byte in the 
main area.

Nand.c needs bad block handling in the sense of preventing erase of bad 
blocks. Maybe the prevention of reading / writing bad blocks too. And the 
possibility to have a bad block detection function, which covers specific 
cases like DOC.

But this does not change the interface. 

ECC positions are a totaly different thing. If we want to have a fixed scheme 
for storing ECC bytes, which is not neccecary even with hardware ECC, as the 
hardware ECC only does the ECC calculation and no placing of ECC data into 
OOB, then we have to use _ONE_ final ECC placement scheme for all filesystems 
and therefor we can only use the SmartmediaCard layout, as doing not so would 
prevent the development of a SmartMedia FAT fs driver. This would break YAFFS 
support complete. JFFS2 uses the SmartMedia layout anyway.

> > Not sure. The generic nand driver provides mechanisms to tell you where
> > the bad block marker is located and a basic protection against the
> > erasing of bad blocks. All other bad block handling tasks should be done
> > in the fs layer.
>
> Other than noticing them and avoiding them, there really isn't much
> handling to be done.

True, but it still is a job of the filesystem and therefor it must have access 
to this information.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
