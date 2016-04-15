Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ar0AA-0003Ii-Ea
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2016 09:35:44 +0000
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
Date: Fri, 15 Apr 2016 11:35:07 +0200
Message-ID: <33206452.D8BR53ndXi@adelgunde>
In-Reply-To: <20160415103508.5f6bc8c8@bbrezillon>
References: <1456059126-25469-1-git-send-email-mpa@pengutronix.de>
 <7168760.YSQBa3GsdA@adelgunde> <20160415103508.5f6bc8c8@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3305752.jEjycaEBCV";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nextPart3305752.jEjycaEBCV
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Boris,

On Friday 15 April 2016 10:35:08 Boris Brezillon wrote:
> Hi Markus,
>=20
> On Fri, 15 Apr 2016 09:55:45 +0200
> Markus Pargmann <mpa@pengutronix.de> wrote:
>=20
> > On Wednesday 13 April 2016 00:51:55 Boris Brezillon wrote:
> > > On Tue, 12 Apr 2016 22:39:08 +0000
> > > Han Xu <han.xu@nxp.com> wrote:
> > >=20
> > > > > Thanks for the feedback. Talking with a coworker about this w=
e may have found a
> > > > > better approach to this that is less complicated to implement=
. The hardware
> > > > > unit allows us to set a bitflip threshold for erased pages. T=
he ECC unit
> > > > > creates an ECC error only if the number of bitflips exceeds t=
his threshold, but
> > > > > it does not correct these. So the idea is to change the patch=
 so that we set
> > > > > pages, that are signaled by the ECC as erased, to 0xff comple=
tely without
> > > > > checking. So the ECC will do all the work and we completely t=
rust in its
> > > > > abilities to do it correctly.
> > > >=20
> > > > Sounds good.
> > > >=20
> > > > some new platforms with new gpmi controller could check the cou=
nt of 0 bits in page,
> > > > refer to my patch https://patchwork.ozlabs.org/patch/587124/
> > > >=20
> > > > But for all legacy platforms, IMO, considering bitflip is rare =
case, set threshold to 0 and
> > > > only check the uncorrectable branch and then correct data sound=
s better. Setting threshold
> > > > and correcting all erased page may highly impact the performanc=
e.
> > >=20
> > > Indeed, bitflips in erased pages is not so common, and penalizing=
 the
> > > likely case (erased pages without any bitflips) doesn't look like=
 a good
> > > idea in the end.
> >=20
> > Are erased pages really read that often?
>=20
> Yes, it's not unusual to have those "empty pages?" checks (added Arte=
m
> and Richard to get a confirmation). AFAIR, UBIFS check for empty page=
s
> in its journal heads after an unclean unmount (which happens quite
> often) to make sure there's no corruption.
>=20
> > I am not sure how UBI handles
> > this, does it read every page before writing?
>=20
> Nope, or maybe it does when you activate some extra checks.
>=20
> >=20
> > >=20
> > > You can still implement this check in software. You can have a lo=
ok at
> > > nand_check_erased_ecc_chunk() [1] if you need an example, but you=
'll
> > > have to adapt it because your controller does not guarantees that=
 ECC
> > > bits for a given chunk are byte aligned :-/
> >=20
> > Yes I used this function in the patch. The issue is that I am not q=
uite
> > sure yet where to find the raw ECC data (without rereading the page=
).
> > The reference manual is not extremely clear about that, ecc data ma=
y be
> > in the 'auxilliary data' but I am not sure that it really is availa=
ble
> > somewhere.
>=20
> AFAIR (and I'm not sure since it was a long time ago), you don't have=

> direct access to ECC bytes with the GPMI engine. If that's the case,
> you'll have to read the ECC bytes manually (moving the page pointer
> using ->cmdfunc(NAND_CMD_RNDOUT, column, -1)), which is a pain with
> this engine, because ECC bytes are not guaranteed to be byte aligned
> (see gpmi ->read_page_raw() implementation).
> Once you've retrieved ECC bytes (or bits in this case), for each ECC
> chunk, you can use the nand_check_erased_ecc_chunk() function (just m=
ake
> sure you're padding the last ECC byte of each chunk with ones so that=

> bitflips cannot be reported on this section).

Thanks for the information. So I understand that this approach is the
preferred one to avoid any performance issues for normal operation.

I actually won't be able to fix this patch accordingly for some time. I=
f
anyone else needs this earlier, feel free to implement it.

Best Regards,

Markus

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart3305752.jEjycaEBCV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXELXLAAoJEEpcgKtcEGQQMVAP/A/F5GYTkoThwzGcx7pHrgun
C0aJ5sXagEywrJ4ehMF7VPy+8InGpGYsLLPUII5iiWpRFaORpWlunChfTMzHs1Js
UupkpYkmM5unw1Z7fb3vZaKMyHBLkiSTQGlhocgHlQEaqQFCJadP5NmVleKKz4hK
WVN4AA89VnMbk//ViPKrYZz2KTJu0zXp+R3UYA9XzrCGIkGS1Wrd9R72YapxN5hy
0DQSueY965sUaXi+VcV5rzZ/cpDCd6rVtkSDm3Aopkl4Qn5/7YaEGVx5/6aaiiHF
FdExV4ZNlQ78Gyg0MpEA94q+Cj7VynxVC7NaLG0eW0Ij0H6nfutUIu2Wggzzn7a/
rVvCbQ946eoBTSGuzLKrEn29/V3YNUCwoTEml08NI900haK/eJSr98U2SHJesXCZ
sHSre1SfH53mfEh0vHJWsTt6g8CyOd5sQ3y+haJyBMqsqk8JbQB6m177Cpchuzkx
WCDaXtRKrpLDfRzbION0GYraEElxGMCznzK90ydf/M5mIxCflcabeMQJZlTzmJFG
W6ys9UwGA3jE5NPqk8ie0Taa0uxWPIJPhw0mtNxSiIv+2D8c9Jh04ByxU+VepDHk
LAA7YG0kPn+cYAM5prhZM+ZO2oqBxbrAS4ggaxXlJw9OEMyPRy04QS2MMMn6N7Pn
cd2ASP3aBm0v2OY3u3wP
=p+sM
-----END PGP SIGNATURE-----

--nextPart3305752.jEjycaEBCV--
