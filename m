Date: Mon, 18 Nov 2013 13:39:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20131118133940.GC14306@sirena.org.uk>
References: <1384438956-31153-1-git-send-email-lee.jones@linaro.org>
 <1384438956-31153-3-git-send-email-lee.jones@linaro.org>
 <CACRpkdaccxcTfKc-y7rPEH1H3yua3ubLvuvTzWnMs1rOwjiVNw@mail.gmail.com>
 <20131118093229.GB13640@lee--X1>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
Content-Disposition: inline
In-Reply-To: <20131118093229.GB13640@lee--X1>
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


--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 18, 2013 at 09:32:29AM +0000, Lee Jones wrote:

> I've actually travelled down the route of separating the SPI
> Controller parts to drivers/spi. It's possible to do that and perhaps
> we could then use the generic m25p80 Serial Flash driver as the
> back-end, but it would be incredibly complicated and would mean we'd
> need to duplicate almost all of the m25p80 driver into the SPI
> Controller. The Falcon SPI driver tried to do something similar, but
> now looks broken due to some incompatible changes in m25p80. We also
> want to avoid putting ourselves in that position of fragility.

What I've said to people doing similar drivers before is that it seems
like there should be an abstraction added in the MTD framework for SPI
flash controllers like this is that if there is genunie flash-specific
stuff going on then the mp25p80 driver ought to be split so that the
code that understands what commands to send to the flash chip is split
out from the code that actually sends those commands to the chip.  The
existing SPI support would then be a function driver for this.  This
would mean we don't need to support the flash chips multiple times.

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSihiZAAoJELSic+t+oim9qXAP/28ryPQBl9sntEpKMV7fFUkd
gHr6MO8ZUNfgrAe3zes0BoV4wSNQ93ZiMviYSk+Wbj+wzE5U5vCr1YsgLp0HjI5R
pBbeQ1BOKF0qV1L56PqVhiBafOk705g1dNpACvxEfo6pdxt5WnOSbwvhsZp/+pIK
vMPGrmHq4UJ1zP92Behx7HFwBeq736JsUAq9CVw3+jsJCFFRYcS+DYMQa0sPAQkc
VtJd28huOojkKQPss2EAeG/VRK4t+tD3Ti15Y4JyLCNn+TG9xkR6d/oA7rGCzO+l
zi4+4djgsg7pWDuBNYbrcKjMQhyPvAf2AogTtCZat9FsTGbymNnthHP4T/EcPe1j
rmPC1D7uIr14xUr+GJUpCrLqdUOANea2yXqZe4wjrfxCUT0+r+1SWsknjZ0q45CT
k5vfqOremLsgLJX01Dti2MbIkb7bjrbYfOtrAn2N53uVZmswxtn/wUmPR/RtAEuo
qZ0UZm0EL3zQ5Yypsl9qY6/dehAWWSCnqCu1f2vqJL5gSPHU7U84HHxTBhHy/6ho
7HFpm0gNIX+gO5IBYx/P1aQfaFnPSF/zLt7PmE/QHNzw9mfOQvTDglr4t3sz32Xo
U7FlLIbQlRg7Hc+P0n8AsRiqiQg51DNAZyYsWMSysop5YRWsFNf2LZRQYjDVYjUo
b4taxS9h8/0uijmXkt0K
=ka6A
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--
