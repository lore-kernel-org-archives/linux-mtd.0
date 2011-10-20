Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RGv3Q-00070k-7E
	for linux-mtd@lists.infradead.org; Thu, 20 Oct 2011 16:01:12 +0000
Received: by wyg8 with SMTP id 8so3723766wyg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Oct 2011 09:01:10 -0700 (PDT)
Subject: Re: Error on sync / reboot
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "marco_cantu_ranzani@libero.it" <marco_cantu_ranzani@libero.it>
Date: Thu, 20 Oct 2011 19:00:52 +0300
In-Reply-To: <29722548.1110771318864630977.JavaMail.defaultUser@defaultHost>
References: <29722548.1110771318864630977.JavaMail.defaultUser@defaultHost>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-TwjjAfEqSTIqvIRFlik3"
Message-ID: <1319126459.11028.31.camel@sauron>
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


--=-TwjjAfEqSTIqvIRFlik3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2011-10-17 at 17:17 +0200, marco_cantu_ranzani@libero.it wrote:
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 559:512,=
=20
> written 0 bytes
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:5, PE=
B 559
> UBI: run torture test for PEB 559
> UBI: try another PEB
> UBI error: ubi_io_write: error -5 while writing 512 bytes to PEB 560:512,=
=20
> written 0 bytes
> UBI error: do_sync_erase: cannot erase PEB 559, error -5
> UBI warning: ubi_eba_write_leb: failed to write VID header to LEB 0:5, PE=
B 560
> UBI error: erase_worker: failed to erase PEB 559, error -5

Here are some hints about what to do when you have a bug in UBIFS:

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_how_send_bugreport

It looks like you have some issues in your MTD driver, please run the
mtd tests to verify your flash.

Really does not look like an UBI/UBIFS issue, something is wrong in the
MTD/driver level.

--=20
Best Regards,
Artem Bityutskiy

--=-TwjjAfEqSTIqvIRFlik3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOoEW0AAoJEJtuLFy+q7feAJEH/2EtYnxnFexqGTlIJvVGWOuu
0ZYTM5DdqiFrRiagMUsa4Wd950M/2vXRnB7LIQ1EYdrgwuYvqeBGIPrTtaqzmjdP
QBaxWQFmfKRHyUxAWx04o7lNKHHYHXqHOCWiia1qutqW9ietMkZFE+YncltRzzMv
8uopvAw+9W8O7zf3osxcEEfJaPhlPUNJCCztUVgc5F8dZqcz/uOViaSBAjeMcCDq
cYMmc1vuG/ZdQofiO4z4Wsc2vKFUMOguF2nz2UUnLS9rXVUrms0UQHucVjwr4Qzz
PlNKxpfpTXzd3/L69+PbNW0UrwZOZvhRxkhxXLE/xkmiFM2YXDGW/lLEq5OTffk=
=RTtN
-----END PGP SIGNATURE-----

--=-TwjjAfEqSTIqvIRFlik3--
