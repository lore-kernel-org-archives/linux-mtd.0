Received: from mail-bn1on0075.outbound.protection.outlook.com ([157.56.110.75]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YlRlj-0004qF-O0
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2015 00:47:00 +0000
From: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>
To: Josh Cartwright <joshc@ni.com>
Subject: RE: [PATCH v6 1/2] Devicetree: Add pl353 smc controller devicetree
 binding information
Date: Fri, 24 Apr 2015 00:46:21 +0000
References: <1428941512-26411-1-git-send-email-punnaia@xilinx.com>
 <e3a73fa0-9159-4fbe-b042-4737dc9b041f@BN1BFFO11FD010.protection.gbl>
 <20150423195043.GS27115@jcartwri.amer.corp.natinst.com>
In-Reply-To: <20150423195043.GS27115@jcartwri.amer.corp.natinst.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Message-ID: <d4e01acf-28c1-466f-a796-12f7ea339507@BN1AFFO11FD028.protection.gbl>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "arnd@arndb.de" <arnd@arndb.de>, Michal Simek <michals@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "grant.likely@linaro.org" <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "joern@logfs.org" <joern@logfs.org>, "kpc528@gmail.com" <kpc528@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "acourbot@nvidia.com" <acourbot@nvidia.com>,
 "kalluripunnaiahchoudary@gmail.com" <kalluripunnaiahchoudary@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rob@landley.net" <rob@landley.net>,
 "galak@codeaurora.org" <galak@codeaurora.org>,
 "ivan.khoronzhuk@ti.com" <ivan.khoronzhuk@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

> -----Original Message-----
> From: Josh Cartwright [mailto:joshc@ni.com]
> Sent: Friday, April 24, 2015 1:21 AM
> To: Punnaiah Choudary Kalluri
> Cc: robh+dt@kernel.org; pawel.moll@arm.com; mark.rutland@arm.com;
> ijc+devicetree@hellion.org.uk; galak@codeaurora.org; rob@landley.net;
> Michal Simek; grant.likely@linaro.org; gregkh@linuxfoundation.org;
> jason@lakedaemon.net; ezequiel.garcia@free-electrons.com;
> arnd@arndb.de; dwmw2@infradead.org; computersforpeace@gmail.com;
> artem.bityutskiy@linux.intel.com; jussi.kivilinna@iki.fi;
> acourbot@nvidia.com; ivan.khoronzhuk@ti.com; joern@logfs.org;
> devicetree@vger.kernel.org; linux-doc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-mtd@lists.infradead.org; kpc528@gmail.com;
> kalluripunnaiahchoudary@gmail.com; Punnaiah Choudary Kalluri
> Subject: Re: [PATCH v6 1/2] Devicetree: Add pl353 smc controller devicetr=
ee
> binding information
>=20
> Hey Punnaiah-
>=20
> A few nitpicks here, in case you'll be spinning up a new version of your
> patchset.
>=20
> On Mon, Apr 13, 2015 at 09:41:51PM +0530, Punnaiah Choudary Kalluri wrote=
:
> > Add pl353 static memory controller devicetree binding information.
> >
> > Signed-off-by: Punnaiah Choudary Kalluri <punnaia@xilinx.com>
> [..]
> > @@ -0,0 +1,37 @@
> > +Device tree bindings for ARM PL353 static memory controller
> > +
> > +PL353 static memory controller supports two kinds of memory
> > +interfaces. i.e NAND and SRAM/NOR interfaces.
> > +The actual devices are instantiated from the child nodes of pl353 smc
> node.
> > +
> > +Required properties:
> > +- compatible		: Should be "arm,pl353-smc-r2p1"
> > +- reg			: Controller registers map and length.
> > +- clock-names		: List of input clock names - "memclk", "aclk"
> > +			  (See clock bindings for details).
> > +- clocks		: Clock phandles (see clock bindings for details).
>=20
> Technically not clock phandles, but clock specifiers.
>=20
> > +- address-cells	: Address cells, must be 1.
> > +- size-cells		: Size cells. Must be 1.
>=20
> These should have the leading '#' as in '#address-cells' and
> '#size-cells'.

Thanks for the review. I will take care of them new version

Regards,
Punnaiah
>=20
>   Josh
