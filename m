Date: Fri, 12 Feb 2016 22:37:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Vignesh R <vigneshr@ti.com>
Cc: Tony Lindgren <tony@atomide.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Russell King <linux@arm.linux.org.uk>, hramrach@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Message-ID: <20160212223711.GD18988@sirena.org.uk>
References: <1449807000-6457-1-git-send-email-vigneshr@ti.com>
 <1449807000-6457-4-git-send-email-vigneshr@ti.com>
 <20160209193616.GN13270@sirena.org.uk> <56BC1D3E.5020203@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline
In-Reply-To: <56BC1D3E.5020203@ti.com>
Subject: Re: [PATCH v5 3/5] mtd: devices: m25p80: add support for mmap read
 request
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 11, 2016 at 11:03:50AM +0530, Vignesh R wrote:
> On 02/10/2016 01:06 AM, Mark Brown wrote:
> > On Fri, Dec 11, 2015 at 09:39:58AM +0530, Vignesh R wrote:

> >> +	if (spi_flash_read_supported(spi)) {
> >> +		struct spi_flash_read_message msg;
> >> +		int ret;

> > Looking at this I can't help but think that spi_flash_read() ought to
> > have the stub in rather than the caller.  But given that we're pretty
> > much only ever expecting one user I'm not 100% sure it actually matters.

> Well, my initial patch set passed long list of arguments to
> spi_flash_read(), but Brian suggested to use struct[1] in order to avoid
> unnecessary churn when things need changed in the API.

I don't see what that has to do with my point?

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWvl6UAAoJECTWi3JdVIfQblMH/RvNAztMXHLsEFRW0U1bdB63
ImbcXa/jiHyGzMjlgdMzlJgYnVQ0KmX0PRVIDzbhHrIcLl0mqpNKENLU/IIgEDCw
6uOKcEGGBRYqdT0GIHvHOwlf5Pmdm79FTz7Y/qcL7KwZfWtBAjk4OR/oMHgcMJYC
fGLMpR+cpgdm7i/KCEXTZiFLahkQELonVKjyAE7vjxdjt7kUwA6r67LsOrNPbuEn
aYxSgu2btiJzCXWsFRTv+9i/YzbzmTiVt2EB54gDgF8yMDW5pncbEZfm/iigUMRM
jBngWvjoiVHatdGFtacqwXpU/Ad4ZutSaQ6+p64UIgzacVv1pTbkNmBo8+9eebo=
=L0w+
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
