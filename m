Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TZHVY-00015A-II
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2012 08:42:41 +0000
Message-ID: <1353055388.20111.3.camel@sauron.fi.intel.com>
Subject: Re: Frequent Writes to NAND flash with UBIFS in sychronous mode
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joe <tttechmail@gmail.com>
Date: Fri, 16 Nov 2012 10:43:08 +0200
In-Reply-To: <loom.20121108T103932-198@post.gmane.org>
References: <loom.20121108T103932-198@post.gmane.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-SH8o34h1q19LzRLVY6KG"
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


--=-SH8o34h1q19LzRLVY6KG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-11-08 at 09:51 +0000, Joe wrote:
> Hi,
>  I have the following observation when UBIFS is mounted as synchronous fs=
. (-o
> sync option from bootargs).=20
>=20
>  1. For every file read, there are writes  to nand flash.=20

I do not believe it is UBIFS's fault. May be shell history?

>  2. For the execution of every command, there are writes to nand flash.=
=20
>  For ex. On execution of any command, say 'cd' or 'ls' i observe quiet a =
few
> writes happening to NAND flash.

Also I do not believe it is UBIFS's fault.

>=20
> What could be the reason for this behaviour? Any other option to bring do=
wn the
> amount of writes but by retaining the synchronous behaviour?=20

This is your environment most probably.

> With sync option enabled, we expect Flash writes to happen more frequentl=
y ,
> how-ever we do not want  writes to happen with the execution of every com=
mand.=20

Sure, explore who does the writes and why. E.g., enabe the "general" extra
messages - this should print PIDs and file-names for all I/O. See

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_debug
=20
> This observation holds true for linux 2.6.28, 2.6.35 & 3.4.10 linux kerne=
l
> versions.=20

--=20
Best Regards,
Artem Bityutskiy


--=-SH8o34h1q19LzRLVY6KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQpfycAAoJECmIfjd9wqK0mlQQAKuIyq49orvBLX4FHxjq5/5k
fk9RreTJqy0Ia9sMxOmlXoCjOiB2mZqYbGyX0uLA0yqHDP7/tFZcVqEoup/1AxW+
C09tt1e1EhTHtHAo54XaOVXGrst55rcQVL0NCAOH97s74hTFamQso5NLfHC/n4jq
DT6PJ+SEIdnBayj9nX/CjhsSb0XdI7zbxp+tAPpgd1AruwIH/+ehaf2Z789tPNQk
OYtqSm6/ZcbcwqqqHLcvLziAh26f2uVeoOfCXZHv/nvQKduOqI2jtHdYfb6bHq+2
vlYS5qmz1IkYc+yHNRBUXVsW4/2lmaRXFfhrKgTt5wJ6xuSZTBTKo99Aj8hJGHvJ
nfEx/8pbKfutrcNM8FjSwGGGakE+/4ZxVP/50IotBXsxUkO/gWPqQtdUcnxrbU5v
RqFw2FifXfL0W3hSbMFBO3cNgaYhD5WpelrypZJdiV2pTeJj/f7hH/u/bk0E6KdG
MsvDKA/J4Mmv6taDjU/Emu9Lkfl0iF+BD29xxS5XZTrKaAErQVtg5RiQhEpBQqyt
FsnFMvu0E/fcusuyth8LKvordjo7XKj1RclFfm2A92eu/uZzgWTjFa+ar7GtrbZY
wvEWBxWUvgvGHEBH9RpRxfe6rl65MfMhoj2P2etEnVPgUuO+lFyLfKoqRyEnwZsr
Rt6Oo1OZsG/zfECL/NPU
=gBRL
-----END PGP SIGNATURE-----

--=-SH8o34h1q19LzRLVY6KG--
