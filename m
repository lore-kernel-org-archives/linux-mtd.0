Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb52M-0000xV-E5
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 07:47:59 +0000
Message-ID: <1353484119.2701.4.camel@sauron.fi.intel.com>
Subject: Re: Fix recovery after failed write-buffer operation in
 cfi_cmdset_0002.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Harald Nordgard-Hansen <hhansen@pvv.org>
Date: Wed, 21 Nov 2012 09:48:39 +0200
In-Reply-To: <509D03B7.3070304@pvv.org>
References: <509D03B7.3070304@pvv.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-2KobOJPOOLEDB1DmsXUd"
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


--=-2KobOJPOOLEDB1DmsXUd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 2012-11-09 at 14:23 +0100, Harald Nordgard-Hansen wrote:
> When working on a problem with some flash chips that lock up during
> write-buffer operations, I think there may be a bug in the linux
> handling of chips using cfi_cmdset_0002.c.
>=20
> The datasheets I have found for a number of these chips all specify that
> when aborting a write-buffer command, it is not enough to use the
> standard reset.  Rather a "write-to-buffer-reset command" is needed.
> This command is quite similar for all chips, the main variance seem to
> be if the final 0xF0 can go to any address or must go to addr_unlock1.
>=20
> The bug is then in the recovery handling when timing out at the end of
> do_write_buffer, where using the normal reset command is not sufficient.
>=20
> Without this change, if the write-buffer command fails then any
> following operations on the flash also fail.
>=20
> The small patch here should apply against just about all kernels I've
> seen over the last 5 years, the code has not changed in this area for a
> long time...
>=20
> -Harald Nordg=C3=A5rd-Hansen

Hi, your patch is not applicable, it is line-wrapped. Can you please
send a patch I can easily apply?
>=20
> --------
> --- a/drivers/mtd/chips/cfi_cmdset_0002.c      2012-05-21
> 13:46:28.679794861 +0200
> +++ b/drivers/mtd/chips/cfi_cmdset_0002.c      2012-10-30
> 18:27:49.939109556 +0100
> @@ -1536,8 +1536,10 @@
>                 UDELAY(map, chip, adr, 1);
>         }
>=20
> -       /* reset on all failures. */
> -       map_write( map, CMD(0xF0), chip->start );

Would be nice to put a short comment about what you do and why, may be
some reference as well. Just to make sure if someone reads the code,
he/she has some clue what are these about.

Thanks!

> +       /* write-to-buffer-reset on all failures. */
> +       cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
> cfi->device_type, NULL);
> +       cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
> cfi->device_type, NULL);
> +       cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
> cfi->device_type, NULL);
>         xip_enable(map, chip, adr);
>         /* FIXME - should have reset delay before continuing */


--=20
Best Regards,
Artem Bityutskiy

--=-2KobOJPOOLEDB1DmsXUd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQrIdXAAoJECmIfjd9wqK0kGcP/3oZi1ZuAYo6fPLSMiOm7NYT
igK0sfifvwtY0V3LfgaSFR32VigrQ1dm3mbkCS04dGoq+Tf6R/d6RlAtZYl5y4Bh
I36mJpxqzFnG0maeEkIQ9pYcQ5W6QFMZHYAyC4n04X0UQkQ/96psJIaKDMXNqayo
VXefuwkjmAXQUeOG4WVfku+cCFdKHn6teWn2rpkZpRk72TLAR1wZpH6Kk5JWqiPd
6eEiLO1mh4xhCe/ycoVm7A5YLYXvt4sLVIbHoRwocN4SeE7C6ugwvtzlXbDnk3/J
lDFwqcrrsMn6k55wIDs5W8ganHxJc3qH2AxyWMWmPbkGLJ/pBm6lrW3WFCjqwDXY
YZxwLLJ0Vf/rH6oL0PQPo5q9XeyL+HL3joH37wOez+/ol6T/s6F4P6U8Svrpt9hn
zHB0uwkgBnI4YV3SETbHtoJo8OGLYMXRCxKKmlvApuJDIgBDA4B3QbMPMlo1d6Yh
FIYXGKXuzAH9ZeTigptCKaOFYm+sWOPpmdg2Lsfk/8o1nY2WUbxUA4rG6LeN/1yD
nJrtejk5bVmjn9f7kUO6+VSKjP/k098sWl4u8IDRx5eHUsqiylskxzb1yT7rDfE5
dkhh3mJnXcCENxW3ZKXd51PEKxN90nQl57eguA+axZj2/FHuz24npiwGIhS1q0z5
m0z+ujUlO5GOvngCRCxh
=mcup
-----END PGP SIGNATURE-----

--=-2KobOJPOOLEDB1DmsXUd--
