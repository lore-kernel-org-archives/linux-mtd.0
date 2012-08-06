Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SyREH-0006Yh-Jd
 for linux-mtd@lists.infradead.org; Mon, 06 Aug 2012 17:36:34 +0000
Message-ID: <50200096.1070002@nod.at>
Date: Mon, 06 Aug 2012 19:36:22 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: UBI fastmap updates
References: <1341836323-43916-1-git-send-email-richard@nod.at>
 <1343919530.25013.116.camel@sauron.fi.intel.com>
In-Reply-To: <1343919530.25013.116.camel@sauron.fi.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB0C263BB78E7E37637FC757A"
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB0C263BB78E7E37637FC757A
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 02.08.2012 16:58, schrieb Artem Bityutskiy:
> On Mon, 2012-07-09 at 14:18 +0200, Richard Weinberger wrote:
>> This is the next round of UBI fastmap updates.
>> It fixes all issues pointed out by Shmulik. :-)
>=20
> Hi Richard,
>=20
> when I try to attach mtdram (NOR flash), UBI fails:

Fastmap works fine with mtdram and NOR flash.
But if your MTD device has less than UBI_FM_MAX_START (64) PEBs
ubi_io_is_bad() will trigger.
The fix is to disable Fastmap if you have not enough PEBs.

I think we enable fastmap only if a MTD device has more than
UBI_FM_MAX_START*2 PEBs.
Any comments?

Thanks,
//richard


--------------enigB0C263BB78E7E37637FC757A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iQEcBAEBAgAGBQJQIACWAAoJEN9758yqZn9eA2EH/1ydACQB6kVkMp6Ce7wEkHJl
Ri8Ap+ME9kQ2gu13MtRwu6h99kxrjX0/uvwe/ptrGIGp/ZDWlDmz/xTfyLFZhKZo
ZtDEIMsDkLRQvRhr10uuvc4eHtF+C+hoXh1M+6y+qOYPwPh/1sJXWGYeYiQowX/c
pzf926xKRbYaeMMqvOIY0dPWcGInvTJAy5aLLwYWVNJ8AQV/w/cy8vt09B8ZtKfX
EpgUX/YT0qw+QTqvip8qxKoFu8nQ+CvXLckigMuPh9IbKkJsYHL6CIwxb7DM/E/W
xMNJWazFRTgFQvxNLilXps+fvdD3DetAhAeDRLht6HQaw5CfVZK7CfQAJPoYVRk=
=XjvA
-----END PGP SIGNATURE-----

--------------enigB0C263BB78E7E37637FC757A--
