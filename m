Received: from mail-bn1blp0190.outbound.protection.outlook.com
 ([207.46.163.190] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlCv8-0006QA-1C
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 07:51:10 +0000
From: "Mingkai.Hu@freescale.com" <Mingkai.Hu@freescale.com>
To: Mark Brown <broonie@kernel.org>
Subject: RE: Support of Micron SPI flash (size > 16MB)
Date: Fri, 16 May 2014 07:50:46 +0000
Message-ID: <73b4daa9267a4493b2f0bf85fa71ea3d@BY2PR03MB508.namprd03.prod.outlook.com>
References: <92977332ffca4669b5c1987b42b0d0c5@BY2PR03MB508.namprd03.prod.outlook.com>
 <20140509104404.GK12304@sirena.org.uk>
In-Reply-To: <20140509104404.GK12304@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "vivien.didelot@savoirfairelinux.com"
 <vivien.didelot@savoirfairelinux.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Mark Brown [mailto:broonie@kernel.org]
> Sent: Friday, May 09, 2014 6:44 PM
> To: Hu Mingkai-B21284
> Cc: linux-spi@vger.kernel.org; linux-mtd@lists.infradead.org;
> dwmw2@infradead.org; vivien.didelot@savoirfairelinux.com
> Subject: Re: Support of Micron SPI flash (size > 16MB)
>=20
> On Fri, May 09, 2014 at 10:25:04AM +0000, Mingkai.Hu@freescale.com wrote:
>=20
> > 2.       What are the changes needed for SPI controller to support 4
> byte addressing?
>=20
> If the SPI controller is a genuine SPI controller and not something
> specially optimised for flash it shouldn't need any changes, it doesn't
> know anything about the data it's sending.  The SPI flash code might need
> updating though, I don't know about that.

Thanks for your info.
Mingkai
