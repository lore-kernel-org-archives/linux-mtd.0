Received: from josephine.discordia.ch ([193.246.253.137])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17MVLX-0007Iy-00
	for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2002 16:01:39 +0100
Date: Mon, 24 Jun 2002 17:01:38 +0200
From: Peter Keel <killer@discordia.ch>
To: linux-mtd@lists.infradead.org
Subject: Re: GRUB on DoC Millennium/2000 - Instructions
Message-ID: <20020624150138.GA4570@discordia.ch>
References: <200206181253609.SM02488@there>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200206181253609.SM02488@there>
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

Hello. 

First off, this is very well written; I like it. I got this far:

* on the Tue, Jun 18, 2002 at 12:55:17PM -0400, Mark Meade wrote:
> 9.  Verify GRUB boot
> 
> The PC should now boot from the DiskOnChip.  The BIOS may say something like 
> "Searching for boot record from Network...".  The first DoC messages 
> displayed should be:
> 
>         DoC Mil D000
>         Jumping to Grub
>         DiskOnChip Millennium found at d0000
> 
> Where D000 is the "window" described earlier.
> 
> When the boot process completes, there should be a "grub>" command line.  We 
> haven't installed a kernel or a "menu.lst" file on the DiskOnChip yet, so 
> this step is just to verify that the "grub_firmware" was installed correctly, 
> and that the DoC will boot.

Since I can't boot from NIC, I have it booting normal, like a disk. 
Everytime, that is. Now I can't change back to lilo on the harddisk.
I have no floppy of course. And I don't like soldering the DoC off.

> At this point, you can either reboot again, change the boot sequence back to 
> IDE (or whatever), and boot back into Linux.  Alternatively, if you know 
> where your kernel and root filesystem is on the hard drive, simply type 
> something like:
> 
>         kernel (hd0,0)/vmlinuz-doc root=/dev/hda2
>         boot

I'd love to. Of course, for some reason my grub can't read the 
filesystem on the disk. The Question now is: 

"If grub can't read the filesystem, how do I tell grub where the 
kernel resides, and how do I find this out where it is?". 

This probably belongs to some grub-mailinglist, but I don't feel like
subscribing one more mailinglist, and more importantly, I think it would
be nice to have that information included in this text as well. 

Right now I'm trying to reformat and setup the disk in another machine,
in the hope that "kernel (hd0,0)/vmlinuz-doc root=/dev/hda1\nboot"
will do the trick then; if not, I really need a solution as outlined 
above.. 

Cheers
Peter
-- 
Those who give up essential liberties for temporary safety deserve 
neither liberty nor safety. -- Benjamin Franklin
