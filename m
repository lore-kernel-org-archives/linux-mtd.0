Received: from pony2pub.arc.nasa.gov ([128.102.31.42] helo=mail.arc.nasa.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19G4lH-0006oC-4e
	for <linux-mtd@lists.infradead.org>; Wed, 14 May 2003 23:30:11 +0100
Message-Id: <5.2.1.1.2.20030514152328.01234a98@mail.arc.nasa.gov>
Date: Wed, 14 May 2003 15:32:23 -0700
To: David Woodhouse <dwmw2@infradead.org>, David.Mattes@Boeing.com
From: "Edward A. Hildum" <ehildum@mail.arc.nasa.gov>
In-Reply-To: <1052943424.2326.2.camel@imladris.demon.co.uk>
References: <3EC28764.6050102@Boeing.com>
 <3EC28764.6050102@Boeing.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
cc: linux-mtd@lists.infradead.org
Subject: Re: problem installing grub on DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not sure about 48MB DOCs, but with 256 MB DOC 2000 TSOPs, DFORMAT 5.1.4 
installs an initial program loader that wants grub_firmware to have 
properties different than the ones the GRUB build process makes.  In 
particular, it wants the first 12KB to have a checksum of 0x55 rather than 
the first 8KB.

On the other hand, DFORMAT is aware of the different DOC models and treats 
them differently, so this may not apply to the 48M DOC.  If you can boot 
DOS from a floppy, you can use DOS DEBUG to look at the initial program 
loader in the DOC memory window.  With a little effort, you can figure out 
what the IPL wants grub_firmware to look like.

Ted Hildum

At 09:17 PM 5/14/2003 +0100, you wrote:
>On Wed, 2003-05-14 at 19:13, David Mattes wrote:
> > hi linux-mtd readers,
> >
> > i've tried subscribing to the list but the moderator isn't replying :-(
> > ....
>
>That would be me. I haven't seen anything that needed a reply -- what
>happened? Did you fill in your address etc in the form at
>http://lists.infradead.org/mailman/listinfo/linux-mtd ?
>
> > i'm following mark meade's DOC-GRUB how-to to the letter for installing
> > GRUB on my M-Systems DOC2000 48M unit, but have hit a wall.  i've been
> > scouring the list archives for help with no luck, so i ask you...
> >
> > after using DFORMAT 5.1.4:
> > DFORMAT /win:E000 /BDKF0:grub_firmware
> >
> > i reboot system and the message "DoC found" scrolls on the screen about
> > 8 times, and then the computer reboots.
>
>Aren't you supposed to use DFORMAT 4.2 to be compatible with the Grub
>code?
>
>--
>dwmw2
