Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPUDH-0006Ar-Nf
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 07:43:04 +0000
Date: Wed, 2 May 2012 09:42:58 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
In-Reply-To: <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2 May 2012, Thilo Fromm wrote:

> > I'm on a TI embedded system on kernel 2.6.37. Could you please fill me
> > in on the current state of readonly filesystems living in NAND flash
> > w/ bad blocks? I've found several discussions on linux-mtd over the
> > years[1][2][3] but none seemed to have reached a conclusion. The point
> > is this, while both bootloader and nandwrite will happily skip bad
> > blocks encountered upon image write the MTD driver's read function
> > will not.
> >
> > This means I can safely write the root fs into a MTD partition, but I
> > cannot read it back safely (let alone mount it). Is there a generic
> > way to have the MTD driver auto-skip bad blocks? What happened to
> > MTD_BLOCK_RO_BBFREE?
> >
> > [1] http://lists.infradead.org/pipermail/linux-mtd/2004-May/009672.html
> > [2] http://lists.infradead.org/pipermail/linux-mtd/2004-May/009683.html
> > [3] http://lists.infradead.org/pipermail/linux-mtd/2006-November/016835=
=2Ehtml
> >
>=20
> Is no-one else using read-only filesystems in NAND flash w/ bad blocks
> in it? Do I miss something obvious? Help?

It is true that read-only file systems such as cramfs cannot in the=20
general case operate on nand flash because of the bad blocks issue.

One way is to use a file system intended for flashes, but mount it=20
read-only. I.e. use a jffs2 filesystem, mounted readonly.

Or, let UBI handle the flash, and use ubifs in a static volume, which=20
means it will be non-writable. Last time I checked it wasn't possible to=20
use file systems such as cramfs on UBI, because UBI did not supply a block=
=20
device which is required by cramfs. I seem to remember some patch to add=20
block devices to UBI, not sure what the state of that is.

A slightly different solution is to have the root file system as an=20
initramfs, stored with the kernel. That way, you unpack a large=20
kernel+rootfs image to memory and run it there. It tends to be a bit=20
wasteful on both flash and RAM though. Also, the file system is always=20
writable, but of course any writes are not mirrored back to the flash.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
