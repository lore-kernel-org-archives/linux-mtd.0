Received: from host31-220.pool21757.interbusiness.it ([217.57.220.31]
	helo=wawnet.biz)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3ueP-0004a8-S3
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 10:21:22 +0000
Message-Id: <6.0.1.1.0.20040318105224.01f77d10@192.168.2.1>
Date: Thu, 18 Mar 2004 10:56:17 +0100
To: tglx@linutronix.de,David Woodhouse <dwmw2@infradead.org>
From: llandre <r&d@wawnet.biz>
In-Reply-To: <200403181015.58675.tglx@linutronix.de>
References: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
 <200403171803.51317.tglx@linutronix.de>
 <6.0.1.1.0.20040318084717.01ef8d60@192.168.2.1>
 <200403181015.58675.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: Andrea Scian <andrea.scian@wawnet.biz>
cc: Matteo Bortolin <matteo.bortolin@wawnet.biz>
cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in nand_select_chip?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>On Thursday 18 March 2004 09:11, llandre wrote:
> > > > I fixed the driver as shown in the NAND Flash document:
> > > > - nCE pin low when hwcontrol is invoked with NAND_CTL_SETNCE
> > > > - nCE pin high when hwcontrol is invoked with NAND_CTL_CLRNCE
> > > > and now the driver works with the new MTD code.
> > >
> > >That's the reason why documents are written. :)
> > >
> > >But the driver should work with the old code too, as this never changed
> > > since we started NAND support in JFFS2.
> >
> > In my understanding the driver does not work with the old code because
> > the old nand_select_chip() implementation called this->hwcontrol(mtd,
> > NAND_CTL_CLRNCE),
> > with chip==0, setting the nCE pin high.
>
>That's correct, but you unfortunaly relied on code, which was in a heavy
>modifciation phase. If you use leading edge code, be aware, that things might
>be broken from time to time. The fix for this was committed 10 days after the
>first rework.

Ok, thanks for the advice.
To avoid such problems, is it possible to download "stable" releases? Are they
tagged in the CVS repository?



Best regards,

llandre 
