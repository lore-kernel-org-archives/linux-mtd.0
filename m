Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T61yp-0003aa-SJ
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 16:16:00 +0000
Received: from coredoba.hi.pengutronix.de ([2001:6f8:1178:2:219:99ff:fe56:8d7])
 by metis.ext.pengutronix.de with esmtp (Exim 4.72)
 (envelope-from <jlu@pengutronix.de>) id 1T61ym-0006NL-6N
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 18:15:56 +0200
Received: from jlu by coredoba.hi.pengutronix.de with local (Exim 4.80)
 (envelope-from <jlu@pengutronix.de>) id 1T61ym-0002j8-1W
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 18:15:56 +0200
Message-ID: <1346084156.3722.9.camel@coredoba.hi.pengutronix.de>
Subject: Re: UBI on SPI NOR flash
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 27 Aug 2012 18:15:56 +0200
In-Reply-To: <1345811483.2848.310.camel@sauron.fi.intel.com>
References: <1345050600.3514.11.camel@coredoba.hi.pengutronix.de>
 <1345811483.2848.310.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

On Fri, 2012-08-24 at 15:31 +0300, Artem Bityutskiy wrote:
> On Wed, 2012-08-15 at 19:10 +0200, Jan L=C3=BCbbe wrote:
> > Hi all!
> >=20
> > I'm trying to use UBIFS on SPI NOR flash, but have been unable to get i=
t
> > to work on kernel version 3.5. It is a Numonyx N25Q128 connected to an
> > TI AM3505.
>=20
> First of all, run the mtd tests and see if the flash works well.

~ # modprobe mtd_readtest dev=3D5
[  124.351074]=20
[  124.353057] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  124.359466] mtd_readtest: MTD device: 5
[  124.365173] mtd_readtest: not NAND flash, assume page size is 512 bytes.
[  124.373107] mtd_readtest: MTD device size 3670016, eraseblock size 65536=
, page size 512, count of eraseblocks 56, pages per eraseblock 128, OOB siz=
e 0
[  124.388000] mtd_readtest: testing page read
[  126.754089] mtd_readtest: finished
[  126.757690] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
~ # modprobe mtd_speedtest dev=3D5
[  160.338775]=20
[  160.344146] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  160.350708] mtd_speedtest: MTD device: 5
[  160.354827] mtd_speedtest: not NAND flash, assume page size is 512 bytes=
.
[  160.362396] mtd_speedtest: MTD device size 3670016, eraseblock size 6553=
6, page size 512, count of eraseblocks 56, pages per eraseblock 128, OOB si=
ze 0
[  204.830078] mtd_speedtest: testing eraseblock write speed
[  218.410614] mtd_speedtest: eraseblock write speed is 264 KiB/s
[  218.416717] mtd_speedtest: testing eraseblock read speed
[  220.146087] mtd_speedtest: eraseblock read speed is 2078 KiB/s
[  264.651000] mtd_speedtest: testing page write speed
[  278.239562] mtd_speedtest: page write speed is 263 KiB/s
[  278.245697] mtd_speedtest: testing page read speed
[  280.607025] mtd_speedtest: page read speed is 1521 KiB/s
[  324.869445] mtd_speedtest: testing 2 page write speed
[  338.450592] mtd_speedtest: 2 page write speed is 263 KiB/s
[  338.456359] mtd_speedtest: testing 2 page read speed
[  340.498870] mtd_speedtest: 2 page read speed is 1760 KiB/s
[  340.505065] mtd_speedtest: Testing erase speed
[  384.802856] mtd_speedtest: erase speed is 80 KiB/s
[  384.807922] mtd_speedtest: Testing 2x multi-block erase speed
[  430.186370] mtd_speedtest: 2x multi-block erase speed is 78 KiB/s
[  430.193389] mtd_speedtest: Testing 4x multi-block erase speed
[  475.582244] mtd_speedtest: 4x multi-block erase speed is 78 KiB/s
[  475.588653] mtd_speedtest: Testing 8x multi-block erase speed
[  521.005981] mtd_speedtest: 8x multi-block erase speed is 78 KiB/s
[  521.013031] mtd_speedtest: Testing 16x multi-block erase speed
[  566.628875] mtd_speedtest: 16x multi-block erase speed is 78 KiB/s
[  566.636016] mtd_speedtest: Testing 32x multi-block erase speed
[  611.978057] mtd_speedtest: 32x multi-block erase speed is 79 KiB/s
[  611.985198] mtd_speedtest: Testing 64x multi-block erase speed
[  657.134216] mtd_speedtest: 64x multi-block erase speed is 79 KiB/s
[  657.141326] mtd_speedtest: finished
[  657.144989] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
~ # modprobe mtd_stresstest dev=3D5 count=3D100
[  708.805480]=20
[  708.807464] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
[  708.815093] mtd_stresstest: MTD device: 5
[  708.819763] mtd_stresstest: not NAND flash, assume page size is 512 byte=
s.
[  708.827911] mtd_stresstest: MTD device size 3670016, eraseblock size 655=
36, page size 512, count of eraseblocks 56, pages per eraseblock 128, OOB s=
ize 0
[  708.848632] mtd_stresstest: doing operations
[  708.853637] mtd_stresstest: 0 operations done
[  775.528625] mtd_stresstest: finished, 100 operations done
[  775.535125] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

> Another problem I know with SPI flashes is that UBIFS uses vmalloc'd
> memory for I/O, which is not suitable for DMA-ing on ARM platforms and
> may cause subtle bugs and curruptions. Can you try to disable DMA and
> see if the issues go away?

It works if I disable DMA in drivers/spi/spi-omap2-mcspi.c (simply
comment out the DMA branch in omap2_mcspi_work). I can use UBI&UBIFS
without problems for far. When rebooting to a kernel with DMA enabled I
can no longer attach the previously working volume. Moving back to the
PIO-Kernel, it works again.

Where should this be fixed? Should UBI use kmalloc'ed memory?

Why does this work for NAND controllers using DMA? :)

Regards,
Jan
--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
