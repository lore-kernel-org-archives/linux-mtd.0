Received: from mail-he1eur01on070c.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::70c]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGABF-0005Ka-8x
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 21:29:55 +0000
From: "Wan, Jane (Nokia - US/Sunnyvale)" <jane.wan@nokia.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: "Boris.Brezillon@bootlin.com" <Boris.Brezillon@bootlin.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "prabhakar.kushwaha@nxp.com" <prabhakar.kushwaha@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jagdish.gediya@nxp.com"
 <jagdish.gediya@nxp.com>, "shreeya.patel23498@gmail.com"
 <shreeya.patel23498@gmail.com>, "Bos, Ties (Nokia - US/Sunnyvale)"
 <ties.bos@nokia.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] mtd: rawnand: fsl_ifc: use bit-wise majority to
 recover the contents of ONFI parameter
Date: Tue, 8 May 2018 21:29:38 +0000
Message-ID: <VI1PR07MB161510CAD11811A897BBB328819A0@VI1PR07MB1615.eurprd07.prod.outlook.com>
References: <1525710855-8159-1-git-send-email-Jane.Wan@nokia.com>
 <20180508151309.40a78259@windsurf.home>
In-Reply-To: <20180508151309.40a78259@windsurf.home>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

I've sent v4 of the patches based on the comments.

Thank you.
Jane

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni@bootlin.com]
> Sent: Tuesday, May 08, 2018 6:13 AM
> To: Wan, Jane (Nokia - US/Sunnyvale) <jane.wan@nokia.com>
> Cc: Boris.Brezillon@bootlin.com; miquel.raynal@bootlin.com;
> dwmw2@infradead.org; computersforpeace@gmail.com; richard@nod.at;
> marek.vasut@gmail.com; yamada.masahiro@socionext.com;
> prabhakar.kushwaha@nxp.com; shawnguo@kernel.org;
> jagdish.gediya@nxp.com; shreeya.patel23498@gmail.com; Bos, Ties (Nokia -
> US/Sunnyvale) <ties.bos@nokia.com>; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v3 2/2] mtd: rawnand: fsl_ifc: use bit-wise majority =
to
> recover the contents of ONFI parameter
>=20
> Hello,
>=20
> On Mon,  7 May 2018 09:34:15 -0700, Jane Wan wrote:
> > Per ONFI specification (Rev. 4.0), if all parameter pages have invalid
> > CRC values, the bit-wise majority may be used to recover the contents
> > of the parameter pages from the parameter page copies present.
> >
> > Signed-off-by: Jane Wan <Jane.Wan@nokia.com>
>=20
> Minor nit: the commit title contains "fsl_ifc", but this commit doesn't c=
hange
> anything in the fsl_ifc driver, it fixes the NAND core.

[Jane] Removed the "fsl_ifc" from the subject in v4.

>=20
> Best regards,
>=20
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons) Embedded Linux a=
nd
> Kernel engineering https://bootlin.com
