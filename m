Date: Mon, 18 Nov 2013 17:22:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20131118172243.GO2674@sirena.org.uk>
References: <CACRpkdaccxcTfKc-y7rPEH1H3yua3ubLvuvTzWnMs1rOwjiVNw@mail.gmail.com>
 <20131118093229.GB13640@lee--X1>
 <20131118133940.GC14306@sirena.org.uk>
 <20131118142447.GJ13640@lee--X1>
 <20131118144512.GB24408@sirena.org.uk>
 <20131118145614.GM13640@lee--X1>
 <20131118151651.GE24408@sirena.org.uk>
 <20131118153110.GN13640@lee--X1>
 <20131118154137.GA28334@sirena.org.uk>
 <20131118160226.GO13640@lee--X1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="nljfjKcp9HDtPSOP"
Content-Disposition: inline
In-Reply-To: <20131118160226.GO13640@lee--X1>
Subject: Re: [PATCH 02/10] mtd: st_spi_fsm: Supply all register address and
 bit logic defines
Cc: angus.clark@st.com, Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--nljfjKcp9HDtPSOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 04:02:26PM +0000, Lee Jones wrote:
> On Mon, 18 Nov 2013, Mark Brown wrote:

> > Like I say I'm suggesting that the bit of the code that understands the
> > flash chip is separate to the bit of code that knows the mechanics of
> > sending commands and data to the chip.

> The issue is that almost the entire driver is controller side. The
> only bits that are the same (and not in all cases) are the OPCODEs,
> but they are one liners (21 lines out of 1153). Most of the
> controllers which use this stuff could reuse quite a bit of the m25p80
> driver as they just write the message containing the OPCODE as the
> m25p80 driver sets it up, but that's simply not the case with our
> controller. We would have to pull the OPCODE out and based on which
> one it is, we'd have to build our own message.

OK, so then perhaps the abstraction here is simply to export the table
with the opcodes from the m25p80 driver so that when someone comes along
and adds a new chip they can just add it there and other drivers will
get the update too.

> Put it this way, if we tried to use the m25p80 our controller driver
> would most likely be twice as large and twice as complex as it is
> currently, which is exactly the inverse of what we're trying to
> achieve here.

If we're having to add new flashes to multiple drivers I'd not say we're
winning.

--nljfjKcp9HDtPSOP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSikzaAAoJELSic+t+oim9MHQQAIKTAC+9uYGgq+OdTnA1Kle5
CpNtaPgXA9yZk4SEygySrZVPpf4S/bkelGq5gzRcoF6pe62+AFxtJa5aZ420Tz8z
F6mQQUY48I6i5JwtuFW8hO0qG65aFfMLJPqdYpMDTo0hZ+6fXsjvx/WZKwJNAjlw
mRTmYa1MpcJGIMZMiDBmrKYBWE5lgWRZpbFIBteTMcPpo+lAFQ3ozvGefclKysyP
+PvjchIRNUdBUzVyRfsmc5rtmthjykLO5qiGFeXakY2mWlL3jUolvimVJB6x2s0h
3wmGy3TODZovIyq+vmkpZ+wWQ0oM90Z9Ll2OfV1JYY8IIwU+cFHGtxlXnqtywDh6
F1Gu5iDCmjqTEPmZ2FrmA4K2anSwNRWTfTFZH+9mXreGMAAWyFhm7UyNwpL8EwYv
Ig1Warpc3Q6J2Fqc6TKsM/NQXTCWHDbhhNS0rFIj4tLzflHLXfE8icAvNN99uQpK
glqVwRSLhyVSqWtPejZgEJ0TYauv7JNYb0TGT98O9ZAVdHhm5OXNxUVSBdLX7YXA
BO1X85G6Re56orJVuJBdYlG2y4TOsNzCADkUevDJ6nGubUhrAHDzBQYXLKpK16Jf
OqGANWC0zCPozl1Ensj5v1jIJZqq1C/oZNYhuB8eYD4ODDouBGQmVS27x6DOerid
9n2+ojhGv8/TUcXhoqZY
=nafG
-----END PGP SIGNATURE-----

--nljfjKcp9HDtPSOP--
