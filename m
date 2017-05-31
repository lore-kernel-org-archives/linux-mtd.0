Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dGBXb-0002H7-HP
 for linux-mtd@lists.infradead.org; Wed, 31 May 2017 21:52:33 +0000
From: Darwin Dingel <Darwin.Dingel@alliedtelesis.co.nz>
To: Pavel Machek <pavel@ucw.cz>
CC: Boris Brezillon <boris.brezillon@free-electrons.com>, "richard@nod.at"
 <richard@nod.at>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "cyrille.pitchen@atmel.com"
 <cyrille.pitchen@atmel.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "mark.marshall@omicronenergy.com"
 <mark.marshall@omicronenergy.com>, "b44839@freescale.com"
 <b44839@freescale.com>, "prabhakar@freescale.com" <prabhakar@freescale.com>
Subject: Re: mtd: nand: fsl_ifc: fix handing of bit flips in erased pages
Date: Wed, 31 May 2017 21:52:03 +0000
Message-ID: <95d9297bf6604c1f8fe9c36a231b8a06@svr-chch-ex1.atlnz.lc>
References: <5f665145ea304d3a9e1ecb39c51a951e@svr-chch-ex1.atlnz.lc>
 <20170531204913.GC16962@amd>
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

Hi,=0A=
=0A=
On 01/06/17 08:59, Pavel Machek wrote:=0A=
=0A=
> =0A=
> You meen "errors =3D 0"? Does that actually make a difference? It is a=0A=
> local variable, and continue makes sure the value is not used:=0A=
> =0A=
=0A=
I missed the 'continue' statement there. In that case we don't need to =0A=
reset 'error'.=0A=
=0A=
=0A=
=0A=
=0A=
Cheers,=0A=
Darwin=0A=
