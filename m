Received: from [62.254.209.121] (helo=drmail.stives.linx.gbr)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Eweyx-0005Iv-M5
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 07:21:42 -0500
Message-ID: <DB1B6B12D0E2F0469EB35A9586066B6ECE7999@stivesemail.stives.linx.gbr>
From: James Hughes <JHughes@Linx.co.uk>
To: linux-mtd@lists.infradead.org
Date: Wed, 11 Jan 2006 12:25:03 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: FW: Trying to get MTD to do anything...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > However, although I have enabled MTD in the kernel config, 
> and all various
> > options I think I need, during kernel boot there is no 
> indication that the
> > MTD driver(s) is being started up - no scanning, no flash finds etc.
> > Documentation for the patches for this board says MTD 
> should be working.
> > Kernel version is 2.6.10.
> 
> > My question (amongst many) is how do I get the MTD system 
> to start up - what
> > have I missed?
> 
> Sounds like you are probably missing a map file for you system. 
> drivers/mtd/maps/*.c
> 
> You can use the mainstone.c as a template.
>

I have done exactlythat, changing the mapping to the correct place (very
minor change). However, although the driver is being registered (printk
confirms this), the probe function is never called to set up the flash. Does
anyone know why that may be the case? Is there something I haven't done in
the kernel set up? Anyone know the reasons why the probe callback may not be
called, even though a driver has been registered?

James
