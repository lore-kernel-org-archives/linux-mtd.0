Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 11zEYD-0005Ik-00
	for mtd-list@infradead.org; Sat, 18 Dec 1999 07:45:13 +0000
Received: from [216.211.97.50] (helo=gizmo.adis.on.ca ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 11zEY9-0005Ie-00
	for mtd@imladris.mvhi.com; Sat, 18 Dec 1999 07:45:11 +0000
Date: Sat, 18 Dec 1999 01:53:18 -0600 (CST)
From: Adi Linden <adi@adis.on.ca>
To: ralph stickley <ralph@datalux.com>
cc: Embedded <linux-embedded@waste.org>, MTD <mtd@imladris.mvhi.com>,
        Dvir Oren <dvir@lucidvon.com>
Subject: Re: DOC Script for booting 
In-Reply-To: <385A9C66.1C950DA4@datalux.com>
Message-ID: <Pine.LNX.4.10.9912180144030.9822-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Hi,

> 
> Adi, if this is useful, you can add this to your download page...
> 

I haven't tried it yet, but I added it in the Embedded_Build/script
directory. I also added the patched lilo from Dvir Oren but I haven't
build a package yet. Hope this is ok with both of you.

Also, I build a boot disk tonight. It's a single floppy system with a
monolithic kernel. It supports the ne2000 isa card (for the PCM-4823 SBC),
doc, ms-dos fat, ext2 and nfs. It also contains syslinux, the patched
lilo and fdisk but no ext2 tools (no room left). The kernel and ramdisk
could be ftp'd into the mounted flash (incl. ftp) or copied from a mounted
nfs volume.

I've got to work a bit on remote boot and the nfs root filesystem. All I
would need it to plug the SBC into the network and telnet into it once
it's booted. 

I am slowly getting somewhere with mtd. I am trying to upload it to the
sbc tomorrow evening and see if I can access the doc2000 with it...

TTYL,
Adi





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
