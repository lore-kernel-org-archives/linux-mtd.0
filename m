Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvjOr-0000Hy-Qf
 for linux-mtd@lists.infradead.org; Fri, 22 May 2015 09:37:54 +0000
Date: Fri, 22 May 2015 10:37:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Brian Norris <computersforpeace@gmail.com>
Message-ID: <20150522093714.GS21577@sirena.org.uk>
References: <cover.1430403750.git.hramrach@gmail.com>
 <50c40ef17ab6566f35ef5a4426bf23567f896db7.1430403750.git.hramrach@gmail.com>
 <20150520233835.GX11598@ld-irv-0074>
 <CAOMqctTYqDWL51twOuGi+oXONXQ4B2-2BkdJNSpzZAXshZUN6g@mail.gmail.com>
 <20150521102802.GS21577@sirena.org.uk>
 <20150522071727.GD23718@brian-ubuntu>
 <20150522072505.GE23718@brian-ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AQfDLMJ/cCCv3UHO"
Content-Disposition: inline
In-Reply-To: <20150522072505.GE23718@brian-ubuntu>
Subject: Re: [PATCH 2/3] MTD: spi-nor: check for short writes in spi_nor_write.
Cc: Marek Vasut <marex@denx.de>, Michal Suchanek <hramrach@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-mtd@lists.infradead.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alison Chaiken <alison_chaiken@mentor.com>,
 Bean Huo =?utf-8?B?6ZyN5paM5paMIChiZWFuaHVvKQ==?= <beanhuo@micron.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--AQfDLMJ/cCCv3UHO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 22, 2015 at 12:25:05AM -0700, Brian Norris wrote:
> On Fri, May 22, 2015 at 12:17:27AM -0700, Brian Norris wrote:

> > Admittedly, as he's using an out-of-tree driver, I'm not
> > sure I know exactly what failure modes he is hitting yet.

> Sorry, I realized I misread here. He's using spi-sunxi. Given that...

> ... is this code even valid?

> static int sun6i_spi_transfer_one(struct spi_master *master,
>                                   struct spi_device *spi,
>                                   struct spi_transfer *tfr)
> {
> ...
> 	/* We don't support transfer larger than the FIFO */
> 	if (tfr->len > SUN6I_FIFO_DEPTH)
> 		return -EINVAL;

> Seems like it should be looping over the transfer in multiple chunks
> instead.

Well, it's not ideal.  Like I say I think that logic probably belongs in
the core rather than individual drivers then we minimise the problems,
if I remember correctly there was the suggestion that the DMA code was
going to follow soon and be used for larger transfers when the original
driver was merged.

--AQfDLMJ/cCCv3UHO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVXvjJAAoJECTWi3JdVIfQaSMH/jcYW5zz4KoR209QACLlBE9R
dSf+j7WUOpAKX/fXyU7u/MwMISocZoS3+ymw1H368BAuuTfSoZp8qCeNsV1+6Dbv
sT1jgxE5+niNoKoU5arXoRdZVWqVrTLm2GlFRbwk3g4GZ3vrhXVQOsPZ5u6P73Qm
wn2slFx8CW1ytlk7uppXjDgrwJ0ri1kcNUZmqQOgOYNRYFaBUhuY5/i3QsLmuqEo
Onhymrjo7EnGDKdRchfXK0805Zq39+LbCkf1vvzoa1iFFaLS8gWUMERm3zKhIYF4
EWq7B+mvBZf3HfSQbRDMiBKjGJTJ2OFAVzPvqgu/EaYPrFwlYbuAjuKa5GVZaHY=
=Xb3c
-----END PGP SIGNATURE-----

--AQfDLMJ/cCCv3UHO--
