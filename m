Received: from seal.itee.adfa.edu.au ([131.236.224.79]
	helo=seal.cs.adfa.edu.au)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DAy4C-0004F6-H1
	for linux-mtd@lists.infradead.org; Mon, 14 Mar 2005 17:29:41 -0500
Received: from gipsy (h67205.acme.adfa.edu.au [131.236.67.205])
	by seal.cs.adfa.edu.au (8.13.3/8.13.3) with SMTP id j2EMTZRA028779
	for <linux-mtd@lists.infradead.org>;
	Tue, 15 Mar 2005 09:29:35 +1100 (EST)
From: "Matt Garratt" <m.garratt@adfa.edu.au>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 15 Mar 2005 09:29:36 +1100
Message-ID: <NOEGLAKNEOPKAMKEHNOJCEBICOAA.m.garratt@adfa.edu.au>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <4235FC03.1030507@ieee.org>
Subject: RE: docboot freeze
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dan, thank you very much for replying. I have 256MB RAM. I will try the
test you have suggested as soon as I can.

> -----Original Message-----
> From: Dan Brown [mailto:dan_brown@ieee.org]
> Sent: Tuesday, 15 March 2005 8:03 AM
> To: Matt Garratt
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: docboot freeze
>
>
> Matt Garratt wrote:
> > I am still trying to get docboot to work from a DOC200 after
> giving up on
> > grub after much time wasted. Getting the DOC to boot is the
> most frustrating
> > thing I have done for quite a while. I get as far as:
> >
> > Loading kernel.......Loading initrd.....
>
> Hi, Matt.  Sorry I didn't respond to your message sooner.  I'm sorry to
> hear about the trouble you're having.  My guess is that the newly-added
> initrd support in DOCBoot is buggy in some fashion -- it's received very
> little testing.
>
> To help me figure this out, can you tell me how much RAM your system has?
>
> Also, please try the following test:  Install DOCBoot WITHOUT the
> ramdisk image (but with the same cmdline).  This, of course, should fail
> when the kernel tries to load data from /dev/ram0.  But at least you
> should see all the initial kernel messages before it tries to mount the
> root filesystem.  The fact that you currently don't see those messages
> indicates to me that DOCboot is doing Something Bad when it loads your
> initrd.
>
> > My cmdline is:
> >
> >   root=/dev/ram0 rootfstype=ext2 ro console=tty0
> >
> > I was wondering if the arguments for the cmdline were defined
> somewhere and
> > if there any limitations? For example, does root have to be an
> mtd device?
>
> No, there should be no such limitations.  I don't think this is user
> error :)
>
> > It sais in the README that there is no serial port support yet
> the default
> > cmdline contains console=ttyS0,115200 - I am a bit confused by this.
>
> What I meant by that is that you can't see the messages printed by
> DOCBoot itself on a serial port, only on your monitor.  Also, there is
> no ability to control DOCBoot from a serial port (using a keyboard, you
> can skip DOCBoot installation).
>
> The information in your cmdline affects the use of the serial port by
> the Linux kernel, not by DOCBoot.
>
> >  I am trying to run the root filesystem from RAM.
> >
> > I get the same kernel and initrd file to boot on the same machine from a
> > hard diskc using lilo. The lilo stanza for doing this is:
> >
> > image = /boot/bzImage
> >   root = /dev/ram0
> >   label = ramOS
> >   initrd = /boot/tiny.image.ext2.gz
> >   read-only
> >
> > I may be misinterpreting the meaning of the cmdline parameters, but any
> > suggestions would be very welcome.
>
> The fact that this works for you in LILO strongly indicates a bug in my
> initrd loading code, which is very simplistic.
>
> 	-Dan
>
