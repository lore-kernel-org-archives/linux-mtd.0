Received: from b.smtp-out.sonic.net ([208.201.224.39])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18PBGF-0003al-00
	for <linux-mtd@lists.infradead.org>; Fri, 20 Dec 2002 00:43:31 +0000
Received: from mailman.eason.com (adsl-209-204-139-80.sonic.net [209.204.139.80])
	by turbo.sonic.net (8.11.6/8.8.5) with ESMTP id gBK1EBn21447
	for <linux-mtd@lists.infradead.org>; Thu, 19 Dec 2002 17:14:11 -0800
Message-ID: <D3AF5F134D627243993F2F2FC32EE4D229C4D0@mailman.eason.com>
From: Alex Pavloff <apavloff@eason.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: writing new BBRAM driver
Date: Thu, 19 Dec 2002 17:14:11 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Sorry, repost with a proper header... grr...

> Date: Mon, 16 Dec 2002 13:54:14 +0100
> From: Geoffroy Stevenne <geof@hellea.com>
> To: linux-mtd@lists.infradead.org
> Subject: Re: writing new BBRAM driver
> Organization: Hellea SPRl
> 
> 
> Hi,
> 
> On Mon, 16 Dec 2002 11:14:41 +0100 (MET)
> Tobias Otto-Adamczak <toa@indakom.de> wrote:
> 
> > Alex Pavloff, 2002-12-13, 15:45h:
> > 
> > > Hi there folks.  I've written the struct mtd_info functions for a
> > > 128KB BBRAM driver for my companies new board.  It's horribly
> > > simple, as most of it is actually done by a gate array on 
> the board,
> > > so from kernel land its just poking ioports.  Easy stuff.
> 
> Great! If it works with the versalogic board it will be tested
> here with a 512KB BBRAM.  Of course I'll provide maximum feedback
> (maybe patches if any required). Thanks!

Sadly, its an integrated piece of hardware that goes onto a
power/touchscreen/bbram mezzanine board that fits directly on top of a geode
"biscuit" SBC board and connects via PC104.  I'll make the source available,
but I really don't think it'll be useful to anyone else as something other
than an example.

I'm still trying to figure out some stuff.

The BBRAM formats to 122KB, which is fine.  I can copy files to & from it.
Since my device can be powered down at any second, I'm might want to use a
journalling filesystem, but, well, I don't need any sort of wear levelling,
so I think jffs/2 is overkill.  Shall I just run minix and just fsck the
drive on powerup or us there some sort of small non-wear-levelling yet
journalling filesystem that I could use?

Secondly:  erasesize.  I have to define a "erase" function (like that of the
test RAM device) and define MTD_ERASEABLE and I've got the erasesize set to
0.  Is this ok?  Will this be called?  Should I make erase size larger for
some reason?

And lastly, while I've got you here, does anyone have any info on why
certain CompactFlash pieces don't work properly in IDE mode without file
corruption?

A range of possible theories have been proposed
 1)  Slow write speed of flash falling out of IDE spec
 2)  Crappy controller chips with IDE code that isn't up to spec
 3)  Linux affinity for SanDisk only, require the =flash option boot

I don't have any flash that does this, but its out there.  All thoughts
appreciated.

Thanks for the great subsystem.

Alex Pavloff - apavloff@eason.com
Eason Technology -- www.eason.com
