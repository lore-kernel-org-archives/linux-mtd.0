Received: from www.ccimackay.com
	([203.52.109.14] helo=mail.ccimackay.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14xbLa-0003BL-00
	for <linux-mtd@lists.infradead.org>; Wed, 09 May 2001 22:18:15 +0100
Message-ID: <008e01c0d8cd$61530560$8264a8c0@dave>
From: "David Griffith" <dgriffith@ccimackay.com>
To: "Carson, Jon A." <JACarson@addcoinc.com>
Cc: <linux-mtd@lists.infradead.org>
References: <5B08DC7C9AA6D411930E00105A19794B3E2423@EXCHANGE>
Subject: Re: Booting Linux on 16 Meg DiskOnChip 2000
Date: Thu, 10 May 2001 07:16:57 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hi Jon,

RTFM! :-)

<whisper>
This is not an mtd issue.
You need to use rdev utility to let your freshly compiled kernel know which
drive/partition you want to load your rootfs from.
If you compile your kernel on your "Big" computer , it will generally point
to your boot device there... move your kernel somewhere else, and you get
the messages that you see.

Somthing like this :
    rdev KernelImageFile /dev/nftla1 (or whatever your mtd device/partition
shows up as in dev)

Then rerun lilo.

I get stung everytime I make a new kernel up for my webplayer. It boots and
.... ah, crud :-)


</whisper>


Regards,
    Dave

----- Original Message -----
From: "Carson, Jon A." <JACarson@addcoinc.com>
To: <linux-mtd@lists.infradead.org>
Sent: Thursday, May 10, 2001 5:22 AM
Subject: Booting Linux on 16 Meg DiskOnChip 2000


> Hi All,
>
> I need some help....HELP....as the subject line says, I am trying to boot
> Linux on a 16 Meg DiskOnChip 2000. Since I have a lot of information to
> give, this email will be a little terse,...sorry.
>
> I have (apparently) sucsessfully formatted, fdisk'ed and ext2
filesystem'ed
> it. The mount
> point I chose was /doc. I then put a directory hierarchy on it resembling
a
> Linux distro. At this
> point, I copied over the nftl* and mtd* drivers to /doc/dev.
>
> I built a kernel choosing to build in all of the MTD/NFTL drivers into the
> kernel ( not as modules ).
> The Kernel is version 2.4.3 was downloadded from ftp.kernel.org.
Everything
> seems to build
> great,...no whining.   I used lilo-mtd to install the new kernel into the
> DiskOnChip.
>
> The problem I am having is that the kernel can't seem to find the root
> filesystem on /dev/nftla1.  When the
> kernel finally comes to a screeching halt, the last 4 lines of output are:
>
> request module [block-major-3]: root fs not mounted
> VFS: cannot open root device "" or 03:03
> please append a correct "root=" boot option
> Kernel Panic: VFS: unable to mount root fs on 03:03
>
> I am really confused by this because nothing I have done points to this
> filesystem ( 03:03 aka /dev/hda3 ),
> although this just happens to be my main development hard drive.  Another
> interesting thing
> is that there appears to be a NULL string somewhere ( see line #2 above ).
>
> Here is my /doc/etc/lilo.conf:
>
> boot=/dev/nftla
> image=/doc/boot/docmtd243
> label=DOC-2.4.3-yaya
> root=/dev/nftla1
>
> Since I have instructed lilo to use /dev/nftla , I have not marked the
> partition as bootable ( primary partition #1 ).
>
> Here is my lilo incantation, whilst booted onto /dev/hda3, and having
> mounted the DOC:
>
> # cd /doc/sbin
> # ./lilo-mtd -v -C /doc/etc/lilo.conf -i /doc/boot/boot.b-mtd -m
> /doc/boot/map
>
> Here is what happens when the above incantation is executed, indented for
> clarity:
>
> Warning: /dev/nftla is not on the first disk
> Patched LILO for M-Systems' DiskOnChip 2000
> LILO version 21, Copyright 1992-1998 Werner Almesberger
>
> Reading boot sector from /dev/nftla
> Merging with /doc/boot/boot.b-mtd
> Boot image: /doc/boot/docmtd243
> Added DOC-2.4.3-yaya *
> /boot/boot.5D00 exists - no backup copy made.
> Writing boot sector.
>
> Everything seems to have gone well with lilo-mtd, but when the kernel
boots,
> it seems like it wants
> to phone home over to /dev/hda3.  If I hadn't disabled IDE in the kernel ,
> it would actually continue to
> boot the /dev/hda3 root filesystem.
>
> Please note the reference to "/boot/boot.5D00 exists - no backup copy
> made.".  This does not point
> to /dev/nftla ( as it should ) , but /dev/hda3.
>
> Is this a bug in lilo-mtd , or am I doing something wrong ?
>
> I follow this list somewhat regularly and I nave not seen much information
> on this subject.  If anybody out there
> has a good recipe for booting DiskOnChip 2000 as a stand alone item,
PLEASE,
> share it with me.
>
> Thanks in advance,
> Jon Carson
> ADDCO Inc.
>
>
>
>
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
