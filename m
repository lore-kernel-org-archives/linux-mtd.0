Received: from smtp.lynuxworks.com ([207.21.185.24])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16AuzC-00086q-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 15:26:27 +0000
Date: Mon, 3 Dec 2001 07:36:59 -0800 (PST)
From: Aleksander Sanochkin <asanochkin@Lnxw.COM>
To: <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>, <jffs-dev@axis.com>
Subject: Re: JFFS1/MTD bug-fixes
Message-ID: <Pine.LNX.4.33.0112030726090.14716-100000@newbast.lynuxworks.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> > --- cvs/drivers/mtd/chips/cfi_cmdset_0002.c   Wed Oct 24 13:37:30 2001
> > +++ other/drivers/mtd/chips/cfi_cmdset_0002.c Wed Nov 21 12:58:47 2001
> > @@ -162,10 +162,7 @@
> >       /* Also select the correct geometry setup too */
> >       mtd->size = devsize * cfi->numchips;
> >
> > -     if (cfi->cfiq->NumEraseRegions == 1) {
> > -             /* No need to muck about with multiple erase sizes */
> > -             mtd->erasesize = ((cfi->cfiq->EraseRegionInfo[0] >> 8) &
~0xff) * cfi->interleave;
> > -     } else {
> > +     {
> >               unsigned long offset = 0;
> >               int i,j;
>
> Why do we need this? If NumEraseRegions is one (or zero, for that
> matter),
> we don't need to allocate the structure containing the region
> information,
> as the whole device is known to have the same 'major' erasesize.

We did this for two reasons:

 1) To be consistent with cfi_cmdset_002.c which always initializes
    eraseregions.

 2) We have also modified JFFS1 code so as it now works for flash
    partitions with non-uniform sectors, and our code is based on
    the assumption that eraseregions are always initialized.


> >       default:
> >               DEBUG(MTD_DEBUG_LEVEL0, "Invalid ioctl %x (MEMGETINFO =
%x)\n", cmd, MEMGETINFO);
> > -             ret = -ENOTTY;
> > +             ret = -ENOIOCTLCMD;
>
> Strange though it may seem, I thought -ENOTTY was correct there.
>
>        ENOTTY The specified request does not apply to the kind of
>               object that the descriptor d references.

You are right: ENOTTY is the correct value here.

>
> > +                     if (mtd->usage_counter)
> > +                     {
> > +                             up(&mtd_table_mutex);
> > +                             return -EBUSY;
> > +                     }
>
> Do we need to provide this in the kernel? I can see it protects against
> user error, but that isn't necessarily the kernel's job. Am I missing
> another need for it?

We have also added a possibility for run-time partitioning of an MTD
device, and use this usage_counter to prevent deleting of a partition
while it is being used by some process.

> > +     while (! c->gc_task)
> > +     {
> > +             schedule();
> > +     }
>
> Better to do this with a semaphore. Start it locked, have the GC thread
> call up(), and this code wait in down().

You are right.
