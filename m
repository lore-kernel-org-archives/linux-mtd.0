Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S8Vf3-0007T6-Eu
 for linux-mtd@lists.infradead.org; Fri, 16 Mar 2012 11:49:34 +0000
Message-ID: <1331898704.3730.62.camel@sauron.fi.intel.com>
Subject: Re: [RESEND PATCH] mtd: fix section mismatch for doc_probe_device
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Ryosuke Saito <raitosyo@gmail.com>
Date: Fri, 16 Mar 2012 13:51:44 +0200
In-Reply-To: <CADTWAOL7aBi64yimwPubAJ22=4AQ1BRjzQCahUXUsbSa1oJ59A@mail.gmail.com>
References: <CADTWAOL7aBi64yimwPubAJ22=4AQ1BRjzQCahUXUsbSa1oJ59A@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-PIgDge2J9j8q/w/YxN42"
Mime-Version: 1.0
Cc: mikedunn@newsguy.com, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com, robert.jarzmik@free.fr
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PIgDge2J9j8q/w/YxN42
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-03-15 at 19:19 +0900, Ryosuke Saito wrote:
> doc_probe_device() is only called from docg3_probe() which is in .init.te=
xt,
> so it must be in the same section to avoid a section mismatch warning.
>=20
> Signed-off-by: Ryosuke Saito <raitosyo@gmail.com>
> ---
>  drivers/mtd/devices/docg3.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 25f688c..db9a4b7 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -1846,8 +1846,8 @@ static void __init doc_set_driver_info(int
> chip_id, struct mtd_info *mtd)

The patch is line-wrapped and not applicable with git am :-(

--=20
Best Regards,
Artem Bityutskiy

--=-PIgDge2J9j8q/w/YxN42
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPYylQAAoJECmIfjd9wqK0z7MQAK0vOwKH5171J7L3DZxFUUnH
eFF0qFcU/8vNh+B74L0M9x/SDZpaAN/cF7vKOLn+0uXwkb2fmLg9FQNc9U69D1y1
6DCKWuehF7khJt0lfdY6JCQL242K1tHra+qfIG1a8U9ouNBkIimbdbLR3mGcK0X1
F782snlKCoEF6cFlbuJ5dfRMzr7SLeNAKwq0F3OBitHv7CkN7ZTOPkvFJpwNlYv+
EO+Pd/d+aqpbZO41PGcpt4D4xrLyxM4cBSfzedTr1CQ3jTE41L0TXpQ3WtyNvhCa
GCCsu1g6PmjKdV2kIQK05X+RRg88OMoEY8ZFDQc4gufVDHN5MYXK2cZ+TN4UNXKd
tzbOZ146p16eY45vwEM/rn3gHY7LJ7TFmmlcg9Y/gPtfhX6NUs1uo9PyDScyUSDn
1xvZ9Amtr5FKK/IdG6zTsFgknVABQ9EzF3I0ns/YGoFFKkDM83mufz4I/OlAO93c
Ca55nLymxUEj3WYZ3XkPgI7jmfMeF1p56OYfzeiUKU0IxAEInEFFfrIBlWKxpqZM
yUttLvLpkOWCV/kzQOOKuRtkmYRhZF/b/gfHJzTO5T5q2K7oGBD2oTTT/G4Y9aeJ
eJ5xjXOt9hvHBEMMGwca0f3wPnpodmLQd7OU+hxB/Y3iIaHmSbz56fyfo8nfa/0a
qCT2kOZG/FpyyNAs7B2e
=tZSE
-----END PGP SIGNATURE-----

--=-PIgDge2J9j8q/w/YxN42--
