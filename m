Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4qJK-0004i3-JP
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 09:36:15 +0000
Message-ID: <1345801261.2848.276.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI:Force ubi driver load after mtd device drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jiang Lu <lu.jiang@windriver.com>
Date: Fri, 24 Aug 2012 12:41:01 +0300
In-Reply-To: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
References: <1344393061-21037-1-git-send-email-lu.jiang@windriver.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-mHkeb2jpv1QmNXz1SHj1"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-mHkeb2jpv1QmNXz1SHj1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-08 at 10:31 +0800, Jiang Lu wrote:
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 0fde9fc..efbcaef 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -1275,7 +1275,7 @@ out:
>  	ubi_err("UBI error: cannot initialize UBI, error %d", err);
>  	return err;
>  }
> -module_init(ubi_init);
> +late_initcall(ubi_init);

The problem is that UBIFS, which is usually used on top of UBI, also
uses 'late_initcall()'. If we do this change, how do we guarantee that
UBIFS is initialized after UBI?

--=20
Best Regards,
Artem Bityutskiy

--=-mHkeb2jpv1QmNXz1SHj1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN0wtAAoJECmIfjd9wqK0oJoP/R4nkym4P82B0Io40l47iWE7
jfyf0U4eJ82EMldWV8z2Vj7OIfL2o1VGMF7DwcTW5yoUtST3TSv4c+EKVB5auSPl
5OVvtjVYHp00E0SiDGFk4Rjp2PmRZBiXBBqtDg67yKkLTc6EW5PFNtFFVrgwyCvy
VPalthy5VxDJ9kpIAE/nzjNGDdU2bqGM60AaoUfFrrAsDywtG8mJgPaC9PHPtZRp
4WixhTjiFr0Sye8BeIJxZEe4D8VoYt7vDPFs79Um3aU44YsVtC0DpjMnOzb1CF/X
kG8hHN71usC1BJ5QK3tjKs+Ax5rX/yl0pbuia9oFnzJNGZ6KMAJf+P+XJ1N11rdG
PtgZj6LDVUoK/1u+2U6ugO5DQpkiB08X8Itb4xKvARE4nJbm7xbXDHxOR3HS9eWw
cAiacWvQIsdjV42rf3+mdj1cbh3bk4B5MDQxMYslIlbqpW1DoEgkcU88ET7AS0Yx
qL6iE+jtxvYuyuShgmswZPNUMrOS35dQ7g9REYAuWv8o6w3MH0OmMn3xThdmiERE
AKzRWolQDNiivW9NvV21QJmEp8wt9JnqnPfJjvAkKiaQxEHseRi+OTKp+9KiGDoT
4PQnwjmdFDfBWvhmmWRttBP0SE2K15lKJYwEjvKFBwzKqkXXyvuijzAQInQiv+KX
dATld4Etnt+GN3qxZLrv
=X8nj
-----END PGP SIGNATURE-----

--=-mHkeb2jpv1QmNXz1SHj1--
