Date: Thu, 20 Mar 2014 10:20:29 +0100
From: Lothar =?UTF-8?B?V2HDn21hbm4=?= <LW@KARO-electronics.de>
To: Juergen Beisert <jbe@pengutronix.de>
Subject: Re: [PATCH] mtd: gpmi: make blockmark swapping optional
Message-ID: <20140320102029.4327a6c0@ipc1.ka-ro>
In-Reply-To: <201403200933.39382.jbe@pengutronix.de>
References: <1395235406-13449-1-git-send-email-y>
 <201403200933.39382.jbe@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@arm.linux.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, y@karo-electronics.de,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Shawn Guo <shawn.guo@freescale.com>, Rob Landley <rob@landley.net>,
 Kumar Gala <galak@codeaurora.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Sascha Hauer <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Juergen Beisert wrote:
> Hi Lothar,
>=20
> On Wednesday 19 March 2014 14:23:26 y@karo-electronics.de wrote:
> > With a flash-based BBT there is no reason to move the Factory Bad
> > Block Marker from the data area buffer (to where it is mapped by the
> > GPMI NAND controller) to the OOB buffer. Thus, make this feature
> > configurable via DT. This is required for the Ka-Ro electronics
> > platforms.
> > [...]
>=20
> How do you create the BBT the very first time with valuable data when the=
 NAND=20
> already contains factory bad blocks?
>=20
With the flashtool that does the initial flash programming.


Lothar Wa=C3=9Fmann
--=20
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstra=C3=9Fe 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Gesch=C3=A4ftsf=C3=BChrer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
