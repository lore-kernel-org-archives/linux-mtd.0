Received: from [64.169.151.140] (helo=ns1.discountwebhost.com)
	by pentafluge.infradead.org with smtp (Exim 4.12 #3 (Red Hat Linux))
	id 18fhLv-0008Ku-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Feb 2003 14:13:40 +0000
Message-Id: <5.1.0.14.0.20030203081101.0257c980@64.170.22.132>
Date: Mon, 03 Feb 2003 08:13:25 -0600
To: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>,
 "MTD for Linux" <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
In-Reply-To: <003501c2cada$9b6c9120$020120b0@jockeXP>
References: <5.1.0.14.0.20030202082532.02427e68@64.170.22.132>
Mime-Version: 1.0
Subject: Re: mtd partition1 corruption during writes to JFFS2 on
  partition2.
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Hi Jocke,

Thanks for the reply.


>I also have several partions(ppcboot, kernel and JFFS2) and I never had any
>problems to update ppcboot or kernel(cp file /dev/mtdblock0) while JFFS2 
>is mounted.
>I am using cmdset0001 driver, so perhaps it's a driver problem?

I'll take a look. Anyone care to tell me where the locking to prevent 
multiple processes from accessing the flash at the same time takes place? 
(is this a chip driver feature or an mtd feature? There are some spin locks 
in the cfo_cmdset0002.c driver but AFAIK spin locks are really NOPS on 1P 
machines.


>If you will play with the cmdset0002 driver, consider to add point/unpoint
>support(already in cmdset0001).

What's that? XIP? I'll look into it if I start to hack the driver.


>Recently(a few weeks ago) a locking bug in JFFS2 was fixed which bit me during
>boot, don't think this what's biting you though.


I'm running 2.4.20 Is the fix in there?

Vipin


>  Jocke
>
> > I've got multiple mtd partitions on one NOR flash device (CFI/AMD).
> >
> > I've got JFFS2 fs mounted on the last partition. The other partitions hold
> > compressed firmware, that I intent upgrade while JFFS2 is being written to.
> >
> > However, I find that if I write to the mtd device(s) (erase, followed by
> > dd) and then reboot, the firmware is corrupt.
> > If I stop writes to the JFFS2 partition before upgrading the firmware on
> > the mtd partitions, everything is ok every time.
> >
> > Is this a known "feature"?
> > Ideas?
> >
> > TIA
> >
> > Vipin
> >
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
