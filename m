Message-ID: <1337161217.24809.38.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 3/3] MTD: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Date: Wed, 16 May 2012 12:40:17 +0300
In-Reply-To: <20403.29677.517067.528042@ipc1.ka-ro>
References: <1337093256-19117-1-git-send-email-josh.wu@atmel.com>
 <1337093256-19117-4-git-send-email-josh.wu@atmel.com>
 <1337160353.24809.26.camel@sauron.fi.intel.com>
 <20403.29677.517067.528042@ipc1.ka-ro>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-pD1+pg2DRwt3fykfysdA"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, nicolas.ferre@atmel.com, Josh Wu <josh.wu@atmel.com>,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com, plagnioj@jcrosoft.com,
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


--=-pD1+pg2DRwt3fykfysdA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-05-16 at 11:31 +0200, Lothar Wa=C3=9Fmann wrote:
> > > +		dev_warn(host->dev, "Only 2048 page size is currently " \
> > > +			"supported for PMECC, rolling back to Software ECC\n");
> >=20
> > Why do you use backslashes?
> >=20
> message text should not be split across lines anyway to ease grepping
> for the message.

I think the consensus is that it is personal decision of the author. I
am not trying to enforce this and I also split messages. In this case I
was only wondering why that backslash is used? I never saw this before
in the linux kernel.

--=20
Best Regards,
Artem Bityutskiy

--=-pD1+pg2DRwt3fykfysdA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPs3YBAAoJECmIfjd9wqK0LvQP/19WJfif4NaKxl0muTOGvTbJ
XR/kb4Z3Tk2T6vbg3HQzsUh4RL/3VxtgOOWUy+AXZrTjY4zhag0ERlkW2/QQUWJR
lJ3OKcDbNQfLdA/zSeAWnhRifwYY7Q2R9Maj9SAOfGS+1Km5Oc0v5gcO8IMpssvz
lUTrKLSen8XA5/mpytEaUisU7z4Lmn/KqXksmXlnm/lTfCogLwwVMG5ZpBu45R+q
FMNIswq6muDnkkC8xOROn26JwiAuz0ivLSD8yYezVnfSgKzjoaO0VqrsEVgTZtwI
zBvXTGwMtj/VzRjEpk0UQ+0RaeoGH1uiZ5tDlFvxCHlNbwVZceEEQDk+UAOkK4US
dVzRV/C44LBsxzvFMqScSGrI7Q5IpzQBjC+LKid8aZBIFIqqKgy/bx3975JIgTo4
iXBRAwSlpIzwSuRWHm9zglMhLdKf0PUE7OWfHnqNUAzZUZ6EIgzK/BZLIh4XEeId
I5jcqKlfHMjEnh+6uvL40Sb7muY4LuHNWpGQwcK2XcYjXUctm0F8kBAIS192Ev2G
o5dukLRkDNYNhrJmzsdZuR8S5MEvJ8lcZrAWUwNc8+UAASF/IqB+o1f/WOgBAkNZ
0qWH+r48863rEIwE4SeFs5dkkfSJqPTDQWK/4khGtODkcWwM8ydgMKUCY4VibEba
MUaqtqHlxwOQogxbjk9n
=F5Vu
-----END PGP SIGNATURE-----

--=-pD1+pg2DRwt3fykfysdA--
