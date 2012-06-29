Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SkaXy-0001zb-Ub
 for linux-mtd@lists.infradead.org; Fri, 29 Jun 2012 12:43:39 +0000
Message-ID: <1340974064.3070.177.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: add minimal amount of reserved erase blocks in
 Kconfig
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 29 Jun 2012 15:47:44 +0300
In-Reply-To: <20120628205303.676fa2ea@halley>
References: <1340636918-7505-1-git-send-email-richard.genoud@gmail.com>
 <20120628205303.676fa2ea@halley>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-u/ICHJlh0DvgjjppS7SY"
Mime-Version: 1.0
Cc: Richard Genoud <richard.genoud@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-u/ICHJlh0DvgjjppS7SY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-06-28 at 20:53 +0300, Shmulik Ladkani wrote:
> On Mon, 25 Jun 2012 17:08:38 +0200 Richard Genoud <richard.genoud@gmail.c=
om> wrote:
> > diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
> > index f6a7d7a..c2c6db0 100644
> > --- a/drivers/mtd/ubi/misc.c
> > +++ b/drivers/mtd/ubi/misc.c
> > @@ -100,8 +100,9 @@ void ubi_calculate_reserved(struct ubi_device *ubi)
> >  {
> >  	ubi->beb_rsvd_level =3D ubi->good_peb_count/100;
> >  	ubi->beb_rsvd_level *=3D CONFIG_MTD_UBI_BEB_RESERVE;
>=20
> BTW Artem, I've always had an unresolved issue with this original
> calculation... maybe you can shed some light here.
>=20
> Why 'beb_rsvd_level' is set to RESERVE percent of the 'good_peb_count'?

I thought it was a good idea I guess :-)

> As the device gets worn, number of 'good_peb_count' will lessen over
> time - and as such, the 'beb_rsvd_level' may vary (lessen) over time.

Yeah, probably you are right.

> I'd expect a fixed number of 'beb_rsvd_level' PEBs for a given mtd
> partition, or more correctly, as Richard suggests, the *sum* of bad PEBs
> plus the beb reserved PEBs should be constant for a partition - as I
> do not expect more than a known constant of blocks to go bad during
> device's (and thus, partition's) lifetime.

Those days we did not have this "vendor-guaranteed max. bad blocks
count" thing and I thought that UBI would try to always maintain a pool
of reserved PEBs.

Would you send a patch?

Note, one thing: if I already marked max. possible amount of PEBs as
bad, I just do not reserve any more. But if I have a plenty of available
PEBs anyway (my volumes are smaller than they could be, or I shrink one
of them), and another PEB goes bad, I should just mark it as bad. I may
print a warning, but should not panic.

--=20
Best Regards,
Artem Bityutskiy

--=-u/ICHJlh0DvgjjppS7SY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP7aPwAAoJECmIfjd9wqK0i18QAMLQWchq9a+ZO4Dfmoq+M0dX
ozO+L1Am3e68K5bjPWJmoS1RDknyRH0kTGjoiqhbrvg7xM7HYmslbsLATyMngj1F
3y4WDKmLWp80ddkzu8pJydDBLDnn4P/lhINOLCpMVmxNdc3gZfMdPMhytyViWSRO
OQSOybKpOMoTRnwzejv9cRNZZhsOh7y56ELqpQMpnCrBsh66KKvaU+g+bzOvCyjU
wx1XY/mv4dGbvdcT0Z3d8eg4q5nqQf6oFK2StucJAJI7oobn3tvCxuxoRZwKLhkS
0OLVc9oZUpPrSzNdFUzgTkT6CgJk+0aLQXXOA0uwuiwFnDZ2BAwRMck43MUBd+5N
0ZV/b4J+uZ0ovWpUAMyB3iU8siQ1mejkrV8heM/4irkTmPBq60SIh5Q9gJ1yYyyS
zDqELMl97vCZ7cDn44OgKmGLgcWuY3nFdpvzvKSbHv65FMIkbhmCpqcGHbDBwpL5
GBV3xWs9PBAFilA3uoEpQJpBvXfmUMx501FH0eH1tqZ+DKRlCCEKuqJB4FYMLvZ4
QZtI5+Ud0WWmaVPEeJaLcQxDjguwDuvT36nsnFS8hsD+5Vj9fkOlz1QfqIfDw3tV
iPETJbg0iq3yPz98gS4v/jW79aeqef4ebhFkhayaAWFDtApthsgAKzidNGI0xoVh
v+dswpLpHE0e/CUg7i/3
=P/h9
-----END PGP SIGNATURE-----

--=-u/ICHJlh0DvgjjppS7SY--
