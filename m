Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACRvC-0007fS-IK
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 23:57:42 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: ch@hpl.hp.com
In-Reply-To: <000001c398ec$81bc7020$d203b60f@duckduck>
References: <000001c398ec$81bc7020$d203b60f@duckduck>
Message-Id: <1066863067.6281.197.camel@tubarao>
Mime-Version: 1.0
Date: 22 Oct 2003 16:51:08 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-L8S2c4dd8uaXOqUjru4H"
cc: ch@murgatroid.com
cc: 'mtd list' <linux-mtd@lists.infradead.org>
Subject: RE: Regression of mtd/chips/jedec_probe.c in 2.6.0-test7
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-L8S2c4dd8uaXOqUjru4H
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-10-22 at 16:33, Christopher Hoover wrote:
> > If you can narrow the problem down to just a few lines that=20
> > are obviously incorrect then the patch should have a fighting=20
> > chance.
>=20
> Here's what I tried:
>=20
> --- linux-2.6.0-test8-rmk1/drivers/mtd/chips/jedec_probe.c	2003-10-20
> 22:19:24.000000000 -0700
> +++ linux-2.6.0-test8-rmk1-ceiva1/drivers/mtd/chips/jedec_probe.c
> 2003-10-22 15:24:55.000000000 -0700
> @@ -1481,7 +1481,7 @@
>  	DEBUG( MTD_DEBUG_LEVEL3,
>  	       "MTD %s(): Check fit 0x%.8x + 0x%.8x =3D 0x%.8x\n",
>  	       __func__, base, 1 << finfo->DevSize, base + (1 <<
> finfo->DevSize) );
> -	if ( base + ( 1 << finfo->DevSize ) > map->size ) {
> +	if ( base + cfi->interleave * ( 1 << finfo->DevSize ) > map->size )
> {
>  		DEBUG( MTD_DEBUG_LEVEL3,
>  		       "MTD %s(): 0x%.4x 0x%.4x %dKiB doesn't fit\n",
>  		       __func__, finfo->mfr_id, finfo->dev_id,

This is needed.

> @@ -1539,10 +1539,10 @@
>  	 */
>  	DEBUG( MTD_DEBUG_LEVEL3, "MTD %s(): return to ID mode\n", __func__
> );
>  	if(cfi->addr_unlock1) {
> -		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
> CFI_DEVICETYPE_X8, NULL);
> -		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
> CFI_DEVICETYPE_X8, NULL);
> +		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
> cfi->device_type, NULL);
> +		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
> cfi->device_type, NULL);
>  	}
> -	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
> CFI_DEVICETYPE_X8, NULL);
> +	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
> cfi->device_type, NULL);
>  	/* FIXME - should have a delay before continuing */
> =20
>   match_done:=09

There's one more fragment where cfi->device_type should revert back to
CFI_DEVICETYPE_X8

@@ -1674,10 +1674,10 @@
=20
 	/* Autoselect Mode */
 	if(cfi->addr_unlock1) {
-		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xaa, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
 	}
-	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x90, cfi->addr_unlock1, base, map, cfi,
CFI_DEVICETYPE_X8, NULL);
 	/* FIXME - should have a delay before continuing */
=20
 	if (!cfi->numchips) {


Let me know if this fixes it.

--=20
Thayne Harbaugh
Linux Networx

--=-L8S2c4dd8uaXOqUjru4H
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/lwnbfsBPTKE6HMkRAuQCAJ49w6ZMf+0hRwvV6KZCsjnxLbmz5QCdFUMy
ACsAdXCqNWAXW+J/XA2YkLc=
=xfv/
-----END PGP SIGNATURE-----

--=-L8S2c4dd8uaXOqUjru4H--
