Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3N5w-0000Gl-4l
 for linux-mtd@lists.infradead.org; Mon, 20 Aug 2012 08:12:21 +0000
Message-ID: <1345450620.2848.12.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/4] UBI: replace MTD_UBI_BEB_LIMIT with user-space
 parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 20 Aug 2012 11:17:00 +0300
In-Reply-To: <CACQ1gAh7db9Dnqouzv5S=uAfTfavw45dwWSRAozGU4s7y8FA9w@mail.gmail.com>
References: <1341937423-16516-1-git-send-email-richard.genoud@gmail.com>
 <1341937423-16516-5-git-send-email-richard.genoud@gmail.com>
 <20120816115713.726da8f2@pixies.home.jungo.com>
 <CACQ1gAhFJ6AKYJpc1ZiHm+3Y=APnwUmVL3f0KW=OFMDMWzCVJg@mail.gmail.com>
 <20120816134234.32b468f6@pixies.home.jungo.com>
 <1345124012.3393.239.camel@sauron.fi.intel.com>
 <20120819100946.646cbb8a@pixies.home.jungo.com>
 <1345403092.1930.4.camel@kyv>
 <CACQ1gAh7db9Dnqouzv5S=uAfTfavw45dwWSRAozGU4s7y8FA9w@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-IUx3Saz9a/lyA5X1WIiy"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-IUx3Saz9a/lyA5X1WIiy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-08-20 at 08:55 +0200, Richard Genoud wrote:
> Hi Artem,
> 2012/8/19 Artem Bityutskiy <dedekind1@gmail.com>:
> > Yeah, I wanted to make it 1..256 but forgot, will do now. 0..256 would
> > need some more work to avoid division by 0.
> Division by 0 is handled in the get_bad_peb_limit() function, I don't
> see another dangerous place.

        if (mult_frac(limit, 1024, max_beb_per1024) < device_pebs)

will divide by 0 if max_beb_per1024 is 0.

> (and if we want to be coherent with user-space, it should be 0..255,
> as the range is coded with an u8)

I think it should be uint16_t instead, because we are defining ABI here
and we should not assume no one will ever nee values higher than 255.

--=20
Best Regards,
Artem Bityutskiy

--=-IUx3Saz9a/lyA5X1WIiy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQMfJ8AAoJECmIfjd9wqK0avkP/0kybOWI/RMspTGm3CaHoBE4
BkAxoPJnH3lYH+Ug+GE2YAnvcLb32jierhZ/WbDLLvQC7fAF3kuhl0lVdYIBGXp/
XG/VSD6qx/Y00bzVYSaHPOdAANdKyl/CyGbqlidXCcSQtn3BYLoAtbQj5nkynYf9
D2APlqud1hs/zgRJKud8m3/735cadJS0Po578CiSq+L8ut042IITvNMcJVlYLp84
uYaxbajBR0yUZBmmM+LiM6irf4+XnX9FqTbKsZn4oSVKW3k76OSYTAxLp9t/BTXk
N3IH9EcnteIcJAE70oRzBSTstG5qgkEz7BmAxPMid78kanvThftxaRNKbtC39/CF
A5ceNr5UOxUxq8R0NzQgHKc8TdXtLkh9TxXp+6zYwHyDZkk8GtEy0viYpIZncuan
MbRv6gv5bpNpqjcBjpjazTEgx9zyLvxuhW+lW68M/3os5ScWoJ+Hq1mh13CPlYAP
AAe3M9J/waxdfwTrweDDmWkYkwShq8gp1pOqmm0fAvyhw7kTfPuhbMHBe/ij40B2
u7mGoetKtVznKyU4cvDBgf/dcv6Fy5zUaclj/wGWV1XocFBqJ7Y+GFFcSy2NBw3l
+zqF/uJAD4/vHFEDUi3M1v40yqXivdgL+rmkBwrG9vD/kFEv5IbGJ2Pj82e+L9BA
GLRYA+HXFgxBGs/24HV6
=yztP
-----END PGP SIGNATURE-----

--=-IUx3Saz9a/lyA5X1WIiy--
