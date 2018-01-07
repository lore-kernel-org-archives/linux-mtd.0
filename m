Date: Sun, 7 Jan 2018 22:46:43 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Eric Miao <eric.y.miao@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will.deacon@arm.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>, Neta Zur
 Hershkovits <neta@marvell.com>, Willy Tarreau <w@1wt.eu>, Sean
 =?UTF-8?B?Tnlla2rDpnI=?= <sean.nyekjaer@prevas.dk>
Subject: Re: [PATCH v2 2/5] mtd: nand: add reworked Marvell NAND controller
 driver
Message-ID: <20180107224643.760eac74@xps13>
In-Reply-To: <20171221111428.0aa3e65e@bbrezillon>
References: <20171219132942.27433-1-miquel.raynal@free-electrons.com>
 <20171219132942.27433-3-miquel.raynal@free-electrons.com>
 <20171221111428.0aa3e65e@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Thu, 21 Dec 2017 11:14:28 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Hi Miquel,
>=20
> On Tue, 19 Dec 2017 14:29:39 +0100
> Miquel Raynal <miquel.raynal@free-electrons.com> wrote:
>=20
> > Add marvell_nand driver which aims at replacing the existing
> > pxa3xx_nand driver.
> >=20
> > The new driver intends to be easier to understand and follows the
> > brand new NAND framework rules by implementing hooks for every
> > pattern the controller might support and referencing them inside a
> > parser object that will be given to the core at each ->exec_op()
> > call.
> >=20
> > Raw accessors are implemented, useful to test/debug
> > memory/filesystem corruptions. Userspace binaries contained in the
> > mtd-utils package may now be used and their output trusted.
> >=20
> > Timings may not be kept from the bootloader anymore, the timings
> > used for instance in U-Boot were not optimal and it supposed to
> > have NAND support (and initialized) in the bootloader. =20
>=20
> Hm, AFAIR the old driver was able to dynamically adjust the timings
> when the NAND was ONFI compliant.
>=20
> >=20
> > Thanks to the improved timings, implementation of ONFI mode 5
> > support (with EDO managed by adding a delay on data sampling),
> > merging the commands together and optimizing writes in the command
> > registers, the new driver may achieve faster throughputs in both
> > directions. Measurements show an improvement of about +23% read
> > throughput and +24% write throughput. These measurements have been
> > done with an Armada-385-DB-AP (4kiB NAND pages forced in 4-bit
> > strength BCH ECC correction) using the userspace tool 'flash_speed'
> > from the MTD test suite.
> >=20
> > Besides these important topics, the new driver addresses several
> > unsolved known issues in the old driver which:
> > - did not work with ECC soft neither with ECC none ;
> > - relied on naked read/write (which is unchanged) while the NFCv1
> >   embedded in the pxa3xx platforms do not implement it, so several
> >   NAND commands did not actually ever work without any notice (like
> >   reading the ONFI PARAM_PAGE or SET/GET_FEATURES) ;
> > - wrote the OOB data correctly, but was not able to read it
> > correctly past the first OOB data chunk ;
> > - did not displayed ECC bytes ; =20
>=20
> 	    ^display
>=20
> and I'm not even sure display is the right term here. How about
> 'retrieve'.
>=20
> > - used device tree bindings that did not allow more than one NAND
> > chip, and did not allow to choose the correct chip select if not
> >   incrementing from 0. Plus, the Ready/Busy line used had to be 0.
> >=20
> > Old device tree bindings are still supported but deprecated. A more
> > hierarchical view has to be used to keep the controller and the NAND
> > chip structures clearly separated both inside the device tree and
> > also in the driver code.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>
> > Tested-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>
> > Tested-by: Willy Tarreau <w@1wt.eu>
> > ---


I made all the changes you requested, let me the time to do further
tests and I will send a v3.

Thanks,
Miqu=C3=A8l
