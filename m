From: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh@kernel.org"
 <robh@kernel.org>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, Poonam Aggrwal
 <poonam.aggrwal@nxp.com>, Leo Li <leoyang.li@nxp.com>, "oss@buserror.net"
 <oss@buserror.net>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/2][v7] dt-bindings: mtd-physmap: Add endianness supports
Date: Wed, 28 Mar 2018 09:48:08 +0000
Message-ID: <VI1PR0402MB3854A5A7E389D80CCEF0197997A30@VI1PR0402MB3854.eurprd04.prod.outlook.com>
References: <20180328054443.2829-1-prabhakar.kushwaha@nxp.com>
 <20180328103001.6f4b16d9@bbrezillon>
In-Reply-To: <20180328103001.6f4b16d9@bbrezillon>
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

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Wednesday, March 28, 2018 2:00 PM
> To: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>
> Cc: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org;
> mark.rutland@arm.com; robh@kernel.org; boris.brezillon@free-electrons.com=
;
> Poonam Aggrwal <poonam.aggrwal@nxp.com>; Leo Li <leoyang.li@nxp.com>;
> oss@buserror.net; computersforpeace@gmail.com; shawnguo@kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH 1/2][v7] dt-bindings: mtd-physmap: Add endianness
> supports
>=20
> On Wed, 28 Mar 2018 11:14:43 +0530
> Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com> wrote:
>=20
> > Connection between flash and controller is not necessary to be always
> > of same type. It may varies from platform to platform.
> >
> > Adding endianness (optional) property to provide connection type
> > information.
>=20
> You forgot to adjust your commit message.
>=20
> If you're okay, I'll replace your message by:
>=20
> "
> Provides a way to specify the endianness to use when accessing a memory-
> mapped flash.
> "
>=20

Thanks for catching this. Please adjust as you suggested.

--prabhakar
