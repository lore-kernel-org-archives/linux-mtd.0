Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TYEuY-00052L-8W
 for linux-mtd@lists.infradead.org; Tue, 13 Nov 2012 11:44:10 +0000
Message-ID: <1352807066.2262.53.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] Add devicetree support to m25p80 driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Michal Vanka <mv@vanka.net>
Date: Tue, 13 Nov 2012 13:44:26 +0200
In-Reply-To: <50A2193A.2040100@vanka.net>
References: <5084241A.5050801@vanka.net> <50A2193A.2040100@vanka.net>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-KRDDoswjtskCwRgsbIk8"
Mime-Version: 1.0
Cc: devicetree-discuss@lists.ozlabs.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-KRDDoswjtskCwRgsbIk8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-11-13 at 10:56 +0100, Michal Vanka wrote:
>                 return -ENODEV;
>   #endif
> @@ -825,27 +848,39 @@ static int __devinit m25p_probe(struct
> spi_device
> *spi)
>                         dev_warn(&spi->dev, "unrecognized id %s\n",
> data->type);=20

Still line-wrapped:

$ git apply --check ~/tmp/mvanka.mbox
fatal: corrupt patch at line 122

Please, make sure it applies to the l2-mtd.git tree. Send it to
yourself, save your own e-mail, and verify with 'git apply --check'.

--=20
Best Regards,
Artem Bityutskiy

--=-KRDDoswjtskCwRgsbIk8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQojKaAAoJECmIfjd9wqK0NagP/Rj5fwmqDFdM54y4WHZUEmKh
HE2wfW55001d5T0N4Z+aQS0QJVJ5VRYFPl6Mho3nmZkJDwJqRDksspZh293KujKg
sTubYIZszzT5jZayOI4bu2mto565zdYlZ3BqkPnsmOjkow0rWwKvRW7mZyw35PPA
4sTKRqJWrG2CImzvp2R70hXCwzGzZfbjInn3NvtdhXuLACXW4FDmOU4SFw0+P8+y
hQ+b6e4uQbYXt3Hi+qecDXAL9o2cQlk1r9tvgbXnG6MMRFQij7G2eLAlKHWlYKPq
lFXUs9oazX4jMg5qrvkj3xiz9eyHkMA9t3YuRWWzdP83lGy0OgVvWKL8rWOwmHT0
OgBZXca1wratZncJOxVLidWv1rgF2DQxlBWdyMJzBsQz9LN/X5WLljUhnqnFHfBZ
knHMkN1IryK4438qMmIGVJDyqrJkoSDJJBooyplMJh6ruQ/Eyb7Whs45xP0wZUf/
CDW57hM2XHLqEmkQOsWFsNqEs2kfx2OBKD+KKmafyx8usMvrXUC4CQ1R2kjDLWJj
lyuq3yRHcD+R/pdeWn5KVjB1TKJF9P/yusocFY7Acq77q58vGmSAFbBbdoyaLuMN
LyAatjv7uKpbAZwVS9A48cFcPLgx8W1Gukg9aslHWm/ZptcQ/YLxDmyJWZuZ1KZa
udhc2UTbxkHPwOaaTh9Z
=UzK+
-----END PGP SIGNATURE-----

--=-KRDDoswjtskCwRgsbIk8--
