Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sww4J-00028Z-VO
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 14:08:04 +0000
Message-ID: <1343916747.25013.112.camel@sauron.fi.intel.com>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 02 Aug 2012 17:12:27 +0300
In-Reply-To: <1341836323-43916-1-git-send-email-richard@nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-BdUaR9c9eJlI6Q8EUu6K"
Mime-Version: 1.0
Cc: nyoushchenko@mvista.com, linux-kernel@vger.kernel.org,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de,
 thomas.wucher@linutronix.de, linux-mtd@lists.infradead.org,
 shmulik.ladkani@gmail.com, tglx@linutronix.de, Marius.Mazarel@ugal.ro,
 tim.bird@am.sony.com
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-BdUaR9c9eJlI6Q8EUu6K
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-09 at 14:18 +0200, Richard Weinberger wrote:
> This is the next round of UBI fastmap updates.
> It fixes all issues pointed out by Shmulik. :-)

I see the following errors when rung UBI tests on nandsim:

[ 3698.041511] UBI error: __wl_get_peb: no free eraseblocks
[ 3698.041781] UBI error: ubi_wl_get_fm_peb: no free eraseblocks
[ 3714.773064] UBI error: __wl_get_peb: no free eraseblocks
[ 3714.773336] UBI error: ubi_wl_get_fm_peb: no free eraseblocks

How can this happen? I do not have any bad blocks.

If I understand correctly, it can be only because of a bug. If I am
correct, could you please add a 'dump_stack()' to improve the error
report?

--=20
Best Regards,
Artem Bityutskiy

--=-BdUaR9c9eJlI6Q8EUu6K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQGorLAAoJECmIfjd9wqK0OGYQAIi3uQ/7A7BKAXb6ZpWVfdDu
V728o5vakOWhu5sC69QmawokMTQ1j1EnhEhNoSFliB3RsCOU4DnAUNkQ2vACdxCo
j6DAwc1v4uh4YqOW5f0Y25db9V78u7Hv4mauKieuQbSt2vFJwLYn8q4kzmvnyak4
pUR0CCt9gKFuMeW2sfe3pDFIEWl+C3Adfyu8IX9YMlShh1BbgKNKXRJO3LqlVaiW
evf+YXbFHkP5A5V4+m4yn1oaB6QIEkXWCxdHlhiy1G02OncVdjv97Yw84X8SgEJV
Hgto4DxtTzkNKuOal9x6NBC4Qe7hbyDD7RAkcBkD6NWV/tzY+uxe7K/cxvDglxzZ
zhvdBcXASqSlqXt3Flrga1oPu/jhQBVNYXGRIDu8K37yXryl2gi12RlsXVeG1HO0
BUNV5r5LS6j4Sr7nObTDMA+CIp+bvFXnGtv1w2oyaprOuIS9AeHWKNDqtwZUOx8B
yP7zQ+pq3EyNsLHXKyR71ktZo29cKM7tAoJkUL2Hav3NkokTelnD1sDOzyWE6hZY
wCDhdpVa/ajo11kUdd8ddF2sJ1kP7QMfWKHnG/Nb3ABoZqxViS3CyPAtiOrWUUlz
1jhHJeCOkhOice+Izocxn8BSdx9Hg1IiZXv7hvjzt2/mlPm31UWzlE+Kvqk3foiA
TtbPevzzPzSPbACArA7T
=Yupu
-----END PGP SIGNATURE-----

--=-BdUaR9c9eJlI6Q8EUu6K--
