Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cY6N-0002ns-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 22:12:19 +0100
Message-ID: <3D518D06.B809B67@mvista.com>
Date: Wed, 07 Aug 2002 14:11:34 -0700
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>
CC: Steve Tsai <startec@ms11.hinet.net>,
        "'David Woodhouse'" <dwmw2@infradead.org>,
        Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: NAND Configuration
References: <002f01c23dfb$dea583f0$5501a8c0@synso.com.tw> <1028717345.19447.249.camel@thomas.tec.linutronix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Thomas Gleixner wrote:

> On Wed, 2002-08-07 at 12:19, Steve Tsai wrote:
> > > > JFFS2 on NOR type flash does not use buffering, OOB check and bad
> > > > block management, but it can be used now. I meant that
> > > > CONFIG_JFFS2_FS_NAND is not defined, maybe the driver still
> > > can work,
> > > > but it is not good as the original one.
> > >
> > > JFFS2 cannot work on NAND flash without the extra code enabled by
> > > CONFIG_JFFS2_FS_NAND. You need to batch writes into
> > > page-sized chunks and
> > > use ECC. It looks like you have enabled CONFIG_JFFS2_FS_NAND
> > > in the log you
> > > show -- is that correct?
> > >
> >
> > Yes, I enable CONFIG_JFFS2_FS_NAND. I follow
> > http://www.linux-mtd.infradead.org/tech/nand.html to config the
> > settings. Can I do not care ECC on NAND flash?
> >
> ECC _HAS_ to be enabled !
>
> Have you ever erased your flash with erase /dev/mtdX ?
> This may have caused the problem, because erase is not aware of bad
> block handling and may have erased a block, which was marked as bad
> already and erased the bad block marker too. So if you write to this
> block, you get a write failure and therefor a read failure afterwards.
> I will change nand.c, so that bad blocks cannot be erased anymore.
>

>From looking at nand_erase(), it appears that the attempted erase of a bad
block would
result in not performing the erase and exiting with -EIO, correct?

What is the preferred method to erase nand?

Alice

>
> Another problem could be your command delay time. You have set it to
> 15µsec. Is that correct for your chip ? Which chip are you using ?
> Have you tried to set it to a higher value ?
>
> --
> Thomas
> ____________________________________________________
> linutronix - competence in embedded & realtime linux
> http://www.linutronix.de
> mail: tglx@linutronix.de
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
