Received: from mtiwmhc22.worldnet.att.net ([204.127.131.47])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17IqKJ-000482-00
	for <linux-mtd@lists.infradead.org>; Fri, 14 Jun 2002 13:37:15 +0100
From: "Gregg C Levine" <hansolofalcon@worldnet.att.net>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: "'Studying MTD'" <studying_mtd@yahoo.com>
Subject: RE: why MTD model ? 
Date: Fri, 14 Jun 2002 08:36:29 -0400
Message-ID: <000201c213a0$1bf2fe80$8656580c@who>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1358.1024057316@redhat.com>
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

Hello from Gregg C Levine
I agree David with you on all points, except one. Regarding the
reliability of PCMCIA-ATA drives. I have a bunch here right now, and
they are proving to be more reliable then the disk drives I keep buying
from the same shop. The fact that the manufacturer decided to
discontinue them because of size, is irrelevant. The fact that they came
with a FAT-12 file system, and a partition to match is also irrelevant.
-------------------
Gregg C Levine hansolofalcon@worldnet.att.net
------------------------------------------------------------
"The Force will be with you...Always." Obi-Wan Kenobi
"Use the Force, Luke."=A0 Obi-Wan Kenobi
(This company dedicates this E-Mail to General Obi-Wan Kenobi )
(This company dedicates this E-Mail to Master Yoda )



> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org [mailto:linux-mtd-
> admin@lists.infradead.org] On Behalf Of David Woodhouse
> Sent: Friday, June 14, 2002 8:22 AM
> To: Studying MTD
> Cc: linux-mtd
> Subject: Re: why MTD model ?
>=20
>=20
> studying_mtd@yahoo.com said:
> >  If some how i solve these issues :-
> > 1. sector size
> > 2. erase/write
> > 3. wear levelling
>=20
> The core MTD API isn't there to solve those issues for you, only to
> represent the raw hardware -- and we have existing drivers for many
types of
> raw hardware.
>=20
> Those issues are solved by whatever _uses_ the MTD devices -- and
there are
> a number of solutions already implemented in the MTD code base. The
most
> sensible way to put a file system on flash is to use a file system
> especially designed for that purpose -- such as JFFS2. However, for
legacy
> reasons we also have code which uses MTD devices to emulate hard
drives, as
> for some strange and inexplicable reason you seem to want.
>=20
> In the days of DOS, it was difficult to add a real file system, so
instead
> people came up with a gross hack to make a flash device appear just
like a
> normal BIOS-supported disk drive.
>=20
> They designed a pseudo-filesystem which emulated a hard drive, and
then
> provided a BIOS extension which overrode the INT 13h (Disk BIOS)
interrupt
> handler. Then people would just use a FAT file system on it under DOS
as if
> it was a normal hard drive.
>=20
> When Windows started to gain its own 32-bit device drivers for hard
drives,
> the pseudo-filesystems that emulated hard drives were rewritten to run
> under Windows, but people were so used to the idea of a pseudo-fs
emulating
> a block device with a 'real' fs on top of that, that the opportunity
wasn't
> taken to make the whole thing sane just by having a proper file system
> directly on the flash.
>=20
> The only half-sane reason for using a translation layer to emulate a
block
> device like this is on removable media -- if you need to be able to
remove
> the flash device from your Linux box and read it in a DOS or Windows
box.
>=20
> If your flash isn't going to be removable, then you really don't want
to do
> it that way, for reasons which I've discussed at length quite
recently.
>=20
> You should be using a proper file system directly on the flash. This
is not
> DOS, and you don't have to repeat DOS-based mistakes.
>=20
> > Please let me know, which block device is closest to Flash memory :-
> > 1. Hard Disk 2. Floppy drive 3. PCMCIA memory card 4. Ramdisk 5. or
> > some other block device ?
>=20
> Your question is very ambiguous. You might as well ask which tropical
fish
> is closest to flash memory. No block device is _similar_ to flash --
they are
> entirely different beasts.
>=20
> I suppose the hard drive sitting on my desk with a pile of flash chips
on
> top of it is 'closest to Flash memory' in one way, but I suspect
that's not
> what you were asking.
>=20
> If you mean which block device is most similar in performance and
general
> operation to a system which uses flash to emulate a block device, then
the
> answer would be PCMCIA-ATA or CompactFlash cards -- because they _are_
> using precisely such a translation layer internally. The only
difference is
> that they do it internally, in firmware (and generally quite
unreliably).
>=20
> If you mean which block device driver code is most similar to the code
> you'd have to write to implement yet another translation layer, then
that
> would be something like the FTL or NFTL code -- they both use the
> underlying MTD drivers for the raw hardware, and perform their own
magic
> to present a block device implementation to Linux.
>=20
> --
> dwmw2
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
