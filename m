Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkYQG-000791-Be
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 10:27:33 +0000
Message-ID: <1340965897.3070.144.camel@sauron.fi.intel.com>
Subject: Re: mtd nand erase and bad block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Date: Fri, 29 Jun 2012 13:31:37 +0300
In-Reply-To: <4FEAFE73.2040303@st.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
 <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
 <4FC87D62.6020402@st.com> <1338540121.2536.150.camel@sauron.fi.intel.com>
 <20120601140445.346e322e@halley> <4FC8CBA7.6000702@st.com>
 <20120601175407.7c39a8fb@halley>
 <1338898670.2507.48.camel@sauron.fi.intel.com> <4FDEF60A.7010607@st.com>
 <1340790846.29342.19.camel@sauron.fi.intel.com> <4FEAFE73.2040303@st.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-64mtFazyfaXwE7Q5+fT7"
Mime-Version: 1.0
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-64mtFazyfaXwE7Q5+fT7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 13:37 +0100, Angus CLARK wrote:
> However, for case 2, I just want to force the erase operation so I can wi=
pe the
> BBTs and return the device as close as possible to its original state.  W=
e could
> put some logic in the kernel, "if 'MEMBBSCRUB" on BBT blocks, do not
> update/rewrite BBTs", but I think this "policy" decision would be better =
handled
> in userspace.

Sounds like you need 2 separate ioctls:
1. MEMBBSCRUB
2. MEMBBTWIPE

--=20
Best Regards,
Artem Bityutskiy

--=-64mtFazyfaXwE7Q5+fT7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7YQJAAoJECmIfjd9wqK0FyYP/2Hi1NIbNasq2TMyB4da0hXI
SmzHHdgP8cU4tQiXinFs3Cl5HcyUjnbCFnqtJeRCXp6mAgAtqgeV/CVSZiPBZ3Ef
kXvtH4Mvvvc4LdZaa+kxVyPEHplDo9+AWbannknQRj9fstwsMGtdrqyUBAZ7gXrS
ES2YFK9wDr6y+JAv06E6FyMJ9Nbm3mdV61RO6KNbgpNeFJbLma8fmpsF6AuLdejk
lSvorNgzGBkjDK5o0exbRyttlqHCSZjpqpbhe6ajLWGJLFaKwMrHi4u6a1Jlcofu
FXH2TXkNs3M1Kviygj3zzxH/oZYmpGUeyD3HisH+HFzMDsMBC4GAxgi5HlbPJLXP
8BM1kquZQB5aKURQhIPIT6UyM7c14XmydkvfZwUvCG7wmSSLoIcgF9Tag1Ekk/lN
GCI9AQNXt1Go+eDeEKq2zxLGwk6Oy/08LOqNN0TIuNV1LnK16PLxQQMmtW3wbfFC
zjKoagXPcxEkwMDDieB2HRXr9idpMoKHgpuhcIkuVkEVwZg8nf22sfA6AF7eI5+F
alEPrtfMtoUxhBVLgyr2I0fY/S1q18nc2xBrKZHOGXO9Uw0/24+M4vsV8n3jjywH
qLyhgLTYRGsWf/5TWN4ELUFDDp59z6LGoVok4cKgrDoppJx4aAplKsLddndOgeMg
AuNKxs0W3uYE/i7ymMMV
=m5Wl
-----END PGP SIGNATURE-----

--=-64mtFazyfaXwE7Q5+fT7--
