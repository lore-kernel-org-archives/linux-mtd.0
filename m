Received: from mail22.messagelabs.com ([193.109.255.115])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VVpz-0007Sk-Mi
	for <linux-mtd@lists.infradead.org>; Thu, 26 Jun 2003 13:26:51 +0100
Received: from stevejunior (unknown [192.168.200.17])
	by netstar.stirling-dynamics.com (Postfix) with SMTP id 963799802
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Jun 2003 13:26:15 +0100 (BST)
Message-ID: <007201c33bde$3d3be5e0$11c8a8c0@stevejunior>
From: "Stephen Brown" <sbrown@stirling-dynamics.com>
To: <linux-mtd@lists.infradead.org>
References: <000f01c33bd2$2a579660$11c8a8c0@stevejunior>
	<1056625602.27553.73.camel@passion.cambridge.redhat.com>
Date: Thu, 26 Jun 2003 13:26:58 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: quick question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

its a DOC 2000 , onboard 8 MB, it resides on the p5e module, Ampro have
specifically changed the hardware to suit their SBC, which includes a bios
copy from eprom, they provide utility tools similar to the 'm-sys' ones,
except are specifically designed for Ampro, if you use the 'm-sys' tools the
SBC won't boot as 'im assuming' the bios cannot be copied from eprom as the
first bios screen wont load, this creates a DOS partition as well as a bios
area stored close to the boot sector.

1st problem is, compiling the kernel for the Ampro p5e module takes a good
half day!!
2nd problem, the preparation for a standard 'm-sys DOC' is not the same as
in the specific tools that are written for the p5e module.

I tried quite a few different kernel compiles ( include MTD - etc etc - also
tried the ones default with kernel 2.4.4 and the latest ones from web ) to
try and make the DOC compatible with the real-time linux kernel, recompiled
with RTLinux pre-1, but couldnt get it to work, this takes up a lot of time!
so.. i opted to load the RTLinux kernel and root filesystem from the DOS
partition, that resides on the p5e module, using 'loadlin' , this loads into
memory using initrd as the p5e module has 32 MB sdram,

the system is finished and I am happy with its performance but ...  looking
ahead into the future 'if' the hardware has to stay the same it would be
nice to have a non-volatile area so to store network information etc,
instead at the moment I can change on the fly, until I power down, or... I
can create a new ROOT filesystem (*.gz) , change a few scripts etc, for
permanent changes.

I cannot recompile the kernel for Red Hat 7.2 and RTLinux to include ext3
fs, so I have learned to live with it as ext2.

This is why I have an interest in the 'IDE PRO' if maybe it can provide a
solution via the IDE bus, without a lot more time consuming kernel
compiling, the other option was a seperate DOC from 'm-sys' that could
interface with our pc-104 stack which Im assuming would require me to
recompile the kernel, which in turn would have a knock on effect to my
development PC and all modules compiled for the target p5e etc etc... blah
blah...    i dont mind doing it but obviously an alternative would be better
, while we are tied with the current hardware..

kind regards

stephen
----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Stephen Brown" <sbrown@stirling-dynamics.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, June 26, 2003 12:06 PM
Subject: Re: quick question


> On Thu, 2003-06-26 at 12:00, Stephen Brown wrote:
> > Hi all,
> >
> > what do you all think about this:
> >
> >
http://www.m-sys.com/content/products/product.asp?PID=17&FILE=DOCIdePro&FAM=
> > doc
> >
> > if I used this as a standard IDE device does this mean that I wouldn't
> > require any MTD drivers for linux and just use the standard IDE?
> >
> > if so could I format this as EXT2 fs and contain my ROOT file system on
it?
> > or would I still run the risk of power failure disk error etc?
>
> You'd want EXT3 not EXT2, presumably, but yes -- it should just work.
>
> You still have the same fundamental problem that you're running a
> journalling file system atop a journalling pseudo-filesystem which
> emulates a block device, but unlike the reports I've heard about most
> CompactFlash devices, I'd expect that M-Systems have at least managed to
> make the firmware within the device itself reliable w.r.t.
> power-failure.
>
> >  I mean I can load my ROOT fs into memory so thats not a problem, see
the
> > thing is at the moment I can't get the MTD drivers to work with the
onboard
> > 'Msys D-O-C' on an Ampro p5e module, reason being is Ampro use part of
the
> > FLASH to store the bios for the ampro board and have specific tools for
> > formatting etc,
>
> That's interesting... can you describe the problems? Precisely what type
> of DiskOnChip is it, is it detected correctly by the hardware driver? Is
> it only the NFTL code which is unhappy? etc.
>
> --
> dwmw2
>
>
> ________________________________________________________________________
> This e-mail has been scanned for all viruses by Star Internet. The
> service is powered by MessageLabs. For more information on a proactive
> anti-virus service working around the clock, around the globe, visit:
> http://www.star.net.uk
> ________________________________________________________________________
>

----- Original Message -----
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Stephen Brown" <sbrown@stirling-dynamics.com>
Cc: <linux-mtd@lists.infradead.org>
Sent: Thursday, June 26, 2003 12:06 PM
Subject: Re: quick question


> On Thu, 2003-06-26 at 12:00, Stephen Brown wrote:
> > Hi all,
> >
> > what do you all think about this:
> >
> >
http://www.m-sys.com/content/products/product.asp?PID=17&FILE=DOCIdePro&FAM=
> > doc
> >
> > if I used this as a standard IDE device does this mean that I wouldn't
> > require any MTD drivers for linux and just use the standard IDE?
> >
> > if so could I format this as EXT2 fs and contain my ROOT file system on
it?
> > or would I still run the risk of power failure disk error etc?
>
> You'd want EXT3 not EXT2, presumably, but yes -- it should just work.
>
> You still have the same fundamental problem that you're running a
> journalling file system atop a journalling pseudo-filesystem which
> emulates a block device, but unlike the reports I've heard about most
> CompactFlash devices, I'd expect that M-Systems have at least managed to
> make the firmware within the device itself reliable w.r.t.
> power-failure.
>
> >  I mean I can load my ROOT fs into memory so thats not a problem, see
the
> > thing is at the moment I can't get the MTD drivers to work with the
onboard
> > 'Msys D-O-C' on an Ampro p5e module, reason being is Ampro use part of
the
> > FLASH to store the bios for the ampro board and have specific tools for
> > formatting etc,
>
> That's interesting... can you describe the problems? Precisely what type
> of DiskOnChip is it, is it detected correctly by the hardware driver? Is
> it only the NFTL code which is unhappy? etc.
>
> --
> dwmw2
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> ________________________________________________________________________
> This e-mail has been scanned for all viruses by Star Internet. The
> service is powered by MessageLabs. For more information on a proactive
> anti-virus service working around the clock, around the globe, visit:
> http://www.star.net.uk
> ________________________________________________________________________
>


________________________________________________________________________
This e-mail has been scanned for all viruses by Star Internet. The
service is powered by MessageLabs. For more information on a proactive
anti-virus service working around the clock, around the globe, visit:
http://www.star.net.uk
________________________________________________________________________
