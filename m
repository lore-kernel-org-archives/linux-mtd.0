Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CyIsv-0000RM-Kh
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 19:05:43 -0500
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>,
	linux-mtd@lists.infradead.org
Date: Tue, 8 Feb 2005 13:12:26 +1300
References: <ctsr0r$94m$1@sea.gmane.org>
	<20050206220713.D99FE15504@desire.actrix.co.nz>
	<cu7934$irr$1@sea.gmane.org>
In-Reply-To: <cu7934$irr$1@sea.gmane.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20050208000532.543131604C@desire.actrix.co.nz>
Cc: 
Subject: Re: Writing frequently to NAND - wearing, caching?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 07 February 2005 21:33, Martin Egholm Nielsen wrote:
> Hi,
>
> >>I have an application which may need to write states frequently to my
> >>nand-fs in order to have these states in case of powerdown.
> >>But I'm a bit concerned about wearing the nand if I write to frequently.
> >>
> >>So, if I only need to write, say, 100 bytes every second, how often will
> >>this actually be flushed to the nand?
> >>Is there a maximum commit/flush frequency built in the driver? Or can
> >>this be configured?
> >
> > It depends on what fs you're using.
> > With YAFFS, and I believe JFFS2 too, there is no reason to worry about
> > flash "wearing out".  I have done accelerated lifetime tests on NAND
> > using YAFFS and in one test wrote 130GB to NAND without any data loss,
> > bad blocks happening etc.
>
> Now, that's a lot :-)
> I'm using JFFS2 - so hopefully you're right...

What I always do is to do some lifetime estimates for stuff that can wear 
out. For most handheld mobile stuff this means flash, batteries, backlights.

For instance, YAFFS was used in a  hand-held data logger/PDA-thing 
application. 
*Typical high usage for a full day: 5MB of writes. Double it 10MB
*Typical high usage per year: 100 days/year. Use 150 days.
*Typical product lifetime: 5 years. Use 10 years.

Double again for all garbage collection etc.

That works out to 30GB of writing. 

On a 128Mbyte NAND, that works out at an average of 240 writes for each part 
of flash. Even if we go multiply by a very large "skew factor" of 100  
(because we're not using explicite wear levelling) we still have only reached 
24,000 - only 24% of the 100,000 cycle lifetime of the flash.

I did the 130GB test because I wanted a big enough number (~50 typical  
lifetimes) to make the nay-sayers shut up forever.

>
> > The NAND writes whenever the file system tells it to, so again your
> > question is FS dependent, but all file systems that are NAND-friendly
> > should handle the load you mention with no problems.
>
> And that is JFFS2 - but since it's a journaling fs it must commit the
> journal, as well, every now and then...

YAFFS and JFFS2 are both what I would consider to be very flash friendly. 
Even FAT on a SmartMedia is not too bad.  FAT+SM corruyptions are generally 
the fault of general FAT crappiness.

SmartMedia cycles through the blocks in the free pool. On a device with, say, 
1024 blocks, only 1000, say, of these will be used. The other are either bad 
blocks or in the free pool. When SmartMedia writes a block it uses a block 
from the free pool, then releases the old block to the free pool. This 
implements a degree of "implcite" wear levelling (ie. this use of a free pool 
tends to cause wear levelling as a side effect).

Where you'd get problem would be using a file system like FAT without a 
logical to physical remapping layer. This would result in the 
blocks holding the FAT getting hammered hard. 

Wear levelling, with a reasonable file system or logical mapping layer, is 
just a non-issue for most products.

-- Charles
