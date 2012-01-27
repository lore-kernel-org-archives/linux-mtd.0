Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqmZY-0005SS-Kk
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 14:14:36 +0000
Received: by mail-pz0-f49.google.com with SMTP id z9so555401dad.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 06:14:36 -0800 (PST)
Message-ID: <1327673803.29385.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mtdoops: kill Kconfig usage instructions
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 27 Jan 2012 16:16:43 +0200
In-Reply-To: <1327094220-26296-1-git-send-email-computersforpeace@gmail.com>
References: <1327094220-26296-1-git-send-email-computersforpeace@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-GDgvVTJei+uAR8fjGjq+"
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


--=-GDgvVTJei+uAR8fjGjq+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-01-20 at 13:17 -0800, Brian Norris wrote:
> The mtdoops usage instructions found in Kconfig have been incorrect
> since:
>=20
>     commit 2e386e4bac90554887e73d6f342e845185b33fc3
>     mtd: mtdoops: refactor as a kmsg_dumper
>=20
> mtdoops no longer uses a console. Now, if you build it into your kernel,
> you add something like the following to your command line to select
> partition X as your logging partition:
>=20
>     mtdoops.mtddev=3DX

Pushed to l2-mtd git tree, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-GDgvVTJei+uAR8fjGjq+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIbBAABAgAGBQJPIrHLAAoJECmIfjd9wqK0sxEP+MjSG5EDi4Kqh3nTHx6MGNox
PZ34RIcZnW/lM4NfApyxwMJ+2xd2s/SR2+D29oZLJMTj0BlLptkmyl8u6Vn9Fw08
ToxWqbHSo65KQbMzoR/b8b+PIYefPed4zlf4AMT6m3MHZg0q2WRUwbZO48UdUBDA
3GgpTI/kZ2xAwaph378DWmVKEdGRL2JIC52QVh9NcOmfe71G1d99+ssHQolprZ/X
CYo08NM6RshcBLYHjiAaJS9sy0/IaBMvJOnxImjSc9pdmxW6eEbBJoiphyGxycox
TsCD6kQYhJUH6resjkPJcK4YEBCHp56x1WopL6aDdyx3ca+AGf+q9k6XthswbOOL
4QXwKLfUPQ4lw28D8v1om5N9pIDEFVwHE7s8Xx5h1G4GTq8NB7M8P5kV+R9S8XNy
BPK+OhN2C23pGbtBfajM8NNTmiazI4v6bq/I8GePddkgEO2AxlGmzYjEQFxFF/qM
NvFupjqDFHB2vjAo7NLOqzeje91Ne4MYndJ91Rn8FD/H2qI8CdK25aKhqygpJiXe
Hurti2b6yeMbtfkNOLbfsjq4kdGjiVGFzfU2fK8QObBGsgnVCAYQX7FKBGQCABUT
WeV5uDHHprNtGaHaUAyg3jBfraEvhNJvh8PmRlboOdlpP/j8q8AUn50/2zc8fAV3
bX2bs+uq+BBMLn2sz6w=
=Q2DO
-----END PGP SIGNATURE-----

--=-GDgvVTJei+uAR8fjGjq+--
