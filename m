Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SNkja-0001Nr-F4
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 12:57:15 +0000
Received: by lagy4 with SMTP id y4so542680lag.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Apr 2012 05:57:11 -0700 (PDT)
Message-ID: <1335531419.1910.0.camel@koala>
Subject: Re: [PATCH] MTD: bcm63xxpart: handle Broadcom partition order
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Date: Fri, 27 Apr 2012 15:56:59 +0300
In-Reply-To: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
References: <1334834157-16860-1-git-send-email-jonas.gorski@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-YOUBBDcluK2QbjLoxN/W"
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-YOUBBDcluK2QbjLoxN/W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-04-19 at 13:15 +0200, Jonas Gorski wrote:
> The original Broadcom partition order has the root fs in front of the
> kernel, which resulted in miscalculated partition sizes.
> Detect when such an image is on the flash and also reorder the partitions
> accordingly.
>=20
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Unrilated, but would someone from bcm community take a look at this
compilation problem:

In file included from /home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-=
bcm63xx/gpio.h:4:0,
                 from /home/dedekind/git/l2-mtd/arch/mips/include/asm/gpio.=
h:4,
                 from include/linux/gpio.h:36,
                 from drivers/mtd/maps/gpio-addr-flash.c:16:
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
: In function 'bcm63xx_gpio_count':
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
:10:2: error: implicit declaration of function 'bcm63xx_get_cpu_id' [-Werro=
r=3Dimplicit-function-declaration]
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
:11:7: error: 'BCM6358_CPU_ID' undeclared (first use in this function)
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
:11:7: note: each undeclared identifier is reported only once for each func=
tion it appears in
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
:13:7: error: 'BCM6338_CPU_ID' undeclared (first use in this function)
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
:15:7: error: 'BCM6345_CPU_ID' undeclared (first use in this function)
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
:17:7: error: 'BCM6368_CPU_ID' undeclared (first use in this function)
/home/dedekind/git/l2-mtd/arch/mips/include/asm/mach-bcm63xx/bcm63xx_gpio.h=
:19:7: error: 'BCM6348_CPU_ID' undeclared (first use in this function)

--=20
Best Regards,
Artem Bityutskiy

--=-YOUBBDcluK2QbjLoxN/W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPmpebAAoJECmIfjd9wqK0oNcP/3hl/1TcEynFZMkUQ/6dSK+S
CsemEKPS5sjzXUaMieBGEbhRp/ul9KyZxamYut5EiGoqTJ6LLdlLN/ZEkawRlBne
jKePXSZQbvE3CVaspLCSpHkyXNKppZYcfadpnUE+aGYXj2Oww8jgIp0QBX9jE34U
UuN6dsaWP0i80Y5szydfP7MqWkWB2Hcc52JEiO1EWE7brcLhcMBwyNU1b2lj4Inl
7aI8oB8rhKbI3EIUCu62RxXGkAtarxVPyaAbXaZe3XpIkiDi11CfXVR8OBjvI8Zw
6XXH6wuxgbjM8GkU+TkLOqX2JLcX0elZQumUhPRgvsuKRAsgZsmR9p3iBH5SBjAa
P/woZVlPObD4pzVrRlJ50Rj8EAQwxG79MQbfbFa1bM4zwZpUFzlnMaaDHx6QXHIN
vwtGvTnxWdgtvlJmliJPRggj3VQenQupULc7GvpKWQ6fWucDSXItTUuw/l6K4dHq
dWA5N0jsqNYJdiw1zCCcvQm02q4IQDLCpqHWoDyEgfjFwFtDrE3dkPQnboGQ6uei
B779Z3UO7nVgpb3TI3xxH5AN/nF0d85UEeq3HXci33siUTbcJ2E+/SgPphLH2kgx
IIrKQ2VD5hwgNIbwX4I5PuGSGFD0A4M1V6Bw6oY/ohbExKdGRkj8OKYnynsOlHh0
naxG1+FLyaYM4QLl0rO9
=5R7z
-----END PGP SIGNATURE-----

--=-YOUBBDcluK2QbjLoxN/W--
