Received: from crystal.2d3d.co.za ([196.14.185.203] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 157fNV-0006MF-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 16:37:50 +0100
Date: Wed, 6 Jun 2001 17:43:09 +0200
From: Abraham vd Merwe <abraham@2d3d.co.za>
To: MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: *sigh* HELP HELP HELP
Message-ID: <20010606174309.A11382@crystal.2d3d.co.za>
References: <20010606174025.A11268@crystal.2d3d.co.za>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline
In-Reply-To: <20010606174025.A11268@crystal.2d3d.co.za>; from abraham@2d3d.co.za on Wed, Jun 06, 2001 at 17:40:25 +0200
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

--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Abraham!

Dope, sorry. Found the mistake *blush* I didn't pass a reference to the
region structure in the ioctl().

> Maybe somebody can help here. I've been struggling with this for the past
> half an hour and I can't figure out what's wrong:
>=20
> I'm doing a MEMGETREGIONINFO ioctl() as such:
>=20
> ------------< snip <------< snip <------< snip <------------
> static int getregions (int fd,struct region_info_user *regions,int *n)
> {
>    int i,err;
>    err =3D ioctl (fd,MEMGETREGIONCOUNT,n);
>    if (err) return (err);
>    for (i =3D 0; i < *n; i++)
>      {
>         regions[i].regionindex =3D i;
>         fprintf (stderr,"%d: regions[%d].regionindex =3D
> %d\n",__LINE__,i,regions[i].regionindex);
>         err =3D ioctl (fd,MEMGETREGIONINFO,regions[i]);
>         if (err) return (err);
>      }
>    return (0);
> }
> ------------< snip <------< snip <------< snip <------------
>=20
> which in turn I call as such:
>=20
> ------------< snip <------< snip <------< snip <------------
>    static struct region_info_user region[1024];
>=20
> .
> .
> .
>=20
>    err =3D getregions (fd,region,&n);
>    if (err < 0)
>      {
>         perror ("MEMGETREGIONCOUNT");
>         return;
>      }
> ------------< snip <------< snip <------< snip <------------
>=20
> When I run the test program I get:
>=20
> ------------< snip <------< snip <------< snip <------------
> root@tinystor:~# ./mtd_debug info
> 43: regions[0].regionindex =3D 0
> MEMGETREGIONCOUNT: Bad address
> root@tinystor:~#
> ------------< snip <------< snip <------< snip <------------
>=20
> I can't find a problem with the user program nor with my driver (I can pr=
int
> the mtd->eraseregions structures from the chip driver and it works perfec=
tly)
>=20
> Any ideas? What am I doing wrong?

--=20

Regards
 Abraham

I have no doubt the Devil grins,
As seas of ink I spatter.
Ye gods, forgive my "literary" sins--
The other kind don't matter.
		-- Robert W. Service

__________________________________________________________
 Abraham vd Merwe - 2d3D, Inc.

 Device Driver Development, Outsourcing, Embedded Systems

  Cell: +27 82 565 4451         Snailmail:
   Tel: +27 21 761 7549            Block C, Antree Park
   Fax: +27 21 761 7648            Doncaster Road
 Email: abraham@2d3d.co.za         Kenilworth, 7700
  Http: http://www.2d3d.com        South Africa


--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7Hk+NzNXhP0RCUqMRAgD3AJ9dxZR2e8tzhxujdMSyBMcLI+JQnQCgjWfh
6wbC1euegvxWvc6Dhrcrs/Y=
=x0HO
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
