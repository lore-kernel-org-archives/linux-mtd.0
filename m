Message-ID: <1337938767.30969.9.camel@sauron.fi.intel.com>
Subject: Re: Problem with UBI / UBIFS (mainly ucorrectable error) on kernel
 higher than 2.6.30.10
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?=C5=81ukasz?= Nowak <lukasz.nowak@homersoft.com>
Date: Fri, 25 May 2012 12:39:27 +0300
In-Reply-To: <CACYZ3J4rP=JbB8XoVfg-dqWEhTXt_gGt4FsBf3NWngyCKaa+JQ@mail.gmail.com>
References: <1337255133.2457.66.camel@debian.softace>
 <1337348152.2483.59.camel@sauron.fi.intel.com>
 <1337605024.2646.16.camel@debian.softace>
 <1337673875.2483.116.camel@sauron.fi.intel.com>
 <CAJpamw4XDgWiB1Za5qGDns1wV=Jnk1DyRS6MYBSypd8ab41hVQ@mail.gmail.com>
 <OF453BD14D.DB41E7C8-ONC1257A06.003568DE-C1257A06.00357A39@transmode.se>
 <CACYZ3J4rP=JbB8XoVfg-dqWEhTXt_gGt4FsBf3NWngyCKaa+JQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0X/Fp3u5NhptX4PIlfJs"
Mime-Version: 1.0
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
 Nicolas Pitre <nico@cam.org>, Guillaume LECERF <glecerf@gmail.com>,
 Joakim Tjernlund <joakim.tjernlund@transmode.se>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0X/Fp3u5NhptX4PIlfJs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-05-25 at 11:04 +0200, =C5=81ukasz Nowak wrote:
> So maybe the best solution right now will be to just add additional
> flag to the kernel configuration MTD_ORION_NAND_BURSTS_READS turned of
> as default? I saw that a lot of people had similar problems to mine.
>=20
Fist of all, someone should investigate what is happening and why
exactly. Then we should find out the right solution - be that a flag or
just a revert of that change.

--=20
Best Regards,
Artem Bityutskiy

--=-0X/Fp3u5NhptX4PIlfJs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPv1NPAAoJECmIfjd9wqK0S+gP/ROchxc0mwUaTIiXTuiGuLzr
mzAZdc8FvW2FY0XUw0bl80yiOZnKgVANc8PI8cslsYguIrVIOXckJs2alkJQn5kr
Ap1Wi+ITGIdEmO91FOQ1UHCOVZqiwiN49ZzW8xVzjwE3v3YjPD+YrfNml6rKq8H9
Jrm9waYE4HGeFIr1XkaMCzV/77pc1X6Mj6s4b5q46pJwyjFHEJ+KDRmwNXDEB3eP
pFbx5iTEXizqKWDtdiVHx+bJq3Gs7Gd/2j7Z+jTJVv1SEfuj/qdof+7PmPqgg+kt
O1A10I06vEl3bSasw5I89st8syolq39pRSpf7G8Wg3YlX8v5ob/eEyU0IIVQ7G/+
hSyH/q8+LVlpg+gBNJ411znpCGQYMK+BwcRHSzdfl8szFEGIMyh5BFmvyh8I9b74
8nlLWQ1C11bPvk9fsRbv4Am5OlrI3sYzsZjl6APNRvyGBlefQldh6OfT4v1LvjTJ
sCniHUh6VhF2rr0M4hpdGEKvqIHATtWU0CEcGnB8EaviHKRqZSSE9HFRyrCvzbQa
pgIoizQF1yDoCNhOxEwzk68fPMKpecmSZXNNcB37FQ9l/bvsHiF1inxyEJRqcyis
IPAhYRRq0on6BUWa64hVuZdhuveQ6/bheF+JUXVl/CEL7WBht+RBFth8MURXwfnO
rhycJuWWvchPChwCDah2
=4rsR
-----END PGP SIGNATURE-----

--=-0X/Fp3u5NhptX4PIlfJs--
