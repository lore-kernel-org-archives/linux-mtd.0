Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14rpPx-0002Vh-00
	for mtd-list@infradead.org; Tue, 24 Apr 2001 00:06:53 +0100
Received: from mail1.danielind.com ([12.19.96.6])
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14rpPl-0002Ux-00
	for mtd@infradead.org; Tue, 24 Apr 2001 00:06:42 +0100
Message-ID: <3AE4B5B3.26E340E8@daniel.com>
Date: Mon, 23 Apr 2001 18:07:32 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: rob@sysgo.de
CC: Alex Lennon <ajlennon@arcom.co.uk>, mtd@infradead.org,
 	jffs-dev <jffs-dev@axis.com>
Subject: Re: Elan SC520 - problem with MTD
References: <NEBBKJHOALKOLCFPGELEIEJLCJAA.ajlennon@arcom.co.uk> <01042316543802.01109@rob>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Wow! Where (and why ;) were your hiding this gem for so long?!!!

This is the answer to a lot of maiden's prayers! Robert, are you the "rob" in the
CVS Id in the files?

Vipin

P.S. I saw a couple of mails ago that some folks mentioned that I have successfully

booted the linux kernel directly out of flash and installed the JFFS(2) as the root
fs
(and a ext2 fs as a compressed fs in ramdisk). That is all true.

Expect boot the kernel directly out of flash part, everything else is fully
documented
(some may say "painfully fully" documented) in my HOWTO in the CVS.

I have supplied, on request, the files to boot the kernel out of flash.  The
original source
of the hacked kernel boot code to do this was AMD (and it's open source of course).

Please let me know if you want those. HOWEVER! The solution is not a very elegant
one.
It involves making changes to some startup files (bootset.S and setup.S) in the
Linux
startup code itself.

Furthermore it only works with the 2.2.x series and with zImage (not bzImage).
Hence i've not
put it into CVS.

I think, if I understood the capabilities of the linked ftp files below properly,
this could be the
very elegant solution that we all were looking for. I'll investigate this a bit
further.




Robert Kaiser wrote:

> On Mon, 23 Apr 2001 you wrote:
> > I'm looking at this myself at the moment - the simplest solution is to
> > perform the hook,
> > load a zImage into low mem and let the Linux startup code handle the nasty
> > protected
> > mode bits 'n' pieces. Works fine for me under 2.2. Unfortunately I really
> > can't seem to
> > manage to get 2.4 down to < 500Kb so I need bzImage which means that - yes -
> > there is some protected mode support required. Alternatively it might be
> > possible to
> > throw the kernel up to 0x100000 using 32-bit real mode. I need to check on
> > this....
>
> If you're interested in this kind of stuff, have a look at our GPLed ROM loader.
>
> ftp://ftp.sysgo.de/pub/elinos/1.0/updates/rolo_1.1_src.tar.gz
>
> It loads a bzimage using 32-bit real mode. It is written mostly in C, but it
> doesn't compile  with gcc (you need bcc).
>
> Rob
>
> ----------------------------------------------------------------
> Robert Kaiser                         email: rkaiser@sysgo.de
> SYSGO RTS GmbH
> Am Pfaffenstein 14                    phone: (49) 6136 9948-762
> D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
