Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7BwG-0003GB-36
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 11:25:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <200403271210.30061.tglx@linutronix.de>
References: <406328A2.3060905@cray.com>
	 <200403270907.07298.tglx@linutronix.de>
	 <1080383077.17352.5.camel@imladris.demon.co.uk>
	 <200403271210.30061.tglx@linutronix.de>
Content-Type: text/plain
Message-Id: <1080386714.17352.52.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Sat, 27 Mar 2004 11:25:15 +0000
Content-Transfer-Encoding: 7bit
cc: manningc2@actrix.gen.nz
cc: linux-mtd@lists.infradead.org
Subject: Re: nand oob layout assumptions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-03-27 at 12:10 +0100, Thomas Gleixner wrote:
> What else would you need ? 

Nothing more, but it does live where it is in the hardware driver.

> I'm not happy to build in the bad block bitmap stuff as a general solution. 
> Next will be translation tables, bad block remapping and all kind of crap, 
> which is not neccecary to run a NAND FLASH aware filesystem. 

We don't need to build it in as a general solution -- the DiskOnChip
code will do it itself. All we need to do is keep the API sufficiently
versatile that the FS doesn't need to know about the peculiarities of
the DiskOnChip -- it just gets told which bytes of the OOB area it can
use, and does so.

The DiskOnChip uses the first 6 bytes of the OOB area for hardware ECC,
and bad block information is elsewhere on the medium.

> The NAND specs have defined to have the bad block markers in the OOB area, 
> which is quite clever, as it does not restrict the usage of any byte in the 
> main area.

No, the NAND specs have defined the bad block markers to be in the OOB
area when the device is shipped. What you do with it after that is up to
you. And in the case of the DiskOnChip that means the bad block
information is moved. We _really_ want to honour that and keep it within
the hardware driver. I don't want any possibility of erasing bad blocks,
and I'm not overly happy with thinking non-bad blocks are bad just
because the device has already been used with NFTL and has ECC data in
byte 5.

> Nand.c needs bad block handling in the sense of preventing erase of bad 
> blocks. Maybe the prevention of reading / writing bad blocks too. And the 
> possibility to have a bad block detection function, which covers specific 
> cases like DOC.
> 
> But this does not change the interface. 

Except that in the file system we need to call the device's
->is_bad_block() function rather than poking at the OOB area.
 
> ECC positions are a totaly different thing. If we want to have a fixed scheme 
> for storing ECC bytes, which is not neccecary even with hardware ECC, as the 
> hardware ECC only does the ECC calculation and no placing of ECC data into 
> OOB, 

On the DiskOnChip I think it has to be the first six bytes of the OOB.
You read <data + ECC> and check a _bit_ to see if there was an error.
You don't read the ECC syndrome and compare with what you separately
read from the medium.

> then we have to use _ONE_ final ECC placement scheme for all filesystems 
> and therefor we can only use the SmartmediaCard layout, as doing not so would 
> prevent the development of a SmartMedia FAT fs driver. This would break YAFFS 
> support complete. JFFS2 uses the SmartMedia layout anyway.

We don't need a fixed ECC scheme. But we do need to tell the file system
what we support. Those should include the SmartMedia software ECC, and
may include the DiskOnChip hardware ECC too. 

JFFS2 uses the DiskOnChip ECC on DiskOnChip already, doesn't it?

> > Other than noticing them and avoiding them, there really isn't much
> > handling to be done.
> 
> True, but it still is a job of the filesystem and therefor it must have access 
> to this information.

Yes. It _absolutely_ needs access to the information 'is this a bad
block?'. What it doesn't need is stuff like "what byte in the OOB area
would tell us if this was a bad block".

-- 
dwmw2
