Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8nmR-0004PW-0h
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2012 07:42:39 +0000
Message-ID: <1346744853.12610.7.camel@sauron.fi.intel.com>
Subject: Re: FW: UBIFS tools and latest 2.6.33 kernel from
 http://git.infradead.org/users/dedekind/ubifs-v2.6.33.git
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 04 Sep 2012 10:47:33 +0300
In-Reply-To: <504448B1.4050205@gmail.com>
References: <886EEBE3AFFFB144AA8169C199AB4E6AA7BC4D5FB8@BBMBX.backbone.local>
 <1346416026.9709.47.camel@sauron.fi.intel.com>
 <CAN8TOE8j9gxpXAmL51gqaW8=TFLQLPhp03inryx_-uZv4901Ng@mail.gmail.com>
 <1346583467.2533.1.camel@kyv> <504448B1.4050205@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-A0bcngxGpfAKGRu5TwrK"
Mime-Version: 1.0
Cc: David Clark <dclark@tantalus.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-A0bcngxGpfAKGRu5TwrK
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2012-09-02 at 23:05 -0700, Brian Norris wrote:
> On 09/02/2012 03:57 AM, Artem Bityutskiy wrote:
> > On Fri, 2012-08-31 at 15:18 -0700, Brian Norris wrote:
> >> There was a series of 'writebufsize' fixes that may be missing from
> >> multiple backport trees. I can help you track them down, if you'd like
> >> the help.
> >
> > Sure, go ahead, I can them put them to the backport trees.
>=20
> OK, I just put up my own github backport tree, with branches for v2.6.32=
=20
> through v3.3. I think your v3.4+ repos are fine. URL:
>=20
>    git://github.com/computersforpeace/UBIFS-backports.git
>    https://github.com/computersforpeace/UBIFS-backports.git

Thanks Brian, pulled all the branches.

--=20
Best Regards,
Artem Bityutskiy

--=-A0bcngxGpfAKGRu5TwrK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRbIVAAoJECmIfjd9wqK0FPYP/R0hhTOzeOyzUejKvlVZni/o
YM0LOAgv58r9cjg+BBWxtbDGLMTNfz9qVgVtH1unOMkig60aEQHazwzHsjVld7kR
rCs40hQx1mQ3Nar7srMiJEsjY/HVZhLKgIJm/vbDwJQxqlPMi9ZQZjcDVayPjDDM
KNfqlCwpEv1FQ2lNnUiruhES0oYGp7q7pHYEnoyO7Pzv1R+sP1wHOFZcDy04Heg5
NPsdfWbPBDvtnv/Z8TNbyAb88y/c9zVGkpWrfzZpvb/6NcpXA+/+UP1SGvhRSkl/
MkMxx5KJ2GxQoglPsXm8U5eosQ6erS4a4X5mUj3PTifPIv3pI9AnGnF+Rby4Igfw
dm7YMYYyBos+6LfKuupQAHguOl6RkFC6SUXuUCosIiHP30yoFPXDjaDLFI6NgYU4
ttLFn2RKBWFnXTmQ8KYT3LlQXmKqhFh5A2ruNOv021yo/qs6F2tC78cfTpH0ivUR
laf1NsUUn2qMs/ssXzDMEu82vmMyPvTEQcotakUa8g0kHx4LXLrW5xtxzI3BWm1U
3drQ1bXYI0+fU0s6579uZ1z7YWo8Y2KsMWqR/MgI/nmTRnl8bYREGe+EKqYC1uDi
5tQmSD2dukQfNK9Vw9ZdmMolPX8fnyGWIpbGQhIRTbE91vE08mTBCjrwq9uVEeTm
5n60jyMBAs3x+7HR9nzj
=5i1q
-----END PGP SIGNATURE-----

--=-A0bcngxGpfAKGRu5TwrK--
