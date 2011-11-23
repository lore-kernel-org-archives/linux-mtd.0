Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RT7VZ-0004PG-6q
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 07:44:41 +0000
Received: by iapp10 with SMTP id p10so1465755iap.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 23:44:38 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 23 Nov 2011 09:45:17 +0200
In-Reply-To: <CAMjpGUdxGfo7dfSNhzQUHg3QGkKW7rQewiFhDjGyJ0TjjQkdkA@mail.gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
 <1321743864.2167.6.camel@koala>
 <1321790131.15493.85.camel@shinybook.infradead.org>
 <1321794503.2170.3.camel@koala>
 <CAMjpGUdsdppTEOuPdWTGGU=ztbyvoF4_=TiZ1RqQ4W1_wFhbkQ@mail.gmail.com>
 <1321997940.2222.19.camel@koala>
 <CAMjpGUdxGfo7dfSNhzQUHg3QGkKW7rQewiFhDjGyJ0TjjQkdkA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-tNr0x0ZLFZRxKB4bgBFM"
Message-ID: <1322034324.24797.230.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-tNr0x0ZLFZRxKB4bgBFM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-22 at 17:21 -0500, Mike Frysinger wrote:
> On Tue, Nov 22, 2011 at 16:38, Artem Bityutskiy wrote:
> > On Sun, 2011-11-20 at 23:22 -0500, Mike Frysinger wrote:
> >> On Sun, Nov 20, 2011 at 08:08, Artem Bityutskiy wrote:
> >> > usage() {
> >> >        cat <<EOF
> >> > Usage: ${0##*/} <new_ver> <outdir>
> >> >
> >> > <new_ver>  - mtd utils version to create in X.Y.Z format
> >> > <outdir>   - the output directory where to store the tarball with th=
e
> >> >             gpg signature
> >> > EOF
> >> >        exit 0
> >> > }
> >>
> >> i'd have outdir be optional and default to $PWD
> >
> > Yeah, but this would require me to add options handling using getopt,
> > because optional parameters have to have an option. I just do not feel
> > it is necessary right now. This can be done at any point if someone
> > needs.
>=20
> i don't think so
>=20
> case $# in
>   0) usage ;;
>   1|2) ;;
>   *) fatal "Insufficient or too many argumetns" ;;
> esac
>=20
> new_ver=3D"$1"; shift
> outdir=3D"${1:-.}"; shift

I did not mean it is technincally impossible, I meant that it is just
normal Unix rule which I want to stick with, at least in simple cases:

1. Non-mandatory arguments come with options like -x <blah>
2. Mandatory arguments come come without options.

utility < -x blah and other optional stuff> <arg1> <other mandatory
args>

--=20
Best Regards,
Artem Bityutskiy

--=-tNr0x0ZLFZRxKB4bgBFM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJOzKSNAAoJECmIfjd9wqK0jKwQALZ+VkZqeC1QR/VxgZhw3jZL
lGbx6TqtmXqfNJESkqjjGd6z72rxn/aXtuCAWhaMBJknu/k2cCoGL8Z+V6oQVYcj
1CjX9Rj3HOhp01HlhIepqLyGoWpwjxlT8+/sO7ypLg5P0kA8Xng09hR5RUlCcDeJ
9yAid7Tb15rPZE2H0MErd5O8VWkQWVmvDQWVo7rCDfAPSZmvU8+4/cf1clePidaJ
21tkBrQNpCIqqCagjyV75TsqcndbCyiURWbSvgppToOFaoMgp1U1WbuI40E8zrLP
dF6rhnpJ/FVf9PjDsZ4WQJ1ayBtVYerMPBP2FcJD7LBotXnOnrvy+nJEBO7ZYlUZ
4Czczjl08bM+RVLGz8QLrq9gEVNvHxt5TvWrrtbWPdnvXBIxVRrtKJV3qrvdOVSx
17jjjGbNaIbtdJL+1q70oE7Ps6sOewW9vTQA28QskTtN02UgJi1v8irXDJlAZ9Vc
e1ZDLTHKGJqP6ybjPdlVhPV3cQEZi2RAcTB9i/JbYQwR8kb5ag+elsVjCq5T2Oar
qvrNOkAE6kGljeeQELlAf7q5z0aQSr4ucALKQ9MyoCeDHiwUdC43461zC2VGXSGu
sui8hIevEhXoByPv+vGqJ2uD9rlqthnZZQ8CAVjUVBn2L4o7RR/hwTxbPvmCUxOh
yx6g0neyxQjQoo5ScHCj
=6E27
-----END PGP SIGNATURE-----

--=-tNr0x0ZLFZRxKB4bgBFM--
