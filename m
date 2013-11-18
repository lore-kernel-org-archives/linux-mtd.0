Date: Mon, 18 Nov 2013 14:45:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20131118144512.GB24408@sirena.org.uk>
References: <1384438956-31153-1-git-send-email-lee.jones@linaro.org>
 <1384438956-31153-3-git-send-email-lee.jones@linaro.org>
 <CACRpkdaccxcTfKc-y7rPEH1H3yua3ubLvuvTzWnMs1rOwjiVNw@mail.gmail.com>
 <20131118093229.GB13640@lee--X1>
 <20131118133940.GC14306@sirena.org.uk>
 <20131118142447.GJ13640@lee--X1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Content-Disposition: inline
In-Reply-To: <20131118142447.GJ13640@lee--X1>
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


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 02:24:47PM +0000, Lee Jones wrote:

> For example, we have thought about inserting a layer which handles the
> type of communication that'll be utilised i.e. true SPI, or our
> bespoke FSM implementation for instance. This would enable us to issue
> serial_flash_write(), serial_flash_write_then_read(), ... in the m25p80
> driver and not care which protocol is used. However, in reality this
> won't really save a great deal of code - not in our case at least.

Right, that's what I'm suggesting.  It's not so much for the code saving
as for the data saving, allowing device trees that just say "flash chip
X is connected" rather than requiring either the flash chip information
in multiple places in the kernel or (worse) have the commands added to
the DTs of individual boards using the flash chip.

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSiif1AAoJELSic+t+oim9rDoQAIbAbsNKHx14dyb/T2i2LVrs
eQ1b9mFwUmWmUcg4I0S5NTdcO5SEcrTZ+kLArFWeDQbEj6WFhjJJ2dTc3KGkOOjT
5wcIRoh3xGUQWpGlqxi6vvyNiemA24TyRSPQzYyNhZkwT0cJky31Tmrku/ile4jT
eOpC1op4lkTCp+EqkkYUaFgq0xLODRLVLq8FL9VU5826HDfBVKkMaH3V6olzH7he
1wIBm7idgpMigfRlCDhnS9AyOJPkLVRakegjrXjef2miI1rOwNOxF4xp3FxJRF8B
f+Z9rVENkcKu/4K7ZFLXYeGd1eJLeJ4tzNhyCOQkaXZza2eYcK9P2ZmAuZfrY+N3
YIlg7ovPrjBLtZsmLtP8KySTc/Lf84dTJgvrBx6v8497tG1Hq+k1VPwfz3jZsHkP
srouLcmPBbCnxILC5dWhqxl7BhdYAJHIdxPG5tXVhSJ5LbAu44eIQMeHWg8qnz7l
sumpaTh1gZ8Z1L4B4XnylU0bm+GRYwCbk98lwDxyZ6RpUSscmdsGPFYMzQHDI8TL
e3yweENhcdFZkXVKK2mK5HxIwnX+3XHlDaUjVP+yVLnuHWvE/eVfJm4j+sYGFyJq
nUpNzLugcbdVbeuX2ARIDpraxvWCxeWi8rkYoVLP2hKWWWBG7S+wx5SDEyap6q6t
MW/RNylYArb41VKY0HdG
=v5D8
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
