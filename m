Received: from mail-qc0-f176.google.com ([209.85.216.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xh4ji-0004FB-O4
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 22:50:35 +0000
Received: by mail-qc0-f176.google.com with SMTP id r5so3566532qcx.35
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 15:50:12 -0700 (PDT)
Message-ID: <5448344C.8020402@vanguardiasur.com.ar>
Date: Wed, 22 Oct 2014 19:48:44 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: print erase size on init
References: <1413842464-18016-1-git-send-email-zajec5@gmail.com>
In-Reply-To: <1413842464-18016-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="iLkw1UG3HnWGq5p1ph83fe4ftwFxbktHw"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iLkw1UG3HnWGq5p1ph83fe4ftwFxbktHw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 10/20/2014 07:01 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> It may be useful info, e.g. if someone wants to use ubinize.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.=
c
> index 5b5c627..5e9ffbe 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3765,9 +3765,9 @@ ident_done:
>  		pr_info("%s %s\n", nand_manuf_ids[maf_idx].name,
>  				type->name);
> =20
> -	pr_info("%dMiB, %s, page size: %d, OOB size: %d\n",
> +	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\=
n",
>  		(int)(chip->chipsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> -		mtd->writesize, mtd->oobsize);
> +		mtd->erasesize >> 10, mtd->writesize, mtd->oobsize);
>  	return type;
>  }
> =20
>=20

Hm, this line is already way too long! I'd say we should try to make it
shorter, instead of longer.

Moreover, you have a /proc and a /sysfs interface to retrieve the erasesi=
ze:

What's wrong with using any of the currently available interfaces:

$ cat /sys/class/mtd/mtd0/erasesize=20
131072

$ cat /proc/mtd | grep mtd0 | awk '{print $3}'
00020000

Any reason why you want the info in the kernel log?
--=20
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar


--iLkw1UG3HnWGq5p1ph83fe4ftwFxbktHw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUSDRNAAoJEIOKbhOEIHKikkkP/2dByI3Zpq+h4syHCmbaZZUG
PqMfJTxdU4To9P2kYO6iSkxDS1EW41n6tjUP1HLam3aJD97uV0ww9nmX+38RJKh/
z6Y/MWo4hR/+NDUwHb0L/NWygUdsE56hJguJQ4rn1QxwfJRm/8B0w/t+CPkVQ0qT
5EJUVYcwz3sZLLPtd6beEJ4kYF4YMvWqJSrqPIvM98jd6je0gL23aOws45t2Ok5Z
nPhyagIFIxAZs0A+OUe8IXO8zmVMjam0RNgV5MVu5PU2Ql6GwciyKUu3Z4JIEnyn
AEKJQcTQ6f8iXBHW8mYRpkeKqqv7iy0xpuAOk9xYiZSkXpyOjHeHityCrwiC/bAE
Eii7s4fyWaGTPp9tx/DmqBrsB24DFYk2heUGjixL1PgQX3wiH34DVdIAMwvzDfIy
3D8JYLZRuBf1wJAb+UJK/siAvlDJehHCAH8hUw5LicMQaDKeeMXiSw6b0AXQRpDF
VaQsJmbwzjPM96QnfEJhL3pQ3l0EsLg/9jHVgVkWDRn6Y/NZTWIEWSJ0z0ucXcAo
t9ATvVJYk1kJA7Rqx9MBTcD0F/QyodWN47qovC+B5mgjOtVcBzpGBjKezPuWpFJE
14Hr53lVzds3SCxzKe9b3LTUQexzji8WhEiv9BeYr0Iak1F+FY/A6/CJvsRKPVj8
9UU0SyPntzVQE5GH5k4s
=k3co
-----END PGP SIGNATURE-----

--iLkw1UG3HnWGq5p1ph83fe4ftwFxbktHw--
