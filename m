Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173fEs-0005JM-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 16:44:54 +0100
Received: from diva.localdomain (host213-122-43-243.in-addr.btopenworld.com [213.122.43.243])
	by sparta.scl.co.uk (8.9.3/8.9.3) with ESMTP id QAA11583
	for <linux-mtd@lists.infradead.org>; Fri, 3 May 2002 16:44:51 +0100
Received: from diva.localdomain (IDENT:root@diva.localdomain [192.168.1.1])
	by diva.localdomain (8.12.2/8.12.2) with SMTP id g43FjxQ1014457
	for <linux-mtd@lists.infradead.org>; Fri, 3 May 2002 16:45:59 +0100
From: John Sutton <john@scl.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: Booting from DOC2000 with GRUB loader
Date: Fri, 3 May 2002 14:40:49 +0100
Content-Type: text/plain
References: <02050120383503.07252@diva.localdomain> <02050209075601.08259@diva.localdomain> <1020331947.19824.3160.camel@russ>
In-Reply-To: <1020331947.19824.3160.camel@russ>
MIME-Version: 1.0
Message-Id: <02050315580600.13762@diva.localdomain>
Content-Transfer-Encoding: quoted-printable
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

Ah, sweet success!

After a number of you made clear that you'd already blazed this trail, I
took the plunge and commented out the "I'm confused" check in nftl_format=
,
and ran it:

[root@spartam util]# ./nftl_format /dev/mtd0 98304
$Id: nftl_format.c,v 1.17 2001/08/29 14:28:48 dwmw2 Exp $
Phase 1. Checking and erasing Erase Zones from 0x00018000 to 0x01000000
Skipping bad zone (factory marked) #672 @ 0xa80000
        Checking Zone #1023 @ 0xffc000
Phase 2.a Writing NFTL Media Header and Bad Unit Table
Phase 2.b Writing Spare NFTL Media Header and Spare Bad Unit Table
Phase 3. Writing Unit Control Information to each Erase Unit

All looks good to me, and the stuff about skipping factory marked zones
and writing bad unit tables certainly give the impression that it knows
what it's doing!  So my previous concern re "You have erased the badblock
table on that DOC and it is no logner good for production" was probably
misplaced?  Anyway, in my application, once I've put this thing to bed, I
only expect to have to rewrite a small part of the doc, and only that say
half a dozen times in the lifetime of the system.  So with an expected
minimum rewrites of 100,000 (according to M-systems web site), I'm surely
in the clear.

After that I fdisked /dev/nftla and set up partitions, mke2fs, mkdir
/boot, put a kernel in it, mkdir /boot/grub and put a menu.lst in there,
reboot, bingo!

I realise with the benefit of hindsight that to avoid the danger of endin=
g
up with an unbootable system when doing the nftl_format, all that's
necessary is to always follow it with (another) doc_loadbios.  So, even i=
f
you can't figure out the numbers exactly, you'll get there eventually by
trial and error.

Some outstanding oddities with my grub on DoC:

1) At the command line (at least) the backspace key seems to have gotten
munged?  It seems to be emitting a single ^H rather than ^H<space>^H so
it's not clear that you've actually deleted a character (but you have).=20
Maybe this is the same with vanilla grub (i.e. without mtd patch) but I
didn't notice it before?

2) More disconcerting, the TAB completion of valid devices in the "root"
command does not wholly recognise the "dc" prefix.  The behaviour, which
is rather complex, is as follows:

root (      hit TAB sees only my scsi disks hd0 and hd1
root (d
root (dc    hit TAB both give errors
root (dc0   hit TAB its happy with but it doesn't give you the comma
root (dc0,  hit TAB now its motoring!  It's shows me my 2 partitions 0 an=
d
1 and, once I've selected one, TAB completion of filenames in the
partition when using the "kernel" command works fine.

Maybe both of these problems arise from the fact that I applied the lates=
t
mtd patch (grub-2002-02-19-doc.patch) against a *later* grub source
(0.92)?  A few of the hunks were "shifted" (applied at different line
numbers) but they did stick.

Here are a few observations on the whole process which haven't come up
(explicitly at least) in this thread so far and which might be of help to
others:

1)  I've you've already gotten lilo going on your doc and are now trying
to get grub going, note the crucial difference: when you put grub on
the doc as opposed to putting it on a floppy or hard disk, you are puttin=
g
both stage1 AND stage2 on there.  Which is nice once you've understood
that ;-)  But if (like me) you thought you were just putting a 512 byte
boot loader on the grub which then knows the address of an mtd-aware
stage2 stored in an nftl partition, then it comes as a rather rude surpri=
se
to find that you've trashed your existing efforts.

2)  Related to 1 (and here I'm only clear about the generalities and not
the details), note that the nftl format which exists on the doc when you
take it out of the wrapper - which is put on there by M-systems - is not
the same thing as that which you end up with (and need) to use grub.=20
Quite why we've got 2 different implementations of this format on the go,=
 I
don't know, but I became aware of it rather painfully ;-).

I started with the 2.4.18 kernel sources and using the help in make
menuconfig put together a kernel which looked like it would do the job.=20
And it did, so far as it went - on booting the kernel I could see the
chip, fdisk /dev/nftla, mke2fs, everything sorted.  But then (no big
surprise) I found that vanilla lilo couldn't deal with it, so I downloade=
d
M-systems patched lilo, installed that and everything looked good.  The
point here however is that up to this point I am still using the nftl
format put on there by M-systems.  Once you want to have a go with grub,
this is no good.  (Presumably precisely because the mtd-patched grub
insists on putting stage2 onto the doc thus trashing this existing format=
?
 Can't see why you couldn't have a "standard" grub installation which
would only need to overwrite 512 bytes like lilo does?  Not that that
would have much merit in itself.)

Anyway, upshot of all this is that the kernel I'd built (and which I'd
imagined was everything needed because this far it had done everything
required of it) was no good because I'd omitted CONFIG_MTD_CHAR.  So when=
 I
tried doc_loadbios /dev/mtd0 it wouldn't work because there was nothing
listening. (Cannot open device, or something like that.)  After some
digging about in the kernel sources, I realised what was missing, built a
new kernel, ran doc_loadbios and THEN, when I saw it erasing 96k instead
of 512 bytes, the penny finally dropped!

Here are the kernel config options which I've ended up with for my DoC200=
0
chip (and with everything paranoid switched on ;-) :

CONFIG_MTD=3Dm
CONFIG_MTD_CHAR=3Dm
CONFIG_NFTL=3Dm
CONFIG_NFTL_RW=3Dy

CONFIG_MTD_DOC2000=3Dm
CONFIG_MTD_DOCPROBE=3Dm
CONFIG_MTD_DOCPROBE_ADDRESS=3D0

CONFIG_MTD_NAND=3Dm
CONFIG_MTD_NAND_ECC=3Dy
CONFIG_MTD_NAND_VERIFY_WRITE=3Dy

I started off with all this built in the kernel rather than as modules bu=
t
was getting fed up with docprobe (CONFIG_MTD_DOCPROBE) making a mess of m=
y
console and syslog.  And on reading docprobe.c turns out that this probin=
g
process is sometimes dangerous as well as messy, so I changed to building
as modules because then you can pass a single address in modules.conf:

options docprobe doc_config_location=3D0xcc000

Of course, YMMV in respect of the particular address at which your chip
presents itself.  (Mine is set with jumpers on the motherboard).  No doub=
t
this will end up being available as a kernel parameter in due course but
as best I can tell it has to be a module option at present.

So, happy grubbing and many thanks to all.  Hopefully I'll get this damn
thing out of the door pretty soon and will not be bugging you guys any
longer, but I'd be pleased to give assistance to any newbies out there.=20
But note, I'm not subscribed to the list so be sure to copy any post to m=
e
john@scl.co.uk if you think I can help you.

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
