Received: from mail.erinc.com ([216.158.10.5])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1897Bu-0000Va-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2002 17:08:39 +0000
Message-ID: <F4608F665DF5D311B231009027B70F700131DEB6@MAIL>
From: Junping Zhang <JZhang@erinc.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: seeking help on JFFS2
Date: Tue, 5 Nov 2002 12:39:31 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Yes, the minor number is 2, and I checked mkfs.jffs2 source, hex is ok. =
I
also tried with
the method you mentioned, the crashed happened right away.

I just tried using the stock JFFS2 in 2.4.18 kernel. It actually got me
further than JFFS2
in my mtd-20021022 snapshot, I could use either image or direct mount =
to
create JFFS2,
but it still crashed under stress test. On the other hand, JFFS works =
quite
well.

Does stock 2.4.19 have a stable JFFS2 without patch? I downloaded a
shared-zlib patch
for 2.4.19-pre10 but am not sure it will fix my JFFS2 problem.

Thanks a lot

- Junping

> -----Original Message-----
> From:	J=F6rn Engel [SMTP:joern@wohnheim.fh-wedel.de]
> Sent:	Tuesday, November 05, 2002 11:41 AM
> To:	Junping Zhang
> Cc:	linux-mtd@lists.infradead.org
> Subject:	Re: seeking help on JFFS2
>=20
> >         eraseall /dev/mtd1
> >         mount -t jffs /dev/mtdblock1 /mnt/flash
>=20
> Just to be on the safe side, can you make sure that /dev/mtd1 has =
minor
> number 2? Common problem.
>=20
> >=20
> >         mkfs.jffs2 -dipc -e0x40000 -p0x700000 -b -o /opt/ipc.jffs2
>                              ^^^^^^^   ^^^^^^^^
> Does this really work? I remember that mkfs.jffs2 once didn't
> understand hex and you had to pass it the decimal numbers. Can you
> check that?
>=20
> >=20
> >   Any ideas? I have been reading the mailing list archive and could
> > not find the answer to this.
>=20
> jffs2 also mounts partitions that are completely erased. You can
> eraseall /dev/mtd1 and then mount /dev/mtdblock1. That should work
> fine.
>=20
> J=F6rn
>=20
> --=20
> "Translations are and will always be problematic. They inflict =
violence=20
> upon two languages." (translation from German)
