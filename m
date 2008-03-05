Received: from mailsend02.psi.ch ([129.129.191.54])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JWtvt-0003Gb-IZ
	for linux-mtd@lists.infradead.org; Wed, 05 Mar 2008 13:45:23 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: MTD and jffs2 mount problem on Linux-2.6.23 rc2
Date: Wed, 5 Mar 2008 14:44:45 +0100
Message-ID: <1B4F8000449511488D1A640DD6DECA3501EC25EC@MAILBOX0A.psi.ch>
References: <C3F2E592.DC63%gerickson@nuovations.com>
	<1B4F8000449511488D1A640DD6DECA3501EC25E3@MAILBOX0A.psi.ch>
	<1204710323.3599.12.camel@lisa.alm.archives.at>
	<20080305120320.GH6616@lazybastard.org>
From: "Dach Miroslaw" <miroslaw.dach@psi.ch>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	=?iso-8859-1?Q?Schl=E4gl_Manfred_jun=2E?= <manfred.schlaegl@gmx.at>
Cc: linux-mtd@lists.infradead.org, Grant Erickson <gerickson@nuovations.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi J=F6rn,

Thank you for the hint. I have recompiled the kernel with built-in =
block2mtd driver.

Do you know where to find some examples how to use block2mtd with jffs2 =
image.

Best Regards

M.


-----Original Message-----
From: J=F6rn Engel [mailto:joern@logfs.org]
Sent: Wed 3/5/2008 1:03 PM
To: Schl=E4gl Manfred jun.
Cc: Dach Miroslaw; linux-mtd@lists.infradead.org; Grant Erickson
Subject: Re: MTD and jffs2 mount problem on Linux-2.6.23 rc2
=20
On Wed, 5 March 2008 10:45:23 +0100, Schl=E4gl Manfred jun. wrote:
> Am Mittwoch, den 05.03.2008, 09:24 +0100 schrieb Dach Miroslaw:
> >=20
> > losetup /dev/loop0 img2.jffs2 =20
> > mount -t jffs2 /dev/loop0 /mnt
> >=20
> > unfortunately mount did not work.
> This can't work, because jffs2 is using the block-device mtdblock only
> to get device-information about the mtd-device. jffs2 itself is using
> the mtd-api directly. so jffs2 only on mtd.

Some people use loop and block2mtd to mount jffs2 images.  Hardly
elegant, but it seems to work.

J=F6rn

--=20
Don't worry about people stealing your ideas. If your ideas are any =
good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
