Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIjnA-0003ME-Ed
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 16:56:13 +0000
Message-ID: <1334336350.13160.16.camel@sauron.fi.intel.com>
Subject: Re: UBIFS recovery fail after power-cut
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b w <wdjjwb@gmail.com>
Date: Fri, 13 Apr 2012 19:59:10 +0300
In-Reply-To: <CAHvCehVNgTgL+vY8SV1APN_xokogCM=Q+c7U1X9-_H1jn47Dpg@mail.gmail.com>
References: <CAHvCehVNgTgL+vY8SV1APN_xokogCM=Q+c7U1X9-_H1jn47Dpg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-3/HCdKruM+IvAf/wNBaX"
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


--=-3/HCdKruM+IvAf/wNBaX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-04 at 20:09 +0800, b w wrote:
> Hello list,
>         Using kernel 2.6.32 (which have already apply the latest UBIFS
> and UBI patches),nor flash.
> UBIFS mount fail fail after an power cut due to recovery . Recovery
> failed because after power cut ,the flash image is like this:
> 02ab3eb0h: 00 00 00 00 00 00 00 00 00 E6 0C 00 11 00 00 00
> 02ab3ec0h: 31 18 10 06 04 80 DE AF FF FF FF FF FF FF FF FF
> 02ab3ed0h: FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
> 02ab3ee0h: FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
> 02ab3ef0h: 05 89 AB CD EF 89 AB CD EF 20 00 00 00 00 00 00
> 02ab3f00h: FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF
> First,when ubifs_recover_leb call ubifs_scan_a_node,and found that in
> 0x02ab3ec8h
> had a bad node type,so ubifs_scan_a_node return SCANNED_A_CORRUPT_NODE.

OK.

> Then in ubifs_recover_leb,when call no_more_nodes this function return
> 0 (which i think
> should be return 1).At last recovery failed,so mount failed too.

We have this code in that function:

        /* Check for empty space after the corrupt node's common header */
        skip =3D ALIGN(offs + UBIFS_CH_SZ, c->max_write_size) - offs;
        if (is_empty(buf + skip, len - skip))
                return 1;


UBIFS_CH_SZ is 64, c->max_write_size is 64, then ALIGN(offs +
UBIFS_CH_SZ, c->max_write_size) should be 0x2ab3f40, which points to the
area with all 0xFFs, so 'is_empty' should return 1.

Did you check that your c->max_write_size is 64?

Preserve the image for investigations.

--=20
Best Regards,
Artem Bityutskiy

--=-3/HCdKruM+IvAf/wNBaX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiFteAAoJECmIfjd9wqK04EgP/3snM58kNgX+VSqPDm7zyhos
jZJEkVTs/wx8ygO2RlAth57s+DylG50ljCGIyaNXFd6474msomKKpRv0M0+yZTFz
yLSyFJo2308f2XRLBQR8Ddfzl7D7XGi8eGmRJQyuAIEmRsfnNEX8kbp+Ya6vKU7R
NBENAfGfk3/1eGV6eacrcNchkl9dAPF9LKPAS+J3oIzWy4OqsEwaBCZA1CvBa426
92K5ixPB4ZBGfj7B7MDbPQZqPDjcxSrH1JOjpyIH8toGEAWceD0Ln3U16j2XQ9DU
as54Ifolp6ZFytcHxAyFNB33Z5BL8XO5MEVD2Jyz3f5wEQolzMYFePH0//RnwFiw
m1Le4CBLpC9LAyRDrM5iDxFTbzDFO1bLvOgi/ilRqyh1tBjvE7Lld7f61oKLx5Lk
mHz/d7COZ14tvQqFYu5z7m5wVjMUPc8FTpIwAlNU1qSpC7bMmYJtgGRNzsAHxylT
5IGSJhci111uOuj+Nyv7hgyBIepjwX1qlRDAUr0Fk+nJpOQxyIH4SwRu1L83M791
hgBgO/fdMXYHtJaWcSToEQJTmbzjRIh+iQOpRlI1ChOnHeVkkGG/DKDFSME7fYvG
TCbieEW5un3dqwaGK1eyTNeGONwuWBIJJFCCCQHupFqTUtffvFrbH8pW+7SCwCzU
ZlEtYcU4t4rb3YxHi1fC
=cOlg
-----END PGP SIGNATURE-----

--=-3/HCdKruM+IvAf/wNBaX--
