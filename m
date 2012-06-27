Message-ID: <1340771320.2317.13.camel@koala>
Subject: Re: [PATCH v11 0/4] MTD: at91: Add PMECC support for at91 nand
 flash driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Date: Wed, 27 Jun 2012 07:28:40 +0300
In-Reply-To: <4FEA87E5.9010604@atmel.com>
References: <1340618866-28776-1-git-send-email-josh.wu@atmel.com>
 <1340768981.2317.7.camel@koala> <4FEA87E5.9010604@atmel.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-FTXWNZHaeBtoKQ9JJWB7"
Mime-Version: 1.0
Cc: hongxu.cn@gmail.com, jack.lan@freescale.com, nick.spence@freescale.com,
 tie-fei.zang@freescale.com, nicolas.ferre@atmel.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, scottwood@freescale.com,
 Dipen.Dudhat@freescale.com, ivan.djelic@parrot.com,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-FTXWNZHaeBtoKQ9JJWB7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-27 at 12:11 +0800, Josh Wu wrote:
> Hi, Artem
>=20
> On 6/27/2012 11:49 AM, Artem Bityutskiy wrote:
> > On Mon, 2012-06-25 at 18:07 +0800, Josh Wu wrote:
> >> Those patches is based on v3.5-rc4
> >>
> >> Changes since v10,
> >> 	add one more patch in this patch set, which add 'int' return value fo=
r write_page()/write_page_raw() functions in structure of nand_ecc_ctrl.
> >> 	Instead of calling BUG(), atmel_nand_pmecc_write_page() will return -=
EIO when time out to read the pmecc status register.
> >> 	increase the time-out duration to 100ms, which has more toleration.
> >> 	add oob_required argument for pmecc read/write functions to align wit=
h v3.5-rc4.
> > I have issues compiling l2-mtd.git tree (based on 3.5-rc5) with the
> > attached defconfig. Probably not your fault, but may be you have a
> > fix/suggestion? I did not have time to look closer. Aiaiai reports:
>=20
> I think the name of kernel config for AT91 is changed, so you can try=20
> add following two line in your original config file.
>=20
> CONFIG_SOC_AT91SAM9=3Dy
> CONFIG_SOC_AT91RM9200=3Dy
>=20
> run the make menuconfig will get new config, that can pass the compile.

I get "arm-unknown-linux-gnueabi-ld: no machine record defined". I think
it wants me to select the board. I've tried one and get another
compilation issue:

arch/arm/mach-at91/built-in.o:(.arch.info.init+0xbc): undefined
reference to `at91sam926x_timer'

It looks like AT91 stuff is not looked after carefully.

Can you please send me a working defconfig based on the one I sent you -
just modify it.

--=20
Best Regards,
Artem Bityutskiy

--=-FTXWNZHaeBtoKQ9JJWB7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJP6ov5AAoJECmIfjd9wqK0TGEP/RsoTbHJehE2mxMlZVsIt7ll
7l24EC1ucM1IyE/gNHr+ZKZaaotWevJ+votK9QRUnw67tDNmyPjS/bZMYnSBS35h
miwcs8QrrX0rr0ImV6OvfIzy4gLVtQ3cvwrBnYNEWf6jr/kESXtZgrG6nfzKx+Yj
I13fRfkeK2u5NdihIlQJfAA4rSCpGy0Ba3/0DRyYwzTyCfqbPmZGijb4gjwO/KRz
jgqH5QzwruiDoPhVcN3eE9QFxuGgAfSYx8ouQdrsmxZ/qsuJOQ7k4jebr57BhsWq
UyYx0eekJW1QSVVmOEyHOYn5P8FaJRFK4LFoeaDVdCu+XX4nrrh2THlG67EQUdL7
Rh+EGhCiRh79KcAIewHE90/TirTwB7VHYTM0Wk/WBYjIaW2Si2F0aRafv9Y/JTdH
upV0F8pWoX6ZX4tvIFB6gzK6lCKrsxVlBQgBcYl+0BwgHMOSuI9HVoYhd4Li1yOH
NzpKYAHc9OS7aOVDN7L+Qavm+FrUf28Um/SsqYFKEDNhMmxClU47YzFiLUcJZkjZ
Rw+jkk1tj14QO0zClGhfQ81Gg2dp0awkB3+yb/ZP0AZQMvjGWmIsHcTW++lv5GFJ
Np42bGxyZSVnQXJdJjQfbn8Xf5f4+Z+hkJPnCtJuLofkxuUsYH0S6eTmfYr35Vm0
K+jzxl/ECe/WP99UyeBT
=LPBx
-----END PGP SIGNATURE-----

--=-FTXWNZHaeBtoKQ9JJWB7--
