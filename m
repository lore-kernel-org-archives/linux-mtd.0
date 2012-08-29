Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T6ddX-00085u-RB
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 08:28:32 +0000
Message-ID: <1346229208.2848.441.camel@sauron.fi.intel.com>
Subject: Re: ARM: LPC32XX SLC ECC Handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roland Stigge <stigge@antcom.de>
Date: Wed, 29 Aug 2012 11:33:28 +0300
In-Reply-To: <50377989.1050401@antcom.de>
References: <50222E55.5070204@embedded-brains.de>
 <1345808311.2848.286.camel@sauron.fi.intel.com>
 <50377989.1050401@antcom.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-Q7y2B26LQnMxDTm+UcOt"
Mime-Version: 1.0
Cc: Sebastian Huber <sebastian.huber@embedded-brains.de>,
 Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-Q7y2B26LQnMxDTm+UcOt
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-24 at 14:54 +0200, Roland Stigge wrote:
> Hi!
>=20
> On 24/08/12 13:38, Artem Bityutskiy wrote:
> >> the LPC32XX SLC controller has a ECC feature that covers only the
> >> main data area, but not the OOB data.  Is it the responsibility
> >> of the user to protect its OOB data via an ECC?  The LPC32XX MLC
> >> controller on the other hand covers the complete OOB data with
> >> its ECC.  How can a user determine if it has to protect its OOB
> >> data?
> >=20
> > I guess it is good idea to CC the author of the drivers.
>=20
> Thanks for CC'ing, would have missed it.
>=20
> Yes, it's exactly as Sebastian described - only the MLC controller
> covers OOB in ECC.
>=20
> At this point, I need to give back the question to the MTD
> maintainers: Is there an API how we can help users at this point? I
> would be happy to implement it.

Well, I guess from the user's POW the driver either protects OOB data
with ECC or not. There is no interface for detecting this in MTD, but I
do not see why someone could not create it.

Am I right that we are talking about the situation when OOB and data
areas are covered by different ECCs, or this is about user writing data
+oob at one go, and everything is covered by the same ECC?

--=20
Best Regards,
Artem Bityutskiy

--=-Q7y2B26LQnMxDTm+UcOt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQPdPZAAoJECmIfjd9wqK0o20QAI/cuFyxocMJbkkz8aCJkN0r
iJLbI/Ol4LaGf1H043kqXuMhuQEGhOvfPIO0W9OqkHFyQ2hIXEuZogBXhvpwMTYD
s/4T94G1ZjwnGjoEmSkQA9V+kp6bZAgGyg6uAnrqdew/VITa+8VCJ3NZw2xJl6Wu
brh0j4ncivEz4MQjEFfxWhLa51bIBgLo2/XNzEFrbxMNXuB/pIKPg1HH3dwmMOV7
SGzvLn9Bx7NWYeHT7Y+moWkK62jnqxZq7Rk2dmigCGoVc2vVVTGZhMSTt4ilKjpK
Z83Vult//rbwK4/1uWWXez43V6pu+TfXANIcj/UasBWGCsjj/naTMYY60lLpiN1r
P4dIIdD9wSzjqml6PJiX6kwa7/mL9WRUAMGam/mTUILrQ3Yakh+ruTKfqvRyTPkj
aoLgSxVKNyAvMm0pKG/pkm20cH23jHeQe2otoKATTQIs3q3BSD89TJsEVB3T6Sef
/HWFyUu1JuVY8cUm/s5S6pvZTQvUR0zU1DvyblXHh72RPMYE9z/jKJgPU7HbxsK+
23onNEoVRV2DsRI0hDBJhYTVt/+TR54VZpFTYP09dJKR9m3yp9hgCijKKufSOPaJ
xpos819FV0/CPfY+m4K+l5uSDlH0nyPee18xBSdRFDDo96wQf5FNFZuaO32oVOkA
LlEifZCsOI2UiU9eeQ6M
=ubJD
-----END PGP SIGNATURE-----

--=-Q7y2B26LQnMxDTm+UcOt--
