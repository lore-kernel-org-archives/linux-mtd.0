Received: from mail119.messagelabs.com ([216.82.241.179])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HFGVB-0005d7-Uk
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 16:08:26 -0500
Received: from il06exr04.mot.com (il06exr04.mot.com [129.188.137.134])
	by motgate8.mot.com (8.12.11/Motorola) with ESMTP id l18L8Kip004507
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Feb 2007 14:08:20 -0700 (MST)
Received: from de01exm63.ds.mot.com (de01exm63.am.mot.com [10.176.8.108])
	by il06exr04.mot.com (8.13.1/8.13.0) with ESMTP id l18L8JIj015382
	for <linux-mtd@lists.infradead.org>;
	Thu, 8 Feb 2007 15:08:20 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Calculation of JFFS2 free space
Date: Thu, 8 Feb 2007 16:08:03 -0500
Message-ID: <F269680FD7CE404788EFB7B2A4DBC9CA02AFB6F9@de01exm63.ds.mot.com>
In-Reply-To: <625fc13d0702081043g72e600a2mb19c20ec26d3494d@mail.gmail.com>
References: <F269680FD7CE404788EFB7B2A4DBC9CA02AFB464@de01exm63.ds.mot.com>
	<625fc13d0702081043g72e600a2mb19c20ec26d3494d@mail.gmail.com>
From: "Sohn Chung-MCG31424" <ChungSohn@motorola.com>
To: "Josh Boyer" <jwboyer@gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: Josh Boyer [mailto:jwboyer@gmail.com]=20
> Sent: Thursday, February 08, 2007 12:44 PM
> To: Sohn Chung-MCG31424
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: Calculation of JFFS2 free space
>=20
> On 2/8/07, Sohn Chung-MCG31424 <ChungSohn@motorola.com> wrote:
> >
> > Hello,
> > I am using JFFS2 (Linux 2.6.10) on the Large Page NAND flash.
> > The size of JFFS2 partition is 7M. While applications were holding=20
> > some files, I copied over an 8M file to this partition to make the=20
> > filesystem full.
> > After I got the out of space message, I issued the 'df' command.
> >
> > The output of df was:
> > # df /jffs2
> > /dev/mtdblock/3    7168   7023   136   98% /jffs2
> >
> > # cd /jffs2
> > # touch foo
> > touch: foo: No space left on device
> >
> > The jffs2_statfs returned 136K as the available space.
> > After the filesystem is full, how the application program=20
> can figure=20
> > out the real available space on JFFS2 before write?
>=20
> You currently can't from userspace.  The df output is a=20
> best-estimate returned by JFFS2 given that it has to reserve=20
> some blocks for normal operation.
>=20
> What would be nice is some sysfs entries to export some of=20
> this information, without requiring JFFS2_DEBUG to be set.
>=20
> josh
>=20

If I change the jffs2_statfs function like this, do I give more
accurate free space info to the user?
Do I have any side affect If I change like this?

Instead of this:
    avail =3D c->dirty_size + c->free_size;
    if (avail > c->sector_size * c->resv_blocks_write)
        avail -=3D c->sector_size * c->resv_blocks_write;
    else
        avail =3D 0;

Change to:
    free =3D c->free_size + c->nr_erasing_blocks * c->sector_size;
    dirty =3D c->dirty_size + c->erasing_size + c->unchecked_size -
            (c->nr_erasing_blocks * c->sector_size);

    if((free + dirty) > (c->resv_blocks_write * c->sector_size +
c->nospc_dirty_size))
        avail =3D free + dirty -=20
                (c->resv_blocks_write * c->sector_size) -=20
                c->nospc_dirty_size;
    else
        avail =3D 0;

Thanks,
Chung
