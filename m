From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH 2/4] mtd: spi-nor: add a new data structrue spi_nor{}
Date: Wed, 27 Nov 2013 11:27:09 +0100
References: <1385447575-23773-1-git-send-email-b32955@freescale.com>
 <201311271032.13259.marex@denx.de> <5295C85F.2030700@freescale.com>
In-Reply-To: <5295C85F.2030700@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Message-Id: <201311271127.09823.marex@denx.de>
Cc: "broonie@linaro.org" <broonie@linaro.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "Poddar, Sourav" <sourav.poddar@ti.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Huang Shijie,

> =E4=BA=8E 2013=E5=B9=B411=E6=9C=8827=E6=97=A5 17:32, Marek Vasut =E5=86=
=99=E9=81=93:
> > So this is your own device pointer or ... what kind of device pointer?
>=20
> the pointer from spi_device{}

OK, I am 200% positive you need to add comments into the structure about wh=
at=20
exactly does each member of it mean AND it would be nice if you could renam=
e=20
them to have less generic names (like spi_dev instead of dev).

Thanks ! :)

Best regards,
Marek Vasut
