Received: from dsl-64-129-131-125.telocity.com
	([64.129.131.125] helo=mir.outpostsentinel.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16azVT-0002jb-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 13:31:31 +0000
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: "Robert Sandilands" <robert.sandilands@secureworx.com>,
        "'David Woodhouse'" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: FW: M-SYS Doc Replacements 
Date: Wed, 13 Feb 2002 08:42:41 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKAECNCDAA.cfowler@outpostsentinel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <9136BE9FE178D411A14F00508B6A0B7B36B7DD@ntserver1>
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

That was my problem too.  I woriginally built prototypes with 2.2.16 kernel.
I needed to go to 2.4.X gor the ramfs stuff.  I have no need for JFFS2.
I finially stopped at 2.4.13 becasue of problems here and there with other
drivers.  At first the MTD driver would not even see my DOC.  I'm using a
BCOM WinNet 6 as my hardware.  I gave up and went directly to the M-SYS
driver and it saw the DOC.  The main problem I was experiencing with 2.4.X
was in the realm of ramdisks.  It appears that the earlier 2.4.X kernels
igoned my ramdisks and overworte the memory.  I used about 3 ramdisks.  I
basically stored the images on the DOC and would allow initrd to write them
to the correct /dev/ram[x] spot.  Sometimes the kenrel could maount it
sometimes it would not. All depended if it overwrote the memory and
filesystem.  I finally got better results with 2.4.13 and then I had to
focus on fixing another buggy driver.  As with most hardware vendors, they
were to slow to update their driver to 2.4.  So 2.2 drivers are in the 2.4
kernel.  I'm too close to release to focus on the MTD driver right now.
I'll integrate it in a second release.  I'll allow it to stablize for one
more year.

Chris


-----Original Message-----
From: linux-mtd-admin@lists.infradead.org
[mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Robert
Sandilands
Sent: Wednesday, February 13, 2002 5:59 AM
To: 'David Woodhouse'
Cc: linux-mtd@lists.infradead.org
Subject: RE: FW: M-SYS Doc Replacements


Ok, long story...

The first driver we tried was the MTD driver, but that was Kernel 2.4.0 and
the guy that did it, did not know what he was doing - I also suspect there
was a few problems at that stage with the MTD driver. The binary driver did
work and it was therefore used.

Then problems with the Linux kernels forced us to first update to 2.4.3 and
then to 2.4.5 where we are now. Every time other issues forced us to change
and we wanted to keep everything as stable as possible, so we never tried
the MTD drivers in that process.

Everything seems stable with the 2.4.5 kernel except with the little problem
with the load. We will most likely upgrade our kernel in the next 2-3 months
to 2.4.10 or later and then will also take the step with the MTD driver, but
up to that stage we have to live with the M-systems driver.

>From initial investigation the driver seems fine and with our next upgrade
that is definitely what we will use.

Thank you.

Robert Sandilands

> -----Original Message-----
> From: David Woodhouse [mailto:dwmw2@infradead.org]
> Sent: 13 February 2002 11:18
> To: Robert Sandilands
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: FW: M-SYS Doc Replacements
>
>
>
> robert.sandilands@secureworx.com said:
> > I really don't want to start a flame war about this, but I
> think this
> > is a great example of why open-source is better than proprietary
> > software - and this discussions should be seen as such. If
> not that is
> > how I meant it.
>
> OK, thanks. Are you now using the GPL'd driver? Do you have
> any problems
> with it? I don't expect it to be perfect - but if there's something
> sufficiently wrong with it that caused you to even _consider_
> trying the
> other driver, I'd appreciate a bug report.
>
>
> --
> dwmw2
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
