Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WG8Cq-0002b0-1b
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 14:33:01 +0000
Received: from e0109-106-188-144-10.uqwimax.jp ([106.188.144.10]
 helo=finisterre)
 by cassiel.sirena.org.uk with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
 (Exim 4.80) (envelope-from <broonie@sirena.org.uk>)
 id 1WG8CO-0006Cx-Sw
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2014 14:32:40 +0000
Date: Wed, 19 Feb 2014 22:04:07 +0900
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20140219130407.GR2669@sirena.org.uk>
References: <CAMuHMdUY+XEqKYh7mMOYUV18PpR+7SFw+BEUFh-9yL=H6reQkA@mail.gmail.com>
 <CAMuHMdWkPxp2U=Xz=wWu70RPxj+4GGCyifdPv=xL=47cz_upBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="KHAtaOORvaARn5O0"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWkPxp2U=Xz=wWu70RPxj+4GGCyifdPv=xL=47cz_upBw@mail.gmail.com>
Subject: Re: spi: Provide core support for full duplex devices
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-spi <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--KHAtaOORvaARn5O0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2014 at 10:59:09AM +0100, Geert Uytterhoeven wrote:

> For Dual/Quad transfers, which are half-duplex, the buffer pointer for the
> unused direction must be NULL, so the driver knows in which direction to
> transfer. Hence SPI_MASTER_MUST_TX cannot be set for Dual/Quad
> capable SPI master.

This is a particularly thoughtless hardware design it has to be said.

> I'm also worried about the buffer allocation. With m25p80 and mtchar, the
> transfer buffer can be quite large (up to 4 MiB in my case), and this can be
> triggered from userspace.

That's readily fixable for DMA capable drivers, we can just repeatedly
transfer the same page (or whatever).  PIO drivers have big problems
with such large transfers anyway but could also easily have the transfer
segmented for them in a similar way.  Once we do these things we ought
to be able to avoid having to free the buffer on idle (though a memory
pressure notifier is probably polite) which helps too.  What's there
currently is very much a first pass implementation so things work,
there's plenty of room for optimisation.

> Alternatively, to avoid the memory allocation, you could zero rx_buf,
> and use rx_buf for both tx and rx? That may break some DMA setups,
> though.

As you say it's not clever for DMA and means you have to do the memset()
each time you use the buffer.

> Concluding, for PIO mode, I'm still in favor of using

>     data = tx_buf ? *tx_buf++ : DUMMY_DATA;

> in the SPI master driver itself.

With the ternery operator for legibility of course.

--KHAtaOORvaARn5O0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTBKvEAAoJELSic+t+oim9F+0P/07D+bXTrnB8Oc19At48bPpi
XZAeEnKE4TA0nFWxotiyS0cZuFBF6AWW296lVRcWdx/Swe+jDjTRQPaXtIKhsEyO
84Qaj29+LCogGz0VRFYyzcqAaOrmhYlH1aJTgsUDJm4tOlYCeH5ZiKFgjXkkj8OV
MVI3eNIz1NeOtfpcCOxk/iwczAOxVKlAa2SNVMzlfLzNGmEAQccYxutt7lSDFwXH
ClIPMUYO8toeg/1RuZN5/Ymwb760vZECI40pbK3J34ZOYTn/TVIBwgXJGw4lCx+I
tx+53VMXnax6XSSJ6QkafoHmm0BU+bdbuVjT2EtdEgfD1FiRCSZCeuSS2qtrImaJ
NufrckA+HaYIVyUyRS4XQ0A2l8cuTrmJz+d0XP8iiW1HKG+/Ul28nmsD4RVuV1LC
dy/AUDvOKNFJzie6eoWqFRPGh17l3hwOKfpde2/gVlCs+nIhcPcMEwWSawkxulCP
PNwBYNiS4nChmrIcKy9bAgZugQHsO4AgHbH4Tg6QKuIQCSw2WRnBL3ML8NAV5Qhg
Smf6Xm0MsNkMWpbA3JP6SoLsFsJCOK9vyY89lyJ3XJ4RU9PmG4Pq5XZh5OXMe/di
JqDfL5xGom9Uf84N8tUwQzsDjYc3ZtddVafBb42hIR2nLzWpt+ZD8Hk7BN9yp/cf
nq+3rcNrFusUtnrFBXLx
=OXnF
-----END PGP SIGNATURE-----

--KHAtaOORvaARn5O0--
