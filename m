Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U87iS-0000rY-PI
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 11:20:01 +0000
Message-ID: <5124B159.1040305@pengutronix.de>
Date: Wed, 20 Feb 2013 12:19:53 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: SELinux + ubifs: possible circular locking dependency
References: <51123C80.2050400@pengutronix.de> <5115076E.3070703@pengutronix.de>
 <1360759673.12703.147.camel@sauron.fi.intel.com>
 <511BA51E.9000606@pengutronix.de>
 <1360826119.12703.155.camel@sauron.fi.intel.com>
 <511CD0EC.6070200@pengutronix.de>
 <1360843685.12703.165.camel@sauron.fi.intel.com>
In-Reply-To: <1360843685.12703.165.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2NKQUFDEITBCLGEKADGAE"
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2NKQUFDEITBCLGEKADGAE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 02/14/2013 01:08 PM, Artem Bityutskiy wrote:
> On Thu, 2013-02-14 at 12:56 +0100, Marc Kleine-Budde wrote:
>> On 02/14/2013 08:15 AM, Artem Bityutskiy wrote:
>>> Mark, how about this one? I compiled it and ran on my fedora 16 with
>>> SElinux enabled, no obvious issues.
>>>
>>> From a19350097200570571aa522afebb96b34db534f4 Mon Sep 17 00:00:00 200=
1
>>> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>>> Date: Thu, 14 Feb 2013 09:07:36 +0200
>>> Subject: [PATCH] selinux: do not confuse lockdep
>>>
>>> Selinux has per-inode mutexes called 'isec->lock', and they are initi=
alized in
>>> the same place, which makes lockdep treat all of the them as if they =
were
>>> identical. However, locking rules may be a little bit different depen=
ding on
>>> the file-system, so we should put these locks to separate classes, ju=
st like we
>>> do for 'i_mutex'. Namely, we should put them to per-FS type classes, =
which is
>>> exactly what this patch does.
>>>
>>> The problem this patch intends to fix is a strange lockdep warning, w=
hich I,
>>> frankly speaking, do not really understand, but I believe the root-ca=
use should
>>> be fixed by this patch.
>>
>> Thanks, this works with mainline, but not with my xattr patch series
>> applied.
>=20
> Hmm, probably I have to annotate the ui mutex. Let's drop security
> mailing lists from the loop so far, I'll come up with a patch tomorrow.=


Do you have a patch I can test?

Marc
--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


------enig2NKQUFDEITBCLGEKADGAE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlEksV0ACgkQjTAFq1RaXHNA4wCfRlLpsIpy18a3Ok4l+hENYRcR
c0sAnR3f7R/UB4nxtyDTZouyzYkxdWTW
=UPmC
-----END PGP SIGNATURE-----

------enig2NKQUFDEITBCLGEKADGAE--
