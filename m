Received: from [208.178.55.66] (helo=server.activmedia.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17Hpjo-0008AB-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Jun 2002 18:47:24 +0100
Date: Tue, 11 Jun 2002 13:46:53 -0400 (EDT)
From: Matt Vestal <vestal@activmedia.com>
To: Dzuy Nguyen <dzuy@infinity-studios.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 and Grub
In-Reply-To: <3D0624E4.5060007@infinity-studios.com>
Message-ID: <Pine.LNX.4.21.0206111311350.31856-100000@server.activmedia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Thanks for the reply.  I had read that in previous posts, and made sure to
leave enough space.

../util/doc_loadbios /dev/mtd0 grub_firmware 

Performing Flash Erase of length 16384 at offset 0
Performing Flash Erase of length 16384 at offset 16384
Performing Flash Erase of length 16384 at offset 32768
Performing Flash Erase of length 16384 at offset 49152
Performing Flash Erase of length 16384 at offset 65536
Performing Flash Erase of length 16384 at offset 81920
Writing the firmware of length 88544 at 0... Done.

So I did an nftl_format /dev/mtd0 98304.  I've also tried using 114688,
just to make sure.

Also, the partition table gets easily corrupted.  Here's what I got on a
recent reboot.  I had started at cylinder 2 in case it was overlapping
something in the firmware.

[~]$ fdisk /dev/nftla
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF
disklabel
Building a new DOS disklabel. Changes will remain in memory only,
until you decide to write them. After that, of course, the previous
content won't be recoverable.


Command (m for help): p

Disk /dev/nftla: 16 heads, 12 sectors, 1022 cylinders
Units = cylinders of 192 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1      12453227  21715648 889192448   ff  BBT
Partition 1 has different physical/logical beginnings (non-Linux?):
     phys=(1023, 232, 60) logical=(12453226, 9, 11)
Partition 1 has different physical/logical endings:
     phys=(389, 255, 24) logical=(21715647, 15, 2)
Partition 1 does not end on cylinder boundary:
     phys=(389, 255, 24) should be (389, 15, 12)
/dev/nftla3   ?   6313488   4245801 1948985768   48  Unknown
Partition 3 has different physical/logical beginnings (non-Linux?):
     phys=(592, 88, 11) logical=(6313487, 2, 1)
Partition 3 has different physical/logical endings:
     phys=(583, 82, 11) logical=(4245800, 13, 12)
Partition 3 does not end on cylinder boundary:
     phys=(583, 82, 11) should be (583, 15, 12)
/dev/nftla4   ?  11218423  11218573     14375+  83  Linux
Partition 4 has different physical/logical beginnings (non-Linux?):
     phys=(1023, 255, 63) logical=(11218422, 5, 5)
Partition 4 has different physical/logical endings:
     phys=(133, 196, 32) logical=(11218572, 1, 3)
Partition 4 does not end on cylinder boundary:
     phys=(133, 196, 32) should be (133, 15, 12)

Partition table entries are not in disk order

Command (m for help): q

[~]$ e2fsck /dev/nftla1
e2fsck 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
/dev/nftla1: clean, 2372/24576 files, 31540/98016 blocks
[~]$ fdisk /dev/nftla

Command (m for help): p

Disk /dev/nftla: 16 heads, 12 sectors, 1022 cylinders
Units = cylinders of 192 * 512 bytes

     Device Boot    Start       End    Blocks   Id  System
/dev/nftla1             2      1022     98016   83  Linux

Command (m for help): 


On Tue, 11 Jun 2002, Dzuy Nguyen wrote:

> It's possible that the grub_firmware and the nftl are overlapping.  When 
> run doc_loadbios,
> observe the number of bytes written into DoC.  It should be the size of 
> the grub_firmware.
> I'd add a couple of blocks (erase size) to that as the offet in nftl_format.
> 
> Matt Vestal wrote:
> 
> >I 'm having the same problem as others who have posted, in getting the
> >"Selected disk does not exist" error.  I'm using a 96MB DOC with a
> >VersaLogic VSBC-8 motherboard.
> >
> >-using Grub 0.92
> >-patched with grub-2002-02-19-doc.patch
> >-ran "aclocal && automake && autoconf"   (needed automake-1.5-8)
> >-./configure --enable-diskonchip-2000 --enable-ext2fs
> >-../util/doc_loadbios /dev/mtd0 grub_firmware
> >-./nftl_format /dev/mtd0 98304
> >-fdisk /dev/nftla into multiple portions.  also tried leaving it full
> >-mke2fs
> >-copy over necessary files (kernel and such)
> >-reboot
> >
> >The DOC loads Grub with no problem.  However, Grub has never been able to
> >see the DOC filesystem(s).  I've tried root (dc0), root (dc0,0), root
> >(dc0,1), etc, but nothing works.  I always get the "Selected disk does not
> >exist, error"
> >
> >Any help would be greatly appreciated, as I've been pouring over this for
> >days, now.
> >
> >Thanks,
> >
> >Matt
> >
> >
> >
> >______________________________________________________
> >Linux MTD discussion mailing list
> >http://lists.infradead.org/mailman/listinfo/linux-mtd/
> >
> >
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
