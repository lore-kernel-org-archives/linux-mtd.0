From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "marek.vasut@gmail.com"
 <marek.vasut@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "frieder.schrempf@exceet.de"
 <frieder.schrempf@exceet.de>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 3/7] mtd: spi-nor: add opcodes for octal Read/Write
 commands
Date: Mon, 10 Dec 2018 11:28:45 +0000
Message-ID: <VI1PR04MB5726B7F4D7B25843144EA04299A50@VI1PR04MB5726.eurprd04.prod.outlook.com>
References: <1543826226-30898-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1543826226-30898-4-git-send-email-yogeshnarayan.gaur@nxp.com>
 <20181210115717.01ad2e60@bbrezillon>
 <VI1PR04MB5726164D7E52B013FF2F135B99A50@VI1PR04MB5726.eurprd04.prod.outlook.com>
 <20181210122707.3416095c@bbrezillon>
In-Reply-To: <20181210122707.3416095c@bbrezillon>
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

Hi,

> -----Original Message-----
> From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> Sent: Monday, December 10, 2018 4:57 PM
> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> Cc: linux-mtd@lists.infradead.org; broonie@kernel.org;
> marek.vasut@gmail.com; vigneshr@ti.com; linux-spi@vger.kernel.org;
> devicetree@vger.kernel.org; robh@kernel.org; mark.rutland@arm.com;
> shawnguo@kernel.org; linux-arm-kernel@lists.infradead.org;
> computersforpeace@gmail.com; frieder.schrempf@exceet.de; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH v5 3/7] mtd: spi-nor: add opcodes for octal Read/Writ=
e
> commands
>=20
> On Mon, 10 Dec 2018 11:17:20 +0000
> Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
>=20
> > Hi Boris,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon [mailto:boris.brezillon@bootlin.com]
> > > Sent: Monday, December 10, 2018 4:27 PM
> > > To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
> > > Cc: linux-mtd@lists.infradead.org; broonie@kernel.org;
> > > marek.vasut@gmail.com; vigneshr@ti.com; linux-spi@vger.kernel.org;
> > > devicetree@vger.kernel.org; robh@kernel.org; mark.rutland@arm.com;
> > > shawnguo@kernel.org; linux-arm-kernel@lists.infradead.org;
> > > computersforpeace@gmail.com; frieder.schrempf@exceet.de; linux-
> > > kernel@vger.kernel.org
> > > Subject: Re: [PATCH v5 3/7] mtd: spi-nor: add opcodes for octal
> > > Read/Write commands
> > >
> > > On Mon, 3 Dec 2018 08:39:18 +0000
> > > Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> wrote:
> > >
> > > > - Add opcodes for octal I/O commands
> > > >   * Read  : 1-1-8 and 1-8-8 protocol
> > > >   * Write : 1-1-8 and 1-8-8 protocol
> > > >   * opcodes for 4-byte address mode command
> > > >
> > > > - Entry of macros in _convert_3to4_xxx function
> > > >
> > > > - Add flag specifying flash support octal read commands.
> > > >
> > > > Signed-off-by: Vignesh R <vigneshr@ti.com>
> > > > Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
> > >
> > > Looks like the SoB and Author lines do not match
> > >
> > > Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com> vs Yogesh Gaur
> > > <yogeshnarayan.gaur@nxp.com>
> > >
> > > Can you find a way to make them match?
> > I am sending the patches with my smtp server of OutlookOffice and in th=
at my
> user name is "Yogesh Narayan Gaur" and in gitconfig of my Linux machine I=
 set
> user name as "Yogesh Gaur".
> > Is it mandatory to have same Author name in SoB and Author lines, if ye=
s I
> would change the settings in gitconfig file.
>=20
> We have scripts that check that the author/committer has its SoB, dependi=
ng on
> how strict the check is, it might complaint that SoB an author/committer =
do not
> match, so yes, please change gitconfig to make them match.
>=20
Ok, sure. In all other future patches would modify my Author name.

> Thanks,
>=20
> Boris
