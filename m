Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14sqRL-0004OY-00
	for mtd-list@infradead.org; Thu, 26 Apr 2001 19:24:31 +0100
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14sqRE-0004OS-00
	for mtd@infradead.org; Thu, 26 Apr 2001 19:24:25 +0100
From: mark.langsdorf@amd.com
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F3F5@txexmta8.amd.com>
To: rob@sysgo.de, vipin.malik@daniel.com
cc: ajlennon@arcom.co.uk, mtd@infradead.org, jffs-dev@axis.com
Subject: RE: Elan SC520 - problem with MTD
Date: Thu, 26 Apr 2001 13:23:01 -0500
MIME-Version: 1.0
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Looks like I took the wrong week to go on vacation.

Could everyone who is currently doing work with either
the AMD Elan Sc520 Customer Development Platform or the
AMD Elan Net520 Demonstration Board please send me an
email and tell me what they're doing with it and what
kind of support they need from AMD?  I'll be glad to
provide whatever help/co-ordination I can.

And I'm working on getting that stupid license .pdf
removed from the tarball.  Sorry about that.

Mark Langsdorf
Advanced Micro Devices, Inc			Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 621		Fax: 512.602.5051
Austin, TX 78741
mark.langsdorf@amd.com

> -----Original Message-----
> From: Robert Kaiser [mailto:rob@sysgo.de]
> Sent: Tuesday, April 24, 2001 2:56 AM
> To: Vipin Malik
> Cc: Alex Lennon; mtd@infradead.org; jffs-dev
> Subject: Re: Elan SC520 - problem with MTD
> 
> 
> On Die, 24 Apr 2001 you wrote:
> > Wow! Where (and why ;) were your hiding this gem for so long?!!!
> 
> It's been there all the time ....
> 
> > 
> > This is the answer to a lot of maiden's prayers! Robert, 
> are you the "rob" in the
> > CVS Id in the files?
> 
> Yep :-)
> 
> If there is enough public interest in this, maybe I can setup a home
> page/public CVS for it some day. If only I had more time :-(
> 
> 
> > P.S. I saw a couple of mails ago that some folks mentioned 
> that I have
> > successfully booted the linux kernel directly out of flash 
> and installed
> > the JFFS(2) as the root
> > fs (and a ext2 fs as a compressed fs in ramdisk). That is all true.
> > 
> > I have supplied, on request, the files to boot the kernel 
> out of flash.  The
> > original source of the hacked kernel boot code to do this 
> was AMD (and it's
> > open source of course).
> > Please let me know if you want those.
> 
> Yes, please !
> 
> > HOWEVER! The solution is not a very
> > elegant one.
> > It involves making changes to some startup files (bootset.S 
> and setup.S) in the
> > Linux startup code itself.
> 
> I am currently writing code to support booting  the SC520 CDP from ROM
> without BIOS using the above mentioned ROM bootloader (BTW, 
> it's name is
> "ROLO" :-)).
> 
> What I'm mostly interested in is the startup/initialization 
> sequence for that
> board. Once it has been properly initialized, the generic 
> ROLO code should
> work out of the box.
> 
> I have some code that does the basic SC520 initialization right after
> reset and I am now trying to initialize the Super I/O chip (I 
> have just
> received the chip manual from Acerlabs). After that, I need 
> to figure out a way
> to setup the set up the PCI bridge... Another thing that is 
> still missing in my
> code is a proper RAM size detection. 
> 
> So any working code you might have along these lines -no 
> matter how ugly-
> would probably be helpful to me.
> 
> Rob
> 
> ----------------------------------------------------------------
> Robert Kaiser                         email: rkaiser@sysgo.de
> SYSGO RTS GmbH
> Am Pfaffenstein 14                    phone: (49) 6136 9948-762
> D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
> 
> To unsubscribe from this list: send the line "unsubscribe jffs-dev" in
> the body of a message to majordomo@axis.com
> 



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
