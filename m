Received: from smtp-out5.blueyonder.co.uk ([195.188.213.8])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AQnDe-0003P1-9l
	for <linux-mtd@lists.infradead.org>; Mon, 01 Dec 2003 12:32:02 +0000
Message-ID: <004f01c3b807$78dda7a0$6401a8c0@f87htyy9967774jjyuww2>
From: "stephen" <lcbr17306@blueyonder.co.uk>
To: <linux-mtd@lists.infradead.org>
References: 
	<002601c3b27b$62ca9130$6401a8c0@f87htyy9967774jjyuww2><00f801c3b79f$417dea80$0701000a@techmanager>
	<001201c3b800$ace02f70$6401a8c0@f87htyy9967774jjyuww2>
Date: Mon, 1 Dec 2003 12:34:32 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: booting from DOC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I just tested your patch on latest CVS (i think), maybe ill login to
CVS again and try:

patching file include/linux/mtd/nftl.h
patching file util/Makefile
Hunk #1 FAILED at 10
1 out of 1 hunk FAILED -- saving rejects to file util/Makefile.rej
patching file util/nftl_format.c
patching file util/nftldump.c

then:

make nftl_format

works fine!

btw also I tried to trace this error , having no previous experience in
LIST_HEAD structures I didn't really know what to look for, I sort of
figured that I needed to Initialise these structures somewhere was I correct
in this assumption?

kind regards

stephen

----- Original Message -----
From: "stephen" <lcbr17306@blueyonder.co.uk>
To: "Denis Dowling" <dpd@alphalink.com.au>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, December 01, 2003 11:45 AM
Subject: Re: booting from DOC


> Hi Denis,
>
> ye got it sussed now, I managed to patch correctly (i think this was the
> main problem) then the kernel I was using wouldn't load my root
filesystem,
> kept coming out with:
>
> VFS: unable to mount root filesystem on 5d:02
>
> i assumed that 5d = major number , 02 = minor number, so I figured that 02
> was referring to the correct partition number but was unable to read it,
so
> i re-compiled the kernel and the mtd drivers as 'built-ins', as soon as I
> did that I now have my partitions:
>
> nftla:
>
> nftla1, nftla2
>
> nftla1 is a 2MB partition /boot, contains my kernel image and menu.lst
(grub
> can read this no problem), nftla2 is 30 MB root filesystem, all I did was:
>
> rdev <kernelimage> /dev/nftla2
>
> I assumed this changed the ramdisk word in the kernel, plus of course I:
>
> ldconfig -r /mnt/rootfs
>
> which sits on /dev/nftla2 this sets up the root filesystem up for
libraries
> etc, also I had all to strip all my libraries, using:
>
> objcopy --strip-debug FROM TO
>
> most of this information can be found at:
>
> http://www.tldp.org/HOWTO/Bootdisk-HOWTO/index.html
>
> probably my favourite 'howto' apart from 'Beej's socket programming', hehe
>
> thanks for your advice,
>
> kind regards
>
> stephen
> ----- Original Message -----
> From: "Denis Dowling" <dpd@alphalink.com.au>
> To: "stephen" <lcbr17306@blueyonder.co.uk>
> Cc: "linux-mtd" <linux-mtd@lists.infradead.org>
> Sent: Monday, December 01, 2003 12:08 AM
> Subject: Re: booting from DOC
>
>
> >
> > ----- Original Message -----
> > From: "stephen" <lcbr17306@blueyonder.co.uk>
> > To: <linux-mtd@lists.infradead.org>
> > Sent: Monday, November 24, 2003 10:09 PM
> > Subject: booting from DOC
> >
> >
> > > Hi All,
> > >
> > > didn't get a reply from my last post , which was me rambling on a bit
> too
> > > much or my text sounds arrogant? (sorry if it does i am just a newbie)
> > >
> > > I've been reading Karim Yaghmours book, got much further now, maybe
> > someone
> > > can put me straight on a couple of things? (hopefully)
> > >
> > > first of all I managed to install grub using 'doc_loadbios' so it
> replaces
> > > the DOC's SPL , then I managed to use 'nftl_format' and formatted from
> > > memory address '98304' which isn't the size of the grub boot loader
but
> I
> > > assume represents '16384 + 81920' , '81920' being the last erase
offset,
> > > from here I managed to 'fdisk nftla' and created a new partition
> > > '/dev/nftla1', I can format this partition and safely read and write
> data.
> > I
> > > compiled all the DOC files as modules, I didn't patch the kernel I
> decided
> > > to use a clean '2.4.19' kernel' , I also couldn't compile the latest
CVS
> >
> > > tools ;/ so I went back to a previous snapshot
> > > 'Mtd-snapshot-20020708.tar.bz2' , this compiled fine (mainly I couldnt
> > > compile nftl_format and something to do with empty LIST_HEAD
> structures,>
> > blktrans.h with the latest CVS).
> > My last patch fixes this :-)
> >
> > > I also realised that 'grub-0.92' needed
> > > patching so i did that and repeated the steps with 'doc_loadbios' and
> > > realised the last erase offset was now '65536' so the boot loader is
> > smaller
> > > and my new partition begins at offset '81920', plus this should have
> > > contained 'ctrlbypass' as part of the grub compiled with patch.
> >
> > I cannot get ctrlbypass working with grub at the moment. Code looks
> correct
> > but always boots to the grub prompt even if I hold down the control key.
> > Very strange.
> >
> > >
> > > The grub loader boots from the DOC but stops at the grub prompt, how
do
> I
> > > get grub to boot my kernel image ?
> >
> > At the grub prompt type "kernel (" then TAB this should show all
> filesystems
> > that grub supports.
> >
> > > in karims book it talks about building a root filesystem and
> > > /boot/grub/menu.lst but I can't see how this can run without the
modules
> > > loaded needed by the kernel (e.g. docecc.o, doc2000.o etc) confused ;/
> ...
> >
> > It is grub that needs to know how to read /boot/grub/menu.lst not the
> > kernel. If you have applied the correct patches to grub then it should
be
> > able to read the ext2 partition and load the menu file. I am trying to
get
> > grub and DoC working at the moment so should be able to help you out
with
> > questions. Also have a look at
> > http://lakeshoremicro.com/diskonchip-grub-howto.html
> >
> > Regards,
> > Denis.
> >
> >
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
