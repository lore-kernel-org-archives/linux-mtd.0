Received: from snifit.smb.utfors.se ([195.58.112.20])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fiDh-0000BF-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 15:09:13 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by snifit.smb.utfors.se (iPlanet Messaging Server 5.2 Patch 1 (built Aug 19
 2002)) with SMTP id <0H9Q00C6VNFBAR@snifit.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Mon, 03 Feb 2003 16:09:12 +0100 (MET)
Date: Mon, 03 Feb 2003 16:09:11 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
In-reply-to: <5.1.0.14.0.20030203081101.0257c980@64.170.22.132>
To: Vipin Malik <vipin@embeddedlinuxworks.com>,
 MTD for Linux <linux-mtd@lists.infradead.org>
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLGEOBFJAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Subject: RE: mtd partition1 corruption during writes to JFFS2 on  partition2.
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
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

> 
> Hi Jocke,
> 
> Thanks for the reply.
> 
> 
> >I also have several partions(ppcboot, kernel and JFFS2) and I never had any
> >problems to update ppcboot or kernel(cp file /dev/mtdblock0) while JFFS2 
> >is mounted.
> >I am using cmdset0001 driver, so perhaps it's a driver problem?
> 
> I'll take a look. Anyone care to tell me where the locking to prevent 
> multiple processes from accessing the flash at the same time takes place? 
> (is this a chip driver feature or an mtd feature? There are some spin locks 
> in the cfo_cmdset0002.c driver but AFAIK spin locks are really NOPS on 1P 
> machines.

It's the spin_locks in the cmdsetxxxx driver as far as I know, but I am no
locking expert.

Does AMD support "suspend erase to do a read" and/or "suspend erase to do a write" ?
Support for that can make your JFFS2 behave nicer during heavy erase activities.

> 
> 
> >If you will play with the cmdset0002 driver, consider to add point/unpoint
> >support(already in cmdset0001).
> 
> What's that? XIP? I'll look into it if I start to hack the driver.

Currently point is only used during mount(see scan.c) and in somewhere
in GC as an optimization in CVS HEAD. It's not used for XIP(maybe some day)
Mount is MUCH faster in CVS HEAD, even without point.

> 
> 
> >Recently(a few weeks ago) a locking bug in JFFS2 was fixed which bit me during
> >boot, don't think this what's biting you though.
> 
> 
> I'm running 2.4.20 Is the fix in there?

Don't know if 2.4.20 is affected, the bug was found and corrected in CVS HEAD.

> 
> Vipin
> 
> 
> >  Jocke
> >
> > > I've got multiple mtd partitions on one NOR flash device (CFI/AMD).
> > >
> > > I've got JFFS2 fs mounted on the last partition. The other partitions hold
> > > compressed firmware, that I intent upgrade while JFFS2 is being written to.
> > >
> > > However, I find that if I write to the mtd device(s) (erase, followed by
> > > dd) and then reboot, the firmware is corrupt.
> > > If I stop writes to the JFFS2 partition before upgrading the firmware on
> > > the mtd partitions, everything is ok every time.
> > >
> > > Is this a known "feature"?
> > > Ideas?
> > >
> > > TIA
> > >
> > > Vipin
> > >
> > >
> > > ______________________________________________________
> > > Linux MTD discussion mailing list
> > > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
