Received: from mailsend02.psi.ch ([129.129.191.54])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JXAtx-0008Av-Aq
	for linux-mtd@lists.infradead.org; Thu, 06 Mar 2008 07:52:29 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MTD and jffs2 mount problem on Linux-2.6.23 rc2
Date: Thu, 6 Mar 2008 08:48:46 +0100
Message-ID: <1B4F8000449511488D1A640DD6DECA3501EC25F0@MAILBOX0A.psi.ch>
References: <C3F2E592.DC63%gerickson@nuovations.com>
	<1B4F8000449511488D1A640DD6DECA3501EC25E3@MAILBOX0A.psi.ch>
	<1204710323.3599.12.camel@lisa.alm.archives.at>
	<20080305120320.GH6616@lazybastard.org>
	<1B4F8000449511488D1A640DD6DECA3501EC25EC@MAILBOX0A.psi.ch>
	<20080305135024.GA8301@lazybastard.org>
From: "Dach Miroslaw" <miroslaw.dach@psi.ch>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>
Cc: =?iso-8859-1?Q?Schl=E4gl_Manfred_jun=2E?= <manfred.schlaegl@gmx.at>,
	linux-mtd@lists.infradead.org, Grant Erickson <gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jorn,

I have followed your idea with block2mtd.

The steps I have done are as following:
# mkdir /mnt
# ./mkfs.jffs2 -n --pad=3D0xA0000 --eraseblock=3D0x20000 =
--root=3DMTEST-PC-M24 --output=3Dimage2.jffs2
# losetup /dev/loop0 image2.jffs2
# insmod block2mtd block2mtd=3D/dev/loop0,640ki

[ 2715.317777] block2mtd: mtd4: [d: /dev/loop0] erase_size =3D 640KiB =
[655360]

# mount -t jffs2 /dev/mtdblock4 /mnt
                                                                         =
      =20
[ 2725.702309] jffs2: Too few erase blocks (1)
mount: mounting mtd4 on /mnt failed

I have no idea what is the meaning of "Too few erase blocks".

Best Regards

M.






-----Original Message-----
From: J=F6rn Engel [mailto:joern@logfs.org]
Sent: Wed 3/5/2008 2:50 PM
To: Dach Miroslaw
Cc: J=F6rn Engel; Schl=E4gl Manfred jun.; linux-mtd@lists.infradead.org; =
Grant Erickson
Subject: Re: MTD and jffs2 mount problem on Linux-2.6.23 rc2
=20
On Wed, 5 March 2008 14:44:45 +0100, Dach Miroslaw wrote:
>=20
> Thank you for the hint. I have recompiled the kernel with built-in =
block2mtd driver.
>=20
> Do you know where to find some examples how to use block2mtd with =
jffs2 image.

I don't.  If someone wants to write some documentation, I'd gladly add
it.

But I believe this should do the trick:
echo block2mtd=3D/dev/loop0 > =
/sys/modules/block2mtd/parameters/block2mtd
or to explicitly set the erase size:
echo block2mtd=3D/dev/loop0,128KiB > =
/sys/modules/block2mtd/parameters/block2mtd

J=F6rn

--=20
The story so far:
In the beginning the Universe was created.  This has made a lot
of people very angry and been widely regarded as a bad move.
-- Douglas Adams
