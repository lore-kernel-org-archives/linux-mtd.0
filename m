Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B78ti-0002HM-Ne
	for linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 08:10:30 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HV800JX46PGM4@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sat, 27 Mar 2004 09:10:29 +0100 (MET)
Date: Sat, 27 Mar 2004 09:07:07 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20040327073147.03AF7179A8@desire.actrix.co.nz>
To: manningc2@actrix.gen.nz, linux-mtd@lists.infradead.org
Message-id: <200403270907.07298.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <406328A2.3060905@cray.com>
	<200403252058.55476.tglx@linutronix.de>
	<20040327073147.03AF7179A8@desire.actrix.co.nz>
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

On Saturday 27 March 2004 08:40, Charles Manning wrote:
> >
> > We should check the possibility to use the 16 bit buswith with the same
> > driver. The command interface is still 8 bits, only the data interface is
> > 16 bit. It should be possible to combine those in one go.
>
> I think it is time we re-think the whole mtd interface for NAND. There are
> a bunch of new NAND parts out there that bring a whole new bunch of issues.
>
> For instance, the bad block handling is different in different NAND parts.
> It is wrong, IMHO, to be handling bad-block logic in the file system.
> Instead, the bad block handling should be done in mtd so that each
> different chip can have its own methods and the file system can be kept
> "clean".

I have already considered this. 
But the fs must be aware of the bad block marker position in the OOB area, as 
it can not use this byte for storing fs dependend data. The OOB usage is 
given by the fs layer.

> This is, BTW, the approach I have taken for YAFFS2. YAFFS2 has no ECC calcs
> or bad block logic in the file system "guts". Instead the mtd glue layer is
> currently tasked with this job, though in time I hope the actiual mtd ends
> up with the job.

Not sure. The generic nand driver provides mechanisms to tell you where the 
bad block marker is located and a basic protection against the erasing of bad 
blocks. All other bad block handling tasks should be done in the fs layer.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
