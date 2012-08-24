Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T4wN1-00060j-OH
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 16:04:28 +0000
Message-ID: <1345824556.2848.339.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Do not try to autoresize in readonly mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Date: Fri, 24 Aug 2012 19:09:16 +0300
In-Reply-To: <2142677.yEm4yDLVdN@pali>
References: <8381186.XTLIOQGYR2@pali> <6233716.oXLBM8tzrg@pali>
 <1345823821.2848.331.camel@sauron.fi.intel.com> <2142677.yEm4yDLVdN@pali>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-746yN/ba3I5247+MIyc7"
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


--=-746yN/ba3I5247+MIyc7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-08-24 at 17:59 +0200, Pali Roh=C3=A1r wrote:
> > Why do you need to use block2mtd? If you have an image for NOR
> > flash, use mtdram, if it is for NAND - use nandsim. What
> > prevents you from using mtdram or nandsim?
>=20
> I do not know why, but copying 256 MB image to nandsim takes more=20
> time than losetup & block2mtd & mount...

May be, how much more? Is that a show-stopper for you? If you copy with
'dd', try 'bs=3D2048' if you are simulating a device with a 2048 bytes
NAND page size.

But I guess you can patch block2mtd, I do not have objections (although
it'll report about itself as NOR flash?), but I never used it and I am
not sure how many bugs there are.

--=20
Best Regards,
Artem Bityutskiy

--=-746yN/ba3I5247+MIyc7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQN6ctAAoJECmIfjd9wqK0wcUP/2awAGJdNnWFhMsp9hnwM+Ob
aepHXc/UqqZyD2V5bwVMcQhA2XZa7wDP/bPY9v+kCNfaVZ8muw/D3yHTaBF/nAHA
yQg12oAPLp1XXqGxH/xqfJf+GPXdPvQfqRUn6d8o7hEj9V5YKwMaRLSnlr1R0W9g
Y8BMuW8rlIWefpnHdgy25JQqO7D+dcNz2jLuLFoAsufAsc36HDnw8af35E0FjIvW
ipXMpQQ0gh7uOqc+mBySTpbJbLsGDkpTzk9QKBRu98/6hsuqeOOgtznlAzaNbCJb
vnaGbQC7aWQ3bxPD/3TKarfCWGQeGZRF9CW0+p8H8MX79/xV85IjPQhEYLF8D/AL
xUXOwnFvXVghqi2JxRL3uGpMoRhqBrgh54LZCKlM+8keEY1RP3v3CGtgYpmklO8j
QcIMvgQHrStBr9fv2c2QtPOoi+jscxih2DpL5IzFxJOCPp+UrjttCO3ww9ouQn0g
3IEFtvxd7ElfLm1LIwyHYS9qIOiuy9G2zptW48bHVrcvuwoxj1jUTSA4pp99x3Ny
WlpXaGWVTrVCyA+HhxG6lgTSd8eUq/Hmt6GGXL5Laj1F2lkmB7Gr5GOl6FanJNPG
zMYnBbIZavgTAnerTvDPhopaTMsR/DojH9fr1BuTaQp0pRb+kp9qXv6eTr9sG7Re
mAbmTRcJee/oACC5WBal
=uk1q
-----END PGP SIGNATURE-----

--=-746yN/ba3I5247+MIyc7--
