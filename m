Message-ID: <1359961661.13791.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 05/11 v2] ARM: nomadik: add FSMC NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 04 Feb 2013 09:07:41 +0200
In-Reply-To: <1358607204-24264-1-git-send-email-linus.walleij@linaro.org>
References: <1358607204-24264-1-git-send-email-linus.walleij@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-QPEngBasPml5wDpxxixE"
Mime-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mtd@vger.kernel.org,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-QPEngBasPml5wDpxxixE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2013-01-19 at 15:53 +0100, Linus Walleij wrote:
> This adds the FSMC NAND driver and flash partitions to the Nomadik
> device tree.
>=20
> The only compatible string accepted by this driver is currently
> "st,spear600-fsmc-nand" which is inappropriate for this system, so
> this patch adds the compatible value "stericsson,fsmc-nand" as
> well.
>=20
> Cc: linux-mtd@vger.kernel.org
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> I'm requesting an ACK from the MTD maintainers to be able to apply
> this patch through the ARM SoC tree.

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

--=20
Best Regards,
Artem Bityutskiy

--=-QPEngBasPml5wDpxxixE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.13 (GNU/Linux)

iQIcBAABAgAGBQJRD149AAoJECmIfjd9wqK0/SYP/j5mEMeHPgodj+wXDOzcOSi1
mN18mIcTR+sJMmn1xfbHZbY0PREj2eF1jJzi1oStgDT8P5IgplUUP4oxxNoNXz1N
qkqkuP+GlXo/Slv4jZJUzZSlgk0ahusjAlb6i37bfrarX5TB6o5a+ZlQ1E8U7gT5
Sw23QGBMJAGjgHWRIb/bmsNHqP2hwQvRzQuwv79B/5TVaq0skJdhmcbEOZDFkoJu
AVm5RCxn5El/pgwwydhF0oxQL4MIzgLzZmrQdJTmvP3cx7DhHkcTjyyDeJX7pjwP
5adiCF9uEKFRnJEt7H5f+OoavdB7LOvsfMtgS1ZxAwkPug72Rwij8318EdMQZ3wj
wwwpsZVmoJ1udxjCDsGjvIOF74OJfy31Z+vbGfpa6ZqW1FodUZ56ZItMsAd3YoGp
rhFembsRFjlzjR7eOPf7NPSNVsiHWjCwJG5IIXkGoi9ryQBMp231DMRWDLYIp0LJ
9OhE4udEMEPvGpw9Az7/lp92HI8LWVWvGN/UayXOihO9Suppa//p7nFbfvYs7VbT
MzeqTM+gUkbtiPoaRtuzggRLy1wDM1B1WVkFZjO+mNgqTZkfzUGyuZajBonoYyxu
Pwg4k2Xq0ZZurVoa6F4hZN+0fYFEV0wge8aeFZ0qg9TrnrsCXh9UsWCJ/8kUKa/+
r3UrmiMG6Mwj+twVNQeL
=ILEK
-----END PGP SIGNATURE-----

--=-QPEngBasPml5wDpxxixE--
