Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TEfhB-0005d7-Il
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2012 12:17:31 +0000
Message-ID: <1348143751.2388.16.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: just use memcpy_fromio for reading
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Thu, 20 Sep 2012 15:22:31 +0300
In-Reply-To: <1348131625-24349-1-git-send-email-zajec5@gmail.com>
References: <1348131625-24349-1-git-send-email-zajec5@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zFpmyXX9k9RTe7/Cajb8"
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


--=-zFpmyXX9k9RTe7/Cajb8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-20 at 11:00 +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> ---
> It doesn't generate any errors on normal compilation, but I wasn't able
> to test it with "verify". This tool defeated me ;/
>=20
> First I cloned dedekind/maintaining.git but it didn't run because or
> lacking aiaiai.
>=20
> So I've cloned dedekind/aiaiai.git.
>=20
> Then I had to move aiaiai to ~/git/aiaiai to let "verify" find it.
>=20
> So I was able to use verify:
> time ./verify ../l2-mtd/ mips-bcm47xx_defconfig < ../l2-mtd/0001-mtd-bcm4=
7xxsflash-just-use-memcpy-for-reading.patch
> but it didn't work because patch was already applied. My bad, but... it
> took 2m17.277s to verify to realize that. And that magic commit/message
> wasn't helpful:

Well, before doing anything with your tree, we clone it to a temporary
location (in the workdir, which can specify), that probably took 2
minutes in your machine.

> Failed to apply patch(es) with git am on top of:
> 0f1afc8 Quick fixes - applied by aiaiai

After this there should have been the right commit. But I agree this is
confusing, I'll look how I can improve this.

> So I've removed patch from my tree, and tried again. This time it took
> 3m14.398s just to display:
> [2012-09-20 10:39:10] aiaiai-make-kernel: Program "aiaiai-locker" is requ=
ired but not found in PATH
>=20
> I just wanted to add ~/git/aiaiai to my $PATH, but noticed it doesn't con=
tain
> aiaiai-locker anyway... I gave up :|

Because you need to type "make". This is written in the docs. Dunno, how
would I make sure users do not forget to type make before running? I can
improve the error message though, and put a hint there.

> I appreciate your work on additional quality tools, but apart from good
> code it also need to be easy-usable to make ppl use it :|

Thanks for feed-back, appreciated!

--=20
Best Regards,
Artem Bityutskiy

--=-zFpmyXX9k9RTe7/Cajb8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQWwqHAAoJECmIfjd9wqK0W/YQAKVckSVx9Y+QpFI9QbZf0Ag3
M210rSCy6gEoCkDVvVNRIn4z8hkY2otGU4r3uR5BsE7Z8Hu9Bj//x23m5RkbXqth
HV9X+3a4R/CnFWjD1lI+eXzNfMClKbpujqBa4IjEqbpjzEjGqqSKNYQSm8rVTXvJ
PdnE5b/pVX5eNd/pKkz3M+xJF9QzjMae7a12+oxT0LpTvqapbZjkXOs3HW3YDxWF
ceddf/94GeBSdHQXBppFBvxmPLKZ22zKDaBdrXEoXVu1pQVxWTbH6ECoiSY4otI5
g83Ry1dMvEN+1FSvZ+xKzks/eqNt7fVhaDJuiwDluDZSAeLLsUHXpDjg/oxgfuez
L9AVNR8Y9OIHYfyRujQRDIUkaCQwVbVDMtREV3vxHKacChX6xYAiwJ/30HQQtCd8
zfzGKv0gRi6qk3uS2i1tkHuVEGAWWsDBWVl+MSBBWuMXKD5K6ZD2LU5jR0F2NZQQ
ta6UlS8XRGFLqaXChW9AXxtVdMXSI+AJqAgRmkaCEu+sUaAzdYpFQyhEu81qSMIu
Bys/mCrc4G/xK80LvrP0nGHfZZcluSm94iSbfwawwA5fLh1ki9Z6hQxH3pSMzvyD
oV/NMw6gvfPEW7YnOB4Z61iux4nD6T5YkG6izoiQfBEh2c2+KVx+ADjnwZGfET7C
bz7iCjjQ0A7GAGM+2eyf
=54Zs
-----END PGP SIGNATURE-----

--=-zFpmyXX9k9RTe7/Cajb8--
