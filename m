Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sx0Pg-00060h-JN
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 18:46:24 +0000
Message-ID: <1343933454.25013.224.camel@sauron.fi.intel.com>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 02 Aug 2012 21:50:54 +0300
In-Reply-To: <1341836323-43916-1-git-send-email-richard@nod.at>
References: <1341836323-43916-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-4sGk72btFe6WMSXsMC7q"
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


--=-4sGk72btFe6WMSXsMC7q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-07-09 at 14:18 +0200, Richard Weinberger wrote:
> This is the next round of UBI fastmap updates.
> It fixes all issues pointed out by Shmulik. :-)
>=20
> If you want to test fastmap you can use my git repo:
> git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git ubi2/v17

Richard, would you please rename the 'fm_auto' kernel parameter to
"fastmap_auto", which is a bit more user-friendly.

Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-4sGk72btFe6WMSXsMC7q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQGswOAAoJECmIfjd9wqK0insQAI8mpnKxO8/ObwMpKUfTnyEk
zrHgHZb+J0Fu7NNbVXqaSjK1I98MStmQQmRSx7/VmWNwqzZT/PbHsUo9ELNvtjmP
ODE/4JLZgSQqysZ/NvUe1myO+qjUp0vTJmAgwOsHx25LCHwxJcJJIcxgLFkXJJNh
Bk12NeAWaXJa28GJOJbYKN5tcHOfwAavDgJh11xEDtxNMUI3LfCYKoXGoatHpDMD
+PgZ9Pdu4/xYA82KhHOgSX5uiqpKBoCD81pj4X2YW/AszVfiEABmrdS50oGWVPMB
u3j8MnNBTAzGtbm2vhWVsDitWySGWho9uWHJeHfByXRo+XzrPz+REEntG/imqs7n
r8/hxjZyryY13F2PHirtqNBZ4ixgO3NTI17FzkBWIC0QkBa2JgmSyUdDrlRLS+28
i4r3ojW+umldBenYPK+GrsmdxsJBbuD1XOdYtyoZgjz3UnfeM5y/Lh7llbnWSwUo
n4UlINTLizzGkgv/K6VB4iMF/AJLLCDehNLnCNzwyr8eCdzi761KypOdysrZU9JU
7pZiWivZARcQwi9W2LXEVEzG216tvXt8GRInPsZWQkFUn7gqWTV3oDqHmDatQjB3
esTuOkvX6tf0K4e2fLgsJS+wqlJqO+J7/JBCavN8hmK88jm3RUBMDDiHWCTmTW2O
dpD3LSsJjYEtNsh6WNaH
=OUeG
-----END PGP SIGNATURE-----

--=-4sGk72btFe6WMSXsMC7q--
