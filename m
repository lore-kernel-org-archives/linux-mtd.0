Date: Sun, 21 May 2017 07:45:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Angus Ainslie <angus@akkea.ca>
Cc: David Woodhouse <dwmw2@infradead.org>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai
 <wens@csie.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: CHIPPro NAND issue with 4.12 rc1
Message-ID: <20170521074535.4a4ba6dd@bbrezillon>
In-Reply-To: <6f3cefa6c54776f82160ed8954f4d0d4@www.akkea.ca>
References: <399ea126f3b18071fbe46bfc9787df6b@www.akkea.ca>
 <20170520171418.4e8a47e0@bbrezillon>
 <6f3cefa6c54776f82160ed8954f4d0d4@www.akkea.ca>
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

Le Sat, 20 May 2017 15:24:06 -0600,
Angus Ainslie <angus@akkea.ca> a =C3=A9crit :

> On 2017-05-20 09:14, Boris Brezillon wrote:
> > Le Sat, 20 May 2017 08:49:04 -0600,
> > Angus Ainslie <angus@akkea.ca> a =C3=A9crit :
> >  =20
> >> Hi All,
> >>=20
> >> I'm trying to boot a CHIPPro with the stock 4.12 rc1 kernel. If I make
> >> no modifications to the sun5i-gr8-chip-pro.dtb the kernel boots but
> >> can't find the root partition.
> >>=20
> >> So I added the partitions to the dts file
> >>=20
> >> diff --git a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> >> b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> >> index c55b11a..0e61e6b 100644
> >> --- a/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> >> +++ b/arch/arm/boot/dts/sun5i-gr8-chip-pro.dts
> >> @@ -146,6 +146,32 @@
> >>                  reg =3D <0>;
> >>                  allwinner,rb =3D <0>;
> >>                  nand-ecc-mode =3D "hw";
> >> +    nand-on-flash-bbt;
> >> +
> >> +    spl@0 {
> >> +      label =3D "SPL";
> >> +      reg =3D /bits/ 64 <0x0 0x400000>;
> >> +    };
> >> +
> >> +    spl-backup@400000 {
> >> +      label =3D "SPL.backup";
> >> +      reg =3D /bits/ 64 <0x400000 0x400000>;
> >> +    };
> >> +
> >> +    u-boot@800000 {
> >> +      label =3D "U-Boot";
> >> +      reg =3D /bits/ 64 <0x800000 0x400000>;
> >> +    };
> >> +
> >> +    env@c00000 {
> >> +      label =3D "env";
> >> +      reg =3D /bits/ 64 <0xc00000 0x400000>;
> >> +    };
> >> +
> >> +    rootfs@1000000 {
> >> +      label =3D "rootfs";
> >> +      reg =3D /bits/ 64 <0x1000000 0x1f000000>;
> >> +    };
> >>          };
> >>   };
> >>=20
> >> and now the kernel finds the partition but it times out trying to=20
> >> mount
> >> it. It seems to be something in the dts files because if I use the
> >> ntc-gr8-crumb.dts from the ntc 4.4.30 kernel then the system boots all
> >> the way to userland. =20
> >=20
> > Hm, that's weird. Just changing the dtb makes it work? Did you try to
> > dump both dtbs and figure out what else changes?
> >  =20
>=20
> Yeah I thought it was weird too. I was thinking that maybe the pin muxes=
=20
> were getting changed and the rb net or the interrupt net was getting=20
> changed to a different function.
>=20
> I did decompile to 2 dtb's and I couldn't find many differences. They=20
> were mostly around some pull ups and drive strength for some of the NAND=
=20
> and i2c pins. I tried adding those changes and it still didn't work so I=
=20
> went back to the minimal set of changes to reproduce the bug.
>=20
> > Also, I wonder how the NAND is correctly detected without this patch
> > [1].
> >  =20
>=20
>=20
> That patch seems to be in my 4.12-rc1 kernel, I have a definition for=20
> the TC58NVG2S0H.
>=20
> >>=20
> >> [    7.130000] ubi0: scanning is finished
> >> [    7.150000] ubi0: attached mtd4 (name "rootfs", size 496 MiB)
> >> [    7.160000] ubi0: PEB size: 262144 bytes (256 KiB), LEB size:=20
> >> 258048
> >> bytes
> >> [    7.170000] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page=20
> >> size
> >> 1024
> >> [    7.180000] ubi0: VID header offset: 1024 (aligned 1024), data
> >> offset: 4096
> >> [    7.190000] ubi0: good PEBs: 1977, bad PEBs: 7, corrupted PEBs: 0
> >> [    7.200000] ubi0: user volume: 1, internal volumes: 1, max. volumes
> >> count: 128
> >> [    7.210000] ubi0: max/mean erase counter: 3/1, WL threshold: 4096,
> >> image sequence number: 1444477407
> >> [    7.220000] ubi0: available PEBs: 1, total reserved PEBs: 1976,=20
> >> PEBs
> >> reserved for bad PEB handling: 33 =20
> >=20
> > UBI attach works...
> >  =20
> >> [    7.240000] hctosys: unable to open rtc device (rtc0)
> >> [    7.250000] vcc3v0: disabling

Interestingly, it starts failing after the core disables all unused
regulators. Not sure this is related but that's worth having a look.

I looked at the schematics and it seems VCC-3V3 (which is powering the
NAND chip) is enabled with the EXTEN pin of the AXP209 [1]. I don't know
if this pin is controlled by Linux, but maybe you can dump register
0x12 and check if EXTEN is set to 1.

> >> [    7.250000] ALSA device list:
> >> [    7.260000]   #0: sun4i-codec
> >> [    7.260000] ubi0: background thread "ubi_bgt0d" started, PID 53
> >> [    8.320000] sunxi_nand 1c03000.nand: wait interrupt timedout
> >> [    9.320000] sunxi_nand 1c03000.nand: wait interrupt timedout
> >> [   10.330000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> >> timedout
> >> [   11.340000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> >> timedout
> >> [   12.350000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> >> timedout
> >> [   13.360000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> >> timedout
> >> [   14.370000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> >> timedout
> >> [   14.380000] ubi0 warning: ubi_io_read: error -110 while reading=20
> >> 4096
> >> bytes from PEB 1034:4096, read only 0 bytes, retry =20
> >=20
> > And suddenly you get timeouts. That's really weird. =20
>=20
>=20
> Is there anything I can do on this end to help debug ?
>=20
>=20
> >=20
> > [1]https://github.com/NextThingCo/linux/commit/5ebc35ce1223ef14ace9479d=
5f97d0fce979e550 =20
>=20

[1]http://linux-sunxi.org/AXP209
