Received: from modemcable061.45-202-24.mtl.mc.videotron.ca
	([24.202.45.61] helo=mygale.ds9.ufp ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16JjCa-00012G-00
	for <linux-mtd@lists.infradead.org>; Thu, 27 Dec 2001 22:40:40 +0000
From: "Stéphane Doyon" <s.doyon@videotron.ca>
Date: Thu, 27 Dec 2001 17:51:49 -0500 (EST)
To: David Woodhouse <dwmw2@infradead.org>
cc: <linux-mtd@lists.infradead.org>
Subject: Re: Truncated symlink on jffs2 
In-Reply-To: <13913.1009453863@redhat.com>
Message-ID: <Pine.LNX.4.33.0112271746580.3704-100000@odo.ds9.ufp>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
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

On Thu, 27 Dec 2001, David Woodhouse wrote:

>=20
> s.doyon@videotron.ca said:
> >  where lstat is a tiny program that does lstat(argv[1], &st) and
> > printf("size: %lu\n", st.st_size);. It outputs 0, but it should say 6
> > (which it does on a symlink created on another fs).=20
>=20
> > Is this a bug or a known limitation?=20
>=20
> Bug. Thanks for pointing it out. We should be setting i_size. Something l=
ike
> this ought to do it for _new_ symlinks, although we should probably contr=
ive
> a hack for jffs2_read_inode() to make it dtrt on older filesystems too:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> RCS file: /home/cvs/mtd/fs/jffs2/dir.c,v
> retrieving revision 1.44
> diff -u -r1.44 dir.c
> --- fs/jffs2/dir.c=092001/11/06 17:58:41=091.44
> +++ fs/jffs2/dir.c=092001/12/27 11:50:08
> @@ -542,7 +542,7 @@
> =20
>  =09f =3D JFFS2_INODE_INFO(inode);
> =20
> -=09ri->dsize =3D ri->csize =3D strlen(target);
> +=09ri->isize =3D ri->dsize =3D ri->csize =3D strlen(target);
>  =09ri->totlen =3D sizeof(*ri) + ri->dsize;
>  =09ri->hdr_crc =3D crc32(0, ri, sizeof(struct jffs2_unknown_node)-4);
> =20
>=20
>=20
>=20
> --
> dwmw2
>=20
>=20
>=20

OK. Well unless I'm doing something wrong, it doesn't seem to fix it for=20
me: modified my kernel, made a new symlink using ln, lstat'ed it: still=20
says st_size is 0.

Is the fix correct, and will it work on a 2.4.16-rmk1-hh5 kernel?

Thanks

--=20
St=E9phane Doyon
<s.doyon@videotron.ca>
http://pages.infinit.net/sdoyon/
