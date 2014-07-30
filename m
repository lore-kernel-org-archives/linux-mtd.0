Date: Wed, 30 Jul 2014 11:46:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <20140730104607.GQ17528@sirena.org.uk>
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
 <1398657227-20721-4-git-send-email-b32955@freescale.com>
 <20140730050843.GE11952@brian-ubuntu>
 <20140730064413.GA15547@shldeISGChi005.sh.intel.com>
 <20140730074500.GF11952@brian-ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="HYygyrmJsD3lYHfd"
Content-Disposition: inline
In-Reply-To: <20140730074500.GF11952@brian-ubuntu>
Subject: Re: [PATCH v2 03/10] mtd: spi-nor: add DDR quad read support
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, Huang Shijie <shijie.huang@intel.com>,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--HYygyrmJsD3lYHfd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 30, 2014 at 12:45:00AM -0700, Brian Norris wrote:
> On Wed, Jul 30, 2014 at 02:44:13PM +0800, Huang Shijie wrote:
> > On Tue, Jul 29, 2014 at 10:08:43PM -0700, Brian Norris wrote:
> > > On Mon, Apr 28, 2014 at 11:53:40AM +0800, Huang Shijie wrote:
> > > > This patch adds the DDR quad read support by the following:

> > > Are DDR modes in the scope of drivers/spi/ at all, so that we could
> > > someday wire it up through m25p80.c? Or is 'DDR' such a distortion of
> > > the meaning of 'SPI' such that it will be restricted only to SPI NOR
> > > dedicated controllers?

> > IMHO, the DDR modes can _NOT_ be handled by the driver/spi/*.

> I agree to some extent, but I wanted to confirm with the SPI guys that
> DDR is truly unique to SPI NOR. (I know it doesn't currently support
> it.)

I don't know what DDR is in this context, sorry.  I'm guessing you're
right since it sounds like something to do with extra clocks and this is
probably not something used by generic SPI devices at present (if it
ends up being widely implemented by sufficiently generic controllers
that might change but the trend seems to be to flash specific
controllers).

--HYygyrmJsD3lYHfd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT2MzsAAoJELSic+t+oim9zC8P/iMTrgOuOTCEaOdbapoLtDLh
L9b5ThghYHU71m3dH4lXXIRAiorrvovipM9lHalh9z9nC4dw78AWAZE9P1lPzlGi
Ycj125A2ptBY6ZI3h+ntQlfmE6Z7bVoziLh3OgxQqAStfv+Pt+IgkqsCXl0hCBix
/PfFzJoGM3KNNvS7MuUBpCQ11xbKybL1TEpjQiUcCaK0PIm49XeYTmFn8JpxdV5i
L6kJfD4RGcGKuEh9UvQPHcavAiQpq0hZnGioVbJ+XWfLiWVOpmOc/82Os+tUO35n
KZe8hT0OijI3M5mxqwaVXQqUU5rBLkA1d93aX86aZJ6E7yUm/Q4Kd5rltOuI/wrD
iSFmAkfrMc6XhBqeNl/fHhhh4txrobmxNr27jDgkdNBcuR8VXJhTnzjbUwRrTNJV
WrgGWgNdBQ7YMcQQqszr5ePyX6Dw3mc5vQf1mBK9/1ETZufYVJTmKveYieU24bxf
J8R1uaJyrKpZAIXw66uRDXJqWhwoqunYfgYIxxtwVw7fzw4RLzLlcKsjlaqDUdHs
iYLq8s4WFYM+bZGxcQJX+BesgOHKTKV3gGPYsuLrFSqEdUxSxD36en4V1H4q/CfR
zF3Zr6aPHHiINxVhagU4pYPWYZsn8iSGC/5kr8vCHMFRKJswv5mM9y3lsSSzbCOy
XLDTgtOyQeC8BpD3DsFV
=K622
-----END PGP SIGNATURE-----

--HYygyrmJsD3lYHfd--
