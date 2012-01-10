Received: from webbox1416.server-home.net ([77.236.96.61])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RkXuz-0006RL-D1
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 09:22:59 +0000
From: Alexander Stein <alexander.stein@systec-electronic.com>
To: dedekind1@gmail.com
Subject: Re: delayed close on mtdblock
Date: Tue, 10 Jan 2012 10:22:46 +0100
Message-ID: <4352830.ZIZxnlTurK@ws-stein>
In-Reply-To: <1326185675.8847.16.camel@sauron.fi.intel.com>
References: <14259449.DIx1JTusJU@ws-stein>
 <1326185675.8847.16.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 10 January 2012 10:54:35 Artem Bityutskiy wrote:
> On Wed, 2012-01-04 at 15:18 +0100, Alexander Stein wrote:
> > Hello,
> > 
> > I observed an somewhat interesting situation regarding mtdblock. I have
> > a NOR- Flash with several mtd partitions. One holds the configuration
> > from the bootloader and another one contains UBI/UBIFS.
> > During bootup I attach UBI and mount UBIFS, no problems so far. To read
> > the bootloader coniguration I open the corresponding mtdblock with
> > O_RDONLY, do an lseek, read and close it afterwards, nothing special.
> > But I noticed the close() call take >1s which seems to far big, as
> > there is nothing to be written into this mtdblock device.
> > I digged into the kernel and get to mtdblock_release(). I can see that
> > write_cached_data does nothing as the cache is clean. But mbd->mtd->sync
> > (cfi_amdstd_sync in my case) takes a while because the chip state is
> > currently FL_ERASING. The retry loop is taken several times before
> > exiting the function. If I don't mount UBIFS there is no such delay.
> > I'm wondering if there is actually a need to sync the chip if the cache
> > is clean. Can someone explain this to me?
> 
> Most probably this is because NOR flash erase is very slow. You probably
> do writes to the UBIFS partition, which initiates many erase operations.
> When you close the mtdblock device - it syncs the flash chip which
> blocks until the pending erase operations initiated by UBIFS finish
> (because these are 2 partitions on the same chip).
> 
> I think the quick fix for you would be to avoid calling mtd->sync() in
> mtdblock if the device is R/O - makes no sense anyway.

I had somethng like this in mind, but was unsure about possible side effects.

> Care to submit a
> patch?

I would gladly submit a patch, but I don't know where to get the R/O status. 
There is no struct file in this function like in the mtdchar case as Joakim 
wrote.

Best regards,
Alexander
-- 
Dipl.-Inf. Alexander Stein

SYS TEC electronic GmbH
August-Bebel-Str. 29
D-07973 Greiz

Tel: +49-3661-6279-0, Fax: +49-3661-6279-99
eMail:    Alexander.Stein@systec-electronic.com
Internet: http://www.systec-electronic.com

Managing Director: Dipl.-Phys. Siegmar Schmidt
Commercial registry: Amtsgericht Jena, HRB 205563
