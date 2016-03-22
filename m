Date: Tue, 22 Mar 2016 10:06:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Lakshmi Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc: Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "Andrew F. Davis" <afd@ti.com>, Marek Vasut <marex@denx.de>,
 Jagan Teki <jteki@openedev.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
 Anirudha Sarangi <anirudh@xilinx.com>
Message-ID: <20160322100615.GA2566@sirena.org.uk>
References: <1458562809-36114-1-git-send-email-lakshmis@xilinx.com>
 <20160321130734.GS2566@sirena.org.uk>
 <4FF8F58FAA9D5D4193D4E554E4352C5902C6D34C@XAP-PVEXMBX02.xlnx.xilinx.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wkv87tf6M42+4Jbu"
Content-Disposition: inline
In-Reply-To: <4FF8F58FAA9D5D4193D4E554E4352C5902C6D34C@XAP-PVEXMBX02.xlnx.xilinx.com>
Subject: Re: [LINUX PATCH 1/2] mtd: Added dummy entry in the spi_transfer
 structure.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Wkv87tf6M42+4Jbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 22, 2016 at 06:39:51AM +0000, Lakshmi Sai Krishna Potthuri wrote:

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.  Please also avoid reflowing other text
into longer lengths, this makes things worse.

> >This isn't enough to add the feature - a client driver trying to make use of this
> >needs to be able to tell if the cycles are actually going to be inserted.  I'd
> >expect to see a capability flag that can be checked and some error checking so
> >that if we try to do a transfer with dummy cycles and can't support it we don't
> >silently ignore the dummy cycles, ideally also something that'll handle
> >multiples of 8 bits with SPI controllers that don't otherwise support this
> >feature.

> Currently, all fast reads use 8 cycles or 1 byte of dummy. This generally works.
> But it can be vary based on the flash and the type of read command.
> Dummy bytes are taken care of in m25p80.c by adjusting the len field:
> Length = size of (command + address + dummy byte)

> There might be controllers (like ZynqMP GQSPI) that would be able to use
> the information that dummy byte(s) were added and the precise number
> of dummy cycles. This patch does not disturb the existing implementation
> of adjusting length (as described above). It adds an additional optional feature.
> So there is no harm to controllers that can't support it - they can ignore it and
> still work with the existing "length adjustment" implementation.
> If you think there value in adding a capability flag, please let me know.

This is really not what I'd expect to happen, I'd expect that these
dummy cycles would be in addition to the actual data (see my request for
better documentation...).  If they overlap with the data then what is
the point in specifying this?  It's more work for the host, what benefit
do we get from doing it over just handing it like a normal byte?

--Wkv87tf6M42+4Jbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW8RkVAAoJECTWi3JdVIfQ9GoH/3Jas4s88xTpk1aqYIJuu9AJ
gQa8TtCN+IDg5aI+CKHOOzbxRc2STOecnpj3R5nQDj5pnZYM1v9FaJtfaOWm9u2G
PKcdAb+yzpGY7zEvSe1oKRPmSLsp7cvi6GBkRLWgGtMdpGbPE4Te/25eKGMv1soX
QnkSgbFL07yJEH+6twJMb1EWyZOZXDGBT1cyD04JHxHyPbv/2xow21yQ3F2jtEmY
sFMDrN80qlBPIWiGgfZrOd+RBEz9hVtztOFWJIMBffq1oIFpfwTjCjZbAaZi7W6c
4UpvQETxw8bwxGNdysHaYgd0Ca1SX4LgcyACa6u1QOr2MCFT+DlqBvKhCnaPty4=
=NF3t
-----END PGP SIGNATURE-----

--Wkv87tf6M42+4Jbu--
