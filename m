Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rwz9u-0003vo-RX
 for linux-mtd@lists.infradead.org; Mon, 13 Feb 2012 16:53:47 +0000
Received: by dakp5 with SMTP id p5so5685679dak.36
 for <linux-mtd@lists.infradead.org>; Mon, 13 Feb 2012 08:53:46 -0800 (PST)
Message-ID: <1329152161.22240.215.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] sfc: mtd: Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Hutchings <bhutchings@solarflare.com>
Date: Mon, 13 Feb 2012 18:56:01 +0200
In-Reply-To: <1329149739.2697.0.camel@bwh-desktop>
References: <20120212111308.0267f200@pixies.home.jungo.com>
 <1329149739.2697.0.camel@bwh-desktop>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-RWU6SidvjGO6aRv1Cl23"
Mime-Version: 1.0
Cc: netdev@vger.kernel.org, linux-net-drivers@solarflare.com,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 David Miller <davem@davemloft.net>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-RWU6SidvjGO6aRv1Cl23
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-13 at 16:15 +0000, Ben Hutchings wrote:
> On Sun, 2012-02-12 at 11:13 +0200, Shmulik Ladkani wrote:
> > From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> >=20
> > As of bb0eb217, MTD_FAIL_ADDR_UNKNOWN should be used to indicate mtd
> > erase failure not specific to any particular block.
> >=20
> > Use MTD_FAIL_ADDR_UNKNOWN instead of 0xffffffff when setting
> > 'erase->fail_addr' in 'efx_mtd_erase()'.
> >=20
> > Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
> Acked-by: Ben Hutchings <bhutchings@solarflare.com>

OK, pushed to l2-mtd.git with this ack, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-RWU6SidvjGO6aRv1Cl23
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPOUChAAoJECmIfjd9wqK04ycP/RXNKThWRNj5UGagNBMxzecs
LFaNFRT77w7YkdQBjndz/vKTvAPwGZ7aIvttVlR6tbNfc0UFUd2NTcgyUKOcw31w
Rkx3VVLQ+D0Z25KbGfjXb/Z/d3XOpgCnIMNBP1c2cadGDBVxDLjfjfaqmYCJUunc
311GDQo/BsJOR3i+cNGSPmx1Ft48rdw5pvr8zWKLVziuE8/LcV+IjUuwm9LdcJjI
aZ/eNzAZSbxYn+Mcr5YFeQ2rXYot+5DPCuAzoOsneiG0D2w9vs1ZETfqVfWbQFnz
zAeDEI7/YQPmcU2W2GmEtGCwGoLZB5vTkRJWZI7Tq0gynIC8lk3WplhFxybfEUH1
FERrmwYdLw2bmJJ5Q6IAr4/3yK7wu0ROUHiIDQ1Tmw8ZwOrTg6pCp6HMwBrrv1MW
YRtNi7F4iqZ5QPQYRYeE3SQ8632UIQnl+q0GjmDznnqTNKaiN8huf0dlx50GCW/R
66RgFCtNYdBfW34vd8jM7/x2vsFKpZLGyKjkYCVoX8H4taV09vonqnslBT/6HYSJ
b0NfrV56sVvDK+Z3QPT/O1lV9GB/eQ4b4Mw2YGcxAXJ7viwwhnzdwKTKEDXd2SK3
lzSUaIF6ChjzenybCGVLzrOXa3w0KoE/bEwKgO/JOTmGNFMS6N/QYdGiJsEKeUaM
ed0Mn9EopAfYJPYl93p8
=NJUx
-----END PGP SIGNATURE-----

--=-RWU6SidvjGO6aRv1Cl23--
