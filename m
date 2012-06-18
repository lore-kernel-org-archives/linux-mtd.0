Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgZpE-0005Ab-Rn
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2012 11:08:53 +0000
Message-ID: <1340017963.2420.29.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: nand: Use the mirror BBT descriptor when reading
 its version
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>, Mike Dunn
 <mikedunn@newsguy.com>,  Robert Jarzmik <robert.jarzmik@free.fr>
Date: Mon, 18 Jun 2012 14:12:43 +0300
In-Reply-To: <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
References: <20120610135812.01dce4e7@pixies.home.jungo.com>
 <CAN8TOE_Li5bysfUS_MPPaBOF-vC64s3j-feTqfUJQsR6c_yb+A@mail.gmail.com>
 <1339497736.2401.24.camel@sauron.fi.intel.com>
 <CAN8TOE9icRO8t_qwn-k3R+Q1y1X39-PZU=devSW07YpDW_KqNQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-UVJHacVhheXFaZ1iJ7fy"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-UVJHacVhheXFaZ1iJ7fy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Let's probe Mike and Robert and see what they say.

On Tue, 2012-06-12 at 17:42 -0700, Brian Norris wrote:
> On Tue, Jun 12, 2012 at 3:42 AM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
> > On Sun, 2012-06-10 at 22:59 -0700, Brian Norris wrote:
> >> On Sun, Jun 10, 2012 at 3:58 AM, Shmulik Ladkani
> >> <shmulik.ladkani@gmail.com> wrote:
> >> > - Not runtime tested.
> >>
> >> Patch looks fine, but this makes me curious: does anyone use
> >> NAND_BBT_ABSPAGE? It looked broken to me when I tried it not too long
> >> ago, but I didn't look too deeply. (I doubt that this typo was its
> >> only problem, but I may try again...)
> >
> > Looks like this is used in diskonchip.c.
>=20
> Hmm, OK. This driver seems to be very stale (very few real
> fixes/improvements in git history). Anyone know if diskonchip.c even
> works with the current BBT code?
>=20
> I retried NAND_BBT_ABSPAGE on my own driver, and it seems that this
> code-path has no ability to *create* a bad block table where one
> didn't exist previously. It simply reads whatever data is present at
> the given page(s) (according to td->pages[]), regardless of ECC
> errors, junk data, lack of BBT markers (i.e., "Bbt0" or "1tbB"), and
> versioning.
>=20
> So when I use NAND_BBT_ABSPAGE with an erased block at page 1024, I
> get the following:
>=20
>    Bad block table at page 1024, version 0xFF
>=20
> And no blocks are detected bad (simply because there was 0xff "table
> data"). But then, I get even worse results if the uninitialized BBT
> block has arbitrary (non-0xff) data! nand_bbt would just mark random
> blocks as bad...
>=20
> So, this "feature" seems severely limited - designed for a somewhat
> static, pre-initialized BBT. I can probably survive by continuing to
> ignore this eyesore, but I'd rather just fix it or kill it.
>=20
> Brian

--=20
Best Regards,
Artem Bityutskiy

--=-UVJHacVhheXFaZ1iJ7fy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP3w0rAAoJECmIfjd9wqK02CoP/2lZqpKJmdFQ4xcOASBOfRPB
JUmBiZCSYwUJ8MyqbC+itQIVpBrlxmc80LA31D350sM6uXMZ0yUh4dYF0GixwIx8
5kO4rzsSAKAohId1X5Mh/BoITnAIU2IiIQRBWRmuz88D9APfYthaaIlP1IyGTMSj
tQ49pQ1XJPl5mMe8JVYrrZGYkU3m1IQ38t0aqS3C8Us88MIfl+6bsWKrPfi5OFhm
WGX6GCKBy0iGp5MzIz2HzveSdLqrqbIfzXRchwh+52kYNtjnh58HCGt6GhW4wg7w
2awouRpxXcGakLo14Yjih6iey2Lb5zCf0VRwINs0rIoqT1OlTjNH4gwIlMH33h+/
8IpewWcWHk6Fz/P6B/QNaRmBY+AdBLzp1NcQoJOTsIqbYuj3lPtsqVl3YRAy4lsE
HZ0ygZVnsiNCdLqhTr/oXOG+0F1e2LCGWeuZ22i6LUk522hQ2yOdPor63RYaWWFy
6VAy8xG3fLAP8ao2MO3lRmqIfKNsVmELSybEfDXKtFbmLGw9ssM4Jbzmw3dk27YI
xSdBSGU3Rf/1L7/aJ9RQPIpN1Ruw0WrURZQZSEZ18VQXnMR3/xXHabwfMkVHkzji
ZyBTxUuoVJrZPCV4kPwJjVRx1SyVciB4YzD0ZvqlrtdaLdsGCuXDfj2z2MH9T+Ly
PjJ90PtN8GRy3ASMrICw
=LE9V
-----END PGP SIGNATURE-----

--=-UVJHacVhheXFaZ1iJ7fy--
