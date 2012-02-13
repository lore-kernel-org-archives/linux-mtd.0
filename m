Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rwz8R-0003aW-5P
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 16:52:15 +0000
Received: by dakp5 with SMTP id p5so5684201dak.36
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 08:52:12 -0800 (PST)
Message-ID: <1329152067.22240.214.camel@sauron.fi.intel.com>
Subject: Re: [patch] Adding Secure Deletion to UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Joel Reardon <joel@clambassador.com>
Date: Mon, 13 Feb 2012 18:54:27 +0200
In-Reply-To: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
References: <alpine.DEB.2.00.1202091615540.26924@eristoteles.iwoars.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-kgyEtLFGEhJaOjmQ5UBh"
Mime-Version: 1.0
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-kgyEtLFGEhJaOjmQ5UBh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I will try to get into more details soon, but to keep you busy - the
first thing to start is to introduce new on-flash format version -
because you need more space in 'struct ubifs_branch'

On Thu, 2012-02-09 at 16:24 +0100, Joel Reardon wrote:
> @@ -742,6 +751,7 @@ struct ubifs_branch {
>   	__le32 lnum;
>   	__le32 offs;
>   	__le32 len;
> +	__le64 crypto_lookup;
>   	__u8 key[];
>   } __packed;

Could you make a separate patch which adds new on-flash format and make
sure that new ubifs binaries can mount the old formats and work with
them. And that old ubifs binaries gracefully reject the new format.

--=20
Best Regards,
Artem Bityutskiy

--=-kgyEtLFGEhJaOjmQ5UBh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPOUBDAAoJECmIfjd9wqK0NxUQAMkbSqxjb5+pqwGgBxPZH8XZ
ad5B3ehyiK7jBOMUZnQczxXohwNcM5fYjIktigD912s1aGxNIDrZbOdCs03+CzFi
/4VcZy2yFNhr8ZNCxF74/5r+z1QdG6l5KPcPK9DYrj/dQXVjvhmYjX7qOYWub8wb
bdgw131gB1Hg4IKUTGxs8wRUFjV2jnYbidJjripKKN8PxL0pxPiJu4/wEzKhHv2o
xkRetVyEEc5m4RDkpe+zqVxWaFeO7DQWGiWeXvnveh4YFWCigziAQqqZ33Ra8Dh6
+2jFpf5/xqr/Q8cNjFmzqGKaF1M/y6CoAhxaGeej2oT+LaM8gNXDdf7YnI1+Xeu5
Js1IEx3Pg0txxwvyt8H1VL6cpm5a5o9LiIvI6M1TAxg4i+dDdmaciFVzUYCqJY9R
gQWp9lVk7ItAtsA5O5XucEZ8+WLwd8WQWI8Z/sNG+qbYLykFqEHMELL1051P1TBm
9ma8DGPxeLvCZWT2zfMoJssHBbTiUI3rrYY4G0s4fByYqt2DMeVDqgsVMO0sIYcE
aK28dq3KiF7YD1x6U6xIGeaOXO8lmr8vL4tXbJ/GZaddb2mF8xqU1EUooHx+umnl
mo0CRuKMOi/5cMTRp5/IVO7mIxlAH+QOSCaHvvhyuMHFNbxvLc+UmsgJsy98P3bO
Hy2urMuLfcB4T6htRE0f
=INn4
-----END PGP SIGNATURE-----

--=-kgyEtLFGEhJaOjmQ5UBh--
