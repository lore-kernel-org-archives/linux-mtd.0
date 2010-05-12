Received: from moutng.kundenserver.de ([212.227.126.171])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OC9zx-0001hZ-TO
	for linux-mtd@lists.infradead.org; Wed, 12 May 2010 11:21:10 +0000
From: Thorsten =?iso-8859-1?q?M=FChlfelder?= <muehlfelder@enertex.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Some questions on bit-flips and JFFS2
Date: Wed, 12 May 2010 13:21:07 +0200
References: <201005031505.18604.muehlfelder@enertex.de>
	<201005110959.36213.muehlfelder@enertex.de>
	<Pine.LNX.4.64.1005111131220.15631@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1005111131220.15631@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <201005121321.07822.muehlfelder@enertex.de>
Cc: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Tuesday 11 May 2010 11:35:07 schrieb Ricard Wanderlof:
> On Tue, 11 May 2010, Thorsten M=FChlfelder wrote:
> > But unfortunately the Sam-Ba 2.5 tool has a bug: it uses different bad
> > block table structure and Linux refuses to read/write every block, that
> > was written by Sam-Ba 2.5 because it recognizes them as bad blocks.
> > So for now I have no idea what I can do to reduce the failing rate.
>
> I don't know if this is a good way, but you could patch your kernel so it
> doesn't stop you from erasing/writing badblocks.=20

So the only way to get bad blocks erased (scrubbed) in Linux is to have a=20
patched kernel? This would be a problem, because I don't know any way of=20
getting a new kernel to already deployed systems without deleting the Sam-b=
a=20
bad blocks before.
BTW: Atmel FAQ says the following about it:
> SAM-BA v2.6 and NandFlash bad block management
>
> Question:
> SAM-BA v2.6 finds a lot of bad blocks when erasing or programming the
> NANDFLASH memory. Is it normal? How should I handle them?=20
>
> Answer:=20
> This case usually appears when SAM-BA v2.5 (or older) was used to program
> the NandFlash on the AT91SAM9260-EK or AT91SAM9263-EK boards.
>
> The blocks are not really bad, but data (especially ECC bytes) was written
> in the spare area bytes reserved to tag bad blocks. So SAM-BA v2.6 detects
> them as bad. To solve this problem and get an empty NandFlash without bad
> blocks, follow these steps :
>
> - launch SAM-BA v2.6 GUI
> - in the NANDFLASH tab, select the 'NandFlash Init' script and execute it
> - in the TCL shell part of the GUI, type :
> '::NANDFLASH::EraseAllNandFlashFull' WARNING : this procedure will erase
> all data AND bad block tags too (spare area zones), thus manufacturer bad
> block tagging will be lost.
>
> If you know which blocks were tagged bad by the manufacturer, you can
> manually tag them again by typing '::NANDFLASH::TagBadBlock <block_number=
>'
> in the SAM-BA TCL shell.

So IMHO there are only 2 options:
=2D Within a running Linux remove/erase all bad blocks from beginning of ke=
rnel=20
image to end of the partition, test the erased area with nandtest and mark=
=20
real bad blocks as bad, write the new kernel image to the right address aga=
in
=2D Or write some tool, that can distinguish between real bad blocks and th=
e=20
Sam-ba 2.5 created bad blocks, unmark the false bad blocks. But perhaps thi=
s=20
is not possible at all.=20

Perhaps somebody knows where I can find detailed information about=20
these "spare area bytes reserved to tag bad blocks"? As far as I understand=
=20
this is the OOB area, which is 64 bytes on my NAND:
/mtd_debug info /dev/mtd0
mtd.type =3D MTD_NANDFLASH
mtd.flags =3D MTD_CAP_NANDFLASH
mtd.size =3D 10485760 (10M)
mtd.erasesize =3D 131072 (128K)
mtd.writesize =3D 2048 (2K)
mtd.oobsize =3D 64=20
regions =3D 0

Is the OOB part of a page or does each page have an extra OOB (2048+64 byte=
s)?
Is the OOB located at the beginning or at the end of each page?

Sorry for bothering you with all these questions,
Thorsten

> Then you could write your=20
> own application which checks for bad blocks in the same way that the
> Sam-Ba 2.5 tool does, which would allow you to rewrite everything written
> by that tool.
>
> > At least there is still no board using Samsung flash that has failed and
> > I hope all problems are related to the Micron flash.
>
> Even if you are not using jffs2, mtd will still perform single-bit error
> correction thanks the the ECC algorithm, so you need to be unlucky enough
> and get two bitflips within a 256 byte region for the system to fail.
>
> /Ricard
