Received: from 67.111.72.3.ptr.us.xo.net ([67.111.72.3]
	helo=nonameb.ptu.promise.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLnd6-0001ea-Al
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 15:39:12 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Mar 2006 12:39:07 -0800
Message-ID: <B70A50D07063384EB9BCE3330D18414F024CCD2B@nonameb.ptu.promise.com>
From: "Lakshmi N. Sundararajan" <lakshmi.s@promise.com>
To: "Peter Menzebach" <pm-mtd@mw-itcon.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: boot issue.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(This thread is no way related to mtd. Just wanting to update interested

  members)

Hi Peter,
Thanks for your response. After some effort, I found that it is
possible.
It needs some changes in the linux kernel.

One could boot from a floppy which has a compressed root file system on
it.
(Note, not an initrd) The code path is similar to it, except that the
compression=20
is now on FLASH. The code in prepare_namespace() recognizes this case
only=20
when booted from floppy.

Instead now I changed it to recognize flash also in a similar way to
floppy.
    is_floppy =3D (MAJOR(ROOT_DEV) =3D=3D FLOPPY_MAJOR ||
                MAJOR(ROOT_DEV) =3D=3D 31);

This is all the change required.
Now the system boots fine.

Thanks,
-LN



> -----Original Message-----
> From: Peter Menzebach [mailto:pm-mtd@mw-itcon.de]=20
> Sent: Tuesday, March 21, 2006 1:14 AM
> To: Lakshmi N. Sundararajan
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: boot issue.
>=20
>=20
> Hi,
>=20
> Lakshmi N. Sundararajan wrote:
> > I have a compressed ext2 filesystem on a FLASH partition=20
> which I would
> > like
> > to use as a root file system mounted in RAM. The FLASH is=20
> accessed via
> > MTD layer.
> So you have *no* filesystem in the flash, but a compressed=20
> image. This=20
> is not usable as a filesystem directly in this format. Afaik,=20
> only the=20
> initrd code can use this...
>=20
> > The kernel parameters are "console=3DttyS0,115200  noinitrd =
mem=3D128M
> > root=3D/dev/mtdblock5"
> > But kernel panics saying "VFS: Cannot mount root unknown=20
> device (31,5)".
> >=20
> which is correct, since there is no fs there...
>=20
> > If I were to use cramfs on FLASH and use the same kernel=20
> command line,
> > I am able to bringup the system.I am using 2.6 linux.
> which would save the RAM space. You can still put some=20
> directories into=20
> RAM...
>=20
> > Would anyone know about this issue? Is there any thing I got to do?
> > Any pointers would be helpful.
> The only solution I know is (assuming parallel flash) to give the=20
> compressed image as an initrd=3D<address>,<size> to the kernel.
>=20
>=20
> Best regards
> Peter
> --=20
> Peter Menzebach
> Menzebach und Wolff IT-Consulting GbR
> Phone +49 751 355 387 1
>=20
