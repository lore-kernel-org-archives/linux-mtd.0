Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsBdO-0003ws-Av
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 11:12:23 +0000
Received: by iafj26 with SMTP id j26so8061084iaf.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 03:12:21 -0800 (PST)
Message-ID: <1328008455.956.30.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 0/3] platform: add platform_devm_request_and_ioremap()
 common API
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Barry Song <Barry.Song@csr.com>
Date: Tue, 31 Jan 2012 13:14:15 +0200
In-Reply-To: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FMh3AKwSqszx+f6QOdCL"
Mime-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@suse.de>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, workgroup.linux@csr.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FMh3AKwSqszx+f6QOdCL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-01-31 at 17:59 +0800, Barry Song wrote:
> these patches move the common pattern from
>=20
> "
> res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);=20
> if (!res) {
> 	        ret =3D -ENODEV;
> 		        goto err;
> }
>=20
> base =3D devm_request_and_ioremap(&dev->dev, mem_res);
> if (!base) {
> 	        ret =3D -ENODEV;
> 		        goto err;
> }
> "

Am I right that these patches have been generated using the
coccinelle/api/devm_request_and_ioremap.cocci script?

If yes, I think it would be nice of you to give a credit to coccinelle
and its authors for developing this awesome tool in every commit
message.

--=20
Best Regards,
Artem Bityutskiy

--=-FMh3AKwSqszx+f6QOdCL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPJ80HAAoJECmIfjd9wqK0iQwP/1sZGw0kf297MdZKYjz5INT6
aathplkk6+3QejuECiUI+0epeIrjMpIIR+M0NKIGFEqhWzH7SduWVLCEkNzlhA7X
4kkxz0qypKK3clVF+cu7aZJ8OovOVeiIhpBW3ZWfazjVfxKgDRwmV1btoJnAGggx
HqCo+cy0uj5P1Fn2lPFNQ34x3DD5IEAqDRQpHPvJ+zjN4h5qnRCIJYMVhMQl/M6E
cDirzBcanQuvDhjX+XHa4KIuecmzI4KTOEETElBTe2emYjOJyQ7/A9eLNiTCPtKY
zqHvxDkwclW5ZrI1kkH9sLF6fVjunKWiBRoCwHQeY0RVgAhKqv/JixmSwS4iXkRN
FHtw0/j+JOATUv78nw3YyedeWdAQ94aUiM826zNTpoC0wXst5HVkzxS1QIW25juP
tf1SR9FSb3kHtsPxCaGOdBbjWQcTtJwdB8tQnphjtj807g/QnoOszmBRhVxPas1T
yg1az17KmEIx8tSayee+s9b0x1v4rnw0oBUdGxlaF4f6wFzJ2a7OCKdz+Q8lhN8O
59yNPmOghz2DybYDr+UMK0GZ4Lo3TYm/Y8AmtoaEl7wNWr/t1ycd6UKfFqja8cno
TTILiMxLGmrnQ4KuXyavDsNoQ5IJMBdT2PedQ9H8l9Tx9s8JBjk2SAxy0QHfSx6J
S/6rv+EIKeXGCo0jPNfH
=G+0s
-----END PGP SIGNATURE-----

--=-FMh3AKwSqszx+f6QOdCL--
