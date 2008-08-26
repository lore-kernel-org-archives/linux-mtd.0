Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KXtwD-0000i3-2K
	for linux-mtd@lists.infradead.org; Tue, 26 Aug 2008 08:30:05 +0000
From: "Divyanshu Verma" <dverma@broadcom.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Date: Tue, 26 Aug 2008 01:29:15 -0700
Subject: RE: Regarding NAND driver based on PrimeCell Static Memory
	Controller (PL350 series)
Message-ID: <61AF4E60604DB348A69864027DF811501005778A29@SJEXCHCCR01.corp.ad.broadcom.com>
References: <20080711223448.f5826678.yoichi_yuasa@tripeaks.co.jp>
	<20080711141053.GD13593@linux-mips.org>
	<1215797959.11567.448.camel@pmac.infradead.org>
	<E06E3B7BBC07864CADE892DAF1EB0FBD095146C0@NT-SJCA-0752.brcm.ad.broadcom.com>
	<1216045603.27455.25.camel@shinybook.infradead.org>
In-Reply-To: <1216045603.27455.25.camel@shinybook.infradead.org>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
I finally got the NAND as MTD device, by providing blank hw_control functio=
n and providing my SOC specific read/write functions.
It passes nand_scan successfully and shows up  as an mtd device under /proc=
/mtd.

But when I try to cat NAND device, ( without any filesystem mounte)d  it cr=
ashes.

I traced down the sequence and found that, on doing "cat" it issues a read =
512 bytes ( for 8 consecutive sectors not sure why??).
The low level read command then gets 2048 bytes from the NAND chip and puts=
 it in NAND controller memory( page size of NAND is 2K).After that it tries=
 to read 512 bytes into mtd buffer ( sent from mtdblock.c) but falls in bet=
ween giving following oops message.

Unable to handle kernel NULL pointer dereference at virtual address 0000007=
8
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c
pgd =3D 0000d67c
Unable to handle kernel paging request at virtual address 0000d67c


Any pointer to  solve this will be highly appreciated.


Regards,
Divyanshu
-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]
Sent: Monday, July 14, 2008 7:57 PM
To: Divyanshu Verma
Cc: linux-mtd
Subject: Re: Regarding NAND driver based on PrimeCell Static Memory Control=
ler (PL350 series)

On Mon, 2008-07-14 at 03:33 -0700, Divyanshu Verma wrote:
> I am trying to implement a NAND driver for our SOC. The problem I am
> facing is that, our NAND controller does not allow me to have access to
> hardware specific control line. In other words, I cannot follow the
> mechanism given on http://www.linux-mtd.infradead.org/ for NAND driver
> as I cannot write  "my_nand_hwcontrol"  function. The H/w guys say that
> all this is taken care in the controller itself.
>
> I then decided to identify the NAND Chip as a MTD_BLOCK device, so that
> I  will not require any Hwcontrol function. Now for doing so, is it
> possible to write a kernel module for NAND which can use functions
> exported by mtd/mtd_blkdevs.c ?

It sounds like it isn't 'NAND' at all, as far as you're concerned. It's
a disk drive of some form. Usually these things present themselves as
IDE, so you'd use the IDE driver. If it has its own 'special' interface
then you probably want a dedicated block driver for it; nothing to do
with the MTD subsystem at all.

--
dwmw2
