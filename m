Received: from gate.epygi.de ([212.126.211.241])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C2tg9-00082n-H2
	for linux-mtd@lists.infradead.org; Thu, 02 Sep 2004 11:39:15 -0400
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Kuefmann Andreas ICM CP RD SD 1" <andreas.kuefmann@siemens.com>,
	<linux-mtd@lists.infradead.org>
Date: Thu, 2 Sep 2004 17:39:10 +0200
Message-ID: <NGENJJFPMHGLPILEKKAMGEMHCEAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <7F3FE9B2FBF6194691BC493C6699C0B1568B93@mchh9esa.mchh.siemens.de>
Cc: 
Subject: RE: how to change size of MTD partitions at runtime
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andreas,

by saying "additional partion" a partition that mappes to the same area inside the flash as the kernel/rootfs/other area . That you
whant to replace. You don't need more space to do so. Just tell this additional partition that it should be lokated at the same
position as your old partitions. For instance you use this additional partition to map the entire flash. Then you can access the raw
flash for writing the binaries to it.
Maybe changing the partitioning works too...

I always recalculate the flash areas for kernel, rootfs and a second fs during kernel startup based on the data in the flash. During
system update I simply erase the entire area and then write the data to it.

In any case you should watch out for open filehandles to your filesystems while replacing them. "Open file handle problems" appeare
more often when the layout of the flash and rootfs changes dramaticaly during the update process.

Stephan

> -----Original Message-----
> From: Kuefmann Andreas ICM CP RD SD 1
> [mailto:andreas.kuefmann@siemens.com]
> Sent: Donnerstag, 2. September 2004 16:48
> To: 'Stephan Linke'; Kuefmann Andreas ICM CP RD SD 1;
> linux-mtd@lists.infradead.org
> Subject: AW: how to change size of MTD partitions at runtime
>
>
> Hi Stephan,
>
> thanks for your proposal. Unfortunately we have a very limited flash, so we
> can't afford an additional partition for sw update purpose as you suggested.
>
> If it should happen that future kernel/rootfs images would exceed the current
> mtd partition sizes we'd have to shrink another mtd partition (user data)
> accordingly in order to regain the missing space.
>
> I don't think I'd have to re-mount/re-sync after the update, since it's OK
> to reboot the machine after the update has completed.
>
> regards,
> - Andy
>
> -----Ursprüngliche Nachricht-----
> Von: Stephan Linke [mailto:Stephan.Linke@epygi.de]
> Gesendet: Donnerstag, 2. September 2004 15:20
> An: Kuefmann Andreas ICM CP RD SD 1; linux-mtd@lists.infradead.org
> Betreff: RE: how to change size of MTD partitions at runtime
>
>
> Hi Andreas,
>
> for the same purpose I am using an additional partition that covers the range of kernel and rootfs to update both of them
> at the same time. Ofcourse in this case after writing the images the device has to be rebooted. How do you handle
> remounting the rootfs and synchronization with current systems configuration so you don't have to reboot?
>
> Regards, Stephan
>
> > -----Original Message-----
> > From: linux-mtd-bounces@lists.infradead.org
> > [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Kuefmann
> > Andreas ICM CP RD SD 1
> > Sent: Mittwoch, 1. September 2004 13:42
> > To: 'linux-mtd@lists.infradead.org'
> > Subject: how to change size of MTD partitions at runtime
> >
> >
> > Hi all,
> >
> > I'm searching for a solution to dynamically change the size of MTD
> > partitions at runtime.
> >
> > This functionality is required for a flash update of kernel and/or
> > rootfs in the special case that the new kernel/rootfs is larger than
> > the old one. (in an embedded environment)
> >
> > 1.)
> > there is no problem in erasing the flash, e.g eraseall /dev/mtd?,
> > (acting from a chrooted environment)
> >
> > 2.)
> > However, reprogramming the flash with a larger image (now exceeding
> > the limits of the previous partition) isn't as easy as a cp
> > newimage.img /dev/mtd?.
> >
> > The MTD layer will still rely on the (old) partition sizes that were
> > valid during system startup. (taken over from a U-BOOT environment)
> >
> > My plans are as follows:
> > - erase the flash partitions
> > - adapt the u-boot environment to reflect the new mtd partition sizes
> > - force the MTD subsystem to "re-read" the partition table in u-boot's
> >   environment.
> > - cp the new images to /dev/mtd? (which now reflect the changed
> >   partition sizes)
> >
> > My question now is:
> > - How can I manage to force a re-read of the partition table?
> >
> > Or can you think of another solution to change MTD partitions at
> > runtime?
> >
> > Thank you,
> > regards,
> > - Andy
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
>
