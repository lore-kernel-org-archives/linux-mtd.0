Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T48KA-0003GY-Pg
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 10:38:11 +0000
Message-ID: <1345632176.2848.144.camel@sauron.fi.intel.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 13:42:56 +0300
In-Reply-To: <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-hnzKce9Oh0vta9Vq1245"
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


--=-hnzKce9Oh0vta9Vq1245
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-08-22 at 11:28 +0200, Richard Genoud wrote:
> +"-b, --max-beb-per1024 Maximum expected bad block number per 1024 eraseb=
lock.\n"
> +"                      The default value is correct for most NAND device=
s.\n"
> +"                      (Range 1-768, 0 for default kernel value).\n"

If the feature is not supported (the kernel is old), the tool will just
return success and the kernel will just ignore max-beb-per1024, which is
not very nice.

It would be better if ubiattach complained like this instead:

ubiattach error: your UBI driver does not allow changing the reserved
                 PEBs count, probably you run old kernel? The support
                 was added in kernel version 3.7.

--=20
Best Regards,
Artem Bityutskiy

--=-hnzKce9Oh0vta9Vq1245
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQNLewAAoJECmIfjd9wqK0sCsQAJLZsjmhvWYbW50dT8MJk0jV
rW+CQVxz2YWO8H6dh8itxnI0P0IaEp73NdxQwaxTOIb9Aqz4hA+8j70yRmS0wa6p
0jdjcws0J4Hz3RkQ7nWCzQalQwe0VOvcusWzJc5PdC8VnWgWCwdbA3Yzg5k8PVeo
t1+pi+Atf/bbBt84MHuhZX9hrkjvarMBPT71ZeQsSXnwv6kYuyMDzqciTQJ0ahPP
yP9ALatKsTVygtGOn7C6ck2sIaNx0COF7jrmKBcAlUsA5d+bJPW7Hc42S1I6JhN+
RkOy7GGhbveF01j/bh3Zqjg0T8s4Q5K8WRBDQNagXQpGL+UHKPqcmztvqI8/v/Kv
o8U/Jg3tqtLktRFzaGWP+NzOPZowTRjQ+IMafdoorALh0akOi4b57IphZB8hAZUf
WIbYTbaLDwwUogWV75fTorSbFGip47nreI2QlQzTKevQbTKR/WVfoMuXMOuANlmW
7gUb2Y6JlRlm0xgs9KWk9vXpSSVhPOCDJQvKDF1t3PJOVWGKehpqVqw15HawaS08
1kddSqTeRuKfDulRDCjbzbE71iqNUHr+NEq2t7d5Jsl+jrojmlZaIb4ttSH1lK7l
VVnmWgMtpXMrziw0VfofwgAqXzbyPBzzupSLkf+Z8p7X3QWZZIPe08x6m9C+jBKE
VQpkK9zXfyRQMslGQG1B
=O3ek
-----END PGP SIGNATURE-----

--=-hnzKce9Oh0vta9Vq1245--
