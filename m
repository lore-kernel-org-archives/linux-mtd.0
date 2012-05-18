Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SVNI7-0004kt-3p
 for linux-mtd@lists.infradead.org; Fri, 18 May 2012 13:32:24 +0000
Message-ID: <1337348152.2483.59.camel@sauron.fi.intel.com>
Subject: Re: Problem with UBI / UBIFS (mainly ucorrectable error) on kernel
 higher than 2.6.30.10
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lukasz Nowak <lukasz.nowak@homersoft.com>
Date: Fri, 18 May 2012 16:35:52 +0300
In-Reply-To: <1337255133.2457.66.camel@debian.softace>
References: <1337255133.2457.66.camel@debian.softace>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-s0PCMYTcs2o83qPYlpq8"
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


--=-s0PCMYTcs2o83qPYlpq8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-05-17 at 13:45 +0200, Lukasz Nowak wrote:
> 1. When using kernels: 2.6.30.1, 2.6.30.9, 2.6.30.10 the procedure of
> attaching and mounting UBI device is OK and we are able to use it as our
> rootfs.

OK.

> 2. When switching to kernel 2.6.31.1 and any higher (2.6.38.4 was the
> highest used in the test) we are observing a lot of errors during the
> attach/mount process:

OK, it gives a possibility to bisect and find the offending commit at
least.

> UBI error: ubi_io_read: error -74 while reading 3281 bytes from PEB
> 1898:96200,s
> UBIFS error (pid 1): try_read_node: cannot read node type 1 from LEB
> 70:94152, 4
> uncorrectable error :=20
> UBI error: ubi_io_read: error -74 while reading 3281 bytes from PEB
> 1898:96200,s
> UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0x743bfaf8,
> read 0x70
> UBIFS error (pid 1): ubifs_check_node: bad node at LEB 70:94152
> UBIFS error (pid 1): ubifs_read_node: expected node type 1
> UBIFS error (pid 1): do_readpage: cannot read page 257 of inode 2046,
> error -117
> uncorrectable error :=20
> UBI error: ubi_io_read: error -74 while reading 3281 bytes from PEB
> 1898:96200,s
> UBIFS error (pid 1): try_read_node: cannot read node type 1 from LEB
> 70:94152, 4
> uncorrectable error :=20
> UBI error: ubi_io_read: error -74 while reading 3281 bytes from PEB
> 1898:96200,s
> UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0x743bfaf8,
> read 0x70
> UBIFS error (pid 1): ubifs_check_node: bad node at LEB 70:94152
> UBIFS error (pid 1): ubifs_read_node: expected node type 1
> UBIFS error (pid 1): do_readpage: cannot read page 257 of inode 2046,
> error -117

I really doubt this is a UBIFS changes which causes this issue. May be
there was something changed at the MTD level?

Did you run MTD tests to validate your driver?

Do you normally do power cuts, or you always shut down the board
gracefully and 'sync' before shutting it down?

> Sometimes we see also errors "UBI: scrubbed PEB 1873 (LEB 0:1752), data
> moved to PEB 1608", but the system boots and we can use it, but we are
> not sure how long it will keep such good condition.

This message is OK - it is just FYI that UBI detected a bit-flip (which
is normal) and it moves the contents of eraseblock 1873 to eraseblock
1608 in order to clean-up the bit-flip.

But if you see too many of these - it is not so normal.

>  There were
> situations were we upgraded the firmware (rootfs on mtd4 partition) ando
> after that the motherboards was not able to boot up anymore (UBI mount
> failed with similar errors like that one above)

Well, there are too many unknowns to tell anything.

> What is strange that the error don't come all the time. Some of the
> motherboards boots with the same configuration and some of them gives us
> errors like that above. But the most important thing here is that kernel
> lower that 2.6.31.1 works always, so my conclusion is that there is some
> bug in the MTD support in kernels higher that 2.6.30.10.

May be something changes, may be it is just random luck. UBIFS tells you
about ECC errors which may be caused by many things. Start from
validating your drivers. Then start doing isolated UBIFS tests.

We maintain UBIFS back-port trees - try to pull the one corresponding to
your version.

> 3. I am attaching some additional info about our configuration:
>=20
> - attached full log from failed boot up process,
> - attached full log from OK boot up process,
> - used kernel configuration files,
> - output from mtdinfo,
> - the procedure of flashing the mtd device.
>=20
> If you need something more like debug logs I can deliver it with short
> period of time. If you would like to get the motherboard for some
> debugging or tests there will be no problem with this. Just ask.

First of all, remember to boot with "ignore_loglevel" option to see all
messages, because your logs are incomplete (no debugging level
messages). Send boot log produced this way.

--=20
Best Regards,
Artem Bityutskiy

--=-s0PCMYTcs2o83qPYlpq8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPtlA4AAoJECmIfjd9wqK0TXYP/R3zDdLshUhbuBjmYTMQP8VJ
IihuTzOkMSEdck7xpel2oei3+Qy56AhZY9DPYEq6rhfS0pc/6Az9Gz7gQ7x24xY8
INM/ZdkTEiY7Wusj1ppftwfyIBSebesd/hikrxclyr4WXuxcIAGQHwDsLh6n8nK2
U5bG6rZW866/Q8SdEW9TmlBiBm9+NWycel6gYwgIUWTP3Laz8txTTtriJolrAzu3
qvRtdiWNW4U197uz22VESMB5ugy3n5r2g8WaaWUuUbPWxfhXSgZVT8OW4iQvWgbL
KaEvAOmM/9MistRdqhjkkX7onnaZ3DYdrEuYzFazaX3NHdUWGDMncDfkDdpcBL9/
Hq/NkaCMlf+8XNhKwIp90nbiBPWtiZix0P4xS8ecHZeZijCU9de4Ef+ML+7oqZzw
tWGdJTJj2g+TuiLLPRhiedA0sF4Go6p/AN89tsnhBMp75Hz7T2NwaTkcwOFbulCp
JFEKswpF9VDMv36iVkjmFYcMWfyHN8fIoA0j6HHdqOzyXmbLh9rp58ZzcOSPQoK2
HWCK9ajkQ+yClbIwM3+dd242c+Pvr8u22ZNWzBMT5Se9UkJ/8EwQrN1x/ohLWNnZ
Z+e6nlqBwa0XrH1FrKLmfdGlWk0cb2flQBqegJUNpStCmqlqiIq1oyW/RyFE/H3Z
SV1JPlRzCjrhB5rKIS3s
=vygm
-----END PGP SIGNATURE-----

--=-s0PCMYTcs2o83qPYlpq8--
