Received: from aponcelet-101-2-1-11.abo.wanadoo.fr ([193.251.42.11] helo=rostra.safetech.fr)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eH1s-00015A-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Sep 2001 15:18:16 +0100
Date: Tue, 4 Sep 2001 16:23:29 +0200 (CEST)
From: Norbert Leon <norbert@safetech.com>
To: Daniel Belz <belz@inf.pucrs.br>
cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Problems with Intel TE28F320 B3
In-Reply-To: <3B94E453.C4A4E9E4@inf.pucrs.br>
Message-ID: <Pine.LNX.4.21.0109041622430.4610-100000@tagada.safetech.fr>
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

well thank you
i am for sure interested in your code and it would be nice from you to
send it to me.

thanks in advance

On Tue, 4 Sep 2001, Daniel Belz wrote:

> David Woodhouse wrote:
> 
> > norbert@safetech.com said:
> > >  I'm working on an intel te28f320 b3ba110 (complete reference) and i
> > > can't get my system to recognize it ...
> >
> > Some of the 28F320 chips are CFI-compliant and some aren't. The other
> > letters and numbers you quoted didn't seem to help me work out which you
> > have.
> >
> > Turn off CONFIG_MTD_RAM, CONFIG_MTD_ROM and CONFIG_MTD_SLRAM. You don't
> > need them.
> >
> > --
> > dwmw2
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> the flash intel TE28F320B3BA110 (same of the BSE-IPengine) isn't CFI
> compliant. Is a JEDEC Flash.
> You have to modify the MTD source code to detect the flash.
> If you are interested, i have this code, and if you need, i send to you.
> Else, see the cfi_cmdset002.c, cfi_probe.c, cfi_jedec.c
> (/drivers/mtd/chips) and physmap.c (/drivers/mtd/maps).
> My code give a solution to implementing JFFS file system and Partitioning
> Support.
> 
> 
> Daniel Belz
> belz@inf.pucrs.br
> 
> 
