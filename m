Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T8V8e-0001yR-KY
 for linux-mtd@lists.infradead.org; Mon, 03 Sep 2012 11:48:21 +0000
Message-ID: <1346673180.3061.44.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 0/6] UBI: add max_beb_per1024 parameter / ioctl
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 03 Sep 2012 14:53:00 +0300
In-Reply-To: <CACQ1gAgxnrLR-NDkiw=QUZ9r6JO30AVwX6MOYX4vV9WXoBaBiA@mail.gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345716615.2848.229.camel@sauron.fi.intel.com>
 <20120823133655.72157b18@pixies.home.jungo.com>
 <1345725030.2848.236.camel@sauron.fi.intel.com>
 <20120823154404.51e31873@pixies.home.jungo.com>
 <1345726686.2848.241.camel@sauron.fi.intel.com>
 <CACQ1gAhs6E5jHGnTy1RhbnuzKq7uAJk0DeHfi0k73jC_8noiAg@mail.gmail.com>
 <CACQ1gAiFQfAbKVRfhjy-K31MJP9YchzxmmCo4FJECoKuudeBtw@mail.gmail.com>
 <1346659239.3061.17.camel@sauron.fi.intel.com>
 <CACQ1gAgxnrLR-NDkiw=QUZ9r6JO30AVwX6MOYX4vV9WXoBaBiA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-ZlqSfUPC8jA3vFnKQByG"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-ZlqSfUPC8jA3vFnKQByG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-09-03 at 12:57 +0200, Richard Genoud wrote:
> > If you could somehow reproduce this with nandsim, it would make it easy
> > for me to find the bug.
> here it is:
> [    0.921875] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [    0.929687] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [    0.937500] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [    0.953125] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [    0.960937] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [    0.968750] [nandsim] warning: read_byte: unexpected data output
> cycle, state is STATE_READY return 0x0
> [    0.976562] NAND device: Manufacturer ID: 0x98, Chip ID: 0x39
> (Toshiba NAND 128MiB 1,8V 8-bit), page size: 512, OOB size: 16
> [    0.992187] flash size: 128 MiB
> [    0.992187] page size: 512 bytes
> [    0.992187] OOB area size: 16 bytes
> [    1.000000] sector size: 16 KiB
> [    1.000000] pages number: 262144
> [    1.007812] pages per sector: 32
> [    1.007812] bus width: 8
> [    1.007812] bits in sector size: 14
> [    1.015625] bits in page size: 9
> [    1.015625] bits in OOB size: 4
> [    1.023437] flash size with OOB: 135168 KiB
> [    1.023437] page address bytes: 4
> [    1.031250] sector address bytes: 3
> [    1.031250] options: 0x42
> [    1.039062] Scanning device for bad blocks
> [    1.242187] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
> [    1.250000] 0x000000000000-0x000008000000 : "NAND simulator partition =
0"
>=20
> # flash_erase /dev/mtd0 0 8192

Hmm, cannot reproduce on my x86_64.

--=20
Best Regards,
Artem Bityutskiy

--=-ZlqSfUPC8jA3vFnKQByG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQRJocAAoJECmIfjd9wqK0nPAP/21YKJjbJok7w/nLwSUqW6ZK
zP2F9nrj2zi+BDTbfp7gOCIQv1U7NHlwxpy3JcbOe3dvkIf2jm6aYtNAc4K3VOu0
dlJwz876oHrhaC6UbMGDA9DLdDfrYnJPvJgTjgRPmfSvjjqS8PuZLGHJ7fWjDMbX
jccxSwhp+KmtJEacL+WHHf9C5/73SorMqUFa8Gr8+o6y5rJePBaaD3Wg1mhXFhVP
MeNJKktWzLjMvit+/YJXfhHe/xm0FTrF7hnpyuhRNNEs7xyWQJAc5pLn4fax+3M6
FU2nzd8gBxFsPL4CqZVjdbtC5zYnc4kBQcTAhZw50nH0ES6jIzt+bXlvJ/HsHwBL
fm909qZ98nPQbhrvLciY+ltWiYxSieJbav2yb6SQ2YL0CwAuK8HU13jXbL2KorLX
ljeC7wa3qH90YbIvSu1nZjpiDR77NGx64jY4+JvDomvPpxDPOe1jjEXS1ZvVYARl
vEOBV1x7cgbnJ6xBp6UD3QCPXJ8RrKAENQiRFjJMPkKQEmgSapF1YUys99+vzCHa
fN3tOkndmCSmsWwuvmtDHcO3RmS9C9MFxranYDMH2c7hOlkH+LLIPBWJPSaKGlud
PN2dgd/9w7NoPicExNtyYlNxoQH6VEYZ7tZLeD6REDH3Zs1gR6rKXrBN1fhbspXN
gM+7pthu+vijte0Y/rs8
=8VP3
-----END PGP SIGNATURE-----

--=-ZlqSfUPC8jA3vFnKQByG--
