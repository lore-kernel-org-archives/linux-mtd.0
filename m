Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXoK0-0007yX-KJ
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2018 13:47:58 +0000
Date: Tue, 26 Jun 2018 15:47:28 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Yogesh
 Narayan Gaur <yogeshnarayan.gaur@nxp.com>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>, "richard@nod.at"
 <richard@nod.at>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "broonie@kernel.org" <broonie@kernel.org>, David Wolfe
 <david.wolfe@nxp.com>, Fabio Estevam <fabio.estevam@nxp.com>, Prabhakar
 Kushwaha <prabhakar.kushwaha@nxp.com>, Han Xu <han.xu@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/11] spi: Add a driver for the Freescale/NXP QuadSPI
 controller
Message-ID: <20180626154728.16e94b58@bbrezillon>
In-Reply-To: <CAHp75VfskABz+KrnLzDTYH=1cESimi++3HwQ2a1tiWkPTqf=HQ@mail.gmail.com>
References: <1527686082-15142-1-git-send-email-frieder.schrempf@exceet.de>
 <1527686082-15142-4-git-send-email-frieder.schrempf@exceet.de>
 <DB6PR0402MB283845A1A98672FE63C89550997B0@DB6PR0402MB2838.eurprd04.prod.outlook.com>
 <CAHp75Vesytovn1s-L0RQbEi6Tua=8qKc8a8yDkFmadgscW_UAw@mail.gmail.com>
 <4046ba78-b6c0-c09b-43e2-e3c2e550be9f@exceet.de>
 <CAHp75VfskABz+KrnLzDTYH=1cESimi++3HwQ2a1tiWkPTqf=HQ@mail.gmail.com>
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

Hi Andy,

On Tue, 26 Jun 2018 16:18:44 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

>=20
> > What is wrong? Some newlines are missing here between the MODULE_ macro=
s,
> > but in my original patch it seems correct. =20
>=20
> It should be like
>=20
> MODULE_FOO(...);
> MODULE_BAR(...);
> MODULE_BAZ(...);
>=20
> One macro =E2=80=94 one line.

It's not Frieder's fault, it's Yogesh mailer which messed-up the
formatting. Just look at the original patch and you'll see.
