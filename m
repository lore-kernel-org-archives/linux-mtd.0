Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8Vfs-0007XN-2S
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 11:50:24 +0000
Message-ID: <1331898781.3730.63.camel@sauron.fi.intel.com>
Subject: Re: Assistance with debugging ubi_io_read error -74 (ECC Error)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Craig Peacock <Craig.Peacock@internode.on.net>
Date: Fri, 16 Mar 2012 13:53:01 +0200
In-Reply-To: <4F61D6CF.4080707@internode.on.net>
References: <4F61D6CF.4080707@internode.on.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-xPKcvIMNabv0eAVG64cE"
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


--=-xPKcvIMNabv0eAVG64cE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-15 at 22:17 +1030, Craig Peacock wrote:
> I'm trying to get UBI volumes/fs working on a Seagate GoFlex Home=20
> platform with a custom kernel. The product orginally ships with a=20
> working UBIFS. It has a Marvell Kirkwood (ARM) processor with a Toshiba=
=20
> TC58NVG1S3ETA00 256Mbyte NAND flash and runs Kernel 2.6.22.18. It=20
> appears to be based on Marvell LSP Version KW_LSP_4.3.4_patch22. One of=
=20
> the kernel parameters is ubi.mtd=3D2,2048 setting the VID header to an=
=20
> offset of 2048 bytes and avoiding subpages.
>=20
> I've recompiled my own kernel for the board based on Linux 3.2.9 but I=
=20
> am unable to successfully use UBIFS even when I set the VID header to a=
=20
> 2048 byte offset.

=46rom a quick glance your driver has issues with reading. When you
disable subpage usage in UBI - this will only mean that it won't _write_
sub-pages, but it will still read them. Every drivers should allow
reading less than a full NAND page.

...

> # flash_erase /dev/mtd2 0 0
> # ubiformat /dev/mtd2 -s 2048 -O 2048
> # ubiattach -p /dev/mtd2 -O 2048

...

> UBI error: ubi_io_read: error -74 (ECC error) while reading 512 bytes=20
> from PEB 0:2048, read 512 bytes

Read 512 from page-aligned address does not work - check the driver.

> uncorrectable error :
> ...
> UBI error: ubi_io_read: error -74 (ECC error) while reading 64 bytes=20
> from PEB 1989:0, read 64 bytes

Reading 64 bytes from aligned address 0 does not work - check the
driver.

I guess the problem is that your driver does not support sub-pages, but
still believes it supports them. You can hack it quickly and make
mtd->subpage_sft to be 0, then the NAND base code wont try to do subpage
reads.

--=20
Best Regards,
Artem Bityutskiy

--=-xPKcvIMNabv0eAVG64cE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYymdAAoJECmIfjd9wqK0VBkP+wSwAbCcs2rcBEndM1js+Fsn
s/hHelXi4mzSZLhWOJ89jzIo6qvytQn0SIv1tb0JLhuPPwOVBPlli1n/VR6ulkRX
GHEYZyhXvByro3oMGNnkoULPyPJf4fD1VSEbO0vX7MSf1MZ+fm7zpODK/Xi58Pm5
pu7zZfM1Hczv1c8so6mqEOvBfJOBIgJDT3lRGKhFXb72FHE4/9n9QI0tphA+dRz9
T95qUmz35iXmqS85s/SiAl3VWMSz4F8PX8bHq84UA0Ei5d9aMP+0LBZ4CWRE+ORh
G3gk23JBrHOC9eN5wnyEQriDSnaJXBX20wCj5QCnCCHEUfSdibSK+H2xK4ZY0HMT
fj0Pq5UglqolX/C8a1N4yM8QFz/E5dh/zsblXqHuYCSVvjlh879jJvJ4M/5uAnD0
Iv/K1NsQ3BwJR31hh+tD6AdXZfRFgXRim3J8l+UJFPMIByCxvEWHvuDt6n2t1HRY
6uGiu9SQ1LxFyyiYydije/SWsCQgbEMnzuaHA+OwDcL6BpbqUE8NH1LIzStA3nhZ
cxBkRT6oUnmtEgWNxgdQw8y+EXAisS3vv3Na55zdGAjatNnhTgSMNzlSUZTARE6Z
0RvZ3K2WHmmccq3qowzHZqfHLt9vCEdmmFTRbGqNQgrdDMpje2m8XWuyy5EazCKu
ZTC/SRwKPZXq6YB4nZek
=i7Rg
-----END PGP SIGNATURE-----

--=-xPKcvIMNabv0eAVG64cE--
