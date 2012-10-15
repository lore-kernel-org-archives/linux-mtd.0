Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TNkw2-0007Jj-56
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 13:42:22 +0000
Message-ID: <1350308556.5769.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] [MTD] Adjust the NOR CFI flash timeouts to round better
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
Date: Mon, 15 Oct 2012 16:42:36 +0300
In-Reply-To: <20121005183202.GA11385@obsidianresearch.com>
References: <20121005183202.GA11385@obsidianresearch.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-OJvH9yovy4I/OwiFZbvW"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-OJvH9yovy4I/OwiFZbvW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-10-05 at 12:32 -0600, Jason Gunthorpe wrote:
> -	/* see comments in do_write_oneword() regarding uWriteTimeo. */
> -	unsigned long uWriteTimeout =3D ( HZ / 1000 ) + 1;
> +	/* see comments in do_write_oneword() regarding uWriteTimeo.
> +	   Note: write_buffer commands take longer so we use a higher
> +	   time. The AMD 29LV256M for instance has a datasheet max
> +	   of 1.2ms for page and 600us for byte */
> +	unsigned long uWriteTimeout =3D (HZ / 1500) + 2;

What does HZ / 1500 mean? HZ is amount of timer interrupts per second,
which may be 1/100, or 1/1000, or 1/300, depending on the system.

The CFI code seems to assume that HZ is 1/1000, which is wrong. I think
the entire timeout strategy in this file should be cleaned up. You
should use 'jiffies_to_msecs()' / 'msecs_to_jiffies()' helpers instead
of using 'HZ'. And time-outs should be specified in msecs, not in
jiffies. There should be no things like 'HZ/1500'.

Or do I misunderstand something?

--=20
Best Regards,
Artem Bityutskiy

--=-OJvH9yovy4I/OwiFZbvW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQfBLMAAoJECmIfjd9wqK0aEQQAMYivUWBTORIKYOs0Cf4wgWi
ZBH2SOPIIbDqbe7SLUbluf7GGLBdyC4QvYfpKbJCfUrcmmuhb3CpECVxQvQlp2Ji
s4uqauGjDtFDgLMOoOXuFoYr9m5mdFQukpn7Sb+B4982O9+85dLcw+3UHkbqsqJA
ApH9GJTxOKNMr2mHpfeI9o+EHL8JXRzVPYZEXWvCpsVkYe8+xhiQ/6PpFKTcJSRO
hdNAtzZxn8NYIau7x28Grb8uvcQ5C72UIUu0CH+4IsJ0czE10PN0qeKQK8mj0zuA
lav/TBeXH63Uv1nE4osbCx3YRdDJbn8ug+cLrb8vEMeMSbyaRjBZNyoun0cdHQJY
4Zrx4HZvkgM4jQvVZfK7mq0v9241CSxzZwTM5LNTiXkbJ+GD25J1DKowTeqmMDYf
kaRDFi893ANsNLQ43T+xgii3DPrghkMul6AxqPD64ZnQzTlWmuajdbWLJGWgfRcV
GnhnsUBlc/kfs1NqGXf/MdaM2oBg0/RCGa9mAvfEthDeBlxyjzC26eVLI3iZEV/L
OWIgdWf3HibPmvlCC0qB6vulQ31TTNhUw1jJ2yWSh29cZ2OKAwdD9uNIy4LtqkBH
JsjbHRwUmExOANp4+k9EdyJqhcgWj+i+Wkx6X4+ATzlaXLa6R+Ay2tcL8ONXeAUx
Hws9v4a8LqJ53+6yBC1O
=Rsol
-----END PGP SIGNATURE-----

--=-OJvH9yovy4I/OwiFZbvW--
