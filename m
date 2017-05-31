Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGCam-00030l-Q9
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 22:59:54 +0000
From: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>
To: Pavel Machek <pavel@ucw.cz>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
CC: "richard@nod.at" <richard@nod.at>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "cyrille.pitchen@atmel.com"
 <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mark.marshall@omicronenergy.com"
 <mark.marshall@omicronenergy.com>, "b44839@freescale.com"
 <b44839@freescale.com>, "prabhakar@freescale.com" <prabhakar@freescale.com>
Subject: Re: [PATCHv2] mtd: nand: fsl_ifc: fix handing of bit flips in erased
 pages
Date: Wed, 31 May 2017 22:59:24 +0000
Message-ID: <8c35c069ba6f42a79b2c11338c2a4f80@svr-chch-ex1.atlnz.lc>
References: <20170419231804.5a04ed69@bbrezillon> <20170419221507.GA24914@amd>
 <20170420002748.5c76c9b9@bbrezillon> <20170420114057.GA4705@amd>
 <20170421105107.GA7259@amd> <20170517122224.GB583@amd>
 <20170517143211.205ff5de@bbrezillon> <20170517130059.GA3437@amd>
 <20170517152548.6d52c41b@bbrezillon> <20170517200305.GA12537@amd>
 <20170531205917.GA21878@amd>
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

=0A=
On 01/06/17 08:59, Pavel Machek wrote:=0A=
> If we see unrecoverable ECC error, we need to count number of bitflips=0A=
> from all-ones and report correctable/uncorrectable according to=0A=
> that. Otherwise we report ECC failed on erased flash with single bit erro=
r.=0A=
> =0A=
> Signed-off-by: Pavel Machek <pavel@denx.de>=0A=
> Reported-by: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>=0A=
> =0A=
=0A=
Acked-by: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>=0A=
=0A=
=0A=
Cheers,=0A=
Darwin=0A=
