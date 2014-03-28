Date: Fri, 28 Mar 2014 10:31:47 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCHv2 1/1] mtd: gpmi: make blockmark swapping optional
Message-ID: <20140328103147.3fdadfd7@ipc1.ka-ro>
In-Reply-To: <53354057.6030004@freescale.com>
References: <1395399017-19005-1-git-send-email-LW@KARO-electronics.de>
 <20140324095902.GB11377@localhost>
 <20140326095156.3e5585b8@ipc1.ka-ro>
 <5332AEE7.2040402@freescale.com>
 <20140326125502.0e8d0657@ipc1.ka-ro>
 <20140327095956.GA29623@localhost>
 <20140327132109.06258526@ipc1.ka-ro>
 <5334D9F7.2030001@freescale.com>
 <20140328091646.1ce03f90@ipc1.ka-ro>
 <53353524.9020605@freescale.com>
 <20140328090023.GB17250@pengutronix.de>
 <53354057.6030004@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawn.guo@linaro.org>,
 Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>,
 Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Huang Shijie wrote:
> =E4=BA=8E 2014=E5=B9=B403=E6=9C=8828=E6=97=A5 17:00, Sascha Hauer =E5=86=
=99=E9=81=93:
> > - disables swapping of BB marks in the FCB the ROM won't swap bytes.
> We can not disable the swapping in the FCB in the imx28.
> The DISBBM bit in the FCB does _NOT_ exit in the imx28's FCB.
>=20
The Linux kernel does not have any business with the FCB, so it is
completely irrelevant for Linux whether byte swapping can be disabled
in the FCB or not.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
