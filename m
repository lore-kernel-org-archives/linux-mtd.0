Received: from mezzanine.sirena.org.uk ([2400:8900::f03c:91ff:fedb:4f4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0pSn-0008LI-4V
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 11:39:17 +0000
Date: Mon, 23 Nov 2015 11:38:46 +0000
From: Mark Brown <broonie@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>, Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Message-ID: <20151123113846.GH1929@sirena.org.uk>
References: <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
 <5650F7D4.1090209@gmail.com> <20151122131626.GN26072@sirena.org.uk>
 <5651EA08.5090400@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6lXr1rPCNTf1w0X8"
Content-Disposition: inline
In-Reply-To: <5651EA08.5090400@gmail.com>
Subject: Re: [PATCH 1/3] spi: core: add max_msg_size to spi_master
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--6lXr1rPCNTf1w0X8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Nov 22, 2015 at 05:15:04PM +0100, Heiner Kallweit wrote:
> Am 22.11.2015 um 14:16 schrieb Mark Brown:

> To avoid misunderstandings:
> For fsl-espi the length of a SPI transfer has to be programmed (max 64K)
> and after this number of bytes has been transferred CS is deselected
> internally. There's no way to control CS directly.
> Do you consider this a message or transfer size limit?
> To me this seems to be exactly what you describe as "devices that aren't
> able to deal with multiple transfers independently".

Well, possibly.  What happens with a very large proportion of SPI
controllers is that we just ignore the /CS functionality of the
controller and use a GPIO instead, most SoC integrations also support
GPIO on the same pin and there's rarely any advantage in trying to use
the integrated support.

> > For slightly more complex things like this it probably also makes sense
> > to use an accessor - I can see us wanting to combine restrictions from
> > DMA engines into restrictions for the SPI controller for example.  That
> > gives us a bit of insulation between the clients and the API.

> When you talk about accessors do you think of hooks in spi_master so that
> each controller driver can provide its own implementation of e.g.
> something like get_max_msg_size()?

No, for the clients so they aren't peering at the struct.

--6lXr1rPCNTf1w0X8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWUvrFAAoJECTWi3JdVIfQzQoH/RmUJesIO0zI4HU9k2KczbE4
LNCBUIKCQy833GRIp8ZJFIGMZVE88j47XpG6oYLzW/AbXxTdpmc3eqDCOJzdkrF5
TMNbTugGaIMu07zYWxTkifUjebtniBna3gycW0H4L8Pgty0X56JYZ9tIF5983XwW
9ALvncRg/RxO2WeKHMIbc1rFULvtA2VzKDYg1Q0kAC0ZdnKg4pkfNwtqgvZzgmfE
akktHVMtLT/jCi1P/8yVLRHDrdtkaAc/hIdUv2SKYCTHFXGchBv+uZZsL3OH7r+H
wikEd9nbg4p8905Z5zzx8TC5lMcPA7y4igAQpKjVTXZlAIHyCZoDAtFRZTQoeBQ=
=VgOy
-----END PGP SIGNATURE-----

--6lXr1rPCNTf1w0X8--
