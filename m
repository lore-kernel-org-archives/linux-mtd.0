Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cj9C-0004Ve-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2002 09:59:58 +0100
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H0I00DU7OZ1FS@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 08 Aug 2002 10:59:26 +0200 (MEST)
Date: Thu, 08 Aug 2002 10:59:23 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: NAND Configuration
In-reply-to: <3D518D06.B809B67@mvista.com>
To: Alice Hennessy <ahennessy@mvista.com>
Cc: Steve Tsai <startec@ms11.hinet.net>,
 'David Woodhouse' <dwmw2@infradead.org>,
 Linux MTD mailing list <linux-mtd@lists.infradead.org>
Message-id: <1028797164.9592.2.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
References: <002f01c23dfb$dea583f0$5501a8c0@synso.com.tw>
 <1028717345.19447.249.camel@thomas.tec.linutronix.de>
 <3D518D06.B809B67@mvista.com>
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

On Wed, 2002-08-07 at 23:11, Alice Hennessy wrote:
> > Have you ever erased your flash with erase /dev/mtdX ?
> > This may have caused the problem, because erase is not aware of bad
> > block handling and may have erased a block, which was marked as bad
> > already and erased the bad block marker too. So if you write to this
> > block, you get a write failure and therefor a read failure afterwards.
> > I will change nand.c, so that bad blocks cannot be erased anymore.
> >
> 
> >From looking at nand_erase(), it appears that the attempted erase of a bad
> block would
> result in not performing the erase and exiting with -EIO, correct?
> 
> What is the preferred method to erase nand?
> 
> Alice

With actual code in CVS you can use erase(all) /dev/mtdX. I modified it,
that attempts to erase bad block's are rejeceted in any case. The
previous version let you erase bad blocks, if CONFIG_NAND_ECC_JFFS2 was
not set. But now it's forced by default.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
