Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RIiYl-0002Ek-Qr
	for linux-mtd@lists.infradead.org; Tue, 25 Oct 2011 15:05:00 +0000
Received: by wyg8 with SMTP id 8so724763wyg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Oct 2011 08:04:58 -0700 (PDT)
Subject: Re: [PATCH] mtd: clean up usage of MTD_DOCPROBE_ADDRESS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Bolle <pebolle@tiscali.nl>
Date: Tue, 25 Oct 2011 18:04:47 +0300
In-Reply-To: <1319533207.2409.68.camel@x61.thuisdomein>
References: <1319533207.2409.68.camel@x61.thuisdomein>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-s0BauUu8GXOk4gMAgO/Q"
Message-ID: <1319555096.2814.1.camel@golum>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
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


--=-s0BauUu8GXOk4gMAgO/Q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-10-25 at 11:00 +0200, Paul Bolle wrote:
> Depending on whether MTD_DOCPROBE_ADVANCED is set or not,
> MTD_DOCPROBE_ADDRESS will default to either 0x0000 or 0. That should
> lead to (basically) identical code in docprobe.c. The current two
> defaults should be merged.
>=20
> And, while we're at it, if MTD_DOCPROBE is set MTD_DOCPROBE_ADDRESS will
> always be set. (MTD_DOCPROBE_ADDRESS depends on MTD_DOCPROBE and it has
> a default value.) So the check whether CONFIG_MTD_DOCPROBE_ADDRESS is
> defined is unnecessary and should be dropped.
>=20
> Signed-off-by: Paul Bolle <pebolle@tiscali.nl>

Pushed to l2-mtd-2.6.git, thanks!

--=20
Best Regards,
Artem Bityutskiy

--=-s0BauUu8GXOk4gMAgO/Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAABAgAGBQJOptAPAAoJEJtuLFy+q7feiIsIAI300nkRST9olDtmP7+ipxxz
J7+tKxNY9wFduWT5JQPVitRJQyQDVkp5pH/Ak40TSROp6WfLuQykgWIO7b1M62vb
y9N4LnWEEY0xP56vHz/kIkcUIHbtkzx/slLBr/omIJUrpF7PLJncMjkkkoNoQalK
FMTbw0ptLm+qil+REuHzmICOi9ODE+yj7xxaSpewQJwzxwRBJBVrzKDg4QWT0X1D
yd34Vz0hRuC+XtoO6fpmTqczh1k4pnT4AK9LIDRZU6V2gv6kyM64WJvF487E28DO
tYwDU1bDS0V/ny32WSSRsn6U2EefQNtvVMqBIjbKSBM+EhulcNQw3gyX/kXL4EI=
=4PC9
-----END PGP SIGNATURE-----

--=-s0BauUu8GXOk4gMAgO/Q--
