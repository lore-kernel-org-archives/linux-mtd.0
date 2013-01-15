Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tv1ZG-0006A1-Fz
 for linux-mtd@lists.infradead.org; Tue, 15 Jan 2013 08:08:23 +0000
Message-ID: <1358237378.2731.102.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: mxc_nand: compress ID info for send_read_id_v3
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Schneider, Roman" <schneider@at.festo.com>
Date: Tue, 15 Jan 2013 10:09:38 +0200
In-Reply-To: <1B09BCCCBD9E66429F0DCB039A36863133164FB1@SDET3287.de.festo.net>
References: <1B09BCCCBD9E66429F0DCB039A36863133164FB1@SDET3287.de.festo.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RFVUNvgqw7oIXOoUful3"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RFVUNvgqw7oIXOoUful3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-12-12 at 18:49 +0000, Schneider, Roman wrote:
>               ---
>       =20
>        NFC v3 (e.g. mx53) does also require to compress the id in case of=
 16Bit busw.
>       =20
>         drivers/mtd/nand/mxc_nand.c |   11 +++++++++++
>         1 files changed, 11 insertions(+), 0 deletions(-)

Hi, please, send a patch properly. Use git format-patch. Send it so that
I could save your e-mails and do 'git am roman-email.mbox'. First send
it to yourself and verify that works, and then when you find out how to
do this, send to the mailing list please. Thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-RFVUNvgqw7oIXOoUful3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQ9Q7DAAoJECmIfjd9wqK0VDYQAND/nD/R4cmEo/M3K7B38NV/
+a85KEbsG47o2nMAz/EPbJOdsLQ2YQ+ucYC336r7AqejRJdBVsA+OCiWG4mlZONV
dNGom2alaLOCeVBMUVhwwWakbefdt5YrAeDjuu7VKPzXZzxyIcB0bUPfeg/YWxVV
IUU6XXyCsQbKT0SBmW8hVV9pT9U14k7zC1USoR1QkpIxS31VWE3uOOw41jerLTvo
QWRz2cSwPwZaUIoHEPaL7NOr6qajF4SynUfaqNpGuVqc7yQMOSJilTgh7FcIt3Uj
xxQiiEaT7m/Ef9oqh6rVf2UHBKaW8Oh45DlLL7pyArzRzrGlQRtl7DISaKvRziwA
3SyEbTo72askOCYf4HPHvKUNF60RZ7lbl/DV7OqZdx/BzpDyEiEoivaHuxXgcSuM
iNpZOOC8n6iauXZRRxXtY0Gocz79BrZxQNbVHtQ5B6BO3ankldERRvrMN+AtQtEs
DY/5vt00mxL8RF8j6xF7a8FiFLJLQl9gRoT84+Ioi5QXyPlctdM4ApaCU07ZZVq9
uS7/ahzphjCC0FCBEn5gJHDa362IymPxFV8LtbBqcdWLzcx/U1HT5GnSSnFiNtHY
MeEQPUm66rSUVR793lkrR2xVsQa3QgDJYZfkr5SBh/jGeco1OlbmP/WCtNNqMG4E
PlkjaGJzBnzgSSpqZ5wO
=3ly8
-----END PGP SIGNATURE-----

--=-RFVUNvgqw7oIXOoUful3--
