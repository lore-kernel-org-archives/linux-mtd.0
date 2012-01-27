Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqlH2-0006lh-VN
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 12:51:25 +0000
Received: by pbdx9 with SMTP id x9so1971756pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 04:51:22 -0800 (PST)
Message-ID: <1327668807.26648.38.camel@sauron.fi.intel.com>
Subject: Re: Kernel panic when reading mtd device
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Shawn J. Goff" <shawn7400@gmail.com>
Date: Fri, 27 Jan 2012 14:53:27 +0200
In-Reply-To: <CAGiDA6KjJKQcho9aiqA2KSe30tvU0JZnMgv86zSE_Pt2=JRdDA@mail.gmail.com>
References: <CAGiDA6LO-PWL6OeGwwPJzdx8TVEXMA84ceOvQZ3UECKkG54YAw@mail.gmail.com>
 <CAGiDA6KjJKQcho9aiqA2KSe30tvU0JZnMgv86zSE_Pt2=JRdDA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-a6jWyH0IOLzfIh7GK6b4"
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


--=-a6jWyH0IOLzfIh7GK6b4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-01-19 at 19:16 -0500, Shawn J. Goff wrote:
> I believe the problem is in drivers/spi/atmel_spi.c. It looks like it
> needs to break the transfer down into chunks that can fit in the
> buffer. It seems that this driver as it exists in the Linux4SAM tree (
> https://github.com/linux4sam/linux-at91/tree/linus2639_5series_1.x )
> is unfinished(?) As a quick workaround, I did the following, which
> allows me to function for now.
>=20
> diff --git a/drivers/spi/atmel_spi.c b/drivers/spi/atmel_spi.c

This driver is not in upstream - I do not have it in my 3.3-rc1 at
least.


--=20
Best Regards,
Artem Bityutskiy

--=-a6jWyH0IOLzfIh7GK6b4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPIp5HAAoJECmIfjd9wqK0pPcQAMlzOGzZLqAs2j/KxwVmKvAw
ISREs4VE20nuyPerXXYpgA66/P5CiJjEqeWEQ7TEK+gDJ5jgjELO7hrGiW1oNKpF
f0MNc4l2/Wexx2hnqUWCTXJL5qACu3IPzPwLsszMwGqMuUQDoTgdPAGu6fOpSwym
TlytbFoLlJeMNL1mJNcDsQ/+Dfqa5XQoFWb89rbpjqF02mVLTYPtr/Q1kQ6gISh/
7TS81PfZqYVhYeVjwOo9uk1ye5evmrg/BPRGb8GiRcbypNy262T8MfoAf86itP6h
xi7LlRgeijTqS8HOBQgVozOf6uMOQ1iBr/b49IoWVWDm/y6IUgJ996EhmBiXZDOI
7Oetpdb46XFRv8qkLdELhyRXn+ouarB37eVrr/WXTWdjGIPax4eJJ5trkiMOOxIF
edynBipDt9OjUWRLJZDGe6a5F1ZSotMkjdiPIS1DEB1IA+AOLtcOKsqD3bBYP0RX
se5Aa+9nT00vAuOpda/iSICyTvpYA7SN6QtpH1uHhNzwUZokV7XiFsC+kXtiEiRn
+mN8tDM1Z/hgrHCdi1F3Rhl7sIhEABikJ+87p6J/P3mnBeEyraeJ3LFeb+5Ni7vY
mq6FWvuIq638Jx+orNaEEHojvca6hD6mQmWJYi29z3jswzw6yuax446ZDUpD9FHl
Fnp9sTpZwrFLKcD9cuSe
=BRut
-----END PGP SIGNATURE-----

--=-a6jWyH0IOLzfIh7GK6b4--
