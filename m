Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B7Ufq-0000Ns-93
	for linux-mtd@lists.infradead.org; Sun, 28 Mar 2004 08:25:38 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: tglx@linutronix.de, linux-mtd@lists.infradead.org
Date: Sun, 28 Mar 2004 19:34:43 +1200
References: <406328A2.3060905@cray.com>
	<20040327073147.03AF7179A8@desire.actrix.co.nz>
	<200403270907.07298.tglx@linutronix.de>
In-Reply-To: <200403270907.07298.tglx@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040328072532.3FCCA168A8@desire.actrix.co.nz>
Subject: Re: nand oob layout assumptions
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 27 March 2004 20:07, Thomas Gleixner wrote:
> On Saturday 27 March 2004 08:40, Charles Manning wrote:
> > > We should check the possibility to use the 16 bit buswith with the same
> > > driver. The command interface is still 8 bits, only the data interface
> > > is 16 bit. It should be possible to combine those in one go.
> >
> > I think it is time we re-think the whole mtd interface for NAND. There
> > are a bunch of new NAND parts out there that bring a whole new bunch of
> > issues.
> >
> > For instance, the bad block handling is different in different NAND
> > parts. It is wrong, IMHO, to be handling bad-block logic in the file
> > system. Instead, the bad block handling should be done in mtd so that
> > each different chip can have its own methods and the file system can be
> > kept "clean".
>
> I have already considered this.
> But the fs must be aware of the bad block marker position in the OOB area,
> as it can not use this byte for storing fs dependend data. The OOB usage is
> given by the fs layer.

No. Part of the deal is that the OOB area should not be shown in "raw" form 
to the fs. There should be no l physical placement knowledge in the fs, only 
abstract.


For example if the OOB area is used as follows (standard SmartMedia layout as 
used by YAFFS1):
    __u8  spare0[4];
    __u8  pageStatus; 
    __u8  blockStatus; // bad block marker
   __u8  spare1[2];
    __u8  ecc1[3];
    __u8  spare2[2];;
    __u8  ecc2[3];

This should be shown to the fs as:
  __u8 spare[8];
  ECCResult (OK, fixed, failed)
  BlockOK (OK, bad)

or some such.


>
> > This is, BTW, the approach I have taken for YAFFS2. YAFFS2 has no ECC
> > calcs or bad block logic in the file system "guts". Instead the mtd glue
> > layer is currently tasked with this job, though in time I hope the
> > actiual mtd ends up with the job.
>
> Not sure. The generic nand driver provides mechanisms to tell you where the
> bad block marker is located and a basic protection against the erasing of
> bad blocks. All other bad block handling tasks should be done in the fs
> layer.

But...One of the issues is that the bad block marking strategy of the 
different NAND devices does not necessarily just depend on a fixed-location 
bad block marker.  Some (particularly the 2k page devices) say that any pages 
that are not completely 0xFF when shipped are bad. Therefore one needs to 
track this badness as well as future badness.

The fs should not know about bad block marking positions. The fs should be 
saying to the mtd "mark this block bad" or asking "is this block bad". How 
the mtd chooses to record the fact that the block is bad is not the fs's 
concern.

For example, in a recent implementation of a 2K page NAND system I use block 
0 to store a list of "manufacturing bad blocks". If the array is not found at 
boot, then the driver assumes that this is the first boot for the device and 
builds such a list. Subsequent failures are marked by stomping 0s on the OOB. 
The next time the driver boots, the NAND "badness" is scanned into an array 
that is held in RAM to remember which blocks are bad.

IMHO...

-- Charles
