Date: Mon, 22 May 2017 09:01:17 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Angus Ainslie <angus@akkea.ca>, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: CHIPPro NAND issue with 4.12 rc1
Message-ID: <20170522070117.mwk4gm34o7idedye@flea.home>
References: <399ea126f3b18071fbe46bfc9787df6b@www.akkea.ca>
 <20170520171418.4e8a47e0@bbrezillon>
 <6f3cefa6c54776f82160ed8954f4d0d4@www.akkea.ca>
 <20170521074535.4a4ba6dd@bbrezillon>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="2k6kzaqr7q5gvmyo"
Content-Disposition: inline
In-Reply-To: <20170521074535.4a4ba6dd@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--2k6kzaqr7q5gvmyo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 21, 2017 at 07:45:35AM +0200, Boris Brezillon wrote:
> > >> [    7.130000] ubi0: scanning is finished
> > >> [    7.150000] ubi0: attached mtd4 (name "rootfs", size 496 MiB)
> > >> [    7.160000] ubi0: PEB size: 262144 bytes (256 KiB), LEB size:=20
> > >> 258048
> > >> bytes
> > >> [    7.170000] ubi0: min./max. I/O unit sizes: 4096/4096, sub-page=
=20
> > >> size
> > >> 1024
> > >> [    7.180000] ubi0: VID header offset: 1024 (aligned 1024), data
> > >> offset: 4096
> > >> [    7.190000] ubi0: good PEBs: 1977, bad PEBs: 7, corrupted PEBs: 0
> > >> [    7.200000] ubi0: user volume: 1, internal volumes: 1, max. volum=
es
> > >> count: 128
> > >> [    7.210000] ubi0: max/mean erase counter: 3/1, WL threshold: 4096,
> > >> image sequence number: 1444477407
> > >> [    7.220000] ubi0: available PEBs: 1, total reserved PEBs: 1976,=
=20
> > >> PEBs
> > >> reserved for bad PEB handling: 33 =20
> > >=20
> > > UBI attach works...
> > >  =20
> > >> [    7.240000] hctosys: unable to open rtc device (rtc0)
> > >> [    7.250000] vcc3v0: disabling
>=20
> Interestingly, it starts failing after the core disables all unused
> regulators. Not sure this is related but that's worth having a look.
>=20
> I looked at the schematics and it seems VCC-3V3 (which is powering the
> NAND chip) is enabled with the EXTEN pin of the AXP209 [1]. I don't know
> if this pin is controlled by Linux, but maybe you can dump register
> 0x12 and check if EXTEN is set to 1.
>=20
> > >> [    7.250000] ALSA device list:
> > >> [    7.260000]   #0: sun4i-codec
> > >> [    7.260000] ubi0: background thread "ubi_bgt0d" started, PID 53
> > >> [    8.320000] sunxi_nand 1c03000.nand: wait interrupt timedout
> > >> [    9.320000] sunxi_nand 1c03000.nand: wait interrupt timedout
> > >> [   10.330000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> > >> timedout
> > >> [   11.340000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> > >> timedout
> > >> [   12.350000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> > >> timedout
> > >> [   13.360000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> > >> timedout
> > >> [   14.370000] sunxi_nand 1c03000.nand: wait for empty cmd FIFO=20
> > >> timedout
> > >> [   14.380000] ubi0 warning: ubi_io_read: error -110 while reading=
=20
> > >> 4096
> > >> bytes from PEB 1034:4096, read only 0 bytes, retry =20
> > >=20
> > > And suddenly you get timeouts. That's really weird. =20

This just made me realise, this is also the time where the clocks are
disabled, and we changed our clock implementation in 4.11.

And using the 4.4 DT will keep the old driver...

Did you test in 4.11? If it's also broken, could you try to revert
1f4ce3b6ca79 and 6b48644b1d29 (I'm not sure it's going to be a trivial
revert, but in that order it should work).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2k6kzaqr7q5gvmyo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZIoy9AAoJEBx+YmzsjxAgiBgP/00MFsdMxm+rfJlUzQrwGTGP
8TvQz6c1cS8bTuAGRQtOfs/ZCAqLaZdXX/hfQRqBbJ1N+tCl+pI8xktvY1eVMwyz
RwTe5hACUlQOHk8WDrOauDPz+O57KNf99yoSJWgH6iFjGkMpfjJhJb/X7x4hM32u
99w/YPTYbaMnelRVqH+CE4rGoMEtG7h+MDvTNMUbhbk1YlVVtx/12QE4c8XjjPyd
+hEDVZgypmp/6PfnM3x+kcVtDUgGnYY52pZh7ZkesHTRJeYED8IqjSGQqzekSOVv
3y0WhMD1TShxg075Ckb34MC6YIuJW69WfYnCyi0wGn7foWB++lpKtgfTHTAnJ3QQ
M+G1fpnYtSkz3CyzPJ6XFG0LPzbnsuB7CpW6sFaBEq4Pq7v1jyUwX2jzT3j1V2Fc
2HFOw5hKNL/q1NOQUhQyns8LTXEKjxp+ydP/5V1flx5TW2+y5rAkQBNtStfBbAbp
5LS0yWvtjDlQcAZj/FO/wD2UUESET7nt8jcgSkX/gjV0W8MeHjHz8uVYZJVn3tNe
OdnxCGvXSXufis+oKOpriCe1KPRqa9BRdqYaS1a45cNwLtc6FW4H2IDasd0BSTtg
exEfiKZ2NlyqcK7Xo8jFJ2NPa0xzzLgmaJkDFkzcnVM6mdt5n+kGLneSEauNdhW2
kc8b8spKy/EF//FlLA8b
=Y6lx
-----END PGP SIGNATURE-----

--2k6kzaqr7q5gvmyo--
