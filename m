Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14s0KZ-0005zU-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 11:46:03 +0100
Received: from ns.sysgo.de ([213.68.67.98] helo=rob.devdep.sysgo.de)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14s0KW-0005zO-00
	for mtd@infradead.org; Tue, 24 Apr 2001 11:46:00 +0100
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: Vipin Malik <vipin.malik@daniel.com>
Subject: Re: Elan SC520 - problem with MTD
Date: Tue, 24 Apr 2001 09:56:26 +0200
Content-Type: text/plain
References: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk> <01042316543802.01109@rob> <3AE4B5B3.26E340E8@daniel.com>
In-Reply-To: <3AE4B5B3.26E340E8@daniel.com>
Cc: Alex Lennon <ajlennon@arcom.co.uk>, mtd@infradead.org,
        jffs-dev <jffs-dev@axis.com>
MIME-Version: 1.0
Message-Id: <01042412450101.00394@rob>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Die, 24 Apr 2001 you wrote:
> Wow! Where (and why ;) were your hiding this gem for so long?!!!

It's been there all the time ....

> 
> This is the answer to a lot of maiden's prayers! Robert, are you the "rob" in the
> CVS Id in the files?

Yep :-)

If there is enough public interest in this, maybe I can setup a home
page/public CVS for it some day. If only I had more time :-(


> P.S. I saw a couple of mails ago that some folks mentioned that I have
> successfully booted the linux kernel directly out of flash and installed
> the JFFS(2) as the root
> fs (and a ext2 fs as a compressed fs in ramdisk). That is all true.
> 
> I have supplied, on request, the files to boot the kernel out of flash.  The
> original source of the hacked kernel boot code to do this was AMD (and it's
> open source of course).
> Please let me know if you want those.

Yes, please !

> HOWEVER! The solution is not a very
> elegant one.
> It involves making changes to some startup files (bootset.S and setup.S) in the
> Linux startup code itself.

I am currently writing code to support booting  the SC520 CDP from ROM
without BIOS using the above mentioned ROM bootloader (BTW, it's name is
"ROLO" :-)).

What I'm mostly interested in is the startup/initialization sequence for that
board. Once it has been properly initialized, the generic ROLO code should
work out of the box.

I have some code that does the basic SC520 initialization right after
reset and I am now trying to initialize the Super I/O chip (I have just
received the chip manual from Acerlabs). After that, I need to figure out a way
to setup the set up the PCI bridge... Another thing that is still missing in my
code is a proper RAM size detection. 

So any working code you might have along these lines -no matter how ugly-
would probably be helpful to me.

Rob

----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
