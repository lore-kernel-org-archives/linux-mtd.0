Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13lCEs-000640-00
	for mtd-list@infradead.org; Mon, 16 Oct 2000 16:31:46 +0100
Received: from ip-209-85-210-55.keyway.net ([209.85.210.55] helo=localhost.localdomain)
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13lCEq-00063u-00
	for mtd@infradead.org; Mon, 16 Oct 2000 16:31:44 +0100
Received: (from kevin@localhost)
	by localhost.localdomain (8.9.3/8.9.3) id IAA29205
	for mtd@infradead.org; Mon, 16 Oct 2000 08:34:26 -0700
Date: Mon, 16 Oct 2000 08:34:26 -0700
From: Kevin Moore <kevin@moore-and-moore.com>
To: mtd@infradead.org
Subject: Re: Grub support in DiskOnChip.
Message-ID: <20001016083426.A29185@flapjack>
Reply-To: kevin@moore-and-moore.com
References: <31553.971082474@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <31553.971082474@redhat.com>; from dwmw2@infradead.org on Mon, Oct 09, 2000 at 02:07:54 -0700
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 09 Oct 2000 02:07:54 David Woodhouse wrote:
> 
> Grub doesn't yet support the DiskOnChip Millennium. It shouldn't be 
> difficult to fix that, it's just that I did my development on DiskOnChip 
> 2000.
> 
> First you need to add Millennium support to Grub itself - you can boot Grub
> from a floppy to test this. Once Grub can detect and read the DiskOnChip,
> you also need to add Millennium support to the Grub loader found in the 
> grub/ directory of my CVS tree. 
> 

I now have grub successfully detecting the DoC Millennium and (almost)
booting the kernel.  Everything goes great until the kernel looks
for a filesystem, at which point it says:

Kernel panic: I have no root and I want to scream

This is with the same kernel that works fine for access to the DoC
when booted off the hard drive (all built-ins, no modules).  The mtd
files are from a cvs checkout I made on 7 October.  The grub commands
I use are:

root (dc0,0)
kernel /boot/vmlinuz-2.4.0-test9 root=/dev/nftla1
boot

The flash chips are detected fine during boot-up and 4 lines above
the kernel panic I see:

 nftla: nftla1

Also, the /dev directory on the DoC is populated.  If I specify the
root as "root=/dev/hda1", then I can boot using the kernel on the
DoC and the root filesystem on the hard drive.  It seems like I'm
close.

Three questions:
- Does anybody have suggestions on what the problem is or how to
  debug this?  Could I be leaving the DoC in a bad state exiting
  grub even though the kernel seems to detect it okay?
- Thinking past this, does anybody have suggestions on what needs
  to be changed in the grub loader to support DoC Millennium?  I've
  not done much x86 assembly, but I'm willing to give it a shot.
- I've gotten this far by looking at doc2000.c, doc2001.c, and nftl.c
  from the kernel driver.  I saw many comments starting with "see
  software requirement..."  I've searched the M-systems website,
  and haven't found any docs that look like this.  Can somebody
  point me to the proper documentation?

thanks,

Kevin



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
