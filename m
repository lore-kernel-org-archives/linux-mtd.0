Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T3oqT-00081c-Pw
 for linux-mtd@lists.infradead.org; Tue, 21 Aug 2012 13:50:15 +0000
Message-ID: <1345557295.2848.112.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 4/6] UBI: replace MTD_UBI_BEB_LIMIT with module
 parameter
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 21 Aug 2012 16:54:55 +0300
In-Reply-To: <1345478416-23900-5-git-send-email-richard.genoud@gmail.com>
References: <1345478416-23900-1-git-send-email-richard.genoud@gmail.com>
 <1345478416-23900-5-git-send-email-richard.genoud@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-iY1HJdXDpEfXBbx3Vp32"
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


--=-iY1HJdXDpEfXBbx3Vp32
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Amended the commit subject,

On Mon, 2012-08-20 at 18:00 +0200, Richard Genoud wrote:
> This patch provides the possibility to adjust the "maximum expected numbe=
r of
> bad blocks per 1024 blocks" (max_beb_per1024) for each mtd device.
>=20
> The majority of NAND devices have their max_beb_per1024 equal to 20, but
> sometimes it's more.
> Now, we can adjust that via a kernel parameter:
> ubi.mtd=3D<name|num|path>[,<vid_hdr_offs>[,max_beb_per1024]]
>=20
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Did few minor amendments and applied this one. And pushed out.=20

> +			pr_err("UBI error: bad value for max_beb_per1024 parameter: %s",
> +			       tokens[2]);

Changed this to 'printk(KERN_ERR' and wrapped the line.

The former is because the entire function uses 'printk(KERN_ERR', and I
am a fan of consistency. We can change them all to 'pr_err()' and
'pr_warn()' in a separate patch.

Similar for wrapping - UBI wraps all messages. If we want, we can unwrap
them all in a separate patch.

Feel free to submit such a patch, I won't have objections.

> -MODULE_PARM_DESC(mtd, "MTD devices to attach. Parameter format: "
> -		      "mtd=3D<name|num|path>[,<vid_hdr_offs>].\n"

You unwrapped this one and I pushed that as is, because it is just much
more readable, and it is the only place where we describe a module, so
no inconsistencies. :-)

Thank you!

--=20
Best Regards,
Artem Bityutskiy

--=-iY1HJdXDpEfXBbx3Vp32
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQM5MvAAoJECmIfjd9wqK0vJgQALs7L3GOXpnsZtJZtEvKVLoE
mLHKRGboBITt+rAvC2BPGNaZAQ0HDIJdBUBPlBAWfjO41Q/Ip6JFn92Y9v6ZEgZH
jAE9GhPBVAPQmOq2MQ5j9hPuu24qcqsXRSfJ3Qnfb5LFShTBVFY3j57RRtK4IBKm
BPVQThrTcSOls148KHlRsgVAfp/SJSHrAYr0ut80i441J1quYOCfOjkqf63o8JAI
+bT/8NZQqQk8Iv9SPNB/Hj3Ope/nGpkAWPVdAiVibNM2ZMHAlFFZEbaW+4E3UaOU
XI9GcTPU6eh3sLbAaJ6ve22WPW19TTODQrvnAUf2VYjtr7q8LMLUP7u0goBkNBQ4
uGEZWpF7dyWJvRpqeBMoH+WmFs1oXoBU3vCWfu7NNAwtXe6VX1wV5DikZA2391Fm
LZdWpD/ezBSrgzeZb1J0m+4nOWyezQbc6tgqHe43BfCdT8r1WXMzEyzmcKmVR8+f
JUcwDiC0RwuILL0OKFZHIgN192cuPiREFoTiaTgk/eBT2H7IKFIrfVTdcRHnN4/1
40IYcc88kSH5FjbgfN8XH+NFk4X9ZIQfuZBAaIUVfKl4xzIB2cIWCbIvhOYOgx/N
uLXEzRVDzn10s+tjWR3o8dCAQRBCPvOCY83NY1rcNsrwMUxpTteG8kXO0VJn5ucD
lVQcT2HlBPs3Ss8IhPl4
=LNEy
-----END PGP SIGNATURE-----

--=-iY1HJdXDpEfXBbx3Vp32--
