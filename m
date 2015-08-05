Date: Wed, 5 Aug 2015 13:44:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Michal Suchanek <hramrach@gmail.com>
Cc: "R, Vignesh" <vigneshr@ti.com>, devicetree <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>, Huang Shijie <b32955@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Message-ID: <20150805124412.GN20873@sirena.org.uk>
References: <1438072876-16338-1-git-send-email-vigneshr@ti.com>
 <1438072876-16338-2-git-send-email-vigneshr@ti.com>
 <20150731181745.GM20873@sirena.org.uk> <55BEF4AF.5090704@ti.com>
 <20150804155148.GR20873@sirena.org.uk> <55C0FD98.1090107@ti.com>
 <20150805115013.GJ20873@sirena.org.uk>
 <CAOMqctQXwcHyiWBwtugSDSE_k65qrNfrwnhjQMDJkLoJMmGzUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rkfdwoJB1s8W8pdr"
Content-Disposition: inline
In-Reply-To: <CAOMqctQXwcHyiWBwtugSDSE_k65qrNfrwnhjQMDJkLoJMmGzUw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] spi: introduce flag for memory mapped read
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--rkfdwoJB1s8W8pdr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 05, 2015 at 02:40:01PM +0200, Michal Suchanek wrote:
> On 5 August 2015 at 13:50, Mark Brown <broonie@kernel.org> wrote:

> > As far as I can tell you want to set a per spi_message flag saying that
> > the message is a flash read command?  If that's what this is trying to
> > do then why do you need to set the flag at all?  If the message is in a
> > clearly defined format and it's more efficient to use this mmap mode
> > then surely the driver can just recognise that the format is approprate
> > and switch into mmap mode without being explicitly told - I'm not clear
> > what the flag adds here.

> ehm, the read command is just one byte.

> I don't think sending 03 or other random byte as the first byte of a
> SPI transfer can be used as reliable detection that we are talking to
> a SPI flash memory.

Why care - if something is physically in the same format as a flash read
command how would a device be able to tell that it wasn't actually a
flash read command?  The signals sent on the bus are going to be
identical anyway.

--rkfdwoJB1s8W8pdr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVwgUbAAoJECTWi3JdVIfQ2RkH/jYBCdjmJQXi3KiNfAXn72iu
2UAZttHkB9Imo8itr3CaepTmsxifFHEXrONVCMqL6cQLduJebkc/ocQMQH5nASxH
oCR9efPj4QlxKharz0w64sGn6zUd8PqAk+1nwmIzUoUfK5bUq0Jl2HizHo6kgMzK
WvNzRzkIBo7bp+RTO+LWWI+y71z8PsJJBNsQWuJHUzPVPgk+pj4Cj0glC2FGcdet
HHEAl74ZUZLdgoZQ+SGsnfHvg7t3BdmPtdbsOjbjDXIrMKi40txym/v4D9chtDrf
f4b/n5bCGWWXROWRNXWgZchQ/B1CAH/rmfSh81rVB0S64cf942AZCKRZ8xo5W6U=
=klpL
-----END PGP SIGNATURE-----

--rkfdwoJB1s8W8pdr--
