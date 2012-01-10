Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkY2P-0007r1-VU
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 09:30:39 +0000
In-Reply-To: <4352830.ZIZxnlTurK@ws-stein>
References: <14259449.DIx1JTusJU@ws-stein>
 <1326185675.8847.16.camel@sauron.fi.intel.com> <4352830.ZIZxnlTurK@ws-stein>
Subject: Re: delayed close on mtdblock
To: Alexander Stein <alexander.stein@systec-electronic.com>
Message-ID: <OF701A2FD1.3F59A71C-ONC1257981.0033F75E-C1257981.00343AEE@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 10 Jan 2012 10:30:29 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> On Tuesday 10 January 2012 10:54:35 Artem Bityutskiy wrote:
> > On Wed, 2012-01-04 at 15:18 +0100, Alexander Stein wrote:
> > > Hello,
> > >
> > > I observed an somewhat interesting situation regarding mtdblock. I have
> > > a NOR- Flash with several mtd partitions. One holds the configuration
> > > from the bootloader and another one contains UBI/UBIFS.
> > > During bootup I attach UBI and mount UBIFS, no problems so far. To read
> > > the bootloader coniguration I open the corresponding mtdblock with
> > > O_RDONLY, do an lseek, read and close it afterwards, nothing special.
> > > But I noticed the close() call take >1s which seems to far big, as
> > > there is nothing to be written into this mtdblock device.
> > > I digged into the kernel and get to mtdblock_release(). I can see that
> > > write_cached_data does nothing as the cache is clean. But mbd->mtd->sync
> > > (cfi_amdstd_sync in my case) takes a while because the chip state is
> > > currently FL_ERASING. The retry loop is taken several times before
> > > exiting the function. If I don't mount UBIFS there is no such delay.
> > > I'm wondering if there is actually a need to sync the chip if the cache
> > > is clean. Can someone explain this to me?
> >
> > Most probably this is because NOR flash erase is very slow. You probably
> > do writes to the UBIFS partition, which initiates many erase operations.
> > When you close the mtdblock device - it syncs the flash chip which
> > blocks until the pending erase operations initiated by UBIFS finish
> > (because these are 2 partitions on the same chip).
> >
> > I think the quick fix for you would be to avoid calling mtd->sync() in
> > mtdblock if the device is R/O - makes no sense anyway.
>
> I had somethng like this in mind, but was unsure about possible side effects.
>
> > Care to submit a
> > patch?
>
> I would gladly submit a patch, but I don't know where to get the R/O status.
> There is no struct file in this function like in the mtdchar case as Joakim
> wrote.

hmm, I GUESSING you have to add file mode to struct mtd_blktrans_dev and
update mode in blktrans_open() so you can use it later on.

 Jocke

>
> Best regards,
> Alexander
