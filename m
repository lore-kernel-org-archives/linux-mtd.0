Received: from sparta.scl.co.uk ([212.38.81.5] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 170qcf-0008V9-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2002 22:17:49 +0100
From: John Sutton <john@scl.co.uk>
To: Ilguiz Latypov <ilatypov@superbt.com>
Subject: Re: Booting from a DiskOnChip2000
Date: Thu, 25 Apr 2002 15:42:53 +0100
Content-Type: text/plain
References: <Pine.LNX.4.44.0204241513350.21843-100000@server.superbt.com>
In-Reply-To: <Pine.LNX.4.44.0204241513350.21843-100000@server.superbt.com>
Cc: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Message-Id: <02042517121200.20601@diva.localdomain>
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

Hi Ilguiz

Many thanks for that - I'm now much clearer what I'm doing ;-)

And I've succeeded!  The problem was only that the standard lilo doesn't =
work
with DoC.  I hadn't realised until you mentioned it that M-Systems provid=
e a
patched lilo on their web site!  I had just built a standard kernel (2.4.=
18)
with all the right bits enabled and thought that would be enough.  And it
is, apart from lilo...  Anyway, I've now downloaded M-System's patched li=
lo and
this works fine.  But it's worth noting that you still have to explicitly
specify the geometry in the lilo.conf file (as below), but that is not
difficult because everything you need to know is available just by runnin=
g
fdisk on /dev/nftla.

Thanks again
John

On Wed, 24 Apr 2002, you wrote:
> John,
>=20
> Sorry if I misunderstood you, but you installed the lilo bootloader int=
o
> DiskOnChip.  As you found, lilo needs BIOS disk number to talk to the=20
> device.  The same is true for GRUB as the latter doesn't have the IDE=20
> drivers built in.
>=20
> The M-System's DiskOnChip is shipped with the BIOS driver programmed in=
to
> the flash memory.  The driver gets activated during BIOS initialization=
=2E =20
> The M-System's lilo usage model assumes that BIOS will attempt to load =
the
> lilo image in the same way as BIOS would load the master boot sector of=
f
> the hard disk. =20
>=20
> The above startup scheme is possible because the M-System's drivers are
> already hooked to the BIOS INT 13h disk access call when BIOS wants to=20
> load the first sector off the bootable medium.
>=20
> So your attempt to load the kernel off DiskOnChip with lilo may succeed=
 as
> long as you keep the M-System's boot area of the flash chip intact.  I
> think the problem with lilo you mentioned is due to different default B=
IOS
> disk number/geometry specified by you and the configuration of the
> M-System's driver.  You may need to consult M-System's documentation pa=
per
> on its MS-DOS-based formatting software.
>=20
> Once the Linux kernel is started, accessing a filesystem installed on t=
op
> of NFTL layer can be possible by means of the M-System's Linux driver
> *and* by the MTD doc2000.c/nftl.c drivers *but* not by both.
>=20
> Ilguiz
>=20
> On Wed, 24 Apr 2002, John Sutton wrote:
>=20
> > disk=3D/dev/nftla
> >         bios=3D0x80
> >         sectors=3D2
> >         heads=3D16
> >         cylinders=3D998
> >         partition=3D/dev/nftla1
> >                 start=3D2
--=20

***************************************************
John Sutton
SCL Internet
URL http://www.scl.co.uk/
Tel. +44 (0) 1239 711 888
***************************************************
