Received: from smtp6.mindspring.com ([207.69.200.110])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19knKn-0002KL-A8
	for <linux-mtd@lists.infradead.org>; Thu, 07 Aug 2003 17:09:49 +0100
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Thu, 7 Aug 2003 12:09:32 -0400
Message-ID: <IIEEICKJLNEPBBDJICNGOEHADMAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
In-Reply-To: <1060252989.25209.39.camel@passion.cambridge.redhat.com>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: DOC filesystem questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

> > Also I am concerned from what I have read in the archives about
> > the bad block table.  From what I see in the archives and in
> > Karim Yaghmour's book, I needed to save this off.  Unfortunately
> > however I cannot run DOS or its utilities on this target board,
> > so I don't think that there is any way to do this.
> 
> You can read from /dev/mtd0 after first loading the DiskOnChip driver.
> It's in there somewhere (see the NFTL and nftl_format code for more
> details of precisely where). In fact, you could probably hack nftldump
> to dump it, quite easily. 

It looks like nftldump sees the bad unit table as being the 7680 
bytes starting at byte offset 512 into the device.  So this would
certainly be possible.  After looking more closely at nftl_format
I don't know if it is absolutely necessary to save it though:

nftl_format actually creates a bad unit table at offset 512
beyond the offset that the user provides on the command line.  The
size of the bad unit table it creates is based on the actual number
of erase units in the device, so I suppose it will not always be
7680.  It looks for blocks marked bad in their oob data to create
this table.  It also (by default) will do read/write/erase checking
on each block not already marked bad in its oob data, and any
failures are added to the bad unit table as well.

So it seems the news isn't that bad.  If we always leave the oob
data alone when the oob is marked bad for a block at the factory,
then nftl_format will include it in the BadUnitTable it creates.
Then preserving the factory-set bad block table would only be
critical if it marks blocks bad that are not marked bad in their
oob data.

Is this correct?  It appears that nftl_format is already doing
a good job of preserving bad block data, at least that which comes
from the oob data and r/w/e testing.

> > I use the following commands:
> > 
> >   nftl_format /dev/mtd0
> >   fdisk /dev/nftla
> 
> Not without 'insmod nftl' or 'reboot -f' between them, I hope.

You are correct.  I missed entering that line as I transcribed
my notes.  There is an 'insmod nftl' between those 2 lines in
the command sequence that I used.

> > 3. What I would really prefer to use is JFFS2 on this DOC.
> >    I have seen messages from David that this may now be 
> >    possible.
> 
> It's becoming possible. Give me a few weeks.

That is great news!

Thanks,
Chuck
