Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B3tje-0004HK-H7
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 09:22:42 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HUR000Y0LVMZ9@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 10:18:59 +0100 (MET)
Date: Thu, 18 Mar 2004 10:15:58 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <6.0.1.1.0.20040318084717.01ef8d60@192.168.2.1>
To: llandre <r&d@wawnet.biz>, David Woodhouse <dwmw2@infradead.org>
Message-id: <200403181015.58675.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <6.0.1.1.0.20040317161859.01f80e70@dns.struinfo.it>
 <200403171803.51317.tglx@linutronix.de>
 <6.0.1.1.0.20040318084717.01ef8d60@192.168.2.1>
cc: Andrea Scian <andrea.scian@wawnet.biz>
cc: Matteo Bortolin <matteo.bortolin@wawnet.biz>
cc: linux-mtd@lists.infradead.org
Subject: Re: Bug in nand_select_chip?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 18 March 2004 09:11, llandre wrote:
> > > I fixed the driver as shown in the NAND Flash document:
> > > - nCE pin low when hwcontrol is invoked with NAND_CTL_SETNCE
> > > - nCE pin high when hwcontrol is invoked with NAND_CTL_CLRNCE
> > > and now the driver works with the new MTD code.
> >
> >That's the reason why documents are written. :)
> >
> >But the driver should work with the old code too, as this never changed
> > since we started NAND support in JFFS2.
>
> In my understanding the driver does not work with the old code because
> the old nand_select_chip() implementation called this->hwcontrol(mtd,
> NAND_CTL_CLRNCE),
> with chip==0, setting the nCE pin high.

That's correct, but you unfortunaly relied on code, which was in a heavy 
modifciation phase. If you use leading edge code, be aware, that things might 
be broken from time to time. The fix for this was committed 10 days after the 
first rework. 

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
