Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RtBwh-0006DB-O8
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 05:44:28 +0000
Received: by pbdx9 with SMTP id x9so3145939pbd.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 21:44:26 -0800 (PST)
Message-ID: <1328247987.6750.26.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix error handling in ubi_scan()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Fri, 03 Feb 2012 07:46:27 +0200
In-Reply-To: <1327944013-18944-1-git-send-email-richard@nod.at>
References: <1327944013-18944-1-git-send-email-richard@nod.at>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-7NUeA9OvA8h2fMipaowD"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, stable@kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-7NUeA9OvA8h2fMipaowD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-01-30 at 18:20 +0100, Richard Weinberger wrote:
> Two bad things can happen in ubi_scan():
> 1. If kmem_cache_create() fails we jump to out_si and call
>    ubi_scan_destroy_si() which calls kmem_cache_destroy().
>    But si->scan_leb_slab is NULL.
> 2. If process_eb() fails we jump to out_vidh, call
>    kmem_cache_destroy() and ubi_scan_destroy_si() which calls
>    again kmem_cache_destroy().

Pushed to ubi-2.6.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-7NUeA9OvA8h2fMipaowD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPK3SzAAoJECmIfjd9wqK0F24QAJslkZfl6bN53eqzOCWwrlDI
UC51xgiMJrAgnbBh2HD3VPH0VDpNEfqfg1etMbnJ6vZ/tPvHre2cCSi6rebKQN+c
MJkWGWRXQ+jgO3KEPha5zoO5L8n3aGhAmO1myrvtkU8l5tTeXXAYIiLsUmfMLfyj
LrGsd2dX7VbO8E+2fSMPRZaYoc7Llfgannf8S3TLDwIR/YJzCkTWBRZ0Zb1UXkFB
d5xKwPYAYCY6w18NNoCigyoUl3od4hw4xZ8fllrZ8+EjyxauDpuYZwQLUq0O7D8N
cqHRdS38wrJp7kUD8d75uiXCSFTJ3IHZVLZkPyhB1Kvs+GvFrE21PJ7guHk+1J1J
OwtiKQ2UsO3XmqbN1Ss0QYgHmmbXuUrSiZiTDSFgqZ1E2bGVlBmOlXAWF1mM6j5w
uNa9f+qF7ctPif6jlI+imDO8NChoUuo9ntv7QZttT8lVSuwmtfHg4aYV3xhmcccA
9t0IBzIg/3L1xC3EdulX1YorOnX5HBwTSUAv+K3UjqY8XR3OHB2DCnHHLm3PQ+11
Zkp/JGizK9OC1RUw7bmnfxyB+o/Ld71/Ee2c/yV4AbBTLEDnihe5yQS5FVG/Ds0Z
dpfYZpxiT9R48roLeLIntWAQ+eyo3dh7zf8720C9njfPNm48fqIrPz6AuHrJJYZs
enVRxT8/NNTCeUpccF9J
=4E7b
-----END PGP SIGNATURE-----

--=-7NUeA9OvA8h2fMipaowD--
