Received: from web41505.mail.yahoo.com ([66.218.93.88])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BMuy6-0004Bt-VC
	for linux-mtd@lists.infradead.org; Sun, 09 May 2004 21:32:15 +0100
Message-ID: <20040509203212.5193.qmail@web41505.mail.yahoo.com>
Date: Sun, 9 May 2004 13:32:12 -0700 (PDT)
From: Andre Sodermans <andreesje_werk@yahoo.com>
To: "Jonathan M. Schlueter" <jonschl@umd.umich.edu>
In-Reply-To: <Pine.GSO.4.58.0405091537500.27031@login1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: diskonchip2000 support in 2.4.22
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > hello all,
> > I can't access my diskonchip2000 partitions from
> > linux. I have linuxmz 2.4.18 installed on it and
> it
> > boots fine from diskonchip.
> >
> > The kernel I built for LFS5.0 is based on 2.4.22.
> > I compiled the kernel with:
> > CONFIG_MTD = m
> > CONFIG_MTD_CHAR = m
> > CONFIG_NFTL = m
> >
> > Running modprobe docprobe, I get:
> >
> > DiskOnChip Millennium found at address: 0xD000
> > no flash chips recognized
> >
> > It is actually a diskonchip2000.
> > There is no entry in /proc/mtd.
> 
> Which driver are you using?

the one from the unpatched 2.4.22 kernel. I actually
forgot to mention the following config flags that I
used on my most recent kernel:
CONFIG_MTD_DOC2000=m
CONFIG_MTD_DOCPROBE=m
CONFIG_MTD_DOCPROBE_ADDRESS=0
CONFIG_MTD_NAND_IDS=m

I then ran:
modprobe -a doc2000 nftl mtdchar
modprobe -a docprobe

I'm actually now building another kernel with the
latest mtd patch, just to be sure.

> 
> > After I installed the kernel I noticed that I was
> > missing the /dev/msys/fla* so I created those.
> Also
> > the /dev/nftl* were missing, so I downloaded the
> > latest mtd snapshot and ran the MAKEDEV script.
> 
> /dev/msys/fla* are the dev files from M-Sys's custom
> driver
> 
> /dev/nftla  are the dev files for the mtd subsystem
> (this list)
> 
> They are two seperate and different methods of
> accessing the DiskonChip
> 

Ok, I was being desperate, I meant to just use the one
from the kernel since the one from mtd is a lot
better.


> 
> > I tried to mount -t ext2 /dev/msys/fla1 /mnt/doc -
> > result:
> > mount: /dev/msys/fla1 is not a valid block device
> >
> > I tried to mount -t ext2 /dev/nftla
> > mount: /dev/nftla1: unknown device
> >
> >
> > Did I miss something?
> >
> 
> 
> 
> Jon Schlueter



	
		
__________________________________
Do you Yahoo!?
Win a $20,000 Career Makeover at Yahoo! HotJobs  
http://hotjobs.sweepstakes.yahoo.com/careermakeover 
