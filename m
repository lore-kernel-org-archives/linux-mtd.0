Date: Sat, 20 May 2017 17:14:18 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Angus Ainslie <angus@akkea.ca>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: CHIPPro NAND issue with 4.12 rc1
Message-ID: <20170520171418.4e8a47e0@bbrezillon>
In-Reply-To: <399ea126f3b18071fbe46bfc9787df6b@www.akkea.ca>
References: <399ea126f3b18071fbe46bfc9787df6b@www.akkea.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le Sat, 20 May 2017 08:49:04 -0600,
Angus Ainslie <angus@akkea.ca> a =C3=A9crit :

> Hi All,
>=20
> I'm trying to boot a CHIPPro with the stock 4.12 rc1 kernel. If I make=20
> no modifications to the sun5i-gr8-chip-pro.dtb the kernel boots but=20
> can't find the root partition.
>=20
> So I added the partitions to the dts file
>=20
> diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts=20
> b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> index c55b11a..0e61e6b 100644
> --- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> +++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> @@ -146,6 +146,32 @@
>                  reg =3D <0>;
>                  allwinner,rb =3D <0>;
>                  nand-ecc-mode =3D "hw";
> +    nand-on-flash-bbt;
> +
> +    spl@0 {
> +      label =3D "SPL";
> +      reg =3D /bits/ 64 <0x0 0x400000>;
> +    };
> +
> +    spl-backup@400000 {
> +      label =3D "SPL.backup";
> +      reg =3D /bits/ 64 <0x400000 0x400000>;
> +    };
> +
> +    u-boot@800000 {
> +      label =3D "U-Boot";
> +      reg =3D /bits/ 64 <0x800000 0x400000>;
> +    };
> +
> +    env@c00000 {
> +      label =3D "env";
> +      reg =3D /bits/ 64 <0xc00000 0x400000>;
> +    };
> +
> +    rootfs@1000000 {
> +      label =3D "rootfs";
> +      reg =3D /bits/ 64 <0x1000000 0x1f000000>;
> +    };
>          };
>   };
>=20
> and now the kernel finds the partition but it times out trying to mount=20
> it. It seems to be something in the dts files because if I use the=20
> ntc-gr8-crumb.dts from the ntc 4.4.30 kernel then the system boots all=20
> the way to userland.

Hm, that's weird. Just changing the dtb makes it work? Did you try to
dump both dtbs and figure out what else changes?

Also, I wonder how the NAND is correctly detected without this patch
[1].

>=20
> [    7.130000] ubi0: scanning is finished
> [    7.150000] ubi0: attached mtd4 (name "rootfs", size 496 MiB)
> [    7.160000] ubi0: PEB size: 262144 bytes (256 KiB), LEB size: 258048=20
> bytes
> [    7.170000] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page size=20
> 1024
> [    7.180000] ubi0: VID header offset: 1024 (aligned 1024), data=20
> offset: 4096
> [    7.190000] ubi0: good PEBs: 1977, bad PEBs: 7, corrupted PEBs: 0
> [    7.200000] ubi0: user volume: 1, internal volumes: 1, max. volumes=20
> count: 128
> [    7.210000] ubi0: max/mean erase counter: 3/1, WL threshold: 4096,=20
> image sequence number: 1444477407
> [    7.220000] ubi0: available PEBs: 1, total reserved PEBs: 1976, PEBs=20
> reserved for bad PEB handling: 33

UBI attach works...

> [    7.240000] hctosys: unable to open rtc device (rtc0)
> [    7.250000] vcc3v0: disabling
> [    7.250000] ALSA device list:
> [    7.260000]   #0: sun4i-codec
> [    7.260000] ubi0: background thread "ubi_bgt0d" started, PID 53
> [    8.320000] sunxi_nand 1c03000.nand: wait interrupt timedout
> [    9.320000] sunxi_nand 1c03000.nand: wait interrupt timedout
> [   10.330000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO timedout
> [   11.340000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO timedout
> [   12.350000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO timedout
> [   13.360000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO timedout
> [   14.370000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO timedout
> [   14.380000] ubi0 warning: ubi_io_read: error -110 while reading 4096=20
> bytes from PEB 1034:4096, read only 0 bytes, retry

And suddenly you get timeouts. That's really weird.

[1]https://github.com/NextThingCo/linux/commit/5ebc35ce1223ef14ace9479d5f97=
d0fce979e550
