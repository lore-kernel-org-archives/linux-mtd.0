Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar2Tv-0004Xm-SH
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 12:04:17 +0000
From: Markus Pargmann <mpa@pengutronix.de>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, David Woodhouse <dwmw2@infradead.org>,
 Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Huang Shijie <shijie.huang@intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Stefan Christ <s.christ@phytec.de>, Elie De Brauwer <eliedebrauwer@gmail.com>,
 Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] gpmi-nand: Handle ECC Errors in erased pages
Date: Fri, 15 Apr 2016 14:03:45 +0200
Message-ID: <1733015.oJ2G1KSZLY@adelgunde>
In-Reply-To: <20160415113906.7f971cec@bbrezillon>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <33206452.D8BR53ndXi@adelgunde> <20160415113906.7f971cec@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2900950.O350yKES1G";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart2900950.O350yKES1G
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Boris,

On Friday 15 April 2016 11:39:06 Boris Brezillon wrote:
> Hi Markus,
>=20
> On Fri, 15 Apr 2016 11:35:07 +0200
> Markus Pargmann <mpa@pengutronix.de> wrote:
>=20
> > Hi Boris,
> >=20
> > On Friday 15 April 2016 10:35:08 Boris Brezillon wrote:
> > > Hi Markus,
> > >=20
> > > On Fri, 15 Apr 2016 09:55:45 +0200
> > > Markus Pargmann <mpa@pengutronix.de> wrote:
> > >=20
> > > > On Wednesday 13 April 2016 00:51:55 Boris Brezillon wrote:
> > > > > On Tue, 12 Apr 2016 22:39:08 +0000
> > > > > Han Xu <han.xu@nxp.com> wrote:
> > > > >=20
> > > > > > > Thanks for the feedback. Talking with a coworker about th=
is we may have found a
> > > > > > > better approach to this that is less complicated to imple=
ment. The hardware
> > > > > > > unit allows us to set a bitflip threshold for erased page=
s. The ECC unit
> > > > > > > creates an ECC error only if the number of bitflips excee=
ds this threshold, but
> > > > > > > it does not correct these. So the idea is to change the p=
atch so that we set
> > > > > > > pages, that are signaled by the ECC as erased, to 0xff co=
mpletely without
> > > > > > > checking. So the ECC will do all the work and we complete=
ly trust in its
> > > > > > > abilities to do it correctly.
> > > > > >=20
> > > > > > Sounds good.
> > > > > >=20
> > > > > > some new platforms with new gpmi controller could check the=
 count of 0 bits in page,
> > > > > > refer to my patch https://patchwork.ozlabs.org/patch/587124=
/
> > > > > >=20
> > > > > > But for all legacy platforms, IMO, considering bitflip is r=
are case, set threshold to 0 and
> > > > > > only check the uncorrectable branch and then correct data s=
ounds better. Setting threshold
> > > > > > and correcting all erased page may highly impact the perfor=
mance.
> > > > >=20
> > > > > Indeed, bitflips in erased pages is not so common, and penali=
zing the
> > > > > likely case (erased pages without any bitflips) doesn't look =
like a good
> > > > > idea in the end.
> > > >=20
> > > > Are erased pages really read that often?
> > >=20
> > > Yes, it's not unusual to have those "empty pages?" checks (added =
Artem
> > > and Richard to get a confirmation). AFAIR, UBIFS check for empty =
pages
> > > in its journal heads after an unclean unmount (which happens quit=
e
> > > often) to make sure there's no corruption.
> > >=20
> > > > I am not sure how UBI handles
> > > > this, does it read every page before writing?
> > >=20
> > > Nope, or maybe it does when you activate some extra checks.
> > >=20
> > > >=20
> > > > >=20
> > > > > You can still implement this check in software. You can have =
a look at
> > > > > nand_check_erased_ecc_chunk() [1] if you need an example, but=
 you'll
> > > > > have to adapt it because your controller does not guarantees =
that ECC
> > > > > bits for a given chunk are byte aligned :-/
> > > >=20
> > > > Yes I used this function in the patch. The issue is that I am n=
ot quite
> > > > sure yet where to find the raw ECC data (without rereading the =
page).
> > > > The reference manual is not extremely clear about that, ecc dat=
a may be
> > > > in the 'auxilliary data' but I am not sure that it really is av=
ailable
> > > > somewhere.
> > >=20
> > > AFAIR (and I'm not sure since it was a long time ago), you don't =
have
> > > direct access to ECC bytes with the GPMI engine. If that's the ca=
se,
> > > you'll have to read the ECC bytes manually (moving the page point=
er
> > > using ->cmdfunc(NAND_CMD_RNDOUT, column, -1)), which is a pain wi=
th
> > > this engine, because ECC bytes are not guaranteed to be byte alig=
ned
> > > (see gpmi ->read_page_raw() implementation).
> > > Once you've retrieved ECC bytes (or bits in this case), for each =
ECC
> > > chunk, you can use the nand_check_erased_ecc_chunk() function (ju=
st make
> > > sure you're padding the last ECC byte of each chunk with ones so =
that
> > > bitflips cannot be reported on this section).
> >=20
> > Thanks for the information. So I understand that this approach is t=
he
> > preferred one to avoid any performance issues for normal operation.=

> >=20
> > I actually won't be able to fix this patch accordingly for some tim=
e. If
> > anyone else needs this earlier, feel free to implement it.
>=20
> I just did [1] (it applies on top of your patch), but maybe you
> can test it (I don't have any imx platforms right now) ;).

Great, thank you :). I just tested the patch and it works for me. The
erased page bitflips are still detected and fixed. I will send a new
version then.

Best Regards,

Markus

>=20
> If these changes work, feel free to squash them into your previous
> patch.
>=20
> Thanks,
>=20
> Boris
>=20
> [1]http://code.bulix.org/bq6yyh-96549
>=20
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart2900950.O350yKES1G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXENihAAoJEEpcgKtcEGQQYCQQAJ3bPFpCvEzWNXnzIAcR97zN
u8aN0+hiAAA+70pxdB28/AI8dIvEOMwYRKuYE1mCYdRUysSQbxWGZRIb7K8IIXly
fdvinci57GB+6EfEXsk8xh2x23lQoyRq9GthxgRnF6qlyuOUlI3ePvp1rcoKA+0l
+zQXUoTQKNW1XnrN1o7TBACzvx0IeZvIPnJOacI0FXvCEZ5mQi9Z4X2FpnIZ1qI2
W0Y6JYQffq/ez98zZ2hLtvMwCk0PRQbhTcar2UVzqRxuhIsYeYmS9M7UYRf128Ln
W8qBeRT6QXDCSpgb0bI8AlZo4xSJ6TMX7KdWGlJtiyVkMiAlHmgJc1EyygjfNW1I
IcTz4kTTIdUv/lGGiMOfQhXzUvpelcC/HIJ8hNSmTHye2jfhcwKOKu+iEpvE0wRP
sCkcb4QY/wqtDo702Aa08SEfPCZ4jtPiEJaBYaz25gj7F4ycSHMQxsNbDGS6f8K0
sB6/Bo2UQyE+yUsUVIwBkYyyOryqIFgdM5rZXljF5bEx1J8J5eTOvFOfQ4d3ZWPF
ndGPsLR1trQhenaLmm26kgFgnDzqBsgrz8q5IFLEucVHSL5bE+YmXzHJpFldHt9t
l5jwUlZbMLPiFyDzjOMRwO/8RGW6eLSgYCfk2u0lSiRlqL7uTGCY20y2885sm30G
3rVOA/+sHGpYhXZaXUcQ
=ZGMt
-----END PGP SIGNATURE-----

--nextPart2900950.O350yKES1G--
