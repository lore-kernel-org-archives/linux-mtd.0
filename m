Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T60ou-00014T-D5
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 15:01:41 +0000
Message-ID: <1346079995.2848.358.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubifs: make debug messages more silent
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 27 Aug 2012 18:06:35 +0300
In-Reply-To: <1345451602-22494-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1345451602-22494-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-15S7w6cPKiv6Iw6yoN0V"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>,
 kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-15S7w6cPKiv6Iw6yoN0V
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 10:33 +0200, Uwe Kleine-K=C3=B6nig wrote:
> With pr_debug being used instead of printk(KERN_DEBUG ...) the messages
> don't make it into the bootlog without further actions. This saves 32
> lines of ubifs messages for me that are not needed most of the time on a
> system with / on ubifs.

I've pushed different patches to both UBI and UBIFS - now they print
much less. I've sent you the patches, but I've actually modified them
after sending. If you want to see the last version, let me know. They
are available in the UBI/UBIFS git trees.

--=20
Best Regards,
Artem Bityutskiy

--=-15S7w6cPKiv6Iw6yoN0V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQO4z7AAoJECmIfjd9wqK0b+QP/Rabplqll3GOJJKlLmofYt4U
KpRLY8ZqXRRTB11tJUgasrJOsMOMrchq2iBrxt8bx0DLLBo4bxcOVM5YDIXOHyxz
a9M41ft8FJkLBkevsDrbMIfuLvDtQbFPW9lzXMgR1vheXjFyeVgiRATH7mn7GblJ
FjjQnNopxGAyaQfTOFi6MfLwU+1ptR6MaSH0g+wHFVd+Wfo7nHMQCb+6kFhIyxgN
Uq+Kh0CqcrqPIX3SPKTCyupdVNI1Y1AbpA/N7Au4QVnTsKemxhcCfQbG/TJquwpy
gWj411qgVTOe41YReeSLUPFOIi9Qb6Cm5dkAvIDQVuLF0HhdQuCsFGMh8w9BSs7O
KMTNsbeRsya7flZRN3tG7H6r9Bv95ROIUikDZ4a7CBYFSwK/qNWr5eHNtKJv5ql0
+FQrdcT7mWiCY+kTB2sIt38RB7/kZWRcXgQOrC/Pl8/+d57oYi/sn2EfGttg8n/E
u/BJlYBPMc9HUz9TNsvXp6si5kAg0YbC1gUgfUcY2L03Unx/uj9rW86ue5G1x3r4
/OAIfjIY9c/2RmAwNmh0vwykh3FNmz56wK2g2+afEK56mbF/SoxjbisdwK78pLYm
AFAWomDIMqv3it719P3G4DtW9bcv/Ek/LpuUmDcUxk8kdLRfRanxoBCgHhIKk54e
6t+Ew3OLe4lmsG7237Fo
=po0h
-----END PGP SIGNATURE-----

--=-15S7w6cPKiv6Iw6yoN0V--
