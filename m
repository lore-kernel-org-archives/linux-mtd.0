Received: from mail4.comsite.net ([205.238.176.238])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QPy8I-0003Xt-CR
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 14:35:23 +0000
From: Milton Miller <miltonm@bga.com>
To: Michal Simek <michal.simek@petalogix.com>
Subject: Re: Unaligned jffs2 dnode address - tested by nandsim
In-Reply-To: <4DDB5F60.1080703@petalogix.com>
References: <4DD5022C.9060205@petalogix.com> <4DDB5F60.1080703@petalogix.com>
Date: Fri, 27 May 2011 09:35:18 -0500
Message-ID: <1306506918_8903@mail4.comsite.net>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Michal Simek wrote:
> Michal Simek wrote:
> >
> > Hi,
> >
> > I have reached one problem with jffs2 fs ecc tested by nandsim on
> > Microblaze.
>
> Any update on this? Does someone know if jffs dnode should be aligned or not?
> I have added some developers from mtd-utils.
> 
> I have also done test with the latest mtd-utils from git and
> there is still unaligned address.
> 
> Any suggestions?

I vaguely remember doingn some research in this area a few years ago
looking a report on linuxppc-dev about this and the kernel's unaligned
access was dependant on the device being given a mtd point function
which means the device is directly accessible in the cpus address space.

I don't remember much beyond that and don't have time to dig.  I am
just an observer with respect to linux mtd.

> 
> Thanks,
> Michal

Hope this helps your research,
milton
