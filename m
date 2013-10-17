Received: from [2001:41c8:1:5384::2] (helo=cassiel.sirena.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWxDV-00055x-Ja
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 23:42:58 +0000
Date: Fri, 18 Oct 2013 00:42:30 +0100
From: Mark Brown <broonie@kernel.org>
To: "Gupta, Pekon" <pekon@ti.com>
Message-ID: <20131017234230.GZ2443@sirena.org.uk>
References: <20131015111647.GX2443@sirena.org.uk> <525D2BB3.4020705@ti.com>
 <20131015124656.GM2443@sirena.org.uk> <525D41E2.30206@ti.com>
 <20131015180142.GS23337@ld-irv-0074.broadcom.com>
 <CA+7tXigv1Q3BPE3uhzdJpx3DsqUpxzrBUaPfWR-i15PsVtMWsQ@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA23640@DBDE04.ent.ti.com>
 <525FD715.50703@ti.com> <20131017123850.GN2443@sirena.org.uk>
 <20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="zk7MNm5p1Zc4RXS/"
Content-Disposition: inline
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA27E10@DBDE04.ent.ti.com>
Subject: Re: [PATCH 1/3] spi/qspi: Add memory mapped read support.
Cc: Peter Korsgaard <peter@korsgaard.com>,
 Brian Norris <computersforpeace@gmail.com>, "Balbi, Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>, Trent Piepho <tpiepho@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--zk7MNm5p1Zc4RXS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 17, 2013 at 01:03:26PM +0000, Gupta, Pekon wrote:

> mtd_read() {
> 	if (flash->mmap_mode)
> 		if (dma_available)
> 			read_via_dma(destination, source, length);
> 		else
> 			memcpy(destination, source, length);
> 	else
> 		/* use spi frame-work by default */
> }

> Are you looking for comparison between  read_via_dma() v/s memcpy() ?

No, I'm looking for a comparison of normal SPI mode (which I'd have
expected to DMA) and the memcpy() mode.

> If yes, then unfortunately we are bit constrained because our controller
> does not support DMA. So, we have to depend on CPU based memcpy()
> only. However, use of DMA can be added as an independent patch on
> top of this CASE-2 patch.

However if the controller can't DMA at all then that's not going to be
possible...  am I understanding you correctly that normal SPI can't DMA?

--zk7MNm5p1Zc4RXS/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSYHXjAAoJELSic+t+oim9HXoQAJ2rpt+6M3P3c9N1lNItH+Sb
gGhR8ZANlE8SovsfOLEI8+v3JKloOAk97pmN3xrCHCks2c1gj4AyICanQQj3aSoS
vzBkyEXA57Z1Q/B8o7cHD2utyTn8p9P1cTyuxojCW+fLFhUkiB+pdW3L5zUU3aJ2
i+w0ux06HJ7Yh4mu9fsCq4Kbv1Aw1tmqfad6nAKufvRUUghWnjOw6XP6OEDJ0rJW
BwZrGeAfBcB3Krb/CmFlNvHaQjv1qPpVgMsyXJmQsgq9wdHgk4pnApORuAakUVGJ
6yRyiMR6gSbR+SONiC0j0wGZazOsCV4UYqV3ayLpZyiIlKQNgX7SktLuvkFOjFmu
vmee22nhxqp5rR8l097g2aeHF8r1T8mG0saHT4rbtaM/ZJpbBy+DOdSQULzwgCZQ
eSX0K15mr7iwWLupxuqdeXWwZNhqsZcDYPxwApZXDoPiYN/J38mHWCUruRidH9Oy
eFMe0lta0NHcZL8VDijxlNiC2KfHRaTlHn/mhqulvEHNF6Tv6md9Qt+DHJE3iFqi
TJspYFjogMXU778TJ4nE5I3x3H9cE4XrZE7EZKS7NBypOh9BTEcr4t25U1vQL+Ba
mA5P8stqaSN1D0JXjXoGrw6HClGvzA/TQI3FelOn3ffbd/30+LyX5T2XWmn7aAvN
qmplf7cw0FUYOH68kkx7
=W/4F
-----END PGP SIGNATURE-----

--zk7MNm5p1Zc4RXS/--
