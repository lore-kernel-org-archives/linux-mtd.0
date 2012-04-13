Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIkHI-0005Yg-MO
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 17:27:21 +0000
Message-ID: <1334338208.13160.25.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: docg3 fix in-middle of blocks reads
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 13 Apr 2012 20:30:08 +0300
In-Reply-To: <1333970348-10319-1-git-send-email-robert.jarzmik@free.fr>
References: <1333970348-10319-1-git-send-email-robert.jarzmik@free.fr>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-e3IfoLJnORXvzm9tKc5r"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-e3IfoLJnORXvzm9tKc5r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-04-09 at 13:19 +0200, Robert Jarzmik wrote:
> Corner case reads do not work, and return false data and
> ECC. This case is typically seen in a ubifs usage, with a
> read of type:
>  - docg3 docg3: doc_read_oob(from=3D14882415, mode=3D1,
>  data=3D(c30eca40:12), oob=3D(  (null):0))
>=20
> This results in the following reads:
>  - docg3 docg3: doc_read_data_area(buf=3D  (null), len=3D111)
>  - docg3 docg3: doc_read_data_area(buf=3Dc30eca40, len=3D12)
>  - docg3 docg3: doc_read_data_area(buf=3D  (null), len=3D389)
>  - docg3 docg3: doc_read_data_area(buf=3D  (null), len=3D0)
>  - docg3 docg3: doc_read_data_area(buf=3D  (null), len=3D16)

I usually go my e-mails bottom-up, but since you pinged me I jumped at
your patch right away. Pushed to l2-mtd.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-e3IfoLJnORXvzm9tKc5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiGKgAAoJECmIfjd9wqK01YwP/1cL9tvBd/ElOAOHKe5mbcq7
wNioHbhuyrtxRtnxNMiI4nDYjCE+CMZ28rf0lYg1M7dSznbx+ou7wJbjADc6tQil
UK5Jq7gS3ZVvM299iAQX3roRcOH1iZuU07HBV3E16APmz9hu7sqUpm9frKcMn5sX
cSLSOlVHiBVEIi0T0OYeJ6LaLBrtVrnhFebzg5fl+159dp2InxuvLEvOoQ+6hkZx
ZRsQVO4uNAg244X4tl7BUc30+tjZDn6eIaelSIoffJ2PbY4ye++uIPorwObj8rCe
VSdDsrBn+7/TNf0mRhv7/gCULo710QUNGeu2abH55MGTEdxkJoo6zLbmMXlfCSAJ
jlKHvyRgFlAPI2Zizw13/QKeUgibpgztO9lQ+N4driXi+I5KAmFRw6WBLaCAtd8L
wsgVgDWN0Rp5S6sWq/qpM96z5OqW7iPn/jkM6xlzkQQA5QDPvstuNcJ8s5g6Tk69
uZzhWrsLvqtKfgtySMoY2WZEfwrAQJc4D9mJvDZxC+rqdIrnFrogYca2GefbSBPK
vJt1Pu1x52sCr+lgctLNltThTiM0RdQfsdsXxIRwpqV0MkXOcF728xnJFJQMvTBC
CGv+Z31gsMz9y/AV4vlvADYsj2LmiD3eWUQ1V5RbkiwaiPbnjww+QsLeI1S2MnIQ
UfTI6PwgUvrWOz1SA9aq
=NKRL
-----END PGP SIGNATURE-----

--=-e3IfoLJnORXvzm9tKc5r--
